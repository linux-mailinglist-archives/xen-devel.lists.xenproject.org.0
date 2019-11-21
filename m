Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14F1058C3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 18:40:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXqPN-0000Vx-26; Thu, 21 Nov 2019 17:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOoV=ZN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iXqPL-0000Vs-JI
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 17:38:19 +0000
X-Inumbo-ID: b424ed2a-0c85-11ea-a340-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b424ed2a-0c85-11ea-a340-12813bfff9fa;
 Thu, 21 Nov 2019 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574357898;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1VTG1dvLmdQ37kEe8fgpmZTWwfECMFFxK9VfMNSuTNo=;
 b=VVAI5YJU5wl16JQBq1mVJfKKDLO2WTc8SNRUiJ2Salcl8s7WHweGIOa5
 mVzPHqaT5t8uO2IfjZ+vBnOUgnvIp69Q0TH8pJAI4B3m5ghIdkr8ZQBwm
 Ml17+DC3OoqQD/+DJF9G1tCiPm7C2+0qa/F/4yRkHJnGvB2bGihdgIyOu E=;
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
IronPort-SDR: 0WPPkbhDd9J/PXKG46A2EFURburi0n6Jzt3pQDmtLC/Bwxf49LQsO7xR93k0kQYgB7whPK2cEy
 AtkJzTIJs1sJNPyj40l57qPXmXB1v4tU23JbA64gUDkTG+zjpAGNxcRkDkSdBTYdVcGO0iF0cX
 WOZBivjiD+vvE1lD0zhxDYOHhN2/aAkx4jiMPLGRe1xuRsyrDVYS12rTxYgpcSP0q+BgkmTuuH
 KTePOc/X1t9NN0RBiR18PCiPEOU0YL53XJKBXLsEeuRCTENd/vId1yqqoYFjU73oAxmVUnw3cN
 0N0=
X-SBRS: 2.7
X-MesageID: 9214898
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="9214898"
To: Roman Shaposhnik <roman@zededa.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
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
Message-ID: <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
Date: Thu, 21 Nov 2019 17:38:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEvMTEvMjAxOSAxNzozMSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBXZWQsIE5v
diAyMCwgMjAxOSBhdCAxMDowNiBQTSBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdy
b3RlOgo+PiBXaGVyZSBkbyB3ZSBzdGFuZCB3aXRoIFhlbiA0LjEzIHJlZ2FyZGluZyBibG9ja2Vy
cyBhbmQgcmVsYXRlZCBwYXRjaGVzPwo+Pgo+PiAxLiBPU1N0ZXN0IGZhaWx1cmUgcmVnYXJkaW5n
IG5lc3RlZCB0ZXN0Ogo+PiAgICAgSSdtIG5vdCBxdWl0ZSBzdXJlIHdoZXRoZXIgdGhlIGN1cnJl
bnRseSBkZWJhdGVkIHBhdGNoIG9mIEFuZHJldyBpcwo+PiAgICAgZml4aW5nIHRoZSBwcm9ibGVt
LiBJZiBub3QsIGRvIHdlIGtub3cgd2hhdCBpcyBtaXNzaW5nIG9yIGhvdyB0bwo+PiAgICAgYWRk
cmVzcyB0aGUgaXNzdWU/IElmIHllcywgY291bGQgd2UgcGxlYXNlIGNvbWUgdG8gYW4gYWdyZWVt
ZW50Pwo+PiAgICAgQXMgYW4gYWx0ZXJuYXRpdmU6IGFueSB0aG91Z2h0cyBhYm91dCBpZ25vcmlu
ZyB0aGlzIHRlc3QgZmFpbHVyZSBmb3IKPj4gICAgIDQuMTMtUkMzIChJT1c6IGRvaW5nIGEgZm9y
Y2UgcHVzaCk/Cj4+Cj4+IDIuIFJ5emVuL1JvbWUgZmFpbHVyZXMgd2l0aCBXaW5kb3dzIGd1ZXN0
czoKPj4gICAgIFdoYXQgaXMgdGhlIGN1cnJlbnRseSBwbGFubmVkIHdheSB0byBhZGRyZXNzIHRo
ZSBwcm9ibGVtPyBXaG8gaXMKPj4gICAgIHdvcmtpbmcgb24gdGhhdD8KPj4KPj4gMy4gUGVuZGlu
ZyBwYXRjaGVzIGZvciA0LjEzOgo+PiAgICAgQ291bGQgSSBwbGVhc2UgaGF2ZSBmZWVkYmFjayB3
aGljaCBwYXRjaGVzIHRhZ2dlZCBhcyAiZm9yLTQuMTMiIGFyZQo+PiAgICAgZml4aW5nIHJlYWwg
cmVncmVzc2lvbnMgb3IgaXNzdWVzPyBJIGRvbid0IHdhbnQgdG8gdGFrZSBhbnkgcGF0Y2hlcwo+
PiAgICAgbm90IGZpeGluZyByZWFsIHByb2JsZW1zIGFmdGVyIFJDMywgYW5kIEkgaG9wZSB0byBi
ZSBhYmxlIHRvIGdldCBhCj4+ICAgICBwdXNoIHJhdGhlciBzb29uZXIgdGhhbiBsYXRlciB0byBi
ZSBhYmxlIHRvIGxldCBJYW4gY3V0IFJDMy4KPj4KPj4gNC4gQXJlIHRoZXJlIGFueSBibG9ja2Vy
cyBmb3IgNC4xMyBvdGhlciB0aGFuIDEuIGFuZCAyLiAoYXBhcnQgb2YgYW55Cj4+ICAgICBwZW5k
aW5nIFhTQXMpPwo+IEFueSBjaGFuY2UgdGhlIGVmaT1uby1ycyByZWdyZXNzaW9uIGNhbiBiZSBh
ZGRlZCB0byB0aGUgbGlzdD8gSSB1bmRlcnN0YW5kCj4gdGhhdCBJJ20gc3RpbGwgb24gdGhlIGhv
b2sgdG8gcHJvdmlkZSBtb3JlIGRldGFpbHMgKEkgcHJvbWlzZSB0byBkbyBpdCBvbiBGcmkKPiB3
aGVuIEkgZ2V0IHRvIG15IGxhYiB0byBhY3R1YWxseSBoYXZlIGEgc2VyaWFsIGNvbnNvbGUgb24g
YWxsIHRoZXNlIGJveGVzKS4KPiBBdCB0aGUgc2FtZSB0aW1lIHRoaXMgaXMgYSBwcmV0dHkgc2Vy
aW91cyByZWdyZXNzaW9uIGZvciBhbiBlbnRpcmUgY2xhc3Mgb2YKPiBkZXZpY2VzIHdoZXJlIFhl
biB3YXMgcGVyZmVjdGx5IGhhcHB5IGV2ZW4gZHVyaW5nIFJDMS4KCmh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTUzNGY5ZTI5Y2UyODU4MDg5
MmIzODU2MDM2YjVlNWNkODA1NjY3Y2MKaGFzIGJlZW4gY29tbWl0dGVkLsKgIEl0IGlzIGluIHN0
YWdpbmcsIGJ1dCBub3QgaW4gbWFzdGVyIHlldCAoYmVjYXVzZQptYXN0ZXIgaXMgYmxvY2tlZCBi
eSBteSByZWdyZXNzaW9uIGluIDEpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
