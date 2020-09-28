Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD727ADD4
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:32:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMsKS-00085k-Dz; Mon, 28 Sep 2020 12:32:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMsKR-00085c-06
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:32:27 +0000
X-Inumbo-ID: 29607552-78e9-4766-9f0c-d2c302ea9272
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29607552-78e9-4766-9f0c-d2c302ea9272;
 Mon, 28 Sep 2020 12:32:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601296345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slZn16BrvmCbDL4PIuDtx+18wXdgk0cj5oqIr4c2w28=;
 b=qKNYXXqA/iDN5mXp4BVlkibKHqV5jPV7xouIy99/I4GR37FxO4VpIluSIjCNGP74HCNPuX
 KzIKFrQVOaC1McbkO4ByKC3rJVMppIe+ofvYq8I/EwQbNhE9qFmyq5KTS9spGtenquY5aH
 vLFGUliJ2BZ5DuDVG0gOuR8Go8rUQcI=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01BD9B042;
 Mon, 28 Sep 2020 12:32:25 +0000 (UTC)
Subject: [PATCH v2 6/6] x86: limit amount of INT3 in IND_THUNK_*
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Message-ID: <4d66eb4d-4044-8b48-d7cc-354a236e6b26@suse.com>
Date: Mon, 28 Sep 2020 14:32:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <62ffb078-d763-f845-c4b9-eeacb3358d02@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's no point having every replacement variant to also specify the
INT3 - just have it once in the base macro. When patching, NOPs will get
inserted, which are fine to speculate through (until reaching the INT3).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I also wonder whether the LFENCE in IND_THUNK_RETPOLINE couldn't be
replaced by INT3 as well. Of course the effect will be marginal, as the
size of the thunk will still be 16 bytes when including tail padding
resulting from alignment.
---
v2: New.

--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -11,6 +11,8 @@
 
 #include <asm/asm_defns.h>
 
+.purgem ret
+
 .macro IND_THUNK_RETPOLINE reg:req
         call 2f
 1:
@@ -24,12 +26,10 @@
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
@@ -44,6 +44,8 @@ ENTRY(__x86_indirect_thunk_\reg)
         __stringify(IND_THUNK_LFENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
         __stringify(IND_THUNK_JMP \reg),    X86_FEATURE_IND_THUNK_JMP
 
+        int3 /* Halt straight-line speculation */
+
         .size __x86_indirect_thunk_\reg, . - __x86_indirect_thunk_\reg
         .type __x86_indirect_thunk_\reg, @function
 .endm


