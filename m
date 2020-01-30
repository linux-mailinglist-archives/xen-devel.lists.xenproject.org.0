Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702F14DA99
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:29:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8uX-0005q2-Lc; Thu, 30 Jan 2020 12:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix8uW-0005px-0n
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:27:04 +0000
X-Inumbo-ID: d1bf2cbc-435b-11ea-b211-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1bf2cbc-435b-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580387222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QgFywBDvi1o+glQdfdqNZg95qIIRFqnEdjZzpZnON8Y=;
 b=FL3hbwjl88GR94buXHB2EKKjJOY0+izaz/KB8QZd+FX3EIn1Y3y6J3DT
 YEjDSvjhs5d81UXnQE/ktrO3c+8RnzXpZXihISBpR9X+S4720mdM5HtEJ
 GoFki22tK7FSGrTCWJo3/R2zzr7q+AawrpqUIr8wxMEzKGCCYPwQdTHFX U=;
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
IronPort-SDR: zOzUK+ugqrn62v7nEMK+2GoB5LfAzXI3r4w32slwuiY28qfwn0QTnd2JsSAbyHXpPaeh8jW107
 e3p7prAaSfnntTY/Sa9UoUZlEb0Vxel/suvaYktZPC3Zfe6gyDqeScsCG/eyo3g2xI23C/7Bwt
 uYlVetM4754yc97a3e3VtT7ujE9MaPI5HbSyDJ+ksYta3Da847cZtgsoZzQjziTZwfgHJvmGEC
 h63iG9TdFJq0AIrLBTT22TZmDnuMNNNvoPQTwHDrAXfW0lawtY2GFJMBRJhBcjTdt96rMpKC2b
 Mlo=
X-SBRS: 2.7
X-MesageID: 12287278
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12287278"
Date: Thu, 30 Jan 2020 13:26:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130122655.GL4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-11-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-11-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 10/12] x86/hyperv: provide percpu
 hypercall input page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MzJQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBIeXBlci1WJ3MgaW5wdXQgLyBvdXRwdXQgYXJndW1lbnQgbXVzdCBiZSA4IGJ5dGVzIGFsaWdu
