Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C134338AAA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 11:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96985.184017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfSE-0002F2-Da; Fri, 12 Mar 2021 10:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96985.184017; Fri, 12 Mar 2021 10:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKfSE-0002Ed-9Z; Fri, 12 Mar 2021 10:55:38 +0000
Received: by outflank-mailman (input) for mailman id 96985;
 Fri, 12 Mar 2021 10:55:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tO+b=IK=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lKfSC-0002EY-3S
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:55:36 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95b65677-ee28-4161-8616-1e16a3e92edf;
 Fri, 12 Mar 2021 10:55:35 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso15521062wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Mar 2021 02:55:35 -0800 (PST)
Received: from dell.default ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id q15sm7264962wrr.58.2021.03.12.02.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 02:55:33 -0800 (PST)
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
X-Inumbo-ID: 95b65677-ee28-4161-8616-1e16a3e92edf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U8krqYE8Ef8qnGsiAipJzGQpaVm5t8lDtkhTxaSOQf8=;
        b=yo+0Pv1vGiiRr+BRTMkp3T9EiYl7WyqiXEjQPicDPEauSFiYyR62sktJewMDa8dedY
         TtEdyo/qjJQ2oVaYRSQ7M53MZM7dmCSqleG5phx9kfrPM/3iQZKaUrptoZGtnKshKPhT
         k8vBK+orZOsk37DTLhw4a5zMwn0ZRe0W0KpUJE4c2vUJnFGNzRTKNOrfj7BUVsMiySCS
         KpG8zUZke0l4urksnmr+8FXqKdvK/LQQp9twKzZeG5Anzi66F3YJXeBbnAbLfyEs9Mdm
         33HdF8a5+NO+J+PGn7XcVBn02oWNoEAEpdVHkH2yt2jK9lzPK6A0zywtAJ78xDs41uwS
         Okkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U8krqYE8Ef8qnGsiAipJzGQpaVm5t8lDtkhTxaSOQf8=;
        b=FRKQxEfjd3N7meeRxL+j+cYRItB4plqcPiBWx7oAKOqPShhcx/hnkJ0bo29XuvM9o6
         RqgidPrasTFSu1MFIozncQN86RNJ+S1WLgDxkm8bgK/N3OfddpvlW7cNOhbldsFtE/wo
         kMclPVJ5twWCXTsn8crUiMFvBgGAuaCpeY4zRz+Wt1a/5IQrDgkLw+gnsIE2UFd2m3Rv
         JdLYlUi9Yjc0cWVxk15gp8HV7u72J9HUr5BO4lHLtAZNCADNmrMQW1rwoPzp5Pwn73hJ
         fkVyLrvZv/yIDHCKgeku5sP4nFMD++K0ia24DSr5BrW9a7ihzKnoe1iWSJLYnk9Q1D3d
         jx7Q==
X-Gm-Message-State: AOAM530xC24Ki4RA4w+M5cCh6atWzRc4duquiybhvygjnXL8ePnB85xJ
	AWzY7LUPxaKARj0YnHyXXxB0SA==
X-Google-Smtp-Source: ABdhPJwGy2yiZng+8p42AiTsODzcXCoCU2A55jsurjv+Rkg7hZ8K/NGYGP3VtK/HkA0LP08aOZ4tBg==
X-Received: by 2002:a1c:7e16:: with SMTP id z22mr12397544wmc.74.1615546534304;
        Fri, 12 Mar 2021 02:55:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	drbd-dev@lists.linbit.com,
	Jens Axboe <axboe@kernel.dk>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org,
	Philip Kelleher <pjk1939@linux.ibm.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 00/11] Rid W=1 warnings from Block
Date: Fri, 12 Mar 2021 10:55:19 +0000
Message-Id: <20210312105530.2219008-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (11):
  block: rsxx: core: Remove superfluous const qualifier
  block: drbd: drbd_interval: Demote some kernel-doc abuses and fix
    another header
  block: mtip32xx: mtip32xx: Mark debugging variable 'start' as
    __maybe_unused
  block: drbd: drbd_state: Fix some function documentation issues
  block: drbd: drbd_receiver: Demote non-conformant kernel-doc headers
  block: drbd: drbd_main: Remove duplicate field initialisation
  block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit
  block: drbd: drbd_main: Fix a bunch of function documentation
    discrepancies
  block: drbd: drbd_receiver: Demote less than half complete kernel-doc
    header
  block: xen-blkfront: Demote kernel-doc abuses
  block: drbd: drbd_nl: Demote half-complete kernel-doc headers

 drivers/block/drbd/drbd_interval.c |  8 +++++---
 drivers/block/drbd/drbd_main.c     | 30 +++++++++++++++---------------
 drivers/block/drbd/drbd_nl.c       | 17 ++++++++++-------
 drivers/block/drbd/drbd_receiver.c | 26 ++++++++++++--------------
 drivers/block/drbd/drbd_state.c    |  7 ++++---
 drivers/block/mtip32xx/mtip32xx.c  |  2 +-
 drivers/block/rsxx/core.c          |  2 +-
 drivers/block/xen-blkfront.c       |  6 +++---
 8 files changed, 51 insertions(+), 47 deletions(-)

Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: drbd-dev@lists.linbit.com
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Joshua Morris <josh.h.morris@us.ibm.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: linux-block@vger.kernel.org
Cc: Philip Kelleher <pjk1939@linux.ibm.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
-- 
2.27.0


