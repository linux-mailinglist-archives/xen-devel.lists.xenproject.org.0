Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53928A82D4
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707420.1105308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45R-0006OF-3x; Wed, 17 Apr 2024 12:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707420.1105308; Wed, 17 Apr 2024 12:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx45R-0006LL-17; Wed, 17 Apr 2024 12:08:25 +0000
Received: by outflank-mailman (input) for mailman id 707420;
 Wed, 17 Apr 2024 12:08:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bxKY=LW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rx45P-0006LA-Dy
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:08:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f9aed7f-fcb3-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:08:22 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso687152266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 05:08:22 -0700 (PDT)
Received: from EPUAKYIW03DD.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 zh17-20020a170906881100b00a5271ae4458sm3484247ejb.16.2024.04.17.05.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 05:08:20 -0700 (PDT)
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
X-Inumbo-ID: 2f9aed7f-fcb3-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713355701; x=1713960501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj+H5vwl0pa2TUiDvvfE1wpuZQMEDkB+YDup88Wnsdk=;
        b=LkfKqBhnJcoFi3x2CCHT9Ov0+uCAxysu/ogL0P8lHOU7IpXssbyQkYOhlc8LEZN5lZ
         vCRhmMrDWtilW2FTiVOEnIMJF6j2QuXN61laoOqlNGMxCtv9osfg548wd/Iq3H0pc7zv
         atsFC+cc7gXs2mL2wUmRMJqr7rBGSxZrz3IrPP+/3IXvPhXjzoOJhE0V6wQrE/aOJ7KX
         yE3cqk0dCfpmUK4e1239/rm5BbckJAkUt05PjxYNl549a7m6e6tcthEAh+8WNrZA3k11
         D0AbP6CBqKgjdfSGPkQhtAbJE+mRpVwv+qcWfHY0+Y9vt8dVl9RWDYEr018LX2B2D5oQ
         yIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355701; x=1713960501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sj+H5vwl0pa2TUiDvvfE1wpuZQMEDkB+YDup88Wnsdk=;
        b=l2qJQJ2pjnLdChQKSTP+GCU6ks3x+VdGP9IUQxOMa48/QRbAHr1TKKsPaEcrPReCaP
         uTksG7vqjk7Av79UIUd99AJpCfltOx3bFBlbuWgft/OhBksjwLDW9IIoKMfyenDr+s1m
         lUAnPVYsKYOvoA6+zMnvLLpaoo9VzRY+rGjEVFvL1Qzxz8Cvbr7TbJbK4iOKRv7HwjS7
         VT073YwBP8XtvFnyZ6OEmpZ0lWalopCEjdFhAZavmd6sOmEoEKK1K3oOULfRQOcGdSHr
         h5y7uWgpPoXeChTwRyA/4AmSRbjrAyZ4dDBWS974TbP0jshk+SFlKQCp2+7ZUEQa+Dzo
         1vZQ==
X-Gm-Message-State: AOJu0Yx396jLroX7cFiRkgwDoa+9RJMxLymm1Az1LZOLoqBMt9lEwBGt
	cQQFR/xP8U0TL3hpj7AbsgqBetEbSZtt7neKL2QnceWevfcY14LNcMCQcg==
X-Google-Smtp-Source: AGHT+IHgvlBgq5xAW5g3CzrY4Kb1gOyYSbmbIn43vzPE+6X3QJNTdS3x4+orfc8sNBIf55qB5NM1AA==
X-Received: by 2002:a17:906:b0a:b0:a52:5125:9723 with SMTP id u10-20020a1709060b0a00b00a5251259723mr6772454ejg.71.1713355701097;
        Wed, 17 Apr 2024 05:08:21 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [ImageBuilder 0/5] Misc updates for the dom0less support
Date: Wed, 17 Apr 2024 15:07:36 +0300
Message-Id: <20240417120741.2453431-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all,

this is a collection of patches (#2-5) for improving the dom0less support
and a patch (#1) for dealing with uImage.  

Oleksandr Tyshchenko (5):
  uboot-script-gen: Update to deal with uImage which is not executable
  uboot-script-gen: Extend DOMU_ENHANCED to specify "no-xenstore"
  uboot-script-gen: Add ability to specify grant table params
  uboot-script-gen: Add ability to unselect "vpl011"
  uboot-script-gen: Add ability to specify "nr_spis"

 README.md                | 29 +++++++++++++++++++++++++----
 scripts/uboot-script-gen | 35 +++++++++++++++++++++++++++++------
 2 files changed, 54 insertions(+), 10 deletions(-)

-- 
2.34.1


