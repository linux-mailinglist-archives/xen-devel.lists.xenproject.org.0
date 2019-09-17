Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01176B5635
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 21:34:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAJCg-0005Uc-Ih; Tue, 17 Sep 2019 19:31:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlRc=XM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAJCe-0005UP-S8
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 19:31:56 +0000
X-Inumbo-ID: ce9a3b24-d981-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce9a3b24-d981-11e9-b76c-bc764e2007e4;
 Tue, 17 Sep 2019 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568748716;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=pmdgI6ECkjz9Fpp7G6h45D7MxM1w//SINXNLOnYlmTY=;
 b=Pl4oSB2VBZCenA3xxfXtavFKhN5/vgfrE14UNukQwhstA+42b7jyKW2P
 mo0Gcrdh4IXyVBs0kHrsUaT7B3oSkti25dm4Nz8FvIgloOqCSyCGKjtLp
 c6CPmRTnbmeyNFD2eCKK5257P4I3Aqs+/LE/YVL+KxjroYu86X+xl4WYw 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9pgxwomlIIycOycn36z4j8365drHJ6v7KWZ5JoqpO/5yIYZMOYLK5BaKPyS/n1b0GBa3glfcqW
 SYlvTPRa4iEcZOV7qO9AN7bOdn12gc5n/jh1qoOadFTrH1P5QUSyvXK+A3zbQAs32/+orHp1gx
 JrRE0A1sYzxXcl4LhfB7ZGDhvGpOiLeYfrsv/nL96J24w5DGJruFseDq1tv5FeVWbsBw5bzNuh
 LpjBSZ36++uHeDgL7cldhl3yBz+7Voyb3U5xXTNT+luWCfizpczvzi/J5SHhaZV91H48+qucEH
 B2U=
