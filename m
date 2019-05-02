Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A811A28
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBil-00049N-97; Thu, 02 May 2019 13:25:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3XpE=TC=citrix.com=prvs=01897380a=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hMBij-00049A-NP
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:25:53 +0000
X-Inumbo-ID: c8955652-6cdd-11e9-b539-e3eb5712b11f
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8955652-6cdd-11e9-b539-e3eb5712b11f;
 Thu, 02 May 2019 13:25:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89571122"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH 4/9] x86/HVM: move NOFLUSH handling out of hvm_set_cr3()
Thread-Index: AQHVAOFwWaoJEinsVUGNsqQ5W7H/p6ZXySzg///n3QCAACG+4A==
Date: Thu, 2 May 2019 13:25:28 +0000
Message-ID: <23dc884cebc74311ac4b00880cfa7458@AMSPEX02CL03.citrite.net>
References: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
 <5CCAE08D020000780022B307@prv1-mh.provo.novell.com>
 <42621a15169c4a409efa29e3d2d7e06e@AMSPEX02CL03.citrite.net>
 <5CCAEF34020000780022B400@prv1-mh.provo.novell.com>
In-Reply-To: <5CCAEF34020000780022B400@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIFttYWlsdG86
SkJldWxpY2hAc3VzZS5jb21dCj4gU2VudDogMDIgTWF5IDIwMTkgMTQ6MjMKPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8QW5k
cmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0
cml4LmNvbT47IFJvZ2VyIFBhdQo+IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWwgPHhlbi0KPiBkZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4KPiBTdWJqZWN0OiBSRTogW1BBVENIIDQvOV0geDg2L0hWTTogbW92ZSBO
T0ZMVVNIIGhhbmRsaW5nIG91dCBvZiBodm1fc2V0X2NyMygpCj4gCj4gPj4+IE9uIDAyLjA1LjE5
IGF0IDE1OjA3LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IEZyb206IEph
biBCZXVsaWNoIFttYWlsdG86SkJldWxpY2hAc3VzZS5jb21dCj4gPj4gU2VudDogMDIgTWF5IDIw
MTkgMTM6MjAKPiA+Pgo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZW11bGF0ZS5jCj4gPj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPiA+PiBAQCAtMjA3Miw2ICsyMDcyLDgg
QEAgc3RhdGljIGludCBodm1lbXVsX3dyaXRlX2NyKAo+ID4+ICAgICAgSFZNVFJBQ0VfTE9OR18y
RChDUl9XUklURSwgcmVnLCBUUkNfUEFSX0xPTkcodmFsKSk7Cj4gPj4gICAgICBzd2l0Y2ggKCBy
ZWcgKQo+ID4+ICAgICAgewo+ID4+ICsgICAgICAgIGJvb2wgbm9mbHVzaDsKPiA+PiArCj4gPgo+
ID4gV2h5IGludHJvZHVjZSAnbm9mbHVzaCcgd2l0aCB0aGlzIHNjb3BlIHdoZW4gaXQgY291bGQg
YmUgbGltaXRlZCB0byAnY2FzZQo+ID4gMzonLCBhbHRob3VnaC4uLgo+IAo+IEJlY2F1c2UgdGhp
cyB3b3VsZCBlbnRhaWwgaW50cm9kdWNpbmcgYW5vdGhlciBzZXQgb2YgYnJhY2VzLCBhbmQKPiBJ
IHByZXR0eSBtdWNoIGRpc2xpa2UgdGhlc2UgY2FzZS1ibG9jayBicmFjZXM6IFRoZXkgZWl0aGVy
IGRvbid0Cj4gcHJvcGVybHkgaW5kZW50IChhcyB3ZSBkbyBjb21tb25seSksIG9yIHRoZXkgbmVl
ZGxlc3NseSBpbmNyZWFzZQo+IGluZGVudGF0aW9uIG9mIHRoZSBlbmNsb3NlZCBibG9jay4gSGVu
Y2UgbXkgZ2VuZXJhbCBwcmVmZXJlbmNlCj4gb2Ygc3dpdGNoLXNjb3BlIGxvY2FsIHZhcmlhYmxl
cy4KPiAKPiA+PiBAQCAtMjA4Miw3ICsyMDg0LDEwIEBAIHN0YXRpYyBpbnQgaHZtZW11bF93cml0
ZV9jcigKPiA+PiAgICAgICAgICBicmVhazsKPiA+Pgo+ID4+ICAgICAgY2FzZSAzOgo+ID4+IC0g
ICAgICAgIHJjID0gaHZtX3NldF9jcjModmFsLCB0cnVlKTsKPiA+PiArICAgICAgICBub2ZsdXNo
ID0gaHZtX3BjaWRfZW5hYmxlZChjdXJyZW50KSAmJiAodmFsICYgWDg2X0NSM19OT0ZMVVNIKTsK
PiA+PiArICAgICAgICBpZiAoIG5vZmx1c2ggKQo+ID4+ICsgICAgICAgICAgICB2YWwgJj0gflg4
Nl9DUjNfTk9GTFVTSDsKPiA+Cj4gPiAuLi4gY2FuJ3QgeW91IGp1c3QgY29kZSB0aGlzIGFzOgo+
ID4KPiA+IGlmICggaHZtX3BjaWRfZW5hYmxlZChjdXJyZW50KSApCj4gPiAgICAgdmFsICY9IH5Y
ODZfQ1IzX05PRkxVU0g7Cj4gPgo+ID4gPwo+IAo+IEJlY2F1c2Ugb2YgLi4uCj4gCj4gPj4gKyAg
ICAgICAgcmMgPSBodm1fc2V0X2NyMyh2YWwsIG5vZmx1c2gsIHRydWUpOwo+IAo+IC4uLiB0aGlz
IGZ1cnRoZXIgdXNlIG9mICJub2ZsdXNoIiAoYWxvbmdzaWRlIHRoZSBhZGp1c3RlZCAidmFsIiku
Cj4gCgpBaCwgbWlzc2VkIHRoYXQuLi4gSSdkIHN0aWxsIGdvIGZvciB0aGUgdGlnaHRlciBzY29w
ZSB0aG91Z2gsIGJ1dCB0aGVuIEkgZG9uJ3QgbWluZCB0aGUgZXh0cmEgYnJhY2VzLgoKICBQYXVs
Cgo+IEphbgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
