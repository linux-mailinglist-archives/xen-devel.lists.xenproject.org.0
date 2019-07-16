Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC76A8CB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 14:30:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnMYW-0000vQ-On; Tue, 16 Jul 2019 12:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WCCO=VN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnMYV-0000vK-24
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 12:27:39 +0000
X-Inumbo-ID: 17097e4a-a7c5-11e9-a17f-4370eb7dd617
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17097e4a-a7c5-11e9-a17f-4370eb7dd617;
 Tue, 16 Jul 2019 12:27:35 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ciFljwFZ5uYcKFq8Pxfpcj9fEE2Tami3853UzihG0zz3pEJwcm18coLnlXzTzSI0hGuZu5cWSU
 K1JAzSgDQ1/CnKfgXqQrYPV21dfNGtwTeOHGjCRfBXhBEAIa3vHzW2dPNn+x5fVG8hoBqpKWdE
 DSOX/nau8duNO4XVdhSRw25RddTtoEGRtOlU/ZVtmndf2REHjff1XEI2e2ygkRxxVvIEesFzc/
 BIIhx51irjZqaW73ZoLrBDmonyTFivmHGe2gr4PxfjJPVRJS8/21cfHkIvkY21Ax5KmDlfXUrf
 B0g=
X-SBRS: 2.7
X-MesageID: 3101224
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,498,1557201600"; 
   d="scan'208";a="3101224"
To: xen-devel <xen-devel@lists.xenproject.org>
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
Message-ID: <3f24285c-b984-1dc5-7783-a1604a966bd0@citrix.com>
Date: Tue, 16 Jul 2019 13:27:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: [Xen-devel] Xen backports
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
Cc: Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpBZnRlciByZS1zeW5jaW5nIHRoZSBYZW5TZXJ2ZXIgcGF0Y2hxdWV1ZSBhZ2FpbnN0
IFhlbiA0LjEyLCBJIHRoaW5rIHRoZQpmb2xsb3dpbmcgcGF0Y2hlcyBhcmUgY2FuZGlkYXRlcyBm
b3IgYmFja3BvcnQuCgpCdWdmaXhlczoKCjY1YzE2NWQ2NTk1ZiAtIHg4Ni94c3RhdGU6IERvbid0
IHNwZWNpYWwgY2FzZSBmZWF0dXJlIGNvbGxlY3Rpb24KMDEzODk2Y2I4YjJmIC0geDg2L21zcjog
Rml4IGhhbmRsaW5nIG9mCk1TUl9BTURfUEFUQ0hMRVZFTC9NU1JfSUEzMl9VQ09ERV9SRVYKN2Qx
NjFmNjUzNzU1IC0geDg2L3N2bTogRml4IHN2bV92bWNiX2R1bXAoKSB3aGVuIHVzZWQgaW4gY3Vy
cmVudCBjb250ZXh0CjliNzU3YmRjMTc5NCAtIHg4Ni9ib290OiBEb24ndCBsZWFrIHRoZSBtb2R1
bGVfbWFwIGFsbG9jYXRpb24gaW4KX19zdGFydF94ZW4oKQoKVGhlIGJhY2twb3J0IGZvciB0aGUg
bWljcm9jb2RlIE1TUiBpcyByYXRoZXIgdHJpY2t5IHRvIHJlYmFzZSBvdmVyIHRoZQp4ODZfdmVu
ZG9yIGJpdG1hcCBjaGFuZ2VzLsKgIEkndmUgYWxyZWFkeSBnb3QgaXQgbG9jYWxseS4KCkVuaGFu
Y2VtZW50czoKCjc4NzYxOWEwNjQwZSAtIHRvb2xzOiByZS1zeW5jIENQVUlEIGxlYWYgNyB0YWJs
ZXMgKHBlcmhhcHMgb25seSB0aGUKeGVuLWNwdWlkIGJpdHMuKQoyNjBhY2M1MjFkYjQgLSB4ODYv
Y2xlYXJfcGFnZTogVXBkYXRlIGNsZWFyX3BhZ2Vfc3NlMigpIGFmdGVyIGRyb3BwaW5nCjMyYml0
IFhlbgo1NjRkMjYxNjg3YzAgLSB4ODYvY3R4dC1zd2l0Y2g6IERvY3VtZW50IGFuZCBpbXByb3Zl
IEdEVCBoYW5kbGluZwoKQWx0cDJtOiBXaGlsZSBhbHRwMm0gaXNuJ3Qgc3VwcG9ydGVkIHlldCwg
aXQgd291bGQgYmUgdmVyeSBoZWxwZnVsIHRvCnR3byBkb3duc3RyZWFtcyB0byB0YWtlIHRoZXNl
IGZpeGVzIHdoaWxlIHdlIHdvcmsgb24gZ2V0dGluZyBpdCBmdWxseQpzdXBwb3J0ZWQuCgo0NGYz
YzNjZGQzMTUgLSB4ODYvYWx0cDJtOiB0cmVhdCB2aWV3IDAgYXMgdGhlIGhvc3RwMm0gaW4KcDJt
X2dldF9tZW1fYWNjZXNzKCkKODIyODU3N2FkMWJhIC0geDg2L2h2bTogRml4IGFsdHAybV9vcCBo
eXBlcmNhbGwgY29udGludWF0aW9ucwo5YWJjYWM3ZmYxNDUgLSB4ODYvYWx0cDJtOiBjbGVhbnVw
IHAybV9hbHRwMm1fbGF6eV9jb3B5CmRmNGU0Y2FmZDI4ZCAtIHg4Ni9hbHRwMm06IEZpeCBzdHls
ZSBlcnJvcnMgaW50cm9kdWNlZCB3aXRoIGMvcyA5YWJjYWM3ZmYKCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
