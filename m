Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BCE127D37
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:37:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJN0-0006IH-7Z; Fri, 20 Dec 2019 14:35:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiJMz-0006IC-5G
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:35:09 +0000
X-Inumbo-ID: e69729be-2335-11ea-a914-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e69729be-2335-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 14:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576852500;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=X5JuWZStGMUJ2J8ACt59xVVlbwLXSG5rmvY4tyADczo=;
 b=EjWubkj2LC81gLE7HutOve1DxL2IWEehQg8KwXrimrhjacLQE1f6hjeU
 MQ8lFPbBU81OS7Kd3UcwI7XvrRKzvmzInU9cBx0xwJZ/FikHcX9r38PkY
 3t0Msa3XnKaPKGAthrBFPUPoGxvJYhiRTXPxfnPZqi7mfKFf7qSU2Iy08 0=;
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
IronPort-SDR: PyoCaycRvvOS834M3toLrOPuA2GPOt3aRserUaixLu0zi5k4OPh7ZGFRjjQSuuaOdDd9LWqdDQ
 TrUIACkRoXyD3DYmRTrGuqNB6xwjM8JbHUZGlPu38792sOc1Ozjsz2lr4uw9V2E1D4V6tekJWN
 8xjJGH4Og/agrgV488YTHZFtxIQK2oWJvd2opKI6VgI22pUFgGj3jVAZCf3AE/bvaHvU2rRmGc
 nk7MmC7fwfF6L3FGLAIgYVRbClpTR+vPJM2x3ud8mL4KO53om7IV+VC489Vx9ZX3nZS+7K2PNa
 +44=
X-SBRS: 2.7
X-MesageID: 9979938
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; 
   d="scan'208";a="9979938"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <20efd995-9346-4b0c-f927-ad1152f6ccfe@suse.com>
 <bf3209e7-864d-bcb2-3bce-f051b7764952@suse.com>
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
Message-ID: <8388f55a-d1d7-6ddd-04ea-405f7f0f7260@citrix.com>
Date: Fri, 20 Dec 2019 14:34:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bf3209e7-864d-bcb2-3bce-f051b7764952@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/6] x86/IRQ: re-use legacy vector ranges on
 APs
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTIvMjAxOSAxMzozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGxlZ2FjeSB2ZWN0
b3JzIGhhdmUgYmVlbiBhY3RpdmVseSB1c2VkIG9uIENQVSAwIG9ubHkuIENQVXMgbm90Cj4gc2hh
cmluZyB2ZWN0b3Igc3BhY2Ugd2l0aCBDUFUgMCBjYW4gZWFzaWx5IHJlLXVzZSB0aGVtLCBzbGln
aHRseQo+IGluY3JlYXNpbmcgdGhlIHJlbGF0aXZlbHkgc2NhcmNlIHJlc291cmNlIG9mIHRvdGFs
IHZlY3RvcnMgYXZhaWxhYmxlIGluCj4gdGhlIHN5c3RlbS4KCkkgc3VwcG9zZSB0aGlzIHRlY2hu
aWNhbGx5IGRlcGVuZHMgb24gRXh0SU5UIG1lc3NhZ2VzIG5ldmVyIHRhcmdldGluZwpDUFVzIG90
aGVyIHRoYW4gMC4KCkVpdGhlciB3YXkgLSBJIHRoaW5rIGl0cyBmaW5lIHJlc3RyaWN0aW9uIHRv
IHJlbHkgb24uCgo+ICBBcyBhIHJlc3VsdCB0aGUgbGVnYWN5IHZlY3RvciByYW5nZSBzaW1wbHkg
YmVjb21lcyBhCj4gc3ViLXJhbmdlIG9mIHRoZSBkeW5hbWljIG9uZSwgd2l0aCBhbiBleHRyYSBj
aGVjayBwZXJmb3JtZWQgaW4KPiBfYXNzaWduX2lycV92ZWN0b3IoKSAod2UgY2FuJ3QgcmVseSBv
biB0aGUKPiAicGVyX2NwdSh2ZWN0b3JfaXJxLCBuZXdfY3B1KVt2ZWN0b3JdID49IDAiIGNoZWNr
IGluIHRoZSBzdWJzZXF1ZW50Cj4gbG9vcCwgYXMgd2UgbmVlZCB0byBhbHNvIGV4Y2x1ZGUgdmVj
dG9ycyBvZiBkaXNhYmxlZCBsZWdhY3kgSVJRcykuCj4KPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2L2lvX2FwaWMu
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKPiBAQCAtMjM4OSw4ICsyMzg5LDcgQEAg
aW50IGlvYXBpY19ndWVzdF93cml0ZSh1bnNpZ25lZCBsb25nIHBoeQo+ICAgICAgfQo+ICAKPiAg
ICAgIGlmICggZGVzYy0+YXJjaC52ZWN0b3IgPD0gMCB8fCBkZXNjLT5hcmNoLnZlY3RvciA+IExB
U1RfRFlOQU1JQ19WRUNUT1IgfHwKPiAtICAgICAgICAgKGRlc2MtPmFyY2gudmVjdG9yID49IEZJ
UlNUX0xFR0FDWV9WRUNUT1IgJiYKPiAtICAgICAgICAgIGRlc2MtPmFyY2gudmVjdG9yIDw9IExB
U1RfTEVHQUNZX1ZFQ1RPUikgKQo+ICsgICAgICAgICBkZXNjLT5oYW5kbGVyLT5lbmFibGUgPT0g
ZW5hYmxlXzgyNTlBX2lycSApCj4gICAgICB7Cj4gICAgICAgICAgaW50IHZlY3RvciA9IGRlc2Mt
PmFyY2gudmVjdG9yOwo+ICAKPiBAQCAtMjYxNyw3ICsyNjE2LDcgQEAgdm9pZCBfX2luaXQgaW5p
dF9pb2FwaWNfbWFwcGluZ3Modm9pZCkKPiAgCj4gICAgICBpZiAoIG5yX2lycXMgPT0gMCApCj4g
ICAgICAgICAgbnJfaXJxcyA9IGNwdV9oYXNfYXBpYyA/CgpXZSBzaG91bGQgc3RyaXAgdGhlICFj
cHVfaGFzX2FwaWMgcGF0aHMgYmVjYXVzZSB0aGV5IGFyZSBvYnNvbGV0ZSBpbgo2NGJpdCBwcm9j
ZXNzb3JzLsKgIEkgZ3Vlc3MgdGhpcyBjYW4gd2FpdCBmb3IgYSBmdXR1cmUgY2xlYW51cCBzZXJp
ZXMuCgo+IC0gICAgICAgICAgICAgICAgICBtYXgoMTZVICsgbnVtX3ByZXNlbnRfY3B1cygpICog
TlJfRFlOQU1JQ19WRUNUT1JTLAo+ICsgICAgICAgICAgICAgICAgICBtYXgoMFUgKyBudW1fcHJl
c2VudF9jcHVzKCkgKiBOUl9EWU5BTUlDX1ZFQ1RPUlMsCgpudW1fcHJlc2VudF9jcHVzKCkgcmVh
bGx5IGNhbid0IGJlIG5lZ2F0aXZlLsKgIE5laXRoZXIgY2FuCmNwdW1hc2tfd2VpZ2h0KCkuwqAg
V2l0aCBhIGJpdCBvZiBBUEkgY2xlYW51cCwgdGhpcyAwVSBjYXN0IGNhbiBiZSBkcm9wcGVkLgoK
SG93ZXZlciwgZ2l2ZW4gdGhpcyBpcyB0aGUgb25seSBjb25jZXJuZWQsIEFja2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyCjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
