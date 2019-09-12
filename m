Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A52ADB0E2C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:43:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NTE-0003s1-Nr; Thu, 12 Sep 2019 11:41:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjwE=XH=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i8NTC-0003rf-MB
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:41:02 +0000
X-Inumbo-ID: 31b25dd8-d552-11e9-9597-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31b25dd8-d552-11e9-9597-12813bfff9fa;
 Thu, 12 Sep 2019 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568288461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oMDBHolEqeuxgWI1uGzW4fwEiGk2tgmxpUrQr3djO+0=;
 b=fpMXFICaaOd444OGmCC7G2iLCrtB6xXVoDHWM0bEiL/jylISg+ctSlrl
 Piyqs775hlofCQUannOi9fMv7oQ4oOAq7tEpurvhgmxGI2nZQr6k52iU+
 ykj19JNRNOk3ImV5Y8kyZnaP6d4hCqmob4voc/JNUZHaOQ/zUmfLpYKkW Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: 7UFeC0yvM8goqSqaKvtjr+WYt80HQ+XVv4FmDZnoPXzvtHswK4t/BV8pL7NNuWvIU93Rr7BJiU
 wlzr2cvJDnZ1z0nGE/xh9e11kWRgcJpn/OuDif210pbgJ55ZYj67rXYspX0sHve+mIbfsV6H6Q
 gbdAFOeID0sjoHlWoRkj5i8/Q0KhuG25rykgP+2bDrT2j/3AHSEZi6mj1iFlnTmF/p6wj8Udrd
 VIps+YIjYG7Rxg58xjnBa22zQUGPuJQslQNTKxHXrHPsrgcYQWdLsz/rxHvLyy/0WxzD4gOjQR
 30k=
X-SBRS: 2.7
X-MesageID: 5768288
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5768288"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 1/3] xen / notify: introduce a new XenWatchList
 abstraction
Thread-Index: AQHVaK5IAeEfbYTL0UG7WFNcTuDh0Kcns3IAgAA49PA=
Date: Thu, 12 Sep 2019 11:40:54 +0000
Message-ID: <6af73152bb3e4028a4354a30006ad840@AMSPEX02CL03.citrite.net>
References: <20190911143618.23477-1-paul.durrant@citrix.com>
 <20190911143618.23477-2-paul.durrant@citrix.com>
 <20190912101640.GB1308@perard.uk.xensource.com>
In-Reply-To: <20190912101640.GB1308@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] xen / notify: introduce a new
 XenWatchList abstraction
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDEyIFNlcHRlbWJlciAyMDE5IDExOjE3Cj4g
VG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAx
LzNdIHhlbiAvIG5vdGlmeTogaW50cm9kdWNlIGEgbmV3IFhlbldhdGNoTGlzdCBhYnN0cmFjdGlv
bgo+IAo+IE9uIFdlZCwgU2VwIDExLCAyMDE5IGF0IDAzOjM2OjE2UE0gKzAxMDAsIFBhdWwgRHVy
cmFudCB3cm90ZToKPiA+IFhlbnN0b3JlIHdhdGNoIGNhbGwtYmFja3MgYXJlIGFscmVhZHkgYWJz
dHJhY3RlZCBhd2F5IGZyb20gWGVuQnVzIHVzaW5nCj4gPiB0aGUgWGVuV2F0Y2ggZGF0YSBzdHJ1
Y3R1cmUgYnV0IHRoZSBhc3NvY2lhdGVkIE5vdGlmaWVyTGlzdCBtYW5pcHVsYXRpb24KPiA+IGFu
ZCBmaWxlIGhhbmRsZSByZWdpc3RhdGlvbiBpcyBzdGlsbCBvcGVuIGNvZGVkIGluIHZhcmlvdXMg
eGVuX2J1c18uLi4oKQo+ICAgICAgICAgICAgICAgICAgIF4gcmVnaXN0cmF0aW9uCgpPay4KCj4g
PiBmdW5jdGlvbnMuCj4gPiBUaGlzIHBhdGNoIGNyZWF0ZXMgYSBuZXcgWGVuV2F0Y2hMaXN0IGRh
dGEgc3RydWN0dXJlIHRvIGFsbG93IHRoZXNlCj4gPiBpbnRlcmFjdGlvbnMgdG8gYmUgYWJzdHJh
Y3RlZCBhd2F5IGZyb20gWGVuQnVzIGFzIHdlbGwuIFRoaXMgaXMgaW4KPiA+IHByZXBhcmF0aW9u
IGZvciBhIHN1YnNlcXVlbnQgcGF0Y2ggd2hpY2ggd2lsbCBpbnRyb2R1Y2Ugc2VwYXJhdGUgd2F0
Y2ggbGlzdHMKPiA+IGZvciBYZW5CdXMgYW5kIFhlbkRldmljZSBvYmplY3RzLgo+ID4KPiA+IE5P
VEU6IFRoaXMgcGF0Y2ggYWxzbyBpbnRyb2R1Y2VzIGEgbmV3IE5vdGlmaWVyTGlzdEVtcHR5KCkg
aGVscGVyIGZ1bmN0aW9uCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeIG5vdGlmaWVyX2xpc3RfZW1wdHkoKSA/Cj4gCgpPb3BzLCB5ZXMgOi0pCgo+ID4gICAgICAg
Zm9yIHRoZSBwdXJwb3NlcyBvZiBhZGRpbmcgYW4gYXNzZXJ0aW9uIHRoYXQgYSBYZW5XYXRjaExp
c3QgaXMgbm90Cj4gPiAgICAgICBmcmVlZCB3aGlsc3QgaXRzIGFzc29jaWF0ZWQgTm90aWZpZXJM
aXN0IGlzIHN0aWxsIG9jY3VwaWVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVS
QVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAoKVGhhbmtzLAoKICBQYXVsCgo+IC0t
Cj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
