Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB422A0C3C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 23:16:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i35EA-0007v1-FN; Wed, 28 Aug 2019 21:11:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+/MF=WY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i35E9-0007uw-JK
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 21:11:37 +0000
X-Inumbo-ID: 6b32cdde-c9d8-11e9-b95f-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b32cdde-c9d8-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 21:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567026696;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=C0nsVWJcjRRrtKuExD59fz81IQEXhiLpzozMW5J/DNA=;
 b=EXvKbC4oyvT4uNysxDnbQyXdy7lT0A09/siHsetqqj11uhO7HT5Wz63G
 xYNlJ9hQiOvwzDsveopaRHI6cnU4x238k5EcA//i/mzZd7HQgeHn0MlkO
 IN7DJ6N9ZgGVp1sqlJTb5Pq8d9bvq0zIOY5vI3A4gM4TcapigZ4cBKrzI k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: b5kK8GXmKfsDI21lExkwUPo2mU+Pe7C7bQsq65FP3IFnaI6CcOUvmQf4kANP5mph3j3sG2JcET
 VYKN518GTH1BNOCFE51YfQLi03JLtcHZFx8rgH1ouDzANP1V1sSegWZ1ch8aFFMW9W5TVdPvVl
 ScxzoS7Pl6x9qEO+VKCu7gmkZiIbKNsK1b02lymls4tPR37bhmuQ6+N1UT15IkS1YtPAywnKu1
 zevWDKFZT/2EMo7kx8ckfp0mWtb9reHn46s+COfqR6TM8WIv6aCEbLm8hYbAn36aSvoHWi+02A
 zrM=
