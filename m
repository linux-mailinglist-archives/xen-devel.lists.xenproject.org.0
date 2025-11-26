Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89DDC89FDE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172612.1497718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTa-00060H-SG; Wed, 26 Nov 2025 13:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172612.1497718; Wed, 26 Nov 2025 13:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTa-0005zC-Oj; Wed, 26 Nov 2025 13:22:30 +0000
Received: by outflank-mailman (input) for mailman id 1172612;
 Wed, 26 Nov 2025 13:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOFTZ-0005lR-2v
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:22:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f485c7af-caca-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 14:22:28 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so37284785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:22:28 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052b3f5fsm42042275e9.4.2025.11.26.05.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:22:27 -0800 (PST)
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
X-Inumbo-ID: f485c7af-caca-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764163348; x=1764768148; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBmMMSXqkgwd0JWWHDKsytpGPQgOHwugeGbrCI1WGYM=;
        b=EwVxYwocA4Mc9rqG9fstSI9Hf7qC41QdTTIu6xqoZbI0IVTWxAfErYAqljBffDot9s
         Fq1NwNflNXsBqrkC6EZtWoFWQW8B3NEPuj4DofbgTyV5Z2DL/bk0ZWgjx2GWGgJ5b2CH
         M+6g1XbjnSg8dYu6CUwd+0JOmnGDDJp9ktVdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163348; x=1764768148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBmMMSXqkgwd0JWWHDKsytpGPQgOHwugeGbrCI1WGYM=;
        b=jBMuvo9FZ1Txc3Th3LDw4dv7wl8tG7MA0xv+CoQ82xJnW7sVZiEMTN5zzKm5DOlWEs
         +BWfpNZ68KQMk7RXl6VjWWMEvtAaUhpue4W/SFIqYOzOs1BH4Wbl/W39TwxWnbyu+m6W
         EPIwUsjstJoX0K3aKoDUIIjsJ5LGcU1GrwVMFrihNmLioYMXB/w5UAewO2oyBdgOJg6H
         xj32aAl0M50Tp3ewPOZkEs8twyr7g/CaDJaGnWrclOBcmnQxSjxg9N7jQCGCe2miLYAV
         juD/z2JABufqaTg4B9tgFefFwpwxDGs6H2R3suFVPHdKGw2WlD7OPNOaROBw8Zoq8mei
         uvjA==
X-Gm-Message-State: AOJu0YwkgZYiNBw3XIUFZFMsYKlS0iQr2kd3BPxZtgGftxA8g//QRezU
	goA4vaDC7JpVvLs1OhEMf8fOrGAAP8b42TFEEvlp22UOjT+VraCpiWVyT15gpolbKMSABw3/76f
	yJ1x5
X-Gm-Gg: ASbGncv7EqROj+37oWNXwNRIacDvw0pTVXzoHStoxP4fvUzXAo3bsFnG/YjNZhifw26
	MJvVyVZa10VyVdsJJ9VEueqE29J6MUEd4nhJVijyLE2zBLrwx0MqQYsnJaaanV4A0T+uj6UtGrh
	1TXBcGcqCxMyr0+R8RZOunRKLIbOrVI7SAOy5JhSXmH6Cb4ayU68HxdufglEiOBXmIs2WxWCND5
	HdXps3acKurRI1C6aVsqFFKaVXI8SDQxoYBzrZxSxG3Z+8ePR5qjPYI3ViwCHyXRrKOs6d/xvIQ
	ggOAHU0TsRpMAFliUWJoYSdDOzEOJTh6LsxXDXpHipaQ5pbGtGcI7dH0riWoqLY4FIWRlXyQnJD
	bGUkojlZldtiernrxPv5NFraqZL3RfcjsI4mUisYNAkH5rMAqQtse0RQht9ATevETfsXcgryK1m
	yiiV6SKtmkMgFMZFHOcvU/ksx8Sqw25VJBZKaA21LhULqVQDUS0cBTraSUFTlfpQ==
X-Google-Smtp-Source: AGHT+IFUCyKYfsvVlQzNTUhmDy2gDR8npHciKE86AdBgkfQ/bFtdrTeW1t2V26OodcHqqDxISYKnXg==
X-Received: by 2002:a05:600c:474e:b0:477:7523:da8c with SMTP id 5b1f17b1804b1-477c111d3f8mr226042655e9.15.1764163347604;
        Wed, 26 Nov 2025 05:22:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/amd: Stop updating the Zenbleed mitigation dynamically
Date: Wed, 26 Nov 2025 13:22:19 +0000
Message-Id: <20251126132220.881028-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126132220.881028-1-andrew.cooper3@citrix.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was potentially helpful when the chickenbit was the only mitigation and
microcode had not been released, but that was two years ago.

Zenbleed microcode has been avaialble since December 2023, and the subsequent
Entrysign signature vulnerability means that firmware updates block OS-loading
and more OS-loadable microcode will be produced for Zen2.

i.e. the Zenbleed fix is not going to appear at runtime these days.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c               | 2 +-
 xen/arch/x86/cpu/microcode/amd.c     | 2 --
 xen/arch/x86/include/asm/processor.h | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 8f468aaf0921..7953261895ac 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -979,7 +979,7 @@ void __init detect_zen2_null_seg_behaviour(void)
 
 }
 
-void amd_check_zenbleed(void)
+static void amd_check_zenbleed(void)
 {
 	const struct cpu_signature *sig = &this_cpu(cpu_sig);
 	unsigned int good_rev;
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 4a7573c885e5..e7ae1e802353 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -380,8 +380,6 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
            "microcode: CPU%u updated from revision %#x to %#x, date = %04x-%02x-%02x\n",
            cpu, old_rev, rev, patch->year, patch->month, patch->day);
 
-    amd_check_zenbleed();
-
     return 0;
 }
 
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 1342241742ac..2e087c625770 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -435,8 +435,6 @@ enum ap_boot_method {
 };
 extern enum ap_boot_method ap_boot_method;
 
-void amd_check_zenbleed(void);
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_X86_PROCESSOR_H */
-- 
2.39.5


