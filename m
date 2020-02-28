Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CA173A4E
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 15:51:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7gwp-0005PB-AC; Fri, 28 Feb 2020 14:49:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7gwo-0005P4-2Z
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 14:49:02 +0000
X-Inumbo-ID: 747c1f2a-5a39-11ea-995f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 747c1f2a-5a39-11ea-995f-12813bfff9fa;
 Fri, 28 Feb 2020 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582901340;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=BJ/crfMXxx2hTG6WJKzRgXv732FdQ2ioU45jcav5UUE=;
 b=V2u6+4OQvmAsNx2xMZzG6kOWP39z1M35bDMkUM3Y3Tt2GjuA9Ultxmj+
 tWrmCj0uV84VJQRB0K4jCKdq0oy2jDWbF+HTGXdnrISv0y0jfMg8YPjoc
 6OoKzOJ743p9x02qw5MnGrk+tUoCOdxnp+hpJZPaTlKMHwWgsycsVWkQA Q=;
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
IronPort-SDR: QppP6WNLfqEoxz/+2dnkR9TSFu6SfWOf63zKyXb8HfDC3xUiR6I4CxMrGzIj6axkYEsu4v4fxU
 tN/UnI4IZbuuc8vlrKLZzYJvY2bJBM8WdNS7sdQffwIRMFFw4vf1ErNpZY+BBq/nOgKt4h6C2t
 x0CCqKBSkGnpizO6GLP/tkt/GY+iH/cFhNaSMKM1nUgRh6gmz6dtQxF05nVXJp6qULWkU6PmFX
 4moDZm0dmrja03ipQSQvT/ti0ZhlUtgmlIqHHytSxeGo+Pbrl0bC8lhLTpXzDNYJs+I1lATgu5
 UWw=