X-SBRS: 2.7
X-MesageID: 5750853
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5750853"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <8e2aae32-917c-8035-1aef-8b47c321e42b@suse.com>
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
Message-ID: <9259c3e4-22e4-0e28-d89d-7e9c259411c5@citrix.com>
Date: Tue, 17 Sep 2019 20:31:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8e2aae32-917c-8035-1aef-8b47c321e42b@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 4/9] x86/HVM: move NOFLUSH handling out
 of hvm_set_cr3()
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDkvMjAxOSAwNzoxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIGJpdCBpcyBtZWFu
aW5nZnVsIG9ubHkgZm9yIE1PVi10by1DUjMgaW5zbnMsIG5vdCBhbnl3aGVyZSBlbHNlLCBpbgo+
IHBhcnRpY3VsYXIgbm90IHdoZW4gbG9hZGluZyBuZXN0ZWQgZ3Vlc3Qgc3RhdGUuCgpJJ3ZlIGZv
dW5kIGEgZm9vdG5vdGUgZm9yICIyNi4zLjEuMSBDaGVja3Mgb24gR3Vlc3QgQ29udHJvbCBSZWdp
c3RlcnMsCkRlYnVnIFJlZ2lzdGVycywgYW5kIE1TUnMiIHN0YXRpbmc6CgoiQml0IDYzIG9mIHRo
ZSBDUjMgZmllbGQgaW4gdGhlIGd1ZXN0LXN0YXRlIGFyZWEgbXVzdCBiZSAwLiBUaGlzIGlzIHRy
dWUKZXZlbiB0aG91Z2gsIElmIENSNC5QQ0lERSA9IDEsIGJpdCA2MyBvZiB0aGUgc291cmNlIG9w
ZXJhbmQgdG8gTU9WIHRvCkNSMyBpcyB1c2VkIHRvIGRldGVybWluZSB3aGV0aGVyIGNhY2hlZCB0
cmFuc2xhdGlvbiBpbmZvcm1hdGlvbiBpcwppbnZhbGlkYXRlZC4iCgpUaGlzIGlzIGZhaXJseSBj
bGVhciB0aGF0IGF0dGVtcHRpbmcgdG8gc2V0IHRoZSBOT0ZMVVNIIGJpdCBpbiB0aGUgVk1DUwpp
cyBnb2luZyB0byBjYXVzZSBwcm9ibGVtcywgYW5kIEkgc2VlbSB0byByZWNhbGwgc29tZSB2bWVu
dHJ5IGZhaWx1cmVzCnJlcG9ydGVkIGluIHRoZSBwYXN0IG9uIHRoZSBzdWJqZWN0LgoKV2hhdCBp
dCBpc24ndCBzbyBjbGVhciBvbiBpcyB3aGV0aGVyIHdlIHdpbGwgZXZlciBmaW5kIGEgVk1DUyB3
aXRoIHRoZQpOT0ZMVVNIIGJpdCBzZXQgaW4gZ3Vlc3Qgc3RhdGUuwqAgU2FkbHksIHRoZSB2bWV4
aXQgc2lkZSBvZiB0aGUgYWJvdmUKY29tbWVudCAod2hpY2ggd2FzIGZvciB2bWVudHJ5KSBzaW1w
bHkgc2F5cyAiVGhlIGNvbnRlbnRzIG9mIC4uLiBDUjMsCi4uLiBhcmUgc2F2ZWQgaW50byB0aGUg
Y29ycmVzcG9uZGluZyBmaWVsZHMuIgoKQW55IHdheSwgSSdtIGluIHByaW5jaXBsZSBvayB3aXRo
IHRoZSBjaGFuZ2UsIGV4Y2VwdCBmb3IuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0u
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMjI4MiwxMiArMjI4NywxMSBA
QCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCj4gICAgICByZXR1cm4g
WDg2RU1VTF9PS0FZOwo+ICB9Cj4gIAo+IC1pbnQgaHZtX3NldF9jcjModW5zaWduZWQgbG9uZyB2
YWx1ZSwgYm9vbCBtYXlfZGVmZXIpCj4gK2ludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZh
bHVlLCBib29sIG5vZmx1c2gsIGJvb2wgbWF5X2RlZmVyKQo+ICB7Cj4gICAgICBzdHJ1Y3QgdmNw
dSAqdiA9IGN1cnJlbnQ7Cj4gICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwo+ICAgICAgdW5z
aWduZWQgbG9uZyBvbGQgPSB2LT5hcmNoLmh2bS5ndWVzdF9jclszXTsKPiAtICAgIGJvb2wgbm9m
bHVzaCA9IGZhbHNlOwo+ICAKPiAgICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KHYtPmRv
bWFpbi0+YXJjaC5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5hYmxlZCAmCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtb25pdG9yX2N0cmxyZWdfYml0bWFzayhWTV9FVkVOVF9YODZf
Q1IzKSkgKQo+IEBAIC0yMjk5LDE3ICsyMzAzLDEyIEBAIGludCBodm1fc2V0X2NyMyh1bnNpZ25l
ZCBsb25nIHZhbHVlLCBib28KPiAgICAgICAgICAgICAgLyogVGhlIGFjdHVhbCB3cml0ZSB3aWxs
IG9jY3VyIGluIGh2bV9kb19yZXN1bWUoKSwgaWYgcGVybWl0dGVkLiAqLwo+ICAgICAgICAgICAg
ICB2LT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRhLmRvX3dyaXRlLmNyMyA9IDE7Cj4gICAgICAg
ICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuY3IzID0gdmFsdWU7Cj4gKyAgICAg
ICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuY3IzX25vZmx1c2ggPSBub2ZsdXNo
OwoKLi4uIHRoaXMsIHdoaWNoIEknbSBwcmV0dHkgc3VyZSBicmVha3MgdGhlIHJlcG9ydGluZyBv
ZiBub2ZsdXNoIG1vdiB0bwpjcjMncy7CoCBUaGUgc2VtYW50aWNzIG9mIHRoZSBWTUkgaG9vayBp
cyAidGhlIGd1ZXN0IHRyaWVkIHRvIHdyaXRlIHRoaXMKdmFsdWUgdG8gY3IzIiwgd2hpY2ggc2hv
dWxkIGluY2x1ZGUgdGhlIG5vZmx1c2ggYml0IGluIGl0cyBhcmNoaXRlY3R1cmFsCnBvc2l0aW9u
LsKgIEkgc3VzcGVjdCBpdCBhbHNvIGJyZWFrcyBhIHJlcGx5IHdpdGggdGhlIG5vZmx1c2ggYml0
IHNldCwKYmVjYXVzZSBJIGRvbid0IHNlZSBhbnkgd2F5IHRoYXQgaXMgZmVkIGJhY2sgZnJvbSB0
aGUgaW50cm9zcGVjdGluZyBhZ2VudC4KCkNDJ2luZyB0aGUgSW50cm9zcGVjdGlvbiBtYWludGFp
bmVycyBmb3IgdGhlaXIgdmlldy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
