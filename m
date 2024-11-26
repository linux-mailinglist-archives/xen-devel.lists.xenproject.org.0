Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352D29D9C10
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 18:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843922.1259495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFz1i-0001Lw-6l; Tue, 26 Nov 2024 17:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843922.1259495; Tue, 26 Nov 2024 17:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFz1i-0001K5-2V; Tue, 26 Nov 2024 17:07:02 +0000
Received: by outflank-mailman (input) for mailman id 843922;
 Tue, 26 Nov 2024 17:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lAfR=SV=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1tFz1g-0001Jz-76
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 17:07:00 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d74580a1-ac18-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 18:06:56 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cfaa02c716so7514163a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 09:06:56 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d01d3bfa27sm5213946a12.37.2024.11.26.09.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 09:06:54 -0800 (PST)
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
X-Inumbo-ID: d74580a1-ac18-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQ3NDU4MGExLWFjMTgtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjQwODE2LjU0NjM0Niwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732640816; x=1733245616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPIZ22ML9suk8fFJ87mEcSpGb1DdtpFHM7NqH1LU+GM=;
        b=cCp2b/O4/SC6w4eIJgTcRQtu0lInWhM/NUOBhkuscDVN7j/TctcoX5LAOuSi//QAh0
         deNvRhVHdPsffaWhwvDsxgC6Puiajx7a7JcHSXnywgUfMLu78n6jwjSU1N8oEhjCDyQ8
         cvEr7TgIwM4f2iHc2D33AIKlBAlLWR4E+Rs6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732640816; x=1733245616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPIZ22ML9suk8fFJ87mEcSpGb1DdtpFHM7NqH1LU+GM=;
        b=xRuSTvc+JODgiZnKl2Our5uZu19CoLXSnQRc1jsSegbpsvBB7j3aEq4kyNKpa6pqN8
         w2jNhxTCy+Y9b1g4zEcjGVZCFiBSvEoNcQGmovlgPRvYARkV45pG283Zaz+Mq+0xrk2/
         3mLblIOMrM2sijKSEx7wARYvb78Zf69NcIzg0xREPj64IOfbdXwoynKTWJi9kt+GHGEG
         eLpnSsxx6u3NP2pvQ6GjmxxSMh9pQeXEpROTc3cPe9DTpQ6C8h4AEG872LQNk/WqoQnv
         H01dxYfQNqQB4eRCEAIu7U/u0TiBS9+8rflis5+fgdv55ad3dZ5owgbLgUS/DwTAzQ9P
         JULQ==
X-Gm-Message-State: AOJu0YwjXj0xHy5l5daBVBm3aVS//Z3aiF8WvVrvP6SeC/dNIsSLcipa
	OL1QhlN/Ows4dX++Rh+PuDuw0s/0Dmf/X+nCY+4B4uM1QT3gjKZ87SzZ5ptbK1bYR1HCGapJ7yI
	67lU=
X-Gm-Gg: ASbGncsn/AwHWPQvauS08ReFQSMM4PfyI/K2ZVTsBnaFFcnriNTB9JSmfwrgEEICiuF
	QH+AwSCXLn8JttoxQffysAKTWm9tehYYRrJK/w7rQUjfzvirnbdwSzuiMah9a/ohbSqvarD0gj9
	ePhxhxzleY5KPo2cae3hAF48Dvr1HlLA7YyjPHxzaECc2qmm7pllB/Sxm6DekoYgWmKQpUc0aWl
	OHP3IyB5fzacfcXLlH/Er5sqsR9B3Af0Di9j4voUAUYAiVetWsLjJIBFztFeimjDQs=
X-Google-Smtp-Source: AGHT+IEP9luS/b6NuZUskIvgfr4LRLAoCXAKoBLd8X7HxE+A/NhS2OGS752I+QmJoX8PBXdT1YHogQ==
X-Received: by 2002:a05:6402:5ce:b0:5cf:3dc3:7a3f with SMTP id 4fb4d7f45d1cf-5d080b7fb81mr34534a12.5.1732640815277;
        Tue, 26 Nov 2024 09:06:55 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v1] x86/APIC: Read Error Status Register correctly
Date: Tue, 26 Nov 2024 17:06:15 +0000
Message-ID: <3270b77c005745dcf56cc833bdf3e4c703190b05.1732639041.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The logic to read the APIC_ESR was copied from linux in a commit from
2002: 4676bbf96dc8 (bitkeeper revision
1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA), 2002-11-20).  In linux 3.14,
this logic was fixed to follow the Intel SDM (see commit
60283df7ac26 (x86/apic: Read Error Status Register correctly,
2014-01-14) in the linux kernel).  The Intel(r) 64 and IA-32
Architectures Software Develover's Manual currently says
in Volume 3, Section 12.5.3:

  Before attempt to read from the ESR, software should first write to
  it. (The value written does not affect the values read subsequently;
  only zero may be written in x2APIC mode.) This write clears any
  previously logged errors and updates the ESR with any errors
  detected since the last write to the ESR. This write also rearms the
  APIC error interrupt triggering mechanism.

Update error_interrupt() to remove the first read and follow the Intel
manual.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 xen/arch/x86/apic.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index bb86a1c161b3..b4f542d25918 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1385,20 +1385,19 @@ static void cf_check error_interrupt(void)
         ", Illegal register address",
     };
     const char *entries[ARRAY_SIZE(esr_fields)];
-    unsigned int v, v1;
+    unsigned int v;
     unsigned int i;
 
     /* First tickle the hardware, only then report what went on. -- REW */
-    v = apic_read(APIC_ESR);
     apic_write(APIC_ESR, 0);
-    v1 = apic_read(APIC_ESR);
+    v = apic_read(APIC_ESR);
     ack_APIC_irq();
 
     for ( i = 0; i < ARRAY_SIZE(entries); ++i )
-        entries[i] = v1 & (1 << i) ? esr_fields[i] : "";
+        entries[i] = v & (1 << i) ? esr_fields[i] : "";
     printk(XENLOG_DEBUG
-           "APIC error on CPU%u: %02x(%02x)%s%s%s%s%s%s%s%s\n",
-           smp_processor_id(), v, v1,
+           "APIC error on CPU%u: %02x%s%s%s%s%s%s%s%s\n",
+           smp_processor_id(), v,
            entries[7], entries[6], entries[5], entries[4],
            entries[3], entries[2], entries[1], entries[0]);
 }
-- 
2.46.0