ZWQgYW4gbm90IGNyb3NzCj4gcGFnZSBib3VuZGFyeS4gT25lIHdheSB0byBzYXRpc2Z5IHRob3Nl
IHJlcXVpcmVtZW50cyBpcyB0byB1c2UgcGVyY3B1Cj4gcGFnZS4KPiAKPiBGb3IgdGhlIGZvcmVz
ZWVhYmxlIGZ1dHVyZSB3ZSBvbmx5IG5lZWQgdG8gcHJvdmlkZSBpbnB1dCBmb3IgVExCCj4gYW5k
IEFQSUMgaHlwZXJjYWxscywgc28gc2tpcCBzZXR0aW5nIHVwIGFuIG91dHB1dCBwYWdlLgo+IAo+
IFdlIHdpbGwgYWxzbyBuZWVkIHRvIHByb3ZpZGUgYW4gYXBfc2V0dXAgaG9vayBmb3Igc2Vjb25k
YXJ5IGNwdXMgdG8KPiBzZXR1cCBpdHMgb3duIGlucHV0IHBhZ2UuCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkp1c3Qgc29tZSBuaXRzIGJlbG93LgoKPiAt
LS0KPiB2NToKPiAxLiBBZGp1c3QgdG8gbmV3IGFwX3NldHVwCj4gMi4gQ2hhbmdlIHZhcmlhYmxl
IG5hbWUgdG8gaHZfcGNwdV9pbnB1dF9wYWdlCj4gCj4gdjQ6Cj4gMS4gQ2hhbmdlIHdvcmRpbmcg
aW4gY29tbWl0IG1lc3NhZ2UKPiAyLiBQcmV2ZW50IGxlYWsKPiAzLiBJbnRyb2R1Y2UgYSBwcml2
YXRlIGhlYWRlcgo+IAo+IHYzOgo+IDEuIFVzZSB4ZW5oZWFwIHBhZ2UgaW5zdGVhZAo+IDIuIERy
b3AgcGFnZSB0cmFja2luZyBzdHJ1Y3R1cmUKPiAzLiBEcm9wIFBhdWwncyByZXZpZXcgdGFnCj4g
LS0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMzEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRl
LmggfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2
MCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L3ByaXZhdGUuaAo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGluZGV4
IDQzODdiNjU0MWUuLmYwZmFjY2NiYWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2
LmMKPiBAQCAtMjcsNyArMjcsMTAgQEAKPiAgI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxm
cy5oPgo+ICAjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ICAKPiArI2luY2x1ZGUgInByaXZh
dGUuaCIKPiArCj4gIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVy
djsKPiArREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9wY3B1X2lucHV0X3Bh
Z2UpOwoKSSB3b3VsZCBkcm9wIHRoZSAncGNwdV8nIGZyb20gdGhlIG5hbWUsIGFzIHlvdSBhbHJl
YWR5IGtub3cgaXQncwpwZXItY3B1IGJlY2F1c2Ugb2YgdGhlIGFjY2Vzc29ycyB5b3UgaGF2ZSB0
byB1c2UuCgo+ICAKPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4g
IHsKPiBAQCAtMTI3LDE0ICsxMzAsNDIgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVy
Y2FsbF9wYWdlKHZvaWQpCj4gICAgICB9Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgc2V0dXBfaHlw
ZXJjYWxsX3BjcHVfYXJnKHZvaWQpCj4gK3sKPiArICAgIHZvaWQgKm1hcHBpbmc7CgpUaGVyZSdz
IG5vIG5lZWQgZm9yIHRoZSBsb2NhbCB2YXJpYWJsZSwgeW91IGNhbiBqdXN0IGFzc2lnbiB0bwp0
aGlzX2NwdShodl9wY3B1X2lucHV0X3BhZ2UpIGRpcmVjdGx5LCBhcyBhIGZhaWx1cmUgd2lsbCBq
dXN0IHNldCBpdAp0byBOVUxMIChhcyBpdCBhbHJlYWR5IHdhcykuCgo+ICsKPiArICAgIGlmICgg
dGhpc19jcHUoaHZfcGNwdV9pbnB1dF9wYWdlKSApCj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gKwo+
ICsgICAgbWFwcGluZyA9IGFsbG9jX3hlbmhlYXBfcGFnZSgpOwo+ICsgICAgaWYgKCAhbWFwcGlu
ZyApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCJGYWlsZWQgdG8gYWxsb2NhdGUgaHlwZXJj
YWxsIGlucHV0IHBhZ2UgZm9yIENQVSV1XG4iLAo+ICsgICAgICAgICAgICAgICBzbXBfcHJvY2Vz
c29yX2lkKCkpOwoKSSBmaW5kIGl0IGNsZWFyZXIgdG8gaGF2ZSB0aGUgQ1BVJXUgcHJlZml4IGF0
IHRoZSBiZWdnaW5nIG9mIHRoZSBsaW5lLApidXQgaXQncyB1cCB0byB5b3UuCgo+ICsgICAgICAg
IHJldHVybiAtRU5PTUVNOwo+ICsgICAgfQo+ICsKPiArICAgIHRoaXNfY3B1KGh2X3BjcHVfaW5w
dXRfcGFnZSkgPSBtYXBwaW5nOwo+ICsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0
aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAgewo+ICAgICAgc2V0dXBfaHlwZXJjYWxsX3Bh
Z2UoKTsKPiArICAgIGlmICggc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCkgKQo+ICsgICAgICAg
IHBhbmljKCJIeXBlcmNhbGwgcGVyY3B1IGFyZyBzZXR1cCBmYWlsZWRcbiIpOwoKQ291bGQgeW91
IGFkZCAiSHlwZXJWIGh5cGVyY2FsbC4uLiIsIGp1c3QgaHlwZXJjYWxsIHBhZ2UgaXMgdG9vCmdl
bmVyaWMgSU1PLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
