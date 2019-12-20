Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090461281D1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:04:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMZs-0003Gs-4v; Fri, 20 Dec 2019 18:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiMZr-0003Gn-0V
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:00:39 +0000
X-Inumbo-ID: a008d1a7-2352-11ea-93bf-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a008d1a7-2352-11ea-93bf-12813bfff9fa;
 Fri, 20 Dec 2019 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576864837;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cpMjFdVh8eBJc9tVLZsJFCRdmBq/TB/GjCefC1ZVtW4=;
 b=I6StH3RtXLxKEbZLlG7hMNC4U3CNcetZcYEwo+Z+t+fKstG0d3QuV/VV
 KE0Tz7NYkMS6i5yvZO89Tn6c64GW59ZnPl7A8kNJl43QiDrhJOxgcZIVR
 0DJqOURrEsPDgwl3NPmKZKWUqLl3XpkSm+50YRgTGDzx+DPreb01dotKI c=;
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
IronPort-SDR: bLmqjgvQ3S7o4/rE5f7m3EuUhw7EeRCTJcwR23f3OE8+fpejvWgEx41LqyEVMfsM7wJjWqU18j
 lNjesK5TvU2FjJb/O/6//oOM7mnIHuwD6g1lP4pun1CfQsTMiy8leN64eFwxRg67vvIms9gjfL
 u09xvWid9SHtocQKmwVHCN2S3Fn0Sx7kcnPWxPPs35yyTUKKG1LmBIZgqCAHe+6pDjB9+DyIOg
 wpoIGG91V+28jIVmF8xVKRgiZVr6sBqEunEK9x/j0C3PdqrMJnT+SkjFxlFMavdFGa52EFiRVt
 WGg=
