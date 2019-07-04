Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F45FCE4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 20:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj6R7-0002sq-QH; Thu, 04 Jul 2019 18:26:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E3Ia=VB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hj6R6-0002sl-6d
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 18:26:24 +0000
X-Inumbo-ID: 38646fa4-9e89-11e9-be4a-274ebe6f9c3d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38646fa4-9e89-11e9-be4a-274ebe6f9c3d;
 Thu, 04 Jul 2019 18:26:21 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0LYiJ56n2lCIdOWi85j25PokQKZSFaxjloJe2tHVt5oNMcgXGe8UoI7cvOqw8vnvZrXinGpJyy
 lSsPGUpXoi8i6obyNxqfb2Cl6jrIKoP++RBZPpVsPc6PNzVZSTzjpy3DzeofEoy4Fv37qorTKn
 bM1xGAy+h2/meED2CcS/betD3v5FVG9+RKlJ8iFB7K3Qc7iUes3y7GO7Q6Uc++xUtgm8k43Z2w
 tXuNGIIcgUlsZyKDo+Y2zYgphbhBr+7EEmONLvlL/qLeRyBPU+4CG1EpJFrnP0Oil6p3/8Ki0/
 vgQ=
X-SBRS: 2.7
X-MesageID: 2628342
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2628342"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <95252da8-777b-9527-6f5b-1e1a5994f845@suse.com>
 <6f03fb10-6339-610f-0620-86675d76a4ee@citrix.com>
 <e28b72a5-8c3e-104d-027e-225d04cfc12f@citrix.com>
 <5879b09b-c664-839d-0452-315627efa039@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <635a1bd4-0059-1bae-b462-04e92ca667ad@citrix.com>
Date: Thu, 4 Jul 2019 19:26:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5879b09b-c664-839d-0452-315627efa039@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 05/23] x86emul: support AVX512F gather
 insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMDcvMjAxOSAxNToyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMDcuMjAxOSAx
NjoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDQvMDcvMjAxOSAxNToxMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAxLzA3LzIwMTkgMTI6MTgsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPj4+PiBAQCAtOTEw
MCw2ICs5MTAwLDEzMyBAQCB4ODZfZW11bGF0ZSgKPj4+PiAgICAgICAgICAgIHB1dF9zdHViKHN0
dWIpOwo+Pj4+ICAgIAo+Pj4+ICAgICAgICAgICAgaWYgKCByYyAhPSBYODZFTVVMX09LQVkgKQo+
Pj4+ICsgICAgICAgICAgICBnb3RvIGRvbmU7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgIHN0YXRlLT5z
aW1kX3NpemUgPSBzaW1kX25vbmU7Cj4+Pj4gKyAgICAgICAgYnJlYWs7Cj4+Pj4gKyAgICB9Cj4+
Pj4gKwo+Pj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19FVkVYXzY2KDB4MGYzOCwgMHg5MCk6IC8q
IHZwZ2F0aGVyZHtkLHF9IG1lbSxbeHl6XW1te2t9ICovCj4+Pj4gKyAgICBjYXNlIFg4NkVNVUxf
T1BDX0VWRVhfNjYoMHgwZjM4LCAweDkxKTogLyogdnBnYXRoZXJxe2QscX0gbWVtLFt4eXpdbW17
a30gKi8KPj4+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmMzgsIDB4OTIpOiAv
KiB2Z2F0aGVyZHB7cyxkfSBtZW0sW3h5el1tbXtrfSAqLwo+Pj4+ICsgICAgY2FzZSBYODZFTVVM
X09QQ19FVkVYXzY2KDB4MGYzOCwgMHg5Myk6IC8qIHZnYXRoZXJxcHtzLGR9IG1lbSxbeHl6XW1t
e2t9ICovCj4+Pj4gKyAgICB7Cj4+Pj4gKyAgICAgICAgdHlwZW9mKGV2ZXgpICpwZXZleDsKPj4+
PiArICAgICAgICB1bmlvbiB7Cj4+Pj4gKyAgICAgICAgICAgIGludDMyX3QgZHdbMTZdOwo+Pj4+
ICsgICAgICAgICAgICBpbnQ2NF90IHF3WzhdOwo+Pj4+ICsgICAgICAgIH0gaW5kZXg7Cj4+Pj4g
KyAgICAgICAgYm9vbCBkb25lID0gZmFsc2U7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgIEFTU0VSVChl
YS50eXBlID09IE9QX01FTSk7Cj4+Pj4gKyAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKCgh
ZXZleC5vcG1zayB8fCBldmV4LmJycyB8fCBldmV4LnogfHwKPj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGV2ZXgucmVnICE9IDB4ZiB8fAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbW9kcm1fcmVnID09IHN0YXRlLT5zaWJfaW5kZXgpLAo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBFWENfVUQpOwo+Pj4+ICsgICAgICAgIGF2eDUxMl92
bGVuX2NoZWNrKGZhbHNlKTsKPj4+PiArICAgICAgICBob3N0X2FuZF92Y3B1X211c3RfaGF2ZShh
dng1MTJmKTsKPj4+PiArICAgICAgICBnZXRfZnB1KFg4NkVNVUxfRlBVX3ptbSk7Cj4+Pj4gKwo+
Pj4+ICsgICAgICAgIC8qIFJlYWQgZGVzdGluYXRpb24gYW5kIGluZGV4IHJlZ2lzdGVycy4gKi8K
Pj4+PiArICAgICAgICBvcGMgPSBpbml0X2V2ZXgoc3R1Yik7Cj4+Pj4gKyAgICAgICAgcGV2ZXgg
PSBjb3B5X0VWRVgob3BjLCBldmV4KTsKPj4+PiArICAgICAgICBwZXZleC0+b3BjeCA9IHZleF8w
ZjsKPj4+PiArICAgICAgICBvcGNbMF0gPSAweDdmOyAvKiB2bW92ZHFhezMyLDY0fSAqLwo+Pj4+
ICsgICAgICAgIC8qCj4+Pj4gKyAgICAgICAgICogVGhlIHJlZ2lzdGVyIHdyaXRlYmFjayBiZWxv
dyBoYXMgdG8gcmV0YWluIG1hc2tlZC1vZmYgZWxlbWVudHMsIGJ1dAo+Pj4+ICsgICAgICAgICAq
IG5lZWRzIHRvIGNsZWFyIHVwcGVyIHBvcnRpb25zIGluIHRoZSBpbmRleC13aWRlci10aGFuLWRh
dGEgY2FzZXMuCj4+Pj4gKyAgICAgICAgICogVGhlcmVmb3JlIHJlYWQgKGFuZCB3cml0ZSBiZWxv
dykgdGhlIGZ1bGwgcmVnaXN0ZXIuIFRoZSBhbHRlcm5hdGl2ZQo+Pj4+ICsgICAgICAgICAqIHdv
dWxkIGhhdmUgYmVlbiB0byBmaWRkbGUgd2l0aCB0aGUgbWFzayByZWdpc3RlciB1c2VkLgo+Pj4+
ICsgICAgICAgICAqLwo+Pj4+ICsgICAgICAgIHBldmV4LT5vcG1zayA9IDA7Cj4+Pj4gKyAgICAg
ICAgLyogVXNlICglcmF4KSBhcyBkZXN0aW5hdGlvbiBhbmQgbW9kcm1fcmVnIGFzIHNvdXJjZS4g
Ki8KPj4+PiArICAgICAgICBwZXZleC0+YiA9IDE7Cj4+Pj4gKyAgICAgICAgb3BjWzFdID0gKG1v
ZHJtX3JlZyAmIDcpIDw8IDM7Cj4+Pj4gKyAgICAgICAgcGV2ZXgtPlJYID0gMTsKPj4+PiArICAg
ICAgICBvcGNbMl0gPSAweGMzOwo+Pj4+ICsKPj4+PiArICAgICAgICBpbnZva2Vfc3R1YigiIiwg
IiIsICI9bSIgKCptbXZhbHApIDogImEiIChtbXZhbHApKTsKPj4+PiArCj4+Pj4gKyAgICAgICAg
cGV2ZXgtPnBmeCA9IHZleF9mMzsgLyogdm1vdmRxdXszMiw2NH0gKi8KPj4+PiArICAgICAgICBw
ZXZleC0+dyA9IGIgJiAxOwo+Pj4+ICsgICAgICAgIC8qIFN3aXRjaCB0byBzaWJfaW5kZXggYXMg
c291cmNlLiAqLwo+Pj4+ICsgICAgICAgIHBldmV4LT5yID0gIW1vZGVfNjRiaXQoKSB8fCAhKHN0
YXRlLT5zaWJfaW5kZXggJiAweDA4KTsKPj4+PiArICAgICAgICBwZXZleC0+UiA9ICFtb2RlXzY0
Yml0KCkgfHwgIShzdGF0ZS0+c2liX2luZGV4ICYgMHgxMCk7Cj4+Pj4gKyAgICAgICAgb3BjWzFd
ID0gKHN0YXRlLT5zaWJfaW5kZXggJiA3KSA8PCAzOwo+Pj4+ICsKPj4+PiArICAgICAgICBpbnZv
a2Vfc3R1YigiIiwgIiIsICI9bSIgKGluZGV4KSA6ICJhIiAoJmluZGV4KSk7Cj4+Pj4gKyAgICAg
ICAgcHV0X3N0dWIoc3R1Yik7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgIC8qIENsZWFyIHVudG91Y2hl
ZCBwYXJ0cyBvZiB0aGUgZGVzdGluYXRpb24gYW5kIG1hc2sgdmFsdWVzLiAqLwo+Pj4+ICsgICAg
ICAgIG4gPSAxIDw8ICgyICsgZXZleC5sciAtICgoYiAmIDEpIHwgZXZleC53KSk7Cj4+Pj4gKyAg
ICAgICAgb3BfYnl0ZXMgPSA0IDw8IGV2ZXgudzsKPj4+PiArICAgICAgICBtZW1zZXQoKHZvaWQg
KiltbXZhbHAgKyBuICogb3BfYnl0ZXMsIDAsIDY0IC0gbiAqIG9wX2J5dGVzKTsKPj4+PiArICAg
ICAgICBvcF9tYXNrICY9ICgxIDw8IG4pIC0gMTsKPj4+PiArCj4+Pj4gKyAgICAgICAgZm9yICgg
aSA9IDA7IG9wX21hc2s7ICsraSApCj4+Pj4gKyAgICAgICAgewo+Pj4+ICsgICAgICAgICAgICBz
aWduZWQgbG9uZyBpZHggPSBiICYgMSA/IGluZGV4LnF3W2ldIDogaW5kZXguZHdbaV07Cj4+PiBO
byBzaWduZWQuwqAgSG93ZXZlciwgc3VyZWx5IHRoaXMgbmVlZHMgdG8gYmUgaW50NjRfdCBhbnl3
YXksIHRvIGZ1bmN0aW9uCj4+PiBjb3JyZWN0bHkgaW4gYSAzMmJpdCBidWlsZCBvZiB0aGUgdGVz
dCBoYXJuZXNzPwo+Pj4KPj4+IFRoZSBTRE0gc2F5cyBWUEdBVEhFUlFEIGlzIGVuY29kYWJsZSBp
biAzMmJpdCB3aXRoIHF1YWR3b3JkIGluZGljZXMuCj4+Pgo+Pj4gfkFuZHJldwo+Pj4KPj4+PiAr
Cj4+Pj4gKyAgICAgICAgICAgIGlmICggIShvcF9tYXNrICYgKDEgPDwgaSkpICkKPj4+PiArICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgcmMgPSBvcHMt
PnJlYWQoZWEubWVtLnNlZywKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1bmNh
dGVfZWEoZWEubWVtLm9mZiArIChpZHggPDwgc3RhdGUtPnNpYl9zY2FsZSkpLAo+PiBBY3R1YWxs
eSwgd2hhdCBTRE0gc2F5cyBpczoKPj4KPj4gIlRoZSBzY2FsZWQgaW5kZXggbWF5IHJlcXVpcmUg
bW9yZSBiaXRzIHRvIHJlcHJlc2VudCB0aGFuIHRoZSBhZGRyZXNzCj4+IGJpdHMgdXNlZCBieSB0
aGUgcHJvY2Vzc29yIChlLmcuLCBpbiAzMi1iaXQgbW9kZSwgaWYgdGhlIHNjYWxlIGlzCj4+IGdy
ZWF0ZXIgdGhhbiBvbmUpLiBJbiB0aGlzIGNhc2UsIHRoZSBtb3N0IHNpZ25pZmljYW50IGJpdHMg
YmV5b25kIHRoZQo+PiBudW1iZXIgb2YgYWRkcmVzcyBiaXRzIGFyZSBpZ25vcmVkLiIKPj4KPj4g
VGhhdCByZWFkcyBhcyBpZiBpdCBpcyBpdCBtZWFucyAiZWEubWVtLm9mZiArICh1MzIpKGlkeCA8
PAo+PiBzdGF0ZS0+c2liX3NjYWxlKSIuCj4gV2h5ICJyZWFkcyBhcyBpZiI/IFdoYXQgZWxzZSBj
b3VsZCBhIDMyLWJpdCBhZGRyZXNzIGNvbXB1dGF0aW9uIGxvb2sKPiBsaWtlPyAoSW4gZXNzZW5j
ZSB0cnVuY2F0ZV9lYSgpIHdpbGwgdHJ1bmNhdGUgdG8gMzIgYml0cyBhbnl3YXkgd2hlbgo+IDMy
LWJpdCBhZGRyZXNzaW5nIGlzIGluIHVzZSwgc28gdGhlIGlubmVyIHRydW5jYXRpb24gaXMgc2lt
cGx5Cj4gcmVkdW5kYW50LikKCk9rIC0gSSB0aGluayBpdCB3aWxsIERUUlQuCgpBY2tlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
