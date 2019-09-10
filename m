Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E99BAEBE2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:47:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gSp-0001zg-CC; Tue, 10 Sep 2019 13:45:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7gSn-0001yp-BG
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:45:45 +0000
X-Inumbo-ID: 493c7b64-d3d1-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 493c7b64-d3d1-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568123144;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=yrR0B2BL/VPtzOdYy0fdNUYjbvajGlSyZ+qv/YO3nNg=;
 b=BB4Y7RVomJTgkEg2FbI/MZmQ/tzyWFLbGlAoCkJzt1KWQRjBcA90I8H4
 vJHJGJjpoJ6wsa1FZvx0TgDmv6Tx+qYZ/7BUcM9IcK8iLadlV3pT99sCS
 uyi/vZyvyvcXC2aRj7/6lHahd1q4VEQ95PmVp0+9RaBpYZoUT4fNpqdKN g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: z7KLypgvYF3DWdFoebO5KKLtWCcIJilLCfvZ6Uhvp7cpV10vpgn/YNAU09JazFAQ4Aat6Qa6ZO
 jzWhK2slRt+OjNlcBoNJH6WNjJvP7nsDyEJo3mmhoqtAWaI+Nykwgg+QAm7W8bDXo0FB6tzORb
 mwms+x3D4BVKeGmPC9g9hAYeu7aUSbUytZqaOx+C0jSCTkGiPycslkd/ijwvExtZIsHC3lyDZI
 fQdSgrqGnwickYm+px0oJLBnRnHnvJuCEGUfRmt6YAHnKZql4tdSq7u4IraRdYE5lpes/+mXAE
 xPc=
X-SBRS: 2.7
X-MesageID: 5657142
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5657142"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23927.43239.34240.531931@mariner.uk.xensource.com>
Date: Tue, 10 Sep 2019 14:45:11 +0100
To: Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jan Beulich <jbeulich@suse.com>, George Dunlap
 <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
 <julien.grall@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne
 <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <23927.41969.760363.770886@mariner.uk.xensource.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <23927.41969.760363.770886@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 00/12] ocaml abi fixes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2MyAwMC8xMl0gb2NhbWwgYWJpIGZpeGVz
Iik6Cj4gVGhlIHJlc3VsdCBpcyBoZXJlOgo+ICAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPXBlb3BsZS9pd2oveGVuLmdpdDthPXN1bW1hcnkKPiAgIC1iIHdpcC5vY2FtbC52My4x
Cj4gSSBjYW4gcmVwb3N0IGl0IGlmIGFueW9uZSB0aGlua3MgdGhhdCB3b3VsZCBiZSB1c2VmdWwu
CgpUaGFua3MgZm9yIHRoZSBhY2tzLCBhbGwuICBOb3cgcHVzaGVkLgoKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
