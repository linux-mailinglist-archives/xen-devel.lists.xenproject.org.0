Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDB98F170
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 16:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809512.1221877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrG-0008Ln-Qa; Thu, 03 Oct 2024 14:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809512.1221877; Thu, 03 Oct 2024 14:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swMrG-0008If-N4; Thu, 03 Oct 2024 14:31:10 +0000
Received: by outflank-mailman (input) for mailman id 809512;
 Thu, 03 Oct 2024 14:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wyt=Q7=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1swMrF-0008IT-U3
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 14:31:09 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20dbaa55-8194-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 16:31:07 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2facf00b0c7so19575251fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 07:31:07 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2faecca88d9sm2299871fa.125.2024.10.03.07.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:31:06 -0700 (PDT)
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
X-Inumbo-ID: 20dbaa55-8194-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727965867; x=1728570667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8C4nrNcSwpJCvhGlbR4nfMYnpTDxaR88Y6Ftc/fnJec=;
        b=mGayxa5MF5k2LSvzk+Irrazt44WiVbyE2jZtKKCaeAGYmrXGM9Vh/PnFjTiB8TiBLS
         DYls8hfoyEtcbFzTCo7KmHzbyQby9WquXIX3L5DhszDI9cK1FrFFgHAL3uriaaC4KSUK
         gW4ZKrnJwslfnXY6DmiEqC4ZlxiwLME6SwhNBNjgToCIwClYrsF5Cjt4dFvL0GIyt4XK
         OCNUFUtV47mBiwJyuQPrsUhyUJX8JVX0cuFg7tgXKKSagUcUtYONk+QRQOHMZD03xDmM
         UQcEMnsiqGR5A/l2bdzypzBQ6dPBPI2vMlW9hUwdPCQkdTiiq/E/qlrGl2Qk0DUV/Nex
         DS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727965867; x=1728570667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8C4nrNcSwpJCvhGlbR4nfMYnpTDxaR88Y6Ftc/fnJec=;
        b=AQkP9rhWsUFLthg9PJuD7QP5kcIX8id3pAKYZ0xAikHryX40blqkWS8w2zhjQjI+k4
         S1I4AdRWxbjenK3BtJ9e2K1lizMpieThZ8qyFAG0oQo8LfiGBU7Ko9KYUcVvrSNmGkLb
         8f5+hnaL8f8RjFh9Li6qa5Zeaw7iCjgXTgt1Va/RtLPz5g1q3oa5gmpWyAljhhADHxFN
         jhdyZB8Jbjl5hz0E8zepcZj4igO1nIhRmiEQqNvBAcQ+WwAwlxB1OtdxIvzEy6WWFY2h
         UIe9vS1VnzE6aNcUt7hdWJHSQi+xzkc2Al5m746jQhZj8JrUnT9ULlwAjN6XuLnMVa6o
         HU8A==
X-Forwarded-Encrypted: i=1; AJvYcCXqwsiw67iQLtdfL5SRrYKRdi7AJdEV7D/LEH/uLSU5k2i25r6wGGuK+G+RVHno1dZktNO6GcvKQtU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPNr9ViuJ7A8xcrGkmvBUZpgdzo234aHEM80/r9kA3mr0Hjiec
	OMI37oSFEROzsvukt/aOW0pL2LSo4zqes2BphiQGvNKURzyDeYZB
X-Google-Smtp-Source: AGHT+IEPodM5ZEmWqwQcLk3Nzn9ipU/whmdCEXyUk1Yq/FAtjqQ4wTbfCBEYct8NK3LaRXLoVZ8Q7Q==
X-Received: by 2002:a2e:5159:0:b0:2f3:f1cf:5314 with SMTP id 38308e7fff4ca-2faea223edemr10746221fa.10.1727965867122;
        Thu, 03 Oct 2024 07:31:07 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PULL v1 0/5] Xen Queue
Date: Thu,  3 Oct 2024 16:30:57 +0200
Message-ID: <20241003143103.1476805-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

The following changes since commit 423be09ab9492735924e73a2d36069784441ebc6:

  Merge tag 'warn-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2024-10-03 10:32:54 +0100)

are available in the Git repository at:

  https://gitlab.com/edgar.iglesias/qemu.git tags/edgar/xen-queue-2024-10-03.for-upstream

for you to fetch changes up to 507118c2a066b70e8069702c120461ad8c98ccd5:

  hw/arm: xenpvh: Enable PCI for ARM PVH (2024-10-03 15:24:42 +0200)

----------------------------------------------------------------
Edgars Xen Queue.

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
 hw/xen/xen-hvm-common.c             | 101 ++++++++++++++++++++++--------------
 hw/xen/xen-legacy-backend.c         |  18 -------
 hw/xen/xen-pvh-common.c             |  40 +++++++++++++-
 hw/xen/xen_devconfig.c              |   8 ---
 include/hw/xen/xen-hvm-common.h     |   3 ++
 include/hw/xen/xen-legacy-backend.h |   5 --
 include/hw/xen/xen-pvh-common.h     |   3 ++
 include/hw/xen/xen_native.h         |   3 +-
 11 files changed, 133 insertions(+), 72 deletions(-)

-- 
2.43.0


