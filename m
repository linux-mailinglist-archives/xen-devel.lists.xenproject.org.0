Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15525DD62A
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2019 04:23:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLeLe-0003F8-Q8; Sat, 19 Oct 2019 02:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cTED=YM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iLeLd-00039S-Ux
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2019 02:20:05 +0000
X-Inumbo-ID: f571a5a4-f216-11e9-bbab-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f571a5a4-f216-11e9-bbab-bc764e2007e4;
 Sat, 19 Oct 2019 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571451604;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nvBasbL2yKRrHM3UZo5U6vXiaNqV6NOMqvQWZiizb9E=;
 b=Upo3Ybl3tvhLFe6nUe7DvGhvTFxvxIHSoqz8vVSndUCJ0y7wFTV54Ar7
 1WdlGjbu7gun3v19RbOgCalmAOOcMtibNbWYL+FdvA3FpVDzni7W+racQ
 W80xE1XMfybI501QChnHn2vQEeukRhQk/bezZtg1kXSQ6+5rB3QjprbQx I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C4Smto5ozo7lf6CU6TGCuWCMjQEBYHB9/RJxENf6rvkbRAb6KZ9j2yI1cgjmW8SjLzzqQ3Jssc
 kY4lJ9I0I80LHQt1aZuOsDBEeuY+5m3h4bakeRjkiKfF35ukGSuAEu6ZSMTxORgz+qQNxIyzuX
 YFXo4+PKku3U+mzDSRGrbzWigB1G10s9IOuWv9D6s2IRTiELSOm89FA1ydDA0ErTu2gK2dnlen
 tt6ct6Lr3VreAx+GQZ4jXy5lTTpTkIXTVbFGeeQFWlLstfKoZBmMXzre6KXR5rUXwFpV1Rjha3
 Jd0=
X-SBRS: 2.7
X-MesageID: 7230302
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,313,1566878400"; 
   d="scan'208";a="7230302"
