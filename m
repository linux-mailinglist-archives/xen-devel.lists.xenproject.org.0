Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2914B2E4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 11:43:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwOHY-0005ZP-4j; Tue, 28 Jan 2020 10:39:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwOHX-0005ZK-05
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 10:39:43 +0000
X-Inumbo-ID: 7d2c1acc-41ba-11ea-b211-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d2c1acc-41ba-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580207981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/II1mPPdICWZcij3CA0Fz5U7BVvejriiZHhuEsq4PxI=;
 b=PlSKz25QNfsU/oea5DUcKgMOWPmEM/7KjGnPLARLBbVceULMFU+HljOY
 qs3Da4srrfeykFpOBfWk+XMYq739TXHECInbiF8OCk027iK8yffHPvUIo
 /Xm6Qcn72OAkZW0XKLfAhMxLaLKl7OF/D/WGU8ucHQ+AYx6vPykoDl1kq Q=;
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
IronPort-SDR: U3g/MxR7GOIC0OiP+9gC83u7mDjVlDEIbypm06LxWAiUEm4+HliFRzqST3wrybaXq5MeFm2zFt
 Cymp4Nf5ca+MxamG/IQTx7WpH1N469EtyHSzQQJ5g9cJSngMXEFBfUHg8IAlbTIct5Ypgdfg1z
 QVknif8ftpA/SrVJ+GNC8Y13VnX7m77N1oHLn4kqiGxV5Nduq0YATagYASp/D1vwQTT+PwAOgL
 tSfKudR/nTZ8Sa/b8VnVBUH9tU12jtJbFuT8yioK0d9i74OWda++lAki3UmuXvN8lcFyhIszsG
 a1w=
