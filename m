Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0161649EB67
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 20:56:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261719.453382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAsf-0001t0-Qa; Thu, 27 Jan 2022 19:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261719.453382; Thu, 27 Jan 2022 19:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDAsf-0001qZ-NL; Thu, 27 Jan 2022 19:56:29 +0000
Received: by outflank-mailman (input) for mailman id 261719;
 Thu, 27 Jan 2022 19:56:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFuB=SL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nDAse-0001qN-CE
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 19:56:28 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368b2239-7fab-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 20:56:27 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id j14so5938385lja.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 11:56:27 -0800 (PST)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j18sm897631lja.26.2022.01.27.11.56.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jan 2022 11:56:25 -0800 (PST)
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
X-Inumbo-ID: 368b2239-7fab-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=apbir4IjKg1w+3c39Se1f3s+WEDrg8JE1dUFOnBYRx8=;
        b=QAv58k13Gpm6ZKlZNZaGBbuaqV2zltJ05dkI2VtzvT/hoOA4zUwvpiI8CV87yQdwxz
         KlDuyc20IW6mGx1e6FPzdxtws+8cynt8O3SBT8kL/Q1bZD2dlpd9Cq+2igp8crTHOzuy
         +WVKtH2Rzt8KWkzPc6177aj3ZDbVx7FC46F/lE9Dmtfqd2dhZK+vu52nG1rEGs+GCwhh
         fvrCfSOgsIqB14nNUI3cJkGnTUoItN8f8Kf63nBjAnLf17Spa0dejjzCW5+PPJBa+q3e
         mQDHQT8tJcLuPIxpfG+a+3KpZNiWelRTaLx931vz7fa6vpd50R0fwoS9RvxsiRAOqz64
         WGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=apbir4IjKg1w+3c39Se1f3s+WEDrg8JE1dUFOnBYRx8=;
        b=20zerNZS/IbwIw6b2084nT/W8MmnEJBMuf/Y+EMSOZvO7pA3hgXFf8mpRIp3q+6LhL
         7jHZkcotoIARCFgEuPswX2ZD/4wu6wPF6a7ERI/DLCMQk0lwIXWTS+3i7s4CaL1UhKkF
         18uY86DX7SZOZIE1xvzEZR9/8LH1QYnoP9Hxyhha3YLvAm+q+T91IFTIwqrc6DqYIk+n
         OQHVfYc57cOirBkjkAO+5fawR80AgRum/ddBHlHmuP1lZGjPqs7tAt3Q8PIaYuMnhcib
         Nv69NPhb4S6jVOG1Eqf56SS1jsUoluRKQy5aZARToU0emntCrOos3/tm/rl10aiOv6xz
         oEiQ==
X-Gm-Message-State: AOAM531793kcq5oeWeU7SMzRl631E+ubfpb7EYWBy8QAx4HKBBFuE4pd
	cVqtXxuo2VnEQ0WvTFnL9ioofDjVdI0=
X-Google-Smtp-Source: ABdhPJxnFCsPZPqfhxrLyAr2O47O6RX++UinGksAuJA2tdhK83/KQnVBmgyRjTSFjfHhljwAln65jA==
X-Received: by 2002:a2e:9d0a:: with SMTP id t10mr3703284lji.219.1643313386531;
        Thu, 27 Jan 2022 11:56:26 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH V3 0/2] Add support for Renesas R-Car S4 IPMMU and other misc changes (remaining 2 patches)
Date: Thu, 27 Jan 2022 21:55:50 +0200
Message-Id: <1643313352-29940-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

You can find the V1-V2 patch series at [1]-[2].

The first 8 patches (prereq work + R-Car S4 IPMMU support) have been already committed.
These are remaining 2 patches which include misc changes.

[1] https://lore.kernel.org/all/1638035505-16931-1-git-send-email-olekstysh@gmail.com/
[2] https://lore.kernel.org/all/1640034957-19764-1-git-send-email-olekstysh@gmail.com/

Oleksandr Tyshchenko (2):
  iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
  iommu/arm: Remove code duplication in all IOMMU drivers

 xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 36 ++++++++++++++------------------
 xen/drivers/passthrough/arm/smmu-v3.c    | 17 +--------------
 xen/drivers/passthrough/arm/smmu.c       | 17 +--------------
 4 files changed, 25 insertions(+), 52 deletions(-)

-- 
2.7.4


