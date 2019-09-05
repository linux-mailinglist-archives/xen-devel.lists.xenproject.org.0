Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658BDA9D9D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 10:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5nWU-0002T0-EF; Thu, 05 Sep 2019 08:53:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QhBR=XA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i5nWS-0002Sv-SP
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 08:53:44 +0000
X-Inumbo-ID: a93e3fc3-cfba-11e9-abc1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a93e3fc3-cfba-11e9-abc1-12813bfff9fa;
 Thu, 05 Sep 2019 08:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567673623;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=cE1tbAY7bfVoXddkfPLwyXf4JEsq3gfhMlByu6m1dCA=;
 b=Uuo+UP7g+J9/C4gxd3VdrDxGw9fqUHwmVCK7GS2IOeDTC4+jzAuXeIZS
 P0oUJsOJOtzQTL7RqT4bq5isv1jZPsUJ54ub7NwEVn3OGeObWISE+NHZy
 4cHtQVOrcUsEAqMlfzLfs3EeeV3UvkOHRUVqV9nPrIvPoriAa9kk86CBm E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sbfYnof6OIeWWwBnFZjYunEfVcwLfpGhULPeWErs8XHuJYrYfgr9QSTl2Tx4fZhoMGQKC9RkqQ
 uUSA6AV9sYGgC4mAGoHC+2o1Ulk6O3vyxqlTJDrk3gDC8byG2ANrnGFgYASwxRMkMSEcjmcSaC
 6HFsASNxb7ll6pO37bcG8O5Ckk1U5MX+P4GaZVchJ/N8io56daSRE0sOocktN7V6oBVvvPZMSV
 MwlFzq8UG9DJF0thbufISyZSVCg8jKqWQJ6J2D03ZTCoCV5LZoEKJAtD8bjMSeNSx2GZyBX4+H
 kzk=
