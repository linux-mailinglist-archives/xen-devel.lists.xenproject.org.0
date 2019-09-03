Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98607A68EA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:50:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i58Dx-0007K3-Lf; Tue, 03 Sep 2019 12:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wv/e=W6=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i58Dw-0007Jy-2X
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:47:52 +0000
X-Inumbo-ID: 0a250ac8-ce49-11e9-8853-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a250ac8-ce49-11e9-8853-bc764e2007e4;
 Tue, 03 Sep 2019 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567514871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s67GqJ73Ee0yu73NyqrMjnOvcVY84jYAXfruN4qV9Wo=;
 b=IHLYOkyKWMBhb8TYXusQb+7jChbLSxeJKGdq2zFAujIlLGcY7VzGFlzV
 wcCJHapHZZdhjCQ+oRUU8uSO7bid28YspTsdr8019M26JfACkbFlttFSf
 A/UFSJE2vYUddnepu+nb0B0DW4dkOL48xqZ2vJFI/ga1vPuicxOONxL2E E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6pI9Ubm/dSTbScqvzZCDdjzn/QYt2TPkV68sjd79642+CWhBYatP3QakLzR0snRCpa3FnkZWld
 VhA2Shei7eIjKG+tNS+3CoNnduPv/86FY04187jYnhstCyLXxMJP6Q/R9To1spFHSpMk1IPZTJ
 yw6+Zg6DycO4HT3Y5TUCXMch3ibtlKxHLUSBJNNmaOk3roNpzZlXZX/R29Ak3gtYUzx6Bvw0bT
 KscS+wUN7trLQlSAo01LiHHngFCNPHwOCuAfQU4qxuvrsKmWkIbOfQzI4A6Gjgk+lYE9QW2SUc
 dL0=
X-SBRS: 2.7
X-MesageID: 5322240
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,463,1559534400"; 
   d="scan'208";a="5322240"
From: Christian Lindig <christian.lindig@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v8 2/6] domain: introduce XEN_DOMCTL_CDF_iommu flag
Thread-Index: AQHVYZ295iGYZCueOEG+xqIrzpnZLqcZxs8A
Date: Tue, 3 Sep 2019 12:47:47 +0000
Message-ID: <B203B087-CDAB-4B1D-8A64-DD32DC529486@citrix.com>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-3-paul.durrant@citrix.com>
In-Reply-To: <20190902145014.36442-3-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <16A0155F4E68C147A90D731C02FE978A@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 2/6] domain: introduce
 XEN_DOMCTL_CDF_iommu flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDIgU2VwIDIwMTksIGF0IDE1OjUwLCBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPiB3cm90ZToKPiAKPiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAg
ICAgIHwgIDggKysrKysrKy0KPiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpICAgICAg
IHwgIDggKysrKysrKy0KCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGlu
ZGlnQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
