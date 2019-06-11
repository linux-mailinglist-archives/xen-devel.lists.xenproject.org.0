Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF63DBC9
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 22:27:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hanJq-0007tn-I2; Tue, 11 Jun 2019 20:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LgYn=UK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hanJo-0007ta-UX
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 20:24:32 +0000
X-Inumbo-ID: e97676a8-8c86-11e9-bdd3-773685b7e48a
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e97676a8-8c86-11e9-bdd3-773685b7e48a;
 Tue, 11 Jun 2019 20:24:29 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f9I6I19JmgVdqdmCCxw4zN+p6b0p4In8TucWjk9ndjaFjQyhVI7Km4e3fiqNpNoSQbJr+YwLO/
 7Czegjrcr7Z7zpvLIe1nHdag9oR87/u3aSUitJ7HXCyg15pd5GYiJ/WIDyIfhYvHnsQp+grK/E
 hgh0I2eYN5bPOtJgq/rfAQrIiR/OgkYW67Y8vcc67sOTkVWOVb4BHilQM7nuVsNQ65uCTUGOMN
 6qaWAGASkReNwZ7hj9lBFVoo/0S2XjjTP0tULL55c9saehVX836Hj83mMXpdXPQi/seCzz2bfF
 ITk=
X-SBRS: 2.7
X-MesageID: 1617149
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,363,1557201600"; 
   d="scan'208";a="1617149"
To: Julien Grall <Julien.Grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111134410.13737@sstabellini-ThinkPad-T480s>
 <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
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
Message-ID: <c2876923-91b7-77ef-c14a-c4c46b0cfcb7@citrix.com>
Date: Tue, 11 Jun 2019 21:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6ad24adc-dfb7-a2da-b4c8-2fe49c61a31f@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Checking INVALID_MFN in mfn_add (WAS: Re: [PATCH
 MM-PART3 v2 04/12] xen/arm: mm: Only increment mfn when valid in
 xen_pt_update)
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
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>, Jan
 Beulich <jbeulich@suse.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDYvMjAxOSAyMDo1NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMTEv
MDYvMjAxOSAxOTozNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBUdWUsIDE0IE1h
eSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBDdXJyZW50bHksIHRoZSBNRk4gd2lsbCBi
ZSBpbmNyZW1lbnRlZCBldmVuIGlmIGl0IGlzIGludmFsaWQuIFRoaXMgd2lsbAo+Pj4gcmVzdWx0
IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0IGl0ZXJhdGlvbi4KPj4+Cj4+PiBX
aGlsZSB0aGlzIGlzIG5vdCBhIG1ham9yIHByb2JsZW0gdG9kYXksIHRoaXMgd2lsbCBiZSBpbiB0
aGUgZnV0dXJlIGlmCj4+PiB0aGUgY29kZSBleHBlY3QgYW4gaW52YWxpZCBNRk4gYXQgZXZlcnkg
aXRlcmF0aW9uLgo+Pj4KPj4+IFN1Y2ggYmVoYXZpb3IgaXMgcHJldmVudGVkIGJ5IGF2b2lkaW5n
IHRvIGluY3JlbWVudCBhbiBpbnZhbGlkIE1GTi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4+Pgo+Pj4gLS0tCj4+PiAgICAgIENoYW5n
ZXMgaW4gdjI6Cj4+PiAgICAgICAgICAtIE1vdmUgdGhlIHBhdGNoIGVhcmxpZXIgb24gaW4gdGhl
IHNlcmllcwo+Pj4gICAgICAgICAgLSBBZGQgQW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPj4+IC0tLQo+
Pj4gICB4ZW4vYXJjaC9hcm0vbW0uYyB8IDUgKysrKy0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jCj4+PiBpbmRleCBmOTU2YWE2Mzk5Li45ZGUy
YTExNTBmIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMKPj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9tbS5jCj4+PiBAQCAtMTA1MSwxMSArMTA1MSwxNCBAQCBzdGF0aWMgaW50IHhlbl9w
dF91cGRhdGUoZW51bSB4ZW5tYXBfb3BlcmF0aW9uIG9wLAo+Pj4gICAKPj4+ICAgICAgIHNwaW5f
bG9jaygmeGVuX3B0X2xvY2spOwo+Pj4gICAKPj4+IC0gICAgZm9yKDsgYWRkciA8IGFkZHJfZW5k
OyBhZGRyICs9IFBBR0VfU0laRSwgbWZuID0gbWZuX2FkZChtZm4sIDEpKQo+Pj4gKyAgICBmb3Io
IDsgYWRkciA8IGFkZHJfZW5kOyBhZGRyICs9IFBBR0VfU0laRSApCj4+PiAgICAgICB7Cj4+PiAg
ICAgICAgICAgcmMgPSB4ZW5fcHRfdXBkYXRlX2VudHJ5KG9wLCBhZGRyLCBtZm4sIGZsYWdzKTsK
Pj4+ICAgICAgICAgICBpZiAoIHJjICkKPj4+ICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiArCj4+
PiArICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQo+Pj4gKyAgICAgICAg
ICAgIG1mbiA9IG1mbl9hZGQobWZuLCAxKTsKPj4+ICAgICAgIH0KPj4gVGhpcyBpcyBPSyBidXQg
Z290IG1lIHRoaW5raW5nOiBzaG91bGQgd2UgYmUgdXBkYXRpbmcgdGhlIG1mbiBpbiBtZm5fYWRk
Cj4+IGlmIHRoZSBtZm4gaXMgSU5WQUxJRD8gVGhlIG1mbl9lcShtZm4sIElOVkFMSURfTUZOKSBj
b3VsZCBsaXZlIGluc2lkZQo+PiB0aGUgc3RhdGljIGlubGluZSBtZm5fdCBtZm5fYWRkIGZ1bmN0
aW9uLiBXaGF0IGRvIHlvdSB0aGluaz8gSSBkb24ndAo+PiB0aGluayB0aGVyZSBhcmUgYW55IHZh
bGlkIHNjZW5hcmlvcyB3aGVyZSB3ZSB3YW50IHRvIGluY3JlbWVudAo+PiBJTlZBTElEX01GTi4u
Lgo+IE15IGZpcnN0IHRob3VnaHQgaXMgbWZuX2FkZCguLi4pIG1heSBiZSB1c2VkIGluIHBsYWNl
IHdoZXJlIHdlIGtub3cgdGhlIAo+IG1mbiBpcyBub3QgSU5WQUxJRF9NRk4uIFNvIHdlIHdvdWxk
IGFkZCBleHRyYSBjaGVjayB3aGVuIGl0IG1heSBub3QgYmUgCj4gbmVjZXNzYXJ5LiBBbHRob3Vn
aCwgSSBhbSBub3Qgc3VyZSBpZiBpdCBpcyBpbXBvcnRhbnQuCj4KPiBJIGhhdmUgYWRkZWQgQW5k
cmV3ICYgSmFuIHRvIGdldCBhbnkgb3BpbmlvbnMuCgptZm5fYWRkKGZvbywgYmFyKSBpcyBzaG9y
dGhhbmQgZm9yIGZvbyArPSBiYXIsIGFuZCBzaG91bGQgcmVtYWluIGFzIHN1Y2guCgpJdCBleGlz
dHMgb25seSBiZWNhdXNlIHdlIGNhbid0IG92ZXJsb2FkIG9wZXJhdG9ycyBpbiBDLCBhbmQgd2Fu
dApzb21ldGhpbmcgc2xpZ2h0bHkgbW9yZSByZWFkYWJsZSB0aGFuIF9tZm4obWZuX3goZm9vKSAr
IGJhcikKCkJlaGluZCB0aGUgc2NlbmVzLCB0aGUgY29tcGlsZXIgd2lsbCB0dXJuIGl0IGJhY2sg
aW50byBhIHNpbmdsZSBhZGQKaW5zdHJ1Y3Rpb24uCgpUaGUgc2F0dXJhdGluZyBiZWhhdmlvdXIg
aGVyZSBpcyBzcGVjaWZpYyB0byB0aGUgcGFnZXRhYmxlIG9wZXJlYXRpb25zCndoZXJlIHBhc3Np
bmcgSU5WQUxJRF9NRk4gaXMgYW4gYWxpYXMgZm9yIHVubWFwLCBhbmQgaXMgdGhlcmVmb3JlIG5v
dAp1c2VmdWwgaW4gdGhlIG1ham9yaXR5IG9mIHRoZSB1c2VycyBvZiBtZm5fYWRkKCksIGFuZCBj
ZXJ0YWlubHkgbm90CnNvbWV0aGluZyB3ZSBzaG91bGQgaGF2ZSBhIGhpZGRlbiBicmFuY2ggZm9y
IGluIHRoZSBtaWRkbGUgb2YgbWFueSB0aWdodApsb29wcy4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
