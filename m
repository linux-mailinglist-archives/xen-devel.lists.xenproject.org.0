Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492FAAE6895
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:27:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023775.1399836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4cM-0006du-Bh; Tue, 24 Jun 2025 14:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023775.1399836; Tue, 24 Jun 2025 14:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4cM-0006bi-6n; Tue, 24 Jun 2025 14:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1023775;
 Tue, 24 Jun 2025 14:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTSQ=ZH=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uU4cL-0006YR-HG
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:27:21 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 559fc07b-5107-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 16:27:19 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so2431329f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 07:27:19 -0700 (PDT)
Received: from localhost.localdomain (253.226.6.51.dyn.plus.net.
 [51.6.226.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45380705351sm4602115e9.0.2025.06.24.07.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 07:27:18 -0700 (PDT)
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
X-Inumbo-ID: 559fc07b-5107-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750775238; x=1751380038; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1mBjtI5raQ25OjXe0+sC0wwT7xvu83F7yHgPnqqLXpY=;
        b=GXqILefRexbyI6FwSUm5bhWo7fmLd9kiXP5B8rpcblj2YGLRCIsZ/2WdBSyclnOC2C
         AEr9fW9Hi5mobGmt7b0Q8sgArmAX3q3kwiG7Bzg1TvLCQVY12GCUm57FQm8yRLXDRYUS
         u4jO5ztXMIKjjEbULCz+efmTxlm6NVf07M3T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775238; x=1751380038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mBjtI5raQ25OjXe0+sC0wwT7xvu83F7yHgPnqqLXpY=;
        b=ufovB21kTRc87IseTTuo8gCaApfvrPRAdr78SbAz2hHPDrtqZ/s8cJVdFsbar+yqEQ
         tdfhyvCatuKAIp6F7MkZb5Jn94Sv5NvpzWiX9rIwJsw19LCqLDARdK5QGNRG1z868JcZ
         eQ6kIwsMTCGrxBNa1nVtWfDxh0OPR/Xl3Y2pnaJXpsYYxJR4gP6anTCOnUaHgpivcH1E
         iZZmt4+gPk7TvWlIeD/zz+SlYcpLv2HRDEqBciq2i/NBUbBx4Ei9D8LqR4GMILPlTE8g
         FHEycvI9BmilbdZEDilUbQJmdpujvyJaFK7R+Cv17BXWsynU9hCKxsqLHc4yjP8OkYr3
         lEYw==
X-Gm-Message-State: AOJu0YzlwMTaIdQNjhwSmWui13dwT+iaUmX83JMfHGwiwJOT1UVVeMZY
	za5m+pDOm8P8xSm4NntbxTyKQNsQN+sdacH0GZxx8Kr/pTejV/we7fQEfshXTKTa3saEbv5uR3/
	K7k5PfRq6/A==
X-Gm-Gg: ASbGncsV37KKtHC+aO8BUpexPzebdCZn5O15oC4wrzzaViseZCrKh9BBhKENeOhBrgj
	CixAz7BdLA5yZ4PL7CL0lqaEER9ckUJU1SnziMzqLqJvzUGNreGDQYZmUM2CHZAWLkDHA4tCIv9
	o+q8SuRmT2KqLB2flpTJBZU/munrxc0/m9dG53CwaUUIO/MNECjm6/5shf5sR/4YAJFtUe34CKf
	ewVswmrbwQJg2818z88acV+gxijosKBVrpktcGhcD+1j57/cUd4kMJoBMfGJjiv2c1C2goS74UP
	5TwIVjU0zemwpnzp+c1OLxQQHboXZssXHSRb12EyASv98P+JykdXviIgeUGCfWHEYS0h/XOOrPq
	a2Nit+E9K7IBka3/eZw3l46lvtrzItQ==
X-Google-Smtp-Source: AGHT+IGA4Iy4DR72Mj9/KuO4EyvaQcvpIUi1o0Y0hczLkFPQjhj6mw6JoILmIC4qxzBLAJXLGRwukg==
X-Received: by 2002:a05:6000:2107:b0:3a6:d967:380e with SMTP id ffacd0b85a97d-3a6d9673ec5mr7880515f8f.3.1750775238428;
        Tue, 24 Jun 2025 07:27:18 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] xen/efi: Make boot more flexible, especially with GRUB2
Date: Tue, 24 Jun 2025 15:27:07 +0100
Message-ID: <20250624142711.54925-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The combination of GRUB2, EFI and UKI allows potentially more flexibility.
For instance is possible to load xen.efi from a no ESP partition leaving
a boot loader like GRUB2 taking care of the file loading.
This however requires some changes in Xen to be less restrictive.
Specifically for GRUB2 these changes allows the usage of "chainloader"
command with UKI and reading xen.efi from no ESP (so no DeviceHandle
set) and usage of "linux" and "initrd" commands to load separately
the kernel (embedding using UKI) and initrd (using LoadFile2 protocol).

Changes since v1:
- keep read_file fatal when it was so;
- attempt to use LoadFile2 after trying object section;
- minor changes (see details on specific changes).

Frediano Ziglio (2):
  xen/efi: Handle cases where file didn't come from ESP
  xen/efi: Support loading initrd using GRUB2 LoadFile2 protocol

 xen/common/efi/boot.c     | 105 +++++++++++++++++++++++++++++++++++---
 xen/include/efi/efidevp.h |  21 ++++++++
 2 files changed, 120 insertions(+), 6 deletions(-)

-- 
2.43.0


