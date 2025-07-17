Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091FB086B9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046272.1416580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJ5n-0003wN-UF; Thu, 17 Jul 2025 07:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046272.1416580; Thu, 17 Jul 2025 07:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJ5n-0003tY-R5; Thu, 17 Jul 2025 07:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1046272;
 Thu, 17 Jul 2025 07:31:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Yum=Z6=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ucJ5l-0003tS-NH
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:31:45 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16e3e96e-62e0-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 09:31:44 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so511610f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 00:31:44 -0700 (PDT)
Received: from pc (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net.
 [82.13.70.251]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc201asm19792460f8f.22.2025.07.17.00.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 00:31:42 -0700 (PDT)
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
X-Inumbo-ID: 16e3e96e-62e0-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752737504; x=1753342304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rraxh8xHk/UnU72G93QOty1ugVHAFzFthZOS7lWwbWg=;
        b=XvvGt0D4fyOfBpOLAU3ETzR4RWuHMNsQ9PxreL1p+AC5u0gPowSq32Njt2nI976yQv
         RjiiZ+B0CphnA4rANTVEdT4N7RNYQWAlM9y2mdVuB03xh+r4jsEQ40Xs83bOoKMOGsiQ
         YHm1ZOXiF64VGMQM80pas+fYA6JSw27+WF7Qw2gU1b+Rmv2aXuuPa8jJPEefS3FhPfJp
         HPPU/a8ct7hyKgS58ViJipNP2SYH7GtPXi+AKtCwappl16YdKuIjNZZBc94tKXFjn7f0
         eHZz72XmhhzlIlQysBMimtVKNtB23xKD96f5D19X7NpAJEXfbnvQdgSHYM9ht2ZxY007
         C+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737504; x=1753342304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rraxh8xHk/UnU72G93QOty1ugVHAFzFthZOS7lWwbWg=;
        b=a1l2shOcPfD2mR4kVLSgJjeGi4psvP0lGaZX0idYK2cyZk7K0tzEBP2hUStdqCLt5F
         pocRIBLLYB7rmYlK9pnv7Ct2HvNbmOOCpgwkhP+aW9fhPZ2amSyE+1dMVtKo2O+T6cAY
         nvIOciqgN2U8sl+SYguzIaMATY417IILNSpjnKQXzXGtAquwdcDjFauZ4b9SZByyjaLj
         y31yQAHLgXQ6iJ6hnbLrelCFhJQOFn8qGycZYuAHcYon7whFRNxZdjlZLDYNqKCACR3S
         P+KNS7MSeX2jD1w1NMN51lnQ0yZ+T1d+qtkeuh2q/bKzF4YPmCS8H6K4F18tKeHwLkeh
         iz1A==
X-Gm-Message-State: AOJu0YyV7rnrhISWpJWZzFexFfM8Lo3LxT802nPRW5ATQvnBtlX1/nPv
	t4HEPD0GMhs+nV867xQ095WetDKCCIP8PEQ9RrS0QT9oi3hMlz7zTC0kih4adva5
X-Gm-Gg: ASbGncttTE1e3KQPKhz7Pn16wus5csUn6zaxGTo9n8y8+GhGP0giqhA+m0AADwktN/c
	usVroEeCGGKqa/zl6BcRhm3JTOfFdQtEpK5RteAraHDzKde2HrOZBDiw9M94qsz6YFMAuSrMPnt
	xCEf7TN1aTY1xerJb5HOhljZPV3HcqaETzg1Ked9UJGZB9Tm8uUcLU7gtCPmZ1kWXiGezKymIng
	qGOT5WUWH6AkmjN1VWD/tbYAreVVIc83Gge6hhEoz982PHPWbhNBSS9Dec1CmUXZP3cpZpK6Ez0
	Xj+vSevxtVvc1Jt9WG1c2D40XyBC6hLBI+nle6Nf//MKmIzyRz0YVgMW5PqoBeCyEP+f24r2QUi
	H4vBQkvUp6/0ofoI0B8gFcPJ2YDXNj/rfY9kiT514FWBEdI3841cDHflYVfCR73Spmw4BA/4b
X-Google-Smtp-Source: AGHT+IEIiUbRoEeHpD1O/9YyZM+dZjBz2SJ9TF6r103cSTtzUsKlx+NRfFUgtAP8Wo5YUH0tF/xBbA==
X-Received: by 2002:a05:6000:2c11:b0:3a8:6262:6ef5 with SMTP id ffacd0b85a97d-3b60e4b80a6mr4772945f8f.10.1752737503527;
        Thu, 17 Jul 2025 00:31:43 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 0/3] drivers: Simplify handling of pci_sbdf_t in passthrough/amd
Date: Thu, 17 Jul 2025 08:31:24 +0100
Message-ID: <cover.1752736989.git.andriy.sultanov@vates.tech>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrii Sultanov <andriy.sultanov@vates.tech>

Step-by-step, use pci_sbdf_t directly where appropriate instead of
handling seg and bdf separately. This removes conversions, reduces code
size and simplifies code in general.

Andrii Sultanov (3):
  drivers: Change amd_iommu struct to contain pci_sbdf_t, simplify code
  drivers: Change find_iommu_for_device function to take pci_sbdf_t,
    simplify code
  drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t

 xen/drivers/passthrough/amd/iommu.h         | 11 +--
 xen/drivers/passthrough/amd/iommu_acpi.c    | 68 +++++++++----------
 xen/drivers/passthrough/amd/iommu_cmd.c     | 10 +--
 xen/drivers/passthrough/amd/iommu_detect.c  | 27 ++++----
 xen/drivers/passthrough/amd/iommu_init.c    | 39 +++++------
 xen/drivers/passthrough/amd/iommu_intr.c    | 75 ++++++++++-----------
 xen/drivers/passthrough/amd/iommu_map.c     |  6 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 50 +++++++-------
 8 files changed, 138 insertions(+), 148 deletions(-)

-- 
2.49.0


