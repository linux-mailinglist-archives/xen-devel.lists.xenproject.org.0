Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFyHF3nru2liqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF72CB24E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257014.1551483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRr-0008H8-19; Thu, 19 Mar 2026 12:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257014.1551483; Thu, 19 Mar 2026 12:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRq-0008CW-Rx; Thu, 19 Mar 2026 12:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1257014;
 Thu, 19 Mar 2026 12:25:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv1Q=BT=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w3CRp-0007qy-PN
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:25:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6c87e61-238e-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 13:25:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso2454285e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 05:25:55 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-18-152.as13285.net.
 [92.22.18.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c350aesm60831395e9.4.2026.03.19.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 05:25:53 -0700 (PDT)
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
X-Inumbo-ID: c6c87e61-238e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773923155; x=1774527955; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9p44d1QjTPa2JEIp8Q6GJVyP9/yGjHqxAPwdkkT/xok=;
        b=ButVIA7qQACsmmtZXOyCZTkpG/9yM4/ZMqjoHXCQWE33BBw1iWt5OBz5FRClTegjxH
         RWPbivp78mMWuJKo9eDPI+wmX32lGQUt5Mw7lD48TIltIGrdVJW7x2pIyQ2+NRJzDo+f
         SRjNxCUTheLPUoECcYuGg+WQDiv2sfM9n7cZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923155; x=1774527955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9p44d1QjTPa2JEIp8Q6GJVyP9/yGjHqxAPwdkkT/xok=;
        b=PF4D21Z3R8vZKr0gFuIMLkVkUnblW4X8IILk4SbAU8ABBnp2zYbK19Y4RytLElYHLV
         j7y07Sz9RUONCtYCv5M6dl2E+uSo+ta+P889UHcVM0fGfsvpz50CWy0iDl3ESVWVQc74
         v3JCtQ09uD4XLtdJqgXNHljoFm4pvg3OpTIsRW6KGgqSc3jWkSxN1+rVr95NDz/IZq1g
         M6IC0A2zo/y0gxHNzqLLP/y5j/eEd2lGmJLyQswG18nnlgY3Zm5OoVy2XTsqq+cU+ZGU
         PNPSbeMP+uPvo8b5y9nx8dEM5aRganUdOTgs9awgla2IfI9mjy1Lh7yBteFdavSlhJay
         0R+w==
X-Gm-Message-State: AOJu0YyA9heCCvK304QkCj+ct/2aOkcwIU1hpquZaOjQjTzZExE9EHRT
	zh6Rw+ndAfXG0x4l823/PdwEwWutQwlx+wlOI8ipD0fSMw1GckzdVlIsBqkkZFGA+GV1mQgLmFh
	2a9fj
X-Gm-Gg: ATEYQzxhe2wLM0XAYmlIjjEojwduunRxkiVqrBLSf7bD2KGvLu/YUE87WAnuRjnca6h
	9+k8GU02phEZHAvgiYkcQ42304/mr/n/tb1Bsbi1uVbGyW7VnIskTGhnLign0Ov47l/FgnRKizc
	tiJFKiSxgw73Ad/SmuWGoBbmwhIAu6nXJa1pDyiE5Ppi6I4iN3JOgV49PNTZEh1qrRdeqfuRCiu
	NoAoZPta+0p9fv8QTKz/dMF5Qo2Aqlj+BFnvpY4EsJ9JVWxGsRqSlfTsJWtYerE+F9eytUWJ6f5
	d+mUC3wCFpWB1kpJPvYSGs0/eyHz5+0HBe42Q7iQ9b8gTyP63tgUyCkkbIyAxY89AhSCn8JMJ+a
	zAPsLfyf8cKTcbxkpAgLmXBcoV9RpuyvIVffREsbcMi5UNUzCs3TP0oLQWxfVJa12ktsC1rKc5q
	gGdGiQMJrLFqKHfac6hjzjlQmBfvcBiUteCNIoTAWc6d905P9Hvslt/Oe5qvbADqY0rWkdtZI=
X-Received: by 2002:a05:600c:4507:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-486fb694a11mr28642655e9.19.1773923154081;
        Thu, 19 Mar 2026 05:25:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/4] x86/kexec: Disable FRED earlier in kexec_reloc()
Date: Thu, 19 Mar 2026 12:25:49 +0000
Message-Id: <20260319122549.922724-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260319122549.922724-1-andrew.cooper3@citrix.com>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
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
X-Rspamd-Queue-Id: 56AF72CB24E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With FRED just as with IDT, it's unsafe to run the exception handlers after
switching stack.

To remove this unsafe window, %cr4 needs clearing earlier.  In turn, we may
need to switch to PCID 0 earlier too in order to be able to clear CR4.PCIDE.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

The pagetable switch cannot easily be moved to be earlier, as that leaves a
period of time where FRED is enabled but all stack pointers point to
non-existent mappings.
---
 xen/arch/x86/x86_64/kexec_reloc.S | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index 7a6dd2cbe736..81da81a827de 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -54,6 +54,21 @@ FUNC(kexec_reloc, PAGE_SIZE)
         lidt    (%rsp)
         add     $10, %rsp
 
+        /* Move to PCID 0 if necessary, as a prerequisite to clearing CR4.PCIDE */
+        mov     %cr3, %rax
+        test    $0xfff, %eax
+        jz      1f
+        and     $~0xfff, %rax
+        mov     %rax, %cr3
+1:
+
+        /*
+         * Set CR4 to PAE only.  This may disable FRED, which must happen
+         * before switching off Xen's stack.
+         */
+        mov     $X86_CR4_PAE, %eax
+        mov     %rax, %cr4
+
         /*
          * Move to the identity mapped stack.
          *
@@ -86,13 +101,6 @@ FUNC(kexec_reloc, PAGE_SIZE)
         orl     $(X86_CR0_PG | X86_CR0_PE), %eax
         movq    %rax, %cr0
 
-        /*
-         * Set cr4 to a known state:
-         *  - physical address extension enabled
-         */
-        movl    $X86_CR4_PAE, %eax
-        movq    %rax, %cr4
-
         movq    %rdx, %rdi
         call    relocate_pages
 
-- 
2.39.5


