Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769AB9A425
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 02:08:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0x3Y-0001pC-0x; Fri, 23 Aug 2019 00:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2Rn6=WT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i0x3W-0001p7-DL
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 00:03:50 +0000
X-Inumbo-ID: 7a8d00b8-c539-11e9-ade0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a8d00b8-c539-11e9-ade0-12813bfff9fa;
 Fri, 23 Aug 2019 00:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566518627;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Z8XtsOL5W/Gis9dsedJA9p42hca23hSv+J64576xKlE=;
 b=YfbqvYIcLXI0jrgJDsp433ryqH5C/A/LYudoCry2YWcq67bq4zIaHzbQ
 50P6enmXULK3N/0k7eAYuiwq/aypBphPxG9LrHmf5mXXZfcRm5SNmbG8U
 ThRsk0E+kkZf4TH4Niqy/P+O880sbQ/MjIJ1VdcUB5ChzN5smYq9vyuJ5 o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1Kap/e80wqBKX5nhwcb8IDgDPuI9FircXt5gB/4kSSeSJGfksUAxCR8cOcBzpsnBOMjHZ3sMz5
 b+cjM4WJ/YIzv9P0auedJMFsgAZf39O0BrpaD1Sy7cjbWvEG5QqSU6TrEXEFbmlD1vvaHz1uCN
 u47dg4yYDoMkitqZm+edRso0OmGhK59c7kisqFRrIlDPJHtUUqK2kLi7FlSzXj8emd530arUFJ
 kZMvgLKYAbmseQ9Sz6yQmrQKGGxpQC9Ke/5thdkE4oYiA4tqbYeyVaB2IjWXClp0MTFTbcBNjL
 kPI=