X-SBRS: 2.7
X-MesageID: 5171104
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5171104"
To: Peter Zijlstra <peterz@infradead.org>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905082647.GZ2332@hirez.programming.kicks-ass.net>
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
Message-ID: <4de91a14-2051-197e-6ab0-beb2538c40f9@citrix.com>
Date: Thu, 5 Sep 2019 09:53:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905082647.GZ2332@hirez.programming.kicks-ass.net>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Randy Dunlap <rdunlap@infradead.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDkvMjAxOSAwOToyNiwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MDUsIDIwMTkgYXQgMDg6NTQ6MTdBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPgo+PiBJ
IGRvbid0IGtub3cgaWYgeW91J3ZlIHNwb3R0ZWQsIGJ1dCB0aGUgcHJlZml4IGlzIGEgdWQyYSBp
bnN0cnVjdGlvbgo+PiBmb2xsb3dlZCBieSAneGVuJyBpbiBhc2NpaS4KPj4KPj4gVGhlIEtWTSB2
ZXJzaW9uIHdhcyBhZGRlZCBpbiBjL3MgNmM4NmVlZGMyMDZkZDFmOWQzN2EyNzk2ZmFhOGU2ZjIy
NzgyMTVkMgo+IFdoaWxlIHRoZSBYZW4gb25lIGRpc2Fzc2VibGVzIHRvIHZhbGlkIGluc3RydWN0
aW9ucywgdGhhdCBLVk0gb25lIGRvZXMKPiBub3Q6Cj4KPiAJLnRleHQKPiB4ZW46Cj4gCXVkMjsg
LmFzY2lpICJ4ZW4iCj4ga3ZtOgo+IAl1ZDI7IC5hc2NpaSAia3ZtIgo+Cj4gZGlzYXNzZW1ibGVz
IGxpa2U6Cj4KPiAwMDAwMDAwMDAwMDAwMDAwIDx4ZW4+Ogo+ICAgIDA6ICAgMGYgMGIgICAgICAg
ICAgICAgICAgICAgdWQyCj4gICAgMjogICA3OCA2NSAgICAgICAgICAgICAgICAgICBqcyAgICAg
NjkgPGt2bSsweDY0Pgo+ICAgIDQ6ICAgNmUgICAgICAgICAgICAgICAgICAgICAgb3V0c2IgICVk
czooJXJzaSksKCVkeCkKPiAwMDAwMDAwMDAwMDAwMDA1IDxrdm0+Ogo+ICAgIDU6ICAgMGYgMGIg
ICAgICAgICAgICAgICAgICAgdWQyCj4gICAgNzogICA2YiAgICAgICAgICAgICAgICAgICAgICAu
Ynl0ZSAweDZiCj4gICAgODogICA3NiA2ZCAgICAgICAgICAgICAgICAgICBqYmUgICAgNzcgPGt2
bSsweDcyPgo+Cj4gV2hpY2ggaXMgYSBiaXQgdW5mb3J0dW5hdGUgSSBzdXBwb3NlLiBBdCBsZWFz
dCB0aGV5IGRvbid0IGFwcGVhciB0bwo+IGNvbnN1bWUgZnVydGhlciBieXRlcy4KCkl0IGRvZXMg
d2hlbiB5b3UgZ2l2ZSBvYmpkdW1wIG9uZSBleHRyYSBieXRlIHRvIGxvb2sgYXQuCgowMDAwMDAw
MDAwMDAwMDA1IDxrdm0+OgrCoMKgIDU6wqDCoMKgIDBmIDBiwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIMKgwqDCoCB1ZDLCoMKgwqAKwqDCoCA3OsKgwqDCoCA2YiA3NiA2ZCAwMMKgwqDC
oMKgwqDCoMKgwqDCoCDCoMKgwqAgaW11bMKgwqAgJDB4MCwweDZkKCVyc2kpLCVlc2kKCkkgZGlk
IHRyeSB0byBwb2ludCBvdXQgdGhhdCB0aGlzIHByb3BlcnR5IHNob3VsZCBoYXZlIGJlZW4gY2hl
Y2tlZApiZWZvcmUgc2V0dGxpbmcgb24gJ2t2bScgYXMgdGhlIHN0cmluZy4KCkFzIGZvciB0aGUg
WGVuIHByZWZpeCwgaXQncyBpbnRyb2R1Y3Rpb24gcHJlLWRhdGVzIG1lIHN1YnN0YW50aWFsbHks
IGFuZApJIGRvbid0IGtub3cgd2hldGhlciB0aGUgZGlzYXNzZW1ibHkgd2FzIGNvbnNpZGVyZWQs
IG9yIHdlIGp1c3QgZ290IGx1Y2t5LgoKSU1PLCB0aGUgc3RyaW5nICdYZW4nIHdvdWxkIHdvdWxk
IGhhdmUgYmVlbiBzaWdodGx5IG5pY2VyCgowMDAwMDAwMDAwMDAwMDA1IDxYZW4+OgrCoMKgIDU6
wqDCoMKgIDBmIDBiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgwqDCoCB1ZDLCoMKg
wqAKwqDCoCA3OsKgwqDCoCA1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDC
oMKgwqAgcG9wwqDCoMKgICVyYXgKwqDCoCA4OsKgwqDCoCA2NSA2ZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCDCoMKgwqAgb3V0c2LCoCAlZ3M6KCVyc2kpLCglZHgpCgpidXQgd2UncmUg
MTMgeWVhcnMgdG9vIGxhdGUgdG8gYW1lbmQgdGhpcy4KCj4gSSBrbm93IGl0IGlzIHdhdGVyIHVu
ZGVyIHRoZSBicmlkZ2UgYXQgdGhpcyBwb2ludDsgYnV0IHlvdSBjb3VsZCd2ZSB1c2VkCj4gVUQx
IHdpdGggYSBkaXNwbGFjZW1lbnQgd2l0aCBzb21lICd1bmxpa2VseScgdmFsdWVzLiBUaGF0IHdh
eSBpdAo+IHdvdWxkJ3ZlIGRlY29kZWQgdG8gYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uCj4KPiBTb21l
dGhpbmcgbGlrZToKPgo+IAl1ZDEgICAgMHg2ZTY1NzgoJXJheCksJXJheAo+Cj4gd2hpY2ggc3Bl
bGxzIG91dCAieGVuXDAiIGluIHRoZSBkaXNwbGFjZW1lbnQ6Cj4KPiAJNDggMGYgYjkgODAgNzgg
NjUgNmUgMDAKCjopCgpJIHNlZW0gdG8gcmVjYWxsIFVEMCBhbmQgVUQxIGJlaW5nIHZlcnkgbGF0
ZSB0byB0aGUgZG9jdW1lbnRhdGlvbiBwYXJ0eS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
