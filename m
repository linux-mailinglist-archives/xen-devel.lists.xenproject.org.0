Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA0CAA5037
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 17:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973717.1361778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9LJ-0000il-Tg; Wed, 30 Apr 2025 15:27:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973717.1361778; Wed, 30 Apr 2025 15:27:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA9LJ-0000gN-QJ; Wed, 30 Apr 2025 15:27:25 +0000
Received: by outflank-mailman (input) for mailman id 973717;
 Wed, 30 Apr 2025 15:27:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wUHs=XQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uA9LI-0000gH-D9
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 15:27:24 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d21029e-25d7-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 17:27:23 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so6581058f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Apr 2025 08:27:23 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073cc4025sm17561145f8f.56.2025.04.30.08.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 08:27:22 -0700 (PDT)
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
X-Inumbo-ID: 9d21029e-25d7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746026843; x=1746631643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHFL+gOFF02sOoop/61D2SSO054EKeEYhUEzTdlfQOg=;
        b=Y5m32pp+PDG+SpGtxpbAv7Wd9eGpAUrxo82i78LtaZ8k4PTzfZglclNFjXZ+G7W7o6
         vxXtU9FKH3B36cjqWnPxdTzwtXs8y4VWaxwHNEuCv6f1TjV/LvJTaBiJNfdZdF4T/7S/
         6Eh4QLgVU9GyytiYgfmX+wUbGhXyCOrDvcnPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026843; x=1746631643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHFL+gOFF02sOoop/61D2SSO054EKeEYhUEzTdlfQOg=;
        b=CpTtYCsdOCkWLdoKrCs8q7kwBaT9hNLcoKFBGapAkYlJcA1qmH9faRQPD9bveuCatK
         sSRMZmNaR0Q8i+nq41ScsyWS0wypYnUhcIUJ4v78FMOSCZmBl4ZRtZQYpNQImT77tohq
         ZRMFIHYG+LiQqN77l6ts5TRg+0LxPWN8ZLAb8YZfoUmOup/Nl/ndiHnNbgzQfdGr67Ax
         siOvaPohQy6Vl+6LUJhmdzEe1ikN/5XED15gT0EvbMEvVuiLTul0QTSA8MWWFc9c8PQv
         InX4T2Bk7kQbwDcnWNqNJBAAAVviskXAdrC+WycB+A75CNAvevT/qa8bpbsFlGtlbt+O
         WHZQ==
X-Gm-Message-State: AOJu0YyfQQKMrYf6+IBf1GoIFAgANMgP3VId/xrXnFgmGKl8WS2L+iwp
	BN40oNXd+4eDi58s26IjMXsowiu/Mk/lw3RVCRaUy6N2f4654NbtlRwMamfDX+pjoHGgxOWeqzZ
	u
X-Gm-Gg: ASbGncsupiZhJDAlmJgBfZnliVuor/hGK7Yg8O0mPtCXLwe2OahgggDfs7XUlA4ybxs
	H928TXcgSX9+5GfpZkeBBekhXckdUtrKyvW0kzNUxFIovgGazcNRu7CXXq8K3Zi4QAcyafLYfmN
	/XfKS6UY59WKEWxLo2puNmeCHhjJLwkUnspWRgFsiCfqxrGs7haKLg6ztBoZsdenzH88Q/j0plK
	mOdigUJMdKmxVMbSUnF+zpKUJvrJ8/pUl6krIFM5ndZ/Emfl2DGdTSdIJG/IgY0DjnnzLc2E2b1
	FRLSS/Ve++VidUv2lxT2FVYF9PRe5YMjtHoDGA6o68AUzl+pppdfGEK2gg4mTP4tHOhtjKZioSF
	REG9jTIGFmvYX8Q==
X-Google-Smtp-Source: AGHT+IFt+RqlRPrxq/mFzVLiNr/MsO3yVzKm44lbtYV7aDkbtQRhxUByCBrcUjuMqOeIru3QxPOvHg==
X-Received: by 2002:a05:6000:4202:b0:3a0:80a2:3c5d with SMTP id ffacd0b85a97d-3a08ff3775bmr2619975f8f.19.1746026842686;
        Wed, 30 Apr 2025 08:27:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/intel: Move mcu_opt_ctrl_* into __ro_after_init
Date: Wed, 30 Apr 2025 16:27:20 +0100
Message-Id: <20250430152720.602045-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They're only modified by set_in_mcu_opt_ctrl() which is an __init function.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

In principle:
  Fixes: 39a40f3835ef ("x86/spec-ctrl: Clean up MSR_MCU_OPT_CTRL handling")

seeing as __ro_after_init existed at the time, but it was tied up in a
security series and __ro_after_init was very new at the time.
---
 xen/arch/x86/cpu/intel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 63f65ea5b048..12c3ff65e02f 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -21,8 +21,8 @@
  * MSR_MCU_OPT_CTRL is a collection of unrelated functionality, with separate
  * enablement requirements, but which want to be consistent across the system.
  */
-static uint32_t __read_mostly mcu_opt_ctrl_mask;
-static uint32_t __read_mostly mcu_opt_ctrl_val;
+static uint32_t __ro_after_init mcu_opt_ctrl_mask;
+static uint32_t __ro_after_init mcu_opt_ctrl_val;
 
 void update_mcu_opt_ctrl(void)
 {

base-commit: a1ce987411f61dbf5fe64bba0cd3d36d7cc0311f
-- 
2.39.5


