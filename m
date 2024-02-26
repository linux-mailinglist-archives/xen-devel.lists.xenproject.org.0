Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DAC8675B4
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685526.1066391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVf-0005Vn-RW; Mon, 26 Feb 2024 12:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685526.1066391; Mon, 26 Feb 2024 12:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaVf-0005Ro-NJ; Mon, 26 Feb 2024 12:55:07 +0000
Received: by outflank-mailman (input) for mailman id 685526;
 Mon, 26 Feb 2024 12:55:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdVt=KD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1reaVe-0004hn-2h
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:55:06 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429d66e0-d4a6-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 13:55:04 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so585120466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:55:04 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a42e4b5ab00sm2379645ejc.41.2024.02.26.04.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 04:55:03 -0800 (PST)
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
X-Inumbo-ID: 429d66e0-d4a6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708952104; x=1709556904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUPkBSwvovweP2Vn5x5Slws9PAyzIz15Jh15k5P3vWY=;
        b=DfOoHuQR819ayTj+9RmgidFAecxkIKZqWBoD+g0No+0ZClGRsD/OkC7RDjf0bg4Imo
         cqx2WlKan6Op6JYOmuaUhp8nryRlGkdpqcPOl5COUX39U1FHCbJ3ZdJacfkxgDkwNvC8
         qMvphZGBcYp89r3ebuPjqz2CyyLzPvmvgS3fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952104; x=1709556904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cUPkBSwvovweP2Vn5x5Slws9PAyzIz15Jh15k5P3vWY=;
        b=iWuee0cxc7Sy0CluBeqV2wOCIFscROkh/oOkDHEkkmZaUQ/6SdlOE4Mh10UysvghJK
         NRHDYnXFHLoHY8XQOiMuWrirVQbE3E3hrRmf+pHNcLQKhn3b2GkX/2rFcwj4BF/VLqOd
         JOOTAaJKGAa+6l27zi/rS4xKpB3CakGxm2K6TsrMbySwQPYLSIjrp7s2tgaz7lhmZ43e
         ICKbNijrUz5Bc/Qu23A7fpgrtELkBa+/rcgicKuQy6EDRmBWWmauFXQOHweE2n3tTpMR
         VyoaIKGJ7uwOzZxxu6OG4J+4CYxoRRDhG5fBukzIj9sPWbwDcHYMCP8EWycMt/Ec0OsA
         N5Mw==
X-Gm-Message-State: AOJu0YzThXl2Tzk4UCuKUBBSMDo4LtOfusLrBn4BW50rbbnKGXq/cjs8
	/he2/JrW5H25DGMqOtT9gCtY/IFL9uo6ZVXZP5TvN7m5il8ZOlDbRT4MaGNxVTNMvk9ibuiZChD
	r
X-Google-Smtp-Source: AGHT+IEKNzT7MZ4rDTxGGiXsJK7wd2sxKAEBDCZBcMxCYN7prH6PCeoNPa15iBXbH092aJEeovGm2g==
X-Received: by 2002:a17:906:1159:b0:a3f:3d0d:30cc with SMTP id i25-20020a170906115900b00a3f3d0d30ccmr5855933eja.1.1708952103876;
        Mon, 26 Feb 2024 04:55:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86/entry: Simplify expressions in compat_restore_all_guest()
Date: Mon, 26 Feb 2024 12:55:00 +0000
Message-Id: <20240226125501.1233599-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
References: <20240226125501.1233599-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

compat_restore_all_guest() already has SPEC_CTRL_EXIT_TO_PV with a documented
requirement for %rsp to be both regs and cpuinfo.

Use the now-normal annotations and simplify the expressions which happen to be
a subtraction of 0.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/compat/entry.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 93fbbeb4ae18..727ab65290de 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -117,19 +117,19 @@ compat_process_trap:
         jmp   compat_test_all_events
 END(compat_test_all_events)
 
-/* %rbx: struct vcpu, interrupts disabled */
+/* %rbx: struct vcpu, interrupts disabled, %rsp=regs/cpuinfo */
 FUNC(compat_restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
 
-.macro alt_cr4_pv32
+.macro alt_cr4_pv32 /* %rsp=regs/cpuinfo */
         testb $3,UREGS_cs(%rsp)
         jpe   2f
-        mov   CPUINFO_cr4-CPUINFO_guest_cpu_user_regs(%rsp), %rax
+        mov   CPUINFO_cr4(%rsp), %rax
         and   $~XEN_CR4_PV32_BITS, %rax
 1:
-        mov   %rax, CPUINFO_cr4-CPUINFO_guest_cpu_user_regs(%rsp)
+        mov   %rax, CPUINFO_cr4(%rsp)
         mov   %rax, %cr4
         /*
          * An NMI or MCE may have occurred between the previous two
@@ -141,7 +141,7 @@ FUNC(compat_restore_all_guest)
          * loop to cause a live lock: If NMIs/MCEs occurred at that
          * high a rate, we'd be live locked anyway.
          */
-        cmp   %rax, CPUINFO_cr4-CPUINFO_guest_cpu_user_regs(%rsp)
+        cmp   %rax, CPUINFO_cr4(%rsp)
         jne   1b
 2:
 .endm
-- 
2.30.2


