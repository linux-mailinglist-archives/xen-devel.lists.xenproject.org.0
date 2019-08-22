Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B10498DFB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 10:41:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0ibj-0005AY-P0; Thu, 22 Aug 2019 08:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0ibh-0005AT-P3
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 08:38:09 +0000
X-Inumbo-ID: 2ae2b9d0-c4b8-11e9-add2-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ae2b9d0-c4b8-11e9-add2-12813bfff9fa;
 Thu, 22 Aug 2019 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566463089;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p8B/m4yp3PlbVWOnG8tL7EvgB4o+RjmT+DaGsNfA+Uw=;
 b=hxnaUQ/7sIJmBEQZ4X7eE0cfyDcq4jrXhnRkoA+voWjC9+vj5drfzCmj
 ZzRkX0/1c/mq0MyCSY0glkS+4GQKVbFcnmpwbUmUHJqgO/zLuCjZLu2ql
 FSceZWQ12/tdfHOlGsIBGiumfbWHT97nAQrs7NczqerODjy5rCXCRcsl5 k=;
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
IronPort-SDR: WM5O9wQxKkq9DQJ1dsKSsM8CtRLSHDi83DN4ho4tDrsj7accRi5yZ7oVGfYAEMBMPd2p8OZdAT
 Juo6cEtZJTJKCUdFd2hQndc54nosbqFXtLNXZZ1Z6yVfS5/0mIXjabVZdz7LQiPwHT5TEC3KkI
 vgnnoTzvZVST/IebsWB80b4Al8H4I5ANF7ZjYYteVgtZo9PBpfcIhaNYtqorH9hudMYbllCwXd
 qjQcDeBhCzdir8UHJhROzK09FmoM4BUUh3U+XHJ+DBjI/H8JpLiQlD078XnH3s3Wd0lyVE05QI
 73Y=
X-SBRS: 2.7
X-MesageID: 4585888
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4585888"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 4/7] ioreq: allow registering internal ioreq server
 handler
Thread-Index: AQHVWDEPlulwlwC99UOKWtDavsCzH6cFy9FwgADc3QCAAC+GUA==
Date: Thu, 22 Aug 2019 08:38:05 +0000
Message-ID: <5ac6988a64d14239935a8f7acace5d15@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-5-roger.pau@citrix.com>
 <88e62ee14cad4235a377376638a1892f@AMSPEX02CL03.citrite.net>
 <20190822074332.7bl42x3gthqji76k@Air-de-Roger>
In-Reply-To: <20190822074332.7bl42x3gthqji76k@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/7] ioreq: allow registering internal ioreq
 server handler
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
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjIgQXVndXN0IDIwMTkgMDg6NDQKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcg
Q29vcGVyCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC83XSBpb3JlcTogYWxsb3cgcmVnaXN0ZXJpbmcgaW50
ZXJuYWwgaW9yZXEgc2VydmVyIGhhbmRsZXIKPiAKPiBPbiBXZWQsIEF1ZyAyMSwgMjAxOSBhdCAw
NjozNToxNVBNICswMjAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gPiA+IFNlbnQ6IDIxIEF1Z3VzdCAyMDE5IDE1OjU5Cj4gPiA+IFRvOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiA+ID4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsg
SmFuIEJldWxpY2gKPiA+ID4gPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+IFN1Ympl
Y3Q6IFtQQVRDSCA0LzddIGlvcmVxOiBhbGxvdyByZWdpc3RlcmluZyBpbnRlcm5hbCBpb3JlcSBz
ZXJ2ZXIgaGFuZGxlcgo+ID4gPgo+ID4gPiBQcm92aWRlIGEgcm91dGluZSB0byByZWdpc3RlciB0
aGUgaGFuZGxlciBmb3IgYW4gaW50ZXJuYWwgaW9yZXEKPiA+ID4gc2VydmVyLiBOb3RlIHRoZSBo
YW5kbGVyIGNhbiBvbmx5IGJlIHNldCBvbmNlLgo+ID4KPiA+IEknZCBwcmVmZXIgaHZtX3NldF9p
b3JlcV9oYW5kbGVyKCkgYW5kIHNvbWUgc29ydCBvZiBndWFyZCB0byBwcmV2ZW50IGVuYWJsaW5n
IG9mIGFuIGludGVybmFsIHNlcnZlcgo+IHdpdGggbm8gaGFuZGxlciAocHJvYmFibHkgaW4gdGhl
IHByZXZpb3VzIHBhdGNoKSB3b3VsZCBiZSBwcnVkZW50LCBJIHRoaW5rLgo+IAo+IFJpZ2h0LCBJ
IHdpbGwgYWRkIGl0Lgo+IAo+ID4gQWxzbywgd2h5IHRoZSBzZXQtb25jZSBzZW1hbnRpYz8KPiAK
PiBXZWxsLCBJIGRpZG4ndCBoYXZlIHRoZSBuZWVkIHRvIGNoYW5nZSB0aGUgaGFuZGxlciBvZiBp
bnRlcm5hbCBpb3JlcQo+IHNlcnZlcnMgKHZQQ0kpIHNvIEkndmUgY29kZWQgaXQgdGhhdCB3YXku
IElmIHlvdSB0aGluayBpdCdzIGJldHRlciB0bwo+IGFsbG93IHJ1biB0aW1lIGNoYW5nZXMgb2Yg
dGhlIGhhbmRsZXIgdGhhdCdzIGZpbmUsIEkganVzdCBkaWRuJ3QgaGF2ZQo+IHRoZSBuZWVkIGZv
ciBpdCBnaXZlbiB0aGUgY3VycmVudCB1c2UtY2FzZSBhbmQgSSB0aG91Z2h0IGl0IHdvdWxkIGJl
Cj4gc2FmZXIuCj4gCgpJIHRoaW5rIGEgbW9yZSByZWxheGVkIHNlbWFudGljIG9mIG9ubHkgYmVp
bmcgYWJsZSB0byBjaGFuZ2UgdGhlIGhhbmRsZXIgd2hlbiB0aGUgaW9yZXEgc2VydmVyIGlzIGRp
c2FibGVkIHdvdWxkIGJlIGZpbmUuIEFsc28sIEkgd29uZGVyIHdoZXRoZXIgeW91IG91Z2h0IHRv
IGFsbG93IGhhbmRsZXIgcmVnaXN0cmF0aW9uIHRvIHNldCBzb21lIG9wYXF1ZSBjYWxsZXIgY29u
dGV4dCB0b28sIHJhdGhlciB0aGFuIGFzc3VtaW5nIHRoYXQgdGhlIHZjcHUgaXMgdGhlIGFwcHJv
cHJpYXRlIGNvbnRleHQgdG8gcGFzcyB0byBhbGwgaGFuZGxlcnM/CgogIFBhdWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
