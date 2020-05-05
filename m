Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FFA1C51DF
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 11:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVtp8-0002Nl-Bv; Tue, 05 May 2020 09:25:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVtp7-0002Ng-LN
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 09:25:09 +0000
X-Inumbo-ID: 4f7acb60-8eb2-11ea-9d9d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f7acb60-8eb2-11ea-9d9d-12813bfff9fa;
 Tue, 05 May 2020 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588670708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V2xxiJi6Vs/2wqarbDZISrlp3POhWUfUovLsxoF85tk=;
 b=ZvsCwAcculCw5BLNsGvhScGwDmafr+dmZoAcuIJ/LPf7pVWDVOHeOrX5
 Kaz7RI0JjLdYLDU9yaU/mpzkXMERrqv1z1+jNfJxnT2vtEFuPh0hzLSvQ
 kYZmxp7PWVV72RPRtetCvWtP3vos+7q+OTj4otoB+zD7FPQnvr1wAM5jh g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sMjqAbiTLUk7yBkRd7fO9+DhePiH/RmIQDTn2bM7GhjFvnuCnr6lSLZizC3eiY++ahyIpM39P+
 YGcgJNgRPa1DaB1XJqB47fr4Ykdu8Qh7I2zWkANymBYlA+9pstD+G4LDEO2xoHBStusAj/cmVS
 CarqLGuGL0wlq8Ys1wDiTY0Q+xP8AYzgE9D5hzTM4dLbCxWDINVquE8jGMKdpQqLZkxcTNp9Ch
 1FpoKrkTarcbyIYvN7d1u9vAYP/EIHenR3a0fBswrZVlvjH8QB2C1cjiby+umDP7lwiiQgMgss
 q9A=
X-SBRS: 2.7
X-MesageID: 17141822
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,354,1583211600"; d="scan'208";a="17141822"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 0/3] build: fixes for clang 10
Date: Tue, 5 May 2020 11:24:51 +0200
Message-ID: <20200505092454.9161-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Patches 1 and 3 are fixes in order to build Xen with Clang 10. Patch 2
is a fix for a configure bug I've found while attempting to fix Clang
10.

Thanks, Roger.

Roger Pau Monne (3):
  x86/mm: do not attempt to convert _PAGE_GNTTAB to a boolean
  configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
  tools/libxl: disable clang indentation check for the disk parser

 m4/set_cflags_ldflags.m4    |  4 ++++
 tools/libxl/libxlu_disk_l.l | 11 +++++++++++
 xen/arch/x86/mm.c           |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.26.2


