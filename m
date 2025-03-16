Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9AA634F4
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 11:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915995.1321181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvT-0004Nn-CL; Sun, 16 Mar 2025 10:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915995.1321181; Sun, 16 Mar 2025 10:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvT-0004LT-83; Sun, 16 Mar 2025 10:08:59 +0000
Received: by outflank-mailman (input) for mailman id 915995;
 Sun, 16 Mar 2025 10:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZWB=WD=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ttkvS-0004LN-9z
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 10:08:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac280b35-024e-11f0-9aba-95dc52dad729;
 Sun, 16 Mar 2025 11:08:57 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso7266295e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 16 Mar 2025 03:08:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc4173sm73909045e9.20.2025.03.16.03.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 03:08:55 -0700 (PDT)
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
X-Inumbo-ID: ac280b35-024e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742119736; x=1742724536; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvlW/Hcr+qRIzyj9QqwwAjZiRymL8CjizLEJw6YDF5c=;
        b=MuSxCflvceNBM6GI1oehGZhAP4QsrPrZ2vFT94dcL0KVadRKMevILRCc/dj/E+0TXY
         2MhmafXdhsN/PuuoZYrh5+kkyPN95/jiUZWUbBOt+OYPJAWzp8kndttQrvibiigeCFHc
         XsWoxAsfnWQVGXLRYaIxmTMD4XB5x5wukKGCTcaiZpLM2UBXS0fvDoCmOSnbpMHXeMH9
         YiwZrfq7ictcTXc6ZxYOlD4DfO9VHVzUrgUum8PL4H7bFHdvPxJg/JwsDqR7SZ3+ghn6
         CplZLbU5kRfQB0EE8Rn+RCV+cDPyGkWQ9SboVQTzmthpqHpib1YZg48cS7Kc46EYVJxK
         PdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742119736; x=1742724536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvlW/Hcr+qRIzyj9QqwwAjZiRymL8CjizLEJw6YDF5c=;
        b=XNu/d7hdwhDRfz2NFTCWRLKXADCvDeZyvlCxUS+OHtIx7YhZgQJ5wXsl5HukSY57Eo
         +xk4EDjtNrdey8AwAplZ10A1rvpEfdq9SCOi4Ot9/LBBWl5joqubpfHCLyPVrbI1yD28
         Ju4/zkjuwJzbTGG8/8q7jRDsnzHXdKMr3SVDnSsGs0ZRLKo53Qp6qP0SHAlgNhAxmfDW
         jQ95AY59JHfiK1XgimxJ/rTGWIzuuyAJzoTD1UdLCL6FxW76PsJFfGtVrkKFtMoC/rGz
         waeiyofjjiYavam8/8sosi/raBtKzC7YATIMnWh/TaF8FNy4JjPGW5A0d9HRgxhe06Oq
         hxQQ==
X-Gm-Message-State: AOJu0Yzd7e2V5ljrzX60tQoj2L7p0U6JedjYkOdIWJgiO1B44xYEG3gH
	UCkO0u5E09FKUP9yVPM6xvbOMoLTYQu0JI9kDJtgDHDe8Fjdmw3shstSmkly
X-Gm-Gg: ASbGncu9JylcmB2jGApD2SVUmELWphnCOH5DfJu7mVW+pUX+tU3mP0O9wybMDy/qwwv
	4y8xVExxAD9Q1Aet1i49LaEQrg+g2fIEzdjhg7z11VYa9N1AUGZ3cSSExGMf/tOaWoIlDr/nVkj
	YmqYqcNaZgE89R3CtrYAEMbUNUMRs0zsmUSKVOWH3MMMz4dSscp4Vjc7wdOf/VqPnKJw5Xn4Il1
	WTH1ipJTTxQN4Fmx0dzMU1p99sVjH6bM9ANww+3rXW0Cd4qfIpySzXOCzhWPA/DBye5AX/dC/ji
	XIm6FArmd2dc6G69o1WXdP3ktx5rdnbm1fIz1vamCcNHrzgAdFtW8QdBZDqBVvqcEFBtHxhTkmU
	icJxdG+cJwPFJyZBcrRZ7CKsPCQ5ES5BvAXWa8tjEPius
X-Google-Smtp-Source: AGHT+IHOpA5VQRkcgRhJvbe+3eVEb8Risp3e699RqmW7D87tyIp+Nr7/CgM9dgcP5MV5V80q3kS5Rw==
X-Received: by 2002:a05:600c:3146:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43d1ecb33b0mr95008205e9.12.1742119735734;
        Sun, 16 Mar 2025 03:08:55 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 0/3] drivers: Simplify handling of pci_sbdf_t in passthrough/amd
Date: Sun, 16 Mar 2025 10:08:48 +0000
Message-ID: <cover.1742063500.git.sultanovandriy@gmail.com>
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

 xen/drivers/passthrough/amd/iommu.h         | 29 ++++++++++---
 xen/drivers/passthrough/amd/iommu_acpi.c    | 14 +++---
 xen/drivers/passthrough/amd/iommu_cmd.c     |  6 +--
 xen/drivers/passthrough/amd/iommu_detect.c  |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c    | 27 ++++++------
 xen/drivers/passthrough/amd/iommu_intr.c    | 48 ++++++++++-----------
 xen/drivers/passthrough/amd/iommu_map.c     |  4 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 32 +++++++-------
 8 files changed, 88 insertions(+), 74 deletions(-)

-- 
2.48.1


