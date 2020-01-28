Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BEE14B40F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:16:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwPkO-00067z-MJ; Tue, 28 Jan 2020 12:13:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f0Vb=3R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwPkN-00067u-Jg
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 12:13:35 +0000
X-Inumbo-ID: 9aa8ccdc-41c7-11ea-869d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9aa8ccdc-41c7-11ea-869d-12813bfff9fa;
 Tue, 28 Jan 2020 12:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580213614;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=f07aJz69/FU8aYbwX0yflhcrYPBp48h78Dbh4jw1FEo=;
 b=DVwV2RQqJDdjMvEbnT7LVXFlJvMQt8s+r4OESSmCoa8UR6J3FqGIKNfY
 vhe/fX0Q7dSOfCAMNE2r9PaS3U0HOw7ovelmdBFNoAKwqkpKCMLi1I5zb
 ch685X+thZE/2iMkeHZyBued+n5kxWf5mG4i6G5pn4I4+35BgAkaQo2fu c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ex+M86Vf2QW/V67SiEYGWIpscTtCgf+m0tx6YDbyGdgIiFyELHww1UbWsEhov2XfceIbgXhGaE
 9fWVITvuJT8eoXSlict6ZPbtaIu0+EoDQ8tUwnWHx+gJP1PAIsg/VEWfPknqKqSIvkTxCQK+n0
 aSI/TLkqh6xQTusgW7TVehvubvC5v2cIGtI8nyQl8ZU0ZZwwz030myIzTkTbd/QIyFpR9/HMnt
 vEsZsRjCftES3999nvqOQV+esV3oMNOa6KmIWZjr6gi0rj2aIyTRz3LkYmyde00zRc3tBIS0dX
 Hgs=
X-SBRS: 2.7
X-MesageID: 11982621
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11982621"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
 <20200128103933.GK57924@desktop-tdan49n.eng.citrite.net>
 <24a248a0-58da-66d6-a614-d876bd64a04b@citrix.com>
 <20200128115819.GN57924@desktop-tdan49n.eng.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fae40566-834a-7c5b-90a6-b13292abaf21@citrix.com>
Date: Tue, 28 Jan 2020 12:13:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200128115819.GN57924@desktop-tdan49n.eng.citrite.net>
Content-Language: en-GB
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

