Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A852695DB
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:01:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2Rj-0007AW-Hm; Mon, 15 Jul 2019 14:59:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Co6f=VM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hn2Ri-0007AQ-0M
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:59:18 +0000
X-Inumbo-ID: 1d44ffdd-a711-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d44ffdd-a711-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:59:16 +0000 (UTC)
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
IronPort-SDR: DPU83T4N4r1Vei3NSpBflASFvsBznT29zwo6Ifmi/JRAnKH+2zhU6rYKdZcn4j5PoBV0686AN9
 sreagz3qKdsFdB2mcisAGbn390PyYWZk3acbIIiDcavJiuMeTw0DuG+mUdoAyyja3b9seEZ5T3
 JOwpfm4MJ63OrLd3nPb2svTU8gMMNKQHxrFSUxBS6RMxTGlLtKm8D34UZ1ZvWZy5ZkcnJ7bhoi
 PBWelBvKw/PS6+4dHGunCUS/QvDEadIZAJtt4nAZltBosqA3z+s+Nvl1g4AIH+b2XFRS/Jferp
 GSw=
X-SBRS: 2.7
X-MesageID: 3004147
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="3004147"
To: Jan Beulich <JBeulich@suse.com>
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
 <aed92669-d53d-1543-094b-a4c0458f944e@citrix.com>
 <f0fdc077-7897-e71d-fd86-cb8e2b389253@suse.com>
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
Message-ID: <c6eff584-4878-f0c7-9711-ac65b19abe73@citrix.com>
Date: Mon, 15 Jul 2019 15:59:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <f0fdc077-7897-e71d-fd86-cb8e2b389253@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMDcvMjAxOSAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMDcuMjAxOSAx
NTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTUvMDcvMjAxOSAxMTozNSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBXaXRoIG5vbi1lbXB0eSBDT05GSUdfRE9NMF9NRU0gY2xhbmc1IHBy
b2R1Y2VzCj4+Pgo+Pj4gZG9tMF9idWlsZC5jOjM0NDoyNDogZXJyb3I6IHVzZSBvZiBsb2dpY2Fs
ICcmJicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vycm9yLC1XY29uc3RhbnQtbG9naWNhbC1v
cGVyYW5kXQo+Pj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVsw
XSApCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+fn5+fn5+fn5+fn5+fn5+Cj4+
PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYnIGZvciBhIGJpdHdpc2Ugb3BlcmF0
aW9uCj4+PiAgICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklHX0RPTTBfTUVNWzBdICkK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICYKPj4+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBjb25zdGFudCB0byBz
aWxlbmNlIHRoaXMgd2FybmluZwo+Pj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJ
R19ET00wX01FTVswXSApCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4+PiAxIGVycm9yIGdlbmVyYXRlZC4KPj4+Cj4+PiBPYnZpb3VzbHkgbmVpdGhl
ciBvZiB0aGUgdHdvIHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVyZS4gT2RkbHkKPj4+IGVu
b3VnaCBzd2FwcGluZyB0aGUgb3BlcmFuZHMgb2YgdGhlICYmIGhlbHBzLCB3aGlsZSBlLmcuIGNh
c3Rpbmcgb3IKPj4+IHBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFub3RoZXIgd29ya2FibGUgdmFy
aWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mCj4+PiAhISBvbiB0aGUgY29uc3RhbnQuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gLS0t
Cj4+PiBJJ20gb3BlbiB0byBnb2luZyB0aGUgISEgb3IgeWV0IHNvbWUgZGlmZmVyZW50IHJvdXRl
LiBObyBtYXR0ZXIgd2hpY2gKPj4+IG9uZSB3ZSBjaG9vc2UsIEknbSBhZnJhaWQgaXQgaXMgZ29p
bmcgdG8gcmVtYWluIGd1ZXNzd29yayB3aGF0IG5ld2VyCj4+PiAoYW5kIGZ1dHVyZSkgdmVyc2lv
bnMgb2YgY2xhbmcgd2lsbCBjaG9rZSBvbi4KPj4+Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9t
MF9idWlsZC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4+PiBAQCAtMzQx
LDcgKzM0MSw3IEBAIHVuc2lnbmVkIGxvbmcgX19pbml0IGRvbTBfY29tcHV0ZV9ucl9wYWcKPj4+
ICAgICAgICB1bnNpZ25lZCBsb25nIGF2YWlsID0gMCwgbnJfcGFnZXMsIG1pbl9wYWdlcywgbWF4
X3BhZ2VzOwo+Pj4gICAgICAgIGJvb2wgbmVlZF9wYWdpbmc7Cj4+PiAgICAKPj4+IC0gICAgaWYg
KCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4+PiArICAgIGlmICggQ09O
RklHX0RPTTBfTUVNWzBdICYmICFkb20wX21lbV9zZXQgKQo+Pj4gICAgICAgICAgICBwYXJzZV9k
b20wX21lbShDT05GSUdfRE9NMF9NRU0pOwo+PiBGaXJzdCBhbmQgZm9yZW1vc3QsIHRoZXJlIGlz
IGFuIGlkZW50aWNhbCBjb25zdHJ1Y3Qgb24gdGhlIEFSTSBzaWRlLAo+PiB3aGljaCB3YW50cyBh
biBlcXVpdmFsZW50IGFkanVzdG1lbnQuCj4gT2gsIGluZGVlZC4gSSBzaG91bGQgaGF2ZSByZW1l
bWJlcmVkIC4uLgo+Cj4+IEFzIHRvIHRoZSBjaGFuZ2UsIEknbSBnb2luZyB0byBzdWdnZXN0IHdo
YXQgSSBzdWdnZXN0ZWQgaW5zdGVhZCBvZiB0aGlzCj4+IHRoZSBmaXJzdCB0aW1lIGFyb3VuZCwg
d2hpY2ggaXMgc3RybGVuKENPTkZJR19ET00wX01FTSkgdG8gbWFrZSB0aGUKPj4gbG9naWMgZWFz
aWVyIHRvIGZvbGxvdy4KPiBIb3cgZG9lcyB1c2Ugb2Ygc3RybGVuKCkgbWFrZSBhbnl0aGluZyBl
YXNpZXI/IEkgdGhpbmsgaXQgaXMgYSBwcmV0dHkKPiBjb21tb24gcGF0dGVybiB0byBjaGVjayB0
aGUgZmlyc3QgY2hhcmFjdGVyIGZvciBudWwgaWYgYWxsIG9uZSBpcwo+IGFmdGVyIGlzIHRvIGtu
b3cgd2hldGhlciBhIHN0cmluZyBpcyBlbXB0eS4KCk9ubHkgZm9yIHRoaW5ncyB3aGljaCBhcmUg
b2J2aW91c2x5IGEgc3RyaW5nLsKgIENPTkZJR19ET00wX01FTSBpc24ndC4KCkluIHRoaXMgY2Fz
ZSwgeW91IGhhdmUgYSBuYW1lIHdoaWNoIHdvdWxkIG1vc3Qgb2J2aW91c2x5IGJlIGFuIGludGVn
ZXIsCndoaWNoIGlzIGNvbXBpbGluZyBpbiBhIGNvbnRleHQgd2hlcmUgYW4gYXJyYXkgcmVmZXJl
bmNlIGlzIHZhbGlkLCB3aGljaAppcyBjb25mdXNpbmcgdG8gcmVhZC4KCkFzIHN0cmxlbigpIGlz
IGltcGxlbWVudGVkIHdpdGggYSBidWlsdGluLCBpdCBzaG91bGQgYmUgZXZhbHVhdGVkIGJ5IHRo
ZQpjb21waWxlciwgZ2l2ZW4gdGhhdCBDT05GSUdfRE9NMF9NRU0gaXMgYSBjb25zdGFudCwgYnV0
IGhvcGVmdWxseSB3b24ndAp0cmlnZ2VyIHRoaXMgd2FybmluZy4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
