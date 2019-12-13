Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68311E605
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:02:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmOc-0007aA-AU; Fri, 13 Dec 2019 14:58:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifmOa-0007a5-Uk
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:58:20 +0000
X-Inumbo-ID: ffb342e9-1db8-11ea-8f29-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ffb342e9-1db8-11ea-8f29-12813bfff9fa;
 Fri, 13 Dec 2019 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576249099;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=syjEW8R7I8ERjGILLd9x2R7IqJ3t8042PwIKAl6b9ck=;
 b=QwC60FB2iPTTw5ZF7NMh6Bec2dXFB/vVYpJ+GH1rQUXwjTovwvYKDREK
 qYGuxeEPV56KMwledHOBL43NhlsU+zRvQu2gYnR5Va8PxxVAGSzJs9VkS
 Q/IlHp1pBaQj69i+WMBPk/m7VtKAgGoiHgZgnC8bLcqlAQh3OX9aZc01B 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4qbqjSzWM96TudEsyt/Vs4/4WPczfhlM3cp3v+lPVR5nsZWODjC5ScAxuLKcJB23uIPsw5tMYY
 zpFKt1Mhk3B4j+llHRfR2F/e8qDBSKV+DIr730B5w2Fm2yrnblGUNWhDFO3IUczD7GtnQX6EUV
 VIGx2uwy6vCeZnWJCzHIXUXE27wx/p067GocPMAZJHFqttHgDlZyht3dQG0PzlcKLYOOYnmGGo
 fCMFGPo3nP1qrXUweQqICQRUm/TBTYI/BnHwzcSXmKG8ZbYN5OpsFQN2g/88aMZZxPxoIUmpSN
 jsg=
X-SBRS: 2.7
X-MesageID: 10005060
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10005060"
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576154413.git.hongyxia@amazon.com>
 <77acf62cab293ae99bd1fc079e1b0853faaf1242.1576154413.git.hongyxia@amazon.com>
 <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
 <345f27f4-c2d3-0501-6d48-e1b757c0154d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABtClBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPokCOgQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86LkCDQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAYkC
 HwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
