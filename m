Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F782159500
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 17:33:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1YRQ-0004k5-TA; Tue, 11 Feb 2020 16:31:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=46st=37=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1YRP-0004jy-GD
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 16:31:15 +0000
X-Inumbo-ID: eb1e6468-4ceb-11ea-8876-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb1e6468-4ceb-11ea-8876-bc764e2007e4;
 Tue, 11 Feb 2020 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581438674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gSLike1uWuO09y1i7IOR69lSPULZjQjrgJiBstUz1O8=;
 b=H/XC8t24wI/T1xZ6gmKd5CNmdQGsN0IAce5ad3C7VSEpyXhExPdJhs05
 OifwSnSKvRMVg0texTNrgTib5ZmoZT15qvsw+iohRM3ZTCgym81rZ6GLA
 t96JR4Z2+kp8D1P0dHKkW0OkZ6m01T7QvmIDQH/BhvURtbD8iUaaX7ef5 w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I/qKiTYyY/AdNpe6qUi2u7ba4R55L4PbWSv9UFyKT0WFwGQ3zm5Okjd3i1AfWX2CIetHYyNZxN
 OvZXda20BGmm8ZW+Tmy5GQQVH4kxCTozOPNThWm4DefSzLdE8UACvAFUmMLiriUxWkyuD5fb+m
 UVCRcz4iU43s+lWAygEVZ45rWsrIpK1tKbDJ54oOOGRHBtBfc6mLpY2AgBePj3oEbeNOtAsx2P
 yGIPOHgu2HNQ7FbGOmTOfSL0DsXTBpdnshsWHGnARKWwaOvzl6S1g3iJTIQFx4dMAPiGuWEuFX
 XV4=
X-SBRS: 2.7
X-MesageID: 12277145
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12277145"
Date: Tue, 11 Feb 2020 17:31:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200211163104.GM4679@Air-de-Roger>
References: <20200211155155.17396-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211155155.17396-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Claudia <claudia1@disroot.org>,
 Wei Liu <wl@xen.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDM6NTE6NTRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDdXJyZW50bHkgd2hlbiBib290aW5nIG5hdGl2ZSBvbiBBTUQgaGFyZHdhcmUsIGNw
