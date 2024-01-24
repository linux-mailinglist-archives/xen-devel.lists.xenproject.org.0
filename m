Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359BA83B041
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 18:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671177.1044392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShHr-0003h2-Fz; Wed, 24 Jan 2024 17:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671177.1044392; Wed, 24 Jan 2024 17:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShHr-0003eq-CM; Wed, 24 Jan 2024 17:43:43 +0000
Received: by outflank-mailman (input) for mailman id 671177;
 Wed, 24 Jan 2024 17:43:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rShHp-0003ef-Ka
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 17:43:41 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb8f327-bae0-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 18:43:39 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e800461baso68570865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 09:43:39 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b0040e527602c8sm354667wmo.9.2024.01.24.09.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:43:38 -0800 (PST)
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
X-Inumbo-ID: 1bb8f327-bae0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706118218; x=1706723018; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ktZPZB25+rNGngPEJC3SNP1hcPRwFDLAedq3xcvo5U=;
        b=EV/qU6VbObYCcC/NbbBhlTqiHAdvIe7FMkF4Iqxlas80IalZbFsGland8jvxXMJ64x
         qpfXu1f9SoUdr/MNHSRlMf3+bmnVYa/8KIu945tswVW1RCQ9jwiD66fNKJonXbSixtl6
         VGd6+7IAoFZpiZzB7qpj2j6Ph70Hfh1Qpin4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706118218; x=1706723018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ktZPZB25+rNGngPEJC3SNP1hcPRwFDLAedq3xcvo5U=;
        b=UYnUjBbJA8BzsPwk6PsIm5OOCdq6owDt0GnlrnmF+hjYayyBTcYllgfLQaVKiriR8U
         y/sp2377/JFNwtda3A3fz/ng8ePeRjcvv6Un4YqXd6peeBlpRjpipv+xD00tLAbzkFoF
         WgSyQiHVC8QYi+oe4Wt7pJ4W1mRGO4VuJ43dkfmEb9dJ49ckECv0US7+neVE1i/uipot
         EqbyRIZ+aZStDfD9VlxsRDXj5a1VwAzs+ZDKkzdQ26c2V0V1F023uwIaUOUdsRqBqB97
         kfChf/pMiJQ9/lCZFaO/vI3hXJM2WlIRFmLO5Fw7OAVq4VpW+KhLzJEc+m0URgqPtwLS
         BkBA==
X-Gm-Message-State: AOJu0YxmPHuLCRJw63/1plE6DC7zfpP7betMi1hdnWHoichEB3qvv8L6
	nFlqHRUmls5dBFtJR1LJJ9VQjxtrlB2Vc/fyxBWM2QTSc7JcYaj4mj1Sz5GAOpfOIsxc5LJvQdz
	4
X-Google-Smtp-Source: AGHT+IGYaUOoQLyPKqq8U01f2eZx0W5MiQAdNqHxbMGItcNIuiBqT0zpODnmZdY+i7h2Bo4OmhjG6Q==
X-Received: by 2002:a05:600c:3b0e:b0:40e:bfbc:76aa with SMTP id m14-20020a05600c3b0e00b0040ebfbc76aamr827255wms.188.1706118218550;
        Wed, 24 Jan 2024 09:43:38 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v5 0/3] x86/iommu: improve setup time of hwdom IOMMU
Date: Wed, 24 Jan 2024 18:29:50 +0100
Message-ID: <20240124172953.29814-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to reduce boot time setup of IOMMU page tables
for dom0.

This patches rework the hardware domain IOMMU setup to use a rangeset
instead of iterating over all addresses up to the max RAM page.  See
patch 2/3 for performance figures.

Jan: I've kept your RB in patch 1 with the off-by-one adjustments, and
dropped it for patch 2 with the addition of the default label in the
switch over the e820 ranges.  Such default label is required to continue
to deal equally with the  ACPI and NVS ranges.

Thanks, Roger.

Roger Pau Monne (3):
  x86/iommu: remove regions not to be mapped
  x86/iommu: switch hwdom IOMMU to use a rangeset
  x86/iommu: cleanup unused functions

 CHANGELOG.md                        |   2 +
 xen/arch/x86/hvm/io.c               |  15 ++-
 xen/arch/x86/include/asm/hvm/io.h   |   4 +-
 xen/arch/x86/include/asm/setup.h    |   2 +-
 xen/arch/x86/setup.c                |  81 ++++++------
 xen/arch/x86/tboot.c                |   2 +-
 xen/drivers/passthrough/x86/iommu.c | 196 ++++++++++++----------------
 7 files changed, 146 insertions(+), 156 deletions(-)

-- 
2.43.0


