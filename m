Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3595126D52
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 20:10:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii196-0006Ff-9e; Thu, 19 Dec 2019 19:07:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tNyU=2J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ii195-0006Fa-A8
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 19:07:35 +0000
X-Inumbo-ID: cf1697ab-2292-11ea-926b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf1697ab-2292-11ea-926b-12813bfff9fa;
 Thu, 19 Dec 2019 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576782454;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nHrz/5nHR5aEJuFilf2rpuS8DmPoJsyKrAGVDngb8mc=;
 b=FwZ0/KvsyJokjEaYtaPiwI4T96LuaucGsPLkXiHXGDpPh0Z24iCpoHZO
 TLWNq3m3KsvOj1Tt2/aipQ9jP6OEjTodPHml+vQ5AFa6iD33LAbo3ARMV
 Owj1SR8hYfI5A8ro6/aeJIILhdK5v5rm17lk+9V2oNYv9HeVdiuamwh+a g=;
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
IronPort-SDR: fp7AQfIZRAMsp5mtDqS7UdCk+pRjolruWf4JqQaKhFgHT2aqYkcJSidLAC2C0R/ZHqwokMpi3W
 MX+JYInaG7GaUuL04ohtQlD0UtUqRMODHtXWl3Ki5yLyam6qYZRof2NLKXU1YgtatW4Uo4yp0n
 JCiq1tnTFNXk7CmVcZyRdSim79USzipgjiQxknePIYHuz/hJwu5FduT/zfw7aRHmpWKTice/pr
 L+ckjlaWAferE4/SZzHcL/dmQJLKqSd0+S0G8TI3xadMyKQ6XEqJBDEfmcYtcNEqlsGYUOfMiQ
 Fcs=
X-SBRS: 2.7
X-MesageID: 9966556
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,332,1571716800"; 
   d="scan'208";a="9966556"
