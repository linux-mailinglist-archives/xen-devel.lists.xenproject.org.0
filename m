Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNtAI3jru2liqQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847512CB247
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 13:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257011.1551463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRp-0007u4-6X; Thu, 19 Mar 2026 12:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257011.1551463; Thu, 19 Mar 2026 12:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3CRp-0007qz-3W; Thu, 19 Mar 2026 12:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1257011;
 Thu, 19 Mar 2026 12:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yv1Q=BT=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1w3CRn-0007dl-I3
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 12:25:55 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65eee1b-238e-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 13:25:54 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-486fd5360d4so2517205e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 05:25:54 -0700 (PDT)
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
X-Inumbo-ID: c65eee1b-238e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1773923154; x=1774527954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfzaREpgue5aOwMwONNRYs0JWFfpCu2AsihViVXhTqA=;
        b=jQulXTJyAiUaesbJ/uWRJCcVcZYa0XFWr2GPcdU795QS1uWDctqVWOANEC9FppQubO
         c95d4KXGMqEGbBy8FScP30iD/eo0Lf9iJnWICgJUpkzJxCpcuT1xKcNgBfKjEhczmCv3
         MbwqenpmksJmr736mcQ65dt1UCuPv9/vD7LWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773923154; x=1774527954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfzaREpgue5aOwMwONNRYs0JWFfpCu2AsihViVXhTqA=;
        b=CVQ5iQ6mX3pWXjT7j0lGE8EKwVGN9evUQYt+QHHwF8B4uRJQXp7Gkvu/HwZqmmBegU
         13GpALh5ISMg+U2i9PQuuwtANVrhF66kuRvRWmR02Bmdb6uDSJLPvYix1OLa+F/Wd+p9
         CqTXaeDbsirBrMicwAklwPB9ShzcsGSVWEn6ytrPsgUZdxI54RzsA0xRxasQqePOnmJ+
         QECoRGtEF+4GSAY1Is0nxtegWMN3MirVhTGsiLep4IdxCXqv2sfYKoRG5lBE8YeSpXCi
         lpKvulOxlAJvQFiSUGUvMXeDyADr78yvb6c5c9WnoYWTKRQXlb4CMt5r4H9S3wH2Nz6f
         7e1w==
X-Gm-Message-State: AOJu0YxdGigkZCYa9lb1a+3z4Ldq+mNQ9rYauoiVtyvIvsYDWG+p1fOP
	9GojqEUe+2gctSVhqIum2kQqpiABHEQI/tcF4Qj8DvxBSI7gOqLoiZ2ljL+9IaFppXFoqYV2zY6
	ajwse
X-Gm-Gg: ATEYQzxOoZZmPz7Dq7nnY2zQk/hPTNsybZlQ3PXJ45NQFisVaeUiOBVUxYDsKcGVptM
	55jhlyiAAUJw5Jqw3uFvK7DgRDb1PcZsLeNOm+NyrbfBLnAT53vjlX+EpVXq3mSzG6UNKp/enSp
	2Os960FhCqZ+77J20OAbQQPOcOXIA8P/A1Dstd2oLExem1S+L+y62MxlYh9OZlMsM2v/d1ux2pA
	EO4Kpul0kN3o9EXi6aZAhjIatpfRLSmUFxo8n4ynLzBQ5MMmJkFs3QnizTVKrP9O8L5NtMmwus0
	B5rOMIHHrqfZR0s4araOYeSOYL9L/lTQHvBWbbrm+oM59l5GV7yA5RSo4Cw2Eb6F42UhGSxe6RS
	9neXWBVB/nxeD7CDSfNdU9Py1l27OT15w9yDYmFxslkyzKfvKDl0o1T/nXNYekSHsC+UTBwbB1P
	GzQpWgs4l8KyKOi1pW8+hf0NfuHrgdDU8Jm0eJj0NTbWOLOI0vxXsx0WCL9tlcUQKOqkIQmxw=
X-Received: by 2002:a05:600c:8218:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-486f4475336mr131451655e9.16.1773923153601;
        Thu, 19 Mar 2026 05:25:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/4] x86/kexec: Invalidate the IDT earlier in kexec_reloc()
Date: Thu, 19 Mar 2026 12:25:48 +0000
Message-Id: <20260319122549.922724-4-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 847512CB247
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

After switching stack, it is not safe to run any exception handlers, because
attempts to access the cpu_info block are out-of-bounds and will generate wild
accesses.

Invalidating the IDT in the common path means there's no need to do so again
in the 32bit path, so drop compat_mode_idt entirely.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/kexec_reloc.S | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index d0951ea1e1c4..7a6dd2cbe736 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -44,6 +44,16 @@ FUNC(kexec_reloc, PAGE_SIZE)
 
         movq    %rcx, %rbp
 
+        /*
+         * Invalidate the IDT.  After switching off Xen's stacks, the
+         * exception handlers are unsafe to use, because there's no way to
+         * perform arithmetic on the stack pointer to find the cpu_info block.
+         */
+        push    $0
+        pushw   $0
+        lidt    (%rsp)
+        add     $10, %rsp
+
         /*
          * Move to the identity mapped stack.
          *
@@ -94,8 +104,6 @@ FUNC(kexec_reloc, PAGE_SIZE)
         jmp     *%rbp
 
 .L_call_32_bit:
-        /* Setup IDT. */
-        lidt    compat_mode_idt(%rip)
 
         /* Load compat GDT. */
         leaq    compat_mode_gdt(%rip), %rax
@@ -202,11 +210,6 @@ DATA_LOCAL(compat_mode_gdt, 8)
 .Lcompat_mode_gdt_end:
 END(compat_mode_gdt)
 
-DATA_LOCAL(compat_mode_idt)
-        .word 0                      /* limit */
-        .long 0                      /* base */
-END(compat_mode_idt)
-
         /*
          * 16 words of stack are more than enough.
          */
-- 
2.39.5


