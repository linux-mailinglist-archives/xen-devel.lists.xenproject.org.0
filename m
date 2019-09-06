Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71680ABC7F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:30:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6G9E-0006sk-UC; Fri, 06 Sep 2019 15:27:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YHqG=XB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i6G9E-0006sf-3z
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:27:40 +0000
X-Inumbo-ID: dbc5bc76-d0ba-11e9-abf7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dbc5bc76-d0ba-11e9-abf7-12813bfff9fa;
 Fri, 06 Sep 2019 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567783658;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=AEpbbl40ilUcgHhigB39tOait3yFcFblXHLix1fPV7Q=;
 b=YQIntSh3Z5/f3mCBpJX5RgkpLcqFpTq8PTftu8jFMmxBlR0rpy4nDjcJ
 FflPUSYtST5GGlFF6ZFL9OyvzZ8qNWc7FRTOtA+gUEuwC0H9VXLjF8DUx
 nS81crbP/j4efHE2+zBAcQKbWPzbhv2/6O82qR/myqXWbQJxHVjU/WO8Q I=;
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
IronPort-SDR: mJoY07LSIirLmsv1ISoX6IdJRyMceyv+ldYXigXkTqFpERd7e/ImB9maPN/wDHdwyB5vtGgLGd
 acVLOk2s01RFqwFxCgQufEqeW+aQcmzT0PepR2UZeoNold4vdXW+62I/ynwHyODtiC0WMZGYo+
 7a/QCj3FJfibAx3xiitczXs380EU3tkstfB7pMbUIZ+vxtX8Cc8ssir41gk6T//37mcHiB6Pbc
 NtJNJDXT8N+V5jnbWTbNviX8q/5eNZvD8tWBYmHQ89Axg50aRCdqfMG9/txsj2PqmcYZ1MMCh/
 DLc=
X-SBRS: 2.7
X-MesageID: 5474571
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,473,1559534400"; 
   d="scan'208";a="5474571"