dWlkbWFza19kZWZhdWx0cy5fMWNkIGdldHMKPiBjb25maWd1cmVkIHdpdGggdGhlIEhZUEVSVklT
T1IgYml0IGJlZm9yZSBuYXRpdmUgQ1BVSUQgaXMgc2Nhbm5lZCBmb3IgZmVhdHVyZQo+IGJpdHMu
Cj4gCj4gVGhpcyByZXN1bHRzIGluIGNwdV9oYXNfaHlwZXJ2aXNvciBiZWNvbWluZyBzZXQgYXMg
cGFydCBvZiBpZGVudGlmeV9jcHUoKSwgYW5kCj4gZW5kcyB1cCBhcHBlYXJpbmcgaW4gdGhlIHJh
dyBhbmQgaG9zdCBDUFUgcG9saWNpZXMuCj4gCj4gQSBjb21iaW5hdGlvbiBvZiB0aGlzIGJ1Zywg
YW5kIGMvcyBiYjUwMmE4Y2E1OSAieDg2OiBjaGVjayBmZWF0dXJlIGZsYWdzIGFmdGVyCj4gcmVz
dW1lIiB3aGljaCBjaGVja3MgdGhhdCBmZWF0dXJlIGJpdHMgZG9uJ3QgZ28gbWlzc2luZywgcmVz
dWx0cyBpbiBicm9rZW4gUzMKPiBvbiBBTUQgaGFyZHdhcmUuCj4gCj4gQWx0ZXIgYW1kX2luaXRf
bGV2ZWxsaW5nKCkgdG8gZXhjbHVkZSB0aGUgSFlQRVJWSVNPUiBiaXQgZnJvbQo+IGNwdW1hc2tf
ZGVmYXVsdHMsIGFuZCB1cGRhdGUgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpIHRvIGFsbG93
IGl0IHRvIGJlCj4gZXhwbGljaXRseSBmb3J3YXJkZWQuCj4gCj4gVGhpcyBhbHNvIGZpeGVzIGEg
YnVnIG9uIGtleGVjLCB3aGVyZSB0aGUgaHlwZXJ2aXNvciBiaXQgaXMgbGVmdCBlbmFibGVkIGZv
cgo+IHRoZSBuZXcga2VybmVsIHRvIGZpbmQuCj4gCj4gVGhlc2UgY2hhbmdlcyBoaWdobGlnaHQg
YSBmdXJ0aGVyIGJ1dCAtIGRvbTAgY29uc3RydWN0aW9uIGlzIGFzeW1ldHJpYyB3aXRoCj4gZG9t
VSBjb25zdHJ1Y3Rpb24sIGJ5IG5vdCBoYXZpbmcgYW55IGNhbGxzIHRvIGRvbWFpbl9jcHVfcG9s
aWN5X2NoYW5nZWQoKS4KPiBFeHRlbmQgYXJjaF9kb21haW5fY3JlYXRlKCkgdG8gYWx3YXlzIGNh
bGwgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgo+IAo+IFJlcG9ydGVkLWJ5OiBJZ29yIERy
dXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENDOiBJZ29yIERydXpo
aW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KPiBDQzogTWFyZWsgTWFyY3p5a293c2tp
LUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+IENDOiBDbGF1ZGlh
IDxjbGF1ZGlhMUBkaXNyb290Lm9yZz4KPiAKPiB2MjoKPiAgKiBSZXdyaXRlIHRoZSBjb21taXQg
bWVzc2FnZS4gIE5vIGNoYW5nZSB0byB0aGUgcGF0Y2ggY29udGVudC4KPiAKPiBNYXJlay9DbGF1
ZGlhOiBEbyBlaXRoZXIgb2YgeW91IHdhbnQgYSBSZXBvcnRlZC1ieSB0YWcgc2VlaW5nIGFzIHlv
dSBmb3VuZCBhCj4gYnJhbmQgbmV3IHdheSB0aGF0IHRoaXMgd2FzIGJyb2tlbj8KPiAtLS0KPiAg
eGVuL2FyY2gveDg2L2NwdS9hbWQuYyAgICAgICB8IDMgLS0tCj4gIHhlbi9hcmNoL3g4Ni9kb21h
aW4uYyAgICAgICAgfCAyICsrCj4gIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgfCA5ICsr
KysrKysrLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwgMiArKwo+ICA0IGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCj4gaW5k
ZXggZTM1MWRkMjI3Zi4uZjk1YThlMGZkMyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1
L2FtZC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwo+IEBAIC0yOTgsOSArMjk4LDYg
QEAgc3RhdGljIHZvaWQgX19pbml0IG5vaW5saW5lIGFtZF9pbml0X2xldmVsbGluZyh2b2lkKQo+
ICAJCQllY3ggfD0gY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX09TWFNBVkUpOwo+ICAJCWVkeCB8
PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfQVBJQyk7Cj4gIAo+IC0JCS8qIEFsbG93IHRoZSBI
WVBFUlZJU09SIGJpdCB0byBiZSBzZXQgdmlhIGd1ZXN0IHBvbGljeS4gKi8KPiAtCQllY3ggfD0g
Y3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpOwo+IC0KPiAgCQljcHVpZG1hc2tf
ZGVmYXVsdHMuXzFjZCA9ICgodWludDY0X3QpZWN4IDw8IDMyKSB8IGVkeDsKPiAgCX0KPiAgCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4u
Ywo+IGluZGV4IGY1M2FlNWZmODYuLjEyYmQ1NTQzOTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L2RvbWFpbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4gQEAgLTY1Niw2ICs2
NTYsOCBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAg
Ki8KPiAgICAgIGQtPmFyY2gueDg3X2ZpcF93aWR0aCA9IGNwdV9oYXNfZnB1X3NlbCA/IDAgOiA4
Owo+ICAKPiArICAgIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoZCk7Cj4gKwo+ICAgICAgcmV0
dXJuIDA7Cj4gIAo+ICAgZmFpbDoKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5j
IGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gaW5kZXggNGZhOWM5MTE0MC4uY2U3NmQ2ZDc3NiAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYv
ZG9tY3RsLmMKPiBAQCAtNDgsNyArNDgsNyBAQCBzdGF0aWMgaW50IGdkYnN4X2d1ZXN0X21lbV9p
byhkb21pZF90IGRvbWlkLCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZGJzeF9tZW1pbyAqaW9wKQo+ICB9
Cj4gICNlbmRpZgo+ICAKPiAtc3RhdGljIHZvaWQgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZChz
dHJ1Y3QgZG9tYWluICpkKQo+ICt2b2lkIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0
IGRvbWFpbiAqZCkKPiAgewo+ICAgICAgY29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqcCA9IGQt
PmFyY2guY3B1aWQ7Cj4gICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiBAQCAtMTA2LDYgKzEwNiwxMyBA
QCBzdGF0aWMgdm9pZCBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQp
Cj4gICAgICAgICAgICAgICAgICAgICAgZWN4ID0gMDsKPiAgICAgICAgICAgICAgICAgIGVkeCA9
IGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9BUElDKTsKPiAgCj4gKyAgICAgICAgICAgICAgICAv
Kgo+ICsgICAgICAgICAgICAgICAgICogSWYgdGhlIEh5cGVydmlzb3IgYml0IGlzIHNldCBpbiB0
aGUgcG9saWN5LCB3ZSBjYW4gYWxzbwo+ICsgICAgICAgICAgICAgICAgICogZm9yd2FyZCBpdCBp
bnRvIHJlYWwgQ1BVSUQuCj4gKyAgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAg
IGlmICggcC0+YmFzaWMuaHlwZXJ2aXNvciApCj4gKyAgICAgICAgICAgICAgICAgICAgZWN4IHw9
IGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9IWVBFUlZJU09SKTsKCkFGQUlDVCBkb20wIHdpbGwg
YWxzbyBnZXQgdGhlIGh5cGVydmlzb3IgYml0IHNldCBieSBkZWZhdWx0LCBhcyB0aGF0J3MKcGFy
dCBvZiBib3RoIHRoZSBIVk0gYW5kIHRoZSBQViBtYXggcG9saWN5PwoKSWYgc286CgpSZXZpZXdl
ZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
