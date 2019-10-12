Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBFDD5152
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 19:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJKxW-0005qi-6e; Sat, 12 Oct 2019 17:13:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMVA=YF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iJKxU-0005qd-Ga
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 17:13:36 +0000
X-Inumbo-ID: 9f86add6-ed13-11e9-a531-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f86add6-ed13-11e9-a531-bc764e2007e4;
 Sat, 12 Oct 2019 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570900415;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4DHLRXImFJWI3rNwZn9eSFT6kMM1ox7ZcVFQeRRts48=;
 b=iFlJdCZYKPtIEpHTPoaTjvYXpQ0zZgvMteG3dE/ip57vlRdBnbAnFO6i
 b2IyBiL8hrVXY0ia7fa9rjriZnZqPhmz0IDS8Ix9iaN78MLwTpLJgAhCN
 i5lbLJn7Rr8YVztPSvrjlmH3+k8ypSeIVFx1m7mMuWVIHTCljwXCQmsyS Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CeLcTfW8Hzx39EbB7Mc1K3QMDOJYz8Zv6j67SC4ZcULoaqahz+UGHV8jTMdiRIR/W/MTcEk3TB
 BwkODwli+U4fJnu9wYjFzD99slGrEnailD1D7e1hHN0u+t/eC74VgGbfKUBYTgavzTcBeX5Hj5
 GclFCQGebQ1iT9mMamzho/ftdeZyZGIbNIiC649jYipMr1yCFJtRMorH2fGMTEjlK/AWNiSJ2m
 cYcLDjrvK8KLSYsnmMYqtlx+yrirwsy3ZAbUgtUJdfg24IkuApeOMNaeTQpoQ+7ebB5RLdORGs
 f2s=
X-SBRS: 2.7
X-MesageID: 6886795
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,288,1566878400"; 
   d="scan'208";a="6886795"
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.39cf5c05f6ef01e3793327a459cad5d884dc0a9c.1570890895.git-series.marmarek@invisiblethingslab.com>
 <bf29c0ca9c1622e980883f11030e21f013312d3e.1570890895.git-series.marmarek@invisiblethingslab.com>
 <272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com>
 <20191012170040.GB28966@mail-itl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <251d8594-0d4f-fd4b-20c3-4f5edf3dc23f@citrix.com>
