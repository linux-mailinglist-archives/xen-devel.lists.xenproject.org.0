Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8099B1D7712
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 13:31:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jadyU-0005je-Or; Mon, 18 May 2020 11:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/+tu=7A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jadyT-0005jZ-Lp
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 11:30:25 +0000
X-Inumbo-ID: f7857c36-98fa-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7857c36-98fa-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 11:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k4PBRVru4LKBF7jxp/hVw/A4ZA5rY75r31sh7ceXQAo=; b=g0WVCuOPYWdI4k/NVaFMrS67wL
 hz7hnYpBnp4By8v3EfYqCfF004/3q/gQ6OOOm0sOUy/I6x9+GFPsGvkb7Z12T7CDCppqtccDKUiWk
 n4mCW6Y3hDqiFRrxUS7YX0vz+ZtnSgqHJLH+KzBGpdB3ThyMQOz1B0tpd0a9aec5FIRQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jadyR-0006PC-Ss; Mon, 18 May 2020 11:30:23 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jadyR-0000cn-Go; Mon, 18 May 2020 11:30:23 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi 4
Date: Mon, 18 May 2020 12:30:05 +0100
Message-Id: <20200518113008.15422-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 George Dunlap <george.dunlap@citrix.com>, jeff.kubascik@dornerworks.com,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
only use the first GB of memory.

This is because several devices cannot DMA above 1GB but Xen doesn't
necessarily allocate memory for Dom0 below 1GB.

This small series is trying to address the problem by allowing a
platform to restrict where Dom0 banks are allocated.

This is also a candidate for Xen 4.14. Without it, a user will not be
able to use all the RAM on the Raspberry Pi 4.

This series has only be slighlty tested. I would appreciate more test on
the Rasbperry Pi 4 to confirm this removing the restriction.

Cheers,

Cc: paul@xen.org

Julien Grall (3):
  xen/arm: Allow a platform to override the DMA width
  xen/arm: Take into account the DMA width when allocating Dom0 memory
    banks
  xen/arm: plat: Allocate as much as possible memory below 1GB for dom0
    for RPI

 xen/arch/arm/domain_build.c                | 32 +++++++++++++---------
 xen/arch/arm/platform.c                    |  5 ++++
 xen/arch/arm/platforms/brcm-raspberry-pi.c |  1 +
 xen/include/asm-arm/mm.h                   |  2 ++
 xen/include/asm-arm/numa.h                 |  5 ----
 xen/include/asm-arm/platform.h             |  2 ++
 6 files changed, 29 insertions(+), 18 deletions(-)

-- 
2.17.1


