Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF5296B51
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 10:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10782.28776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsap-0006f4-Rk; Fri, 23 Oct 2020 08:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10782.28776; Fri, 23 Oct 2020 08:38:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVsap-0006ee-NI; Fri, 23 Oct 2020 08:38:35 +0000
Received: by outflank-mailman (input) for mailman id 10782;
 Fri, 23 Oct 2020 08:38:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVsao-0006eS-0U
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:38:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0b6461d-c37d-4b85-8b16-55e581202984;
 Fri, 23 Oct 2020 08:38:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 641DDABF4;
 Fri, 23 Oct 2020 08:38:32 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVsao-0006eS-0U
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 08:38:34 +0000
X-Inumbo-ID: a0b6461d-c37d-4b85-8b16-55e581202984
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a0b6461d-c37d-4b85-8b16-55e581202984;
	Fri, 23 Oct 2020 08:38:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603442312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic529odUAZBshqLAt5wPXzrnZzZH82DsTSQiP600Yn0=;
	b=bxP8bIJU47nYZg50sLKyag7ATL/GZjft5keT1ynmaRds0BmNn5YJ6j7cAHnJ3FqDU//c/n
	tWV2KdZ+dPycpJZUpJ60VJ8VB0fcNetwIrzB67UdBqiDEU+2Hxa8m1W0JYqY2k222gyWQW
	twYDRzUzPmraEf5J4sjRDVSF0Bb3XtI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 641DDABF4;
	Fri, 23 Oct 2020 08:38:32 +0000 (UTC)
Subject: [PATCH v3 6/7] x86: limit amount of INT3 in IND_THUNK_*
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Message-ID: <738249d7-521c-2ea3-332c-f2298b0b25a2@suse.com>
Date: Fri, 23 Oct 2020 10:38:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <7065e2dc-f846-be79-1081-682c2295358c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

There's no point having every replacement variant to also specify the
INT3 - just have it once in the base macro. When patching, NOPs will get
inserted, which are fine to speculate through (until reaching the INT3).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
I also wonder whether the LFENCE in IND_THUNK_RETPOLINE couldn't be
replaced by INT3 as well. Of course the effect will be marginal, as the
size of the thunk will still be 16 bytes when including tail padding
resulting from alignment.
---
v3: Add comment.
v2: New.

--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -11,6 +11,9 @@
 
 #include <asm/asm_defns.h>
 
+/* Don't tranform the "ret" further down. */
+.purgem ret
+
 .macro IND_THUNK_RETPOLINE reg:req
         call 2f
 1:
@@ -24,12 +27,10 @@
 .macro IND_THUNK_LFENCE reg:req
         lfence
         jmp *%\reg
-        int3 /* Halt straight-line speculation */
 .endm
 
 .macro IND_THUNK_JMP reg:req
         jmp *%\reg
-        int3 /* Halt straight-line speculation */
 .endm
 
 /*
@@ -44,6 +45,8 @@ ENTRY(__x86_indirect_thunk_\reg)
         __stringify(IND_THUNK_LFENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
         __stringify(IND_THUNK_JMP \reg),    X86_FEATURE_IND_THUNK_JMP
 
+        int3 /* Halt straight-line speculation */
+
         .size __x86_indirect_thunk_\reg, . - __x86_indirect_thunk_\reg
         .type __x86_indirect_thunk_\reg, @function
 .endm


