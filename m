Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2067802EFF
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:43:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646675.1009185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Ts-0003DL-1c; Mon, 04 Dec 2023 09:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646675.1009185; Mon, 04 Dec 2023 09:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tr-0003Am-V9; Mon, 04 Dec 2023 09:43:11 +0000
Received: by outflank-mailman (input) for mailman id 646675;
 Mon, 04 Dec 2023 09:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA5Tq-0003Ag-Rw
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:43:10 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8882ac78-9289-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:43:09 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40838915cecso43189545e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:43:09 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c261300b0040523bef620sm4775102wma.0.2023.12.04.01.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:43:08 -0800 (PST)
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
X-Inumbo-ID: 8882ac78-9289-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701682988; x=1702287788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvEmeAohoAc4LBfKVFNjk8Z/euUp8xuOkRDjSQf5LPU=;
        b=D0OK5DNKg9bGzbLwpeSrs8sDyJPn03++x6T7tAHsLhaB3YyJcvMYO7jcKeX/7Av26B
         RR8fcMgLBvZKkbDh4IvloJ80AaJUVFHlFQbcd243wN9P4yCmZVd7jVjQRvV+O09i7OUZ
         SUpCXrAcwx8bN/T0++Ldj68X9yBPw3uBPEP4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682988; x=1702287788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvEmeAohoAc4LBfKVFNjk8Z/euUp8xuOkRDjSQf5LPU=;
        b=KqmkjedDFbZO2ooLrRkpClFLz+asykHOI5xj4CNT+vduk2Sc/bL1I6hSnLZNQRJGfw
         PXOQdv7Sg3cXxRhZ1lnbeP+J8gH2X5H8xMJ1nQBcwjIqHzefutmsKEgzKEAcGwsH04be
         ITN21PyK247nG79m4VkFVs0+tAG4ywDvvFWnDX59zf8NJD9EdaTgpvmz3dtdRxvCoZ3H
         xekjCLyhb1PXN1Pk0MOo7aZhwEluqcCDU6Hp8BjyfZkM5jcEYn7II7nRzAFeQd2tVM3B
         GD7LCuEGCXU6imTzWl9oQqwB0UwYyDWGsiUH6DTdTLPImMdwhJvjhgO0dUDy1knJVy6i
         oT4Q==
X-Gm-Message-State: AOJu0YydymYD7Wia6KAfYgscoBpEn1zQXYA9ySSeuaeOVsnzIQqMrL3U
	TeM8lZguTz9kJJjm53/GK8rMe43PIqufEuggwGQ=
X-Google-Smtp-Source: AGHT+IFZ5H+YyfDJWXwVtflFqlhWdBSctf1en6XYsocT/6yPexNkz/oKJ5qhL70otKVUAgeoQ+vpEw==
X-Received: by 2002:a05:600c:3d90:b0:40b:5e59:da6e with SMTP id bi16-20020a05600c3d9000b0040b5e59da6emr2166236wmb.129.1701682988239;
        Mon, 04 Dec 2023 01:43:08 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v2 0/6] x86/iommu: improve setup time of hwdom IOMMU
Date: Mon,  4 Dec 2023 10:42:59 +0100
Message-ID: <20231204094305.59267-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The aim of the series is to reduce boot time setup of IOMMU page tables
for dom0.

The first patch is completely unrelated leftover work from XSA-445, just
included in the series because it's IOMMU code.

Second patch is a pre-req, as further patches can end up attempting to
create maps above the max RAM address, and hence without properly
setting the IOMMU page tables levels those attempts to map would fail.

Last 4 patches rework the hardware domain IOMMU setup to use a rangeset
instead of iterating over all addresses up to the max RAM page.  See
patch 5/6 for performance figures.

Thanks, Roger.

Roger Pau Monne (6):
  iommu/vt-d: do not assume page table levels for quarantine domain
  amd-vi: set IOMMU page table levels based on guest reported paddr
    width
  x86/iommu: introduce a rangeset to perform hwdom IOMMU setup
  x86/iommu: remove regions not to be mapped
  x86/iommu: switch hwdom IOMMU to use a rangeset
  x86/iommu: cleanup unused functions

 xen/arch/x86/hvm/io.c                       |  16 ++
 xen/arch/x86/include/asm/hvm/io.h           |   4 +-
 xen/arch/x86/include/asm/setup.h            |   2 +-
 xen/arch/x86/setup.c                        |  81 +++---
 xen/arch/x86/tboot.c                        |   2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  20 +-
 xen/drivers/passthrough/vtd/iommu.c         |   2 +-
 xen/drivers/passthrough/x86/iommu.c         | 279 +++++++++++++-------
 8 files changed, 248 insertions(+), 158 deletions(-)

-- 
2.43.0


