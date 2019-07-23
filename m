Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F863719D2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 15:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvEm-00076t-Nv; Tue, 23 Jul 2019 13:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VIRi=VU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hpvEl-00076o-U8
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 13:53:51 +0000
X-Inumbo-ID: 4be21fdc-ad51-11e9-8ea3-77adb38d645f
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4be21fdc-ad51-11e9-8ea3-77adb38d645f;
 Tue, 23 Jul 2019 13:53:49 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QxpvGNZVuoC4fl+TUd97NlxaGtX5pplU8kBlfsi797Xp2NaCxpfPI2VTou7O0WETlDc2D9wTzf
 okLEBFizSETTa+o4j3/8nLLZmbJVfuNX3LzJij05kA1kuSmCNJeJjbkRlvM4Nx5IgUQ0NF3Lw2
 tPUjD6Oju5affkX114Lk0BqI4XQYvwfHuAJzPobTiJnAfg3hxyTXEhE7Gwj6hBsL0++UT7zqWh
 1oJL1A50EO1NPCJYhbGE2rER8uXGiuH3H/u+B4Vc5+HEzCJ5WH7WL7hXzzOt1D2BfbCEId6fBB
 wCo=
X-SBRS: 2.7
X-MesageID: 3416434
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,299,1559534400"; 
   d="scan'208";a="3416434"
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20190722192056.15816-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0eee7e6e-a3d9-ea86-d93b-7da6fb282ddb@citrix.com>
Date: Tue, 23 Jul 2019 14:53:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722192056.15816-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: todo/wishlist
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIvMDcvMjAxOSAyMDoyMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBhLmsuYS4gKGF0IGxl
YXN0IGluIHRoaXMgZm9ybSkgQW5kcmV3J3MgIndvcmsgd2hpY2ggbWlnaHQgYmUgb2ZmbG9hZGFi
bGUgdG8KPiBzb21lb25lIGVsc2UiIGxpc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4g
Q0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDQzogVGlt
IERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ0M6IExhcnMgS3VydGggPGxhcnMu
a3VydGhAY2l0cml4LmNvbT4KPiBDQzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4KPiBS
RkMgZm9yIG9idmlvdXMgcmVhc29ucy4KPgo+IEEgcmVuZGVyZWQgdmVyc2lvbiBvZiB0aGlzIGNh
biBiZSBmb3VuZCBhdDoKPiBodHRwczovL2FuZHJld2Nvb3AteGVuLnJlYWR0aGVkb2NzLmlvL2Vu
L2RvY3Mtd2lzaGxpc3QvbWlzYy93aXNobGlzdC5odG1sCj4KPiBEdXJpbmcgWGVuU3VtbWl0IGlu
IENoaWNhZ28sIGl0IHdhcyBleHByZXNzZWQgc2V2ZXJhbCB0aW1lcyB0aGF0IGhhdmluZyBzb21l
Cj4gdG9kbyBsaXN0cyB3b3VsZCBiZSBhIGJlbmVmaXQsIHRvIGhlbHAgY29vcmRpbmF0ZSB3b3Jr
IGluIHJlbGF0ZWQgYXJlYXMuCj4KPiBIZXJlIGlzIGFuIGF0dGVtcHQgdG8gc3RhcnQgb25lLiAg
Rm9yIG5vdywgaXQgY292ZXJzIG9uZSBzaW5nbGUKPiBpdGVtICh4ZW5zdG9yZWQncyB1c2Ugb2Yg
bm9uLXN0YWJsZSBBUElzKSB0byBnZXQgc29tZSBmZWVkYmFjayBhYm91dCB0aGUKPiBnZW5lcmFs
IGFwcHJvYWNoLiAgSSBoYXZlIHBsZW50eSB0byBnZXQgc3R1Y2sgaW50byBpbiBYZW4gaXRzZWxm
IGlmIHRoaXMgd2F5Cj4gb2YgZXhwcmVzc2luZyB0aGVtIGlzbid0IGRlZW1lZCB1bmFjY2VwdGFi
bGUuCj4KPiBBcyBmb3IgdGhlIHdpc2hsaXN0IGl0c2VsZiwgSSB0aGluayBpdCBpcyBpbXBvcnRh
bnQgdGhhdCBpdCBiZSByZXN0cmljdGVkIHRvCj4gY29uY3JldGUgYWN0aW9ucyAoaS5lLiBhbHJl
YWR5IHBhcnRpYWxseSBncm9vbWVkLCBpZiB5b3Ugc3BlYWsgYWdpbGUpLCB3aGljaAo+IGFyZSBp
ZGVudGlmaWVkIHByb2JsZW1zLCBhbmQgc3VnZ2VzdGVkIGZpeGVzLgo+Cj4gSW4gcGFydGljdWxh
ciwgSSBkb24ndCB0aGluayBpdCBpcyBhcHByb3ByaWF0ZSB0byBkZXZvbHZlIGludG8gYSBidWxs
ZXQgcG9pbnQKPiBsaXN0IG9mIG5ldyBmZWF0dXJlcywgb3IgdGFza3MgbGlrZSAiZG9jdW1lbnQg
JHdob3RzaXQiLiAgSXQgc2hvdWxkIGJlCj4gcmVzdHJpY3RlZCB0byB0aGluZ3Mgd2hpY2ggYXJl
IHJlYWwgcHJvYmxlbXMsIG9uIGV4aXN0aW5nIHN5c3RlbXMsIHdoaWNoIGhhdmUKPiBzb21lIGZv
cndhcmQgcGxhbiBvZiBhY3Rpb24uICBUaGF0IHdheSwgYW55IGRldmVsb3BlciBzaG91bGQgYmUg
YWJsZSB0bwo+IGNyb3NzLXJlZmVyZW5jZSBhdCBsZWFzdCBhdCBhIGhpZ2ggbGV2ZWwsIGFuZCBz
ZWUgaWYgdGhlcmUgYXJlIGFyZWFzIG9mCj4gb3ZlcmxhcHBpbmcgd29yaywgb3Igd2hldGhlciBh
IHNsaWdodGx5IHR3ZWFrZWQgYXBwcm9hY2ggbWlnaHQgYmUgc3VpdGFibGUgZm9yCj4gbXVsdGlw
bGUgYXJlYXMuCj4KPiBBbnl3YXkgLSB0aG91Z2h0cyBmcm9tIHRoZSBwZWFudXQgZ2FsbGVyeT8K
PiAtLS0KPiAgZG9jcy9jb25mLnB5ICAgICAgICAgICB8IDEwICsrKysrKysrKy0KPiAgZG9jcy9p
bmRleC5yc3QgICAgICAgICB8ICA5ICsrKysrKysrKwo+ICBkb2NzL21pc2Mvd2lzaGxpc3QucnN0
IHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Ckl0IGhhcyBiZWVuIHBvaW50ZWQgb3V0IHRoYXQgY2FsbGluZyB0aGlzIHRoZSB3aXNobGlzdCBp
cyBhIHBvb3IgbmFtZS7CoApBIGJldHRlciBuYW1lIHdvdWxkIGJlIHRoZSB0ZWNobmljYWwgZGVi
dCBsaXN0LsKgIEkgd29uJ3QgcmVzZW5kIGZvciBqdXN0CnRoaXMsIGJ1dCBwbGVhc2UgYmVhciBp
dCBpbiBtaW5kIHdoZW4gY29uc2lkZXJpbmcgdGhlIHN1Z2dlc3Rpb24uCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
