Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJoFLXfru2liqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926B2CB232
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257012.1551472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRq-00086A-Es; Thu, 19 Mar 2026 12:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257012.1551472; Thu, 19 Mar 2026 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRq-00084B-AV; Thu, 19 Mar 2026 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1257012;
 Thu, 19 Mar 2026 12:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv1Q=BT=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w3CRo-0007dl-I6
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:25:56 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c673dd97-238e-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 13:25:54 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso6482595e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 05:25:54 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c350aesm60831395e9.4.2026.03.19.05.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 05:25:52 -0700 (PDT)
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
X-Inumbo-ID: c673dd97-238e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773923154; x=1774527954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNvCSrOBffuTtzSMMrot8orJxzRk8BMjuPIbTAHvYz0=;
        b=RNlQOr+bemU/6niK4DzhTF2Od9gVL/MBhqUOzn9suiBZguQt2vtiVoFwiKR4/2xtbC
         A9VpZ4XFwBsgFWDM3VVCqztOJMs7T3LjMinREbNG8jCyanwu4sMEUa4/4kXa2BpTjIsM
         73Zyb3VBSt+4q0DCyyReAo7IUDb6JS+rOnHfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923154; x=1774527954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNvCSrOBffuTtzSMMrot8orJxzRk8BMjuPIbTAHvYz0=;
        b=ZYcwk3kieH2lg2UFwiMEaZRVY30TO2m3TbPIgmW/jDik0g3PtyFaDC7sgVMbR59tI4
         yK8bRCNYG678g2ieGeqy9Wk8ih9ClxpoyaJdwD60kTvWseaireafMaRg9vaoivXOtNox
         TbV/uEUF9YiOEkRqNv9iYjbQz+Jef/UT5+fN9nOdKjX7YY+ZYXk5Ko4hYZwOiVW9RirC
         vThzSGK1Gaxf+7HXFsVkc9pMI8+Z7ckOswtf6nIRklJeZH8l6zYfr4/+wq2fO9TpBJ42
         dQDKr7D7zEHHKk/c3m6lv58QhXnM9fW9+CUwDLDRO8aQmC8RPUKY2E5vSg47AP7wbkL1
         oX9w==
X-Gm-Message-State: AOJu0YxNyqpbRK5ajzhPjDcBCqlEcoM1ff+muyFXL+i1sZ4qw8/bVd9g
	gs1jO5JT6jA262MKcwAEK25kzXJd4DpoAzDyuSsxDoMzjZswIDAYlPM7FQ52ZJdx06J2yrGCiaI
	3Ey7u
X-Gm-Gg: ATEYQzwGb2JlxZUqeKPYarVO3QR7lKAVuHFX+17f8Rc040d/gXrHR4sG9LCAJ629cI+
	ht1VEL+XwSTSFmr4wOXUTTqAPIxzaJJChmemI4DP+IcqHeizxRYa24LPotjwn7ksD+4tilbPkKh
	AK2jnMJhQq7TTlP+nBTxNkTWRj0F0lTzEzPnnJtx5TLNA3Ewd7yLk2OY42YQBPXJzdZfZV0fDp5
	GlsBCfJ2/tl3zUonNe0eC65wGwPmqYrCbIC0FBjFX0C3iEd0CvtfbQ9ZEaW1pz4OkgcJNF2f00y
	N/zeXvssYt517ZI2MFryK/Bd4fOJtTY4H/aAqBmSBmYo4Rh1qjaSvrm2vf+WzRmVPtjLlJQJD5y
	RsU+jW51SGAZ3FWZnQVswz4eJyRP8e5BZ0MQ3RdboFytXzH51LvcksPsTgh6EDb2UvaLAGKVMrx
	C7ujO41TgLHLAaEk74xg/X6IRnyf5/fB0atZ/tvsiX8fRqEzlJ/j3Tjdg8l+IoPbtOoIj019A=
X-Received: by 2002:a05:600c:4ed4:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-486f4444050mr121170235e9.22.1773923153070;
        Thu, 19 Mar 2026 05:25:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/4] x86/kexec: Fix and expands comments for kexec_reloc()
Date: Thu, 19 Mar 2026 12:25:47 +0000
Message-Id: <20260319122549.922724-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260319122549.922724-1-andrew.cooper3@citrix.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5926B2CB232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The order of shutdown is delicate.  Explain things a little better.

Fix two comments about leaving Long Mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index b52d31a654e0..d0951ea1e1c4 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -27,6 +27,14 @@
         .section .text.kexec, "ax", @progbits
         .code64
 
+        /*
+         * kexec_reloc() is entered in it's natural position within Xen.
+         *
+         * A copy of .text.kexec is identity mapped at %rdi within the
+         * pagetables in %rsi.  Xen's .text is mapped into %rsi at it's high
+         * alias allowing to pivot, but most other things including the stacks
+         * are not mapped.
+         */
 FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdi - code page maddr */
         /* %rsi - page table maddr */
@@ -36,10 +44,17 @@ FUNC(kexec_reloc, PAGE_SIZE)
 
         movq    %rcx, %rbp
 
-        /* Setup stack. */
+        /*
+         * Move to the identity mapped stack.
+         *
+         * Note this mapping doesn't exist until the pagetable switch.
+         */
         leaq    (.Lreloc_stack_base - kexec_reloc)(%rdi), %rsp
 
-        /* Load reloc page table. */
+        /*
+         * Move to the relocation pagetables.  Xen's .text is mapped allowing
+         * the pivot, but very little else is.
+         */
         movq    %rsi, %cr3
 
         /* Jump to identity mapped code. */
@@ -153,12 +168,12 @@ FUNC_LOCAL(compatibility_mode)
         movl    %eax, %gs
         movl    %eax, %ss
 
-        /* Disable paging and therefore leave 64 bit mode. */
+        /* Disable paging and therefore leave long mode. */
         movl    %cr0, %eax
         andl    $~X86_CR0_PG, %eax
         movl    %eax, %cr0
 
-        /* Disable long mode */
+        /* Clear EFER.LME */
         movl    $MSR_EFER, %ecx
         rdmsr
         andl    $~EFER_LME, %eax
-- 
2.39.5


