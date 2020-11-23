Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE542C0A89
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34347.65338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khC9x-00026G-7Q; Mon, 23 Nov 2020 13:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34347.65338; Mon, 23 Nov 2020 13:45:37 +0000
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
	id 1khC9x-00025q-4C; Mon, 23 Nov 2020 13:45:37 +0000
Received: by outflank-mailman (input) for mailman id 34347;
 Mon, 23 Nov 2020 13:45:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khC9v-00025f-DZ
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:45:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88cc19ee-b5b7-4f6f-aeae-258e2af5d9ea;
 Mon, 23 Nov 2020 13:45:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6960ABCE;
 Mon, 23 Nov 2020 13:45:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khC9v-00025f-DZ
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:45:35 +0000
X-Inumbo-ID: 88cc19ee-b5b7-4f6f-aeae-258e2af5d9ea
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 88cc19ee-b5b7-4f6f-aeae-258e2af5d9ea;
	Mon, 23 Nov 2020 13:45:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606139134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGukHYFeZjwNwwKmI/A8FWjkYK+Lh6/hnHJ4QJdVKlA=;
	b=UGPdq806MwOeFU4A8nfqF6OoZBySvnaH8YlLUj+QFDYWEe9Wel1Pa8Y7bXS6CPDhIHMVeb
	h4k4ylbhbK8sQoBlB9ap3KbNSAl3+1ZzfMABH4sE5CmGKNe294qz5lf89KuKDjBAZdJtKX
	2P4YzKM2NS8jBejprz54cAZs1cqzczA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6960ABCE;
	Mon, 23 Nov 2020 13:45:33 +0000 (UTC)
Subject: [PATCH v3 5/7] x86: limit amount of INT3 in IND_THUNK_*
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
Message-ID: <dbbc4ec4-799c-47c8-2cf9-4d7188e254e1@suse.com>
Date: Mon, 23 Nov 2020 14:45:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8e7d1472-dd37-8ed3-ec2f-ce954ea61dfd@suse.com>
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
 
+/* Don't transform the "ret" further down. */
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