To: Tamas K Lengyel <tamas.lengyel@intel.com>, <xen-devel@lists.xenproject.org>
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
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
Message-ID: <04757755-7464-07d6-9a0f-14f78f20bb4d@citrix.com>
Date: Thu, 19 Dec 2019 19:07:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAxOTo0MCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IGluZGV4
IDYxNGVkNjBmZTQuLjVhM2E5NjJmYmIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9o
dm0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtNDA3MiwxNiArNDA3Miwx
NyBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9ldnRjaG5fdXBjYWxsX3ZlY3RvcigKPiAgfQo+ICAK
PiAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgeGVuX2h2bV9wYXJhbSAq
YSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGluZGV4LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgbmV3X3ZhbHVlKQoKVGhlc2Ug
dHdvIGxpbmVzIGNhbiBiZSBmb2xkZWQgdG9nZXRoZXIuCgo+IEBAIC00MTM0LDEzICs0MTM1LDEx
IEBAIHN0YXRpYyBpbnQgaHZtX2FsbG93X3NldF9wYXJhbShzdHJ1Y3QgZG9tYWluICpkLAo+ICAg
ICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgKPiAr
aW50IGh2bW9wX3NldF9wYXJhbSgKPiAgICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2h2
bV9wYXJhbV90KSBhcmcpCgphbmQgaGVyZS4KCj4gQEAgLTQxNjAsMjMgKzQxNTksNDIgQEAgc3Rh
dGljIGludCBodm1vcF9zZXRfcGFyYW0oCj4gICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkK
PiAgICAgICAgICBnb3RvIG91dDsKPiAgCj4gLSAgICByYyA9IGh2bV9hbGxvd19zZXRfcGFyYW0o
ZCwgJmEpOwo+ICsgICAgcmMgPSBodm1fc2V0X3BhcmFtKGQsIGEuaW5kZXgsIGEudmFsdWUpOwo+
ICsKPiArIG91dDoKPiArICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOwo+ICsgICAgcmV0dXJuIHJj
Owo+ICt9Cj4gKwo+ICtpbnQgaHZtX3NldF9wYXJhbSgKPiArICAgIHN0cnVjdCBkb21haW4gKmQs
Cj4gKyAgICB1aW50MzJfdCBpbmRleCwKPiArICAgIHVpbnQ2NF90IHZhbHVlKQoKYW5kIGFnYWlu
LgoKPiBAQCAtNDM0MCwzNCArNDM1OCwzMyBAQCBzdGF0aWMgaW50IGh2bW9wX3NldF9wYXJhbSgK
PiAgICAgICAgICAgKiAyNTYgYml0cyBpbnRlcnJ1cHQgcmVkaXJlY3Rpb24gYml0bWFwICsgNjRr
IGJpdHMgSS9PIGJpdG1hcAo+ICAgICAgICAgICAqIHBsdXMgb25lIHBhZGRpbmcgYnl0ZSkuCj4g
ICAgICAgICAgICovCj4gLSAgICAgICAgaWYgKCAoYS52YWx1ZSA+PiAzMikgPiBzaXplb2Yoc3Ry
dWN0IHRzczMyKSArCj4gKyAgICAgICAgaWYgKCAodmFsdWUgPj4gMzIpID4gc2l6ZW9mKHN0cnVj
dCB0c3MzMikgKwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDB4MTAwIC8gOCkg
KyAoMHgxMDAwMCAvIDgpICsgMSApCj4gLSAgICAgICAgICAgIGEudmFsdWUgPSAodWludDMyX3Qp
YS52YWx1ZSB8Cj4gKyAgICAgICAgICAgIHZhbHVlID0gKHVpbnQzMl90KXZhbHVlIHwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICgoc2l6ZW9mKHN0cnVjdCB0c3MzMikgKyAoMHgxMDAgLyA4KSAr
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDB4MTAw
MDAgLyA4KSArIDEpIDw8IDMyKTsKCkNhbiB5b3UgcmVpbmRlbnQgdGhlIHN1cnJvdW5kaW5nIGxp
bmVzIHNvIHRoZXkgbGluZSB1cCBhZ2Fpbj8KCj4gQEAgLTQ0MjksNDIgKzQ0NDYsNjAgQEAgc3Rh
dGljIGludCBodm1vcF9nZXRfcGFyYW0oCj4gICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkK
PiAgICAgICAgICBnb3RvIG91dDsKPiAgCj4gLSAgICByYyA9IGh2bV9hbGxvd19nZXRfcGFyYW0o
ZCwgJmEpOwo+ICsgICAgcmMgPSBodm1fZ2V0X3BhcmFtKGQsIGEuaW5kZXgsICZhLnZhbHVlKTsK
PiAgICAgIGlmICggcmMgKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAtICAgIHN3aXRjaCAo
IGEuaW5kZXggKQo+ICsgICAgcmMgPSBfX2NvcHlfdG9fZ3Vlc3QoYXJnLCAmYSwgMSkgPyAtRUZB
VUxUIDogMDsKPiArCj4gKyAgICBIVk1fREJHX0xPRyhEQkdfTEVWRUxfSENBTEwsICJnZXQgcGFy
YW0gJXUgPSAlIlBSSXg2NCwKPiArICAgICAgICAgICAgICAgIGEuaW5kZXgsIGEudmFsdWUpOwo+
ICsKPiArIG91dDoKPiArICAgIHJjdV91bmxvY2tfZG9tYWluKGQpOwo+ICsgICAgcmV0dXJuIHJj
Owo+ICt9Cj4gKwo+ICtpbnQgaHZtX2dldF9wYXJhbSgKPiArICAgIHN0cnVjdCBkb21haW4gKmQs
Cj4gKyAgICB1aW50MzJfdCBpbmRleCwKPiArICAgIHVpbnQ2NF90ICp2YWx1ZSkKCkZvbGQuCgo+
ICt7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICsgICAgaWYgKCBpbmRleCA+PSBIVk1fTlJfUEFSQU1T
IHx8ICF2YWx1ZSApCgpObyBuZWVkIGZvciAhdmFsdWUuwqAgSXQgaGFkIGJldHRlciBvbmx5IGV2
ZXIgcG9pbnQgb250byB0aGUgaHlwZXJ2aXNvcgpzdGFjayBub3cgdGhhdCB0aGlzIGlzIGFuIGlu
dGVybmFsIGZ1bmN0aW9uLgoKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
aHZtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+IGluZGV4IDFkN2I2NmY5Mjcu
LmE2ZjRhZTc2YTEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+IEBAIC0zMzUsNiArMzM1LDEw
IEBAIHVuc2lnbmVkIGxvbmcgaHZtX2NyNF9ndWVzdF92YWxpZF9iaXRzKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQsIGJvb2wgcmVzdG9yZSk7Cj4gIGJvb2wgaHZtX2ZsdXNoX3ZjcHVfdGxiKGJvb2wg
KCpmbHVzaF92Y3B1KSh2b2lkICpjdHh0LCBzdHJ1Y3QgdmNwdSAqdiksCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKmN0eHQpOwo+ICAKPiArLyogQ2FsbGVyIG11c3QgaG9sZCBkb21h
aW4gbG9ja3MgKi8KCkhvdyBhYm91dCBhc3NlcnRpbmcgc28/CgpObyBtYWpvciBwcm9ibGVtcyBz
byBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
