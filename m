Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CA35832A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107260.205053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTeW-0004r8-Eg; Thu, 08 Apr 2021 12:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107260.205053; Thu, 08 Apr 2021 12:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTeW-0004qh-B0; Thu, 08 Apr 2021 12:20:52 +0000
Received: by outflank-mailman (input) for mailman id 107260;
 Thu, 08 Apr 2021 12:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTeU-0004qS-U4
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:20:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id feb7a45f-91cb-4bde-abe5-e9a11b935368;
 Thu, 08 Apr 2021 12:20:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FB44B090;
 Thu,  8 Apr 2021 12:20:49 +0000 (UTC)
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
X-Inumbo-ID: feb7a45f-91cb-4bde-abe5-e9a11b935368
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rlkZ2gHfa7wMnDFvJ4VBlthgmsqLlVSVbOIY+whHTZo=;
	b=BhdG0F4k+a1SrcQc+iLOYzWIB53zUhsgnWZVWNX85ywHaGPxfHby4HFyTmGSZpBKQ1XyqN
	emDXLzzH6vmysdgphmEjjAw5j9I0pNzB9bvXbCiZxjsvjFHXxbu2SPdJNZ0Mz/XkqmzTVP
	UEJA/T9/sDpwxrb0Ob/A1aB0oR9t4n4=
Subject: [PATCH 07/11] EFI/runtime: avoid effectively open-coding
 xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <154a423e-ede1-b799-c616-a0022b815606@suse.com>
Date: Thu, 8 Apr 2021 14:20:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xmalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -486,7 +486,7 @@ int efi_runtime_call(struct xenpf_efi_ru
         size = op->u.get_variable.size;
         if ( size )
         {
-            data = xmalloc_bytes(size);
+            data = xmalloc_array(unsigned char, size);
             if ( !data )
             {
                 xfree(name);
@@ -536,7 +536,7 @@ int efi_runtime_call(struct xenpf_efi_ru
             return -EIO;
         }
 
-        data = xmalloc_bytes(op->u.set_variable.size);
+        data = xmalloc_array(unsigned char, op->u.set_variable.size);
         if ( !data )
             rc = -ENOMEM;
         else if ( copy_from_guest(data, op->u.set_variable.data,
@@ -571,7 +571,7 @@ int efi_runtime_call(struct xenpf_efi_ru
             return -EINVAL;
 
         size = op->u.get_next_variable_name.size;
-        name.raw = xzalloc_bytes(size);
+        name.raw = xzalloc_array(unsigned char, size);
         if ( !name.raw )
             return -ENOMEM;
         if ( copy_from_guest(name.raw, op->u.get_next_variable_name.name,