To: Jan Beulich <jbeulich@suse.com>
References: <20190905194909.6811-1-andrew.cooper3@citrix.com>
 <a7787fb5-02ea-61a0-b503-21b21c2961aa@suse.com>
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
Message-ID: <7a0a832d-e7a6-7f2f-66be-7d0af44aa3ff@citrix.com>
Date: Fri, 6 Sep 2019 16:27:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a7787fb5-02ea-61a0-b503-21b21c2961aa@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/cpuid: Extend the cpuid= option to
 support all named features
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDkvMjAxOSAxNjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMDkuMjAxOSAy
MTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdWlkLmMK
Pj4gKysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKPj4gQEAgLTIxLDQ1ICsyMSw2MiBAQCBzdGF0
aWMgY29uc3QgdWludDMyX3QgZGVlcF9mZWF0dXJlc1tdID0gSU5JVF9ERUVQX0ZFQVRVUkVTOwo+
PiAgCj4+ICBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV94ZW5fY3B1aWQoY29uc3QgY2hhciAqcykK
Pj4gIHsKPj4gKyAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGZlYXR1cmUgewo+PiArICAgICAgICBj
b25zdCBjaGFyICpuYW1lOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgYml0Owo+PiArICAgIH0g
ZmVhdHVyZXNbXSBfX2luaXRjb25zdCA9IElOSVRfRkVBVFVSRV9OQU1FUywgKmxocywgKm1pZCwg
KnJoczsKPiBUaGUgcG9pbnRlciBmaWVsZCB3YW50IHRoaXMgdG8gdXNlIF9faW5pdGNvbnN0cmVs
LgoKT2suCgo+IEFuZCBJIGRvbid0IHRoaW5rIHlvdSBtZWFuIGxocywgbWlkLCBhbmQgcmhzIHRv
IGFsc28gYmUgc3RhdGljPwoKTm8gLSBub3QgaW50ZW50aW9uYWwuCgo+ICBBbGJlaXQgLi4uCj4K
Pj4gICAgICBjb25zdCBjaGFyICpzczsKPj4gICAgICBpbnQgdmFsLCByYyA9IDA7Cj4+ICAKPj4g
ICAgICBkbyB7Cj4+ICsgICAgICAgIGNvbnN0IGNoYXIgKmZlYXQ7Cj4+ICsKPj4gICAgICAgICAg
c3MgPSBzdHJjaHIocywgJywnKTsKPj4gICAgICAgICAgaWYgKCAhc3MgKQo+PiAgICAgICAgICAg
ICAgc3MgPSBzdHJjaHIocywgJ1wwJyk7Cj4+ICAKPj4gLSAgICAgICAgaWYgKCAodmFsID0gcGFy
c2VfYm9vbGVhbigibWQtY2xlYXIiLCBzLCBzcykpID49IDAgKQo+PiAtICAgICAgICB7Cj4+IC0g
ICAgICAgICAgICBpZiAoICF2YWwgKQo+PiAtICAgICAgICAgICAgICAgIHNldHVwX2NsZWFyX2Nw
dV9jYXAoWDg2X0ZFQVRVUkVfTURfQ0xFQVIpOwo+PiAtICAgICAgICB9Cj4+IC0gICAgICAgIGVs
c2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigiaWJwYiIsIHMsIHNzKSkgPj0gMCApCj4+IC0g
ICAgICAgIHsKPj4gLSAgICAgICAgICAgIGlmICggIXZhbCApCj4+IC0gICAgICAgICAgICAgICAg
c2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVBVFVSRV9JQlBCKTsKPj4gLSAgICAgICAgfQo+PiAt
ICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImlicnNiIiwgcywgc3MpKSA+
PSAwICkKPj4gLSAgICAgICAgewo+PiAtICAgICAgICAgICAgaWYgKCAhdmFsICkKPj4gLSAgICAg
ICAgICAgICAgICBzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9GRUFUVVJFX0lCUlNCKTsKPj4gLSAg
ICAgICAgfQo+PiAtICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oInN0aWJw
Iiwgcywgc3MpKSA+PSAwICkKPj4gLSAgICAgICAgewo+PiAtICAgICAgICAgICAgaWYgKCAhdmFs
ICkKPj4gLSAgICAgICAgICAgICAgICBzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9GRUFUVVJFX1NU
SUJQKTsKPj4gLSAgICAgICAgfQo+PiAtICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jv
b2xlYW4oImwxZC1mbHVzaCIsIHMsIHNzKSkgPj0gMCApCj4+IC0gICAgICAgIHsKPj4gLSAgICAg
ICAgICAgIGlmICggIXZhbCApCj4+IC0gICAgICAgICAgICAgICAgc2V0dXBfY2xlYXJfY3B1X2Nh
cChYODZfRkVBVFVSRV9MMURfRkxVU0gpOwo+PiAtICAgICAgICB9Cj4+IC0gICAgICAgIGVsc2Ug
aWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigic3NiZCIsIHMsIHNzKSkgPj0gMCApCj4+ICsgICAg
ICAgIC8qIFNraXAgdGhlICduby0nIHByZWZpeCBmb3IgbmFtZSBjb21wYXJpc29ucy4gKi8KPj4g
KyAgICAgICAgZmVhdCA9IHM7Cj4+ICsgICAgICAgIGlmICggc3RybmNtcChzLCAibm8tIiwgMykg
PT0gMCApCj4+ICsgICAgICAgICAgICBmZWF0ICs9IDM7Cj4+ICsKPj4gKyAgICAgICAgLyogKFJl
KWluaXRhbGlzZSBsaHMgYW5kIHJocyBmb3IgYmluYXJ5IHNlYXJjaC4gKi8KPj4gKyAgICAgICAg
bGhzID0gZmVhdHVyZXM7Cj4+ICsgICAgICAgIHJocyA9IGZlYXR1cmVzICsgQVJSQVlfU0laRShm
ZWF0dXJlcyk7Cj4gLi4uIHRoZSBjb21tZW50IGhlcmUgc3VnZ2VzdHMgeW91IGRvLCBidXQgSSBk
b24ndCBjdXJyZW50bHkgc2VlIHdoeS4KCldlIGFyZSBpbnNpZGUgYSBkbyB7IH0gKCkgd2hpbGUg
bG9vcCwgcGFyc2luZyBzb21ldGhpbmcgc3VjaCBhcwpjcHVpZD1hdng1MTIsc3Msc214CgpUaGUg
YmluYXJ5IHNlYXJjaCBvdmVyIHRoZSBmZWF0dXJlIG5hbWVzIG5lZWRzIHRvIHN0YXJ0IGFnYWlu
IGZyb20Kc2NyYXRjaCBmb3IgZWFjaCBuZXcgY3B1aWQ9IGxpc3QgaXRlbS4KCk90aGVyd2lzZSwg
dGhlIHdoaWxlICggbGhzIDwgcmhzICkgYmluYXJ5IHNlYXJjaCB3aWxsIG5ldmVyIGJlIGVudGVy
ZWQKZm9yIHRoZSBzZWNvbmQgY3B1aWQ9IGl0ZW0uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
