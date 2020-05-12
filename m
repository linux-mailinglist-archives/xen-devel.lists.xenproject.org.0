Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86971CF996
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 17:47:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYX7k-0000DE-Gg; Tue, 12 May 2020 15:47:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYX7i-0000D9-Pe
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 15:47:14 +0000
X-Inumbo-ID: d911e056-9467-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d911e056-9467-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589298434;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1oxtECHPG/0CvmNLFoQ1Z0B2TgsYdj1TGNyduqlHtec=;
 b=OwJBGNGKawrkcW/bWPvHQ8TtMv5CZnYQFfUDmYX7vjjSZeKRTntbpXXf
 ge3rAnz8+zDvZvuFmqyZ/MEXF4+yBrJJyDs7TJmmUzQ9tshRRfLPqt8Gk
 Dkfcn7oK6zeruNg+77w+9ufRmk84NoqWu5Y1YwisCIji8I6Zka59CqD/T 8=;
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: mIzLOdDsRl7Fk+E4TpFYhzCJp1P8MgjH0zxxr7bJZMq93nUR/KqO7iJrKh92AC48mhaW+wTLtf
 BIMciGu8NI1yUjq+i5Oi1T1YFqo99GUz+w+tDHyBM1gpd9yUl3O2+nzQFoqegep0pqMAiBipen
 huqBLN9y7qGQMZfDnAvqHb90PDFaSvNwVX2UxTFbmN+BPRVwAbyHUEbNC+FJjkyXVOwBQPAs3l
 RutdmcA9vwlANYu/w91mnLiRqioAgj9KxVua2b8LwjXxqh/15lKETUmoaLYGJn9I5iX7KDQJ4S
 Qvg=
X-SBRS: 2.7
X-MesageID: 17355183
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,384,1583211600"; d="scan'208";a="17355183"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Topic: [PATCH 2/3] golang/xenlight: init xenlight go module
Thread-Index: AQHWHzfMuMNvM1D6EUuQ5HJvPIpidKikdZCAgAAILACAAAt9gA==
Date: Tue, 12 May 2020 15:47:09 +0000
Message-ID: <AC8F9121-EA81-4461-A963-F195BE2C070A@citrix.com>
References: <cover.1588282027.git.rosbrookn@ainfosec.com>
 <c38afab85d9fc005edade229896008a4ad5a1929.1588282027.git.rosbrookn@ainfosec.com>
 <3ED0B49D-123C-4925-B3A0-4FA0B44DF9F0@citrix.com>
 <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
In-Reply-To: <CAEBZRSdWCJo9kBnNv6Jqt76E3fb8DDX6C4zndMtvrhngEzGHxg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D4FC0C147D761449A6F7E39CA16AC2A@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDEyLCAyMDIwLCBhdCA0OjA2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERP
IE5PVCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBo
YXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IE9uIFR1ZSwgTWF5IDEyLCAyMDIwIGF0IDEwOjM2IEFNIEdlb3JnZSBEdW5sYXAgPEdlb3Jn
ZS5EdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+PiANCj4+IA0KPj4gDQo+Pj4gT24gQXByIDMw
LCAyMDIwLCBhdCAxMDozOSBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pj4gDQo+Pj4gK21vZHVsZSB4ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAveGVuLmdp
dC90b29scy9nb2xhbmcveGVubGlnaHQNCj4+IA0KPj4gVGhpcyBzaG91bGQgcHJvYmFibHkgYmUg
cy94ZW4veGVucHJvamVjdC87DQo+IA0KPiBBRkFJQ1QsIHRoYXQncyB0aGUgY29ycmVjdCBVUkws
IGUuZy4gWzFdIGFuZCBbMl0uIEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQoNCkZvciB0cmFkZW1h
cmsgcmVhc29ucywgd2hlbiB3ZSBqb2luZWQgdGhlIExpbnV4IEZvdW5kYXRpb24sIHdlIGRpZCBh
IGJpZyByZWJyYW5kaW5nIGZyb20g4oCcWGVu4oCdIHRvIOKAnFhlblByb2plY3TigJ0uICAoU2Vl
IFsxXSBmb3IgbW9yZSBkZXRhaWxzLikgIFRoZSB4ZW4ub3JnIGRvbWFpbnMgYXJlIGp1c3QgZm9y
IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5LiA6LSkNCg0KLUdlb3JnZQ0KDQpbMV0gaHR0cHM6Ly94
ZW5wcm9qZWN0Lm9yZy8yMDEzLzA0LzE3L3VwY29taW5nLWNoYW5nZXMtdG8tdGhlLXhlbi13ZWJz
aXRlcy8NCg0K

