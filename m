Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24CEF1F1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 01:28:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRmf8-0000YL-Eh; Tue, 05 Nov 2019 00:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rgKV=Y5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iRmf6-0000YF-KX
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 00:25:32 +0000
X-Inumbo-ID: c54e3da2-ff62-11e9-a18e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c54e3da2-ff62-11e9-a18e-12813bfff9fa;
 Tue, 05 Nov 2019 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572913531;
 h=subject:from:to:references:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=WwwUeLGrkcYaCX714zanz/r3baAMb7afpOx9St22m1g=;
 b=gH0WZzS5N+m5bgw1ZRANVMSCe9icugxQeiDtnEfKtFzVwK1wx1BnOOVT
 YqoMRfmA7xhVZ2wWiBSWCdt0nHqc7RU0svId3QO5cxlnumxY+Z4BiAQRT
 PXeiftKysBdGSg0MJ1mYD+uHmf1cHiuRA5RtzXDfhBCb7LwKYtMD6kLkr 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WTgDjrw3SKCt6qYRiCAgtBkVqifs6rekEa8TvsVo5JK/reidFU/AolyxZ8S5bYjqUrgy/IZh/9
 zkGmqkrfSOBPUwDTwgGQZG09zLFKRlVaVOIokhXW22DAQD6yZsLn/7ujRoP73mzK3AcDZVS/Tv
 N4VUu2VMNO8WMFFDeE8h7VbA3aCznAhrpjePW296hTkI7MAbzR5vJ3ihsaCEgZPUQ+7tepR1Q1
 QRlpV+aEevwbKDlQI5rfaTxyGWyFFXzMGmx8sAs9WVeVTEi4sVgxR23e5WHS0UJtEK8bQ2zXs8
 5UQ=
X-SBRS: 2.7
X-MesageID: 7945151
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,268,1569297600"; 
   d="scan'208";a="7945151"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?H=c3=a5kon_Alstadheim?= <hakon@alstadheim.priv.no>,
 <xen-devel@lists.xenproject.org>