Message-ID: <374283a7-bc45-9f74-55f2-501f854d55c6@citrix.com>
Date: Fri, 13 Dec 2019 14:58:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <345f27f4-c2d3-0501-6d48-e1b757c0154d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyxia@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTIvMjAxOSAxNDozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMTIuMjAxOSAx
NToxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMTIvMjAxOSAxMjo0NiwgSG9uZ3lh
biBYaWEgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJj
aC94ODYvbW0uYwo+Pj4gaW5kZXggN2Q0ZGQ4MGE4NS4uOGRlZjRmYjhkOCAxMDA2NDQKPj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+Pj4gQEAg
LTUxNTEsNiArNTE1MSw1MiBAQCBsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wxZSh1bnNpZ25l
ZCBsb25nIHYpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2FyZWFfbG9jYWwo
KGNvbnN0IHZvaWQgKil2LCBmKSA6IFwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1
c2hfYXJlYV9hbGwoKGNvbnN0IHZvaWQgKil2LCBmKSkKPj4+ICAKPj4+ICsvKiBTaGF0dGVyIGFu
IGwzIGVudHJ5IGFuZCBwb3B1bGF0ZSBsMi4gSWYgdmlydCBpcyBwYXNzZWQgaW4sIGFsc28gZG8g
Zmx1c2guICovCj4+PiArc3RhdGljIGJvb2wgc2hhdHRlcl9sM2UobDNfcGdlbnRyeV90ICpwbDNl
LCB1bnNpZ25lZCBsb25nIHZpcnQsIGJvb2wgbG9ja2luZykKPj4+ICt7Cj4+PiArICAgIHVuc2ln
bmVkIGludCBpOwo+Pj4gKyAgICBsM19wZ2VudHJ5X3Qgb2wzZSA9ICpwbDNlOwo+Pj4gKyAgICBs
Ml9wZ2VudHJ5X3QgbDJlID0gbDJlX2Zyb21faW50cHRlKGwzZV9nZXRfaW50cHRlKG9sM2UpKTsK
Pj4+ICsgICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7Cj4+PiAr
Cj4+PiArICAgIGlmICggIWwydCApCj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4+PiArCj4+
PiArICAgIGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCj4+PiAr
ICAgIHsKPj4+ICsgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLCBsMmUpOwo+Pj4gKyAgICAgICAg
bDJlID0gbDJlX2Zyb21faW50cHRlKAo+Pj4gKyAgICAgICAgICAgICAgICAgIGwyZV9nZXRfaW50
cHRlKGwyZSkgKyAoUEFHRV9TSVpFIDw8IFBBR0VUQUJMRV9PUkRFUikpOwo+Pj4gKyAgICB9Cj4+
PiArCj4+PiArICAgIGlmICggbG9ja2luZyApCj4+PiArICAgICAgICBzcGluX2xvY2soJm1hcF9w
Z2Rpcl9sb2NrKTsKPj4+ICsgICAgaWYgKCAobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9Q
UkVTRU5UKSAmJgo+Pj4gKyAgICAgICAgIChsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BT
RSkgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBsM2Vfd3JpdGVfYXRvbWljKHBsM2UsCj4+PiAr
ICAgICAgICAgICAgbDNlX2Zyb21fcGFkZHIodmlydF90b19tYWRkcihsMnQpLCBfX1BBR0VfSFlQ
RVJWSVNPUikpOwo+Pj4gKyAgICAgICAgbDJ0ID0gTlVMTDsKPj4+ICsgICAgfQo+Pj4gKyAgICBp
ZiAoIGxvY2tpbmcgKQo+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsK
Pj4+ICsKPj4+ICsgICAgaWYgKCB2aXJ0ICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IGZsdXNoX2ZsYWdzID0KPj4+ICsgICAgICAgICAgICBGTFVTSF9UTEIgfCBGTFVTSF9P
UkRFUigyICogUEFHRVRBQkxFX09SREVSKTsKPj4+ICsKPj4+ICsgICAgICAgIGlmICggbDNlX2dl
dF9mbGFncyhvbDNlKSAmIF9QQUdFX0dMT0JBTCApCj4+PiArICAgICAgICAgICAgZmx1c2hfZmxh
Z3MgfD0gRkxVU0hfVExCX0dMT0JBTDsKPj4gQW5vdGhlciBwcm9ibGVtYXRpYyB1c2Ugb2Ygb2wz
ZSB3aGljaCBpcyByYWN5IG9uIGNvbmZsaWN0LsKgIFlvdSBuZWVkIHRvCj4+IHN0cmljdGx5IHVz
ZSB0aGUgY29udGVudCBvZiAqcGwzZSBmcm9tIHdpdGhpbiB0aGUgbG9ja2VkIHJlZ2lvbi4KPiBC
dXQgdGhpcyBpc24ndCBhIHByb2JsZW0gaW50cm9kdWNlZCBoZXJlLCBpLmUuIGZpeGluZyBvZiBp
dCBkb2Vzbid0Cj4gc3RyaWN0bHkgZmFsbCB1bmRlciAicmUtZmFjdG9yIi4gKEknbSBjZXJ0YWlu
bHkgbm90IG9wcG9zZWQgdG8KPiBnZXR0aW5nIHRoaXMgcmlnaHQgYXQgdGhlIHNhbWUgdGltZS4p
CgpJdCBpcyBicmFuZCBuZXcgY29kZSB3aGljaCBpcyByYWN5LsKgIEl0cyBlaXRoZXIgbm90IG5l
Y2Vzc2FyeSwgb3IgYW4KWFNBLWluLXdhaXRpbmcuwqAgKEFuZCBub3QgbmVjZXNzYXJ5LCBBRkFJ
Q1QpLgoKPgo+PiBIb3dldmVyLCB3aHkgaGF2ZSB5b3UgbW92ZWQgdGhlIGZsdXNoaW5nIGluIGhl
cmU/wqAgT25seSBvbmUgb2YgdGhlIHR3bwo+PiBjYWxsZXJzIGFjdHVhbGx5IHdhbnRlZCBpdCwg
YW5kIGV2ZW4gdGhlbiBJJ20gbm90IHRvdGFsbHkgc3VyZSBpdCBpcwo+PiBuZWNlc3NhcnkuCj4+
Cj4+IEJvdGggY2FsbGVycyBvcGVyYXRlIG9uIGFuIGFyYml0cmFyeSByYW5nZSBvZiBhZGRyZXNz
ZXMsIGFuZCBmb3IKPj4gYW55dGhpbmcgb3RoZXIgdGhhbiBhIHNpbmdsZXRvbiB1cGRhdGUsIHdp
bGwgd2FudCB0byBpc3N1ZSBhIHNpbmdsZQo+PiBmbHVzaCBhdCB0aGUgZW5kLCByYXRoZXIgdGhh
biBhIHNwYXRlIG9mIGZsdXNoZXMgZm9yIHN1Yi1hcmVhcy4KPj4KPj4gKEFsdGhvdWdoIHNvbWVv
bmUgcmVhbGx5IHBsZWFzZSBjaGVjayBteSByZWFzb25pbmcgaGVyZSBmb3IgdGhlCj4+IG1hcF9w
YWdlc190b194ZW4oKSBjYXNlIHdoaWNoIGN1cnJlbnRseSBkb2VzIGhhdmUgc3ViLWFyZWEgZmx1
c2hpbmcuKQo+Pgo+PiBFaXRoZXIgdGhlIGZsdXNoIHdhbnRzIGRyb3BwaW5nIChhbmQgYmVzdCB2
aWEgYSBwcmVyZXEgcGF0Y2ggYWx0ZXJpbmcKPj4gbWFwX3BhZ2VzX3RvX3hlbigpKSwgb3IgeW91
IG5lZWQgdG8gY2FjaGUgb2wzZSBpbiB0aGUgbG9ja2VkIHJlZ2lvbiB3aXRoCj4+IEFDQ0VTU19P
TkNFKCkgb3IgZXF1aXZhbGVudC4KPiBXZWxsLCBhdCBiZXN0IHJlcGxhY2luZyBieSBhIHNpbmds
ZSBvbmUgYXQgdGhlIGVuZCwgYnV0IEkgZ3Vlc3MKPiB0aGUgY3VycmVudCBwaWVjZW1lYWwgYmVo
YXZpb3IgaXMgdG8gY29wZSB3aXRoIGVycm9yIHBhdGhzIChzZWUKPiBKdWxpZW4ncyByZXBvcnQg
YWdhaW5zdCBtb2RpZnlfeGVuX21hcHBpbmdzKCksIHdoZXJlIGl0J3MKPiBleGFjdGx5IHRoZSBv
dGhlciB3YXkgYXJvdW5kKS4gQ29uc2lkZXJpbmcgZXNwZWNpYWxseSBzcGVjdWxhdGl2ZQo+IGFj
Y2Vzc2VzIEkgdGhpbmsgaXQgaXNuJ3QgdGhlIHdvcnN0IGlkZWEgdG8ga2VlcCB0aGUgd2luZG93
IHNtYWxsCj4gYmV0d2VlbiBzaGF0dGVyIGFuZCBmbHVzaCAoc2hvcnQgb2YgdXMgZG9pbmcgYSBw
cm9wZXIgYnJlYWstdGhlbi0KPiBtYWtlIHNlcXVlbmNlKS4KCkV2ZXJ5IHN1Yi1mbHVzaCBpcyBh
IGJyb2FkY2FzdCBJUEksIHdoaWNoIGlzIGEgc2NhbGFiaWxpdHkgY29uY2VybiwgYW5kCmF0IGxl
YXN0IG5lZWRzIGNvbnNpZGVyaW5nLgoKeDg2IGlzIGRlc2lnbmVkIG5vdCB0byBuZWVkIEJCTSwg
YWx0aG91Z2ggdGhlIEJCTSBzZXF1ZW5jZSBjYW4gYmUKaGVscGZ1bCBhdCB0aW1lcyB0byBzaW1w
bGlmeSBvdGhlciByZWFzb25pbmcuwqAgSXQgbWlnaHQgYWN0dWFsbHkgYmUKbmVjZXNzYXJ5IGlu
IHNvbWUgU01QIGNhc2VzLgoKU3BlY3VsYXRpb24gY2FuIGJpdGUgeW91IGF0IGFueSBwb2ludCwg
aW5jbHVkaW5nIHRoZSB2ZXJ5IG5leHQKaW5zdHJ1Y3Rpb24uwqAgVGhlIGxvZ2ljIGlzIGVpdGhl
ciBjb3JyZWN0LCBvciBub3QgY29ycmVjdCwgYW5kIHRoZQpkaXN0YW5jZSBiZXR3ZWVuIHRoZSBQ
VEUgdXBkYXRlIGFuZCB0aGUgZmx1c2ggaXMgb25seSByZWxldmFudCB3aGVuIGl0CmNvbWVzIHRv
IHRoZSBzY2FyY2l0eSBvZiB0aGUgaW5jb3JyZWN0IGNhc2UgbWFuaWZlc3RpbmcgaW4gYSBub3Rp
Y2VhYmxlIHdheS4KCkZ1bmRhbWVudGFsbHksIHdlIGVpdGhlciBuZWVkIEJCTSwgb3IgdGhlIGZs
dXNoIGlzIHNhZmUgdG8gZGVmZXIgdG8gdGhlCmVuZC7CoCBFdmVyeXRoaW5nIGluLWJldHdlZW4g
aXMgcmFjeSwgYW5kIGRyb3BwaW5nIHRoZSBzdWItZmx1c2hlcyB3b3VsZAptYWtlIGFueSBpbmNv
cnJlY3QgY2FzZXMgbW9yZSBsaWtlbHkgdG8gbWFuaWZlc3QuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
