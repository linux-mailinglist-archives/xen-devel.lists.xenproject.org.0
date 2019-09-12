Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26385B09D7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 10:03:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8K1K-0006s7-Sa; Thu, 12 Sep 2019 08:00:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8K1J-0006Sb-GZ
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 08:00:01 +0000
X-Inumbo-ID: 515db214-d533-11e9-83e3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 515db214-d533-11e9-83e3-12813bfff9fa;
 Thu, 12 Sep 2019 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568275200;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=r58jPPtLPZkw+NJs+q5q8VQlzj/CS8La6pAPGSnjprg=;
 b=F/D7o1wsATBYGydd9fBNIOjEAKCllIf70v6wEJ8c2mBrktwkLG1SAhOK
 CJ6FgwykrrWwJOmTijWG3s3cRgDy9n/KbMZOOcfPB7B1ilGbwwPvhVGAS
 gMr9ZjXw6hEl1z/pKc+iZ7bYNzltBYjJAjtWrIBWbOrLWfn6LSXIqxkXi s=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FJk56jSb0N2w9ZX+/GgVRKJgZFfIUAdezx3xj+Iqa4KXBwiAnS99Ni3AAKoZqDsYh7PUZgy2fY
 FriMACTu5aj+aSRtsCjWVz2pGJZtvFq8EXwUwsVzcB2KdPaSEWv8/MlvKvvXEx/uBur3wsGiqX
 D+H0ZXwFZkxfi5e+8tT35VKXE2oIp5egjBxsCp7l1RgxKLex0fsZeW+n5i1o/yNpgQcI1vaKYh
 cNC7yBfBZvual6VrZGV2c/Q3J0ZWhrLQIE3B+jqpBHLCBeL+IMYMoeHLzx9xQw/cJnIlMvy26A
 ImI=
X-SBRS: 2.7
X-MesageID: 5469256
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5469256"
To: Jan Beulich <jbeulich@suse.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-2-andrew.cooper3@citrix.com>
 <1bd690aa-bd94-48df-c9a4-c619c02fa408@suse.com>
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
Message-ID: <170fe9e0-bdbe-94d1-cc53-cb4128b3079a@citrix.com>
Date: Thu, 12 Sep 2019 08:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1bd690aa-bd94-48df-c9a4-c619c02fa408@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/8] libx86: Introduce
 x86_cpu_policies_are_compatible()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDkvMjAxOSAwODo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMDkuMjAxOSAy
MjowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhpcyBoZWxwZXIgd2lsbCBldmVudHVhbGx5
IGJlIHRoZSBjb3JlICJjYW4gYSBndWVzdCBjb25maXVyZWQgbGlrZSB0aGlzIHJ1bgo+PiBvbiB0
aGUgQ1BVPyIgbG9naWMuICBGb3Igbm93LCBpdCBpcyBqdXN0IGVub3VnaCBvZiBhIHN0dWIgdG8g
YWxsb3cgdXMgdG8KPj4gcmVwbGFjZSB0aGUgaHlwZXJjYWxsIGludGVyZmFjZSB3aGlsZSByZXRh
aW5pbmcgdGhlIHByZXZpb3VzIGJlaGF2aW91ci4KPj4KPj4gSXQgd2lsbCBiZSBleHBhbmRlZCBh
cyB2YXJpb3VzIG90aGVyIGJpdHMgb2YgQ1BVSUQgaGFuZGxpbmcgZ2V0IGNsZWFuZWQgdXAuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gRnVuZGFtZW50YWxseQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gYnV0IGEgY291cGxlIG9mIHJlbWFya3M6Cj4KPiBGb3Igb25lLCBkZXNwaXRl
IGJlaW5nIGp1c3QgdGVzdGluZyBjb2RlLCBJIHRoaW5rIHRoZSB0d28gdGVzdFtdCj4gYXJyYXlz
IGNvdWxkIGRvIHdpdGggY29uc3RpZmljYXRpb24uCgpTYWRseSB0aGV5IGNhbid0LsKgIEl0IGlz
IGEgY29uc2VxdWVuY2Ugb2Ygc3RydWN0IGNwdV9wb2xpY3kgdXNpbmcKbm9uLWNvbnN0IHBvaW50
ZXJzLgoKSSB0cmllZCBpbnRyb2R1Y2luZyBzdHJ1Y3QgY29uc3RfY3B1X3BvbGljeSBidXQgdGhh
dCBpcyBldmVuIHdvcnNlCmJlY2F1c2UgaXQgcHJvaGliaXRzIG9wZXJhdGluZyBvbiB0aGUgc3lz
dGVtIHBvbGljeSBvYmplY3RzIGluIFhlbi4KCk92ZXJhbGwsIGRyb3BwaW5nIGEgY29uc3QgaW4g
dGhlIHVuaXQgdGVzdHMgdHVybmVkIG91dCB0byBiZSB0aGUgbGVhc3QKYmFkIG9wdGlvbiwgdW5s
ZXNzIHlvdSBoYXZlIGEgcmFkaWNhbGx5IGRpZmZlcmVudCBzdWdnZXN0aW9uIHRvIHRyeS4KCj4K
Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpYi94ODYvY3B1LXBvbGljeS5oCj4+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi9saWIveDg2L2NwdS1wb2xpY3kuaAo+PiBAQCAtMTEsNiArMTEsMjUgQEAg
c3RydWN0IGNwdV9wb2xpY3kKPj4gICAgICBzdHJ1Y3QgbXNyX3BvbGljeSAqbXNyOwo+PiAgfTsK
Pj4gIAo+PiArc3RydWN0IGNwdV9wb2xpY3lfZXJyb3JzCj4+ICt7Cj4+ICsgICAgdWludDMyX3Qg
bGVhZiwgc3VibGVhZjsKPj4gKyAgICB1aW50MzJfdCBtc3I7Cj4+ICt9Owo+PiArCj4+ICsjZGVm
aW5lIElOSVRfQ1BVX1BPTElDWV9FUlJPUlMgeyB+MHUsIH4wdSwgfjB1IH0KPiBJbnN0ZWFkIG9m
IHRoaXMgKGFuZCB1c2luZyBpdCBpbiBldmVyeSBjYWxsZXIpLCBjb3VsZG4ndCB0aGUgZnVuY3Rp
b24KPiBmaWxsIHRoaXMgZmlyc3QgdGhpbmc/IChUaGUgaW5pdGlhbGl6ZXIgaXNuJ3Qgc3RyaWN0
bHkgbmVlZGVkIGFueXdheSwKPiBhcyBjb25zdW1lcnMgYXJlIHN1cHBvc2VkIHRvIGxvb2sgYXQg
dGhlIHN0cnVjdHVyZSBvbmx5IHdoZW4gaGF2aW5nCj4gZ290IGJhY2sgYW4gZXJyb3IgZnJvbSB0
aGUgZnVuY3Rpb24sIGJ1dCBzaW5jZSBlcnJvciBwYXRocyBmaWxsIGp1c3QKPiBhIHN1YnNldCBv
ZiB0aGUgZmllbGRzIEkgY2FuIHNlZSBob3cgcHJlLWZpbGxpbmcgdGhlIHdob2xlIHN0cnVjdHVy
ZQo+IGlzIGVhc2llci4pCgpBdCB0aGUgbW9tZW50LCBlcnJvciBwb2ludGVycyBhcmUgY29uZGl0
aW9uYWxseSB3cml0dGVuIG9uIGVycm9yLCB3aGljaAptZWFucyB0aGF0IGFsbCBjYWxsZXJzIHBh
c3Npbmcgbm9uLU5VTEwgbmVlZCB0byBpbml0aWFsaXNlLgoKVGhpcyBjb3VsZCBiZSBhbHRlcmVk
IHRvIGhhdmUgeGNfc2V0X2RvbWFpbl9jcHVfcG9saWN5KCkgYW5kCng4Nl9jcHVfcG9saWNpZXNf
YXJlX2NvbXBhdGlibGUoKSBwcm8tYWN0aXZlbHkgc2V0ICJubyBlcnJvciIgdG8gYmVnaW4Kd2l0
aCwgYnV0IHRoYXQgZG9lc24ndCByZW1vdmUgdGhlIG5lZWQgZm9yIElOSVRfQ1BVX1BPTElDWV9F
UlJPUlMgaW4gdGhlCmZpcnN0IHBsYWNlLgoKPgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3hl
bi9saWIveDg2L3BvbGljeS5jCj4+IEBAIC0wLDAgKzEsNTMgQEAKPj4gKyNpbmNsdWRlICJwcml2
YXRlLmgiCj4+ICsKPj4gKyNpbmNsdWRlIDx4ZW4vbGliL3g4Ni9jcHUtcG9saWN5Lmg+Cj4+ICsK
Pj4gK2ludCB4ODZfY3B1X3BvbGljaWVzX2FyZV9jb21wYXRpYmxlKGNvbnN0IHN0cnVjdCBjcHVf
cG9saWN5ICpob3N0LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGNwdV9wb2xpY3kgKmd1ZXN0LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGNwdV9wb2xpY3lfZXJyb3JzICplKQo+PiArewo+PiArICAgIHVp
bnQzMl90IGxlYWYgPSAtMSwgc3VibGVhZiA9IC0xLCBtc3IgPSAtMTsKPj4gKyAgICBpbnQgcmV0
ID0gLUVJTlZBTDsKPj4gKwo+PiArI2RlZmluZSBOQSBYRU5fQ1BVSURfTk9fU1VCTEVBRgo+PiAr
I2RlZmluZSBGQUlMX0NQVUlEKGwsIHMpIGRvIHsgbGVhZiA9IChsKTsgc3VibGVhZiA9IChzKTsg
Z290byBvdXQ7IH0gd2hpbGUgKCAwICkKPj4gKyNkZWZpbmUgRkFJTF9NU1IobSkgZG8geyBtc3Ig
PSAobSk7IGdvdG8gb3V0OyB9IHdoaWxlICggMCApCj4+ICsKPj4gKyAgICBpZiAoIGd1ZXN0LT5j
cHVpZC0+YmFzaWMubWF4X2xlYWYgPiBob3N0LT5jcHVpZC0+YmFzaWMubWF4X2xlYWYgKQo+PiAr
ICAgICAgICBGQUlMX0NQVUlEKDAsIE5BKTsKPj4gKwo+PiArICAgIGlmICggZ3Vlc3QtPmNwdWlk
LT5leHRkLm1heF9sZWFmID4gaG9zdC0+Y3B1aWQtPmV4dGQubWF4X2xlYWYgKQo+PiArICAgICAg
ICBGQUlMX0NQVUlEKDB4ODAwMDAwMDgsIE5BKTsKPj4gKwo+PiArICAgIC8qIFRPRE86IEF1ZGl0
IG1vcmUgQ1BVSUQgZGF0YS4gKi8KPj4gKwo+PiArICAgIGlmICggfmhvc3QtPm1zci0+cGxhZm9y
bV9pbmZvLnJhdyAmIGd1ZXN0LT5tc3ItPnBsYWZvcm1faW5mby5yYXcgKQo+IEkndmUgbm90aWNl
ZCB0aGlzIG9ubHkgaGVyZSwgYnV0IHRoZXJlIGFyZSBudW1lcm91cyBpbnN0YW5jZXMgZWxzZXdo
ZXJlOgo+IENvdWxkIEkgdGFsayB5b3UgaW50byBmaXhpbmcgdGhlIHNwZWxsaW5nIG1pc3Rha2Ug
KG1pc3NpbmcgJ3QnIGluCj4gInBsYXRmb3JtX2luZm8iKSBoZXJlIG9yIGluIGEgcHJlcmVxIHBh
dGNoIChmZWVsIGZyZWUgdG8gYWRkIG15IGFjayB0aGVyZQo+IHdpdGhvdXQgZXZlbiBwb3N0aW5n
KT8KCkknZCBub3QgZXZlbiBub3RpY2VkIHRoZSBtaXN0YWtlLsKgIEknbGwgZ2V0IGEgZml4dXAg
c29ydGVkIGFzIHlvdSBzdWdnZXN0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