References: <19c16a0b-514d-8e2b-a2ea-ce35ab3c3952@alstadheim.priv.no>
 <bc0b45b1-be20-e1f2-81dc-cbfec71a6599@citrix.com>
 <b9aad1ea-fae3-047a-3c01-3d00a756aa2f@alstadheim.priv.no>
 <2e25eb60-7f59-d7bf-8f8c-4dc2790c0840@citrix.com>
 <25043c4e-c2ec-c47b-513f-2c0d93c23f26@alstadheim.priv.no>
 <099cb111-cc9b-59da-809a-17ddf896f16d@citrix.com>
 <62c8abc6-5971-7978-b337-44392927a985@citrix.com>
 <550d8bb6-7953-0749-8d32-c0d4820e0e55@alstadheim.priv.no>
 <92d3a465-1ee5-c4b5-4376-dea176713836@citrix.com>
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
Message-ID: <7d72d720-eb02-33e2-0f6e-f78666cee9f5@citrix.com>
Date: Tue, 5 Nov 2019 00:25:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <92d3a465-1ee5-c4b5-4376-dea176713836@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] Invalid guest state in Xen master,
 dom0 linux-5.3.6, domU windows 10
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTEvMjAxOSAyMzo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMS8yMDE5
IDIzOjIwLCBIw6Vrb24gQWxzdGFkaGVpbSB3cm90ZToKPj4gKFhFTikgUkZMQUdTPTB4MDAwMDAx
OTMgKDB4MDAwMDAxOTMpwqAgRFI3ID0gMHgwMDAwMDAwMDAwMDAwNDAwCj4+IDxzbmlwPgo+PiAo
WEVOKSAqKiogSW5zbiBieXRlcyBmcm9tIGZmZmZiODg2OGY2MWQ2OWE6IDQ0IDAwIDAwIDhjIGQw
IDljIDgxIDBjIDI0Cj4+IDAwIDAxIDAwIDAwIDlkIDhlIGQwIDxmZmZmZmZmMT4gOWMgODEgMjQg
MjQgZmYgZmUgZmYgZmYgOWQgYzMgY2MgY2MgY2MKPj4gY2MgY2MKPiBPay7CoCBPbmUgcXVlc3Rp
b24gYW5zd2VyZWQsIHNldmVyYWwgbW9yZSBXVEYuCj4KPiAwMDAwMDAwMDAwMDAwMDAwIDwuZGF0
YT46Cj4gwqDCoCAwOsKgwqDCoCA0NCAwMCAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKg
wqAgYWRkwqDCoMKgICVyOGIsKCVyYXgpCj4gwqDCoCAzOsKgwqDCoCA4YyBkMMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgbW92wqDCoMKgICVzcywlZWF4Cj4gwqDCoCA1OsKg
wqDCoCA5Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcHVzaGZx
Cj4gwqDCoCA2OsKgwqDCoCA4MSAwYyAyNCAwMCAwMSAwMCAwMCDCoMKgwqAgb3JswqDCoMKgICQw
eDEwMCwoJXJzcCkKPiDCoMKgIGQ6wqDCoMKgIDlkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIMKgwqDCoCBwb3BmccKgCj4gwqDCoCBlOsKgwqDCoCA4ZSBkMMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgbW92wqDCoMKgICVlYXgsJXNzCj4gwqAgMTA6wqDC
oMKgIGYxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBpY2VicMKg
Cj4gwqAgMTE6wqDCoMKgIDljwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKg
wqDCoCBwdXNoZnEKPiDCoCAxMjrCoMKgwqAgODEgMjQgMjQgZmYgZmUgZmYgZmYgwqDCoMKgIGFu
ZGzCoMKgICQweGZmZmZmZWZmLCglcnNwKQo+IMKgIDE5OsKgwqDCoCA5ZMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcG9wZnHCoAo+IMKgIDFhOsKgwqDCoCBjM8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgcmV0ccKgwqAKPiDCoCAx
YjrCoMKgwqAgY2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGlu
dDPCoMKgCj4gwqAgMWM6wqDCoMKgIGNjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIMKgwqDCoCBpbnQzwqDCoAo+IMKgIDFkOsKgwqDCoCBjY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDCoMKgwqAgaW50M8KgwqAKPiDCoCAxZTrCoMKgwqAgY2PCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIGludDPCoMKgCj4gwqAgMWY6wqDC
oMKgIGNjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCBpbnQzwqDC
oAo+Cj4KPiBUaGlzIGlzIGEgc2VyaW91cyBleGVyY2lzaW5nIG9mIGFyY2hpdGVjdHVyYWwgY29y
bmVyIGNhc2VzLCBieSBsYXllcmluZwo+IGEgc2luZ2xlIHN0ZXAgZXhjZXB0aW9uIG9uIHRvcCBv
ZiBhIE1vdlNTLWRlZmVycmVkIElDRUJQLgo+Cj4gTm93IEkndmUgbG9va2VkIGNsb3NlciwgdGhp
cyBpc24ndCBhIENWRS0yMDE4LTg4OTcgZXhwbG9pdCBhcyBubwo+IGJyZWFrcG9pbnRzIGFyZSBj
b25maWd1cmVkIGluICVkcjcsIHNvIEknbSBnb2luZyB0byByZXZpc2UgbXkgZ3Vlc3Mgc29tZQo+
IG5ldyBkZWJ1Z2dlci1kZXRlY3Rpb24gaW4gRFJNIHNvZnR3YXJlLgoKSSd2ZSByZXByb2R1Y2Vk
IHRoZSBWTUVudHJ5IGZhaWx1cmUgeW91IHdlcmUgc2VlaW5nLsKgIE5vdyB0byBmaWd1cmUgb3V0
CmlmIHRoZXJlIGlzIHN1ZmZpY2llbnQgY29udHJvbCBhdmFpbGFibGUgdG8gcHJvdmlkZSBhcmNo
aXRlY3R1cmFsCmJlaGF2aW91ciB0byBndWVzdCwgYmVjYXVzZSBJJ20gbm90IGVudGlyZWx5IGNl
cnRhaW4gdGhlcmUgaXMsIGdpdmVuCnNvbWUgb2YgSUNFQlAncyBleHRyYSBtYWdpYyBwcm9wZXJ0
aWVzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
