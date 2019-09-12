Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02825B0E2D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:43:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8NTq-0003w7-78; Thu, 12 Sep 2019 11:41:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8NTp-0003vz-CD
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:41:41 +0000
X-Inumbo-ID: 490298b8-d552-11e9-b76c-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 490298b8-d552-11e9-b76c-bc764e2007e4;
 Thu, 12 Sep 2019 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568288501;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tR5TN/XxdX6VMkwCR2YJmnvuAO27nG9UlZ5FnVVWvwg=;
 b=UpZlmhY4SxHmpHetJjYApPeZJbUpn96hb+96PstStMfRXahvYTg04766
 rxL6sU8SMYHnmsfL2TLXlLX2B/9UIq6yN3DNckh3ujrRFzdBR60w3gP2a
 zP1NB+FBKMWfJg1gSfc8DoswwVHHYPsbw3736LwKFLnzCYao9icM34w6N M=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9KhF7gzjktY7UiH4bnGvGTKi7xeSwy5jZIzuJFn80hnDP168tjQoAvE5SZLNsyOh1/Va54kDHU
 sMHV5VUzeMJd+ly4gW+zmEbvNwFJfnxQj08Q5pvg6fpvm2i3i5jcvYhjtGH3ycFbPMwOihsRsd
 T9SPVztp44NQtAs/KqPgzrOVU7amxdEDkDVhVZhvAnUsk0/xGjnWnKGRipecSYzesfG3QCcfEU
 l+vqa/y1yfS3sleGq18rzs5ARAphlfqrS7w1ddBbJNREWgJkn6y6vDTdXu3jG/jwT4KBrstqbQ
 cz8=
X-SBRS: 2.7
X-MesageID: 5479271
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5479271"
To: Jan Beulich <jbeulich@suse.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-2-andrew.cooper3@citrix.com>
 <1bd690aa-bd94-48df-c9a4-c619c02fa408@suse.com>
 <170fe9e0-bdbe-94d1-cc53-cb4128b3079a@citrix.com>
 <f4464d0f-4c00-2513-46ce-cfc0c5b34448@suse.com>
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
Message-ID: <bd92c19a-f532-c88b-0c14-5f80b4b15163@citrix.com>
Date: Thu, 12 Sep 2019 12:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f4464d0f-4c00-2513-46ce-cfc0c5b34448@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/8] libx86: Introduce
 x86_cpu_policies_are_compatible()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDkvMjAxOSAwOToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMDkuMjAxOSAw
OTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDkvMjAxOSAwODo0MywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMS4wOS4yMDE5IDIyOjA0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IFRoaXMgaGVscGVyIHdpbGwgZXZlbnR1YWxseSBiZSB0aGUgY29yZSAiY2FuIGEgZ3Vl
c3QgY29uZml1cmVkIGxpa2UgdGhpcyBydW4KPj4+PiBvbiB0aGUgQ1BVPyIgbG9naWMuICBGb3Ig
bm93LCBpdCBpcyBqdXN0IGVub3VnaCBvZiBhIHN0dWIgdG8gYWxsb3cgdXMgdG8KPj4+PiByZXBs
YWNlIHRoZSBoeXBlcmNhbGwgaW50ZXJmYWNlIHdoaWxlIHJldGFpbmluZyB0aGUgcHJldmlvdXMg
YmVoYXZpb3VyLgo+Pj4+Cj4+Pj4gSXQgd2lsbCBiZSBleHBhbmRlZCBhcyB2YXJpb3VzIG90aGVy
IGJpdHMgb2YgQ1BVSUQgaGFuZGxpbmcgZ2V0IGNsZWFuZWQgdXAuCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gRnVu
ZGFtZW50YWxseQo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPj4+IGJ1dCBhIGNvdXBsZSBvZiByZW1hcmtzOgo+Pj4KPj4+IEZvciBvbmUsIGRlc3BpdGUg
YmVpbmcganVzdCB0ZXN0aW5nIGNvZGUsIEkgdGhpbmsgdGhlIHR3byB0ZXN0W10KPj4+IGFycmF5
cyBjb3VsZCBkbyB3aXRoIGNvbnN0aWZpY2F0aW9uLgo+PiBTYWRseSB0aGV5IGNhbid0LsKgIEl0
IGlzIGEgY29uc2VxdWVuY2Ugb2Ygc3RydWN0IGNwdV9wb2xpY3kgdXNpbmcKPj4gbm9uLWNvbnN0
IHBvaW50ZXJzLgo+Pgo+PiBJIHRyaWVkIGludHJvZHVjaW5nIHN0cnVjdCBjb25zdF9jcHVfcG9s
aWN5IGJ1dCB0aGF0IGlzIGV2ZW4gd29yc2UKPj4gYmVjYXVzZSBpdCBwcm9oaWJpdHMgb3BlcmF0
aW5nIG9uIHRoZSBzeXN0ZW0gcG9saWN5IG9iamVjdHMgaW4gWGVuLgo+Pgo+PiBPdmVyYWxsLCBk
cm9wcGluZyBhIGNvbnN0IGluIHRoZSB1bml0IHRlc3RzIHR1cm5lZCBvdXQgdG8gYmUgdGhlIGxl
YXN0Cj4+IGJhZCBvcHRpb24sIHVubGVzcyB5b3UgaGF2ZSBhIHJhZGljYWxseSBkaWZmZXJlbnQg
c3VnZ2VzdGlvbiB0byB0cnkuCj4+Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi94ODYv
Y3B1LXBvbGljeS5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1LXBvbGlj
eS5oCj4+Pj4gQEAgLTExLDYgKzExLDI1IEBAIHN0cnVjdCBjcHVfcG9saWN5Cj4+Pj4gICAgICBz
dHJ1Y3QgbXNyX3BvbGljeSAqbXNyOwo+Pj4+ICB9Owo+Pj4+ICAKPj4+PiArc3RydWN0IGNwdV9w
b2xpY3lfZXJyb3JzCj4+Pj4gK3sKPj4+PiArICAgIHVpbnQzMl90IGxlYWYsIHN1YmxlYWY7Cj4+
Pj4gKyAgICB1aW50MzJfdCBtc3I7Cj4+Pj4gK307Cj4+Pj4gKwo+Pj4+ICsjZGVmaW5lIElOSVRf
Q1BVX1BPTElDWV9FUlJPUlMgeyB+MHUsIH4wdSwgfjB1IH0KPj4+IEluc3RlYWQgb2YgdGhpcyAo
YW5kIHVzaW5nIGl0IGluIGV2ZXJ5IGNhbGxlciksIGNvdWxkbid0IHRoZSBmdW5jdGlvbgo+Pj4g
ZmlsbCB0aGlzIGZpcnN0IHRoaW5nPyAoVGhlIGluaXRpYWxpemVyIGlzbid0IHN0cmljdGx5IG5l
ZWRlZCBhbnl3YXksCj4+PiBhcyBjb25zdW1lcnMgYXJlIHN1cHBvc2VkIHRvIGxvb2sgYXQgdGhl
IHN0cnVjdHVyZSBvbmx5IHdoZW4gaGF2aW5nCj4+PiBnb3QgYmFjayBhbiBlcnJvciBmcm9tIHRo
ZSBmdW5jdGlvbiwgYnV0IHNpbmNlIGVycm9yIHBhdGhzIGZpbGwganVzdAo+Pj4gYSBzdWJzZXQg
b2YgdGhlIGZpZWxkcyBJIGNhbiBzZWUgaG93IHByZS1maWxsaW5nIHRoZSB3aG9sZSBzdHJ1Y3R1
cmUKPj4+IGlzIGVhc2llci4pCj4+IEF0IHRoZSBtb21lbnQsIGVycm9yIHBvaW50ZXJzIGFyZSBj
b25kaXRpb25hbGx5IHdyaXR0ZW4gb24gZXJyb3IsIHdoaWNoCj4+IG1lYW5zIHRoYXQgYWxsIGNh
bGxlcnMgcGFzc2luZyBub24tTlVMTCBuZWVkIHRvIGluaXRpYWxpc2UuCj4+Cj4+IFRoaXMgY291
bGQgYmUgYWx0ZXJlZCB0byBoYXZlIHhjX3NldF9kb21haW5fY3B1X3BvbGljeSgpIGFuZAo+PiB4
ODZfY3B1X3BvbGljaWVzX2FyZV9jb21wYXRpYmxlKCkgcHJvLWFjdGl2ZWx5IHNldCAibm8gZXJy
b3IiIHRvIGJlZ2luCj4+IHdpdGgsIGJ1dCB0aGF0IGRvZXNuJ3QgcmVtb3ZlIHRoZSBuZWVkIGZv
ciBJTklUX0NQVV9QT0xJQ1lfRVJST1JTIGluIHRoZQo+PiBmaXJzdCBwbGFjZS4KPiBSaWdodCwg
SSBkaWQgbm90aWNlIHRoaXMgaW4gYSBsYXRlciBwYXRjaC4gQnV0IHllcywgSSBkbyB0aGluawo+
IGhhdmluZyB0aGUgZnVuY3Rpb25zIHByb2FjdGl2ZWx5IGZpbGwgdGhlIHN0cnVjdHVyZXMgd291
bGQgYmUKPiBiZXR0ZXIgb3ZlcmFsbCAoYW5kIHJlbW92ZSB0aGUgbmVlZCB0byB1c2UgdGhlIGlu
aXRpYWxpemVyIGluIGF0Cj4gbGVhc3Qgc29tZSBjYXNlcywgaS5lLiB3aGVyZSB0aGVyZSBhcmUg
bm8gb3RoZXIgZWFybHkgZXJyb3IgcGF0aHMpLgoKT2suwqAgSSdsbCBzd2l0Y2ggdG8gZG9pbmcg
dGhpcywgYW5kIGhhdmUgYW5vdGhlciBwcmVwIHBhdGNoIHdoaWNoCmFkanVzdHMgdGhlIGJlaGF2
aW91ciBvZiB0aGUgYWxyZWFkeSBleGlzdGluZyBmdW5jdGlvbnMuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
