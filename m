Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D121DC92C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 11:00:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbh3C-0000wc-Lc; Thu, 21 May 2020 08:59:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/yRJ=7D=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jbh3A-0000wX-QE
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 08:59:36 +0000
X-Inumbo-ID: 6533a2c4-9b41-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6533a2c4-9b41-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hC9tgQbr/TL4+Mod3DucwRrUzybUG/qIhAb+8o6gIVI=; b=k5Dmfcbpspf0I0G1yKqu78X1TF
 kbs5GDTJdQbCC8B/D9IYxBh8epzlNAMJ2InHykUpqQxyk5nc68zWPSA5YBQXcW7/lMeTd2HbxHvA0
 0QPIVUKUZD2nslYmbWHwx6ixD0J3oV0CqRHplUzNb2WTBmjaqJ7ubY+6SUZLHO6qRLd8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jbh39-0005Ob-QO; Thu, 21 May 2020 08:59:35 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jbh39-0000wi-HB; Thu, 21 May 2020 08:59:35 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/5] domain context infrastructure
Date: Thu, 21 May 2020 09:59:27 +0100
Message-Id: <20200521085932.10508-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (5):
  xen/common: introduce a new framework for save/restore of 'domain'
    context
  xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
  tools/misc: add xen-domctx to present domain context
  common/domain: add a domain context record for shared_info...
  tools/libxc: make use of domain context SHARED_INFO record...

 .gitignore                             |   1 +
 tools/flask/policy/modules/xen.if      |   4 +-
 tools/libxc/include/xenctrl.h          |   5 +
 tools/libxc/xc_domain.c                |  56 +++++
 tools/libxc/xc_sr_common.c             |  67 ++++++
 tools/libxc/xc_sr_common.h             |  11 +-
 tools/libxc/xc_sr_common_x86_pv.c      |  74 ++++++
 tools/libxc/xc_sr_common_x86_pv.h      |   3 +
 tools/libxc/xc_sr_restore_x86_pv.c     |  26 +-
 tools/libxc/xc_sr_save_x86_pv.c        |  43 ++--
 tools/libxc/xg_save_restore.h          |   1 +
 tools/misc/Makefile                    |   4 +
 tools/misc/xen-domctx.c                | 278 ++++++++++++++++++++++
 xen/common/Makefile                    |   1 +
 xen/common/domain.c                    |  59 +++++
 xen/common/domctl.c                    | 173 ++++++++++++++
 xen/common/save.c                      | 314 +++++++++++++++++++++++++
 xen/include/public/arch-arm/hvm/save.h |   5 +
 xen/include/public/arch-x86/hvm/save.h |   5 +
 xen/include/public/domctl.h            |  41 ++++
 xen/include/public/save.h              | 100 ++++++++
 xen/include/xen/save.h                 | 170 +++++++++++++
 xen/xsm/flask/hooks.c                  |   6 +
 xen/xsm/flask/policy/access_vectors    |   4 +
 24 files changed, 1405 insertions(+), 46 deletions(-)
 create mode 100644 tools/misc/xen-domctx.c
 create mode 100644 xen/common/save.c
 create mode 100644 xen/include/public/save.h
 create mode 100644 xen/include/xen/save.h

-- 
2.20.1


