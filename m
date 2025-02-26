Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5643AA45C18
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:46:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896328.1305011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEvT-00066W-T5; Wed, 26 Feb 2025 10:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896328.1305011; Wed, 26 Feb 2025 10:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEvT-000646-Q8; Wed, 26 Feb 2025 10:46:03 +0000
Received: by outflank-mailman (input) for mailman id 896328;
 Wed, 26 Feb 2025 10:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnEvR-00063u-VV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:46:01 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de70ab6b-f42e-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:46:01 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54838cd334cso5707498e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 02:46:01 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514b2834sm416761e87.38.2025.02.26.02.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 02:45:59 -0800 (PST)
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
X-Inumbo-ID: de70ab6b-f42e-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740566760; x=1741171560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dd74moN9PVohYXSV+cUE3r3Pd0Wb1/cNeHeDKYrF5wc=;
        b=E0q5NDOcQbRvu4HWAi8Wik9YR+l3fXnckW9bsbr47ZpQT6FSJWZBwFQdwE7Ujm1gb7
         z8ddPzM/dalZT5ejSODDi/szoLPCqbjXnLkCszuHY6Y09Xal6TWCFiXEMvA/R3su4Jw7
         vABZg2rkZ5Tjc1Sd4YKOJbImSHZeaRHNQ0x+9pP2pcYntIhM6nwv1i8pzzeYw/03wrwN
         M8zDDs5yJftCiLocvV3VCER041WIh6t4Ju0fOUHqEPHpVxgt8dgko1dInvRLwILy5xCi
         MdHTgddX9PX9Xe/Tnb0cL1sUAWYR66LJgdI+nhccMMgZ0So9CzCJfh724MfIYHzxcM3A
         0/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740566760; x=1741171560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dd74moN9PVohYXSV+cUE3r3Pd0Wb1/cNeHeDKYrF5wc=;
        b=JBKYa390PerMTBHpjjNH40UZqMdsb3k8CYxPw5vJXFJpXJihna57zl+TyKDaN3VVTN
         ngGcJqIXKM/EnUmDcnIQYOFH8A6776Q+VIpgo/SkKgB+HklAQ/DbHsw70RZzIP7U6Vzp
         SuJPwT1pinEoFTAoDHGtfKODq/3rIGBBi8DDath8Bj9GaWM/itsedJAzO2Inn74u37ab
         uQIYduc4S08JQXAjjDIPUiNYkEnc1RuRmtp5L8aRHnuPoLB70Q5JY1VzMuXSyJEA/xlE
         N9+kCrkiBpwbE2IL8ld2dAlTqeoyDBT+W/AYj+/OMMoDFD/BcpNL0UV1NJb7bA/CQQnD
         xn9Q==
X-Gm-Message-State: AOJu0YyxjoTvFne16g3Obs+QTcmf5U5ohxgQKrbiCmvL3zgdKXgTwGhL
	CwcM/9gL3TqDh8WTgWA5vWPq564iTZis0NsrB/MO4XZRoSEB3Jtz59RAfQ==
X-Gm-Gg: ASbGncvHgYowxEcp6fye6J+696/Z7OITKh4Onnb97F0BbEqvy7/RJP8tVpLVyJGJuKH
	MKfBCyxQK7hz3aJ1ZEbLpZLP/g8Gy+KFdMihHap2a3SbjHEUpDM2wXhi5j9cgCRWxi9VwlOk97H
	0UjNr1D7gw2IeAfSckcGN7NmsNxc0M9zgUbuUhBtp2OjvzuoioucR7NZ0rYCSYx2vs71vEijbKu
	L/FyxYW3S95YAIFtD3HFgJKJOJWriH1YVl9VaOqPcFy5wbeJu6WNK6wn/CStxqJNWb2IFPCaFzv
	IbjfyPPNYal4R/giFSbSCxBroCM=
X-Google-Smtp-Source: AGHT+IGDK9q305j4FUUvfbXhluau4YXnw9w7MK/tmA/XHtLb88We3ZZ2rBPJmnkTl1USLXqUIKrjcQ==
X-Received: by 2002:a05:6512:2384:b0:545:d54:2ec1 with SMTP id 2adb3069b0e04-5493c570f7bmr2257796e87.21.1740566759981;
        Wed, 26 Feb 2025 02:45:59 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	"committers @ xenproject . org" <committers@xenproject.org>
Subject: [PATCH for 4.20 v2] CHANGELOG.md: Finalize changes in 4.20 release cycle
Date: Wed, 26 Feb 2025 11:45:56 +0100
Message-ID: <20250226104556.36324-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop "Support device passthrough when dom0 is PVH on Xen" from
   CHANGELOD.md becuase it isn't really ready:
   https://lore.kernel.org/xen-devel/31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com/T/#m725b559864e5ed6163b59a088b437aa10c36ff16
---
 CHANGELOG.md | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820..5f5a40855a 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Fixed blkif protocol specification for sector sizes different than 512b.
  - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
    leaving this to the guest kernel to do in guest context.
+ - Reduce xenstore library dependencies.
+ - On Arm:
+   - Several FF-A support improvements: add indirect messages support, transmit
+     RXTX buffer to the SPMC, fix version negotication and partition information
+     retrieval.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
    - Prefer CMOS over EFI_GET_TIME as time source.
@@ -25,6 +30,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
      interrupts instead of logical destination mode.
 
 ### Added
+ - Enable CONFIG_UBSAN (Arm, x86, RISC-V) for GitLab CI.
  - On Arm:
    - Experimental support for Armv8-R.
    - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
@@ -34,6 +40,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
+   - Add Support for Paging-Write Feature.
+   - Zen5 support (including new hardware support to mitigate the SRSO
+     speculative vulnerability).
 
 ### Removed
  - On x86:
-- 
2.48.1


