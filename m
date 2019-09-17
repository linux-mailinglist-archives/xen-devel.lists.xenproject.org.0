Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916BB53E6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:20:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH6Y-0006Ak-L9; Tue, 17 Sep 2019 17:17:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zlRc=XM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAH6W-0006AL-VZ
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:17:28 +0000
X-Inumbo-ID: 05e327fc-d96f-11e9-a337-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05e327fc-d96f-11e9-a337-bc764e2007e4;
 Tue, 17 Sep 2019 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740649;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dj3JI169tm8OGeiM9bLiNkfgBWof+a+vWJuWzR6wPGU=;
 b=Kv5YWzZGMIaqD0vptQ11Znl5PbTTEM71aDBkrHVvb4f8X0xCODuocnJg
 2T4N2SJ1duqj9x1kb1xL/ZpurcGgysnHH0JEF/o7jf33RMR0qy6fR9YJO
 1ISyKQhgmh96ulZv4JkWeNikCKNVCytoaonhmQJd8oRAGBzPZH8iZiHqX 0=;
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
IronPort-SDR: XaJaamP8o1qrqxhYE7+NTXocuSmzHovmmuN8mV7Tnny58lNeMXBYgryD9OxjjxZsgBeNwkFa+X
 0zMySLVzga2GDJZ0e6quEaXit3YgMXtb79QAjxMUHnXbl3EuQbMhkgG0emw0qKCLWPfHXxihc2
 dELW2b3UW24PX30R8d9wBFosmHKJdQ+UswmdyQeA0YcSZSCvpEigFL62YlK/oEVOPrj8n5Uo1r
 1k53/6IcKnnNcXoASdnc2kUR3BXKJNahMhywSYSi9DMuYJIYyIcpzcrMG/aWn/uiz1JHhTxquh
 +ZQ=
