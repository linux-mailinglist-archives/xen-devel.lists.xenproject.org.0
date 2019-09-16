Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F743B37E5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9o2O-0008Hp-MF; Mon, 16 Sep 2019 10:15:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+z2k=XL=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1i9o2N-0008Hf-3W
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:15:15 +0000
X-Inumbo-ID: deacb7cb-d86a-11e9-95d9-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deacb7cb-d86a-11e9-95d9-12813bfff9fa;
 Mon, 16 Sep 2019 10:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568628913;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=quLHv45PTnkWDH4hrwxjrQdi/AQMf6Bq2yPwhCSJnnc=;
 b=KjXSwFAI2PfaaoJmlcN02NLSo3pISHXoooGlxtaWaiqcVkCVRY2jb9Ko
 LvUZQsA1g3uR0BBIdWqr1P3aciHet0bkgBHyWCtZEyiHDcP67ga1KV16q
 Y2X8Vdgh+saZETN2gYoPIyC45Zs1pITyDSMKVkvl3WuGL6vzy+ahZRIrz A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6DOwVuagZPt/45l6pdbuLrhQKQ/4pr/NAnfN2oMv5N3pAp/dGmbg3rEnPmdC55EJ6tVcLM+b2+
 NvQZg2DoESPgQQw82nvQlmXdNOEZ+sWQDMTMQEy3vFu5xToTDD2I2hMwG2EfEKilAVg66WD2WN
 CBjdDAsNEZ9qQ+nKnAxW8Myz/S2EcUUz8Yb+XEZTh+fz0f8WLnauoRfLgFR+SJYZHQlRZYAxRw
 1s/LqKdGB3z1Dg+rkbxlxpC0xjSLQDA1MV21+r/TCQEJX7/euSI4S2232ga3hxIvdtaZ5Sdpkm
 r58=
X-SBRS: 2.7
X-MesageID: 5602208
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,512,1559534400"; 
   d="scan'208";a="5602208"