T24gMjgvMDEvMjAyMCAxMTo1OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEph
biAyOCwgMjAyMCBhdCAxMToyMToxNEFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAyOC8wMS8yMDIwIDEwOjM5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+IFRoaXMgaXMg
b25lIG9mIHR3byBwb3NzaWJsZSBhcHByb2FjaGVzLCBhbmQgYm90aCBoYXZlIHRoZWlyIGRvd25z
aWRlcy4gIFRoaXMKPj4+PiBvbmUgdGFrZXMgYW4gZXh0cmEgaGl0IG9uIGNvbnRleHQgc3dpdGNo
ZXMgYmV0d2VlbiBQViB2Y3B1cyBhbmQgaWRsZS9odm0sIGFzCj4+Pj4gdGhleSB3aWxsIHVzdWFs
bHkgZGlmZmVyIGluIEhZUEVSVklTT1IgYml0Lgo+Pj4+Cj4+Pj4gVGhlIG90aGVyIGFwcHJvYWNo
IGlzIHRvIG9yZGVyIHRoaW5ncyBtb3JlIGNhcmVmdWxseSBzbyBsZXZlbGxpbmcgaXMKPj4+PiBj
b25maWd1cmVkIGFmdGVyIHNjYW5uaW5nIGZvciBjcHVpZCBiaXRzLCBidXQgdGhhdCBoYXMgdGhl
IGRvd25zaWRlIHRoYXQgaXQgaXMKPj4+PiB2ZXJ5IGVhc3kgdG8gcmVncmVzcy4KPiBXb3VsZCBp
dCBiZSBlbm91Z2ggdG8gcG9wdWxhdGUgYm9vdF9jcHVfZGF0YSBiZWZvcmUgc2V0dGluZwo+IGNw
dWlkbWFza19kZWZhdWx0cz8KPgo+IFNvIHRoYXQgYXQgbGVhc3QgdGhlIGRhdGEgaW4gYm9vdF9j
cHVfZGF0YSBpcyBub3QgdGFpbnRlZCB3aXRoIHRoZQo+IGJpdHMgaW4gY3B1aWRtYXNrX2RlZmF1
bHRzPwoKVGhhdCB3YXMgdGhlIGRpc2N1c3Npb24gaW4gdGhlIFJGQyBzZWN0aW9uLCB3aGVyZSBJ
IGFsc28gc2FpZCBJIHRoaW5rIEkKd2FzIHByZWZlcnJpbmcgdGhhdCB3YXkgb2YgZG9pbmcgaXQg
YW55d2F5Li4uCgo+Cj4gSSdtIGNlcnRhaW5seSBub3QgYW4gZXhwZXJ0IG9uIHRoYXQgYXJlYSwg
c28geW91ciBqdWRnbWVudCBvbiB0aGUKPiBsZWFzdCBiYWQgYXBwcm9hY2ggaXMgbGlrZWx5IG1v
cmUgYWNjdXJhdGUgdGhhbiBtaW5lLgo+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9k
b21jdGwuYyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+Pj4+IGluZGV4IDVlZDYzYWMxMGEuLjA2
MjdlYjRlMDYgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4+Pj4gKysr
IGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4+Pj4gQEAgLTQ4LDcgKzQ4LDcgQEAgc3RhdGljIGlu
dCBnZGJzeF9ndWVzdF9tZW1faW8oZG9taWRfdCBkb21pZCwgc3RydWN0IHhlbl9kb21jdGxfZ2Ri
c3hfbWVtaW8gKmlvcCkKPj4+PiAgfQo+Pj4+ICAjZW5kaWYKPj4+PiAgCj4+Pj4gLXN0YXRpYyB2
b2lkIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkKPj4+PiArdm9p
ZCBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4+Pj4gIHsKPj4+
PiAgICAgIGNvbnN0IHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSBkLT5hcmNoLmNwdWlkOwo+Pj4+
ICAgICAgc3RydWN0IHZjcHUgKnY7Cj4+Pj4gQEAgLTEwNiw2ICsxMDYsMTMgQEAgc3RhdGljIHZv
aWQgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgIGVjeCA9IDA7Cj4+Pj4gICAgICAgICAgICAgICAgICBlZHggPSBjcHVm
ZWF0X21hc2soWDg2X0ZFQVRVUkVfQVBJQyk7Cj4+Pj4gIAo+Pj4+ICsgICAgICAgICAgICAgICAg
LyoKPj4+PiArICAgICAgICAgICAgICAgICAqIElmIHRoZSBIeXBlcnZpc29yIGJpdCBpcyBzZXQg
aW4gdGhlIHBvbGljeSwgd2UgY2FuIGFsc28KPj4+PiArICAgICAgICAgICAgICAgICAqIGZvcndh
cmQgaXQgaW50byByZWFsIENQVUlELgo+Pj4+ICsgICAgICAgICAgICAgICAgICovCj4+Pj4gKyAg
ICAgICAgICAgICAgICBpZiAoIHAtPmJhc2ljLmh5cGVydmlzb3IgKQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgIGVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUik7Cj4+
PiBTaW5jZSB0aGUgaHlwZXJ2aXNvciBiaXQgd2lsbCBiZSBwYXJ0IG9mIGJvdGggdGhlIEhWTSBh
bmQgUFYgbWF4Cj4+PiBwb2xpY2llcywgd2h5IGRvIHlvdSBuZWVkIHRvIGV4cGxpY2l0bHkgYWxs
b3cgaXQgaGVyZT8KPj4+Cj4+PiBXb24ndCBpdCBiZSBuYXR1cmFsbHkgYWRkZWQgdG8gdGhlIGd1
ZXN0IHBvbGljeSBhcyB0aGUgcmVzdCBvZgo+Pj4gZmVhdHVyZXM/Cj4+IGNwdWlkbWFza19kZWZh
dWx0cyBzZXJ2ZXMgYXMgYW4gYW5kLW1hc2sgb3ZlciBhbnkgY29udGVudCB0aGUgZ3Vlc3QKPj4g
cG9saWN5IHNlbGVjdHMuCj4+Cj4+IFRoaXMgaXMgYmVjYXVzZSwgaW4gdGhlIEFNRCBjYXNlLCB0
aGVzZSBhcmUgYWN0dWFsbHkgb3ZlcnJpZGUgTVNScwo+PiByYXRoZXIgdGhhbiBtYXNrIE1TUnMu
wqAgQ2FyZSBoYXMgdG8gYmUgdGFrZW4gbm90IHRvIGFkdmVydGlzZSBhbnkKPj4gZmVhdHVyZXMg
dGhlIHBpcGVsaW5lIGNhbid0IGRlbGl2ZXIgb24sIGJ1dCBpdCBpcyBhbHNvIHRoZSBwcm9wZXJs
eQo+PiB3aGljaCBhbGxvd3MgdXMgdG8gYWR2ZXJ0aXNlIHRoZSBIWVBFUlZJU09SIGJpdCBpbiBn
ZW5lcmFsLgo+IE9oLCBzbyBvbiBBTUQgY3B1aWRtYXNrX2RlZmF1bHRzIGlzIG5vdCBhIG1hc2ss
IGl0IGNhbiBhbHNvIGZvcmNlCj4gZmVhdHVyZXMgdG8gYXBwZWFyIG9uIGNwdWlkLCBldmVuIHdo
ZW4gbm90IHByZXNlbnQgb24gdGhlIGhhcmR3YXJlCj4gY3B1aWQuCgpDb3JyZWN0LgoKPiBXb3Vs
ZCBpdCBtYWtlIHNlbnNlIHRvIGFuZCBjcHVpZG1hc2tfZGVmYXVsdHMgd2l0aCB0aGUgcmVhbCBo
YXJkd2FyZQo+IHBvbGljeSBiZWZvcmUgd3JpdGluZyBpdCB0byB0aGUgTVNSIGluIG9yZGVyIHRv
IHByZXZlbnQgdGhpbmdzIG5vdAo+IHByZXNlbnQgb24gdGhlIGhhcmR3YXJlIHBvbGljeSBmcm9t
IGFwcGVhcmluZyBtYWdpY2FsbHk/CgpjcHVtYXNrX2RlZmF1bHRzIGFscmVhZHkgYXJlIHJlYWwg
aGFyZHdhcmUgdmFsdWVzIChnaXZlIG9yIHRha2UgdGhlCnNwZWNpYWwgYml0cywgYW5kIHBvc3Np
Ymx5IGltaXRhdGluZyBhbiBvbGRlciBDUFUgdmlhIGEgY3B1aWRfbWFza19jcHU9CnNldHRpbmcp
LgoKVGhlIHBvaW50IG9mIGRvaW5nIGl0IGxpa2UgdGhhdCBpcyBzbyB3ZSBkb24ndCBoYXZlIHRv
IHBlcmZvcm0gcmVkdW5kYW50CmNhbGN1bGF0aW9ucyBvbiBldmVyeSBjb250ZXh0IHN3aXRjaC4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
