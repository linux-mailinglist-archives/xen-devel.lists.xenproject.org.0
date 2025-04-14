Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3137DA88C28
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:19:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951278.1347369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PLB-0007F2-GT; Mon, 14 Apr 2025 19:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951278.1347369; Mon, 14 Apr 2025 19:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PLB-0007CZ-Do; Mon, 14 Apr 2025 19:19:33 +0000
Received: by outflank-mailman (input) for mailman id 951278;
 Mon, 14 Apr 2025 19:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cm6X=XA=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1u4PL9-0007CT-Mq
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:19:31 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 634a0931-1965-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 21:19:29 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so4124572f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 12:19:29 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d7d8sm191595335e9.4.2025.04.14.12.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 12:19:28 -0700 (PDT)
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
X-Inumbo-ID: 634a0931-1965-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658369; x=1745263169; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUVedLR3IklmNHQn/oHUU9IKWZjTMqNBtu4pfnH5moE=;
        b=d/QGwzjki+IlEyLkLk9hvCXXmUVR+eEGob3w8aJxlGvuPn8Q3gja+NxEX178R6C1ip
         MJHVs2JchM9qNiiyk0OYK/JAuZS23A7FPM5KSCVPmrxmlLQgMcFJwT+1HXko2AOTcHPw
         QEwPG7r+aS403a92ifvhRR1H/TqBs7zQlA+v+nT5S5J5npl/hicLJNych7b7McznPSHL
         77bZQ4/crl3nuxwECWbIxPJakuyNVuBhAhHTECPixs75Yu5x1U7kDTA9Paq/vRu3AYry
         3u+lDuua1OBn7bewfKqqx7zo7UUAT5dkuNC6SKtV/aHB3/qF/aZP9jIHhhYjDB8cLEQH
         XC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658369; x=1745263169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUVedLR3IklmNHQn/oHUU9IKWZjTMqNBtu4pfnH5moE=;
        b=pfUrWHlHPFS9tsL5rWuOMsMXpIyYlbbk05zh1A3dKjirPZNyQGs5py4wUIMJK7h8E/
         sj8aaiTyvzYLmXU9jTEgNL1lYCjcF0CeCVT3JpgIotJceilC6M+3xrSxi8rzfX8zKSMc
         Xtlss0ixg1RgSA6NN5IQ6iMgeA5rG/DwsOY/ZsU5GKqSSU3sJFK+M1O+qnTZJftuN7qZ
         0b8aI5OXpGTnEjGalahznerl3fDUQ8L7MYXSZvAt6SZXRWR5nxCnmn3WSjHKztm1hd0s
         f30nJKK2GOmhgnc5L+RUOZbeIofIOVhZKQ9MLdHtyTRadDSIobHAWGlRoFO9rwtFMvsC
         h4fA==
X-Gm-Message-State: AOJu0YysjNVNJje/ccRarPPGQ9f5K56An+FJs5dC1xxCs8fxpCvEHRT7
	ZnYu+PIWNoFk66pjGSXM4qFDsS+OR7HhsQUSGy+t2IT5fx56hZD8rClHZhMGghM=
X-Gm-Gg: ASbGnctWNVU2mlDWbmxnFfSux4RAjcX7JNQnKygJVf8zbHaLm7/m4mdRKz0TzE4xh9R
	4hmAdLw6kMt+T1AlW382mOPQmZUFbpIyT13sxZIQcuOHpldqwUdE01ywsBbkEtWZKB7ZNvQ+Bdt
	aUKYl0kQucproR9hbhv3C2HEMrBFTN6Si7GKqgUU40DYDxjPuMfxK9BQ9CZGOgE0tXm9+M3akV0
	y1ncPo0qPeKO9H/LntZH6bGML38SWB78dYPrPzEsl1rx6CZ4QHABiOdtOd8HDPRr7c/W2/8+KkB
	wSYIAAQm9LlmmXwXCOm2sWgYFrUUIjicK51PmmAyd/R+ZMLgEReYzDZ80D/vmi9jMObBmSsz0Np
	l5DVGXVGUsgs+0vztjZbdhNrVpUfPcOYb1uor6EkoGso=
X-Google-Smtp-Source: AGHT+IHJ4dKSq8dTBXBrg4ET9Fy4F2E0JNUQLooT+CnZ6usUe6iPl2LtwooOkFi7x3HWEz+Le4h0gg==
X-Received: by 2002:a05:6000:144f:b0:39c:cc7:3c62 with SMTP id ffacd0b85a97d-39eaaecaddamr11999578f8f.51.1744658368806;
        Mon, 14 Apr 2025 12:19:28 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
X-Google-Original-From: Andrii Sultanov <andriy.sultanov@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 0/3] drivers: Simplify handling of pci_sbdf_t in passthrough/amd
Date: Mon, 14 Apr 2025 20:19:15 +0100
Message-ID: <cover.1744657012.git.andriy.sultanov@vates.tech>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Step-by-step, use pci_sbdf_t directly where appropriate instead of
handling seg and bdf separately. This removes conversions, reduces code
size and simplifies code in general.

Andrii Sultanov (3):
  drivers: Change amd_iommu struct to contain pci_sbdf_t, simplify code
  drivers: Change find_iommu_for_device function to take pci_sbdf_t,
    simplify code
  drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t

 xen/drivers/passthrough/amd/iommu.h         | 11 +--
 xen/drivers/passthrough/amd/iommu_acpi.c    | 58 ++++++++--------
 xen/drivers/passthrough/amd/iommu_cmd.c     | 10 +--
 xen/drivers/passthrough/amd/iommu_detect.c  | 18 ++---
 xen/drivers/passthrough/amd/iommu_init.c    | 39 +++++------
 xen/drivers/passthrough/amd/iommu_intr.c    | 76 ++++++++++-----------
 xen/drivers/passthrough/amd/iommu_map.c     |  6 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 50 +++++++-------
 8 files changed, 130 insertions(+), 138 deletions(-)

-- 
2.49.0


