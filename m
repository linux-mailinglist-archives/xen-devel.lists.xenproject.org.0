Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A29124603
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:43:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXgR-0001pi-V6; Wed, 18 Dec 2019 11:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5XdQ=2I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihXgR-0001oU-37
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:40:03 +0000
X-Inumbo-ID: 1bc59c44-218b-11ea-a914-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bc59c44-218b-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 11:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576669194;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uynk2L1EycqF8G3HuFycBt9KKgOHv8J6YyqwO/jBns0=;
 b=XSbsSJuWTJ/Z4PlBwveYpdBn5W8K4/baXwVBzixlgaaJpg+EEU/hMZp9
 XZ8UwGst4oINm8RmhPkxsewq1hwLR7mYJPMxxoc4TKwaiOV6wJDVOfgkx
 VJjFRr+m3oQg8pIRgqykc9fRGJ225i2Tgufs7t6+XRw2lYVG1/kfSRzf2 k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 40iEHFkk9yELUjc/eptooWBGUJ1NE/ZQ/WqRUchs8qPGSQG+4B5vEcZc9Khx3klujODC4D07FM
 ANFTo5nyoQlH74fD0z5K2egM7c8BrnA+TciwZ1MCWaCRyWGBmUz0jNhrX7/HpBTU8w87BaKeq2
 aqS5ndyORETF68Dgeu0NyEqNuhU4/WMhTaoYNStDWlJU6j+jXEqA4f3mGYr7JHtqE5UYNOO0y1
 nm9Q4Vnc3zXQekp71m/EwOcXwooT/v3m8Ow3JgcwkSMXOrMnHBsAyv9oJtSTIPOF0HtJNLl6RG
 AEI=
X-SBRS: 2.7
X-MesageID: 10453972
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,329,1571716800"; d="scan'208";a="10453972"
To: Jan Beulich <jbeulich@suse.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <fe06b109-7a64-a4f1-f8a8-b436b04a6ac1@suse.com>
 <e934e305-cb3b-39d6-8719-6b054f52fcee@citrix.com>
 <7c0348ab-c3a4-6706-da66-9861cfce50c6@suse.com>
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
Message-ID: <48466d93-0a16-84de-7d3e-aa3fc627e437@citrix.com>
Date: Wed, 18 Dec 2019 11:39:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7c0348ab-c3a4-6706-da66-9861cfce50c6@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/6] x86/suspend: State cleanup
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

T24gMTcvMTIvMjAxOSAxNjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMTIuMjAxOSAx
NzozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMTIvMjAxOSAxNjoxNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxMy4xMi4yMDE5IDIwOjA0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IEFuZHJldyBDb29wZXIgKDYpOgo+Pj4+ICAgeDg2L3N1c3BlbmQ6IENsYXJpZnkgYW5k
IGltcHJvdmUgdGhlIGJlaGF2aW91ciBvZiBkb19zdXNwZW5kX2xvd2xldmVsKCkKPj4+PiAgIHg4
Ni9zdXNwZW5kOiBEb24ndCBib3RoZXIgc2F2aW5nICVjcjMsICVzcyBvciBmbGFncwo+Pj4+ICAg
eDg2L3N1c3BlbmQ6IERvbid0IHNhdmUgdW5uZWNlc3NhcnkgR1BScwo+Pj4+ICAgeDg2L3N1c3Bl
bmQ6IFJlc3RvcmUgY3I0IGxhdGVyIGR1cmluZyByZXN1bWUKPj4+PiAgIHg4Ni9zdXNwZW5kOiBF
eHBhbmQgbWFjcm9zIGluIHdha2V1cF9wcm90LlMKPj4+PiAgIHg4Ni9zdXNwZW5kOiBEcm9wIHNh
dmVfcmVzdF9wcm9jZXNzb3Jfc3RhdGUoKSBjb21wbGV0ZWx5Cj4+Pj4KPj4+PiAgeGVuL2FyY2gv
eDg2L2FjcGkvc3VzcGVuZC5jICAgICB8ICA1NSArKy0tLS0tLS0tLS0tLS0tCj4+Pj4gIHhlbi9h
cmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMgfCAxMzYgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+Pj4+ICB4ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUyAgICAgIHwg
ICAyICstCj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgMTQ3IGRlbGV0
aW9ucygtKQo+Pj4gQmFzZWQgb24gUm9nZXIncyByZXZpZXcKPj4+IEFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pgo+Pj4gT25lIHJlbWFyayBvbiB0aGUgY29tYmlu
YXRpb24gb2YgcGF0Y2hlcyAyIGFuZCA1OiBUaGUgbG9hZGluZyBvZgo+Pj4gdGhlIHN0YWNrIHJl
bGF0ZWQgcmVnaXN0ZXJzIHdvdWxkIG5vdyBzZWVtIHRvIGJlIGEgZmFpciBjYW5kaWRhdGUKPj4+
IGZvciB1c2luZyBMU1MgKGdlbmVyYWxseSB0byBiZSBwcmVmZXJyZWQgb3ZlciBNT1YtdG8tU1Mp
Lgo+PiBXZWxsLi4uIFlvdSd2ZSBqdXN0IGZpeGVkIGMvcyBmZmEyMWVhNTMwMyBpbiB0aGUgZW11
bGF0b3IsIGFuZCBpdAo+PiBkZW1vbnN0cmF0ZXMgd2h5IExTUyBjYW4ndCBiZSB1c2VkLgo+IEht
bSwgaW5kZWVkLCBob3cgZGlkIEkgZm9yZ2V0PyAoSXQncyByZWFsbHkgdmVyeSBjb3VudGVyLWlu
dHVpdGl2ZQo+IGZvciB0aGlzIGluc24gdG8gbm90IGJlIHVuaXZlcnNhbGx5IHVzYWJsZS4pCgpU
aGUgZGlmZmVyaW5nIGJlaGF2aW91ciBiZXR3ZWVuIEludGVsIGFuZCBBTUQgbWFrZXMgTCpTIGFu
ZCBjYWxsIGdhdGVzCnRvdGFsbHkgdW51c2FibGUsIGV2ZW4gaW4gc2l0dWF0aW9ucyB3aGVyZSB0
aGV5IG1pZ2h0IGJlIHVzZWZ1bC4KCkluIHByYWN0aWNlLCBjYWxsIGdhdGVzIHdoZXJlIGtpbGxl
ZCBieSBTWVN7Q0FMTCxFTlRFUn0ve1JFVCxFWElUfSBiZWluZwo0eCBmYXN0ZXIgdGhhbiBhbnl0
aGluZyByZWZlcmVuY2luZyB0aGUgSURUL0dEVCwgYW5kIEwqUyBoYXZlIGhhZCBhCmNvbXBsaWNh
dGVkIGhpc3Rvcnkgb2YgYXZhaWxhYmlsaXR5IGV2ZW4gaW4gdGhlIDMyYml0IGRheXMuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
