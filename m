Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BC185EF6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvezK-0006AP-5d; Thu, 08 Aug 2019 09:45:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvezI-0006AK-JO
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:45:36 +0000
X-Inumbo-ID: 44502238-b9c1-11e9-85a7-2b93f5754eb7
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44502238-b9c1-11e9-85a7-2b93f5754eb7;
 Thu, 08 Aug 2019 09:45:34 +0000 (UTC)
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
IronPort-SDR: c68KXUmp9ipIwCw5t8bWOiYtmcQ3GQV/YaxB9n7D13a64LXnJzr76EAdRptgd/fNXbWBF8+Wgb
 aUGhKlKXCxcUKeSlrhIMrOh8EjSG9XOmU0MXxLaXG62Xxq3r5aSlHL7VSe+pEdqxrY1XYNATGb
 mglCAW6+q1oVXzY24iYmhjvD7ifE2dIrJ08nhei11A93PvMbw8DUfEY9zs+xRYOIWerzaocgR9
 EysfSkwiiVVNkpBHzJ5vQX8/XaYnT/Dr8Ob2akr8sW60fEHBLeoVMjx3mk4WpicszVciSrWh/6
 cKk=
X-SBRS: 2.7
X-MesageID: 4060812
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4060812"
To: Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
 <b9911c5a-3c66-30a0-4147-4a69f6847d56@suse.com>
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
Message-ID: <efbf84bf-fb0e-b96f-5274-185b976c14a2@citrix.com>
Date: Thu, 8 Aug 2019 10:45:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b9911c5a-3c66-30a0-4147-4a69f6847d56@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Juergen Gross <JGross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDgvMjAxOSAxMDowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDguMDguMjAxOSAx
MDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDgvMDgvMjAxOSAwNTo1MCwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+IE9uIDA3LjA4LjE5IDIwOjExLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IDxzbmlwPgo+Pj4+IEl0cyBub3QgZXhhY3RseSB0aGUgZWFzaWVzdCB0byBkdW1wIHRv
IGZvbGxvdy4KPj4+Pgo+Pj4+IEZpcnN0IG9mIGFsbCAtIEkgZG9uJ3Qgc2VlIHdoeSB0aGUgaG9s
ZC9ibG9jayB0aW1lIGFyZSBwcmludGVkIGxpa2UKPj4+PiB0aGF0LsKgIEl0Cj4+Pj4gbWlnaHQg
YmUgYSBob2xkb3ZlciBmcm9tIHRoZSAzMmJpdCBidWlsZCwgcHJlIFBSSWQ2NCBzdXBwb3J0LsKg
IFRoZXkKPj4+PiBzaG91bGQKPj4+PiBwcm9iYWJseSB1c2UgUFJJX3N0aW1lIGFueXdheS4KPj4+
IEZpbmUgd2l0aCBtZS4KPj4+Cj4+Pj4gVGhlIGRvbWlkIHJlbmRlcmluZyBpcyB1bmZvcnR1bmF0
ZS7CoCBJZGVhbGx5IHdlJ2QgdXNlICVwZCBidXQgdGhhdCB3b3VsZAo+Pj4+IGludm9sdmUgcmVh
cnJhbmdpbmcgdGhlIGxvZ2ljIHRvIGdldCBhIHN0cnVjdCBkb21haW4qIGluIGhhbmQuCj4+Pj4g
U2VlaW5nIGFzCj4+Pj4geW91J3JlIHRoZSBsYXN0IHBlcnNvbiB0byBtb2RpZnkgdGhpcyBjb2Rl
LCBob3cgaGFyZCB3b3VsZCB0aGF0IGJlIHRvCj4+Pj4gZG8/Cj4+PiBJdCB3b3VsZCBjb21wbGV0
ZWx5IGJyZWFrIHRoZSBzdHJ1Y3QgdHlwZSBhZ25vc3RpYyBkZXNpZ24uCj4+IE9rLsKgIEFzIGFu
IGFsdGVybmF0aXZlbHksIGhvdyBhYm91dCAlcGRyIHdoaWNoIHRha2VzIGEgcmF3IGRvbWlkP8Kg
IEl0Cj4+IHdvdWxkIGJlIGEgdHJpdmlhbCBhZGp1c3RtZW50IGluIHRoZSB2c25wcmludGYgY29k
ZSwgYW5kIGNvdWxkIHBsYXVzaWJseQo+PiBiZSB1c2VmdWwgZWxzZXdoZXJlIHdoZXJlIHdlIGhh
dmUgYSBkb21pZCBhbmQgbm90IGEgZG9tYWluIHBvaW50ZXIuCj4gQXQgdGhlIHJpc2sgb2YgdXBz
ZXR0aW5nIC8gYW5ub3lpbmcgeW91OgoKWWVzIHlvdSByZWFsbHkgaGF2ZQoKPiBBIGRvbWlkX3Qg
d291bGQgYWdhaW4KPiBiZXR0ZXIgYmUgZm9ybWF0dGVkIHZpYSAlb2QgKGFuZCB3aXRob3V0IHRo
ZSBuZWVkIHRvIHRha2UgdGhlCj4gYWRkcmVzcyBvZiBhIHJlc3BlY3RpdmUgdmFyaWFibGUpLiBJ
biB0aGUgY2FzZSBoZXJlIGl0IHdvdWxkCj4gaGF2ZSB0aGUgbWlub3IgYWRkaXRpb25hbCBiZW5l
Zml0IG9mIGNvbnNlcnZpbmcgb24gZm9ybWF0IHN0cmluZwo+IGxlbmd0aC4KClRoZXJlIGFyZSBj
b25jcmV0ZSByZWFzb25zIHdoeSBpdCBpcyBhIHRlcnJpYmxlIGlkZWEsIGJlY2F1c2Ugbm9uZSBv
Zgp0aGlzIGhhcyBhbnl0aGluZyB0byBkbyB3aXRoIG9jdGFsLCBhbmQgdGhhdCAlb2QgaGFzIGEg
d2VsbCBkZWZpbmVkCm1lYW5pbmcgd2hpY2ggaXMgbm90IHJlbGF0ZWQgdG8gZG9taWQncy7CoCBU
aGVyZSBpcyBhbHNvIGEgdmVyeSBnb29kCnJlYXNvbiB3aHkgYWxsIHRoZSBtYWdpYyBpcyBoaWRk
ZW4gYmVoaW5kIG9uZSBzaW5nbGUgZm9ybWF0dGVyLgoKWW91IHNlZW0gaGVsbCBiZW50IG9uIG1h
a2luZyBpdCBhY3RpdmVseSBjb25mdXNpbmcgYW5kIGNvbXBsaWNhdGVkIHRvCndyaXRlIGFuZCBy
ZWFkIHByaW50aygpJ3MsIGFuZCBJIGFtIG5vdCB3aWxsaW5nIHRvIGx1bWJlciBhbnlvbmUKZGV2
ZWxvcGluZyBvbiBYZW4gd2l0aCB0aGlzIGNvZ25pdGl2ZSBjb21wbGV4aXR5LgoKSSBhbSBzdGlj
ayB0byBkZWF0aCBvZiBoYXZpbmcgdGhlIHNhbWUgb3ZlciBhbmQgb3Zlciwgc28gbGV0IG1lIHN0
b3AgYW55CmZ1cnRoZXIgd2FzdGluZyBvZiB0aW1lIGFuZCBiZSBhYnNvbHV0ZWx5IGNyeXN0YWwg
Y2xlYXIuCgpOQUNLIHRvIGFueSBmb3JtIG9mIG92ZXJsb2FkaW5nICVvCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