X-SBRS: 2.7
X-MesageID: 10592867
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10592867"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <CABfawh=Si977UzkWKbYHoYEW+daLFQNLvOF8YvznxmmeM_BDaA@mail.gmail.com>
 <2122fc00-bf6e-cedd-3b49-d53065a40832@citrix.com>
 <CABfawh=6SjqOT1nhfL+73FfQG34W=iJpUoGr6kT0oBdnyERrmA@mail.gmail.com>
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
Message-ID: <770cee09-050f-a7d1-75ce-c75ca1ede8fe@citrix.com>
Date: Fri, 20 Dec 2019 18:00:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=6SjqOT1nhfL+73FfQG34W=iJpUoGr6kT0oBdnyERrmA@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTIvMjAxOSAxNzo1MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIEZyaSwgRGVj
IDIwLCAyMDE5IGF0IDEwOjQ3IEFNIEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDIwLzEyLzIwMTkgMTc6MzYsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPj4+IE9uIEZyaSwgRGVjIDIwLCAyMDE5IGF0IDEwOjMyIEFNIEFuZHJldyBDb29wZXIK
Pj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+PiBPbiAyMC8xMi8yMDE5
IDE3OjI3LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgRGVjIDIwLCAyMDE5
IGF0IDk6NDcgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4+
IE9uIDE4LjEyLjIwMTkgMjA6NDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+PiBDdXJy
ZW50bHkgdGhlIGh2bSBwYXJhbWV0ZXJzIGFyZSBvbmx5IGFjY2Vzc2libGUgdmlhIHRoZSBIVk1P
UCBoeXBlcmNhbGxzLiBCeQo+Pj4+Pj4+IGV4cG9zaW5nIGh2bV97Z2V0L3NldH1fcGFyYW0gaXQg
d2lsbCBiZSBwb3NzaWJsZSBmb3IgVk0gZm9ya2luZyB0byBjb3B5IHRoZQo+Pj4+Pj4+IHBhcmFt
ZXRlcnMgZGlyZWN0bHkgaW50byB0aGUgY2xvbmUgZG9tYWluLgo+Pj4+Pj4gSGF2aW5nIHBlZWtl
ZCBhaGVhZCBhdCBwYXRjaCAxNywgd2hlcmUgdGhpcyBnZXRzIHVzZWQsIEkgd29uZGVyIHdoeQo+
Pj4+Pj4geW91IHdhbnQgYSBwYWlyIG9mIG9uZS1ieS1vbmUgZnVuY3Rpb25zLCByYXRoZXIgdGhh
biBhIGNvcHktYWxsIG9uZS4KPj4+Pj4+IFRoaXMgdGhlbiB3b3VsZG4ndCByZXF1aXJlIGV4cG9z
dXJlIG9mIHRoZSBmdW5jdGlvbnMgeW91IHRvdWNoIGhlcmUuCj4+Pj4+IFdlbGwsIHByb3ZpZGVk
IHRoZXJlIGlzIG5vIHN1Y2ggZnVuY3Rpb24gaW4gZXhpc3RlbmNlIHRvZGF5IGl0IHdhcwo+Pj4+
PiBqdXN0IGVhc2llciB0byB1c2Ugd2hhdCdzIGFscmVhZHkgYXZhaWxhYmxlLiBJIHN0aWxsIHdv
dWxkbid0IHdhbnQgdG8KPj4+Pj4gaW1wbGVtZW50IGEgb25lLXNob3QgZnVuY3Rpb24gbGlrZSB0
aGF0IGJlY2F1c2UgdGhpcyBzYW1lIGNvZGUtcGF0aCBpcwo+Pj4+PiBzaGFyZWQgYnkgdGhlIHNh
dmUtcmVzdG9yZSBvcGVyYXRpb25zIG9uIHRoZSB0b29sc3RhY2sgc2lkZSwgc28gYXQKPj4+Pj4g
bGVhc3QgSSBoYXZlIGEgcmVhc29uYWJsZSBhc3N1bXB0aW9uIHRoYXQgaXQgd29uJ3QgYnJlYWsg
b24gbWUgaW4gdGhlCj4+Pj4+IGZ1dHVyZS4KPj4+PiBJbiBwYXJ0aWN1bGFyLCBhIG51bWJlciBv
ZiB0aGUgc2V0IG9wZXJhdGlvbnMgYXJlIGRpc3RpbmN0bHkKPj4+PiBub24tdHJpdmlhbC4gIChP
VE9ILCB0aG9zZSBhcmUgbm90IGxvbmcgZm9yIHRoaXMgd29ybGQsIGFuZCBzaG91bGQgYmUKPj4+
PiBjcmVhdGlvbiBYODZfRU1VXyogY29uc3RhbnRzIGluc3RlYWQpLgo+Pj4+Cj4+PiBJIGFjdHVh
bGx5IHdhbnRlZCB0byBhc2sgYWJvdXQgdGhhdC4gSW4KPj4+IGh0dHBzOi8veGVuYml0cy54ZW4u
b3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2
X2h2bS5jO2g9OTdhOGM0OTgwN2YxOTJjNDcyMDk1MjVmNTFlNGQ3OWE1MGM2NmNlYztoYj1IRUFE
I2w2MQo+Pj4gdGhlIHRvb2xzdGFjayBvbmx5IHNlbGVjdHMgY2VydGFpbiBIVk0gcGFyYW1zIHRv
IGJlIHNhdmVkIChhbmQKPj4+IHJlc3RvcmVkIGxhdGVyKS4gSSBvcmlnaW5hbGx5IGZvbGxvd2Vk
IHRoZSBzYW1lIGxvZ2ljIGluIHRoZSBmb3JrCj4+PiBjb2RlLXBhdGggYnV0IGFmdGVyIGEgbG90
IG9mIGV4cGVyaW1lbnRzIGl0IGxvb2tzIGxpa2UgaXQncyBhY3R1YWxseQo+Pj4gT0sgdG8gZ3Jh
YiBhbGwgcGFyYW1zIGJ1dCBvbmx5IGNhbGwgc2V0X3BhcmFtIG9uIHRoZSBvbmVzIHRoYXQgaGF2
ZSBhCj4+PiBub24temVybyB2YWx1ZS4gU28gc2V0dGluZyBzb21lIHBhcmFtcyB3aXRoIGEgemVy
byB2YWx1ZSBoYXMgY2VydGFpbmx5Cj4+PiBsZWFkIHRvIGNyYXNoZXMsIGJ1dCBvdGhlcndpc2Ug
aXQgc2VlbXMgdG8gImp1c3Qgd29yayIgdG8gY29weSBhbGwgdGhlCj4+PiByZXN0Lgo+PiBJIHRo
aW5rIHlvdSdyZSB0cnlpbmcgdG8gYXNjcmliZSBhbnkgZm9ybSBvZiBkZXNpZ24vcGxhbiB0byBh
IHN5c3RlbQo+PiB3aGljaCBoYWQgbm9uZS4gOikKPj4KPj4gVGhlIGNvZGUgeW91IHF1b3RlIHdh
cyBsaWtlIHRoYXQgYmVjYXVzZSB0aGF0IGlzIGhvdyBsZWdhY3kgbWlncmF0aW9uCj4+IHdvcmtl
ZC4gIFRoYXQgc2FpZCwgZWxpZGluZyBlbXB0eSByZWNvcmRzIHdhcyBhbiBlZmZvcnQtc2F2aW5n
IGV4ZXJjaXNlCj4+IChhdm9pZCByZWR1bmRhbnQgaHlwZXJjYWxscyBvbiBkZXN0aW5hdGlvbiBz
aWRlKSwgbm90IGJlY2F1c2UgdGhlcmUgd2FzCj4+IGFueSBzdWdnZXN0aW9uIHRoYXQgYXR0ZW1w
dGluZyB0byBleHBsaWNpdGx5IHNldCAwIHdvdWxkIGNyYXNoLgo+Pgo+PiBEbyB5b3UgaGF2ZSBh
bnkgaWRlYSB3aGljaCBwYXJhbSB3YXMgY2F1c2luZyBwcm9ibGVtcz8KPiBZZXMsIEhWTV9QQVJB
TV9JREVOVF9QVCB3YXMgb25lIHN1cmUuIFRoZXJlIG1heSBoYXZlIGJlZW4gb3RoZXJzIChJCj4g
ZG9uJ3QgcmVjYWxsIG5vdykgYnV0IHNpbXBseSBjaGVja2luZyBmb3Igbm9uLXplcm8gdmFsdWUg
YmVmb3JlCj4gY2FsbGluZyBzZXRfcGFyYW0gcmVzb2x2ZWQgZXZlcnl0aGluZy4KCklERU5UX1BU
IGlzIGFuIFdlc3RtZXJlKD8pIHdyaW5rbGUuCgpUaGVyZSB3YXMgb25lIHByb2Nlc3NvciBiYWNr
IGluIHRob3NlIGRheXMgd2hpY2ggc3VwcG9ydGVkIEVQVCwgYnV0CmRpZG4ndCBzdXBwb3J0IFZU
LXggcnVubmluZyBpbiB1bnBhZ2VkIG1vZGUuwqAgVGhlcmVmb3JlLCB3ZSBoYWQgdG8gZmFrZQp1
cCB1bnBhZ2VkIG1vZGUgYnkgcG9pbnRpbmcgdkNSMyBhdCBhbiBpZGVudGl0eSBwYWdldGFibGUg
aW5zaWRlIHRoZQpndWVzdHMgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4KClRoZSBjcmFzaCB3b24n
dCBiZSBmcm9tIHRoZSBJREVOVF9QVCBpdHNlbGYsIGJ1dCB0aGUgcGFnaW5nX3VwZGF0ZV9jcjMo
KQpzaWRlIGVmZmVjdC7CoCBXYXMgaXQgYSBob3N0IGNyYXNoLCBvciBndWVzdCBjcmFzaD8KCn5B
bmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
