Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B812C13CD0D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 20:26:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iroFN-0004uI-9q; Wed, 15 Jan 2020 19:22:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aRIg=3E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iroFL-0004tp-K5
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 19:22:31 +0000
X-Inumbo-ID: 5abae754-37cc-11ea-ac27-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5abae754-37cc-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579116143;
 h=from:subject:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UUYkQsmoWJJY47vTl8WXKZ09xIp4KBSwh5vmkL/uXZ4=;
 b=A6dcANE4IkILf3NtlAnMgGoOywR3kjZLZnQ9fWSUcLp5izZHnY9zodD1
 9gir2nZmcHSZmXXVOrQFTpKMEkfHlC2gC9hYTPCjXExjr1zbByDlAum5/
 S6lR71DpZ9MlyLOBnW1RdxhO85Li20h6z+qpVIYTfqln0JOONsj2CHtzP 4=;
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
IronPort-SDR: fsPErOvvnctstYAjdfEW8aL8MQemc+Wb9ukrllbkL8d9EeqlInvh9TWKtDsJtQxgyWN6DxvIKi
 dbTNBoqkS/E6/Ak9V69iTYkUn88rp3l6vGMKKginzUowVNHtMxvML3rYYbsHp+xVOt/52SodsA
 pWmqcfHPaPcNXm1JmoyiwF87VCLVCGDwNJhlJOC8yRWZh0A7Ftb9hxWds8mbK0ic890OeBkdJl
 epgqvJY4KBtghl3Lt/1UGpeJcv0HJuGpC1I6eflROI7P59KI1h8CnGLqr3U7zUz7+yFJgdlkUR
 FBc=
X-SBRS: 2.7
X-MesageID: 10961453
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,323,1574139600"; d="scan'208";a="10961453"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
 <24093.61657.676890.721999@mariner.uk.xensource.com>
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
Message-ID: <a10d1572-d5c5-716a-0651-aee2345348dd@citrix.com>
Date: Wed, 15 Jan 2020 19:22:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24093.61657.676890.721999@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 01/12] libxc/save: Shrink code volume where
 possible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDEvMjAyMCAxNjo0OCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggMDEvMTJdIGxpYnhjL3NhdmU6IFNocmluayBjb2RlIHZvbHVtZSB3aGVy
ZSBwb3NzaWJsZSIpOgo+PiBBIHByb3BlcnR5IG9mIGhvdyB0aGUgZXJyb3IgaGFuZGxpbmcgKDAg
b24gc3VjY2Vzcywgbm9uemVybyBvdGhlcndpc2UpCj4+IGFsbG93cyB0aGVzZSBjYWxscyB0byBi
ZSBjaGFpbmVkIHRvZ2V0aGVyIHdpdGggdGhlIHRlcm5hcnkgb3BlcmF0aW9yLgo+IEknbSBxdWl0
ZSBzdXJwcmlzZWQgdG8gZmluZCBhIHN1Z2dlc3Rpb24gbGlrZSB0aGlzIGNvbWluZyBmcm9tIHlv
dSBpbgo+IHBhcnRpY3VsYXIuCgpXaGF0IHByb2JhYmx5IGlzIHJlbGV2YW50IGlzIHRoYXQgPzog
aXMgYSBjb21tb24gY29uc3RydWN0IGluIHRoZQpoeXBlcnZpc29yLCB3aGljaCBJIHN1cHBvc2Ug
ZG9lcyBjb2xvdXIgbXkgZXhwZWN0YXRpb24gb2YgcGVvcGxlIGtub3dpbmcKZXhhY3RseSB3aGF0
IGl0IG1lYW5zIGFuZCBob3cgaXQgYmVoYXZlcy4KCj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGhhdmUKPiAgICAgI2RlZmluZSBNVVNUKGNhbGwpICh7IHJjID0gKGNhbGwpOyBpZiAocmMp
IGdvdG8gZXJyb3I7IH0pCj4gYW5kIHdyaXRlCj4gICAgIE1VU1QoIHdyaXRlX29uZV92Y3B1X2Jh
c2ljKGN0eCwgaSkgKTsKPgo+IE9yIGp1c3QgdG8gcGVybWl0Cj4gICAgcmMgPSB3cml0ZV9vbmVf
dmNwdV9iYXNpYyhjdHgsIGkpOyAgICBpZiAocmMpIGdvdG8gZXJyb3I7Cj4gKGllIG9uIGEgc2lu
Z2xlIGxpbmUpLgoKT1RPSCwgaXQgc2hvdWxkIGNvbWUgYXMgbm8gc3VycHJpc2UgdGhhdCBJJ2Qg
cmF0aGVyIGRyb3AgdGhpcyBwYXRjaAplbnRpcmVseSB0aGFuIGdvIHdpdGggdGhlc2UgYWx0ZXJu
YXRpdmVzLCBib3RoIG9mIHdoaWNoIGRldHJhY3QgZnJvbQpjb2RlIGNsYXJpdHkuwqAgVGhlIGZv
cm1lciBmb3IgaGlkaW5nIGNvbnRyb2wgZmxvdywgYW5kIHRoZSBsYXR0ZXIgZm9yCmJlaW5nIGF0
eXBpY2FsIGxheW91dCB3aGljaCB1bm5lY2Vzc2FyeSBjb2duaXRpdmUgbG9hZCB0byBmb2xsb3cu
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
