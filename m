Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B81341C9
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:33:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAV7-0003PY-Mo; Wed, 08 Jan 2020 12:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipAV5-0003PH-UV
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:31:51 +0000
X-Inumbo-ID: d694eb3e-3212-11ea-b7d9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d694eb3e-3212-11ea-b7d9-12813bfff9fa;
 Wed, 08 Jan 2020 12:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578486708;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pNyE1Jpx08eu1ePDu3b0n/p5mL3IGcZR/IY3QmHDTdg=;
 b=dgLZqlNI8Go/s9nnKg9JrjMRIiz+GhVwxab1UnRcRMvgH3iXxhFTwLq9
 2DCXjZ1azTfhZowvIqqn0pImhjol8dQqvNx48rlhln3rAzq87uw7Wg2SB
 EM4tforNPo7rJzg2COZHQ/oMTIOxqtvBUH0zwFuskkbSmG43k+NCSksXk 0=;
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
IronPort-SDR: 1qDieevP2/ZEseTvMECT1HMMpltzzMjeHZEtwDC1C1kpsIXcFHBJa+ICYR1LbkPpQ2AHfy0uIx
 /4Jm6WOdYmyBESW2guiWdvKEAZkmTENLJE4pntpVMIIAmACglAJqcPls/HENuAy4I5f8+pf8DB
 MflqZEJNg7zzXrBVCZoft7hc0ZNDDiah9rrSzYDN5vq/0EsmkIpj/xdUCk/xhANBbe674ExkGW
 h2zir2ITqR5iN5F1N/+tuJYo7sOwGtjAOClmL9nkSwg15yhaZzn/7tmqNaJKvkxiTqFNQte/5g
 5E4=
