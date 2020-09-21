Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD862273162
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQ8u-0003Kb-4w; Mon, 21 Sep 2020 18:02:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKQ8t-0003KW-Ci
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:02:23 +0000
X-Inumbo-ID: 00296839-12c4-4966-8949-9937319c3bbe
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00296839-12c4-4966-8949-9937319c3bbe;
 Mon, 21 Sep 2020 18:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=f5TMY0QCCvNTqQSbI1NPeWJ+mH2I08wSho59zqqVYCQ=; b=z68qRXfh7xXZaD2dHFl2H1t3rO
 rKvsykZL3dRZuAiLVhRk8SGDNCzMAw08JWeteoZcP3bhNV/j8MK+BBks9kP2V+v0IjgYRhFvyiWM2
 RXPm/cecQeVd3YXjWkD3CXvrLrtTzM8l6ikbkxUqoYm23IE1LxHfoMo4sfx7n49WgND0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8r-00086x-2G; Mon, 21 Sep 2020 18:02:21 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8q-0003uk-Kn; Mon, 21 Sep 2020 18:02:20 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/4] xen/arm: Properly disable M2P on Arm
Date: Mon, 21 Sep 2020 19:02:10 +0100
Message-Id: <20200921180214.4842-1-julien@xen.org>
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

Arm never supported a M2P yet there are some helpers implemented to deal with
the common code. However, the implementation of mfn_to_gmfn is completely
bogus.

This series aims to properly disable the M2P on Arm. See patch #2 for the
rationale regarding the lack of M2P on Arm.

I have dropped the typesafe patches from this series to focus on just the M2P.

Cheers,

Julien Grall (4):
  xen: XENMEM_exchange should only be used/compiled for arch supporting
    PV guest
  xen: Introduce HAS_M2P config and use to protect mfn_to_gmfn call
  xen: Remove mfn_to_gmfn macro
  xen/mm: Provide dummy M2P-related helpers when !CONFIG_HAVE_M2P

 xen/arch/x86/Kconfig         |  1 +
 xen/common/Kconfig           |  3 +++
 xen/common/domctl.c          |  9 +++++++--
 xen/common/memory.c          |  7 +++++++
 xen/include/asm-arm/domain.h |  5 +++++
 xen/include/asm-arm/mm.h     | 13 -------------
 xen/include/asm-x86/mm.h     |  5 -----
 xen/include/public/domctl.h  |  6 ++++++
 xen/include/xen/domain.h     | 12 ++++++++++++
 xen/include/xen/mm.h         | 13 +++++++++++++
 10 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.17.1


