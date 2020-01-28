Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4914B3E0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:00:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwPVm-0004JL-4z; Tue, 28 Jan 2020 11:58:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwPVj-0004JE-Qu
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 11:58:27 +0000
X-Inumbo-ID: 7de468ec-41c5-11ea-8396-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7de468ec-41c5-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 11:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580212707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fkxywXyx3TshAlYvtu/9ufilo7eW6wjVnk59xBLsFZY=;
 b=ZVqgBHtwC+rwvSx5kCUnC1ai6qY1Q5c64Ic0FSuag40HxIFlGufKIY2X
 /zQ1HJIza03ipzfSLlGQixXkjE/k77b3uZcI8YzaIcHboP9+v5fHGFW1Y
 CwXQt7GzaaVVAUm6v5AwdbTWzzeCFpzzzydZyv1FNe9MVUqvucM8Byd0F A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wE8vZC+O3/c/5v4TWpuhTCtqnOSBolSL64lRfeG1mTXSWNbxQswq8a+E4o5qpUJUeMs3hNX5Ze
 NGTv7o3ZIMgZrHgFpbuSOHxcArJdnzhJP1NR1rIB3hhbNJHQ3bm7HChbkrvigfdbsYsSRzTMnY
 7kJpiZgMTVkKuDO9c6RCx0KuojyK7kNuzB3EyvD+umItJTqEuYafN6+Q/1V16CjpJ9bBWEgqNW
 AWJDmAwVxFPHtWsqOhRmPxy5KlhosFEGOMIdALVsfq8DdhsK7Oaqt44g0TkVr0O2Tg6EsIQIQp
 fjY=
