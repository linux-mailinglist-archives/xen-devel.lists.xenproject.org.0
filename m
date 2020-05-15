Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B61D4FAB
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 15:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZarF-0000Qe-GA; Fri, 15 May 2020 13:58:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZarE-0000QZ-PO
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 13:58:36 +0000
X-Inumbo-ID: 2b0dafea-96b4-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b0dafea-96b4-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589551115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eUopZb5WLRi6cSi1Y9lp6AxsrSmMmFJQjkxh0NZ5ixU=;
 b=KmfptNgdLYpCE2CpVPM+Xq+nhhBF70/5298GP2YO4B6GnOIHXwen3glp
 3YQ8/AZDXrYsDi9gN3nEhp/PzPYAxYZ1mPc/k6adCEYIX7FwAeep4Fkht
 Z4EOQHZaZtKTPP4ZzuoFBTS++hKikJbLc95a6jRIUsONR70THc2/do46a 0=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 0y69BHivvJ4Dhuyga0SkjvoUvWm53LyqI+Pmwb0l6a6GQgqL6XcQW2GFjFq5atPz2IbSphc57z
 401edO4EVbo/x3+0PsU9fE/OM5myZNRgML38zuNaPqxphh+8m3s0qPX6tOkvM8I62Rqj4O1FW1
 bzBpRvIUFou/dJ1vYiWjdgMTRfYyGDtK3B6W215j96fW+sMyDItapQ875Y8uGxeTYlnklUjPCV
 L0eZ0zVCJa3iGqBO6Y6SE+EHzq939+5t5HKLNkPFGny1dZM52th9B+z5XxaSyAZUYtycJaeZaD
 aiM=
X-SBRS: 2.7
X-MesageID: 17621872
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17621872"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 0/2] x86/idle: fix for Intel ISR errata
Date: Fri, 15 May 2020 15:58:00 +0200
Message-ID: <20200515135802.63853-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Apply a workaround in order to cope with the BDX99, CLX30, SKX100,
CFW125, BDF104, BDH85, BDM135, KWB131 erratas.

Roger Pau Monne (2):
  x86/idle: rework C6 EOI workaround
  x86/idle: prevent entering C6 with in service interrupts on Intel

 docs/misc/xen-command-line.pandoc |  9 ++++
 xen/arch/x86/acpi/cpu_idle.c      | 74 ++++++++++++++++++++++++-------
 xen/arch/x86/cpu/mwait-idle.c     |  3 ++
 xen/include/asm-x86/cpuidle.h     |  1 +
 4 files changed, 70 insertions(+), 17 deletions(-)

-- 
2.26.2