X-SBRS: 2.7
X-MesageID: 13799813
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13799813"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
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
Message-ID: <c3e6e985-f75e-182b-275a-f9182a082de7@citrix.com>
Date: Fri, 28 Feb 2020 14:48:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] AMD/IOMMU: without XT,
 x2APIC needs to be forced into physical mode
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDIvMjAyMCAxMjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIHdpZGVyIGNsdXN0
ZXIgbW9kZSBBUElDIElEcyBhcmVuJ3QgZ2VuZXJhbGx5IHJlcHJlc2VudGFibGUuIENvbnZlcnQK
PiB0aGUgaW9tbXVfaW50cmVtYXAgdmFyaWFibGUgaW50byBhIHRyaXN0YXRlLCBhbGxvd2luZyB0
aGUgQU1EIElPTU1VCj4gZHJpdmVyIHRvIHNpZ25hbCB0aGlzIHNwZWNpYWwgcmVzdHJpY3Rpb24g
dG8gdGhlIGFwaWNfeDJhcGljX3Byb2JlKCkuCj4gKE5vdGU6IGFzc2lnbm1lbnRzIHRvIHRoZSB2
YXJpYWJsZSBnZXQgYWRqdXN0ZWQsIHdoaWxlIGV4aXN0aW5nCj4gY29uc3VtZXJzIC0gYWxsIGFz
c3VtaW5nIGEgYm9vbGVhbiBwcm9wZXJ0eSAtIGFyZSBsZWZ0IGFsb25lLikKCkkgdGhpbmsgaXQg
d291bGQgYmUgaGVscGZ1bCB0byBzdGF0ZSB0aGF0IHdoaWxlIHdlIGFyZSBub3QgYXdhcmUgb2Yg
YW55CmhhcmR3YXJlIHdpdGggdGhpcyBhcyBhIHJlc3RyaWN0aW9uLCBpdCBpcyBhIHNpdHVhdGlv
biB3aGljaCBjYW4gYmUKY3JlYXRlZCBvbiBmdWxseSB4MmFwaWMtY2FwYWJsZSBzeXN0ZW1zIHZp
YSBmaXJtd2FyZSBzZXR0aW5ncy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gdjI6IE5ldy4KPgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
ZW5hcGljL3gyYXBpYy5jCj4gKysrIGIveGVuL2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKPiBA
QCAtMjM2LDEyICsyMzYsMjEgQEAgY29uc3Qgc3RydWN0IGdlbmFwaWMgKl9faW5pdCBhcGljX3gy
YXBpYwo+ICAgICAgICAgIHgyYXBpY19waHlzID0gIWlvbW11X2ludHJlbWFwIHx8Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAoYWNwaV9nYmxfRkFEVC5mbGFncyAmIEFDUElfRkFEVF9BUElDX1BI
WVNJQ0FMKTsKPiAgICAgIH0KPiAtICAgIGVsc2UgaWYgKCAheDJhcGljX3BoeXMgJiYgIWlvbW11
X2ludHJlbWFwICkKPiAtICAgIHsKPiAtICAgICAgICBwcmludGsoIldBUk5JTkc6IHgyQVBJQyBj
bHVzdGVyIG1vZGUgaXMgbm90IHN1cHBvcnRlZCB3aXRob3V0IGludGVycnVwdCByZW1hcHBpbmdc
biIKPiAtICAgICAgICAgICAgICAgIngyQVBJQzogZm9yY2luZyBwaHlzIG1vZGVcbiIpOwo+IC0g
ICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsKPiAtICAgIH0KPiArICAgIGVsc2UgaWYgKCAheDJh
cGljX3BoeXMgKQo+ICsgICAgICAgIHN3aXRjaCAoIGlvbW11X2ludHJlbWFwICkKPiArICAgICAg
ICB7Cj4gKyAgICAgICAgY2FzZSBpb21tdV9pbnRyZW1hcF9vZmY6Cj4gKyAgICAgICAgY2FzZSBp
b21tdV9pbnRyZW1hcF9yZXN0cmljdGVkOgo+ICsgICAgICAgICAgICBwcmludGsoIldBUk5JTkc6
IHgyQVBJQyBjbHVzdGVyIG1vZGUgaXMgbm90IHN1cHBvcnRlZCAlcyBpbnRlcnJ1cHQgcmVtYXBw
aW5nXG4iCj4gKyAgICAgICAgICAgICAgICAgICAieDJBUElDOiBmb3JjaW5nIHBoeXMgbW9kZVxu
IiwKCkFueSBjaGFuY2UgdG8gZm9sZCB0aGlzIGludG8gYSBzaW5nbGUgbGluZSB3aXRoICItIGZv
cmNpbmcgcGh5cyBtb2RlXG4iCmFzIGEgc3VmZml4PwoKPiArICAgICAgICAgICAgICAgICAgIGlv
bW11X2ludHJlbWFwID09IGlvbW11X2ludHJlbWFwX29mZiA/ICJ3aXRob3V0Igo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogIndpdGgg
cmVzdHJpY3RlZCIpOwo+ICsgICAgICAgICAgICB4MmFwaWNfcGh5cyA9IHRydWU7Cj4gKyAgICAg
ICAgICAgIGJyZWFrOwo+ICsKPiArICAgICAgICBjYXNlIGlvbW11X2ludHJlbWFwX2Z1bGw6Cj4g
KyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0KPiAgCj4gICAgICBpZiAoIHgyYXBpY19w
aHlzICkKPiAgICAgICAgICByZXR1cm4gJmFwaWNfeDJhcGljX3BoeXM7Cj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2lvbW11LmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaAo+IEBAIC01
NCw3ICs1NCwxOCBAQCBzdGF0aWMgaW5saW5lIGJvb2xfdCBkZm5fZXEoZGZuX3QgeCwgZGZuCj4g
IAo+ICBleHRlcm4gYm9vbF90IGlvbW11X2VuYWJsZSwgaW9tbXVfZW5hYmxlZDsKPiAgZXh0ZXJu
IGJvb2wgZm9yY2VfaW9tbXUsIGlvbW11X3F1YXJhbnRpbmUsIGlvbW11X3ZlcmJvc2UsIGlvbW11
X2lnZng7Cj4gLWV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3FpbnZhbCwgaW9tbXVf
aW50cmVtYXAsIGlvbW11X2ludHBvc3Q7Cj4gK2V4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlv
bW11X3FpbnZhbCwgaW9tbXVfaW50cG9zdDsKPiArZXh0ZXJuIGVudW0gX19wYWNrZWQgaW9tbXVf
aW50cmVtYXAgewo+ICsgICAvKgo+ICsgICAgKiBJbiBvcmRlciB0byBhbGxvdyB0cmFkaXRpb25h
bCBib29sZWFuIHVzZXMgb2YgdGhlIGlvbW11X2ludHJlbWFwCj4gKyAgICAqIHZhcmlhYmxlLCB0
aGUgIm9mZiIgdmFsdWUgaGFzIHRvIGNvbWUgZmlyc3QgKHlpZWxkaW5nIGEgdmFsdWUgb2YgemVy
bykuCj4gKyAgICAqLwo+ICsgICBpb21tdV9pbnRyZW1hcF9vZmYsCj4gKyNpZmRlZiBDT05GSUdf
WDg2Cj4gKyAgIGlvbW11X2ludHJlbWFwX3Jlc3RyaWN0ZWQsCgpUaGlzIG5lZWRzIGEgbm90ZSBh
Ym91dCBpdHMgbWVhbmluZy7CoCBIb3cgYWJvdXQgdGhpcz8KCi8qIEludGVycnVwdCByZW1hcHBp
bmcgZW5hYmxlZCwgYnV0IG9ubHkgYWJsZSB0byBnZW5lcmF0ZSBpbnRlcnJ1cHRzCndpdGggYW4g
OC1iaXQgQVBJQyBJRC4gKi8KCk90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpOb3QgYW4gaXNzdWUgZm9yIG5vdywgYnV0ICJy
ZXN0cmljdGVkIiBtaWdodCBiZWNvbWUgYW1iaWd1b3VzIHdpdGgKZnV0dXJlIGV4dGVuc2lvbnMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
