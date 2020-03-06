Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 580B217C04A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:33:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAE0g-0002hb-4l; Fri, 06 Mar 2020 14:31:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/xUX=4X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jAE0e-0002hW-Hj
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:31:28 +0000
X-Inumbo-ID: 299e8618-5fb7-11ea-a7ef-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 299e8618-5fb7-11ea-a7ef-12813bfff9fa;
 Fri, 06 Mar 2020 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583505087;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yoMLlqlstO20XyLo7DwcH4tGk7KkhoaNuC0hyqApKMA=;
 b=HNA212kaeB8l9DvIfwYQNGL+JQM4dcPP/CaObHEbhtziGK3Tk/dyD9xz
 n/ZKGa0hIysOEQz7xPIwb2b6VL8nHPTebtOJ4/rG+GfgjJKxm1v1j9gX2
 wpi02apOB49T04E+sM4qNAWzLBmUNUKNKi8ELnNbByxJ6yTfTd9KjLuFV 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Guq6HjZcyAFMJK316mPw1gwN8yffnQ7erkcl2JHkmvoIYSg6do7olpXy/x+zSGTMKRxXOw12Z1
 p1sgaYJoT36/nv4bkyv6pfa3zzTmNfR8DaviSkTWYuGiiurVZ9ZIia7utHBTy1pZZy4AS6wJ3g
 GvgQwfRlDlQFZTNHdSYRwKDwzvFwUq/o84xctuDV3j/zsOdwX40zYx26w4iKTvAdH+d02JWCUX
 wZ8EFsHObCE4UYtwjuX8t9UqHxQRAjCnTdXV81dKwPZ6ZkqDyM/WYXjoVR3aCjeuK/AXFlVTjt
 fBI=
