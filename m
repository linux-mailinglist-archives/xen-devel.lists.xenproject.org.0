Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD35F122B7D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 13:28:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBvq-0000C6-VY; Tue, 17 Dec 2019 12:26:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMsG=2H=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ihBvo-0000C1-Lw
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 12:26:28 +0000
X-Inumbo-ID: 7274daf0-20c8-11ea-8ebb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7274daf0-20c8-11ea-8ebb-12813bfff9fa;
 Tue, 17 Dec 2019 12:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576585587;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=32dbznOFgGWXa8M+VOik40ovOwJOeVH2qe474FAqYBw=;
 b=MD+0IwiWRitG1SNKp9X5syADP9vpucAZZL5/ZyGo/Qq0zgOt4L7sPUmC
 C3GNCQX11vYkZhaY0cHg+WuQ9PirAu/5L8ageFhGOVenxhuImyw44VCTG
 v1r0TZSZmfi1f2uSMnNNmJcnoiq7U4GRriYZIyehJ2TLniHwcGmeP2XrL I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zrqI43KEsMhheHKgJVLQfwe3gItopa0UZWD18E2Nc6I01v4GtwVHjBHNQl5K8c4BMEiAhEyAyz
 y2YC3N9JBCepseyLKfaPfjwZrqi48/aWntq5igqf2hyTM7PlztKq8/9p3N+YfYpRZN1nyuVD53
 BWU3Io4cx6j0yGq1zXSNRMBZN9qrvlDb8aCeeSg1DyPjRRCQhFoKs/el3wGkn2KXCFVrG5OxfW
 8sScNs24mN27CRh3lm3jRASfkxT7eFxOXb6y7kWC9XhjIvcD4a11RIMICbSzf+2YYos784cYkT
 1bQ=
X-SBRS: 2.7
X-MesageID: 10160953
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10160953"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-3-andrew.cooper3@citrix.com>
 <20191217115241.GT11756@Air-de-Roger>
 <e9003fba-83e8-1509-224e-5374cd9a99a1@citrix.com>
 <20191217121813.GX11756@Air-de-Roger>
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
Message-ID: <b98724c9-6702-ef1f-c6c0-74c6f5fceb20@citrix.com>
Date: Tue, 17 Dec 2019 12:26:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191217121813.GX11756@Air-de-Roger>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/6] x86/suspend: Don't bother saving %cr3,
 %ss or flags
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMTIvMjAxOSAxMjoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAxNywgMjAxOSBhdCAxMjowNjowMVBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxNy8xMi8yMDE5IDExOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gRnJpLCBE
ZWMgMTMsIDIwMTkgYXQgMDc6MDQ6MzJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
PiBUaGUgdHJhbXBvbGluZSBoYXMgYWxyZWFkeSBzZXQgdXAgdGhlIGlkbGUgcGFnZXRhYmxlcyAo
d2hpY2ggYXJlIHRoZSBjb3JyZWN0Cj4+Pj4gb25lcyB0byB1c2UpLCBhbmQgc2FuaXRpc2VkIHRo
ZSBmbGFncyBzdGF0ZS4KPj4+IEkgd29uZGVyIHdoeSBkbyB3ZSBoYXZlIHdha2V1cC5TIGFuZCB3
YWtldXBfcHJvdC5TLCBpdCB3b3VsZCBiZSBlYXNpZXIKPj4+IHRvIGZvbGxvdyBpZiBpdCBhbGwg
d2FzIGluIHRoZSBzYW1lIGZpbGUgSU1PLgo+PiB3YWtldXAuUyBpcyB0aGUgMTZiaXQgZW50cnkg
cG9pbnQsIGFuZCBsaXZlcyBpbiB0aGUgdHJhbXBvbGluZSBiZWxvdyAxTS4KPj4KPj4gd2FrZXVw
X3Byb3QuUyBpcyBhIGJpdCBvZiBsb2dpYyB3aGljaCBsaXZlcyBpbiB0aGUgbWFpbiBoeXBlcnZp
c29yLgo+Pgo+PiBUaGUgbmFtaW5nIGNvdWxkIHByb2JhYmx5IGRvIHdpdGggc29tZSBpbXByb3Zl
bWVudCwgYnV0IHRoZXkgY2FuJ3QKPj4gZmVhc2libHkgYmUgcGFydCBvZiB0aGUgc2FtZSBmaWxl
Lgo+IEhtLCBJJ20gbm90IHN1cmUgSSBmb2xsb3cuIElzbid0IHRoaXMgdHJhbXBvbGluZSBjb3Bp
ZWQgYnkgWGVuIGluIGEKPiBzdWl0YWJsZSBwb3NpdGlvbiBiZWxvdyB0aGUgMU0gYm91bmRhcnks
IGFuZCBoZW5jZSBjb3VsZCB1c2Ugc3ltYm9scwo+IGluIG9yZGVyIHRvIGZpZ3VyZSBvdXQgd2hp
Y2ggcGFydCB0byBjb3B5Pwo+Cj4gSWU6IGJvdGggdGhlIGxvdyBhbmQgdGhlIGhpZ2ggcGFydCBj
b3VsZCBsaXZlIGluIHRoZSBzYW1lIGZpbGUgYXMgbG9uZwo+IGFzIFhlbiBrbm93cyBob3cgdG8g
ZGlmZmVyZW50aWF0ZSB0aG9zZSBhbmQgd2hpY2ggY2h1bmsgbmVlZHMKPiBwb3NpdGlvbmluZyBi
ZWxvdyAxTT8KClRoZXJlIGlzIG9uZSB0cmFtcG9saW5lLlMgKGFuZCB0cmFtcG9saW5lLm8pIHdo
aWNoIGdhdGhlcnMgdG9nZXRoZXIKdmFyaW91cyBmaWxlcyAoaW5jbHVkaW5nIHdha2V1cC5TKSB0
byBjb25zdHJ1Y3QgdGhlIHRyYW1wb2xpbmUuCgpJdCBpcyBub3Qgc29tZXRoaW5nIHdoaWNoIGNh
biBiZSBjb25zdHJ1Y3RlZCBzaW1wbHkgYnkgcHV0dGluZyBjb2RlL2RhdGEKaW4gdGhlIHJlcXVp
c2l0ZSBzZWN0aW9ucy7CoCBUaGVyZSBhcmUgdHdvIG1haW4gZW50cnlwb2ludHMsIG9uZSB3aXRo
IGEKNGsgYWxpZ25tZW50IHJlcXVpcmVtZW50LCBvbmUgd2l0aCAxNiBieXRlIGFsaWdubWVudCwg
YW5kIHdlIHNwbGl0IHRoZQp0cmFtcG9saW5lIGludG8gdHdvIHBhcnRzIC0gb25lIHdoaWNoIGlz
IEJTUC1vbmx5IGFuZCBpcyBzZXZlcmFsIHBhZ2VzCmluIHNpemUsIGFuZCBvbmUgd2hpY2ggaXMg
cG9zdC1ib290IHdoaWNoIGlzIG9ubHkgYSBzaW5nbGUgcGFnZS4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
