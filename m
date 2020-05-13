Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2BA1D1691
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 15:56:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrrr-0007Px-IY; Wed, 13 May 2020 13:56:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYrrq-0007Ps-CA
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:56:14 +0000
X-Inumbo-ID: 819c9a90-9521-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 819c9a90-9521-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589378174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=szdENZVnK21wmpaV/YA6upz3x9DsZQ4tlOwrH96ssUA=;
 b=hrrY+jggF7ZVaA9VlEOqzHzmCJ7tCNXtlfiBDdlqVqhJi1NJClNCyZMK
 hCG+ilroJF9+mkyInQbQi/wr80pzB9FV05fggEEyZUsoe3XaX9usaTTdE
 bLxFUAVg7EQsMX7FyA1w2JsC1G+7INeVb0fx/cvzjRfPK1YhuCLF900+4 4=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: oT5dIifoFXzVz1Re2i0NWmkd5ngOkzeV2gSKY/ltaaOocMbRS3u2CqDSVHRzJOI5XD08gBiQBM
 DbrvDqPwARTGfVrhycrLH3KFFWV09cYaZhcoQgxo6SwCAy48gkJkU5yCc84vQX+C1fvejHDGBO
 93j9x3bVPU2U2Z3zESPG+EexmJmbktLIVZqTMkb0fi3ATyskpdUsCqjsIsAOT5FguVYV7cjfSD
 55iiT1trEMjJ4UJEfkM6/pqK9SQmw8kKZhFvo6DmsmQMj8M4Iib4R6mX8Jn0IdY4LmMc+3GBRQ
 kcs=
X-SBRS: 2.7
X-MesageID: 17443159
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17443159"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] build: Fix build with Ubuntu
Date: Wed, 13 May 2020 14:55:50 +0100
Message-ID: <20200513135552.24329-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason
 Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefan Bader <stefan.bader@canonical.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This supercedes "x86/build: Unilaterally disable -fcf-protection"

Andrew Cooper (2):
  x86/build: move -fno-asynchronous-unwind-tables into EMBEDDED_EXTRA_CFLAGS
  x86/build: Unilaterally disable -fcf-protection

 Config.mk                            | 3 ++-
 tools/tests/x86_emulator/testcase.mk | 2 +-
 xen/arch/x86/arch.mk                 | 2 +-
 xen/arch/x86/boot/build32.mk         | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.11.0


