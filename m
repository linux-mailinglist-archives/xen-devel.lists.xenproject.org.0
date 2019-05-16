Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D4D20B15
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:25:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIE3-0002ZJ-TT; Thu, 16 May 2019 15:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Nh3=TQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRIE2-0002Z2-Ch
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:23:18 +0000
X-Inumbo-ID: 86ab1698-77ee-11e9-a99c-8b5b937ec8e5
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86ab1698-77ee-11e9-a99c-8b5b937ec8e5;
 Thu, 16 May 2019 15:23:16 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +9SKWSmnBSPZ67BfsoSnBz8P3PP/OwYeYgkbwN+xoQEQhBtsVb3P4pykkmv6d5xN0vDfZ9nNh4
 wUip+dEryjCt3J91TbxDZE6WvvaVHAi9yCSMX8qZiuEZKy6JaEXBHgZXUaB/xDmdbjFOgdqxJP
 9ouukWgQpUfZPTC+wo30glONs02KfWphR82H1XAkoJKUZXaxH8yRpmU7AgokK390I/KX5sw6Ef
 /ksGZic2+dyxmWb9S/ykxrWFeA1uMgHjd86eYEGr/+nEMoLTMUy2SwJkbteeL+KqPjadFJRYB0
 KlI=
X-SBRS: 2.7
X-MesageID: 511712
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="511712"
To: Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
References: <5C8FC3A4020000780021FF77@prv1-mh.provo.novell.com>
 <2e8dba0b-70ef-dd90-bb5b-fa358f88861e@citrix.com>
 <35203e9e-4a37-9230-f417-68a09ca319e6@citrix.com>
 <e1447c7f-7a8d-b40e-b9a7-9a88c3c7ef51@citrix.com>
 <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
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
Message-ID: <71ca1c58-55a1-657e-a633-95aeb0cde3b8@citrix.com>
Date: Thu, 16 May 2019 16:23:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD7FD9020000780022FCC0@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] preparations for 4.11.2
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDUuMTkg
YXQgMTc6MTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjYvMDQv
MjAxOSAxMzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDI2LzA0LzIwMTkgMTI6NTks
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMTgvMDMvMjAxOSAxNjoxMywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+Pj4+IEFsbCwKPj4+Pj4KPj4+Pj4gdGhlIHJlbGVhc2UgaXMgZHVlIGJ5IHRo
ZSBlbmQgb2YgdGhlIG1vbnRoLCBidXQgd2lsbCBsaWtlbHkgZG9uJ3QgbWFrZQo+Pj4+PiBpdCBi
ZWZvcmUgZWFybHkgQXByaWwuIFBsZWFzZSBwb2ludCBvdXQgYmFja3BvcnRzIHlvdSBmaW5kIG1p
c3NpbmcgZnJvbQo+Pj4+PiB0aGUgcmVzcGVjdGl2ZSBzdGFnaW5nIGJyYW5jaCwgYnV0IHdoaWNo
IHlvdSBjb25zaWRlciByZWxldmFudC4gVGhlCj4+Pj4+IG9uZSBjb21taXQgSSd2ZSBxdWV1ZWQg
YWxyZWFkeSBvbiB0b3Agb2Ygd2hhdCB3YXMganVzdCBwdXNoZWQgaXMKPj4+Pj4KPj4+Pj4gMjJl
MmY4ZGRkZgl4ODYvZTgyMDogZml4IGJ1aWxkIHdpdGggZ2NjOQo+Pj4+IGZmYjYwYTU4ZGY0ODQx
OWMxZjI2MDdjZDNjYzkxOWZhMmJmYzljMmQgInRvb2xzL21pc2MveGVucG06IGZpeCBnZXR0aW5n
Cj4+Pj4gaW5mbyB3aGVuIHNvbWUgQ1BVcyBhcmUgb2ZmbGluZSIgZm9yIDQuMTEgYW5kIGVhcmxp
ZXIuCj4+PiBPaCwgYW5kIDY3N2U2NGRiZTMxNTM0MzYyMGMzYjI2NmU5ZWIxNjYyM2IxMTgwMzgg
InRvb2xzL29jYW1sOiBEdXAyCj4+PiAvZGV2L251bGwgdG8gc3RkaW4gaW4gZGFlbW9uaXplKCki
IGFnYWluIGZvciA0LjEyIGFuZCBlYXJsaWVyLgo+PiBJbiBhZGRpdGlvbiwKPj4KPj4gMmVjNTMz
OWVjOTIxICJ0b29scy9saWJ4bDogY29ycmVjdCB2Y3B1IGFmZmluaXR5IG91dHB1dCB3aXRoIHNw
YXJzZQo+PiBwaHlzaWNhbCBjcHUgbWFwIgo+PiAxMjkwMjVmZTMwOTMgIm94ZW5zdG9yZWQ6IERv
bid0IHJlLW9wZW4gYSB4ZW5jdHJsIGhhbmRsZSBmb3IgZXZlcnkKPj4gZG9tYWluIGludHJvZHVj
dGlvbiIKPj4gN2IyMGE4NjViYzEwICJ0b29scy9vY2FtbDogUmVsZWFzZSB0aGUgZ2xvYmFsIGxv
Y2sgYmVmb3JlIGludm9raW5nIGJsb2NrCj4+IHN5c2NhbGxzIgo+PiBjMzkzYjY0ZGNlZTYgInRv
b2xzL2xpYnhjOiBGaXggaXNzdWVzIHdpdGggbGlieGMgYW5kIFhlbiBoYXZpbmcKPj4gZGlmZmVy
ZW50IGZlYXR1cmVzZXQgbGVuZ3RocyIKPj4gODI4NTVhYmE1YmY5ICJ0b29scy9saWJ4YzogRml4
IGVycm9yIGhhbmRsaW5nIGluIGdldF9jcHVpZF9kb21haW5faW5mbygpIgo+PiA0OGRhYjk3Njdk
MmUgInRvb2xzL3hsOiB1c2UgbGlieGxfZG9tYWluX2luZm8gdG8gZ2V0IGRvbWFpbiB0eXBlIGZv
cgo+PiB2Y3B1LXBpbiIKPj4KPj4gMzY1YWFiYjZlNTAyICJ0b29scy9saWJ4ZW5kZXZpY2Vtb2Rl
bDogYWRkCj4+IHhlbmRldmljZW1vZGVsX21vZGlmaWVkX21lbW9yeV9idWxrIHRvIG1hcCIgaXMg
cG9zc2libHkgYSBjYW5kaWRhdGUsIGJ1dAo+PiBpcyBhbHNvIGNvbXBsaWNhdGVkIGJ5IHRoZSBz
dGFibGUgU09OQU1FLiAgSXQgaXMgcGVyaGFwcyBlYXNpZXN0IHRvCj4+IGlnbm9yZSwgc2VlaW5n
IGFzIHRoZSBpc3N1ZSBoYXMgYWxyZWFkeSBnb25lIHVubm90aWNlZCBmb3IgMiB5ZWFycy4KPiBV
bmxlc3MgdGhlc2UgYXJlIHJlYWxseSB1cmdlbnQgdG8gcHV0IGluLCBJJ2QgbGlrZSB0aGVtIHRv
IGJlIGRlZmVycmVkCj4gdG8gNC4xMS4zLiBXaXRoIFhTQS0yOTcgb3V0IHdlJ3ZlIGFscmVhZHkg
c3RhcnRlZCB0aGUgKGxlYWYgdHJlZSkKPiB0YWdnaW5nIHByb2Nlc3MsIHNvIEkgd2FzIHJlYWxs
eSBob3BpbmcgdG8gZ2V0IHRoaXMgbXVjaCBkZWxheWVkCj4gcmVsZWFzZSBvdXQgcmF0aGVyIHNv
b25lciB0aGFuIGxhdGVyLgoKQXQgYSBtaW5pbXVtLCBmZmI2MGE1OGRmNCBhbmQgZmZiNjBhNThk
ZjQgbmVlZCBiYWNrcG9ydGluZywgYmVjYXVzZSB0aGV5CmFyZSBicmVha2FnZSBvZiB0b29scyBj
YXVzZWQgYnkgb3VyIHJlY29tbWVuZGF0aW9uIHRvIHR1cm4gb2ZmIFNNVCBpbgpyZWNlbnQgWFNB
cy4KCkV2ZXJ5dGhpbmcgZWxzZSBjYW4gYmUgZGVmZXJyZWQgaWYgbmVjZXNzYXJ5LgoKfkFuZHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
