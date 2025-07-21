Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2DAB0BFAD
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:07:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051221.1419543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUa-0006BU-GX; Mon, 21 Jul 2025 09:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051221.1419543; Mon, 21 Jul 2025 09:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udmUa-00069O-Cv; Mon, 21 Jul 2025 09:07:28 +0000
Received: by outflank-mailman (input) for mailman id 1051221;
 Mon, 21 Jul 2025 09:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j1p=2C=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1udmUY-00062j-SS
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:07:26 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bd97a74-6612-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 11:07:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so32984275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:07:21 -0700 (PDT)
Received: from localhost.localdomain (111.142.125.91.dyn.plus.net.
 [91.125.142.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f4289sm153796045e9.7.2025.07.21.02.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:07:20 -0700 (PDT)
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
X-Inumbo-ID: 1bd97a74-6612-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753088840; x=1753693640; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GvpSxYhDzsEhPd+JvPdIncm+Ba1smFNShKyvbHsGn34=;
        b=H29IFWgNpUbM3umA79pMFiHomKL+UPPfDe/6FunP/PJo9/fn0/Fp1UOhHR7Yxjkpiq
         bu0glmxPoy/pStretf06IG7ev0JAMGSoYCEkxk4zTml4eyxVQRhn0DN+oD50x1caMAVv
         YuH9lmLEVu9pv4HXMdh65ItF53qaamnpFtB/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088840; x=1753693640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvpSxYhDzsEhPd+JvPdIncm+Ba1smFNShKyvbHsGn34=;
        b=R2VG+bK59mJqEpva1gcX7ZS6cFIBm2En/4LtDuG1DjvDIfohdrSPpg0URzsTOnB8Jh
         klmzQDWkfzQkYZMHLPUBEDbDy8Xp8MUDsHHieMPVUEc5bi+nxVj7VSGE7sy11anZdlv6
         wo0hPELmyqbmcthSoVrO5EOiX7PA/2kOhRAlgg82H3GMiNXPkrzQwyN0PCcOyHdTA56c
         4RqYgcd9s1JLWISBI/q5mYQhzgDE2hpVEFz4kWLIZY1I9HCqPPL85s9SswYEu52C/te3
         9Mm5smnvkRO7masD30MPjJfb3AzTC8N3LRA+Zf/weI1f8w4OrffIJWtEGR3Hfs1yWWQw
         4HUg==
X-Gm-Message-State: AOJu0YxeoqdBkBYIZnKh60B1RpOKHaUcEInkJK4cgnLXBPF2fTlD5N8Z
	7A+A2aL5CWAqSNZQfqcp3IluHWstJzwPyaNWFNKOeVPf9mhrlKe9hQRdCBvXm5EbKDqyQbCf40z
	Q5UTRET0=
X-Gm-Gg: ASbGncvATpMrR8+rARvM/nxNMA09PBOISJaLaPzJB3gMm1Y+bRF1E6bSUzeUOt3+toE
	9BkWjriTyTnmEV9B5uDeJ4AweG9pOzYSMiY4jSr1roPNFkIMbQGkkSUMPVlq/YQcZ4Zn5EKP+zf
	lBICA4Q4tlTFRraX0sni36ZDcE69P6j/on6feOedu2cXEvx955gmfJa3MQciT0wKA+zpF4I7O7d
	89c/YQOsLbg8dWD6HARt1hiUa07fRgbL0wiNuy5+h19cS1XILBC+qgZ/D1uP5Em8emrEjEIDPeS
	NoSpoo/4ILq163/oE8VKEGFoZaNl9GGSEcMed3XUAcs1Vs8pa00Kbk6ouQrmKcC48cRYbuBKbje
	kn7oO+kpYWZKqALdoOyS3IrRiCbXwXYuWofbWF4PdlooWmyc1RMEzIC2VvI9fWqL3k7LfkMM=
X-Google-Smtp-Source: AGHT+IHQ6/ygeYMidY/grXx9rQid/WFD/7bc5Ef84x6aNqLyaD70J1z5+NpJy1KPq8Et4veb1bg1Dg==
X-Received: by 2002:a05:600c:c0d0:b0:456:12ad:ec3d with SMTP id 5b1f17b1804b1-4563a54de9amr96794745e9.14.1753088840333;
        Mon, 21 Jul 2025 02:07:20 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/3] Minor ARM EFI updates
Date: Mon, 21 Jul 2025 10:07:08 +0100
Message-ID: <20250721090713.414324-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reuse some functions, fix some indentation.

Frediano Ziglio (3):
  xen/efi: Reuse fdt_setprop_u32 and fdt_setprop_u64
  xen/efi: Fix indentation
  xen/efi: Do not pass dummy pointer for empty property

 xen/arch/arm/efi/efi-boot.h | 51 +++++++++++++++----------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

-- 
2.43.0


