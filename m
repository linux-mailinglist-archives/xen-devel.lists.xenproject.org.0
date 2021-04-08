Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F4E35831D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107241.205005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTcG-0003gQ-0o; Thu, 08 Apr 2021 12:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107241.205005; Thu, 08 Apr 2021 12:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTcF-0003g1-Tc; Thu, 08 Apr 2021 12:18:31 +0000
Received: by outflank-mailman (input) for mailman id 107241;
 Thu, 08 Apr 2021 12:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTcE-0003fC-Jo
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:18:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 671d1e7e-cda6-48b3-b1d9-f225f71af49d;
 Thu, 08 Apr 2021 12:18:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30EAFAFCC;
 Thu,  8 Apr 2021 12:18:26 +0000 (UTC)
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
X-Inumbo-ID: 671d1e7e-cda6-48b3-b1d9-f225f71af49d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkX7CzUIHm8zyEM9IisY4rl2NOQycbZjijQaZgGhueY=;
	b=A3qqKzk4yj5DecWdzpWMWiGjXBkAHG2eQY9GoPQ8YZEw6TRe+qSR08w6Ug3tvkEQhsbE4x
	EzYLTROyPEv05yU8bKXTtkYiNrgU6+O1Ewny+iB4p8Xk8T9DHCE/WRpowrMHklYsWYGhei
	+tCHFYTufSnVc/TH+AzQnazB0tjlNYY=
Subject: [PATCH 04/11] x86/HVM: avoid effectively open-coding xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <f455e5ba-e786-e8d5-4a1c-b42552e17377@suse.com>
Date: Thu, 8 Apr 2021 14:18:25 +0200
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

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1924,7 +1924,7 @@ static int hvmemul_rep_movs(
         dgpa -= bytes - bytes_per_rep;
 
     /* Allocate temporary buffer. Fall back to slow emulation if this fails. */
-    buf = xmalloc_bytes(bytes);
+    buf = xmalloc_array(char, bytes);
     if ( buf == NULL )
         return X86EMUL_UNHANDLEABLE;
 
@@ -2037,7 +2037,7 @@ static int hvmemul_rep_stos(
         for ( ; ; )
         {
             bytes = *reps * bytes_per_rep;
-            buf = xmalloc_bytes(bytes);
+            buf = xmalloc_array(char, bytes);
             if ( buf || *reps <= 1 )
                 break;
             *reps >>= 1;


