Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E21830DC92
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 15:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80940.148510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7J2x-0003lf-1A; Wed, 03 Feb 2021 14:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80940.148510; Wed, 03 Feb 2021 14:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7J2w-0003lG-UI; Wed, 03 Feb 2021 14:22:18 +0000
Received: by outflank-mailman (input) for mailman id 80940;
 Wed, 03 Feb 2021 14:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7J2v-0003lB-Sr
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 14:22:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a171fe5c-f184-4827-a383-fa72376b7b1f;
 Wed, 03 Feb 2021 14:22:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ECE29AC6E;
 Wed,  3 Feb 2021 14:22:15 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a171fe5c-f184-4827-a383-fa72376b7b1f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612362136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mA3BQhw9Vb3J5jIjdLh1AVt9kQ9/0iuprHGUbiogyl0=;
	b=rLWE5Enr1gTUaWRJSThSSlYHaVUjmjEPr61Q3NgKyyCqq9Lo4ZpwnwIKS7PXyZMK2iDk4g
	b3CkXDJN0UksLV4QHOBxTIHwNo1nqLnYr/MNLjCiCv5ERgHm9eKPBB5BWxZOCQ4/TGRI3U
	NmwRQpREiPA7elO9vQLEpApQItF8RGY=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/string: correct memmove()'s forwarding to memcpy()
Message-ID: <a23d148a-25d0-cc5b-6050-88345188ef5a@suse.com>
Date: Wed, 3 Feb 2021 15:22:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With memcpy() expanding to the compiler builtin, we may not hand it
overlapping source and destination. We strictly mean to forward to our
own implementation (a few lines up in the same source file).

Fixes: 78825e1c60fa ("x86/string: Clean up x86/string.h")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
An alternative would be to "#undef memcpy" near the top of the file. But
I think the way it's done now is more explicit to the reader. An #undef
would be the only way if the macro was an object-like one.

At least with gcc10 this does alter generated code: The builtin gets
expanded into a tail call, while after this change our memcpy() gets
inlined into memmove(). This would change again once we separate the 3
functions here into their own CUs for placing them in an archive.

--- a/xen/arch/x86/string.c
+++ b/xen/arch/x86/string.c
@@ -43,7 +43,7 @@ void *(memmove)(void *dest, const void *
         return dest;
 
     if ( dest < src )
-        return memcpy(dest, src, n);
+        return (memcpy)(dest, src, n);
 
     asm volatile (
         "   std         ; "

