Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDABACBA71
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 19:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003738.1383336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9Ey-00048I-5v; Mon, 02 Jun 2025 17:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003738.1383336; Mon, 02 Jun 2025 17:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM9Ey-000457-1t; Mon, 02 Jun 2025 17:46:28 +0000
Received: by outflank-mailman (input) for mailman id 1003738;
 Mon, 02 Jun 2025 17:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM9Ew-00044r-AF
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 17:46:26 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 803073b1-3fd9-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 19:46:24 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a363d15c64so3307058f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 10:46:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f0097539sm15997416f8f.63.2025.06.02.10.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 10:46:22 -0700 (PDT)
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
X-Inumbo-ID: 803073b1-3fd9-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748886383; x=1749491183; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n55XkaNDtS0SBcOaVPitenhrD4U358oguWrJtotdbW4=;
        b=BpscjNS8shL1Vt/FSBTn5MZjkfG9h+IXh1DnbArmcfBsDH2CGkjHZm/C1OhHBM9uFG
         kZw8QVU2wuK7HsmP1WYFILrqFbpTDbvs1eHAqAKbRI5S/qQdv+Z/ZwmElVH4qaEZSEv+
         Obqq3mnXSPRMQ9q74AtQXjXL71msej4yRcdxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748886383; x=1749491183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n55XkaNDtS0SBcOaVPitenhrD4U358oguWrJtotdbW4=;
        b=E8TmeiyTgRwVc53ddcnjaKAGxaTAcojWGDH3Yo2ikgoWG0aY58fz79uoVTZf5drFKa
         Dv2cpo7SOQJzxmbijOTN6/GaA1iJw3H2Vq29+L9hHtZhFVYSCfnChxUpSD4WwwB0NhUy
         Fi+KTVdH1EkUcP+ycCjNl4uqKUHGfxQAKOtd+lgxA2r4hmeKT2swu8AOdFcbxvE1ecHS
         4fGb+bv+53et3TDBMSRuZWV+V/uWECI3ocmUy/2SztpFpubnEUsCWYj55jioV+0NPKah
         eVSDdKb0oCpOrGx7s27HcpNiOJWogTSBuhiEs/IqtbTWLu7QBi1/AyP4tgzDZ6fU83Kg
         DOOQ==
X-Gm-Message-State: AOJu0YytHjLoujTrbKufK5ed28+9jY79ArfztDzi7airhSUnnADeqKGE
	4QyrEsIi9fbpabpWvkCyj4qYMjK90SDlfSZJZ8fSXYuiDcSTS5lHZyoQTZ3BOw/+/u90dWNLEE3
	+2nY2
X-Gm-Gg: ASbGncutAEoyZ8kc1y3li9fvUbw5K0gDH+WQpR9yJvWcxfNEkT7fErfNretp4A5dZZT
	T/tR1sRNfh1jiAHnjimT9oJuXFmZ9lfdiNBgp3QJ7tO0+UUarTxUDWe8w51eRbSzoSu8jRH5lnA
	wpkAN3JDEADGLOQ4KfloMQpXRB71lypdiavHh3AiPLgBdbH36rEOKTQH+wQyfa3ScHcg3G0y3h2
	U63hkLMR2BAjy2Q31cjVbvP4A3a0sU9jsgRvUqkH/srQ5+MHueV1XPnOQjl/huak6vwPVmw8dRe
	1e47F1+HIYcGwCehURFDypz1OTvvXk98M5O9YE+XMG76ML/Wx0eLIth1KKAFI/NdTLl7hFz67JU
	P2EKbDDWikZ4aatDiDvdaH8AZ
X-Google-Smtp-Source: AGHT+IFw0uNb/P1wamNl/u1GHVGpfzuHmIBf6DKXNXSlPhpxkLbX8yLKNbHiUBNUH4Zoo8Dm+LtXMg==
X-Received: by 2002:a05:6000:2c12:b0:3a4:d64a:3df0 with SMTP id ffacd0b85a97d-3a4f7a025bdmr11418782f8f.4.1748886383330;
        Mon, 02 Jun 2025 10:46:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 0/2] CI: Improve domU handling
Date: Mon,  2 Jun 2025 18:46:16 +0100
Message-Id: <20250602174618.2641439-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Improvements to domU kernel+initrd handling.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849446456

Andrew Cooper (2):
  CI: Use bash arrays to simplfy dom0 rootfs construction
  CI: Adjust how domU is packaged in dom0

 automation/scripts/qubes-x86-64.sh            | 35 +++++++++++++------
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 34 ++++++++++++------
 2 files changed, 49 insertions(+), 20 deletions(-)

-- 
2.39.5


