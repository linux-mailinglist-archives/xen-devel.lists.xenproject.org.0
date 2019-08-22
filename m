Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0C99949B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 15:10:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0mok-0008LX-Ko; Thu, 22 Aug 2019 13:07:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0moj-0008LQ-P7
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 13:07:53 +0000
X-Inumbo-ID: d8c6eb64-c4dd-11e9-add7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8c6eb64-c4dd-11e9-add7-12813bfff9fa;
 Thu, 22 Aug 2019 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566479271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gJfHn2au20Iq2lSrJPdhvHJ9xu+c4IBhoG1coTJUmOE=;
 b=XwZDGNxNNQ9v5WVKquTW9P+NwAywTQJbt/DJk8aQsBG2zO5tuks+5kTE
 ntvGEkuqCGS65xtmO+e6wFM9NWdOLOJyrYKEuHRdyDMLKRh5dRFut9Z1T
 73CRM0K1BqkyD0nzrGKkaNhCR6pAeJIiduUzfkEFPJydMFvFxcoAKYQ3H U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fyzlzkbXOV+0QpyeClhxjlgCc0r4iAHKRFVOP9DX/dEGaimRZRIXcbJqBp+8aNQjyO04TKvW02
 3qCDLIVJwYwDsA+q+W0uad3sGmB2LusSbkkxQQd3Ge929sOoDS8Y5BIIScFo/CCHYiQ0A7TAPQ
 txu5ERdbJlWD/57s1AVAkYYwMJsfcoHDWc8N4j4yURDa5fU9JUwiKHE8b0glL2CZEiXS884ETm
 FCX8dLgk3QMdUEQ+/FrhdXk1Sh1Z0IOXXk6eQlsUQT9pwvsQmIjjoSQRdMK9N9sDMONhIevjch
 C/c=
X-SBRS: 2.7
X-MesageID: 4766669
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4766669"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH 7/7] ioreq: provide support for long-running operations...
Thread-Index: AQHVWDEVqX2PnQiKcEWyODkgruWJcKcG4uVwgAAc8ACAACNyIA==
Date: Thu, 22 Aug 2019 13:07:47 +0000
Message-ID: <fe1a7334d57343a9973c1baebcc41757@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-8-roger.pau@citrix.com>
 <fd889f4b5aad4c3c99af583043b67f2a@AMSPEX02CL03.citrite.net>
 <20190822125528.fzdhu6wjtsg7v2no@Air-de-Roger>