X-SBRS: 2.7
X-MesageID: 11560863
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11560863"
Date: Tue, 28 Jan 2020 12:58:19 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200128115819.GN57924@desktop-tdan49n.eng.citrite.net>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
 <20200128103933.GK57924@desktop-tdan49n.eng.citrite.net>
 <24a248a0-58da-66d6-a614-d876bd64a04b@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24a248a0-58da-66d6-a614-d876bd64a04b@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH RFC] x86/amd: Avoid cpu_has_hypervisor
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTE6MjE6MTRBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyOC8wMS8yMDIwIDEwOjM5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4K
PiA+PiBUaGlzIGlzIG9uZSBvZiB0d28gcG9zc2libGUgYXBwcm9hY2hlcywgYW5kIGJvdGggaGF2
ZSB0aGVpciBkb3duc2lkZXMuICBUaGlzCj4gPj4gb25lIHRha2VzIGFuIGV4dHJhIGhpdCBvbiBj
b250ZXh0IHN3aXRjaGVzIGJldHdlZW4gUFYgdmNwdXMgYW5kIGlkbGUvaHZtLCBhcwo+ID4+IHRo
ZXkgd2lsbCB1c3VhbGx5IGRpZmZlciBpbiBIWVBFUlZJU09SIGJpdC4KPiA+Pgo+ID4+IFRoZSBv
dGhlciBhcHByb2FjaCBpcyB0byBvcmRlciB0aGluZ3MgbW9yZSBjYXJlZnVsbHkgc28gbGV2ZWxs
aW5nIGlzCj4gPj4gY29uZmlndXJlZCBhZnRlciBzY2FubmluZyBmb3IgY3B1aWQgYml0cywgYnV0
IHRoYXQgaGFzIHRoZSBkb3duc2lkZSB0aGF0IGl0IGlzCj4gPj4gdmVyeSBlYXN5IHRvIHJlZ3Jl
c3MuCgpXb3VsZCBpdCBiZSBlbm91Z2ggdG8gcG9wdWxhdGUgYm9vdF9jcHVfZGF0YSBiZWZvcmUg
c2V0dGluZwpjcHVpZG1hc2tfZGVmYXVsdHM/CgpTbyB0aGF0IGF0IGxlYXN0IHRoZSBkYXRhIGlu
IGJvb3RfY3B1X2RhdGEgaXMgbm90IHRhaW50ZWQgd2l0aCB0aGUKYml0cyBpbiBjcHVpZG1hc2tf
ZGVmYXVsdHM/CgpJJ20gY2VydGFpbmx5IG5vdCBhbiBleHBlcnQgb24gdGhhdCBhcmVhLCBzbyB5
b3VyIGp1ZGdtZW50IG9uIHRoZQpsZWFzdCBiYWQgYXBwcm9hY2ggaXMgbGlrZWx5IG1vcmUgYWNj
dXJhdGUgdGhhbiBtaW5lLgoKPiA+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5j
IGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gPj4gaW5kZXggNWVkNjNhYzEwYS4uMDYyN2ViNGUw
NiAxMDA2NDQKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiA+PiArKysgYi94ZW4v
YXJjaC94ODYvZG9tY3RsLmMKPiA+PiBAQCAtNDgsNyArNDgsNyBAQCBzdGF0aWMgaW50IGdkYnN4
X2d1ZXN0X21lbV9pbyhkb21pZF90IGRvbWlkLCBzdHJ1Y3QgeGVuX2RvbWN0bF9nZGJzeF9tZW1p
byAqaW9wKQo+ID4+ICB9Cj4gPj4gICNlbmRpZgo+ID4+ICAKPiA+PiAtc3RhdGljIHZvaWQgZG9t
YWluX2NwdV9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICpkKQo+ID4+ICt2b2lkIGRvbWFp
bl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkKPiA+PiAgewo+ID4+ICAgICAg
Y29uc3Qgc3RydWN0IGNwdWlkX3BvbGljeSAqcCA9IGQtPmFyY2guY3B1aWQ7Cj4gPj4gICAgICBz
dHJ1Y3QgdmNwdSAqdjsKPiA+PiBAQCAtMTA2LDYgKzEwNiwxMyBAQCBzdGF0aWMgdm9pZCBkb21h
aW5fY3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4gPj4gICAgICAgICAgICAg
ICAgICAgICAgZWN4ID0gMDsKPiA+PiAgICAgICAgICAgICAgICAgIGVkeCA9IGNwdWZlYXRfbWFz
ayhYODZfRkVBVFVSRV9BUElDKTsKPiA+PiAgCj4gPj4gKyAgICAgICAgICAgICAgICAvKgo+ID4+
ICsgICAgICAgICAgICAgICAgICogSWYgdGhlIEh5cGVydmlzb3IgYml0IGlzIHNldCBpbiB0aGUg
cG9saWN5LCB3ZSBjYW4gYWxzbwo+ID4+ICsgICAgICAgICAgICAgICAgICogZm9yd2FyZCBpdCBp
bnRvIHJlYWwgQ1BVSUQuCj4gPj4gKyAgICAgICAgICAgICAgICAgKi8KPiA+PiArICAgICAgICAg
ICAgICAgIGlmICggcC0+YmFzaWMuaHlwZXJ2aXNvciApCj4gPj4gKyAgICAgICAgICAgICAgICAg
ICAgZWN4IHw9IGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9IWVBFUlZJU09SKTsKPiA+IFNpbmNl
IHRoZSBoeXBlcnZpc29yIGJpdCB3aWxsIGJlIHBhcnQgb2YgYm90aCB0aGUgSFZNIGFuZCBQViBt
YXgKPiA+IHBvbGljaWVzLCB3aHkgZG8geW91IG5lZWQgdG8gZXhwbGljaXRseSBhbGxvdyBpdCBo
ZXJlPwo+ID4KPiA+IFdvbid0IGl0IGJlIG5hdHVyYWxseSBhZGRlZCB0byB0aGUgZ3Vlc3QgcG9s
aWN5IGFzIHRoZSByZXN0IG9mCj4gPiBmZWF0dXJlcz8KPiAKPiBjcHVpZG1hc2tfZGVmYXVsdHMg
c2VydmVzIGFzIGFuIGFuZC1tYXNrIG92ZXIgYW55IGNvbnRlbnQgdGhlIGd1ZXN0Cj4gcG9saWN5
IHNlbGVjdHMuCj4KPiBUaGlzIGlzIGJlY2F1c2UsIGluIHRoZSBBTUQgY2FzZSwgdGhlc2UgYXJl
IGFjdHVhbGx5IG92ZXJyaWRlIE1TUnMKPiByYXRoZXIgdGhhbiBtYXNrIE1TUnMuwqAgQ2FyZSBo
YXMgdG8gYmUgdGFrZW4gbm90IHRvIGFkdmVydGlzZSBhbnkKPiBmZWF0dXJlcyB0aGUgcGlwZWxp
bmUgY2FuJ3QgZGVsaXZlciBvbiwgYnV0IGl0IGlzIGFsc28gdGhlIHByb3Blcmx5Cj4gd2hpY2gg
YWxsb3dzIHVzIHRvIGFkdmVydGlzZSB0aGUgSFlQRVJWSVNPUiBiaXQgaW4gZ2VuZXJhbC4KCk9o
LCBzbyBvbiBBTUQgY3B1aWRtYXNrX2RlZmF1bHRzIGlzIG5vdCBhIG1hc2ssIGl0IGNhbiBhbHNv
IGZvcmNlCmZlYXR1cmVzIHRvIGFwcGVhciBvbiBjcHVpZCwgZXZlbiB3aGVuIG5vdCBwcmVzZW50
IG9uIHRoZSBoYXJkd2FyZQpjcHVpZC4KCldvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gYW5kIGNwdWlk
bWFza19kZWZhdWx0cyB3aXRoIHRoZSByZWFsIGhhcmR3YXJlCnBvbGljeSBiZWZvcmUgd3JpdGlu
ZyBpdCB0byB0aGUgTVNSIGluIG9yZGVyIHRvIHByZXZlbnQgdGhpbmdzIG5vdApwcmVzZW50IG9u
IHRoZSBoYXJkd2FyZSBwb2xpY3kgZnJvbSBhcHBlYXJpbmcgbWFnaWNhbGx5PwoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
