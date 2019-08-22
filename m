Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11E98DCB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 10:35:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0iUh-0004gz-LW; Thu, 22 Aug 2019 08:30:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0iUg-0004gu-4s
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 08:30:54 +0000
X-Inumbo-ID: 2717d818-c4b7-11e9-8980-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2717d818-c4b7-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 08:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566462653;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ijJpEX9Ytjz1nDhKjDLhz82wWse1GgdmI8USAeJyzCE=;
 b=gNvx8bTu9mOJKkRl5cgnUVCGz59i3vvppCgtfZnwcprhT8+wcVx8iwlE
 2iqqb1i/IRWyK7tZ0EbfZkXKEjQD+F15hOTjPieiuid74sTEBH0A4zxAu
 ffphe3myF3K2eLmH3qfSATiTASjUJvdDkxUqf7H2PVVUtiLywgKGM/4yd I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: J9WK91mgHsRpYhToQrgGAZ5NxV3lqJD60t0zXIZwTevsSpmGbzB6MoulwTat7CWTr+F9B7Ijcb
 hiTXbnVkk9R/WALa9FKzPV+EJrRcizn0QMM8xf1sMqX+vuh2/lRAsCDDVwDIy/jlbX6id02uQw
 4px51TANp1yS1+ePCOokcJ5chb8EtRRSf0En5DQxDICgy6WzD6X1g6G6PQ0brlrXE86r4Jh6cv
 2lfikITDBclZoh0iWU3Uc1/Ea6OOMpf0vllFsPYTSkkJQUWnvD+5Xp8BvgIMB1w6sVKPFSV4oH
 pj8=
X-SBRS: 2.7
X-MesageID: 4585694
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4585694"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 2/7] ioreq: add internal ioreq initialization support
Thread-Index: AQHVWDENTht/wC90WkCeBfIpEZL2QKcFyL7ggADacICAADO50A==
Date: Thu, 22 Aug 2019 08:30:49 +0000
Message-ID: <ba3f85dc61ec44998eb721d01f889b1e@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-3-roger.pau@citrix.com>
 <fa34f99f038e437495bb4494ecfbec24@AMSPEX02CL03.citrite.net>
 <20190822072351.4h6ahiqnogwyhiat@Air-de-Roger>
In-Reply-To: <20190822072351.4h6ahiqnogwyhiat@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/7] ioreq: add internal ioreq
 initialization support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjIgQXVndXN0IDIwMTkgMDg6MjQKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcg
Q29vcGVyCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMi83XSBpb3JlcTogYWRkIGludGVybmFsIGlvcmVxIGlu
aXRpYWxpemF0aW9uIHN1cHBvcnQKPiAKPiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAwNjoyNDox
N1BNICswMjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gPiA+IFNlbnQ6IDIxIEF1Z3VzdCAyMDE5IDE1OjU5Cj4gPiA+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPiA+ID4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVy
Cj4gPiA+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiA+IFN1YmplY3Q6IFtQ
QVRDSCAyLzddIGlvcmVxOiBhZGQgaW50ZXJuYWwgaW9yZXEgaW5pdGlhbGl6YXRpb24gc3VwcG9y
dAo+ID4gPgo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgaW50ZXJuYWwgaW9yZXEgc2VydmVycyB0byBp
bml0aWFsaXphdGlvbiBhbmQKPiA+ID4gZGVpbml0aWFsaXphdGlvbiByb3V0aW5lcywgcHJldmVu
dCBzb21lIGZ1bmN0aW9ucyBmcm9tIGJlaW5nIGV4ZWN1dGVkCj4gPiA+IGFnYWluc3QgaW50ZXJu
YWwgaW9yZXEgc2VydmVycyBhbmQgYWRkIGd1YXJkcyB0byBvbmx5IGFsbG93IGludGVybmFsCj4g
PiA+IGNhbGxlcnMgdG8gbW9kaWZ5IGludGVybmFsIGlvcmVxIHNlcnZlcnMuIEV4dGVybmFsIGNh
bGxlcnMgKGllOiBmcm9tCj4gPiA+IGh5cGVyY2FsbHMpIGFyZSBvbmx5IGFsbG93ZWQgdG8gZGVh
bCB3aXRoIGV4dGVybmFsIGlvcmVxIHNlcnZlcnMuCj4gPgo+ID4gSXQncyBraW5kIG9mIHVnbHkg
dG8gaGF2ZSB0aGUgZXh0cmEgJ2ludGVybmFsJyBhcmd1bWVudCBwYXNzZWQgdG8gYW55dGhpbmcg
b3RoZXIgdGhhbiB0aGUgY3JlYXRlCj4gZnVuY3Rpb24gc28gSSB3b25kZXIgd2hldGhlciBpdCB3
b3VsZCBiZSBuZWF0ZXIgdG8gZW5jb2RlIGl0IGluIHRoZSBpb3JlcSBzZXJ2ZXIgaWQuIEkuZS4g
d2UgaGF2ZQo+IGRpc3RpbmN0IGlkIHJhbmdlcyBmb3IgaW50ZXJuYWwgYW5kIGV4dGVybmFsIHNl
cnZlcnMuIFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IFRoYXQgd291bGQgYmUgZmluZSwgSSBndWVz
cyBJIGNvdWxkIHVzZSB0aGUgbW9zdCBzaWduaWZpY2FudCBiaXQgaW4KPiB0aGUgaWQgdG8gc2ln
bmFsIHdoZXRoZXIgdGhlIHNlcnZlciBpcyBpbnRlcm5hbCBvciBleHRlcm5hbCwgYW5kCj4gcmVq
ZWN0IGRtb3AgY2FsbHMgdGhhdCB0YXJnZXQgaW50ZXJuYWwgc2VydmVycyBiYXNlZCBvbiB0aGUg
cHJvdmlkZWQKPiBpZC4gRG9lcyB0aGF0IHNvdW5kIHNlbnNpYmxlPwo+IAoKWWVzLCB0aGF0J3Mg
YmFzaWNhbGx5IHdoYXQgSSB3YXMgdGhpbmtpbmcgaW5pdGlhbGx5IGFsdGhvdWdoLCBhcyB5b3Ug
b2JzZXJ2ZSwgaW4gdGhlIHRocmVhZCBmb3IgcGF0Y2ggIzMgaGF2aW5nIHR3byBzbWFsbGVyIGNv
bnNlY3V0aXZlIHJhbmdlcyB3b3VsZCBiZSBtb3JlIGNvbnZlbmllbnQuCgogIFBhdWwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