X-SBRS: 2.7
X-MesageID: 11536619
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11536619"
Date: Tue, 28 Jan 2020 11:39:33 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200128103933.GK57924@desktop-tdan49n.eng.citrite.net>
References: <20200127202121.2961-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127202121.2961-1-andrew.cooper3@citrix.com>
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

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDg6MjE6MjFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBDdXJyZW50bHkgd2hlbiBib290aW5nIG5hdGl2ZSBvbiBBTUQgaGFyZHdhcmUsIGNw
dWlkbWFza19kZWZhdWx0cy5fMWNkIGdldHMKPiBjb25maWd1cmVkIHdpdGggdGhlIEhZUEVSVklT
T1IgYml0IGJlZm9yZSBuYXRpdmUgQ1BVSUQgaXMgc2Nhbm5lZCBmb3IgZmVhdHVyZQo+IGJpdHMu
Cj4gCj4gVGhpcyByZXN1bHRzIGluIGNwdV9oYXNfaHlwZXJ2aXNvciBiZWNvbWluZyBzZXQgYXMg
cGFydCBvZiBpZGVudGlmeV9jcHUoKSwgYW5kCj4gZW5kcyB1cCBhcHBlYXJpbmcgaW4gdGhlIHJh
dyBhbmQgaG9zdCBDUFUgcG9saWNpZXMuICBOb3RoaW5nIGhhcyByZWFsbHkgY2FyZWQKPiBpbiB0
aGUgcGFzdC4KPiAKPiBBbHRlciBhbWRfaW5pdF9sZXZlbGxpbmcoKSB0byBleGNsdWRlIHRoZSBI
WVBFUlZJU09SIGJpdCBmcm9tCj4gY3B1bWFza19kZWZhdWx0cywgYW5kIHVwZGF0ZSBkb21haW5f
Y3B1X3BvbGljeV9jaGFuZ2VkKCkgdG8gYWxsb3cgaXQgdG8gYmUKPiBleHBsaWNpdGx5IGZvcndh
cmRlZC4KPiAKPiBUaGlzIGluIHR1cm4gaGlnaGxpZ2h0ZWQgdGhhdCBkb20wIGNvbnN0cnVjdGlv
biB3YXMgYXN5bWV0cmljIHdpdGggZG9tVQo+IGNvbnN0cnVjdGlvbiwgYnkgbm90IGhhdmluZyBh
bnkgY2FsbHMgdG8gZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLiAgRXh0ZW5kCj4gYXJjaF9k
b21haW5fY3JlYXRlKCkgdG8gYWx3YXlzIGNhbGwgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgp
Lgo+IAo+IFJlcG9ydGVkLWJ5OiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgo+IENDOiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNv
bT4KPiAKPiBXaXRob3V0IHRoaXMgZml4LCB0aGVyZSBpcyBhcHBhcmVudGx5IGEgcHJvYmxlbSB3
aXRoIFJvZ2VyJ3MgIltQQVRDSCB2MyA3LzddCj4geDg2L3RsYjogdXNlIFhlbiBMMCBhc3Npc3Rl
ZCBUTEIgZmx1c2ggd2hlbiBhdmFpbGFibGUiIG9uIG5hdGl2ZSBBTUQgaGFyZHdhcmUuCj4gSSBo
YXZlbid0IGludmVzdGdpYXRlZCB0aGUgaXNzdWUgd2l0aCB0aGF0IHBhdGNoIHNwZWNpZmljYWxs
eSwgYmVjYXVzZQo+IGNwdV9oYXNfaHlwZXJ2aXNvciBiZWluZyB3cm9uZyBpcyBvYnZpb3VzbHkg
YSBidWcuCgpJJ3ZlIHRlc3RlZCB0aGUgc2VyaWVzIG9uIG9uZSBBTUQgYm94IGFuZCBpdCB3b3Jr
ZWQgZm9yIG1lLiBFdmVuIGlmCmNwdV9oYXNfaHlwZXJ2aXNvciBpcyBzZXQgb24gcmVhbCBoYXJk
d2FyZSB0aGUgYWRkZWQgY2FsbCB0bwpoeXBlcnZpc29yX2ZsdXNoX3RsYiBzaG91bGQgYmUgZmlu
ZSBhcyBvcHMgaXMgTlVMTCBpbiB0aGF0IGNhc2UgYW5kCndvdWxkIGp1c3QgYmUgYSBkdW1teSAo
dGhpcyBvYnZpb3VzbHkgbmVlZHMgdG8gYmUgZml4ZWQgc28KY3B1X2hhc19oeXBlcnZpc29yIGlz
bid0IHRydWUgd2hlbiBub3QgcnVubmluZyB2aXJ0dWFsaXplZCkuCgo+IAo+IFRoaXMgaXMgb25l
IG9mIHR3byBwb3NzaWJsZSBhcHByb2FjaGVzLCBhbmQgYm90aCBoYXZlIHRoZWlyIGRvd25zaWRl
cy4gIFRoaXMKPiBvbmUgdGFrZXMgYW4gZXh0cmEgaGl0IG9uIGNvbnRleHQgc3dpdGNoZXMgYmV0
d2VlbiBQViB2Y3B1cyBhbmQgaWRsZS9odm0sIGFzCj4gdGhleSB3aWxsIHVzdWFsbHkgZGlmZmVy
IGluIEhZUEVSVklTT1IgYml0Lgo+IAo+IFRoZSBvdGhlciBhcHByb2FjaCBpcyB0byBvcmRlciB0
aGluZ3MgbW9yZSBjYXJlZnVsbHkgc28gbGV2ZWxsaW5nIGlzCj4gY29uZmlndXJlZCBhZnRlciBz
Y2FubmluZyBmb3IgY3B1aWQgYml0cywgYnV0IHRoYXQgaGFzIHRoZSBkb3duc2lkZSB0aGF0IGl0
IGlzCj4gdmVyeSBlYXN5IHRvIHJlZ3Jlc3MuCj4gCj4gVGhvdWdodHMgb24gd2hpY2ggaXMgdGhl
IGxlYXN0LWJhZCBhcHByb2FjaCB0byB0YWtlPyAgSGF2aW5nIHdyaXR0ZW4gdGhpcwo+IHBhdGNo
LCBJJ20gbm93IGVycmluZyBvbiB0aGUgc2lkZSBvZiBkb2luZyBpdCB0aGUgb3RoZXIgd2F5Lgo+
IC0tLQo+ICB4ZW4vYXJjaC94ODYvY3B1L2FtZC5jICAgICAgIHwgMyAtLS0KPiAgeGVuL2FyY2gv
eDg2L2RvbWFpbi5jICAgICAgICB8IDIgKysKPiAgeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAg
ICB8IDkgKysrKysrKystCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggfCAyICsrCj4g
IDQgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9hbWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1k
LmMKPiBpbmRleCA4YjVmMGYyZTRjLi4wOTA2YjIzNTgyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9jcHUvYW1kLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCj4gQEAgLTI5Nyw5
ICsyOTcsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgbm9pbmxpbmUgYW1kX2luaXRfbGV2ZWxsaW5n
KHZvaWQpCj4gIAkJCWVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfT1NYU0FWRSk7Cj4g
IAkJZWR4IHw9IGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9BUElDKTsKPiAgCj4gLQkJLyogQWxs
b3cgdGhlIEhZUEVSVklTT1IgYml0IHRvIGJlIHNldCB2aWEgZ3Vlc3QgcG9saWN5LiAqLwo+IC0J
CWVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUik7CgpXZSBhbHNvIHNl
ZW0gdG8gZm9yY2UgWDg2X0ZFQVRVUkVfQVBJQyBpbnRvIHRoZSBwb2xpY3ksIHdoaWNoIHNlZW1z
Cndyb25nPwoKSSBndWVzcyBhbGwgQU1EIGhhcmR3YXJlIFhlbiBib290cyBvbiBoYXMgdGhlIEFQ
SUMgZmVhdHVyZSwgc28gdGhpcwppc24ndCBhIHJlYWwgaXNzdWUsIGJ1dCBzdGlsbCBzZWVtcyBx
dWl0ZSB3ZWlyZC4KCj4gIAkJY3B1aWRtYXNrX2RlZmF1bHRzLl8xY2QgPSAoKHVpbnQ2NF90KWVj
eCA8PCAzMikgfCBlZHg7Cj4gIAl9Cj4gIAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9t
YWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBpbmRleCAyOGZlZmExZjgxLi4zMTZiODAx
NTk3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9kb21haW4uYwo+IEBAIC02NjUsNiArNjY1LDggQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0
ZShzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICovCj4gICAgICBkLT5hcmNoLng4N19maXBfd2lk
dGggPSBjcHVfaGFzX2ZwdV9zZWwgPyAwIDogODsKPiAgCj4gKyAgICBkb21haW5fY3B1X3BvbGlj
eV9jaGFuZ2VkKGQpOwo+ICsKPiAgICAgIHJldHVybiAwOwo+ICAKPiAgIGZhaWw6Cj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+IGlu
ZGV4IDVlZDYzYWMxMGEuLjA2MjdlYjRlMDYgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2Rv
bWN0bC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gQEAgLTQ4LDcgKzQ4LDcgQEAg
c3RhdGljIGludCBnZGJzeF9ndWVzdF9tZW1faW8oZG9taWRfdCBkb21pZCwgc3RydWN0IHhlbl9k
b21jdGxfZ2Ric3hfbWVtaW8gKmlvcCkKPiAgfQo+ICAjZW5kaWYKPiAgCj4gLXN0YXRpYyB2b2lk
IGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkKPiArdm9pZCBkb21h
aW5fY3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4gIHsKPiAgICAgIGNvbnN0
IHN0cnVjdCBjcHVpZF9wb2xpY3kgKnAgPSBkLT5hcmNoLmNwdWlkOwo+ICAgICAgc3RydWN0IHZj
cHUgKnY7Cj4gQEAgLTEwNiw2ICsxMDYsMTMgQEAgc3RhdGljIHZvaWQgZG9tYWluX2NwdV9wb2xp
Y3lfY2hhbmdlZChzdHJ1Y3QgZG9tYWluICpkKQo+ICAgICAgICAgICAgICAgICAgICAgIGVjeCA9
IDA7Cj4gICAgICAgICAgICAgICAgICBlZHggPSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfQVBJ
Qyk7Cj4gIAo+ICsgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICAqIElmIHRo
ZSBIeXBlcnZpc29yIGJpdCBpcyBzZXQgaW4gdGhlIHBvbGljeSwgd2UgY2FuIGFsc28KPiArICAg
ICAgICAgICAgICAgICAqIGZvcndhcmQgaXQgaW50byByZWFsIENQVUlELgo+ICsgICAgICAgICAg
ICAgICAgICovCj4gKyAgICAgICAgICAgICAgICBpZiAoIHAtPmJhc2ljLmh5cGVydmlzb3IgKQo+
ICsgICAgICAgICAgICAgICAgICAgIGVjeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQ
RVJWSVNPUik7CgpTaW5jZSB0aGUgaHlwZXJ2aXNvciBiaXQgd2lsbCBiZSBwYXJ0IG9mIGJvdGgg
dGhlIEhWTSBhbmQgUFYgbWF4CnBvbGljaWVzLCB3aHkgZG8geW91IG5lZWQgdG8gZXhwbGljaXRs
eSBhbGxvdyBpdCBoZXJlPwoKV29uJ3QgaXQgYmUgbmF0dXJhbGx5IGFkZGVkIHRvIHRoZSBndWVz
dCBwb2xpY3kgYXMgdGhlIHJlc3Qgb2YKZmVhdHVyZXM/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
