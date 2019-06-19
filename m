Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F7A4B7AA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 14:10:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZLV-0000g3-1N; Wed, 19 Jun 2019 12:05:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iLMg=US=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hdZLT-0000fw-BJ
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:05:43 +0000
X-Inumbo-ID: 8f375212-928a-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f375212-928a-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 12:05:42 +0000 (UTC)
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
IronPort-SDR: Q2XnUHXJaNuoDhxg0LfQ5Uy0RoZktjIIzuL6nxdLk3+tgJD+rLasV+UH3YtOBxMvnsOuhFpFJ8
 HGe4RhRQkT/okP3YAa7nxnD9UHFXo9CAb8s0bE9CqOwDpRgVK9ZU32fHeJI7wJyM9S43JY+Krj
 ciWcuzrN95LDsLy8Xf+AZzcawG3l6uEoYfj5BDZWej6si2V1ZyCRXnvZ/5CeRkUtA39MNFY3sv
 cAknyizDZCshSrSBxU0HpQvgdIe0T+6Ozg7YEXczeLjF8DQu3+Rg7YeoL2kRqpUCyhyK40gp0d
 lJE=
X-SBRS: 2.7
X-MesageID: 1943655
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1943655"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8567020000780021F24E@prv1-mh.provo.novell.com>
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
Message-ID: <fae78615-6f38-d163-e245-c048b0938f0c@citrix.com>
Date: Wed, 19 Jun 2019 13:05:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <5C8B8567020000780021F24E@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 32/50] x86emul: support AVX512F gather
 insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDMvMjAxOSAxMDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyByZXF1aXJlcyBn