X-SBRS: 2.7
X-MesageID: 11206431
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,409,1571716800"; d="scan'208";a="11206431"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>
References: <20200108110148.18988-1-jgross@suse.com>
 <20200108121606.yr25b27mrnawu6um@debian>
 <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
 <20200108122355.3js5sbis2yxxszqc@debian>
 <62c457b3-dd02-ad2b-4d17-f11739a27dc3@suse.com>
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
Message-ID: <df172841-8ed8-820f-d013-db9d188989c1@citrix.com>
Date: Wed, 8 Jan 2020 12:31:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <62c457b3-dd02-ad2b-4d17-f11739a27dc3@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDEvMjAyMCAxMjoyNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOC4wMS4yMCAx
MzoyMywgV2VpIExpdSB3cm90ZToKPj4gT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDE6MTg6NDZQ
TSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4+IE9uIDA4LjAxLjIwIDEzOjE2LCBXZWkg
TGl1IHdyb3RlOgo+Pj4+IE9uIFdlZCwgSmFuIDA4LCAyMDIwIGF0IDEyOjAxOjQ4UE0gKzAxMDAs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IGNwdV9zbXBib290X2ZyZWUoKSByZW1vdmVzIHRo
ZSBzdHVicyBmb3IgdGhlIGNwdSBnb2luZyBvZmZsaW5lLAo+Pj4+PiBidXQgaXQKPj4+Pj4gaXNu
J3QgY2xlYXJpbmcgdGhlIHJlbGF0ZWQgcGVyY3B1IHZhcmlhYmxlcy4gVGhpcyB3aWxsIHJlc3Vs
dCBpbgo+Pj4+PiBjcmFzaGVzIHdoZW4gYSBzdHViIHBhZ2UgaXMgcmVsZWFzZWQgZHVlIHRvIGFs
bCByZWxhdGVkIGNwdXMgZ29uZQo+Pj4+PiBvZmZsaW5lIGFuZCBvbmUgb2YgdGhvc2UgY3B1cyBn
b2luZyBvbmxpbmUgbGF0ZXIuCj4+Pj4+Cj4+Pj4+IEZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJz
LmFkZHIgYW5kIHN0dWJzLm1mbiBpbiBvcmRlciB0byBhbGxvY2F0ZSBhCj4+Pj4+IG5ldyBzdHVi
IHBhZ2Ugd2hlbiBuZWVkZWQuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgwqAgeGVuL2FyY2gveDg2L3Nt
cGJvb3QuYyB8IDIgKysKPj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2Fy
Y2gveDg2L3NtcGJvb3QuYwo+Pj4+PiBpbmRleCA3ZTI5NzA0MDgwLi40NmMwNzI5MjE0IDEwMDY0
NAo+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9zbXBib290LmMKPj4+Pj4gQEAgLTk0NSw2ICs5NDUsOCBAQCBzdGF0aWMgdm9pZCBjcHVf
c21wYm9vdF9mcmVlKHVuc2lnbmVkIGludCBjcHUsCj4+Pj4+IGJvb2wgcmVtb3ZlKQo+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAocGVyX2NwdShzdHVicy5hZGRyLCBjcHUpIHwKPj4+Pj4gflBBR0VfTUFTSykgKyAxKTsK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBpID09IFNUVUJTX1BFUl9QQUdFICkKPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlX2RvbWhlYXBfcGFnZShtZm5fdG9f
cGFnZShtZm4pKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1
KSA9IDA7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwZXJfY3B1KHN0dWJzLm1mbiwgY3B1KSA9IDA7
Cj4+Pj4KPj4+PiBTaG91bGRuJ3QgdGhlIG1mbiBiZSBzZXQgdG8gSU5WQUxJRF9NRk4gaW5zdGVh
ZD8KPj4+Cj4+PiBUaGlzIHdvdWxkIHJlcXVpcmUgbW9kaWZ5aW5nIGFsbG9jX3N0dWJfcGFnZSgp
Ogo+Pj4KPj4+IMKgwqDCoMKgIGlmICggKm1mbiApCj4+PiDCoMKgwqDCoMKgwqDCoMKgIHBnID0g
bWZuX3RvX3BhZ2UoX21mbigqbWZuKSk7Cj4+PiDCoMKgwqDCoCBlbHNlCj4+Cj4+IE9LLiBJIHRo
aW5rIHRoZSBjaGFuY2Ugb2YgYWxsb2NhdGluZyBtZm4gMCBmcm9tIHRoZSBhbGxvY2F0b3IgaXMK
Pj4gZXhjZWVkaW5nbHkgbG93LCBzbyBJIGNlcnRhaW5seSBoYXZlIG5vIG9iamVjdGlvbiB0byBy
ZXNldCBpdCB0byAwLgo+Cj4gVGhlIGNoYW5jZSBzaG91bGQgYmUgZXhhY3RseSB6ZXJvLiBPdGhl
cndpc2Ugd2UnZCBoYXZlIGEgYmlnIHByb2JsZW0KPiBkdWUgdG8gTDFURi4uLgoKQWxzbyBNRk4g
MCBjb250YWlucyB0aGUgSVZUIGFuZCBCREEuCgpUaGUgSVZUIGF0IGxlYXN0IG11c3QgcmVtYWlu
IHZhbGlkIGF0IGFsbCB0aW1lcyAoZXZlbiBvbiBFRkkgc3lzdGVtcyksCmJlY2F1c2UgQVAgYm9v
dCBuZWVkcyB0byBoYXZlIGF0IGxlYXN0IGEgbm8tb3AgTk1JIGhhbmRsZXIuwqAgQSBiYXNlIG9m
IDAKYW5kIGxpbWl0IG9mIDB4ZmZmZiBpcyB0aGUgYXJjaGl0ZWN0dXJhbCBJTklUL1JFU0VUIHN0
YXRlIGZvciBJRFRSLsKgCihBbHNvIGZvciB0aGUgb3RoZXIgc3lzdGVtIGRhdGEgc3RydWN0dXJl
cywgYnV0IHRoZXkgaGF2ZSB0byBiZSBtb3ZlZAplbHNld2hlcmUgYmVmb3JlIHRoZXkgY2FuIGJl
IHVzZWQpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
