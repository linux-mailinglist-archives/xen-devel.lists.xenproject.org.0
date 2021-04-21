Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9BA366E93
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114788.218813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEHN-0007yw-Ip; Wed, 21 Apr 2021 14:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114788.218813; Wed, 21 Apr 2021 14:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEHN-0007yU-FD; Wed, 21 Apr 2021 14:56:37 +0000
Received: by outflank-mailman (input) for mailman id 114788;
 Wed, 21 Apr 2021 14:56:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEHL-0007yG-92
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:56:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eaf0465f-6f39-4fa3-85b3-2b310311ebfc;
 Wed, 21 Apr 2021 14:56:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 995EBAD8A;
 Wed, 21 Apr 2021 14:56:33 +0000 (UTC)
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
X-Inumbo-ID: eaf0465f-6f39-4fa3-85b3-2b310311ebfc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619016993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0hiOnsYBKJJyY/OKqVdi3PZ5qXRAtnLxQ2fMzsttxVs=;
	b=YkEJ7t+xIMGDyZM7Qp7QFZv3vodtNbLlNSZYSXvVpEYHO46U2S3Z6z4eDDf3OAjDnTbFV2
	F6aQxPtgPTvLPKJ6d2rBJhCT2TrgEws68wp5UerVuPqURgfDgiG3IW6+PXdn1y/12MlBkZ
	KYSrxY/mV1tKcV0Bj22ueyqCJ8IN3vA=
Subject: [PATCH v2 2/8] x86/HVM: avoid effectively open-coding xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Message-ID: <1c3d573d-051f-3d18-cd63-6ccad5911786@suse.com>
Date: Wed, 21 Apr 2021 16:56:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xmalloc_bytes() forces
SMP_CACHE_BYTES alignment. But if code really cared about such higher
than default alignment, it should request so explicitly rather than
using a type-unsafe interface. And if e.g. cache line sharing was a
concern, the allocator itself should arrange to avoid such.

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


