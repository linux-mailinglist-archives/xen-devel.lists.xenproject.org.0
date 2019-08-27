Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABA9F199
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 19:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2fGI-0000S2-Bb; Tue, 27 Aug 2019 17:28:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssFz=WX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2fGG-0000Rx-5i
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 17:28:04 +0000
X-Inumbo-ID: 05e4e7ac-c8f0-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e4e7ac-c8f0-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566926884;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=W51q10lpt4v7irTg/vMRAnK6XK1BajydfBB54AtyVgI=;
 b=gh8i/6P344k14A0hHGvw8j/e+V263yaAm4L93+54m6tVxHIeAW6ufzcl
 wIdyJ5QgLqn2rU7L49oZHsJ3CPUouz+FarnDs7NbS16M/E9dp+CwfOpJM
 8tRgVNzfdqq+G+38GEUxnBc6Qqg5EOxJo5lnmu/G7Qfr3MB3OIKiSbUn+ A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GyL7bRA7Dt0JS/yb4oOI1Flywf3Kn2prKc2ftE8smgqLv1dT12tfOmcEABkBcCiD7VmWkkzjGW
 Z4EGd5Z9/NiJkj61p3KS7D0+YmBp5Y96m0cNqBc5CaLxDwQRsb3ynjZ7CLgbMrA/9P+GBgFuWx
 cC5Sf9GkcZiqttx2ASRZxFIAzfob6Pf1Vz0KLcjKcm2U0ush8RdAT8pgmW6XYELr654PlvP/+i
 ZWjjKWSOLgp9d2gqvVhAbIl3Y3t9pavogo9uo/Xt/cyPmBRD0pn4QDGeXE0zoDh25ZnBCpbD+C
 isI=
X-SBRS: 2.7
X-MesageID: 4774433
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,438,1559534400"; 
   d="scan'208";a="4774433"
To: Jan Beulich <jbeulich@suse.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <61bcef1a-aa70-067f-b2a4-06580b00fe40@suse.com>
 <596e6cf6-ced2-1993-a7ff-7e865126730f@citrix.com>
 <965b2135-26b3-99d1-d5ea-9e8c69201ba7@suse.com>
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
Message-ID: <89dc51a4-4db5-cd91-0d4a-4cf73eb0f80f@citrix.com>
Date: Tue, 27 Aug 2019 18:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <965b2135-26b3-99d1-d5ea-9e8c69201ba7@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/6] x86emul: support INVPCID
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDgvMjAxOSAxNjo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDguMjAxOSAx
NzozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMDcvMjAxOSAxMjo1NywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxh
dGUuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPj4+
IEBAIC05MTI0LDYgKzkxMjYsNDggQEAgeDg2X2VtdWxhdGUoCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBBU1NFUlQoIXN0YXRlLT5zaW1kX3NpemUpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4+PiDCoMKgICvCoMKgwqAgY2FzZSBYODZFTVVMX09QQ182NigweDBmMzgsIDB4ODIp
OiAvKiBpbnZwY2lkIHJlZyxtMTI4ICovCj4+PiArwqDCoMKgwqDCoMKgwqAgdmNwdV9tdXN0X2hh
dmUoaW52cGNpZCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGVh
LnR5cGUgIT0gT1BfTUVNLCBFWENfVUQpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdlbmVyYXRlX2V4
Y2VwdGlvbl9pZighbW9kZV9yaW5nMCgpLCBFWENfR1AsIDApOwo+Pj4gKwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmICggKHJjID0gb3BzLT5yZWFkKGVhLm1lbS5zZWcsIGVhLm1lbS5vZmYsIG1tdmFs
cCwgMTYsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY3R4dCkpICE9IFg4NkVNVUxfT0tBWSApCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGRvbmU7Cj4+Cj4+IFRoZSBhY3R1YWwgYmVoYXZpb3VyIGluIGhhcmR3YXJl
IGlzIHRvIG5vdCBldmVuIHJlYWQgdGhlIG1lbW9yeSBvcGVyYW5kCj4+IGlmIGl0IGlzIHVudXNl
ZC7CoCBZb3UgY2FuIGRlbW9uc3RyYXRlIHRoaXMgYnkgZG9pbmcgYW4gQUxMX0lOQ19HTE9CQUwK
Pj4gZmx1c2ggd2l0aCBhIG5vbi1jYW5vbmljYWwgbWVtb3J5IG9wZXJhbmQuCj4KPiBPaCwgdGhh
dCdzIHNvcnQgb2YgdW5leHBlY3RlZC4KCkl0IG1ha2VzIHNlbnNlIGFzIGFuIG9wdGltaXNhdGlv
bi7CoCBUaGVyZSBpcyBubyBwb2ludCBmZXRjaGluZyBhIG1lbW9yeQpvcGVyYW5kIGlmIHlvdSdy
ZSBub3QgZ29pbmcgdG8gdXNlIGl0LgoKRnVydGhlcm1vcmUsIGl0IGFsbW9zdCBjZXJ0YWlubHkg
cmVkdWNlcyB0aGUgbWljcm9jb2RlIGNvbXBsZXhpdHkuCgo+Cj4+IMKgIEluIHBhcnRpY3VsYXIs
IEkgd2FzCj4+IGludGVuZGluZyB0byB1c2UgdGhpcyBiZWhhdmlvdXIgdG8gc3BlZWQgdXAgaGFu
ZGxpbmcgb2YgSU5We0VQVCxWUElEfQo+PiB3aGljaCB0cmFwIHVuY29uZGl0aW9uYWxseS4KPgo+
IFdoaWNoIHdvdWxkIHJlcXVpcmUgdGhlIG9ic2VydmVkIGJlaGF2aW9yIHRvIGFsc28gYmUgdGhl
IFNETQo+IG1hbmRhdGVkIG9uZSwgd291bGRuJ3QgaXQ/CgpJZiB5b3UgcmVjYWxsLCB3ZSBkaXNj
dXNzZWQgdGhpcyB3aXRoIEp1biBpbiBCdWRhcGVzdC7CoCBIaXMgb3BpbmlvbiB3YXMKbm8gaW5z
dHJ1Y3Rpb25zIGdvIG91dCBvZiB0aGVpciB3YXkgdG8gY2hlY2sgcHJvcGVydGllcyB3aGljaCBk
b24ndAptYXR0ZXIgLSBpdCBpcyBqdXN0IHRoYXQgaXQgaXMgZmFyIG1vcmUgb2J2aW91cyB3aXRo
IGluc3RydWN0aW9ucyBsaWtlCnRoZXNlIHdoZXJlIHRoZSBjb21wbGV4aXR5IGlzIG11Y2ggZ3Jl
YXRlci4KCk5vIHByb2R1Y3Rpb24gc3lzdGVtcyBhcmUgZ29pbmcgdG8gcmVseSBvbiBnZXR0aW5n
IGZhdWx0cywgYmVjYXVzZQp0YWtpbmcgYSBmYXVsdCBkb2Vzbid0IHByb2R1Y2UgdXNlZnVsIHdv
cmsuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
