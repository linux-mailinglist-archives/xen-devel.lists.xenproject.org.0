Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804151BFE11
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:26:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUA8Q-0002Ti-Qp; Thu, 30 Apr 2020 14:25:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUA8P-0002Tb-Uk
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:25:53 +0000
X-Inumbo-ID: 7f56f5d9-8aee-11ea-9a5e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f56f5d9-8aee-11ea-9a5e-12813bfff9fa;
 Thu, 30 Apr 2020 14:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VG7WoWnaGl+DZRy7pGG9xLC9EEM8+3BR/79Re4z8n4s=; b=EL1dZ/8QA3DZGj7aZ1KBq9k29B
 GkvEypeT6Mu8qlrLpWTCeFxz40vN5pcWhMq59H0QIonaJ4tEbrU9U4WeZduRb+tI2gAX/X9X5pIxx
 mXvL4IN4XYO5ow/N0GaLSTjw9ULGGbG6CvAR2JEtcYiNzYYnfQKrhG7nSxZcwHig63Zw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUA8N-0004p9-QR; Thu, 30 Apr 2020 14:25:51 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUA8N-0008UY-GJ; Thu, 30 Apr 2020 14:25:51 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH RESEND 0/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
Date: Thu, 30 Apr 2020 15:25:46 +0100
Message-Id: <20200430142548.23751-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a resend as I forgot to CC the maintainers.

This small series is meant to make easier to experiment when using Xen.
See patch #2 for more details.

Cheers,

Julien Grall (2):
  xen/Kconfig: define EXPERT a bool rather than a string
  xen: Allow EXPERT mode to be selected from the menuconfig directly

 xen/Kconfig                     | 11 +++++++++--
 xen/Kconfig.debug               |  2 +-
 xen/Makefile                    |  1 -
 xen/arch/arm/Kconfig            | 10 +++++-----
 xen/arch/x86/Kconfig            |  6 +++---
 xen/common/Kconfig              | 14 +++++++-------
 xen/common/sched/Kconfig        |  2 +-
 xen/drivers/passthrough/Kconfig |  2 +-
 8 files changed, 27 insertions(+), 21 deletions(-)

-- 
2.17.1


