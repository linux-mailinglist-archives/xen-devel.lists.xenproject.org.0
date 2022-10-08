Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1BF5F85C0
	for <lists+xen-devel@lfdr.de>; Sat,  8 Oct 2022 17:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418538.663368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBTH-0007JV-SY; Sat, 08 Oct 2022 15:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418538.663368; Sat, 08 Oct 2022 15:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohBTH-0007Gz-PE; Sat, 08 Oct 2022 15:10:35 +0000
Received: by outflank-mailman (input) for mailman id 418538;
 Sat, 08 Oct 2022 15:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0eQj=2J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ohBTG-0007Gm-7Q
 for xen-devel@lists.xenproject.org; Sat, 08 Oct 2022 15:10:34 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a58d888-471b-11ed-9377-c1cf23e5d27e;
 Sat, 08 Oct 2022 17:10:32 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id a26so16859015ejc.4
 for <xen-devel@lists.xenproject.org>; Sat, 08 Oct 2022 08:10:32 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 l25-20020a50d6d9000000b0045723aa48ccsm3523119edj.93.2022.10.08.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 08:10:30 -0700 (PDT)
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
X-Inumbo-ID: 5a58d888-471b-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5DKsFFe8GPmeoM51frqAs/ZJNFCYSbjNvK+URttuB0=;
        b=YZEi5wYvmKc822x5qZvwjXOKD/IDcmbU98kIh5rLAX9WDSnrbVNe4M6BVGos4rdcpj
         Uz88wSpTNaflbdEqvvyY3wvFvZLBP7L9iQJQPlz9ZhRBwyNaR3vEIX/KwWCZRNTUHk/J
         KEK0QKfrljjuBE7L7cYhY3GzMXAPWeNEM6mrE11Ktq3m4EXJ/pko9Qb+IGcd5jtdAn7/
         GPnCNELGQx/QfoACdZp8fSuHX4mo2dU0mbXQyipCgOKpJA6YMoFb7YzTGSJW27zuLSTt
         RPwfByzsmEH8Gc25nVf7ImFxZ0n9t/tHYBnIJJ68S/hzi82LtUIkImEEuNSWh+yxnoxp
         VHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5DKsFFe8GPmeoM51frqAs/ZJNFCYSbjNvK+URttuB0=;
        b=hDVtQJOudaTRl/vct9L210hV8+1DluBQGU9cw3oxoGUi6ipixgTUiFDCfyu3xXQNTx
         vfghVG0GhIj0Ny2X7O8e2dZs9zyfWJ2h5SlO7gJauwx0O9lqg9EBE8F8DCQHsF4TDhlg
         DTpz98H0lMGLIPMzlgeb0P0D6LzbvzRkPObgd86XBqgtr+KgVu7YL5Z2U09FJ35Do/xg
         2TchwB5XvaNK1e0GsX87yzUWP1A3cUBg2X9K26MnGTc6SFpMV+gJvYTV30Lk5IG8+esV
         +iZ7urNAyJ9BqY122qeqfyewY3SMeDATXdphqqACImnsl5sP1MUrOhBTLZM/pPUwoVE6
         VxsQ==
X-Gm-Message-State: ACrzQf3pcnLlIOIJD3r9IG3uGnR6x9o7j1B6MlA38cilJ27PMwM6V6Rb
	0kEqRnFcQUXq4sEz94WjyQhEGgyCAtg=
X-Google-Smtp-Source: AMsMyM6JPxbo4+cgHinL2jtWQLwIksmTxOnGzE4YG9CLtfRaECFGgMBAaRcIrMcuCErVSdbK35q2Qw==
X-Received: by 2002:a17:906:cc56:b0:78d:98c3:8714 with SMTP id mm22-20020a170906cc5600b0078d98c38714mr2194404ejb.445.1665241831517;
        Sat, 08 Oct 2022 08:10:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>
Subject: [PATCH V2 0/2] Other misc fixes for Xen grant DMA-mapping layer
Date: Sat,  8 Oct 2022 18:10:11 +0300
Message-Id: <20221008151013.2537826-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

These are other several fixes, which were identified and sent separately,
but now they are put together in completeness here.

Current series depends on the series which has been already pushed
to xen/tip.git for-linus-6.1:
https://lore.kernel.org/xen-devel/20221005174823.1800761-1-olekstysh@gmail.com/

Oleksandr Tyshchenko (2):
  xen/virtio: Handle cases when page offset > PAGE_SIZE properly
  xen/virtio: Convert PAGE_SIZE/PAGE_SHIFT/PFN_UP to Xen counterparts

 drivers/xen/grant-dma-ops.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

-- 
2.25.1


