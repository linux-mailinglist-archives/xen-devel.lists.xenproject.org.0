Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE198F6A5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 20:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809817.1222349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0c-0007bD-1m; Thu, 03 Oct 2024 18:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809817.1222349; Thu, 03 Oct 2024 18:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swR0b-0007Z6-Ua; Thu, 03 Oct 2024 18:57:05 +0000
Received: by outflank-mailman (input) for mailman id 809817;
 Thu, 03 Oct 2024 18:57:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swR0a-0007Yu-6r
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 18:57:04 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4715a050-81b9-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 20:57:03 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2facf48166bso18749831fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 11:57:03 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecbf6feesm2796571fa.18.2024.10.03.11.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 11:57:01 -0700 (PDT)
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
X-Inumbo-ID: 4715a050-81b9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727981823; x=1728586623; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cdaNDaEOcn6vuQNjiuMDjzYnUO3vmcmh1n8TpB8KZRA=;
        b=iqqAN6+ECcPR8Vo/eH6aBmLojnXBTlcAuHsArR+YHJQWeSfHBkHZnFbtbBbTzs+9B5
         KNe9lG4TnX/eg6Szn9bc/e9bIeEosdVGfeech9SVBnz8OJQ9X8auFsYdExU2wlcwR9jC
         WAL3TNi0HHyH3TseORfuIBjX03Zr9FEC78abcPCBbCk4ZuEMea5VHoj3YagnKsf8noTX
         UPY9CZsTvf6Ndfi1F4EpjbsXgDznSTgcKwQcyY0vNcbamvp/DHBo/XfjW66hvlr5/F1c
         G+7Gdlx551gWAhc9JVDp2jevAL/3VfyIFxrpqgHYB0muWc6rOEWNZYnI2pOS8PHo2Y8P
         rNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981823; x=1728586623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdaNDaEOcn6vuQNjiuMDjzYnUO3vmcmh1n8TpB8KZRA=;
        b=Lx7zus6p9cUNvBNo40TaB0mgah4tA2CyJ8rBiS0vC2jWk/2GEGEEYzc2xVz7JwlW0g
         UB4D3Svb8UOg9VyyPeEY/9PqniHwZWTTlyKkkJ7shO/JPeVGf3Qrcr4l4LeD8pCXv7SX
         N30iqK6SYuKDPaVGTWNABbBmbsV6FZtIpSBlHJi15lrols7wIEzQ6+E/FUCE52PnTFag
         bAl/r5dedPi4p71obdgdKXzpAG1WY7fEuwfF99L7cWenTbvvzHdO1qaCzy5GtZangMMI
         e0lGENT1ZU2nHFFpNZoMNUUUR62G2ihuYojbrDGOcPm5NJrJWj2w81qPLpZ0Tfone4zh
         DIcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUshneErrw+/USrmrieITJ/9Juh5Q09Nk5IiIzyupqfMeO24lbUdPCWiROpnIQ7Ga1bNoADUMSbpWA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEc41TLoEBvbcEx81yYyqMT2Gq4uaQ+E2c9hDTGDPFHBisZQy1
	MfZ0juG3qPlHNO4vn3Q61ROj9uF5Yfk+zQBBnE4Atq0MDqdoLJdw
X-Google-Smtp-Source: AGHT+IFdeBkkNKz7zU2CTecNYILP4aX1U9f8WPyScxz91qp4ENEdsSBhsUSyvViSiJmd41SQ99VMWA==
X-Received: by 2002:a2e:b8c3:0:b0:2ec:55b5:ed45 with SMTP id 38308e7fff4ca-2faf3c420b2mr190871fa.24.1727981822607;
        Thu, 03 Oct 2024 11:57:02 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v2 0/5] Xen Queue
Date: Thu,  3 Oct 2024 20:56:49 +0200
Message-ID: <20241003185655.1480819-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The following changes since commit 423be09ab9492735924e73a2d36069784441ebc6:

  Merge tag 'warn-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2024-10-03 10:32:54 +0100)

are available in the Git repository at:

  https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-03-v2.for-upstream

for you to fetch changes up to ca9275a4b11aced3074219d1712e29fce5036f72:

  hw/arm: xenpvh: Enable PCI for ARM PVH (2024-10-03 19:37:35 +0200)

----------------------------------------------------------------
Edgars Xen Queue.

----------------------------------------------------------------

ChangeLog:

v1 -> v2:
* Removed left over trace call

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
      hw/xen: Remove deadcode

Edgar E. Iglesias (4):
      hw/xen: Expose handle_bufioreq in xen_register_ioreq
      hw/xen: xenpvh: Disable buffered IOREQs for ARM
      hw/xen: xenpvh: Add pci-intx-irq-base property
      hw/arm: xenpvh: Enable PCI for ARM PVH

 hw/arm/xen-pvh.c                    |  17 ++++++
 hw/i386/xen/xen-hvm.c               |   4 +-
 hw/i386/xen/xen-pvh.c               |   3 ++
 hw/xen/xen-hvm-common.c             | 100 ++++++++++++++++++++++--------------
 hw/xen/xen-legacy-backend.c         |  18 -------
 hw/xen/xen-pvh-common.c             |  40 ++++++++++++++-
 hw/xen/xen_devconfig.c              |   8 ---
 include/hw/xen/xen-hvm-common.h     |   3 ++
 include/hw/xen/xen-legacy-backend.h |   5 --
 include/hw/xen/xen-pvh-common.h     |   3 ++
 include/hw/xen/xen_native.h         |   3 +-
 11 files changed, 132 insertions(+), 72 deletions(-)
-- 
2.43.0