In-Reply-To: <20190822125528.fzdhu6wjtsg7v2no@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 7/7] ioreq: provide support for long-running
 operations...
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiAyMiBBdWd1c3QgMjAxOSAxMzo1NQo+IFRvOiBQ
YXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc7IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJl
dyBDb29wZXIKPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4KPiBKYWNr
c29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT47IEtvbnJhZCBSemVzenV0ZWsgV2lsawo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgVGltIChYZW4u
b3JnKSA8dGltQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCA3LzddIGlvcmVxOiBwcm92
aWRlIHN1cHBvcnQgZm9yIGxvbmctcnVubmluZyBvcGVyYXRpb25zLi4uCj4gCj4gT24gVGh1LCBB
dWcgMjIsIDIwMTkgYXQgMTE6MTU6NTBBTSArMDIwMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1OQo+
ID4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiA+IENjOiBSb2dlciBQ
YXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJh
bnRAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoCj4gPiA+IDxqYmV1bGljaEBzdXNlLmNvbT47IEFu
ZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPjsgR2VvcmdlCj4gRHVubGFwCj4gPiA+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBJ
YW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbAo+IDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT47Cj4gPiA+IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndp
bGtAb3JhY2xlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IFRpbQo+ID4gPiAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPgo+ID4gPiBTdWJqZWN0OiBbUEFU
Q0ggNy83XSBpb3JlcTogcHJvdmlkZSBzdXBwb3J0IGZvciBsb25nLXJ1bm5pbmcgb3BlcmF0aW9u
cy4uLgo+ID4gPgo+ID4gPiAuLi5hbmQgc3dpdGNoIHZQQ0kgdG8gdXNlIHRoaXMgaW5mcmFzdHJ1
Y3R1cmUgZm9yIGxvbmcgcnVubmluZwo+ID4gPiBwaHlzbWFwIG1vZGlmaWNhdGlvbiBvcGVyYXRp
b25zLgo+ID4gPgo+ID4gPiBUaGlzIGFsbG93cyB0byBnZXQgcmlkIG9mIHRoZSB2UENJIHNwZWNp
ZmljIG1vZGlmaWNhdGlvbnMgZG9uZSB0bwo+ID4gPiBoYW5kbGVfaHZtX2lvX2NvbXBsZXRpb24g
YW5kIGFsbG93cyBnZW5lcmFsaXppbmcgdGhlIHN1cHBvcnQgZm9yCj4gPiA+IGxvbmctcnVubmlu
ZyBvcGVyYXRpb25zIHRvIG90aGVyIGludGVybmFsIGlvcmVxIHNlcnZlcnMuIFN1Y2ggc3VwcG9y
dAo+ID4gPiBpcyBpbXBsZW1lbnRlZCBhcyBhIHNwZWNpZmljIGhhbmRsZXIgdGhhdCBjYW4gYmUg
cmVnaXN0ZXJzIGJ5IGludGVybmFsCj4gPiA+IGlvcmVxIHNlcnZlcnMgYW5kIHRoYXQgd2lsbCBi
ZSBjYWxsZWQgdG8gY2hlY2sgZm9yIHBlbmRpbmcgd29yay4KPiA+ID4gUmV0dXJuaW5nIHRydWUg
ZnJvbSB0aGlzIGhhbmRsZXIgd2lsbCBwcmV2ZW50IHRoZSB2Y3B1IGZyb20gcnVubmluZwo+ID4g
PiB1bnRpbCB0aGUgaGFuZGxlciByZXR1cm5zIGZhbHNlLgo+ID4KPiA+IFJhdGhlciB0aGFuIGhh
dmluZyBhbm90aGVyIGNhbGxiYWNrIGNhbiB0aGUgaGFuZGxlciBub3QgYmUgcmUtY2FsbGVkIHdp
dGggc2FtZSBpb3JlcT8gSXQgY291bGQKPiByZXR1cm4gZGlmZmVyZW50IHZhbHVlcyBkZXBlbmRp
bmcgb24gd2hldGhlciB0aGVyZSBpcyBtb3JlIHdvcmsgdG8gZG8gKHJlcXVpcmluZyBhbm90aGVy
IGNhbGwpIG9yCj4gd2hldGhlciBpdCBpcyBkb25lIGFuZCB0aGUgdmNwdSBjYW4gYmUgcmVzdW1l
ZC4gV291bGQgdGhhdCB3b3JrPwo+IAo+IEkgZ3Vlc3MgdGhpcyB3b3VsZCB3b3JrIGFsc28uIFRo
ZSBpc3N1ZSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCBJCj4gd291bGQgaGF2ZSB0byBmaW5k
IHNvbWV3aGVyZSB0byBzdG9yZSB0aGUgaW9yZXEgd2hpbGUgdGhlIG9wZXJhdGlvbiBpcwo+IGJl
aW5nIHByb2Nlc3NlZCwgd2hpY2ggaXMgbm90IHJlcXVpcmVkIHdpdGggdGhlIHByb3Bvc2VkIHR3
byBoYW5kbGVyCj4gYXBwcm9hY2guCgpUaGUgaW9yZXEgYWxyZWFkeSBpcyBzdG9yZWQgaW4gdi0+
YXJjaC5odm0uaHZtX2lvLmlvX3JlcSBhbnl3YXksIHNvIGNhbid0IHlvdSB1c2UgdGhhdCBjb3B5
PwoKICBQYXVsCgo+IAo+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
