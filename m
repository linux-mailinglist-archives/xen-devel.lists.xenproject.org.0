Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1F360D17E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429989.681397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMey-0001hi-Cc; Tue, 25 Oct 2022 16:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429989.681397; Tue, 25 Oct 2022 16:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMey-0001fO-9y; Tue, 25 Oct 2022 16:20:12 +0000
Received: by outflank-mailman (input) for mailman id 429989;
 Tue, 25 Oct 2022 16:20:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8WBn=22=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1onMex-0001fI-2G
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:20:11 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e57c1c95-5480-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 18:20:10 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id b8so10978773ljf.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Oct 2022 09:20:10 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a2eb550000000b002770302bdffsm540136ljn.105.2022.10.25.09.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:20:08 -0700 (PDT)
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
X-Inumbo-ID: e57c1c95-5480-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s53x+nJuJzQXZZ8xIG3UoaBPvSj9GLUN61aOWqvjPbk=;
        b=fmlyNG02R5wPSQmaT7mCq+Tp1GXMFdyykFhnVmxVFKgk2bP+7H7mUuRdls1ejlfymv
         nwAbpLqSS4xWyJoKQ79Y47SFIikXg/70YNcmnF5fMiy+5BHQzMKfQJ/N2qR085/5+wYk
         CO+BIjE0lTKTWB2xUGnEBOmC8ul0XMgwdlrLEDojS29H+k9RX4vGj4MDy5SxjMy4MOTi
         0BKdT0jYgyAf6+KhrBvxMY8JYcphKs82gCX9r/twr2yH1P8ldvltwfOKIHj1yMZRExRw
         wLJ1p41G4IZXkpwOwXybJzpzSGdYs6VaOseQtcLhJKV1pp1zvksgE3qaJHaNpldd/3ha
         IIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s53x+nJuJzQXZZ8xIG3UoaBPvSj9GLUN61aOWqvjPbk=;
        b=INl0s51BukIiy2Fqo1Kro8uDuVX7HiicBeugs2bMNW5LucOv13/FIVOyecCzTqYrDz
         XFR2GxHpnp+/ejUshsfa1tNCHCUXfZm7MULpQrvlSgnEKrTtAw+6J2RuLTnpt3DJIq3i
         byJixtcSx0DZaDgRrvjbrcWIeTDMEQzWDpN5JOccJ2qulFvDSg0oAWsiXuUjT5kvfLn9
         d4iQaZB0Ga/KTE1mn3x+HQ9kOo5eMB8Y4J7yfjylGWm0L3kM/Hsu7HYudl/yMSWkYHb2
         XpYGGKZCCpdZU4bGUP6bG+u+ldxvfRSqgD8Rp5kHZ7F8TRW2qpxPwXnQAH2XjmZtW6Q5
         eE+Q==
X-Gm-Message-State: ACrzQf1Zp8jI57fNcc8qg+/DklrRs4wuTHt2lZeFt+sdAbFyQnPKkgZb
	mO9xqrbGq5u9aQW+r5GL5xlDdmqlVPk=
X-Google-Smtp-Source: AMsMyM6faqKizlNwmmsyhdfdxjCXQ6dkHWEVrkrCBzAwMgu6P/AcUuOk+eV32z0fVYbZdVn+Qd7yNQ==
X-Received: by 2002:a2e:a910:0:b0:26a:ed13:cda6 with SMTP id j16-20020a2ea910000000b0026aed13cda6mr13710361ljq.250.1666714809166;
        Tue, 25 Oct 2022 09:20:09 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V4 0/2] xen/virtio: Handle PCI devices which Host controller is described in DT
Date: Tue, 25 Oct 2022 19:20:02 +0300
Message-Id: <20221025162004.8501-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

Prior to V4 there was a single patch, for V4 an additional prereq patch appeared according
to the discussion at:
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2210211258050.3873@ubuntu-linux-20-04-desktop/

Based on:
https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git/log/?h=for-linus-6.1

Oleksandr Tyshchenko (2):
  xen/virtio: Optimize the setup of "xen-grant-dma" devices
  xen/virtio: Handle PCI devices which Host controller is described in
    DT

 arch/arm/xen/enlighten.c    |   2 +-
 drivers/xen/grant-dma-ops.c | 105 ++++++++++++++++++++----------------
 include/xen/arm/xen-ops.h   |   4 +-
 include/xen/xen-ops.h       |  16 ------
 4 files changed, 60 insertions(+), 67 deletions(-)

-- 
2.25.1


