Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DC1D1159
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 13:30:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYpZr-0002N1-Ma; Wed, 13 May 2020 11:29:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhv+=63=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYpZq-0002Mw-9J
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 11:29:30 +0000
X-Inumbo-ID: 013dfa92-950d-11ea-a359-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 013dfa92-950d-11ea-a359-12813bfff9fa;
 Wed, 13 May 2020 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589369367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d0hlYLOfkzYbZiFKqnxe5ZmNxW60qKWHhm05xfKs3+c=;
 b=NQgdreTKc/7sbmBIf4CB0TFOFKy/EY1++h/kh7lvrUCFzKraSF98EnNS
 ZtKoQmEXSKEC1ApE3/4L80jsqZjeqwc0/l6oJlS3QD4vF/cpwv3GZ3qiQ
 BDOgl0gMnIo3sFEKyKpkqLVxZLo0qewy1METJUCJEa2WRov5LtV1IXtEz s=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 7NmjoA4DwNwtjqs0YOc/vZt1BPpyM3OubCTyZaQe6oPDxYZ2NknD24OP5jH93lTiQ/VEjO2qtJ
 I02IApKsNbsvZBWbg4ZDH2LxqGad/+F+/6EoH9hrrVqQDwbFxkeXk+8004fWK/1Hd/vu21blOx
 T4IKiANepLXZ5x1EDOfaVc+Zf8/KwO9kFB3t10c/sBLLuDHPEKcwl8TC3K42X4YXiMQ7AEsNWQ
 w6QG1osp3cNsW16gg9r2dV6kKZR86CpbHWVHKi1+b/EMPsXJQl0UBxuL4D7FQK8Ptx6pOd37Fm
 EKw=
X-SBRS: 2.7
X-MesageID: 18097819
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="18097819"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH v2 3/3] golang/xenlight: add necessary module/package
 documentation
Thread-Topic: [PATCH v2 3/3] golang/xenlight: add necessary module/package
 documentation
Thread-Index: AQHWKMGZFErKT/Po40mgeLsLE6wA6KilwHcA
Date: Wed, 13 May 2020 11:29:24 +0000
Message-ID: <BAD53A57-6842-43E6-AA5B-6C42B7290D00@citrix.com>
References: <cover.1589330383.git.rosbrookn@ainfosec.com>
 <a42395202aef85d983dd9db361c366a6d03e313f.1589330383.git.rosbrookn@ainfosec.com>
In-Reply-To: <a42395202aef85d983dd9db361c366a6d03e313f.1589330383.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <39A659E889BE4346B66423F1C5304761@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDEzLCAyMDIwLCBhdCAxOjU4IEFNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEFkZCBhIFJFQURNRSBhbmQgcGFja2FnZSBjb21t
ZW50IGdpdmluZyBhIGJyaWVmIG92ZXJ2aWV3IG9mIHRoZSBwYWNrYWdlLg0KPiBUaGVzZSBhbHNv
IGhlbHAgcGtnLmdvLmRldiBnZW5lcmF0ZSBiZXR0ZXIgZG9jdW1lbnRhdGlvbi4NCg0KT25lIHRo
aW5nIEkgZm9yZ290IHRvIG1lbnRpb24gYWJvdXQgdGhlIFJFQURNRSBpcyB0aGUgbG9uZyBsaW5l
cyDigJQgZG8geW91IG1pbmQgaWYgSSB3cmFwIHRob3NlIGJlZm9yZSBjaGVja2luZyBpdCBpbj8N
Cg0KPiBBbHNvLCBhZGQgYSBjb3B5IG9mIHRoZSBMR1BMICh0aGUgc2FtZSBsaWNlbnNlIHVzZWQg
YnkgbGlieGwpIHRvDQo+IHRvb2xzL2dvbGFuZy94ZW5saWdodC4gVGhpcyBpcyByZXF1aXJlZCBm
b3IgdGhlIHBhY2thZ2UgdG8gYmUgc2hvd24NCj4gb24gcGtnLmdvLmRldiBhbmQgYWRkZWQgdG8g
dGhlIGRlZmF1bHQgbW9kdWxlIHByb3h5LCBwcm94eS5nb2xhbmcub3JnLg0KPiANCj4gRmluYWxs
eSwgYWRkIGFuIGVudHJ5IGZvciB0aGUgeGVubGlnaHQgcGFja2FnZSB0byBTVVBQT1JULm1kLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNv
bT4=

