Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE3D95FAD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 15:15:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i03vx-00031U-6s; Tue, 20 Aug 2019 13:12:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IYD1=WQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i03vv-00031P-PV
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 13:12:20 +0000
X-Inumbo-ID: 2208f184-c34c-11e9-8bf7-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2208f184-c34c-11e9-8bf7-12813bfff9fa;
 Tue, 20 Aug 2019 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566306738;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=mIcNxOctXA9GT7VJOaKSzb9XAZp8hQ82qvZwfxXTDQU=;
 b=NKLVDkjZtTtMVTAK1xZnsm8i4BObtXn3iuT1P0JBsKTOEVAsbvaVFOtO
 5LJCpsmzuKhul6IC+yZKAD/d8/1zsNawdL0S62VNIgbmKVvwEAm4z/BGM
 YBR/TRWsEgFjsTdtOMsm8Cs1CH997MhNFzM8kPve8BRUqwA6ZWt5LJMlL Y=;
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
IronPort-SDR: jHwI0b1X4nwCwekOd4QqqJZqIHDNOkAo7iipHB0wsB8jHa3rltOUHtZoXMNFH3nAmbVwi+W3Pt
 4DArR/e7vKIJg/JdB0SxCELgAQELjUG6sGcGTmlZPkQ1GMZhB6KncCZ/DACcTWnn1PI8muBTfe
 NFFnGDZ380hR0dYyELmI4RWic/7ZEqiSSW0SQJF/rzwoM7thLZmQMYq4qQ0D2Bet5iTQQ5IPOg
 wtPmK/SrJGatOOHBYGVvK8/YiKo9XwFsG1sV6mwEmjlqBa9g+ZGAa3hrDCm6yqnQfUjzto/u9u
 6U4=
X-SBRS: 2.7
X-MesageID: 4520556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,408,1559534400"; 
   d="scan'208";a="4520556"
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <20190819180125.17504-1-julien.grall@arm.com>
 <ddf69b87-e6f3-689a-17c6-84b00af7d475@citrix.com>
 <cf285756-588b-0682-ef35-73b3d183e9ed@arm.com>
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
Message-ID: <720ddd9b-5d7c-fd28-91d9-259c4b5cda36@citrix.com>
Date: Tue, 20 Aug 2019 14:12:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cf285756-588b-0682-ef35-73b3d183e9ed@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/console: Fix build when
 CONFIG_DEBUG_TRACE=y
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDgvMjAxOSAxOTozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDgvMTkvMTkgNzowNCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMDgvMjAx
OSAxOTowMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gQ29tbWl0IGI1ZTZlMWVlOGRhICJ4ZW4v
Y29uc29sZTogRG9uJ3QgdHJlYXQgTlVMIGNoYXJhY3RlciBhcyB0aGUgZW5kCj4+PiBvZiB0aGUg
YnVmZmVyIiBleHRlbmRlZCBzZXJjb25fcHV0cyB0byB0YWtlIHRoZSBudW1iZXIgb2YgY2hhcmFj
dGVyCj4+PiB0byBwcmludCBpbiBhcmd1bWVudC4KPj4+Cj4+PiBTYWRseSwgYSBjb3VwbGUgb2Yg
Y291cGxlIG9mIHRoZSBjYWxsZXJzIGluIGRlYnVndHJhY2VfZHVtcF93b3JrZXIoKQo+Pj4gd2Vy
ZSBub3QgY29udmVydGVkLiBUaGlzIHJlc3VsdCB0byBhIGJ1aWxkIGZhaWx1cmUgd2hlbiBlbmFi
bGluZwo+Pj4gQ09ORklHX0RFQlVHX1RSQUNFLgo+Pj4KPj4+IFNwb3R0ZWQgYnkgVHJhdmlzIHVz
aW5nIHJhbmRjb25maWcKPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4+PiAtLS0KPj4+IMKgIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIHwg
NSArKystLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgYi94
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+Pj4gaW5kZXggMmMxNGMyY2E3My4uOTI0ZDQ5NzFj
YSAxMDA2NDQKPj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+PiArKysgYi94
ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+Pj4gQEAgLTExODUsMTEgKzExODUsMTIgQEAgc3Rh
dGljIHZvaWQgZGVidWd0cmFjZV9kdW1wX3dvcmtlcih2b2lkKQo+Pj4gwqAgwqDCoMKgwqDCoCAv
KiBQcmludCBvbGRlc3QgcG9ydGlvbiBvZiB0aGUgcmluZy4gKi8KPj4+IMKgwqDCoMKgwqAgQVNT
RVJUKGRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfYnl0ZXMgLSAxXSA9PSAwKTsKPj4+IC3CoMKg
wqAgc2VyY29uX3B1dHMoJmRlYnVndHJhY2VfYnVmW2RlYnVndHJhY2VfcHJkXSk7Cj4+PiArwqDC
oMKgIHNlcmNvbl9wdXRzKCZkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0sCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmxlbigmZGVidWd0cmFjZV9idWZbZGVidWd0
cmFjZV9wcmRdKSk7Cj4+Cj4+IElzbid0IHRoaXMganVzdCBkZWJ1Z3RyYWNlX2J5dGVzIC0gZGVi
dWd0cmFjZV9wcmQgLSAxID8KPgo+IEkgdHJpZWQgYW5kIGl0IHJlc3VsdGVkIHRvIHByaW50IGEg
bG90IG9mIEBeIG9uIHRoZSBjb25zb2xlLiBUaGlzIGlzCj4gYmVjYXVzZSB0aGUgcmluZyBtYXkg
bm90IGJlIGZ1bGwuCj4KPiBTbyB0aGUgcG9ydGlvbiBiZXR3ZWVuIGRlYnVndHJhY2VfcHJkIGFu
ZCBkZWJ1Z3RyYWNlX2J5dGVzIHdpbGwgYmUKPiBmdWxsIG9mIHplcm8uCj4KPiBMb29raW5nIGF0
IHRoZSBjb2RlIGFnYWluLCBJIHRoaW5rIHRoaXMgcG9ydGlvbiBhbmQgZWl0aGVyIGJlIGZ1bGwg
b2YKPiB6ZXJvIGNoYXJhY3RlciBvciBmdWxsIG9mIG5vbi16ZXJvIGNoYXJhY3Rlci4gSW4gb3Ro
ZXIgd29yZCwgYSBtaXgKPiB3b3VsZCBub3QgYmUgcG9zc2libGUuIFNvIGhvdyBhYm91dDoKPgo+
IGlmICggZGVidWd0cmFjZV9idWZbZGVidWd0cmFjZV9wcmRdICE9ICdcMCcgKQo+IMKgIHNlcmNv
bl9wdXRzKCZkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX3ByZF0sCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGVidWd0cmFjZV9ieXRlcyAtIGRlYnVndHJhY2VfcHJkIC0gMSk7CgpMR1RN
LsKgIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
