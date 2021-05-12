Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801637B2EE
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 02:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126087.237346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgca1-0000ma-5W; Wed, 12 May 2021 00:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126087.237346; Wed, 12 May 2021 00:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgca1-0000kj-2M; Wed, 12 May 2021 00:18:25 +0000
Received: by outflank-mailman (input) for mailman id 126087;
 Wed, 12 May 2021 00:18:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+k7y=KH=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lgcZz-0000kd-6p
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 00:18:23 +0000
Received: from mail-io1-xd35.google.com (unknown [2607:f8b0:4864:20::d35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 028b1b94-275e-4a28-bc0b-a451201d550c;
 Wed, 12 May 2021 00:18:22 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id o21so19562862iow.13
 for <xen-devel@lists.xenproject.org>; Tue, 11 May 2021 17:18:22 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id v4sm8241490iol.3.2021.05.11.17.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 17:18:21 -0700 (PDT)
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
X-Inumbo-ID: 028b1b94-275e-4a28-bc0b-a451201d550c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXSeR9jPw54X42/hzVCKnW9V7a7Fp/RB7jF7rnjCJUw=;
        b=cPTkppKtPOrkAZ6nQARylT++pk44Lspab5bF4Y1dwmuQBYjN0Y3UuyDtFNRJx0iBpg
         9EHv6UTLsMbWxIJN3z9MPof9z9kmZE5mn3oRoU7l/paKObQqQY0DTK3GBr8Ys1CwM52V
         Ee1MxtvuDQLEH9HCoGgOCOueH024l3lX693zvuJtJeynCSOleAkV6uSYs/nnzUjCTvvU
         UVxynsT469vDP4YHIsKNmIOYKFSX2A4ZjZDC6OLL49vg2Tz+mQ7gH9GUfIuT5tM+7HqS
         4FN/Ba9X3JFWYRvBn6fdHSsH/GGtZjvqJcp/2tekEeP2dLEU4N1oubuqc+iLj+f8Huu6
         TCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXSeR9jPw54X42/hzVCKnW9V7a7Fp/RB7jF7rnjCJUw=;
        b=B0Yppvy1ltekFEI+taFdWImDiHBDkzk76+Cxvk+QqB3uyGGnn1dxynCt+pwTffeXzn
         S7xGRr0mrqFmzJNoYodCazlCx7VzHjpjsrB2ZuMpxU2CmQTUoWpHAWj9PbveTFq7mEvy
         MknbFJlrEWekbmt1lgOaPEyzBsJCkcwL+29E19KaQwqOaJlbADeNnpQj/pghp/oTK+bL
         eDxyu8/mb/yIvK2kWsGhWMk3fge7FLfi56IAn92lVsDDSJ/C/WPgaG/ZxvRq3py5F+G7
         F/e+IzxOylac6wPnqap6XWIPDMUZCvlcb8ibwJ9leMjARzSZxReTzKND4g1FDpKtNJ3A
         mTWg==
X-Gm-Message-State: AOAM532j2pKh+Oa2kcMpVTiC01dIG5wNf4LaGxXB02/8RwrcvPa1mNRH
	OhfXFQ/mdhLpzM1hdlTcNGA=
X-Google-Smtp-Source: ABdhPJyGzEtP2429F0wetqYLv9fqk0nL/tFbD9fe/i3vDjKMOECPsuDdTpSelI1bEV3hT45X4JMc9A==
X-Received: by 2002:a02:1c81:: with SMTP id c123mr30707808jac.42.1620778702074;
        Tue, 11 May 2021 17:18:22 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Connor Davis <connojdavis@gmail.com>,
	linux-usb@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee.jones@linaro.org>,
	Jann Horn <jannh@google.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: [PATCH 0/3] Support xen-driven USB3 debug capability
Date: Tue, 11 May 2021 18:18:18 -0600
Message-Id: <cover.1620776161.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This goal of this series is to allow the USB3 debug capability (DbC) to be
safely used by xen while linux runs as dom0. The first patch prevents
the early DbC driver from using an already-running DbC. The second
exports xen_dbgp_reset_prep and xen_dbgp_external_startup functions when
CONFIG_XEN_DOM0 is enabled so they may be used by the xHCI driver.
The last uses those functions to notify xen of unsafe periods (e.g. reset
and D3hot transition).

Thanks,
Connor

--
Connor Davis (3):
  usb: early: Avoid using DbC if already enabled
  xen: Export dbgp functions when CONFIG_XEN_DOM0 is enabled
  usb: xhci: Notify xen when DbC is unsafe to use

 drivers/usb/early/xhci-dbc.c   | 10 ++++++
 drivers/usb/host/xhci-dbgcap.h |  6 ++++
 drivers/usb/host/xhci.c        | 57 ++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h        |  1 +
 drivers/xen/dbgp.c             |  2 +-
 5 files changed, 75 insertions(+), 1 deletion(-)


base-commit: 88b06399c9c766c283e070b022b5ceafa4f63f19
--
2.31.1