To: Paul Durrant <paul.durrant@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20190916092708.2624-1-paul.durrant@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <abda0597-4744-d75e-2b54-d914919f8e76@citrix.com>
Date: Mon, 16 Sep 2019 11:15:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916092708.2624-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v12 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMDoyNyBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLmFuZCBoZW5jZSB0
aGUgYWJpbGl0eSB0byBkaXNhYmxlIElPTU1VIG1hcHBpbmdzLCBhbmQgY29udHJvbCBFUFQKPiBz
aGFyaW5nLgo+IAo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyAnbGlieGxfcGFzc3Rocm91
Z2gnIGVudW1lcmF0aW9uIGludG8KPiBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8uIFRoZSB2YWx1
ZSB3aWxsIGJlIHNldCBieSB4bCBlaXRoZXIgd2hlbiBpdCBwYXJzZXMKPiBhIG5ldyAncGFzc3Ro
cm91Z2gnIG9wdGlvbiBpbiB4bC5jZmcsIG9yIGltcGxpY2l0bHkgaWYgdGhlcmUgaXMgcGFzc3Ro
cm91Z2gKPiBoYXJkd2FyZSBzcGVjaWZpZWQgZm9yIHRoZSBkb21haW4uCj4gCj4gSWYgdGhlIHZh
bHVlIG9mIHRoZSBwYXNzdGhyb3VnaCBjb25maWd1cmF0aW9uIG9wdGlvbiBpcyAnZGlzYWJsZWQn
IHRoZW4KPiB0aGUgWEVOX0RPTUNUTF9DREZfaW9tbXUgZmxhZyB3aWxsIGJlIGNsZWFyIGluIHRo
ZSB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbgo+IGZsYWdzLCB0aHVzIGFsbG93aW5nIHRoZSB0b29s
c3RhY2sgdG8gY29udHJvbCB3aGV0aGVyIHRoZSBkb21haW4gZ2V0cwo+IElPTU1VIG1hcHBpbmdz
IG9yIG5vdCAod2hlcmUgcHJldmlvdXNseSB0aGV5IHdlcmUgZ2xvYmFsbHkgc2V0KS4KPiAKPiBJ
ZiB0aGUgdmFsdWUgb2YgdGhlIHBhc3N0aHJvdWdoIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGlzICdz
eW5jX3B0JyB0aGVuCj4gYSBuZXcgJ2lvbW11X29wdHMnIGZpZWxkIGluIHhlbl9kb21jdGxfY3Jl
YXRlZG9tYWluIHdpbGwgYmUgc2V0IHdpdGggdGhlCj4gdmFsdWUgWEVOX0RPTUNUTF9JT01NVV9u
b19zaGFyZXB0LiBUaGlzIHdpbGwgb3ZlcnJpZGUgdGhlIGdsb2JhbCBkZWZhdWx0Cj4gc2V0IGlu
IGlvbW11X2hhcF9wdF9zaGFyZSwgdGh1cyBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRy
b2wgd2hldGhlcgo+IEVQVCBzaGFyaW5nIGlzIHVzZWQgZm9yIHRoZSBkb21haW4uCj4gCj4gSWYg
dGhlIHZhbHVlIG9mIHBhc3N0aHJvdWdoIGlzICdlbmFibGVkJyB0aGVuIHhsIHdpbGwgY2hvb3Nl
IGFuIGFwcHJvcHJpYXRlCj4gZGVmYXVsdCBhY2NvcmRpbmcgdG8gdGhlIHR5cGUgb2YgZG9tYWlu
IGFuZCBoYXJkd2FyZSBzdXBwb3J0LgoKTWlub3Igc3VnZ2VzdGlvbjogSSBwcmVmZXIgdXNpbmcg
YSB3b3JkIGxpa2UgImF1dG8iIHdoZW4geW91J3JlIGxldHRpbmcKdGhlIGNvbXB1dGVyIGRlY2lk
ZSBzb21ldGhpbmcuCgpJJ2QgYWxzby4uLgoKPiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuY2Zn
LjUucG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCj4gaW5kZXggYzk5ZDQwMzA3ZS4u
MTU0ZDg0N2ZiOSAxMDA2NDQKPiAtLS0gYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPiArKysg
Yi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KPiBAQCAtNjA1LDYgKzYwNSw2MiBAQCBvcHRpb24g
c2hvdWxkIG9ubHkgYmUgdXNlZCB3aXRoIGEgdHJ1c3RlZCBkZXZpY2UgdHJlZS4KPiAgTm90ZSB0
aGF0IHRoZSBwYXJ0aWFsIGRldmljZSB0cmVlIHNob3VsZCBhdm9pZCB1c2luZyB0aGUgcGhhbmRs
ZSA2NTAwMAo+ICB3aGljaCBpcyByZXNlcnZlZCBieSB0aGUgdG9vbHN0YWNrLgo+ICAKPiArPWl0
ZW0gQjxwYXNzdGhyb3VnaD0iU1RSSU5HIj4KPiArCj4gK1NwZWNpZnkgd2hldGhlciBJT01NVSBt
YXBwaW5ncyBhcmUgZW5hYmxlZCBmb3IgdGhlIGRvbWFpbiBhbmQgaGVuY2Ugd2hldGhlcgo+ICtp
dCB3aWxsIGJlIGVuYWJsZWQgZm9yIHBhc3N0aHJvdWdoIGhhcmR3YXJlLiBWYWxpZCB2YWx1ZXMg
Zm9yIHRoaXMgb3B0aW9uCj4gK2FyZToKPiArCj4gKz1vdmVyIDQKPiArCj4gKz1pdGVtIEI8ZGlz
YWJsZWQ+Cj4gKwo+ICtJT01NVSBtYXBwaW5ncyBhcmUgZGlzYWJsZWQgZm9yIHRoZSBkb21haW4g
YW5kIHNvIGhhcmR3YXJlIG1heSBub3QgYmUKPiArcGFzc2VkIHRocm91Z2guCj4gKwo+ICtUaGlz
IG9wdGlvbiBpcyB0aGUgZGVmYXVsdCBpZiBubyBwYXNzdGhyb3VnaCBoYXJkd2FyZSBpcyBzcGVj
aWZpZWQgaW4gdGhlCj4gK2RvbWFpbidzIGNvbmZpZ3VyYXRpb24uCj4gKwo+ICs9aXRlbSBCPHN5
bmNfcHQ+Cj4gKwo+ICtUaGlzIG9wdGlvbiBtZWFucyB0aGF0IElPTU1VIG1hcHBpbmdzIHdpbGwg
YmUgc3luY2hyb25pemVkIHdpdGggdGhlCj4gK2RvbWFpbidzIFAyTSB0YWJsZSBhcyBmb2xsb3dz
Ogo+ICsKPiArRm9yIGEgUFYgZG9tYWluLCBhbGwgd3JpdGFibGUgcGFnZXMgYXNzaWduZWQgdG8g
dGhlIGRvbWFpbiBhcmUgaWRlbnRpdHkKPiArbWFwcGVkIGJ5IE1GTiBpbiB0aGUgSU9NTVUgcGFn
ZSB0YWJsZS4gVGh1cyBhIGRldmljZSBkcml2ZXIgcnVubmluZyBpbiB0aGUKPiArZG9tYWluIG1h
eSBwcm9ncmFtIHBhc3N0aHJvdWdoIGhhcmR3YXJlIGZvciBETUEgdXNpbmcgTUZOIHZhbHVlcwo+
ICsoaS5lLiBob3N0L21hY2hpbmUgZnJhbWUgbnVtYmVycykgbG9va2VkIHVwIGluIGl0cyBQMk0u
Cj4gKwo+ICtGb3IgYW4gSFZNIGRvbWFpbiwgYWxsIG5vbi1mb3JlaWduIFJBTSBwYWdlcyBwcmVz
ZW50IGluIGl0cyBQMk0gd2lsbCBiZQo+ICttYXBwZWQgYnkgR0ZOIGluIHRoZSBJT01NVSBwYWdl
IHRhYmxlLiBUaHVzIGEgZGV2aWNlIGRyaXZlciBydW5uaW5nIGluIHRoZQo+ICtkb21haW4gbWF5
IHByb2dyYW0gcGFzc3Rocm91Z2ggaGFyZHdhcmUgdXNpbmcgR0ZOIHZhbHVlcyAoaS5lLiBndWVz
dAo+ICtwaHlzaWNhbCBmcmFtZSBudW1iZXJzKSB3aXRob3V0IGFueSBmdXJ0aGVyIHRyYW5zbGF0
aW9uLgo+ICsKPiArVGhpcyBvcHRpb24gaXMgbm90IGN1cnJlbnRseSBhdmFpbGFibGUgb24gQXJt
Lgo+ICsKPiArPWl0ZW0gQjxzaGFyZV9wdD4KPiArCj4gK1RoaXMgb3B0aW9uIGlzIHVuYXZhaWxh
YmxlIGZvciBhIFBWIGRvbWFpbi4gRm9yIGFuIEhWTSBkb21haW4sIHRoaXMgb3B0aW9uCj4gK21l
YW5zIHRoYXQgdGhlIElPTU1VIHdpbGwgYmUgcHJvZ3JhbW1lZCB0byBkaXJlY3RseSByZWZlcmVu
Y2UgdGhlIGRvbWFpbidzCj4gK1AyTSB0YWJsZSBhcyBpdHMgcGFnZSB0YWJsZS4gRnJvbSB0aGUg
cG9pbnQgb2YgdmlldyBvZiBhIGRldmljZSBkcml2ZXIKPiArcnVubmluZyBpbiB0aGUgZG9tYWlu
IHRoaXMgaXMgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQgdG8gQjxzeW5jX3B0PiBidXQKPiArcGxh
Y2VzIGxlc3MgbG9hZCBvbiB0aGUgaHlwZXJ2aXNvciBhbmQgc28gc2hvdWxkIGdlbmVyYWxseSBi
ZSBzZWxlY3RlZCBpbgo+ICtwcmVmZXJlbmNlLiBIb3dldmVyLCB0aGUgYXZhaWxhYmlsaXR5IG9m
IHRoaXMgb3B0aW9uIGlzIGhhcmR3YXJlIHNwZWNpZmljLgo+ICtJZiBCPHhsIGluZm8+IHJlcG9y
dHMgQjx2aXJ0X2NhcHM+IGNvbnRhaW5pbmcgQjxpb21tdV9oYXBfcHRfc2hhcmU+IHRoZW4KPiAr
dGhpcyBvcHRpb24gbWF5IGJlIHVzZWQuCj4gKwo+ICs9aXRlbSBCPGVuYWJsZWQ+Cj4gKwo+ICtU
aGlzIG9wdGlvbiBlbmFibGVzIElPTU1VIG1hcHBpbmdzIGFuZCBzZWxlY3RzIGFuIGFwcHJvcHJp
YXRlIGRlZmF1bHQKPiArb3BlcmF0aW5nIG1vZGUuIEZvciBIVk0gZG9tYWlucyBydW5uaW5nIG9u
IHBsYXRmb3JtcyB3aGVyZSB0aGUgb3B0aW9uIGlzCj4gK2F2YWlsYWJsZSwgdGhpcyBpcyBlcXVp
dmFsZW50IHRvIEI8c2hhcmVfcHQ+LiBPdGhlcndpc2UsIGFuZCBhbHNvIGZvciBQVgo+ICtkb21h
aW5zLCB0aGlzIG9wdGlvbnMgaXMgZXF1aXZhbGVudCB0byBCPHN5bmNfcHQ+LgoKLi4ucHV0IHRo
ZSBvcHRpb24gd2Ugd2FudCAvIGV4cGVjdCBwZW9wbGUgbmVhcmVyIHRoZSB0b3AgKGVpdGhlciBm
aXJzdApvciBzZWNvbmQpLgoKVGhhbmtzLAogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
