Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832001172FA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 18:41:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieMyr-0001S1-Oh; Mon, 09 Dec 2019 17:37:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qJK3=Z7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ieMyp-0001Rw-QN
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 17:37:55 +0000
X-Inumbo-ID: a171bf86-1aaa-11ea-8831-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a171bf86-1aaa-11ea-8831-12813bfff9fa;
 Mon, 09 Dec 2019 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575913074;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4yAoZgk/hnT1trqR4/DxXMWtIs3zlPhLl2RODPjBHE0=;
 b=WjJ7HfsSEnqfkhXraEWZN8FddzxKvekoSJIaPIRFFeJHWO709xWnsqUe
 hGVr9Y2dRJBhAlXuYK687yun1sXJEh5Vk/RaT1118AO5x/JPKca3fHQsC
 9/gxkkS6Y7Vaj/sTVPomyA54Buyfn7Hy85MA5G4rDGAlILDPeuEFvUI8U M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i/wJiUI+GNApuvVXHSGvrHP1WLLC6k3xFloKJZeB/W8L0EqwLdb4q2Dl7KTk0Fj60kkIBvkxTu
 2kx9cI67KIuj1AVMLIQBJuj9ketVaHgj+U8e8fneeu0+rQnvAEWHjRkI3VPQNSPjxMbM9ezBwx
 RQbDlSXn0DxDrwMzAnURrK8Em84EEWDJcr5qGTItoiuwCXJTyzytZw6PM1ZXuKGO/60PNahEYD
 JqnyR5ORqSduX9RY5ir7pAvScfVmjiJSA7g1E+p1eIHmzFUl17dOj+vCFmgHzwRDY7CT9y0BXE
 s7s=
