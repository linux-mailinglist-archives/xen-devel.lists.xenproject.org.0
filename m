Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ADBAE8750
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025191.1400845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURce-0006TV-Ld; Wed, 25 Jun 2025 15:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025191.1400845; Wed, 25 Jun 2025 15:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURce-0006Ry-If; Wed, 25 Jun 2025 15:01:12 +0000
Received: by outflank-mailman (input) for mailman id 1025191;
 Wed, 25 Jun 2025 15:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uURcc-0006Rs-Kt
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:01:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39e55371-51d5-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 17:01:09 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso1760583f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:01:09 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80ff461sm4976757f8f.67.2025.06.25.08.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:01:07 -0700 (PDT)
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
X-Inumbo-ID: 39e55371-51d5-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750863668; x=1751468468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyHnyI4d1dHiQHo2ct9/+EepdKlaa/PFCwCjM+tAtHA=;
        b=UFa7bBY3RAVQ4pzM1/2qeLjgGOa8smUDQNVnSPOTkYzRzKi5pTtpZ/a+8cYkS/FsoY
         /pgkd5GjpBy7qUKZWjgPt3CvtwdArM5WtExng61bPcngOOpQ3GtXPeoWPm64YWg3WBvP
         mYLL2bzkPpMTrBUsQpoMlOth/W0ceRW/kFVxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863668; x=1751468468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyHnyI4d1dHiQHo2ct9/+EepdKlaa/PFCwCjM+tAtHA=;
        b=iotwL/Lbt3SzytguvHpvmqI8f3FHK/eilLXBHlVkiAivXUDiDA88ehvC6O5FJcZmeO
         c+iye2wRARjAfQmVYXntcdv9iHyqQz9owwscSxYWCZlAzAHzgg/QDebiRSHNGe1LOsYU
         VXK3mjVZ47QokuwBAmTLtteCPs/Quku7FJv1D91n5Wu+Nx25DLA/ZBYBxhSDvNFAFmMj
         j4y+PT9M7WrBdrUFQ0BgUBaVsmiFu28JKq3tezsifwiwbxS8dbNhyVgZYhaad0qXxqH8
         jAOKi8UKWxwgq6nZ2DfHK296oxRpsuPBazaNfT1tVqZmSeBWmZn0TJ9Lx4NQP8Ed7U9X
         ysYg==
X-Gm-Message-State: AOJu0YwX4CBT2SbPMta4Nz1FJ+6H8SZAxOFUgm65hw20FixMKftU9ztY
	6PUdVZJnm7AnsZ3p4Lv4Pb+iQXIJvH1ihV73gClb9H/GU3SXnXKDrUhg3n3piBwZAa+dk5KwEf7
	OOmA7cxCDsw==
X-Gm-Gg: ASbGnct9w5nzp32CL114iHd4Br74iMYjBIMx5pxPVYAUnNulLMwL96XB8LuyIEXNnT8
	rvioIh0iWglmwJaFDuzkWliNCjgnaX/46ak13pNRRRhzHX4Tsnez0scQ5ya8vLOEYnwvbIJHw9a
	2+EUn5aJC46x9PaqrGYRroxgBOSvbS6VYVxIw7ASaf11b9QWA95NEdW51AnDuUxtL99eU0CH2zh
	lAaoYKqPbiuUItXPtgBImvFLmmeALlz/qnHMi7AWtskwvs6AQEwquNb3ITyiNl+dZx++0LpZ9wN
	PfszTFJ/Vc2GQA1+WqAhPiWuLCpoyjQumIeyAL840r8nlLNCiSVXUdXBOVYEOV5AGqVCYKyI4ja
	YjdEexi+DGTCy9wbXN73jA3V/eTG7BW04Q34=
X-Google-Smtp-Source: AGHT+IEmB1NAnfJhGeQ1oYtGB5BEC2vkgscHqdf6pso725m8DgTsRb6cLg5nVo0omltImBMbIRg5Cw==
X-Received: by 2002:a05:6000:2709:b0:3a4:fe9d:1b10 with SMTP id ffacd0b85a97d-3a6ed646c16mr2220102f8f.45.1750863667898;
        Wed, 25 Jun 2025 08:01:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Improve paging mode diagnostics in create_dom0()
Date: Wed, 25 Jun 2025 16:01:05 +0100
Message-Id: <20250625150105.402005-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I was presented with this:

  (XEN) NX (Execute Disable) protection active
  (XEN) d0 has maximum 416 PIRQs
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Error creating d0: -95
  (XEN) ****************************************

which is less than helpful.  It turns out to be the -EOPNOTSUPP from
shadow_domain_init().

The real bug here is create_dom0() unconditionally assuming the presence of
SHADOW_PAGING.  Rework it to panic() rather than choosing a dom0_cfg which is
guaranteed to fail.  This results in:

  (XEN) NX (Execute Disable) protection active
  (XEN)
  (XEN) ****************************************
  (XEN) Panic on CPU 0:
  (XEN) Neither HAP nor Shadow available for PVH domain
  (XEN) ****************************************

which is rather more helpful.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f32efa7c6045..24e4f5ac7f5d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1033,9 +1033,12 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     if ( opt_dom0_pvh )
     {
-        dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
-                           ((hvm_hap_supported() && !opt_dom0_shadow) ?
-                            XEN_DOMCTL_CDF_hap : 0));
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_hvm;
+
+        if ( hvm_hap_supported() && !opt_dom0_shadow )
+            dom0_cfg.flags |= XEN_DOMCTL_CDF_hap;
+        else if ( !IS_ENABLED(CONFIG_SHADOW_PAGING) )
+            panic("Neither HAP nor Shadow available for PVH domain\n");
 
         dom0_cfg.arch.emulation_flags |=
             XEN_X86_EMU_LAPIC | XEN_X86_EMU_IOAPIC | XEN_X86_EMU_VPCI;

base-commit: cc7394164633e75fb61d52565f75271e0b7f1236
-- 
2.39.5


