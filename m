Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618ECFB66D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 18:29:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUwQ1-0001ID-8E; Wed, 13 Nov 2019 17:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUwPy-0001I8-Rl
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 17:26:58 +0000
X-Inumbo-ID: cb3112ec-063a-11ea-984a-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb3112ec-063a-11ea-984a-bc764e2007e4;
 Wed, 13 Nov 2019 17:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573666017;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gr7jnkxEGx2e8LedRgEhuQXHmfGD+QT8TFaW0ARP5EY=;
 b=Ar1WiAKqJptGp7m4Ko+myYdTq5B8uG++aFqjwXSEsLicM3qUmXD/K6XM
 l/1VmyECa//5gOBykZTdBW2uo7GonveDsEkWc+w6pVChLKLMTNjhMeHZr
 Ep4zfUCvkY4hKAOUkqS0OTJmmHRPsHqFfErNKmUNCIVuSQzwivsuIgTi9 I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: krKPtjasFSaLr8mrzBwnzAS20MvaAFfQBC8p+0BRPo+bsJGygxhJ3O7u5MRswM6bHZfzFAcxFo
 v4/EZh84zW5i9IfVaRd10vyl5Ur0zptxL9YkN4PRYj2rt+QDslaYGAnkEFBuVk1a/gmsXEOSLl
 5IM78scWWm/NxcIaXM6BWpso1izvcjDJtyoc994NiN8YBiB6dE8WXjDxs6BLI1uGgwplZDEh7q
 WpkbFf02DyaIhMhrZmiFKfTCMGpP9+el4w2Mg4uif0s1/rlP0uUASc8CZlrZKe2Z/1LDooFmQn
 amw=
X-SBRS: 2.7
X-MesageID: 8692033
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,301,1569297600"; 
   d="scan'208";a="8692033"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20191113162229.1140-1-jgross@suse.com>
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
Message-ID: <747354cb-cd91-200d-d271-9cb2f2fb56ac@citrix.com>
Date: Wed, 13 Nov 2019 17:26:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113162229.1140-1-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen: make debugger support configurable
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTEvMjAxOSAxNjoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBEZWJ1Z2dlciBzdXBw
b3J0IGluIHRoZSBoeXBlcnZpc29yIGlzIHJhcmVseSB1c2VkIGFuZCBpdCBpcyBvcGVuaW5nIGEK
PiB3YXkgZm9yIGRvbTAgdG8gbW9kaWZ5IHRoZSBydW5uaW5nIGh5cGVydmlzb3IgYnkgdmVyeSBl
YXN5IG1lYW5zLgo+Cj4gQWRkIGEgS2NvbmZpZyBvcHRpb24gdG8gY29udHJvbCBzdXBwb3J0IG9m
IGdkYnN4LiBEZWZhdWx0IGlzIG9mZi4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL0tjb25maWcuZGVidWcgICAgICAgICAgICAg
IHwgIDQgKysrKwo+ICB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgfCAgMSAtCj4gIHhl
bi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICB8ICA0ICsrKysKPiAgeGVuL2NvbW1vbi9LY29u
ZmlnICAgICAgICAgICAgIHwgIDMgLS0tCj4gIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAg
ICB8ICAyICstCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZGVidWdnZXIuaCB8IDMwICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICAg
fCAgNCArKysrCj4gIDcgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4vS2NvbmZpZy5k
ZWJ1Zwo+IGluZGV4IDIyNTczZTc0ZGIuLjg0YTZlMWI4ZWIgMTAwNjQ0Cj4gLS0tIGEveGVuL0tj
b25maWcuZGVidWcKPiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zwo+IEBAIC0xMyw5ICsxMywxMyBA
QCBjb25maWcgREVCVUcKPiAgCj4gIGlmIERFQlVHIHx8IEVYUEVSVCA9ICJ5Igo+ICAKPiArY29u
ZmlnIEdEQlNYCj4gKwlib29sCj4gKwo+ICBjb25maWcgQ1JBU0hfREVCVUcKPiAgCWJvb2wgIkNy
YXNoIERlYnVnZ2luZyBTdXBwb3J0Igo+ICAJZGVwZW5kcyBvbiBYODYKPiArCXNlbGVjdCBHREJT
WAo+ICAJLS0taGVscC0tLQo+ICAJICBJZiB5b3Ugd2FudCB0byBhdHRhY2ggZ2RiIHRvIFhlbiB0
byBkZWJ1ZyBYZW4gaWYgaXQgY3Jhc2hlcwo+ICAJICB0aGVuIHNheSBZLgoKQ1JBU0hfREVCVUcg
YW5kIEdEQlNYIGFyZSB1bnJlbGF0ZWQuCgpUaGUgZm9ybWVyIGlzIGdkYnN0dWIgb3ZlciBzZXJp
YWwgZm9yIFhlbiBpdHNlbGYgKHdoaWNoIEkndmUgbmV2ZXIgc2Vlbgp1c2VkLCBhbmQgdGhlcmVm
b3JlIGRvdWJ0IGZ1bmN0aW9ucyksIHdoaWxlIHRoZSBsYXR0ZXIgaXMgYSBzZXQgb2YgZG9tMApo
eXBlcmNhbGxzIHVzZWQgYnkgdGhlIGdkYnN4IHV0aWxpdHkuCgpJJ20gaGFwcHkgdG8gbWFrZSBD
T05GSUdfR0RCU1ggbW9yZSB1c2VmdWwgdGhhbiBpdCBjdXJyZW50bHkgaXMsIGJ1dCBJCmRvbid0
IHRoaW5rIHRoZSB0d28gb3B0aW9ucyB3YW50IGNvbmZsYXRpbmcuCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