X-SBRS: 2.7
X-MesageID: 9767095
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,296,1571716800"; 
   d="scan'208";a="9767095"
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-5-andrew.cooper3@citrix.com>
 <cbab999a-fd87-2c2c-d14f-421ec4db6ef0@xen.org>
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
Message-ID: <ef33060f-b8a8-a13b-5917-83730f5afdeb@citrix.com>
Date: Mon, 9 Dec 2019 17:37:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cbab999a-fd87-2c2c-d14f-421ec4db6ef0@xen.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/6] xen/hypercall: Cope with -ERESTART on
 more hypercall paths
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTIvMjAxOSAxMjo1NywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDA1LzEyLzIwMTkgMjI6MzAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFRoZXNlIGh5cGVy
Y2FsbHMgZWFjaCB1c2UgY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpLCB3aG9zZSBBUEkgaXMK
Pj4gYWJvdXQgdG8KPj4gc3dpdGNoIHRvIHVzZSAtRVJFU1RBUlQuwqAgVXBkYXRlIHRoZSBzb29u
LXRvLWJlIGFmZmVjdGVkIHBhdGhzIHRvIGNvcGUsCj4+IGZvbGRpbmcgZXhpc3RpbmcgY29udGlu
YXRpb24gbG9naWMgd2hlcmUgYXBwbGljYWJsZS4KPj4KPj4gSW4gYWRkaXRpb246Cj4+IMKgICog
Rm9yIHBsYXRmb3JtIG9wIGFuZCBzeXNjdGwsIGluc2VydCBhIGNwdV9yZWxheCgpIGludG8gd2hh
dCBpcwo+PiBvdGhlcndpc2UgYQo+PiDCoMKgwqAgdGlnaHQgc3BpbmxvY2sgbG9vcCwgYW5kIG1h
a2UgdGhlIGNvbnRpbnVhdGlvbiBsb2dpYyBjb21tb24gYXQgdGhlCj4+IMKgwqDCoCBlcGlsb2d1
ZS4KPj4gwqAgKiBDb250cmFyeSB0byB0aGUgY29tbWVudCBpbiB0aGUgY29kZSwga2V4ZWNfZXhl
YygpIGRvZXMgcmV0dXJuIGluIHRoZQo+PiDCoMKgwqAgS0VYRUNfUkVCT09UIGNhc2UsIG5lZWRz
IHRvIHBhc3MgcmV0IGJhY2sgdG8gdGhlIGNhbGxlci4KPgo+IEl0IGlzIG5vdCBlbnRpcmVseSB0
cml2aWFsIHRvIG1lIHRoYXQgS0VYRUNfUkVCT09UIHJlZmVycyB0bwo+IEtFWEVDX0RFRkFVTFRf
VFlQRS4gVGhlIG1vcmUgdGhhdCBpZiB5b3UgbG9vayBhdCB0aGUga2V4ZWNfcmVib290KCkKPiBo
ZWxwZXIsIGl0IHdpbGwgbm90IHJldHVybiAoc2VlIEJVRygpKS4gV2hhdCBtYXkgcmV0dXJuIGlz
Cj4gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpLgo+Cj4gU28gd291bGQgaXQgbWFrZSBzZW5z
ZSB0byB1c2UgS0VYRUNfREVGQVVMVF9UWVBFPwoKSSdtIG5vdCBzdXJlIHdoeSBJIGNhcGl0YWxp
c2VkIGl0LCBidXQgbm8gLSB1c2luZyBLRVhFQ19ERUZBVUxUX1RZUEUgaXMKd29yc2UuwqAgQSBj
YXN1YWwgcmVhZGVyIGlzIGZhciBtb3JlIGxpa2VseSB0byB1bmRlcnN0YW5kIGtleGVjX3JlYm9v
dCgpCmluIHRoaXMgY29udGV4dC4KCj4KPiBbLi4uXQo+Cj4+IEBAIC04MTYsNiArODE5LDEzIEBA
IHJldF90Cj4+IGRvX3BsYXRmb3JtX29wKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3BsYXRm
b3JtX29wX3QpIHVfeGVucGZfb3ApCj4+IMKgwqAgb3V0Ogo+PiDCoMKgwqDCoMKgIHNwaW5fdW5s
b2NrKCZ4ZW5wZl9sb2NrKTsKPj4gwqAgK8KgwqDCoCBpZiAoIHJldCA9PSAtRVJFU1RBUlQgKQo+
PiArwqDCoMKgIHsKPj4gK8KgwqDCoCBjcmVhdGVfY29udGludWF0aW9uOgo+Cj4gU2hhbGwgd2Ug
aW5kZW50IGNyZWF0ZV9jb250aW51YXRpb24gdGhlIHNhbWUgd2F5IGFzIG91dD8KClRoZXkgaGF2
ZSBkaWZmZXJlbnQgc2NvcGVzLCBhbmQgd2hpbGUgaXQgbWF5IGxvb2sgd2VpcmQsIHRoaXMgaXMg
aW4KYWNjb3JkYW5jZSB3aXRoIG91ciBzdHlsZS4KCj4KPiBbLi4uXQo+Cj4+IEBAIC0xMjYzLDEz
ICsxMjYzLDI1IEBAIHN0YXRpYyBpbnQgZG9fa2V4ZWNfb3BfaW50ZXJuYWwodW5zaWduZWQgbG9u
Zwo+PiBvcCwKPj4gwqAgwqAgbG9uZyBkb19rZXhlY19vcCh1bnNpZ25lZCBsb25nIG9wLCBYRU5f
R1VFU1RfSEFORExFX1BBUkFNKHZvaWQpCj4+IHVhcmcpCj4+IMKgIHsKPj4gLcKgwqDCoCByZXR1
cm4gZG9fa2V4ZWNfb3BfaW50ZXJuYWwob3AsIHVhcmcsIDApOwo+PiArwqDCoMKgIGludCByZXQg
PSBkb19rZXhlY19vcF9pbnRlcm5hbChvcCwgdWFyZywgMCk7Cj4gU2hvdWxkbid0IGl0IGJlIGxv
bmcgKG9yIHVuc2lnbmVkIGxvbmcpIGhlcmU/IE90aGVyd2lzZSwgdGhlIHJldHVybiBvZgo+IGh5
cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKCkgbWF5IGJlIHRydW5jYXRlZC4KCklmIHlvdSdy
ZSBjb25jZXJuZWQgYWJvdXQgdHJ1bmNhdGlvbiB2aWEgdGhpcyBwYXR0ZXJuLCB0aGVuIHRoZXJl
IGFyZQpvdGhlciBhcmVhcyBvZiB0aGUgY29kZSB0byBiZSB3b3JyZWQgYWJvdXQuCgpIb3dldmVy
LCB0aGVyZSBpcyBub3RoaW5nIHRvIHRydW5jYXRlLsKgIFRoZSByZXR1cm4gdmFsdWUgb2YKaHlw
ZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24oKSBpcyB0aGUgcHJpbWFyeSBoeXBlcmNhbGwgbnVt
YmVyLCBpLmUuCl9fSFlQRVJWSVNPUl9rZXhlY19vcCBpbiB0aGlzIGNhc2UuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
