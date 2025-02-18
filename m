Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A2A39AA0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 12:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891272.1300336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLgr-0001nr-Ct; Tue, 18 Feb 2025 11:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891272.1300336; Tue, 18 Feb 2025 11:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkLgr-0001ky-9f; Tue, 18 Feb 2025 11:23:01 +0000
Received: by outflank-mailman (input) for mailman id 891272;
 Tue, 18 Feb 2025 11:23:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zT3d=VJ=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1tkLgq-0001hu-3m
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 11:23:00 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b975be-edea-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 12:22:58 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30762598511so50724541fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 03:22:58 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309284a50a0sm13506041fa.72.2025.02.18.03.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:22:56 -0800 (PST)
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
X-Inumbo-ID: b4b975be-edea-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739877777; x=1740482577; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yKVUkcGCVuJbpeny62WbTRKgr+w2SR7oWRRbIATlpOQ=;
        b=UNOiisB377gXD4WLJvV7Q2tb5R0apoqQCUXMpjkFR+ZQek1V6FvNONUKAz3aPADYbH
         AsRCboOR82e5o5F6ox0EBth8pH67M4Shllvg7sTY4QDI9fIhZUHWz1iclVonrqCO1hYe
         Qf5l4XCBENpcwQDpqqv0Q9U/VNM+Tr8u2YeO5AsVuM/sgsVl6KrmmQN8sfDZ+jnUtHzc
         hRE7/96JLUk7HkbJXl59HlEW/2V/o/e0skUf5HLvvf9KuNZflGV+sEtCZvcsDPIXOCg/
         qeJi5rpWYeH/DT+H/yUKzFNjRIQO5IaCj8kH4ExKSmzpZ5H2Nn4LpM+UQj5+XQ6XYRw/
         KTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739877777; x=1740482577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKVUkcGCVuJbpeny62WbTRKgr+w2SR7oWRRbIATlpOQ=;
        b=LVEzcxQYFzexlsbSDrt21t8v/UGfShKE6wBzohfVUdUmiFL9EX7COcjqwvPvSL4x8G
         KFwgEsYkRvI103xJHtTtxPCUROjwyMh7o3V8KzwJ41GLmBPbLnXwQ2HyeQaUMjDXWnic
         RRM1f/v+jT1B7krbT2xbVDaQlNNUwNpJC/Iy7ejA+fWRz74lbw/h4a8vWgJzHt2VpwMj
         ldFZFrcuBPEkUgDT5/C/tmn+ShgCBpX8U8WfHQ5T4TqAnGm4+mDFVORyx1Szgkpo95YH
         VG/y+t55FlC49clydo76Sl0N0903jOUXtDG17u/x+CKlNPILUlkqZX6Lv5fqzMfMytf1
         0gsg==
X-Gm-Message-State: AOJu0YwulU9SdsXKS3joqvg+25eGqqG97YE5VkHtCMlTxFQj3mz5PV49
	u1g9Z0e90dSyahYT25eTsioh843l3cUuzN0UZfNQ9BMQ8ht3GGkdat9N51/G
X-Gm-Gg: ASbGncvLcS0IrQZiZVgALFQIXM1s7KOz6Nidd1Yzjg35i7clvfW92l5ytLIW0phq1qU
	8dtltP+hsBhZS33CIxv8CCql+pwL61wm6mUciC8B20G9W4e/h2c1T5oeOE10RutLZqj7lGzVNL0
	MjRwhdl0SddlR/20zwNMTqbNO+CyREhBtanwzkixh7Q326XBRiGGoKaVJtw8hDgbBLv54JGPmPO
	nQVAmvilexx7q44SjTd5PH05mDA75taKWHGiAyAuEZ5yw5a4uCFWBj3liUS6q1WjfjQu3IU5tC7
	2ZvzFfAAJKyb2XonNkjl67CLi0HZIPpr+pzmwh1Gybv1IyTcMZVyxSCkbUTx2JyAXEDTLphpaw=
	=
X-Google-Smtp-Source: AGHT+IHR32/5tJRJBNpyHhRiWs9OQldve8xfcFelKrFTb6AagGxniNyRpeCAtoL19hBRCiwDXJy/pA==
X-Received: by 2002:a05:6512:ac2:b0:545:2d80:a47d with SMTP id 2adb3069b0e04-5452fe71bf3mr5531571e87.44.1739877776673;
        Tue, 18 Feb 2025 03:22:56 -0800 (PST)
From: Grygorii Strashko <gragst.linux@gmail.com>
X-Google-Original-From: Grygorii Strashko <grygorii_strashko@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH v2 0/2] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
Date: Tue, 18 Feb 2025 13:22:51 +0200
Message-Id: <20250218112253.3136505-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

This series fixes incorrect calculation of iomem_range end address in
map_range_to_domain() which is then passed to iomem_permit_access() and
rangeset_add_range().
Those function expect the iomem_range end address to be inclusive
while calculations are made with incorrect assumption it's exclusive.


Output of "key 'q' (ascii '71') => dump domain (and guest debug) info"
before:
(XEN) I/O Memory { 8000-c000, 30000-40000, 47ff0-47ff8, 7ff00-7ff01, c0000-d0000, e6020-e6021, ...

after:
(XEN) I/O Memory { 8000-bfff, 30000-3ffff, 47ff0-47ff7, 7ff00, c0000-cffff, e6020, ...

Changes in v2:
 - split on two patches
 - add "fixes" tags
 - rewording of commit messages
 
v1:
https://patchew.org/Xen/20250214125505.2862809-1-grygorii._5Fstrashko@epam.com/

Grygorii Strashko (2):
  xen/arm: fix iomem permissions cfg in map_range_to_domain()
  xen/arm: fix iomem_ranges cfg in map_range_to_domain()

 xen/arch/arm/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