ZXR0aW5nIG1vZHJtX3JlZyBhbmQgc2liX2luZGV4IHNldCBjb3JyZWN0bHkgaW4gdGhlIEVWRVgK
PiBjYXNlLCB0byBhY2NvdW50IGZvciB0aGUgaGlnaCAxNiBbWFlaXU1NIHJlZ2lzdGVycy4gRXh0
ZW5kIHRoZQo+IGFkanVzdG1lbnRzIHRvIG1vZHJtX3JtIGFzIHdlbGwsIHN1Y2ggdGhhdCB4ODZf
aW5zbl9tb2RybSgpIHdvdWxkCj4gY29ycmVjdGx5IHJlcG9ydCByZWdpc3RlciBudW1iZXJzICh0
aGlzIHdhcyBhIGxhdGVudCBpc3N1ZSBvbmx5IGFzIHdlCj4gZG9uJ3QgY3VycmVudGx5IGhhdmUg
Y2FsbGVycyBvZiB0aGF0IGZ1bmN0aW9uIHdoaWNoIHdvdWxkIGNhcmUgYWJvdXQgYW4KPiBFVkVY
IGNhc2UpLiBUaGUgYWRqdXN0bWVudCBpbiB0dXJuIHJlcXVpcmVzIGRyb3BwaW5nIHRoZSBhc3Nl
cnRpb24gZnJvbQo+IGRlY29kZV9ncHIoKSBhcyB3ZWxsIGFzIHJlLWludHJvZHVjaW5nIHRoZSBl
eHBsaWNpdCBtYXNraW5nLCBhcyB3ZSBub3cKPiBuZWVkIHRvIGFjdGl2ZWx5IG1hc2sgb2ZmIHRo
ZSBoaWdoIGJpdCB3aGVuIGEgR1BSIGlzIG1lYW50Lgo+IF9kZWNvZGVfZ3ByKCkgaW52b2NhdGlv
bnMgYWxzbyBuZWVkIHNsaWdodCBhZGp1c3RtZW50cywgd2hlbiBpbnZva2VkIGluCj4gZ2VuZXJp
YyBjb2RlIGFoZWFkIG9mIHRoZSBtYWluIHN3aXRjaCgpLiBBbGwgb3RoZXIgdXNlcyBvZiBtb2Ry
bV9yZWcgYW5kCj4gbW9kcm1fcm0gYWxyZWFkeSBnZXQgc3VpdGFibHkgbWFza2VkIHdoZXJlIG5l
Y2Vzc2FyeS4KPgo+IFRoZXJlIHdhcyBhbHNvIGFuIGVuY29kaW5nIG1pc3Rha2UgaW4gdGhlIEVW
RVggRGlzcDggdGVzdCBjb2RlLCB3aGljaAo+IHdhcyBiZW5pZ24gKGR1ZSB0byAlcmR4IGdldHRp
bmcgc2V0IHRvIHplcm8pIHRvIGFsbCBub24tdlNJQiB0ZXN0cyBhcyBpdAo+IG1pc3Rha2VubHkg
ZW5jb2RlZCA8ZGlzcDg+KCVyZHgsJXJkeCkgaW5zdGVhZCBvZiA8ZGlzcDg+KCVyZHgsJXJpeiku
IEluCj4gdGhlIHZTSUIgY2FzZSB0aGlzIG1lYW50IDxkaXNwOD4oJXJkeCwlem1tMikgaW5zdGVh
ZCBvZiB0aGUgaW50ZW5kZWQKPiA8ZGlzcDg+KCVyZHgsJXptbTQpLgo+Cj4gTGlrZXdpc2UgdGhl
IGFjY2VzcyBjb3VudCBjaGVjayB3YXNuJ3QgZW50aXJlbHkgY29ycmVjdCBmb3IgdGhlIFMvRwo+
IGNhc2U6IEluIHRoZSBxdWFkLXdvcmQtaW5kZXggYnV0IGR3b3JkLWRhdGEgY2FzZSBvbmx5IGhh
bGYgdGhlIG51bWJlcgo+IG9mIGZ1bGwgdmVjdG9yIGVsZW1lbnRzIGdldCBhY2Nlc3NlZC4KPgo+
IEFzIGFuIHVucmVsYXRlZCBjaGFuZ2UgaW4gdGhlIG1haW4gdGVzdCBoYXJuZXNzIHNvdXJjZSBm
aWxlIGRpc3Rpbmd1aXNoCj4gdGhlICJuL2EiIG1lc3NhZ2VzIGJ5IGJpdG5lc3MuCgpUaGVyZSBp
cyBhIHZlcnkgbGFyZ2UgYW1vdW50IGdvaW5nIG9uIGhlcmUsIGFuZCB0b28gbXVjaCBmb3IgYSBz
aW5nbGUgcGF0Y2guCgpJIHRoaW5rIHRoZSBtb2RybSBmaXhlcyB3YW50IHNwbGl0dGluZyBvdXQg
YmVjYXVzZSB0aG9zZSBhbG9uZSBhcmUKc3VidGxlLsKgIEl0cyByZWFzb25hYmxlIHRvIGtlZXAg
dGhlIGVtdWxhdG9yIHRlc3QgZml4ZXMgaW4gd2l0aCB0aGUgbmV3CmZ1bmN0aW9uYWxpdHkgd2hp
Y2ggbm90aWNlcyB0aGUgYnVnLCBhbmQgaXQgaXMgYSBvbmUtbGluZXIuCgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5oCj4gKysrIGIveGVuL2FyY2gveDg2L3g4
Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmgKPiBAQCAtNjYyLDggKzY2Miw2IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgbG9uZyAqZGVjb2RlX2dwcigKPiAgICAgIEJVSUxEX0JVR19PTihBUlJBWV9T
SVpFKGNwdV91c2VyX3JlZ3NfZ3ByX29mZnNldHMpICYKPiAgICAgICAgICAgICAgICAgICAoQVJS
QVlfU0laRShjcHVfdXNlcl9yZWdzX2dwcl9vZmZzZXRzKSAtIDEpKTsKPiAgCj4gLSAgICBBU1NF
UlQobW9kcm0gPCBBUlJBWV9TSVpFKGNwdV91c2VyX3JlZ3NfZ3ByX29mZnNldHMpKTsKPiAtCj4g
ICAgICAvKiBOb3RlIHRoYXQgdGhpcyBhbHNvIGFjdHMgYXMgYXJyYXlfYWNjZXNzX25vc3BlYygp
IHN0YW5kLWluLiAqLwoKSSBjYW4ndCBsb2NhdGUgdGhpcyBjb21tZW50IGFueXdoZXJlIGluIFhl
bidzIGhpc3RvcnkuCgpUaGUgY29tbWVudCBjdXJyZW50bHkgaW4gdHJlZSBpczoKCi8qIEZvciBz
YWZldHkgaW4gcmVsZWFzZSBidWlsZHMuwqAgRGVidWcgYnVpbGRzIHdpbGwgaGl0IHRoZSBBU1NF
UlQoKSAqLwoKd2hpY2ggd2lsbCBuZWVkIGFkanVzdGluZyB0byBtYWtlIGl0IGNsZWFyIHRoYXQg
d2UgbWF5IG1vZHJtID4KQVJSQVlfU0laRSgpIGFuZCB0aGF0IHRoaXMgdHJ1bmNhdGlvbiBvcGVy
YXRpb24gaXMgdGhlIGNvcnJlY3QgYWN0aW9uIHRvCnRha2UuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
