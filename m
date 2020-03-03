Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC34177E9E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 19:51:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9CZy-0006wf-7S; Tue, 03 Mar 2020 18:47:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yrn2=4U=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j9CZw-0006wY-Ck
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 18:47:40 +0000
X-Inumbo-ID: 74995c40-5d7f-11ea-a203-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74995c40-5d7f-11ea-a203-12813bfff9fa;
 Tue, 03 Mar 2020 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583261259;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YhJgEj8PjopXZTIQeY89supaUJcOUDYQ9dulNjI1uxo=;
 b=Md2WpEHEBGOXPWE5mIo8husVcL9UAE9y8RuwTArSPBTsKoAA8wYsL+F5
 gyMP34wgk2kpuCg5y2O7dgtTrutdaKqF8ezYEGUMoCaWys+AGdlrPZgAJ
 5SLIEixXMJWykRjwea8GqWxa6U1Ms4a7wb6djPDhOd/FVhfvh32uezABd A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: phMwEGyN63QlHiQqzFbHMMeuHQ65W8Np21v8kRjZYDVrkVbIWcaOKtUI5qLGJDrYNdNoLrBLtc
 a5x9iUEt+FqJ+u+Hrh3PBuKgFj7Sz+CD10RHKyHuVnjsXpUxSIA/zH5sfhb5Q6MP8WfLTA2VYp
 rrz/NbOv+ySgcjtXhOdPl7NX8EESQZOh5PJJ8mpbNqrELL2Fwq/Zmnta10vpvjIwRGSRINp1Rg
 t8u1tEj3v8MsXuCpOMb9TZmXzSXNldtzNLRvDWYgchqD4kYy0WV8JuTdaPrnu7FqMqv+iLWyu9
 EoU=
X-SBRS: 2.7
X-MesageID: 13332177
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,511,1574139600"; d="scan'208";a="13332177"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200303115253.47449-1-roger.pau@citrix.com>
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
Message-ID: <a85ca6e1-f02b-0576-3b59-e331da2607cd@citrix.com>
Date: Tue, 3 Mar 2020 18:47:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200303115253.47449-1-roger.pau@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/dom0: improve PVH initrd and
 metadata placement
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDMvMjAyMCAxMTo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IERvbid0IGFzc3Vt
ZSB0aGVyZSdzIGdvaW5nIHRvIGJlIGVub3VnaCBzcGFjZSBhdCB0aGUgdGFpbCBvZiB0aGUKPiBs
b2FkZWQga2VybmVsIGFuZCBpbnN0ZWFkIHRyeSB0byBmaW5kIGEgc3VpdGFibGUgbWVtb3J5IGFy
ZWEgd2hlcmUgdGhlCj4gaW5pdHJkIGFuZCBtZXRhZGF0YSBjYW4gYmUgbG9hZGVkLgo+Cj4gUmVw
b3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJIGNh
biBjb25maXJtIHRoYXQgdGhpcyBmaXhlcyB0aGUgImZhaWxlZCB0byBib290IFBWSCIgb24gbXkg
Um9tZSBzeXN0ZW0uCgpUZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+CgpXZSd2ZSBzdGlsbCBnb3QgdGhlIGV4Y2Vzc2l2ZS10aW1lLXRvLWNvbnN0cnVj
dCBpc3N1ZXMgdG8gbG9vayBhdCwgYnV0CnRoaXMgZGVmaW5pdGVseSBicmluZ3MgdGhpbmdzIHRv
IGEgYmV0dGVyIHBvc2l0aW9uLgoKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9kb20w
X2J1aWxkLmMgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+IGluZGV4IGVkZWQ4N2Vh
ZjUuLjMzNTIwZWMxYmMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxk
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYwo+IEBAIC00OTAsNiArNDkw
LDQ1IEBAIHN0YXRpYyBpbnQgX19pbml0IHB2aF9wb3B1bGF0ZV9wMm0oc3RydWN0IGRvbWFpbiAq
ZCkKPiAgI3VuZGVmIE1CMV9QQUdFUwo+ICB9Cj4gIAo+ICtzdGF0aWMgcGFkZHJfdCBmaW5kX21l
bW9yeShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgZWxmX2JpbmFyeSAqZWxm
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSkKPiArewo+ICsgICAg
cGFkZHJfdCBrZXJuZWxfc3RhcnQgPSAocGFkZHJfdCllbGYtPmRlc3RfYmFzZTsKPiArICAgIHBh
ZGRyX3Qga2VybmVsX2VuZCA9IChwYWRkcl90KShlbGYtPmRlc3RfYmFzZSArIGVsZi0+ZGVzdF9z
aXplKTsKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgIGZvciAoIGkgPSAwOyBpIDwg
ZC0+YXJjaC5ucl9lODIwOyBpKysgKQo+ICsgICAgewo+ICsgICAgICAgIHBhZGRyX3Qgc3RhcnQs
IGVuZCA9IGQtPmFyY2guZTgyMFtpXS5hZGRyICsgZC0+YXJjaC5lODIwW2ldLnNpemU7Cj4gKwo+
ICsgICAgICAgIC8qIERvbid0IHVzZSBtZW1vcnkgYmVsb3cgMU1CLCBhcyBpdCBjb3VsZCBvdmVy
d3JpdGUgdGhlIEJEQS9FQkRBLiAqLwoKVGhlIEJEQSBpcyBpbiBtZm4gMCBzbyBpcyBzcGVjaWFs
IGZvciBvdGhlciByZWFzb25zKi7CoCBUaGUgRUJEQSBhbmQgSUJGVAphcmUgdGhlIHByb2JsZW0g
ZGF0YXN0cnVjdHVyZXMuCgp+QW5kcmV3CgpbKl0gVGhpbmtpbmcgYWJvdXQgaXQsIGhvdyBzaG91
bGQgYSBQVkggaGFyZHdhcmUgZG9tYWluIHJlY29uY2lsZSBpdHMKcGFyYXZpcnR1YWxpc2VkIGJv
b3Qgd2l0aCBmaW5kaW5nIGl0c2VsZiBvbiBhIEJJT1Mgb3IgRUZJIHN5c3RlbS4uLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
