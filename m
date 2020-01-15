Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2013BCF9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:00:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfPx-0008Mi-PR; Wed, 15 Jan 2020 09:56:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eK3x=3E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1irfPv-0008Md-S9
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 09:56:51 +0000
X-Inumbo-ID: 576304be-377d-11ea-84fc-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 576304be-377d-11ea-84fc-12813bfff9fa;
 Wed, 15 Jan 2020 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579082207;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4jX0UaAhOhz+j+f++t2h3Uzm2FO3ZmgEaxH9TcXIA4c=;
 b=L80f7BAfT+qzUK0eHl60ZsNb2lEoUIO4uze++VqQLReByT671O8uG5Al
 cZxqwO3gMp+nWmOtDDVj6d+scQXjyKgW0CGbbRXJKSywKaS46l4BW4NNa
 sC2tvFTCxaI/JwWdbrGoUX1sn3zOJDzsgZOkN/pH/Snrmq8H0LtQQqJOz k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7YW7sdenhbewQK0ZOWGfwkQPAS7q0MWeWRi+oWFTCzqJo3aippfVpyJxDf/0OndvzpDPo60wGr
 KdW0iY2jDlRZDV6qP9UglFhhn7toALRyg17hDuTe3RIsuzXPbDvFa/Tpy36/Dhuyo9cY3ReW26
 1IkmKOqxSzYOsf85R7x7wzYcpshnz79QAu0LJ+Otsk3sFE9uopVuyREWPViPVPSc9dcz5pBeJz
 +AxzXcFccQ56I2z3ce2NZausUxXbtaECGCFXdIY7CYOTEd9Ge0SyOZtmkh5BO/PUjm7xjyPtjS
 2eY=
X-SBRS: 2.7
X-MesageID: 11101388
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="11101388"
Date: Wed, 15 Jan 2020 10:56:37 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200115095637.GI11756@Air-de-Roger>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
 <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Ping: [PATCH v2] dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMDU6MjY6MzRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDcuMjAxOSAwODo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBXaXRoIG5v
bi1lbXB0eSBDT05GSUdfRE9NMF9NRU0gY2xhbmc1IHByb2R1Y2VzCj4gPiAKPiA+IGRvbTBfYnVp
bGQuYzozNDQ6MjQ6IGVycm9yOiB1c2Ugb2YgbG9naWNhbCAnJiYnIHdpdGggY29uc3RhbnQgb3Bl
cmFuZCBbLVdlcnJvciwtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFuZF0KPiA+ICAgICAgaWYgKCAh
ZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBeICB+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5v
dGU6IHVzZSAnJicgZm9yIGEgYml0d2lzZSBvcGVyYXRpb24KPiA+ICAgICAgaWYgKCAhZG9tMF9t
ZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBefgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgJgo+ID4gZG9tMF9idWlsZC5jOjM0NDoy
NDogbm90ZTogcmVtb3ZlIGNvbnN0YW50IHRvIHNpbGVuY2UgdGhpcyB3YXJuaW5nCj4gPiAgICAg
IGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAxIGVycm9yIGdlbmVyYXRl
ZC4KPiA+IAo+ID4gT2J2aW91c2x5IG5laXRoZXIgb2YgdGhlIHR3byBzdWdnZXN0aW9ucyBhcmUg
YW4gb3B0aW9uIGhlcmUuIE9kZGx5Cj4gPiBlbm91Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9m
IHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0aW5nIG9yCj4gPiBwYXJlbnRoZXNpemluZyBk
b2Vzbid0LiBBbm90aGVyIHdvcmthYmxlIHZhcmlhbnQgbG9va3MgdG8gYmUgdGhlIHVzZSBvZgo+
ID4gISEgb24gdGhlIGNvbnN0YW50Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiAtLS0KPiA+IHYyOiBBbHNvIGFkanVzdCB0aGUgQXJt
IGluY2FybmF0aW9uIG9mIHRoZSBzYW1lIGNvbnN0cnVjdC4KPiA+IC0tLQo+ID4gSSdtIG9wZW4g
dG8gZ29pbmcgdGhlICEhIG9yIHlldCBzb21lIGRpZmZlcmVudCByb3V0ZSAoYnV0IG5vdCByZWFs
bHkgdGhlCj4gPiBzdWdnZXN0ZWQgc3RybGVuKCkgb25lKS4gTm8gbWF0dGVyIHdoaWNoIG9uZSB3
ZSBjaG9vc2UsIEknbSBhZnJhaWQgaXQgaXMKPiA+IGdvaW5nIHRvIHJlbWFpbiBndWVzc3dvcmsg
d2hhdCBuZXdlciAoYW5kIGZ1dHVyZSkgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbAo+ID4gY2hva2Ug
b24uCj4gCj4gSSBndWVzcyB0aGUgZGlzYWdyZWVtZW50IG9uIGhvdyB0byBleGFjdGx5IGFkZHJl
c3MgdGhlIGlzc3VlIGhhcwo+IHN0YWxsZWQgdGhpcy4gQnV0IEkgdGhpbmsgd2Ugc2hvdWxkIHJh
dGhlciBoYXZlIF9zb21lXyAoZS5nLgo+IHRoaXMpIHNvbHV0aW9uIGluIHRoZSByZXBvLCB0aGFu
IGNvbnRpbnVlIHRvIHNoaXAgdmVyc2lvbnMgd2hpY2gKPiBkb24ndCBidWlsZC4gUGVvcGxlIHdh
bnRpbmcgdG8gYmVhdXRpZnkgdGhlIGNvZGUgZnVydGhlciBjb3VsZAo+IHRoZW4gc3VibWl0IGlu
Y3JlbWVudGFsIHBhdGNoZXMuCgpBY2tlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+CgpJJ20gbm90IHByb3ZpZGluZyBhIFJCIGJlY2F1c2UgdGhpcyBpcyBhbGwg
Z3Vlc3N3b3JrLCBzbyBpdCBkb2Vzbid0CmZlZWwgYXBwcm9wcmlhdGUgdG8gcmV2aWV3IHNvbWV0
aGluZyB0aGF0J3MgYmFzZWQgb24gdW5kb2N1bWVudGVkCmNvbXBpbGVyIGJlaGF2aW9yLgoKQW5v
dGhlciBvcHRpb24gd291bGQgYmUgdG8gcGFzcyAtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFuZCBi
dXQgdGhhdAp3b3VsZCBwcmV2ZW50IGNhY2hpbmcgc29tZSBsaWNpdCBpc3N1ZXMuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