Date: Sat, 12 Oct 2019 18:13:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191012170040.GB28966@mail-itl>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/efi: optionally call
 SetVirtualAddressMap()
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTAvMjAxOSAxODowMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
Pj4gRm9yIHRoaXMgcmVhc29uLCBtYWtlIGl0IGFuIG9wdGlvbmFsIGZlYXR1cmUsIGRlcGVuZGlu
ZyBvbgo+Pj4gIUtFWEVDLgo+PiBUaGlzIHByZXN1cHBvc2VzIChhdCBYZW4ncyBidWlsZCB0aW1l
KSB0aGF0IGEga2V4ZWMnZCBrZXJuZWwgaXMgZ29pbmcgdG8KPj4gd2FudC9uZWVkIHRvIHVzZSBy
dW50aW1lIHNlcnZpY2VzLsKgIEknbSBub3QgY29udmluY2VkIHRoaXMgaXMKPj4gdW5pdmVyc2Fs
bHkgdHJ1ZSwKPiBJbiBmYWN0LCBhcyBpdCB0dXJuZWQgb3V0IGluIHRoZSBkaXNjdXNzaW9uLCBy
aWdodCBub3cgaXQgZGVmaW5pdGVseQo+IGNhbid0LCBhcyBpdCBkb2Vzbid0IGdldCBydW50aW1l
IHNlcnZpY2VzIHRhYmxlIChvciBlZmkgc3lzdGVtIHRhYmxlIG9yCj4gYW55IG90aGVyIGluZm8g
cmVxdWlyZWQgZm9yIHRoaXMpLgoKT24sIGluIHdoaWNoIGNhc2UgZGVmaW5pdGVseSBkcm9wIHRo
ZSBkZXBlbmRlbmN5LsKgIEtleGVjIHdvcmtzIGZpbmUgKGFuZAppcyB0ZXN0ZWQgdGhvcm91Z2hs
eSBieSBYZW5TZXJ2ZXIpIHdpdGggY3VycmVudCBYZW4gd2hlbiBFRkkgYm9vdGVkLCBhbmQKdGhl
IGNhbGwgdG8gU2V0VmlydHVhbEFkZHJlc3NNYXAoKSB3b24ndCBtYWtlIGFueSBkaWZmZXJlbmNl
IGluIHRoZQprZXhlYyBlbnZpcm9ubWVudC4KCldob21ldmVyIGRvZXMgdGhlIHBsdW1iaW5nIGZv
ciBFRkkgZGV0YWlscyBpbiB0aGUgZnV0dXJlIGNhbiBhbHNvIHBhc3MKdGhlIHZpcnR1YWwgbWFw
IChsaWtlIExpbnV4IGFscmVhZHkgZG9lcykgYW5kIGV2ZXJ5dGhpbmcgd2lsbCBjb250aW51ZQp0
byB3b3JrIGZpbmUuCgo+Cj4+PiBBbmQgdG8gbm90IGluZmxhdGUgbnVtYmVyIG9mIHN1cHBvcnRl
ZCBjb25maWd1cmF0aW9ucywgaGlkZSBpdAo+Pj4gYmVoaW5kIEVYUEVSVC4KPj4gIm51bWJlciBv
ZiBzdXBwb3J0ZWQgY29uZmlndXJhdGlvbnMiIGlzbid0IGEgcmVsZXZhbnQgYXJndW1lbnQuwqAg
V2Ugd2lsbAo+PiBoYXZlIGFzIGZldyBvciBhcyBtYW55IGFzIGFyZSBhcHByb3ByaWF0ZSB0byBw
cmVzZW50IHRvIHVzZXIsIGdpdmVuIGEKPj4gYmFzZWxpbmUgY29tcGV0ZW5jeSBvZiAiYWJsZSB0
byBhdCByZWFkIGFuZCBjb21wcmVoZW5kIHRoZSBkZXNjcmlwdGlvbnMKPj4gZ2l2ZW4iLgo+Pgo+
PiBBIHZhbGlkIHJlYXNvbiBmb3IgcHV0dGluZyB0aGlzIGJlaGluZCBFWFBFUlQgaXMgYmVjYXVz
ZSBpdCBpcyBhbgo+PiBpbnRlcmltIGJpdCBvZiBkdWN0IHRhcGUsIHRyeWluZyB0byB3b3JrIGFy
b3VuZCBvdGhlciBicmVha2FnZXMgaW4gWGVuLAo+IFJhdGhlciBpbiBVRUZJLi4uCgpJIHN1cHBv
c2UsIHllcy4KCj4+PiAgCj4+PiArI2lmZGVmIENPTkZJR19TRVRfVklSVFVBTF9BRERSRVNTX01B
UAo+Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IGVmaV9tZW1tYXBfc2l6ZTsgaSArPSBlZmlfbWRl
c2Nfc2l6ZSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIEVGSV9NRU1PUllfREVTQ1JJUFRPUiAq
ZGVzYyA9IGVmaV9tZW1tYXAgKyBpOwo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCBkZXNjLT5BdHRy
aWJ1dGUgJiBFRklfTUVNT1JZX1JVTlRJTUUgKQo+Pj4gKyAgICAgICAgICAgIGRlc2MtPlZpcnR1
YWxTdGFydCA9IGRlc2MtPlBoeXNpY2FsU3RhcnQ7Cj4+PiArICAgICAgICBlbHNlCj4+PiArICAg
ICAgICAgICAgZGVzYy0+VmlydHVhbFN0YXJ0ID0gSU5WQUxJRF9WSVJUVUFMX0FERFJFU1M7Cj4+
PiArICAgIH0KPj4+ICsgICAgc3RhdHVzID0gZWZpX3JzLT5TZXRWaXJ0dWFsQWRkcmVzc01hcChl
ZmlfbWVtbWFwX3NpemUsIGVmaV9tZGVzY19zaXplLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1kZXNjX3ZlciwgZWZpX21lbW1hcCk7Cj4+PiArICAgIGlm
ICggc3RhdHVzICE9IEVGSV9TVUNDRVNTICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgIkVGSTogU2V0VmlydHVhbEFkZHJlc3NNYXAoKSBmYWlsZWQgKCUjbHgpLCBk
aXNhYmxpbmcgcnVudGltZSBzZXJ2aWNlc1xuIiwKPj4+ICsgICAgICAgICAgICAgICBzdGF0dXMp
Owo+PiAuLi4gaGVyZS7CoCBwcmludGsoKSBpc24ndCBzZXQgdXAsIGFuZCB3b24ndCBnbyBhbnl3
aGVyZSB1c2VmdWwuCj4gSSBjYW4ndC4gSXQncyBhZnRlciBFeGl0Qm9vdFNlcnZpY2VzKCkuIElz
bid0IGl0IGdvaW5nIHRvIGxhbmQgaW4KPiBjb25zb2xlIHJpbmcsIHRvIGJlIHByaW50ZWQgbGF0
ZXI/CgpVcmdoLsKgIFllcyAtIHlvdSdyZSByaWdodC7CoCBJdCB3aWxsIHNpdCBpbiB0aGUgY29u
c29sZSBidWZmZXIgYW5kIGFwcGVhcgphdCB0aGUgdG9wIG9mIGB4bCBkbWVzZ2AuCgpMZWF2ZSBp
dCBhcy1pcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
