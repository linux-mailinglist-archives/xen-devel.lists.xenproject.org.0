Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD35550BB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 15:49:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hflmv-0006Ry-Rp; Tue, 25 Jun 2019 13:47:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ot0M=UY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hflmt-0006RI-Eb
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 13:47:07 +0000
X-Inumbo-ID: b7281c6e-974f-11e9-bd23-2361689006b6
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7281c6e-974f-11e9-bd23-2361689006b6;
 Tue, 25 Jun 2019 13:47:04 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8JQILQnfA0zE/BpgULRq0ttqFJSmh3+4rD6P6FtcZiKIRaiacLvEIPWkMvjWruOA5jrfdGQK5r
 u3H9Q6+A9vMRUMYRc6m/tL7EpnHd49+Ai7U/otgEc9BntYYc2JcqpuoLjil6RMZDmEZL8N+H9X
 WIgB0lWqCHuPm5GWLtGuS9BSDZuJLlVKPtT5bcpMfgix+sAhRXHNKzLVjJXCVhjGOVwIzjV0Su
 oB33mMDmRvXO6uYgZ96QNL7TLtVBw8oAnljQvJEgQd40qQbAd61cC0rMUSVtdzkLc0g0/yKQ1n
 K5s=
X-SBRS: 2.7
X-MesageID: 2198493
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2198493"
To: Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
 <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
 <alpine.DEB.2.21.1906241430320.2468@sstabellini-ThinkPad-T480s>
 <90c2cbd6-2b00-03cc-55fd-cbc8ac80cde9@arm.com>
 <BB14443D-9037-4D24-BB69-F94849799AAB@citrix.com>
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
Message-ID: <b0d228cd-e01a-4437-7103-2a9f23c9af31@citrix.com>
Date: Tue, 25 Jun 2019 14:47:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <BB14443D-9037-4D24-BB69-F94849799AAB@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMDYvMjAxOSAxMzoxNSwgTGFycyBLdXJ0aCB3cm90ZToKPiDvu79PbiAyNS8wNi8yMDE5
LCAxMDowMywgIkp1bGllbiBHcmFsbCIgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPgo+
ICAgICA+Pj4gVGhlIHBvaW50IGhlcmUgaXMgdGhhdCB3ZSBjYW4gYmUgZmxleGlibGUgYW5kIGNy
ZWF0aXZlIGFib3V0IHRoZSB3YXkgdG8KPiAgICAgPj4+IG1haW50YWluIHRoZSBkb2NzIG9uIHhl
bi5naXQuIEJ1dCBhcyBhIHRlY2hub2xvZ3kgaXMgY2VydGFpbmx5IGJldHRlcgo+ICAgICA+Pj4g
dGhhbiB0aGUgd2lraTogd2UgZG9uJ3QgaGF2ZSB0byBrZWVwIHRoZW0gYWxsIHVwLXRvLWRhdGUg
d2l0aCB0aGUgY29kZSwKPiAgICAgPj4+IGJ1dCBhdCBsZWFzdCB0aGlzIHdheSB3ZSBoYXZlIGEg
Y2hhbmNlIChpZiB3ZSB3YW50IHRvKS4gSWYgd2UgbGVhdmUgdGhlbQo+ICAgICA+Pj4gb24gdGhl
IHdpa2ksIHRoZXJlIGlzIG5vIGNoYW5jZS4KPiAgICAgPj4KPiAgICAgPj4gSSBjYW4ndCBzZWUg
aG93IHhlbi5naXQgaXMgZ29pbmcgdG8gYmUgYmV0dGVyIGlmICJ3ZSBkb24ndCBoYXZlIHRvIGtl
ZXAgdGhlbQo+ICAgICA+PiBhbGwgdXAtdG8tZGF0ZSIuCj4gICAgID4gCj4gICAgID4gVGhhdCdz
IGJlY2F1c2UgYSBjb250cmlidXRvciBjb3VsZCBhZGQgYSBwYXRjaCBhdCB0aGUgZW5kIG9mIGEg
c2VyaWVzIHRvCj4gICAgID4gdXBkYXRlIG9uZSBvZiB0aGUgZG9jcywgZXZlbiBpZiB0aGUgZG9j
IGluIHF1ZXN0aW9uIGNvbWVzIHdpdGggbm8KPiAgICAgPiBwcm9taXNlcyBvZiBiZWluZyB1cC10
by1kYXRlLgo+ICAgICAKPiAgICAgSSB0aGluayB0aGlzIGlzIGdvaW5nIHRoZSB3cm9uZyBkaXJl
Y3Rpb24uIFRoZSBnb2FsIG9mIHVzaW5nIHhlbi5naXQgaXMgdG8gdHJ5IAo+ICAgICB0byBrZWVw
IHRoZSBkb2N1bWVudGF0aW9uIHVwLXRvLWRhdGUuCj4gICAgIAo+IEkgYWdyZWUgd2l0aCBKdWxp
ZW4gYW5kIHRoaXMgd2FzIGFsc28gbm90IG15IGludGVudGlvbi4gVGhlIHJlYXNvbiB3aHkgSSBi
cm91Z2h0IHRoaXMgdXAgbm93IGlzIHRoYXQgdGhlIGluLXRyZWUgZG9jcyBhcmUgcHJldHR5IG11
Y2ggYSBtZXNzIHRvZGF5IGFuZCBhcmUgc3RhbGUgaW4gbWFueSB3YXlzLiBBbmQgdGhleSBsb29r
IFRFUlJJQkxFIGFuZCBhcmUgbm90IGVhc2lseSBzZWFyY2hhYmxlLiBIb3dldmVyLCBBbmR5J3Mg
bGF0ZXN0IHNldCBvZiBwYXRjaGVzIHByb3ZpZGUgYW4gb3Bwb3J0dW5pdHkgdG8gY29uc29saWRh
dGUgc29tZSBvZiB0aGUgaW4tdHJlZSBkb2NzIGluIGEgbmljZWx5IHJlbmRlcmVkIGFuZCBzZWFy
Y2hhYmxlIGZvcm1hdC4KClNvIHRoZSBwbGFuIGhlcmUgaXMgdG8gZ2V0IGEgY29uc2lzdGVudCBh
bmQgdW5pZm9ybSBzZXQgb2YgaGlnaCBxdWFsaXR5CmRvY3MuCgpBcyBmYWlyIHdhcm5pbmcsIEkn
bSBpbnRlbmRpbmcgdG8gYmUgZmFpcmx5IHN0cmljdCB3aXRoIHdoYXQgZ29lcyBpbgoocXVhbGl0
eSB3aXNlKSwgYmVjYXVzZSBJJ20gZ29pbmcgdG8gZG8gbXkgYmVzdCB0byBlbnN1cmUgdGhhdCB0
aGUKc3BoaW54IGRvY3VtZW50YXRpb24gZG9lc24ndCBkZXZvbHZlIGludG8gdGhlIG1lc3MgdGhh
dCB3aWtpIG9yIHRoZQptYWpvcml0eSBvZiBkb2NzLyBjdXJyZW50bHkgaXMuCgo+IEkgaGF2ZSBi
ZWVuIGZvY3Vzc2luZyBvbiBwcm9jZXNzIHJlbGF0ZWQgYW5kIGtleSBkZXZlbG9wZXIgcmVsYXRl
ZCBkb2NzLCBiZWNhdXNlIHdobyBtYWludGFpbnMgdGhlbSBpcyBub3QgYWN0dWFsbHkgYW4gaXNz
dWUgaW4gdGhlb3J5LiBFdmVyeW9uZSByZWFsbHkgb3VnaHQgdG8gY2FyZSwgYmVjYXVzZSBldmVy
eW9uZSBpcyBpbXBhY3RlZCBieSB0aGVzZS4KClRoZSBrZXkgcG9pbnQgaXMgZm9yIG1haW50YWlu
ZXJzL3Jldmlld2VycyB0byBiZSBhd2FyZSBvZiB3aGV0aGVyCmRvY3VtZW50YXRpb24gZXhpc3Rz
IGZvciB0aGUgYXJlYSBvZiBjb2RlIGJlaW5nIG1vZGlmaWVkLCBhbmQgaWYgc28sCndoZXRoZXIg
dGhlIHN1Ym1pdHRlZCBwYXRjaCBzaG91bGQgYWxzbyBwYXRjaCB0aGUgZG9jdW1lbnRhdGlvbi4K
ClJldmlld2VycyB0ZW5kIHRvIGJlIGZhaXJseSBnb29kIGF0IG5vdGljaW5nIHBhdGNoZXMgd2hp
Y2ggYWxzbyBuZWVkIHRvCnBhdGNoIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyAo
c3VibWl0dGVycywgbGVzcyBzbyksIGJ1dCB0aGlzCmFwcHJvYWNoIG5lZWRzIGV4dGVuZGluZyB0
byB0aGUgd2hvbGUgb2YgdGhlIHNwaGlueCBkb2NzICh3aGljaCBpbiB0dXJuCnJlcXVpcmVzIHRo
ZSBkb2NzIHRvIHN0YXkgaGlnaCBxdWFsaXR5IHNvIGl0cyBlYXN5IGZvciBtYWludGFpbmVycyB0
bwprbm93IHdoYXQgaXMgd2hlcmUpLgoKfkFuZHJldwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
