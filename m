Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B09011D5A8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:32:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTEh-0000C9-Gs; Thu, 12 Dec 2019 18:30:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Md0W=2C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifTEg-0000Bu-5V
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:30:50 +0000
X-Inumbo-ID: 84bb052c-1d0d-11ea-8deb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84bb052c-1d0d-11ea-8deb-12813bfff9fa;
 Thu, 12 Dec 2019 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175450;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oDC29s1cjUK47V5WR4pSVlZyVkIXaonBaMqfUiL58g0=;
 b=aKsoSe9n3HNZQKCfwiqvCVin9XPl7hrkp/F81duwWQwnEOzzjhKwTTDf
 DLG3YGI5/XOpNeuLDpfg6ZWv53slgfnyEIWSSmEtyBmxhH9+swppRGJYr
 e4n/JT9PtAROdpi7eAXID2+iYwK8OcFs+26sBZKmpwd6Ra9hb0G4houuj M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: bgFNrsrS7S4HOct1EiGEVeOewpzmkr34rArEwSdBoVdhBLxEDzpMr63y/Y8Cw01FBkgiuUx/c9
 cmSn7erk7U2RVmf9epTxL1w/htyv+hAOKKaxLCnYNAq+wBPIMqiS4GnldTCHFtLyEE0TwUYSRY
 mx0oTtzedww2YTQO2Ah7rlUPc/phQQ5xuOPmuhlHCDs0lSOcI74yIG52Ady5auZtmGAk8wPXNJ
 sySTG8bswhbR4aSqoGuoOxZiLUSLksmIM0yqA2SgyKp6wLeNlveN+EtkB2AyIpCBr2eRUQIoOh
 I/c=
X-SBRS: 2.7
X-MesageID: 9612139
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9612139"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-2-anthony.perard@citrix.com>
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
Message-ID: <f5ae052d-44ed-d191-48a5-28f6d4f9f337@citrix.com>
Date: Thu, 12 Dec 2019 18:30:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212182740.2190199-2-anthony.perard@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH 1/8] Config.mk: Remove unused setvar_dir
 macro
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTIvMjAxOSAxODoyNywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gQW5kIHJlbW92ZSBh
bGwgbWVudGlvbiBvZiBpdCBpbiBkb2NzLiBJdCBoYXNuJ3QgYmVlbiB1c2VkIHNpbmNlCj4gOWVh
ZDlhZmNiOTM1ICgiQWRkIGNvbmZpZ3VyZSAtLXdpdGgtc3lzY29uZmlnLWxlYWYtZGlyPVNVQkRJ
UiB0byBzZXQKPiBDT05GSUdfTEVBRl9ESVIiKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkg
UEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+IC0tLQo+ICBDb25maWcubWsgICAgICAg
ICAgICAgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KPiAgZG9jcy9taXNjL2Rpc3Ryb19tYXBwaW5n
LnR4dCB8ICA1ICsrLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxNCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Db25maWcubWsgYi9Db25maWcubWsKPiBpbmRl
eCA1NGU0YjcwOTFiZmMuLjg3NjgzOThkNWVjZSAxMDA2NDQKPiAtLS0gYS9Db25maWcubWsKPiAr
KysgYi9Db25maWcubWsKPiBAQCAtNjgsMTcgKzY4LDYgQEAgREVQU19STSA9ICQoREVQUykgJChE
RVBTX0lOQ0xVREUpCj4gIGluY2x1ZGUgJChYRU5fUk9PVCkvY29uZmlnLyQoWEVOX09TKS5tawo+
ICBpbmNsdWRlICQoWEVOX1JPT1QpL2NvbmZpZy8kKFhFTl9UQVJHRVRfQVJDSCkubWsKPiAgCj4g
LSMgYXJndW1lbnRzOiB2YXJpYWJsZSwgY29tbW9uIHBhdGggcGFydCwgcGF0aCB0byB0ZXN0LCBp
ZiB5ZXMsIGlmIG5vCj4gLWRlZmluZSBzZXR2YXJfZGlyCj4gLSAgaWZuZGVmICQoMSkKPiAtICAg
IGlmbmVxICgsJCh3aWxkY2FyZCAkKDIpJCgzKSkpCj4gLSAgICAgICQoMSkgPz0gJCgyKSQoNCkK
PiAtICAgIGVsc2UKPiAtICAgICAgJCgxKSA/PSAkKDIpJCg1KQo+IC0gICAgZW5kaWYKPiAtICBl
bmRpZgo+IC1lbmRlZgo+IC0KPiAgaWZuZXEgKCQoRVhUUkFfUFJFRklYKSwpCj4gIEVYVFJBX0lO
Q0xVREVTICs9ICQoRVhUUkFfUFJFRklYKS9pbmNsdWRlCj4gIEVYVFJBX0xJQiArPSAkKEVYVFJB
X1BSRUZJWCkvbGliCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9kaXN0cm9fbWFwcGluZy50eHQg
Yi9kb2NzL21pc2MvZGlzdHJvX21hcHBpbmcudHh0Cj4gaW5kZXggMmU0NjU5MjcyOGUzLi41OTli
NmZkMWU5MTIgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9taXNjL2Rpc3Ryb19tYXBwaW5nLnR4dAo+ICsr
KyBiL2RvY3MvbWlzYy9kaXN0cm9fbWFwcGluZy50eHQKCkl0IGxvb2tzIGxpa2UgdGhpcyBpcyBl
bnRpcmVseSBvYnNvbGV0ZSBzaW5jZSB3ZSBzd2l0Y2hlZCB0byB1c2luZwouL2NvbmZpZ3VyZS4K
Ck1pbmQgaWYgd2UgZXhwYW5kIHRoZSBwYXRjaCB0byBraWxsIHRoaXMgZmlsZSBmdWxseT/CoCAo
Q2FuIGJlIHNvcnRlZCBvbgpjb21taXQgaWYgeW91IHdhbnQuKQoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