X-SBRS: 2.7
X-MesageID: 13510156
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,522,1574139600"; d="scan'208";a="13510156"
To: Jan Beulich <jbeulich@suse.com>
References: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
 <3c71c89f-28be-7752-b768-7d696fea0460@suse.com>
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
Message-ID: <9621c0d8-ab29-b0ae-2cab-edfa711365d1@citrix.com>
Date: Fri, 6 Mar 2020 14:31:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3c71c89f-28be-7752-b768-7d696fea0460@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Backports to 4.13
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDMvMjAyMCAxNDoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYuMDMuMjAyMCAx
NDo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlIGZvcm1lciBpcyBwcmV0dHkgdXNlbGVz
cyB3aXRob3V0IHRoZSBvdGhlciB0d28sIGJlY2F1c2UgeW91J3JlCj4+IHRha2luZyBvdXQgdGhl
IHNlY3VyaXR5IGZlYXR1cmUgd2l0aG91dCBnYWluaW5nIHRoZSBtYWpvcml0eSBwZXJmb3JtYW5j
ZQo+PiB3aW4gZnJvbSBhdm9pZGluZyBWTWV4aXRzIGR1ZSB0byBDUjQgdHJhcHMuCj4gLi4uIEkn
bSB1bmNvbnZpbmNlZCBvZiB0aGlzIC0gYXZvaWRpbmcgU01FUC9TTUFQIGFsb25lIGFscmVhZHkK
PiBlbGltaW5hdGVzIGEgbnVtYmVyIG9mIENSNCB3cml0ZXMgYWZhaWN0LgoKRGlmZmVyaW5nIHNj
ZW5hcmlvcyAoU01FUC9TTUFQIG9ubHkgbWFrZXMgYSBwZXJmIGRpZmZlcmVuY2UgaW4gcHJhY3Rp
Y2UKMzJiaXQgUFYtc2hpbSdkIGd1ZXN0cyksIGJ1dCBJU1RSIHRoZSBUTEIgZmx1c2hpbmcgc2lk
ZSBvZiB0aGluZ3MKZG9taW5hdGluZyBpbiB0ZXJtcyBvZiBwZXJmb3JtYW5jZS4KCj4+IERlcGVu
ZGluZyBvbiB0aGUgdmlldyBvZiBvdGhlciBQViBzaGltIHVzYWJpbGl0eSBpc3N1ZXMsIDZkZDk1
YjAyZWEyNwo+PiBhbmQgZjlkZWUxZjk0NWViIHJlZ2FyZGluZyB2dHNjIG1ha2UgYSBsYXJnZSBk
aWZmZXJlbmNlIGFuZCBzaG91bGQgYmUKPj4gY29uc2lkZXJlZC4KPiBJJ3ZlIHF1ZXVlZCB0aGUg
bGF0dGVyLCBidXQgdGhlIGZvcm1lciBkb2Vzbid0IHJlYWxseSBsb29rIGxpa2UKPiBiYWNrcG9y
dGluZyBtYXRlcmlhbCB0byBtZS4KCkl0IGlzIGEgZnVuY3Rpb25hbCBwcmVyZXF1aXNpdGUuwqAg
VGhlIHN0YXRzIGluIHRoZSBmb3JtZXIgYXJlIHByb3RlY3RlZApieSB0aGUgbG9jayB3aGljaCBp
cyByZW1vdmVkIGJ5IHRoZSBsYXR0ZXIuCgpBbiBhbHRlcm5hdGl2ZSAoaW4gdGhlb3J5KSB3b3Vs
ZCBiZSB0byBjaGFuZ2UgdGhlIHN0YXRzIHRvIGF0b21pYzY0X3QncywKZXhjZXB0IHRoYXQgd2Ug
ZG9uJ3QgaGF2ZSBhbnkgb2YgdGhhdCBpbmZyYXN0cnVjdHVyZS7CoCBHaXZlbiB0aGF0IHdlCmFs
cmVhZHkgY29uc2lkZXJlZCBkZWxldGluZyB0aG9zZSBzdGF0cyBzZXZlcmFsIHllYXJzIGFnbyAo
ZHVlIHRvIGJlaW5nCm9mIGR1YmlvdXMgdXNlIHRvIGJlZ2luIHdpdGgpLCBJIHRvbGQgSWdvciBu
b3QgdG8gd2FzdGUgdGltZSB0cnlpbmcgdG8KZml4IGl0IGRpZmZlcmVudGx5LgoKPj4gMTg4ZjQ3
OWRlNGI3IGFuZCAwMDVkZTQ1Yzg4N2UgYXJlIGJvdGggY29yZSBzY2hlZHVsaW5nIGJ1Z2ZpeGVz
IGFuZAo+PiBzaG91bGQgYmUgY29uc2lkZXJlZCwgZXZlbiBpZiB0aGV5IGFyZSBhIGxpdHRsZSB0
b28gZnJlc2ggcmlnaHQgYXQgdGhlCj4+IG1vbWVudC4KPiAiRnJlc2huZXNzIiBpcyBub3QgYW4g
aXNzdWUgaW1vLiBUaGV5J3ZlIHBhc3NlZCB0aGUgcHVzaCBnYXRlIG9uCj4gbWFzdGVyLCBhbmQg
SSB3b3VsZG4ndCBnZXQgYXJvdW5kIHRvIGFwcGx5IHRoZW0gcmlnaHQgYXdheSBhbnl3YXkuCj4g
V2l0aCB0aGVzZSBpdCdzIGp1c3QgdGhlIHR5cGljYWwgc2l0dWF0aW9uIGZvciBmZWF0dXJlcyB0
aGF0IGFyZQo+IHN0aWxsICJleHBlcmltZW50YWwiIG9yIGFsaWtlIC0gSSdtIG5ldmVyIHJlYWxs
eSBjZXJ0YWluIHdoZXRoZXIKPiBpdCdzIGJldHRlciB0byBwdWxsIGluIHN1Y2ggZml4ZXMgKGFu
ZCBoYXZlIG1vcmUgY29kZSBjaHVybikgb3IKPiB0byBsZWF2ZSB0aGVtIG91dC4gQW5kIGV4cGxp
Y2l0IHJlcXVlc3QgbGlrZSB0aGlzIG9uZSBvZiB5b3Vycwo+IGhlbHBzIHRha2UgYSBkZWNpc2lv
bi4KCkluIHRoaXMgY2FzZSwgdGhleSBhcmUgY29uY3JldGUgYnVnZml4ZXMgd2hpY2ggd2VyZSBk
aXNjb3ZlcmVkLCBhbmQKY29uZmlybWVkIGZpeGVkLCBieSBYZW5TZXJ2ZXJzIHRlc3Rpbmcgb24g
YSA0LjEzIGJhc2UuCgpNeSBtYWluIHB1cnBvc2UgaW4gaGlnaGxpZ2h0aW5nIHRoZW0gaXMgc2lt
cGx5IHRoYXQgdGhleSBkb24ndCBnZXQKbWlzc2VkIGZvciA0LjEzLjEuwqAgQWZ0ZXIgYWxsLCB0
aGVyZSBhcmUgc3RpbGwgb3RoZXIgYmxvY2tpbmcgYnVncyB3aXRoCmNvcmUgc2NoZWR1bGluZyBl
dmVuIG9uIHN0YWdpbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
