Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31D1517C2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:25:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyuQO-0008Ua-Vn; Tue, 04 Feb 2020 09:23:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyuQN-0008UU-QO
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:23:15 +0000
X-Inumbo-ID: f83bec2c-472f-11ea-8ef8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f83bec2c-472f-11ea-8ef8-12813bfff9fa;
 Tue, 04 Feb 2020 09:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580808194;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WUGdi8VcYoYnhSHnem6XUL0c1HLR7KLK4K8bszzc80k=;
 b=ZhDInlEM58GN487F6cBnUB6MqTr1+1ElCAOZVmDYGY5YijoGHlL4JNwt
 9UkYZDwNWsfpUlXdYO8cS/5snMV09KpdRWPOZtA3/Plep47K2gwR8DxjK
 4qsqtL4G9C/JVKy1FuS7Fn6M2wt0M++JN1K2RlcYlhaxjiswg0Kbcw8D6 M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Gf8zkBP7z5ZaCbax2N9F3snYtU6DU8gWsjJHF2kxHD2RvfFqdIKWjU//Mbt9mfLQGcJr1lEWF3
 uU0c+JkWTzOlSnKoEb6XhVnr4ZZpoXVH1ZC3tLGSgzUHpTEmH7N4WDkoV2RULVzJ3eP51tBFpy
 foF1jOjuB77OGbNxaD1j63CEBHEF7lQNwDONpLFc2yOo3aYphjcxjVokcKTgOWbPE/WUDws7Rv
 dPmmFXxsFaMssHWdJ73TNuFcQpUB00yWkD3yh9TBEZenbG7cwTniDH6FoqcWdfvuSYlTCUU4ba
 Y8Y=
X-SBRS: 2.7
X-MesageID: 12517268
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12517268"
Date: Tue, 4 Feb 2020 10:23:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200204092305.GE4679@Air-de-Roger>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7658FC@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7658FC@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDE6MzU6MDVBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4g
U2VudDogTW9uZGF5LCBGZWJydWFyeSAzLCAyMDIwIDg6MTkgUE0KPiA+IAo+ID4gV2hlbiBkb2lu
ZyBhIHZpcnR1YWwgdm1leGl0IChpZTogYSB2bWV4aXQgaGFuZGxlZCBieSB0aGUgTDEgVk1NKQo+
ID4gaW50ZXJydXB0cyBzaG91bGRuJ3QgYmUgaW5qZWN0ZWQgdXNpbmcgdGhlIHZpcnR1YWwgaW50
ZXJydXB0IGRlbGl2ZXJ5Cj4gPiBtZWNoYW5pc20gdW5sZXNzIHRoZSBBY2sgb24gZXhpdCB2bWV4
aXQgY29udHJvbCBiaXQgaXNuJ3Qgc2V0IGluIHRoZQo+ID4gbmVzdGVkIHZtY3MuCj4gPiAKPiA+
IEdhdGUgdGhlIGNhbGwgdG8gbnZteF91cGRhdGVfYXBpY3YgaGVscGVyIG9uIHdoZXRoZXIgdGhl
IG5lc3RlZCB2bWNzCj4gPiBoYXMgdGhlIEFjayBvbiBleGl0IGJpdCBzZXQgaW4gdGhlIHZtZXhp
dCBjb250cm9sIGZpZWxkLgo+ID4gCj4gPiBOb3RlIHRoYXQgdGhpcyBmaXhlcyB0aGUgdXNhZ2Ug
b2YgeDJBUElDIGJ5IHRoZSBMMSBWTU0sIGF0IGxlYXN0IHdoZW4KPiA+IHRoZSBMMSBWTU0gaXMg
WGVuLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+LCB3aXRoIGEgc21hbGwgY29tbWVudDoKPiAKPiA+IC0tLQo+ID4gQ2hhbmdlcyBzaW5j
ZSB2MToKPiA+ICAtIENhbGwgbnZteF91cGRhdGVfYXBpY3YgaWYgdGhlICJBY2sgb24gZXhpdCIg
dm1leGl0IGNvbnRyb2wgYml0Cj4gPiAgICBpc24ndCBzZXQuCj4gPiAtLS0KPiA+ICB4ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMgfCA3ICsrKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKPiA+IGlu
ZGV4IGQ4YWIxNjdkNjIuLjNkOTdhMjkzYjIgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ID4g
QEAgLTEzOTMsNyArMTM5MywxMiBAQCBzdGF0aWMgdm9pZCB2aXJ0dWFsX3ZtZXhpdChzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncwo+ID4gKnJlZ3MpCj4gPiAgICAgIC8qIHVwZGF0aW5nIGhvc3QgY3IwIHRv
IHN5bmMgVFMgYml0ICovCj4gPiAgICAgIF9fdm13cml0ZShIT1NUX0NSMCwgdi0+YXJjaC5odm0u
dm14Lmhvc3RfY3IwKTsKPiA+IAo+ID4gLSAgICBpZiAoIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50
cl9kZWxpdmVyeSApCj4gPiArICAgIGlmICggY3B1X2hhc192bXhfdmlydHVhbF9pbnRyX2RlbGl2
ZXJ5ICYmCj4gPiArICAgICAgICAgLyoKPiA+ICsgICAgICAgICAgKiBPbmx5IGluamVjdCB0aGUg
dmVjdG9yIGlmIHRoZSBBY2sgb24gZXhpdCBiaXQgaXMgbm90IHNldCwgZWxzZSB0aGUKPiA+ICsg
ICAgICAgICAgKiBpbnRlcnJ1cHQgd2lsbCBiZSBzaWduYWxlZCBpbiB0aGUgdm1jcyBWTV9FWElU
X0lOVFJfSU5GTyBmaWVsZC4KPiA+ICsgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAhKGdldF92
dm1jcyh2LCBWTV9FWElUX0NPTlRST0xTKSAmIFZNX0VYSVRfQUNLX0lOVFJfT05fRVhJVCkgKQo+
IAo+IEl0J3MgYSBiaXQgb2RkIHRvIHB1dCBjb21tZW50IGJldHdlZW4gY29kZSBsaW5lcy4gQ2Fu
IHlvdSBtb3ZlIGl0IHRvCj4gdGhlIGxpbmUgYmVmb3JlICdpZic/CgpJIHVzdWFsbHkgdHJ5IHRv
IGtlZXAgdGhlIGNvbW1lbnRzIGFzIGNsb3NlIHRvIHRoZSBjb2RlIGl0IHJlZmVyZW5jZXMKYXMg
cG9zc2libGUsIGV2ZW4gaWYgdGhhdCBtZWFucyBhZGRpbmcgdGhlbSBpbiB0aGUgbWlkZGxlIG9m
IGFuIGlmCmNvbmRpdGlvbi4KCkkgZG9uJ3QgbWluZCBtb3ZpbmcgaXQsIGJ1dCBtYXliZSB0aGUg
Y29tbWl0dGVyIGNhbiBkbyBpdCBhdCBjb21taXQKdGltZT8KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
