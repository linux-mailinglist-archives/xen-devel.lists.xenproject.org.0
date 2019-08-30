Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3DA38E7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:15:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hdu-00017c-Lm; Fri, 30 Aug 2019 14:12:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ruCv=W2=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i3hdt-00017X-EM
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 14:12:45 +0000
X-Inumbo-ID: 3b3e8255-cb30-11e9-ae8a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b3e8255-cb30-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567174362;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=C3UKCDcxsKDhOCOqkwe39+PUvMB097OZhsk8ygF7rrE=;
 b=OBz6ehjVOaHyaiC53oUBy4B3T1/udCeIbWk+5ccLw8SCPG0xHwEi1fOy
 6avYVFGZUxkarutwOB9imAXb9n/PkDc3wQPuqdYDn0Qe/SFxzan0kZSID
 niR1rUrL/XpjdaWRdGxApuMzwKMvpjF7xyN/kk1btB6ASqfF529BlCkTD g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dSUdhxmKNOHOit38ZW6mIEQRLSKZqosFNmL7KEhLZ08RYL2Q7FPbknDEbF4Y6CK6g8JGosY9Lz
 L5lxa0/VQjF8V2DLDbh2GpATXarE54kMEY8sqUrSP2qto80W6Xc0CbAg6DwdDBLsPobZ5trfGf
 ImoKNzxVq5KOqRse5rp/DeiWhhet0ICIvJDUKX9jher2ordevRe4+89vocIhacmxwgcv45hci3
 Y6lkzvQ5xCXtRtLPlfsx2TBX7q+iltKn2S0uag25N8qul/BGj51cz6rM7fZdqlOCo3bBvg7glo
 HGM=
X-SBRS: 2.7
X-MesageID: 5163317
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,447,1559534400"; 
   d="scan'208";a="5163317"
From: Christian Lindig <christian.lindig@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v7 6/6] introduce a 'passthrough' configuration option to
 xl.cfg...
Thread-Index: AQHVXw0eX3Nouh0x2U+r9QJLsU4U06cTmlKA
Date: Fri, 30 Aug 2019 14:12:37 +0000
Message-ID: <8D7B4AFE-C925-42FE-9FF4-DAC20D46A3D1@citrix.com>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-7-paul.durrant@citrix.com>
In-Reply-To: <20190830082953.2192-7-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5984481B84F1E548A5C884443893CBE4@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMzAgQXVnIDIwMTksIGF0IDA5OjI5LCBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFu
dEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5t
bCAgICAgIHwgICA0ICsNCj4gdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSAgICAgfCAg
IDQgKw0KPiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8ICAxNSArKy0NCg0K
VGhlIE9DYW1sIHBhcnQgbG9va3MgZ29vZCB0byBtZS4gT3B0aW9ucyBhcmUgcmVwcmVzZW50ZWQg
b24gdGhlIE9DYW1sIHNpZGUgYXMgYSBsaXN0IChvZiBhbiBlbnVtZXJhdGlvbiB0eXBlKSBhbmQg
YSBiaXQgdmVjdG9yIGluIEMgYW5kIHRoZSBiaW5kaW5ncyB0cmFuc2xhdGUgYmV0d2VlbiB0aGUg
dHdvLg0KDQrigJQgQyANCg0KLS0gDQpBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