To: Lars Kurth <lars.kurth@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
References: <20191003205948.21131-1-andrew.cooper3@citrix.com>
 <D8B53B1D-C43F-4B1C-AD19-5B92005E7286@citrix.com>
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
Message-ID: <b7d0a13e-3674-e065-d527-a0c764a3b839@citrix.com>
Date: Fri, 18 Oct 2019 19:19:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <D8B53B1D-C43F-4B1C-AD19-5B92005E7286@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/4] docs/sphinx: Introduction
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTAvMjAxOSAxMzozNCwgTGFycyBLdXJ0aCB3cm90ZToKPgo+IO+7v09uIDAzLzEwLzIw
MTksIDIxOjU5LCAiQW5kcmV3IENvb3BlciIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+Cj4gICAgIFB1dCB0b2dldGhlciBhbiBpbnRyb2R1Y3Rpb24gcGFnZSBmb3IgdGhlIFNw
aGlueC9SU1QgZG9jcywgYWxvbmcgd2l0aCBhCj4gICAgIGdsb3NzYXJ5IHdoaWNoIHdpbGwgYWNj
dW11bGF0ZSBvdmVyIHRpbWUuCj4gICAgIAo+ICAgICBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Cj4gUmV2aWV3ZWQtYnk6IExhcnMgS3Vy
dGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4KPiBUaGVyZSB3ZXJlIGEgZmV3
IG1pbm9yIGltcHJvdmVtZW50cyB3aGljaCBjb3VsZCBiZSBtYWRlLCBJIGFtIGxpc3RpbmcgdGhl
c2UKPiBiZWxvdywgYnV0IG5vbmUgYXJlIHNob3ctc3RvcHBlcnMuCj4KPiAgICAgK1hlbiBpcyBh
biBvcGVuIHNvdXJjZSwgYmFyZSBtZXRhbCBoeXBlcnZpc29yLiAgSXQgcnVucyBhcyB0aGUgbW9z
dCBwcml2aWxlZ2VkCj4gICAgICtwaWVjZSBvZiBzb2Z0d2FyZSwgYW5kIHNoYXJlcyB0aGUgcmVz
b3VyY2VzIG9mIHRoZSBoYXJkd2FyZSBiZXR3ZWVuIHZpcnR1YWwKPiBNYXliZSBiZXR0ZXI6IHMv
c29mdHdhcmUvc29mdHdhcmUgb24gdGhlIHN5c3RlbS8gb3Igcy9zb2Z0d2FyZS9zb2Z0d2FyZSBv
biB0aGUgaG9zdC8KCkZpeGVkLgoKPiAgICAgK21hY2hpbmVzLgo+Cj4gICAgICsgICBoYXJkd2Fy
ZSBkb21haW4KPiAgICAgKyAgICAgQSA6dGVybTpgZG9tYWluYCwgY29tbW9ubHkgZG9tMCwgd2hp
Y2ggc2hhcmVzIHJlc3BvbnNpYmlsaXR5IHdpdGggWGVuCj4gICAgICsgICAgIGFib3V0IHRoZSBz
eXN0ZW0gYXMgYSB3aG9sZS4KPiAgICAgKwo+ICAgICArICAgICBCeSBkZWZhdWx0IGl0IGdldHMg
YWxsIGRldmljZXMsIGluY2x1ZGluZyBhbGwgZGlza3MgYW5kIG5ldHdvcmsgY2FyZHMsIHNvCj4g
ICAgICsgICAgIGlzIHJlc3BvbnNpYmxlIGZvciBtdWx0aXBsZXhpbmcgZ3Vlc3QgSS9PCj4KPiBU
aGlzIGlzIGEgbGl0dGxlIHVuY2xlYXI6IGluIHBhcnRpY3VsYXIgdGhlIDFzdCBwYXJhZ3JhcGgu
IEVhcmxpZXIgeW91IHRhbGsgYWJvdXQgaGFyZHdhcmUKPiBkb21haW49InJlc3BvbnNpYmxlIGZv
ciBoYXJkd2FyZSBhbmQgbWFyc2hhbGxpbmcgZ3Vlc3QgSS9PIiwgd2hpY2ggaXMgY2xlYXJlci4g
Cj4KPiBNYXliZTogCj4KPiBBIDp0ZXJtOmBkb21haW5gLCBjb21tb25seSBkb20wLCB3aGljaCBo
b3N0cyBhbGwgZGV2aWNlcywgaW5jbHVkaW5nIGRpc2tzCj4gYW5kIG5ldHdvcmsgY2FyZHMgYW5k
IGlzIHJlc3BvbnNpYmxlIGZvciBtdWx0aXBsZXhpbmcgZ3Vlc3QgSS9PCj4KPiBpcyBiZXR0ZXIK
ClNhZGx5LCBpdHMgbm90IGFjY3VyYXRlLgoKTXVsdGlwbGV4aW5nIG9mIEkvTyBpcyBvbmx5IGlu
IHRoZSBjYXNlIHRoYXQgZGV2aWNlIGRyaXZlciBkb21haW5zCmFyZW4ndCBpbiB1c2UuwqAgVGhl
IG90aGVyIGV4YW1wbGUgeW91IGNpdGUgaXMgYSBkZXNjcmlwdGlvbiBvZiB0aGUKYXNzb2NpYXRl
ZCBpbWFnZS4KClRoZXJlIGFyZSB0aGluZ3MgYmVzaWRlcyBJL08gd2hpY2ggdGhlIGhhcmR3YXJl
IGRvbWFpbiBpcyByZXNwb25zaWJsZQpmb3IsIHN1Y2ggYXMgQVBDSSBPUFNNIChidXQgb25seSBp
biB4ODYpLCBhbmQgc3lzdGVtIHJlYm9vdCBldGMuCgpJIGhhdmUgbGVmdCB0aGUgZGVzY3JpcHRp
b24gYXMtaXMsIGZvciBsYWNrIG9mIGFuIG9idmlvdXNseSBiZXR0ZXIgd2F5Cm9mIGV4cHJlc3Np
bmcgdGhpbmdzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
