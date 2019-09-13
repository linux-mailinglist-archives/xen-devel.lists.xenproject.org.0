Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6FB1DDE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 14:50:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8kzO-0002gj-6h; Fri, 13 Sep 2019 12:47:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qndu=XI=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8kzL-0002ge-VU
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 12:47:47 +0000
X-Inumbo-ID: af8e6440-d624-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af8e6440-d624-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568378866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1FjLAiM1CFwox6bkTWmjXk9BINA8nGGb21FooSLf9zs=;
 b=hhXFN47StbxBWpIAaC21KjPJLaOGa9GgSHaQ4SiyslXhvf7WCxiEZ/on
 wSqxg223LFg/WqAVETFiZhavBY4X1d9o2BFFDn+XAt5AFDBWUYZg45TzI
 xdpCfp3AGz5p2eA7mSxQavMbnHCpw9PvxCDc0hEahXJEEGJyOu25RbRLD Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G4rs6Vv3LOEx/koMDh9FyKRyWRgAuIR7nnpkUOn/WyXt+M8XOnwWSqiUGfy5YmJLp+BGsTXWOf
 B9WFR3chONn/OvCM7yC6GraCHiwXJW/VMnIP6O0XLXSom2kguoGPSiuDANmNuFVlVEMmOpFOw+
 PXpGZ+0eD8TTJGPfSFoIEQtASJfzl62rUohfmP5bZ35WzOX3NfidNptcr7TzFDGMw3B0OhQEEz
 kVGd38H/M53YjqIUOuFhT0LK35ZMAPkT66dvmPViBQLL9mjMhVhkap2ifymDmRgMox4XdRw4Pu
 iiE=
X-SBRS: 2.7
X-MesageID: 5829606
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5829606"
From: Paul Durrant <paul.durrant@citrix.com>
To: <netdev@vger.kernel.org>, <xen-devel@lists.xenproject.org>
Date: Fri, 13 Sep 2019 13:47:27 +0100
Message-ID: <20190913124727.3277-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH net-next] MAINTAINERS: xen-netback: update my
 email address
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu@kernel.org>, Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TXkgQ2l0cml4IGVtYWlsIGFkZHJlc3Mgd2lsbCBleHBpcmUgc2hvcnRseS4KClNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tCkNjOiBXZWkgTGl1
IDx3ZWkubGl1QGtlcm5lbC5vcmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGU3YTQ3YjUyMTBmZC4uYjM2ZDUxZjBmZTVjIDEwMDY0
NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTc2NDYsNyArMTc2NDYs
NyBAQCBGOglEb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWh5cGVydmlzb3IteGVuCiAK
IFhFTiBORVRXT1JLIEJBQ0tFTkQgRFJJVkVSCiBNOglXZWkgTGl1IDx3ZWkubGl1QGtlcm5lbC5v
cmc+Ci1NOglQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgorTToJUGF1bCBE
dXJyYW50IDxwYXVsQHhlbi5vcmc+CiBMOgl4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcg
KG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQogTDoJbmV0ZGV2QHZnZXIua2VybmVsLm9y
ZwogUzoJU3VwcG9ydGVkCi0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
