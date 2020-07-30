Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5C2337F5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 19:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1CjC-00089n-Dw; Thu, 30 Jul 2020 17:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1CjA-00089P-W1
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 17:52:25 +0000
X-Inumbo-ID: 6968361b-d28d-11ea-aaff-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6968361b-d28d-11ea-aaff-12813bfff9fa;
 Thu, 30 Jul 2020 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AgySXafvLKDrFHZwhVYC/CtvL9daRvYVrDlQBaY611s=; b=g1CPwU7EKozO36MiD2faC1WMy4
 I+v2tAqxkFHvaT1ICh99bgbrtPD+9HvV0wzwgZu6zk6TRcB1e4kuU8nkJU/gzbs62eppIByDEAWTt
 pWt+C9DmwoJxfTOOKenxFDczSndjdgohvt0zBXag/Ef5JEzTiLVk0UI90t80pM7RpmZ0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Cj3-000796-H9; Thu, 30 Jul 2020 17:52:17 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1Cj3-0004nV-1p; Thu, 30 Jul 2020 17:52:17 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/7] xen: Consolidate asm-*/guest_access.h in
 xen/guest_access.h
Date: Thu, 30 Jul 2020 18:52:00 +0100
Message-Id: <20200730175213.30679-1-julien@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Hi all,

A lot of the helpers implemented in asm-*/guest_access.h are implemented
the same way. This series aims to avoid the duplication and implement
them only once in xen/guest_access.h.

Cheers,

Julien Grall (7):
  xen/guest_access: Add emacs magics
  xen/arm: kernel: Re-order the includes
  xen/arm: decode: Re-order the includes
  xen/arm: guestcopy: Re-order the includes
  xen: include xen/guest_access.h rather than asm/guest_access.h
  xen/guest_access: Consolidate guest access helpers in
    xen/guest_access.h
  xen/guest_access: Fix coding style in xen/guest_access.h

 xen/arch/arm/decode.c                |   7 +-
 xen/arch/arm/domain.c                |   2 +-
 xen/arch/arm/guest_walk.c            |   3 +-
 xen/arch/arm/guestcopy.c             |   5 +-
 xen/arch/arm/kernel.c                |  12 +--
 xen/arch/arm/vgic-v3-its.c           |   2 +-
 xen/arch/x86/hvm/svm/svm.c           |   2 +-
 xen/arch/x86/hvm/viridian/viridian.c |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c           |   2 +-
 xen/common/libelf/libelf-loader.c    |   2 +-
 xen/include/asm-arm/guest_access.h   | 115 -----------------------
 xen/include/asm-x86/guest_access.h   | 116 ++----------------------
 xen/include/xen/guest_access.h       | 131 +++++++++++++++++++++++++++
 xen/lib/x86/private.h                |   2 +-
 14 files changed, 161 insertions(+), 242 deletions(-)

-- 
2.17.1