X-SBRS: 2.7
X-MesageID: 5743404
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5743404"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
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
Message-ID: <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
Date: Tue, 17 Sep 2019 18:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDkvMjAxOSAxMDo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gWEVEIGNvbW1pdCAxYjJm
ZDk0NDI1ICgiVXBkYXRlIE1PVlNYRCB0byBtb2Rlcm4gYmVoYXZpb3IiKSBwb2ludHMgb3V0Cj4g
dGhhdCBhcyBvZiBTRE0gcmV2IDA2NCBNT1ZTWEQgaXMgc3BlY2lmaWVkIHRvIHJlYWQgb25seSAx
NiBiaXRzIGZyb20KPiBtZW1vcnkgKG9yIHJlZ2lzdGVyKSB3aGVuIHVzZWQgd2l0aG91dCBSRVgu
VyBhbmQgd2l0aCBvcGVyYW5kIHNpemUKPiBvdmVycmlkZS4gU2luY2UgdGhlIHVwcGVyIDE2IGJp
dHMgb2YgdGhlIHZhbHVlIHJlYWQgd29uJ3QgYmUgdXNlZAo+IGFueXdheSBpbiB0aGlzIGNhc2Us
IG1ha2UgdGhlIGVtdWxhdGlvbiB1bmlmb3JtbHkgZm9sbG93IHRoaXMgbW9yZQo+IGNvbXBhdGli
bGUgYmVoYXZpb3Igd2hlbiBub3QgZW11bGF0aW5nIGFuIEFNRC1saWtlIENQVSwgYXQgdGhlIHJp
c2sKPiBvZiBtaXNzaW5nIGFuIGV4Y2VwdGlvbiB3aGVuIGVtdWxhdGluZyBvbi9mb3Igb2xkZXIg
aGFyZHdhcmUgKHRoZQo+IGJvdW5kYXJ5IGF0IFNhbmR5QnJpZGdlIG5vdGVkIGluIHNhaWQgY29t
bWl0IGxvb2tzIHF1ZXN0aW9uYWJsZSAtIEkndmUKPiBvYnNlcnZlZCB0aGUgIm5ldyIgYmVoYXZp
b3IgYWxzbyBvbiBXZXN0bWVyZSkuCgpBTUQgZG9jdW1lbnRzIHRoaXMgaW5zdHJ1Y3Rpb24gaGFz
IGFsd2F5cyB1c2luZyBhbiA4IG9yIDE2Yml0IHNvdXJjZQpvcGVyYW5kLgoKVGhlcmUgYXJlIGNv
cm5lciBjYXNlcyB3aGljaCB3ZSBjYW4ndCBwb3NzaWJseSByZWFzb25hYmx5IGNvcGUgd2l0aC7C
oAplLmcuIEl0IGlzIG1vZGVsIHNwZWNpZmljIGFzIHRvIHdoZXRoZXIgVUQwIHRha2VzIGEgTW9k
Uk0gYnl0ZSBvciBub3QsCmFuZCBJJ2xsIG5vdGUgdGhhdCB0aGUgbGF0ZXN0IHJldmlzaW9uICgz
LjMxKSBvZiBBUE0gVm9sMiBjbGFyaWZpZXMgaW4KVGFibGUgOC04OgoKIlRoaXMgcmVmbGVjdHMg
dGhlIHJlbGF0aXZlIHByaW9yaXR5IGZvciBmYXVsdHMgZW5jb3VudGVyZWQgd2hlbgpmZXRjaGlu
ZyB0aGUgZmlyc3QgYnl0ZSBvZiBhbiBpbnN0cnVjdGlvbi4gSW4gdGhlIGZldGNoaW5nIGFuZCBk
ZWNvZGluZwpvZiBzdWJzZXF1ZW50IGJ5dGVzIG9mIGFuIGluc3RydWN0aW9uLCBpZiB0aG9zZSBi
eXRlcyBzcGFuIHRoZSBzZWdtZW50CmxpbWl0IG9yIGNyb3NzIGludG8gYSBub24tZXhlY3V0YWJs
ZSBvciBub3QtcHJlc2VudCBwYWdlLCB0aGUgZmV0Y2ggd2lsbApyZXN1bHQgaW4gYSAjR1AoMCkg
ZmF1bHQgb3IgI1BGIGFzIGFwcHJvcHJpYXRlLCBwcmV2ZW50aW5nIHRob3NlIGJ5dGVzCmZyb20g
YmVpbmcgYWNjZXNzZWQuIEhvd2V2ZXIsIGlmIHRoZSBpbnN0cnVjdGlvbiBjYW4gYmUgZGV0ZXJt
aW5lZCB0byBiZQppbnZhbGlkIGJhc2VkIGp1c3Qgb24gdGhlIGJ5dGVzIHByZWNlZGluZyB0aGF0
IGJvdW5kYXJ5LCBhICNVRCBmYXVsdCBtYXkKdGFrZSBwcmlvcml0eS4gVGhpcyBiZWhhdmlvciBp
cyBtb2RlbC1kZXBlbmRlbnQuIgoKc28gd2UgaGF2ZSBubyBob3BlIG9mIGdldHRpbmcgbW9kZWwt
YWNjdXJhdGUgZmF1bHQgYmVoYXZpb3VyLgoKPiBXaGlsZSB0b3VjaGluZyB0aGlzIGNvZGUgSSBh
bHNvIG5vdGljZWQgdGhhdCAjVUQgb3V0c2lkZSBvZiBwcm90ZWN0ZWQKPiBtb2RlIGdldHMgcmFp
c2VkIGZvciBBUlBMIG9ubHkgYWZ0ZXIgaGF2aW5nIHJlYWQgdGhlIG1lbW9yeSBvcGVyYW5kIC0K
PiBjb3JyZWN0IHRoaXMgYXR0aGUgc2FtZSB0aW1lIGJ5IG1vdmluZyB1cCB0aGUgcmVzcGVjdGl2
ZSBjb25zdHJ1Y3QuCgphdCB0aGUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
