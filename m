Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105415B17C0
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402879.644810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHl-00045F-BD; Thu, 08 Sep 2022 08:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402879.644810; Thu, 08 Sep 2022 08:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHl-000421-8S; Thu, 08 Sep 2022 08:53:21 +0000
Received: by outflank-mailman (input) for mailman id 402879;
 Thu, 08 Sep 2022 08:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDMa=ZL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oWDHj-00041V-Ml
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 08:53:19 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae351f2c-2f53-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 10:53:18 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id j12so4797663pfi.11
 for <xen-devel@lists.xen.org>; Thu, 08 Sep 2022 01:53:17 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 a5-20020a631a05000000b0042aca53b4cesm12224826pga.70.2022.09.08.01.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:53:15 -0700 (PDT)
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
X-Inumbo-ID: ae351f2c-2f53-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=xGa3uC0LWpY1eD3WQacLY+7N8nGdt9PnSFaO37iASVk=;
        b=di6Svf21bJV7RRzsBtgxOODwz0k1O2WyKc68rnXcm8Nb9b8cGhWRtslEXDWeYXQ6NI
         hmMpg4Fx8ZpBuAXRbqvLbga6fiJt02ZYVCwUAaJJCY1xCFFYv7MJVtzXp3+n8swMJ0kO
         GzunWT9GahLv8EGaUY++PaG/SdGiJEslezuTGnHhdy48t+id8W5DhCYc1T3Hwir9LHbQ
         ztCxPg/84ZBcoXqCTG5HTlwLZDpymohQEU/BHX8vTpDiLL/b5RaDtEu/x67TcLeFZiyS
         6zP2yDOBy71cNSjGpGaUfvxpCBA7TdMYrGCWwVxg1YlEjOAxrNIltGe7mE9pvSkXavQG
         suiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=xGa3uC0LWpY1eD3WQacLY+7N8nGdt9PnSFaO37iASVk=;
        b=bvjmKfYkm/uFi5aS0FYvyIve3Zgu5NaSif192GarWYXosFRp2UEX5fx0C+zrTzRp1A
         MyV2+kdWwucnNl93ReegM1sV2rEefL0ycPTIrNcR3FznybBMwgP9qR/gJuhU88Nl2bjQ
         +jkWvvWj8PEg7q7R66+2siB/pNI8xlqS42QotWe1HKlSOEoDYFOGJexoyW8rhBDCXZmS
         eoBWJAQehDISHghIv+EdEAd1GWB2qvMcbzT3mbq5Pe9YD+sLvXJuCVl40U8Ok5WAsbJb
         HvoKhxN0oRaOORgTs5O4074QlJRZ7a0mD69HHp7cwfZLPSnrfDeEO6R4/wBeLD7ZYBzs
         1fHQ==
X-Gm-Message-State: ACgBeo2rwC+nOt7TugpGL3CfDsOqfEVl4PlGggCxSVNGJMgX6UemkIkU
	4xAeCbUyUAeSUF8LY0sLx5GQEs1QXFhedQ==
X-Google-Smtp-Source: AA6agR5piNhUBkvnWaDtBb4tOPKnULctTEjTnRVrpWN2aJsq/irxqJlaWnyfsPMA0ONiQFCQWeFlFw==
X-Received: by 2002:a63:6cc1:0:b0:42b:d2c5:74a2 with SMTP id h184-20020a636cc1000000b0042bd2c574a2mr6831569pgc.420.1662627196423;
        Thu, 08 Sep 2022 01:53:16 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH V6 0/3] libxl: arm: Make generic code independent of disk device
Date: Thu,  8 Sep 2022 14:22:58 +0530
Message-Id: <cover.1662626550.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This was earlier sent as part of a patch series [1] adding support for GPIO/I2C
virtio devices. The device specific patches would require some rework and
possibly several versions, and so this series separates out the generic
independent patches into a series of their own.

This series makes some of the generic code independent of the disk device, since
it can be used for other device types later on.

Rebased over staging branch from today.

V5->V6:
- Separated into a patch series of their own.
- Updated commit log of 1st patch to cover all changes.
- Rename make_virtio_mmio_node_simple() as make_virtio_mmio_node().
- New patch 3/3, separated code from device specific patch.

--
Viresh

Viresh Kumar (3):
  libxl: arm: Create alloc_virtio_mmio_params()
  libxl: arm: Split make_virtio_mmio_node()
  libxl: arm: make creation of iommu node independent of disk device

 tools/libs/light/libxl_arm.c | 83 +++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 26 deletions(-)

-- 
2.31.1.272.g89b43f80a514

--
Viresh

[1] https://lore.kernel.org/all/cover.1661159474.git.viresh.kumar@linaro.org/