X-SBRS: 2.7
X-MesageID: 5074931
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5074931"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <CABfawhm+eu2ebwdou3btLJxcxBbq+uCHNxf82zahxp8dcsoDEQ@mail.gmail.com>
 <8c7ba37a-7fd0-4901-fd5b-4d04e02d63fc@suse.com>
 <CABfawhkHm89cqMu5m-6SiLU-r8m4kFXcTMAH_3cFfvRQCUDBug@mail.gmail.com>
 <43f75b07-0e2d-1c71-1a98-d3e875e09b82@suse.com>
 <CABfawhnc6-h_KAS62k08P0L98Q1ZCAm4AM7U_pJKdDVGnhH=MQ@mail.gmail.com>
 <50340e5f-32ab-f856-d1ec-5ed50a59e1ca@citrix.com>
 <CABfawhngYn69x3yERpVSWPdhEcR+W4Yb6Y20M1pGtKb=eA6LBQ@mail.gmail.com>
 <b4bd1a12-c156-4f1f-734c-5c3bb9c6cd42@citrix.com>
 <CABfawh=BinwvgnUh9q6YXct3NbwJ5Ur2zV4qzoOnaxwgyRqO=Q@mail.gmail.com>
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
Message-ID: <35bf59fb-f255-370c-7afd-ce5851b6fa02@citrix.com>
Date: Wed, 28 Aug 2019 22:11:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=BinwvgnUh9q6YXct3NbwJ5Ur2zV4qzoOnaxwgyRqO=Q@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Question about xenpage_list
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDgvMjAxOSAxODozNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgQXVn
IDI4LCAyMDE5IGF0IDExOjE2IEFNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI4LzA4LzIwMTkgMTg6MDcsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5IGF0IDEwOjU1IEFNIEFuZHJldyBDb29wZXIK
Pj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+PiBPbiAyOC8wOC8yMDE5
IDE3OjI1LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+Pj4+IE9uIFdlZCwgQXVnIDI4LCAyMDE5
IGF0IDk6NTQgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+
IE9uIDI4LjA4LjIwMTkgMTc6NTEsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+PiBPbiBX
ZWQsIEF1ZyAyOCwgMjAxOSBhdCA5OjM1IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4gd3JvdGU6Cj4+Pj4+Pj4+IE9uIDI4LjA4LjIwMTkgMTc6MjgsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+Pj4+Pj4+IEhpIGFsbCwKPj4+Pj4+Pj4+IEknbSB0cnlpbmcgdG8gdHJhY2sgZG93
biBob3cgYSBjYWxsIGluIGNvbW1vbi9ncmFudF90YWJsZS5jIHRvCj4+Pj4+Pj4+PiBzaGFyZV94
ZW5fcGFnZV93aXRoX2d1ZXN0IHdpbGwgYWN0dWFsbHkgcG9wdWxhdGUgdGhhdCBwYWdlIGludG8g
dGhlCj4+Pj4+Pj4+PiBndWVzdCdzIHBoeXNtYXAuCj4+Pj4gc2hhcmVfeGVuX3BhZ2Vfd2l0aF9n
dWVzdCgpIGlzIHBlcmhhcHMgcG9vcmx5IG5hbWVkLiAgSXQgbWFrZXMgdGhlIHBhZ2UKPj4+PiBh
YmxlIHRvIGJlIGluc2VydGVkIGludG8gdGhlIGd1ZXN0cyBwMm0uCj4+Pj4KPj4+PiBJdCBpcyBp
bnRlcm5hbCBhY2NvdW50aW5nLCBzbyB0aGF0IHRoZSBwZXJtaXNzaW9uIGNoZWNrcyBpbiBhIHN1
YnNlcXVlbnQKPj4+PiBhZGRfdG9fcGh5c21hcCgpIGNhbGwgd2lsbCBwYXNzLgo+Pj4+Cj4+Pj4g
UGVyaGFwcyBpdCBzaG91bGQgYmUgbmFtZWQgImFsbG93X2d1ZXN0X2FjY2Vzc190b19mcmFtZSgp
IiBvciBzaW1pbGFyLgo+Pj4+Cj4+Pj4+Pj4+PiAgSW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIGNhbGwg
dGhlIHBhZ2UgZG9lc24ndCBzZWVtIHRvCj4+Pj4+Pj4+PiBiZSBwcmVzZW50IGluIHRoZSBwaHlz
bWFwLCBhcyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0IHdpbGwganVzdCBhZGQKPj4+Pj4+Pj4+
IHRoZSBwYWdlIHRvIHRoZSBkb21haW4ncyB4ZW5wYWdlX2xpc3QgbGlua2VkLWxpc3Q6Cj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1mbjsKPj4+Pj4+Pj4+ICAgICAg
ICAgdW5zaWduZWQgbG9uZyBnZm47Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gICAgICAgICBzaGFyZV94
ZW5fcGFnZV93aXRoX2d1ZXN0KHZpcnRfdG9fcGFnZShndC0+c2hhcmVkX3Jhd1tpXSksIGQsIFNI
QVJFX3J3KTsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAgICAgICAgIG1mbiA9IHZpcnRfdG9fbWZuKGd0
LT5zaGFyZWRfcmF3W2ldKTsKPj4+Pj4+Pj4+ICAgICAgICAgZ2ZuID0gbWZuX3RvX2dtZm4oZCwg
bWZuKTsKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAi
U2hhcmluZyAlbHggLT4gJWx4IHdpdGggZG9tYWluICV1XG4iLAo+Pj4+Pj4+Pj4gZ2ZuLCBtZm4s
IGQtPmRvbWFpbl9pZCk7Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhpcyByZXN1bHRzIGluIHRoZSBm
b2xsb3dpbmc6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gKFhFTikgZ3JhbnRfdGFibGUuYzoxODIwOmQw
djAgU2hhcmluZyBmZmZmZmZmZmZmZmZmZmZmIC0+IDQyYzcxZSB3aXRoIGRvbWFpbiAxCj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gQUZBSUNUIHRoZSBwYWdlIG9ubHkgZ2V0cyBwb3B1bGF0ZWQgaW50byB0
aGUgcGh5c21hcCBvbmNlIHRoZSBkb21haW4KPj4+Pj4+Pj4+IGdldHMgdW5wYXVzZWQuIElmIEkg
bGV0IHRoZSBkb21haW4gcnVuIGFuZCB0aGVuIHBhdXNlIGl0IEkgY2FuIHNlZQo+Pj4+Pj4+Pj4g
dGhhdCB0aGUgcGFnZSBpcyBpbiB0aGUgZ3Vlc3QncyBwaHlzbWFwIChieSBsb29waW5nIHRocm91
Z2ggYWxsIHRoZQo+Pj4+Pj4+Pj4gZW50cmllcyBpbiBpdHMgRVBUKToKPj4+Pj4+Pj4+Cj4+Pj4+
Pj4+PiAoWEVOKSBtZW1fc2hhcmluZy5jOjE2MzY6ZDB2MCAweGYyMDAwIC0+IDB4NDJjNzFlIGlz
IGEgZ3JhbnQgbWFwcGluZwo+Pj4+Pj4+Pj4gc2hhcmVkIHdpdGggdGhlIGd1ZXN0Cj4+Pj4+Pj4+
IFRoaXMgc2hvdWxkIGJlIHRoZSByZXN1bHQgb2YgdGhlIGRvbWFpbiBoYXZpbmcgbWFkZSBhIHJl
c3BlY3RpdmUKPj4+Pj4+Pj4gWEVOTUFQU1BBQ0VfZ3JhbnRfdGFibGUgcmVxdWVzdCwgc2hvdWxk
bid0IGl0Pwo+Pj4+Pj4+Pgo+Pj4+Pj4+IERvIHlvdSBtZWFuIHRoZSBndWVzdCBpdHNlbGYgb3Ig
dGhlIHRvb2xzdGFjaz8KPj4+Pj4+IFRoZSBndWVzdCBpdHNlbGYgLSBob3cgd291bGQgdGhlIHRv
b2wgc3RhY2sga25vdyB3aGVyZSB0byBwdXQgdGhlCj4+Pj4+PiBmcmFtZShzKT8KPj4+Pj4gSSBk
b24ndCB0aGluayB0aGF0IG1ha2VzIHNlbnNlLiBIb3cgd291bGQgYSBndWVzdCBpdHNlbGYgbm93
IHRoYXQgaXQKPj4+Pj4gbmVlZHMgdG8gbWFwIHRoYXQgZnJhbWU/IFdoZW4geW91IHJlc3RvcmUg
dGhlIFZNIGZyb20gYSBzYXZlZmlsZSwgaXQKPj4+Pj4gaXMgYWxyZWFkeSBydW5uaW5nIGFuZCBu
byBmaXJtd2FyZSBpcyBnb2luZyB0byBydW4gaW4gaXQgdG8gaW5pdGlhbGl6ZQo+Pj4+PiBzdWNo
IEdGTnMuCj4+Pj4+Cj4+Pj4+IEFzIGZvciB0aGUgdG9vbHN0YWNrLCBJIHNlZSBjYWxscyB0byB4
Y19kb21fZ250dGFiX3NlZWQgZnJvbSB0aGUKPj4+Pj4gdG9vbHN0YWNrIGR1cmluZyBkb21haW4g
Y3JlYXRpb24gKGJlIGl0IGEgbmV3IGRvbWFpbiBvciBvbmUgYmVpbmcKPj4+Pj4gcmVzdG9yZWQg
ZnJvbSBhIHNhdmUgZmlsZSkgd2hpY2ggZG9lcyBpc3N1ZSBhIFhFTk1FTV9hZGRfdG9fcGh5c21h
cAo+Pj4+PiB3aXRoIHRoZSBzcGFjZSBiZWluZyBzcGVjaWZpZWQgYXMgWEVOTUFQU1BBQ0VfZ3Jh
bnRfdGFibGUuIExvb2tzIGxpa2UKPj4+Pj4gaXQgZ2F0aGVycyB0aGUgR0ZOIHZpYSB4Y19jb3Jl
X2FyY2hfZ2V0X3NjcmF0Y2hfZ3Bmbi4gU28gaXQgbG9va3MgbGlrZQo+Pj4+PiB0aGF0J3MgaG93
IGl0cyBkb25lLgo+Pj4+IE9uIGRvbWFpbiBjcmVhdGlvbiwgdGhlIHRvb2xzdGFjayBuZWVkcyB0
byB3cml0ZSB0aGUgc3RvcmUvY29uc29sZSBncmFudAo+Pj4+IGVudHJ5Lgo+Pj4+Cj4+Pj4gSWYg
WEVOTUVNX2FjcXVpcmVfcmVzb3VyY2UgaXMgYXZhaWxhYmxlIGFuZCB1c2FibGUgKG5lZWRzIG5l
d2lzaCBYZW4gYW5kCj4+Pj4gZG9tMCBrZXJuZWwpLCB0aGVuIHRoYXQgbWV0aG9kIGlzIHByZWZl
cnJlZC4gIFRoaXMgbGV0cyB0aGUgdG9vbHN0YWNrCj4+Pj4gbWFwIHRoZSBncmFudCB0YWJsZSBm
cmFtZSBkaXJlY3RseSwgd2l0aG91dCBpbnNlcnRpbmcgaXQgaW50byB0aGUgZ3Vlc3RzCj4+Pj4g
cDJtIGZpcnN0Lgo+Pj4+Cj4+Pj4gVGhlIGZhbGxiYWNrIHBhdGggaXMgdG8gcGljayBhIGZyZWUg
cGZuLCBpbnNlcnQgaXQgaW50byB0aGUgZ3Vlc3QKPj4+PiBwaHlzbWFwLCBmb3JlaWduIG1hcCBp
dCwgd3JpdGUgdGhlIGVudHJpZXMsIHVubWFwIGFuZCByZW1vdmUgZnJvbSB0aGUKPj4+PiBndWVz
dCBwaHlzbWFwLiAgVGhpcyBoYXMgdmFyaW91cyBwb29yIHByb3BlcnRpZXMgbGlrZSBzaGF0dGVy
aW5nCj4+Pj4gc3VwZXJwYWdlcyBmb3IgdGhlIGd1ZXN0LCBhbmQgYSBnZW5lcmFsIGluYWJpbGl0
eSB0byBmdW5jdGlvbiBjb3JyZWN0bHkKPj4+PiBvbmNlIHRoZSBndWVzdCBoYXMgc3RhcnRlZCBl
eGVjdXRpbmcgYW5kIGhhcyBhIGJhbGxvb24gZHJpdmVyIGluIHBsYWNlLgo+Pj4+Cj4+Pj4gQXQg
YSBsYXRlciBwb2ludCwgb25jZSB0aGUgZ3Vlc3Qgc3RhcnRzIGV4ZWN1dGluZywgYSBncmFudC10
YWJsZSBhd2FyZQo+Pj4+IHBhcnQgb2YgdGhlIGtlcm5lbCBvdWdodCB0byBtYXAgdGhlIGdyYW50
IHRhYmxlIGF0IHRoZSBrZXJuZWxzIHByZWZlcnJlZAo+Pj4+IGxvY2F0aW9uIGFuZCBrZWVwIGl0
IHRoZXJlIHBlcm1hbmVudGx5Lgo+Pj4+Cj4+PiBPSywgbWFrZXMgc2Vuc2UsIGJ1dCB3aGVuIHRo
ZSBndWVzdCBpcyBiZWluZyByZXN0b3JlZCBmcm9tIGEgc2F2ZWZpbGUsCj4+PiBob3cgZG9lcyBp
dCBrbm93IHRoYXQgaXQgbmVlZHMgdG8gZG8gdGhhdCBtYXBwaW5nIGFnYWluPyBUaGF0IGZyYW1l
IGlzCj4+PiBiZWluZyByZS1jcmVhdGVkIGR1cmluZyByZXN0b3JhdGlvbiwgc28gd2hlbiB0aGUg
Z3Vlc3Qgc3RhcnRzIHRvCj4+PiBleGVjdXRlIGFnYWluIGl0IHdvdWxkIGp1c3QgaGF2ZSBhIHdo
b2xlIHdoZXJlIHRoYXQgcGFnZSB1c2VkIHRvIGJlLgo+PiBUaGlzIGlzIHdoZXJlIHdlIGdldCB0
byB0aGUgcHJvYmxlbXMgb2YgWGVuJ3MgIm1pZ3JhdGlvbiIgbm90IGJlaW5nCj4+IHRyYW5zcGFy
ZW50LiAgQ3VycmVudGx5IGl0IGlzIHRoZSByZXF1aXJlbWVudCBvZiB0aGUgZ3Vlc3Qga2VybmVs
IHRvCj4+IHJlbWFwIHRoZSBncmFudCB0YWJsZSBvbiByZXN1bWUuCj4+Cj4+IFRoaXMgaXMgYSBy
ZWFzb25hYmxlIHJlcXVpcmVtZW50IGZvciBQViBndWVzdHMuICBCZWNhdXNlIFBWIGd1ZXN0Cj4+
IGtlcm5lbHMgbWFpbnRhaW4gdGhlaXIgb3duIFAyTSwgaXQgaXMgaW1wb3NzaWJsZSB0byBtaWdy
YXRlIHRyYW5zcGFyZW50bHkuCj4+Cj4+IFRoaXMgc2hvdWxkIG5ldmVyIGhhdmUgbWFkZSBpdCBp
bnRvIHRoZSBIVk0gQUJJLCBidXQgaXQgZGlkIGFuZCB3ZSdyZSBhCj4+IGRlY2FkZSB0b28gbGF0
ZSwgYW5kIG9ubHkganVzdCBzdGFydGluZyB0byBwaWNrIHVwIHRoZSBwaWVjZXMuCj4+Cj4+IEkg
cHJlc3VtZSB5b3UncmUgZG9pbmcgc29tZSBwYWdpbmcgd29yayBoZXJlLCBhbmQgYXJlIGxvZ2lj
YWxseQo+PiByZXN0b3JpbmcgYSBndWVzdCB3aXRob3V0IGl0cyBrbm93bGVkZ2U/Cj4+Cj4gQ29y
cmVjdCwgSSdtIGNyZWF0aW5nIGEgVk0gYnkgcG9wdWxhdGluZyBpdHMgcGh5c21hcCB3aXRoIG1l
bV9zaGFyZWQKPiBlbnRyaWVzIGZyb20gYW5vdGhlciBkb21haW4gdGhhdCdzIHBhdXNlZCBieSBs
b29waW5nIHRocm91Z2ggYWxsIHBhZ2VzCj4gYW5kIG1lbXNoYXJpbmcgdGhlbS4gUGFnZXMgdGhh
dCBhcmUgbm90IHNoYXJhYmxlIEkgbWFudWFsbHkgYWxsb2NhdGUKPiBuZXcgcGFnZXMgZm9yIGFu
ZCBjb3B5IHRoZW0gb3ZlciAob3Igc2ltcGx5IHBsdWcgdGhlIEdGTiBpbiB3aXRoCj4gSU5WQUxJ
RF9NRk4gaWYgdGhlIHR5cGUgaXMgc3VjaCB0aGF0IGl0IGFsbG93cyB0aGF0KS4gQ3VycmVudGx5
IHRoaXMKPiB3b3JrcyBmaW5lIHdoZW4gdGhlIGRvbWFpbiBJJ20gcG9wdWxhdGluZyBmcm9tIHdh
cyBqdXN0IHJlc3RvcmVkIGZyb20KPiBhIHNhdmVmaWxlLCBpbmNsdWRpbmcgbGF1bmNoaW5nIHRo
ZSB0b29sc3RhY2sgZm9yIHRoZSBuZXcgZG9tYWluIGFuZAo+IGludGVyYWN0aW5nIHdpdGggaXRz
IFZOQy9uZXR3b3JrL2V0Yy4gQnV0IEknbSBydW5uaW5nIGludG8gdHJvdWJsZQo+IHdoZW4gdGhl
IGRvbWFpbiBJJ20gY29weWluZyBmcm9tIHdhcyB1bnBhdXNlZCBiZWZvcmUgdGhpcyBzaGFyaW5n
IGlzCj4gdGFraW5nIHBsYWNlLiBFdmlkZW50bHkgdW5wYXVzaW5nIHRoZSBkb21haW4gaW50cm9k
dWNlcyBkaXNjcmVwYW5jaWVzCj4gaW4gaXRzIG1lbW9yeSBzcGFjZSBhcyBjb21wYXJlZCB0byB3
aGVuIGl0cyBqdXN0IHJlc3RvcmVkIGFuZCB0aGlzCj4gZ3JhbnQgbWFwcGluZyBpcyBvbmUgcGFn
ZSB0aGF0IHBvcHMgdXAgYXMgYmVpbmcgbWFwcGVkIGluIGJ1dCBpdCdzCj4gdW5zaGFyYWJsZSBz
aW5jZSBpdCdzIGEgUEdDX3hlbl9oZWFwIHBhZ2UuIFRoZSBuZXcgZG9tYWluIGRvZXMgaGF2ZQo+
IHRoZSBwYWdlIGFsbG9jYXRlZCBhbHJlYWR5IGJ1dCBpdCBkb2Vzbid0IGhhdmUgYSBHRk4geWV0
LCBzbyBJIGNhbid0Cj4gY29weSBpdHMgY29udGVudCBvdmVyIHNpbmNlIEkgaGF2ZSBubyB3YXkg
dG8gZW5zdXJlIHRoYXQgTUZOIHdpbGwgYmUKPiB1c2VkIGZvciB0aGUgc2FtZSBHRk4uIFRoZXJl
IGFyZSBvdGhlciBwYWdlcyB0aGF0IGFsc28gcG9wIHVwIGFzIG5vdwo+IG5vdCBiZWluZyBzaGFy
ZWQsIGJ1dCBzZWVtcyBsaWtlIHJ1bm5pbmcgYSBkb21haW5fc29mdF9yZXNldCBvbiB0aGUKPiBk
b21haW4gbWFrZXMgdGhlbSBnbyBhd2F5IChyZXNldHRpbmcgZXZlbnQgY2hhbm5lbHMgaW4gcGFy
dGljdWxhcikuIFNvCj4gYW55d2F5LCBJJ20gaGF2aW5nIGEgaGFyZCB0aW1lIGZpZ3VyaW5nIG91
dCB3aGF0IGNoYW5nZXMgYXJlIG1hZGUgdG8KPiB0aGUgZG9tYWluIGFmdGVyIGl0IGlzIHVucGF1
c2VkLCBhcyBJIG5lZWQgdG8gcmV2ZXJ0IHRoZW0gYWxsIHRvIG1ha2UKPiB0aGUgZG9tYWluIGJl
IGluIHRoZSBzYW1lIHN0YXRlIGl0IHdvdWxkIGJlIHdoZW4gcmVzdG9yZWQgZnJvbSB0aGUKPiBz
YXZlZmlsZS4KCkl0cyBub3Qgc2FmZSB0byBibGluZGx5IGNvcHkgYW55IHhlbmhlYXAgcGFnZSwg
aXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIKdGhleSBhcmUgcHJlc2VudCBpbiB0aGUgcDJtIG9yIG5v
dC4KCkZvciBleGFtcGxlLCBncmFudHMgd2hpY2ggYXJlIG1hcHBlZCBpbiBwYXVzZWQgZG9tYWlu
IG5lZWQgdG8gYXBwZWFyIGFzCnVubWFwcGVkIGluIHRoZSBjbG9uZWQgZG9tYWluLCBvciBYZW4g
aXMgZ29pbmcgdG8gb2JqZWN0IHRvIHRoZSB0aGUKc3RhdGUgaXQgZmluZHMgdGhlIG5ldyBncmFu
dCB0YWJsZSBpbi4KCkl0IHNvdW5kcyBhcyBpZiB5b3Ugd2FudCBhbiBleHBsaWNpdGx5ICJkdXBs
aWNhdGUgeGVuaGVhcCBwYWdlcyIgc3RlcAp3aGljaCBpc24ndCBhIHN0cmFpZ2h0IGZvcndhcmQg
bWVtY3B5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
