Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 178412662EE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:07:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGlZQ-0001mD-SX; Fri, 11 Sep 2020 16:06:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGlZP-0001m8-VR
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:06:40 +0000
X-Inumbo-ID: 9e8c31f4-1572-4da8-9da9-86d6ee8335a6
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e8c31f4-1572-4da8-9da9-86d6ee8335a6;
 Fri, 11 Sep 2020 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=GuatkuS8a2fSSZrSORNiRhJZmMv0JHUgfWvjqdE7TIs=; b=XtkdyfhcebGuD+LACeXsNZUJsp
 yRBjrR1727hlvW4LuNEOVii9HuOQAswFRjjouJwQYdF2/2z5HQT0s6v4GZayVPP/Jxf91ND7x/B5q
 3SZPL6BwmPrgIhO7CjKRWVM4BGFR0+qrUcFtttNKy8ZCoPntqZXrGTv9NzC2BJjiKRQc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlZN-0004xT-SR; Fri, 11 Sep 2020 16:06:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlZN-0001gv-F7; Fri, 11 Sep 2020 16:06:37 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: oleksandr_tyshchenko@epam.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] Introduce cmpxchg64() and guest_cmpxchg64()
Date: Fri, 11 Sep 2020 17:06:20 +0100
Message-Id: <20200911160622.19721-1-julien@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series introduced cmpxch64() and guest_cmpxchg64(). This will be
useful when porting IOREQ server to Arm.

Cheers,

Julien Grall (2):
  xen/arm: Remove cmpxchg_local() and drop _mb from the other helpers
  xen: Introduce cmpxchg64() and guest_cmpxchg64()

 xen/include/asm-arm/arm32/cmpxchg.h | 85 +++++++++++++++++++++++------
 xen/include/asm-arm/arm64/cmpxchg.h | 41 +++++---------
 xen/include/asm-arm/guest_atomics.h | 28 +++++++++-
 xen/include/asm-x86/guest_atomics.h |  1 +
 4 files changed, 107 insertions(+), 48 deletions(-)

-- 
2.17.1


