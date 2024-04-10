Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D689FFF7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 20:42:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703545.1099213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructr-0002Vq-I9; Wed, 10 Apr 2024 18:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703545.1099213; Wed, 10 Apr 2024 18:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ructr-0002Tu-FB; Wed, 10 Apr 2024 18:42:23 +0000
Received: by outflank-mailman (input) for mailman id 703545;
 Wed, 10 Apr 2024 18:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wftW=LP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ructq-0002To-7K
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 18:42:22 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b19a2a-f76a-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 20:42:21 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-516b6e75dc3so9022602e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 11:42:21 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gv18-20020a170906f11200b00a4e1a9e1ab4sm7228404ejb.157.2024.04.10.11.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 11:42:19 -0700 (PDT)
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
X-Inumbo-ID: 10b19a2a-f76a-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712774540; x=1713379340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U5A5WdBeqGTW92Oo4C5cYpBYdiQqmVarWwQ7B0CNpSc=;
        b=p/oQ4AK3sCUy7VXbX+nPvo1HtGtd+UdWbkxnTGpqLwg6dJky/IuLJxPcZJc5osdOlV
         EZ0oD7jaoOtjRU1roZ7JOR/IkjDM43oEsYDCyzs/1HNhaiJAPY1ma8bu2h+TiDVxRzt3
         jpj7hIt7d7w1XIHTVK403xTBTUxoP+sy4jwiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774540; x=1713379340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5A5WdBeqGTW92Oo4C5cYpBYdiQqmVarWwQ7B0CNpSc=;
        b=o/zUHHtLw61Q5iAT2gUWqlC5U5Rj8PVyBIZG6psy2BSebmBmh2gmJQbL/1vdzLCVbp
         CqSaL/fTVaXDe5pR07ZWttcq3Bp2kahVXfksS90QcnfzIBiGQ3/VO1h+Sc0viwOHCCLD
         4EKaDgFpz4kCTTEma+qRZE/Lvb/RL1PTWaIi4sTzqH4idt1fBLoJ1tkYHrk5gYO3aQ4E
         550Mgzecj7CesUsS8xaK64VvfDnXgA4t0lzyC09PzodJtj/JoZCUDJ9es8cBSMLmSqfm
         ZH8/QJ9/moqUCx9ZLXdo+BgNEYV/06orjdbe5mu1aCQMU0GbrdyiCmwG+SfaIB6vMYaR
         tZrw==
X-Gm-Message-State: AOJu0Yz1aNZboqt7bl5nmuX+4Cx2dFyVUMzxZmspWOb9NJ7uliRDVJ8N
	1zgkoX6zOLn3P3IGe0snzufV21wMM9kAHENAER2IeyitGtzlJiNSi1vXWrkSDdZ5lxEEn3Sjm04
	Zu8k=
X-Google-Smtp-Source: AGHT+IFOWHe3EIfjH5zyqnEXwnRx/0x1OGIcx1Kbwm+FuN2oTPV4thkLsB91E35bx2VsXhzRCxQZuA==
X-Received: by 2002:a05:6512:68c:b0:515:c195:d6b8 with SMTP id t12-20020a056512068c00b00515c195d6b8mr2575529lfe.60.1712774539766;
        Wed, 10 Apr 2024 11:42:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 0/4] xen/arch: Simplify virtual_region setup
Date: Wed, 10 Apr 2024 19:42:13 +0100
Message-Id: <20240410184217.1482366-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is nothing that setup_virtual_regions() does which can't be done at
build time.  Make this happen.

Importantly, this removes logic from needed prior to setting up exceptions.

v2:
 * Only minor changes in patches 3 and 4.

Andrew Cooper (4):
  xen/link: Introduce a common BUGFRAMES definition
  xen/virtual-region: Rework how bugframe linkage works
  xen/virtual-region: Link the list build time
  xen/virtual-region: Drop setup_virtual_regions()

 xen/arch/arm/setup.c             |   1 -
 xen/arch/arm/traps.c             |   5 +-
 xen/arch/arm/xen.lds.S           |  13 +---
 xen/arch/ppc/xen.lds.S           |  13 +---
 xen/arch/riscv/xen.lds.S         |  13 +---
 xen/arch/x86/setup.c             |   2 -
 xen/arch/x86/xen.lds.S           |  11 +---
 xen/common/bug.c                 |   5 +-
 xen/common/livepatch.c           |   7 +--
 xen/common/virtual_region.c      | 101 ++++++++++++++++---------------
 xen/include/xen/bug.h            |   6 --
 xen/include/xen/virtual_region.h |   7 +--
 xen/include/xen/xen.lds.h        |  17 ++++++
 13 files changed, 90 insertions(+), 111 deletions(-)


base-commit: 0e7ea8ca5fc9bce9248414f6aaf2dc861abd45d9
-- 
2.30.2