X-SBRS: 2.7
X-MesageID: 4800059
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,419,1559534400"; 
   d="scan'208";a="4800059"
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
 <587225E8-C0DE-40BA-B39E-E30F9CE69B92@gmail.com>
 <74cb4fb4-9983-0000-9dbb-8fc24921a372@citrix.com>
 <CABfawhm-8Y1X8KZutdBWzGCqUmK__2=g3nEFsN+7oLUMyf-2ow@mail.gmail.com>
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
Message-ID: <42da053f-537b-95ce-85b1-bc754fc26d22@citrix.com>
Date: Fri, 23 Aug 2019 01:03:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhm-8Y1X8KZutdBWzGCqUmK__2=g3nEFsN+7oLUMyf-2ow@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>, "Johnson, Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDgvMjAxOSAwMDowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgQXVn
IDIyLCAyMDE5IGF0IDQ6NDAgUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+IE9uIDIyLzA4LzIwMTkgMjE6NTcsIFJpY2ggUGVyc2F1ZCB3cm90ZToK
Pj4+PiBPbiBBdWcgMjIsIDIwMTksIGF0IDA5OjUxLCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+Pgo+Pj4+PiBPbiAyMi8wOC8yMDE5IDAzOjA2LCBK
b2huc29uLCBFdGhhbiB3cm90ZToKPj4+Pj4KPj4+Pj4gRm9yIEhWTSwgb2J2aW91c2x5IGFueXRo
aW5nIHRoYXQgY2FuJ3QgYmUgdmlydHVhbGl6ZWQgbmF0aXZlbHkgYnkgdGhlCj4+Pj4+IGhhcmR3
YXJlIG5lZWRzIHRvIGJlIGVtdWxhdGVkIGJ5IFhlbi9RRU1VIChzaW5jZSB0aGUgZ3Vlc3Qga2Vy
bmVsIGlzbid0Cj4+Pj4+IGV4cGVjdGVkIHRvIGJlIGNvb3BlcmF0aXZlIHRvIGlzc3VlIFBWIGh5
cGVyY2FsbHMgaW5zdGVhZCk7IGJ1dCBJIHdvdWxkCj4+Pj4+IGV4cGVjdCBlbXVsYXRpb24gdG8g
YmUgbGltaXRlZCB0byB0aGUgcmVsYXRpdmVseSBzbWFsbCBzdWJzZXQgb2YgdGhlIElTQQo+Pj4+
PiB0aGF0IFZNWC9TVk0gY2FuJ3QgbmF0aXZlbHkgdmlydHVhbGl6ZS4gWWV0IEkgc2VlIHRoYXQg
eDg2X2VtdWxhdGUuYwo+Pj4+PiBzdXBwb3J0cyBlbXVsYXRpbmcganVzdCBhYm91dCBldmVyeXRo
aW5nLiBVbmRlciB3aGF0IGNpcmN1bXN0YW5jZXMgZG9lcwo+Pj4+PiBYZW4gYWN0dWFsbHkgbmVl
ZCB0byBwdXQgYWxsIHRoYXQgZW11bGF0aW9uIGNvZGUgdG8gdXNlPwo+Pj4+IEludHJvc3BlY3Rp
b24sIGFzIEkgc2FpZCBlYXJsaWVyLCB3aGljaCBpcyBwb3RlbnRpYWxseSBhbnkgaW5zdHJ1Y3Rp
b24uCj4+PiBDb3VsZCBpbnRyb3NwZWN0aW9uLXNwZWNpZmljIGVtdWxhdGlvbiBjb2RlIGJlIGRp
c2FibGVkIHZpYSBLQ29uZmlnPwo+PiBOb3QgcmVhbGx5Lgo+Pgo+PiBBdCB0aGUgcG9pbnQgc29t
ZXRoaW5nIGhhcyB0cmFwcGVkIGZvciBlbXVsYXRpb24sIHdlIG11c3QgY29tcGxldGUgaXQgaW4K
Pj4gYSBtYW5uZXIgY29uc2lzdGVudCB3aXRoIHRoZSB4ODYgYXJjaGl0ZWN0dXJlLCBvciB0aGUg
Z3Vlc3Qgd2lsbCBjcmFzaC4KPj4KPj4gSWYgeW91IGRvbid0IHdhbnQgZW11bGF0aW9uIGZyb20g
aW50cm9zcGVjdGlvbiwgZG9uJ3Qgc3RhcnQKPj4gaW50cm9zcGVjdGluZyBpbiB0aGUgZmlyc3Qg
cGxhY2UsIGF0IHdoaWNoIHBvaW50IGd1ZXN0IGFjdGlvbnMgd29uJ3QKPj4gdHJhcCBpbiB0aGUg
Zmlyc3QgcGxhY2UuCj4gVGhhdCdzIGluY29ycmVjdCwgeW91IGNhbiBhYnNvbHV0ZWx5IGRvIGlu
dHJvc3BlY3Rpb24gd2l0aCB2bV9ldmVudHMKPiBhbmQgTk9UIGVtdWxhdGUgYW55dGhpbmcuIFlv
dSBjYW4gaGF2ZSBhbHRwMm0gaW4gcGxhY2Ugd2l0aCBkaWZmZXJlbnQKPiBtZW1vcnkgcGVybWlz
c2lvbnMgc2V0IGluIGRpZmZlcmVudCB2aWV3cyBhbmQgc3dpdGNoIGJldHdlZW4gdGhlIHZpZXdz
Cj4gd2l0aCBNVEYgZW5hYmxlZCB0byBhbGxvdyB0aGUgc3lzdGVtIHRvIGNvbnRpbnVlIGV4ZWN1
dGluZy4gVGhpcyBkb2VzCj4gbm90IHJlcXVpcmUgZW11bGF0aW9uIG9mIGFueXRoaW5nLiBJIHdv
dWxkIGJlIGJlaGluZCBhIEtDT05GSUcgb3B0aW9uCj4gdGhhdCB0dXJucyBvZmYgcGFydHMgb2Yg
dGhlIGVtdWxhdG9yIHRoYXQgYXJlIG9ubHkgdXNlZCBieSBhIHN1YnNldCBvZgo+IGludHJvc3Bl
Y3Rpb24gdXNlY2FzZXMuIEJ1dCB0aGlzIHNob3VsZCBub3QgYmUgYW4gb3B0aW9uIHRoYXQgdHVy
bnMKPiBvZmYgaW50cm9zcGVjdGlvbiBpdHNlbGYsIHRoZSB0d28gdGhpbmdzIGFyZSBOT1QgaW50
ZXItZGVwZW5kZW50LgoKSSBmZWFyIHdlIGFyZSBnZXR0aW5nIHNsaWdodGx5IG9mZiB0cmFjayBo
ZXJlLCBidXQgSSdsbCBiaXRlLi4uCgpJbnRyb3NwZWN0aW9uIGlzIGEgeW91bmcgdGVjaG5vbG9n
eSwgd2l0aCB2YXN0IHBvdGVudGlhbC7CoCBUaGlzIGlzIGdyZWF0Ci0gaXQgbWVhbnMgdGhlcmUg
aXMgYSBsb3Qgb2Ygbm92ZWwgUiZEIGdvaW5nIGludG8gaXQuwqAgSXQgZG9lc24ndCBtZWFuCnRo
YXQgYWxsIGFzcGVjdHMgb2YgaXQgYXJlIHZpYWJsZSBmb3IgdXNlIGJ5IGN1c3RvbWVycyB0b2Rh
eS4KCkknbGwgaGF2ZSBhbiBlYXNpZXIgdGltZSBiZWxpZXZpbmcgdGhhdCBhbHRwMm0gaXMgY2xv
c2UgdG8gYmVpbmcKcHJvZHVjdGlvbiByZWFkeSB3aGVuIEkgbm8gbG9uZ2VyIGZpbmUgc2VjdXJp
dHktcmVsZXZhbnQgYnVncyBpbiBpdApldmVyeSB0aW1lIEkgZ28gbG9va2luZywgYW5kIHNvbWVv
bmUgaGFzIG1hZGUgYSBjb2hlcmVudCBhdHRlbXB0IHRvCmp1c3RpZnkgaXQgYmVpbmcgc2VjdXJp
dHkgc3VwcG9ydGVkLgoKTm9uZSBvZiB0aGlzIGFsdGVycyB0aGUgZmFjdCB0aGF0IGludHJvc3Bl
Y3Rpb24gaW4gZ2VuZXJhbCBpcyBvbmUga2V5CmZhY3RvciBhcyB0byB3aHkgd2UgaGF2ZSBhIG1v
c3RseS1jb21wbGV0ZSB4ODZfZW11bGF0ZSgpIChldmVuIGlmICJ4ODYKZW11bGF0ZSIgaXMgYSBz
bGlnaHRseSBwb29yIGNob2ljZSBvZiBuYW1lLsKgICJkZWNvZGUgYW5kIHJlcGxheSIgd291bGQK
YmUgYSBmYXIgbW9yZSBhcHQgZGVzY3JpcHRpb24gb2Ygd2hhdCBpdCBkb2VzIGZvciB0aGUgbWFq
b3JpdHkgb2YKaW5zdHJ1Y3Rpb25zLikKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
