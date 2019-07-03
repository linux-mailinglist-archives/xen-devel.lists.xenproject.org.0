Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED805E2F4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:40:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidZy-0004mB-Am; Wed, 03 Jul 2019 11:37:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZJKH=VA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hidZx-0004m5-Er
 for xen-devel@lists.xen.org; Wed, 03 Jul 2019 11:37:37 +0000
X-Inumbo-ID: f3c4667c-9d86-11e9-9ea5-a3ab29f75238
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3c4667c-9d86-11e9-9ea5-a3ab29f75238;
 Wed, 03 Jul 2019 11:37:35 +0000 (UTC)
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
IronPort-SDR: PqZch0IphMTd0A0XeoSsatGvyWyZrTJndDc+vPRuR6EVi0a4jA90ngs+s1S8GK17RZYfzxtyIU
 isulTS+zIUPygV0sUDJ4gG2iG36G5DOcAVBTcBTmCNeMcAvuOMk9cmvWKp22Ue8rQZvsW7sdIP
 VQND97V6/q+jjoMtuOhC/kZNl9pTiHkaNbsiXroeK29FyYvgrajjajeTJgfPMUdmixEd+eLfnL
 goOFzWty+HXnjcNYPOYgcMPf1aG1jQZlMt7i+lqy0LYFihQ5n1eU8kbbqgpPqbmW3Dcdmkjfjp
 cXc=
X-SBRS: 2.7
X-MesageID: 2559802
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2559802"
To: Jan Beulich <JBeulich@suse.com>
References: <1548943164-24888-1-git-send-email-andrew.cooper3@citrix.com>
 <5C53054A0200007800212C98@prv1-mh.provo.novell.com>
 <f2777259-176d-ff46-5450-13ed6b9c5800@citrix.com>
 <5C5328590200007800212E7A@prv1-mh.provo.novell.com>
 <8e823487-3f3a-fc7e-4ffc-9bda20c3d5da@citrix.com>
 <5C53F7B0020000780021305B@prv1-mh.provo.novell.com>
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
Message-ID: <ee4f96eb-d47a-6f2f-9963-7b3ae7f7e94c@citrix.com>
Date: Wed, 3 Jul 2019 12:37:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5C53F7B0020000780021305B@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/pv: Enable pv-l1tf mitigations for dom0
 by default
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
Cc: Juergen Gross <JGross@suse.com>, Xen-devel <xen-devel@lists.xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEvMDIvMjAxOSAwNzozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gQmFzaWNhbGx5LCBp
ZiB5b3UndmUgZ290IGFuIHVwZGF0ZWQgZG9tMCBrZXJuZWwsIHlvdSdsbCBiZSBmaW5lIGV2ZW4K
Pj4+PiB3aXRoIHRoaXMgZGVmYXVsdCBmbGlwcGVkLiAgSWYgeW91J3ZlIGZvcmdvdHRlbi9taXNz
ZWQgdGhhdCwgdGhlbiB5b3UncmUKPj4+PiBhbHJlYWR5IHdpZGUgb3BlbiAoaW4gYSBsYWNrIG9m
IGRlZmVuY2UgaW4gZGVwdGggd2F5KSBhbmQgZmxpcHBpbmcgdGhlCj4+Pj4gZGVmYXVsdCBoZXJl
IHdpbGwgbWFrZSB0aGluZ3MgYmxpbmRseSBvYnZpb3VzLgo+Pj4gV2VsbCwgZm9yIG5ldyB2ZXJz
aW9ucyBmbGlwcGluZyB0aGUgZGVmYXVsdCBtYXkgaW5kZWVkIGJlIGFjY2VwdGFibGUKPj4+IGJh
c2VkIG9uIHRoaXMgYXJndW1lbnQuIEJ1dCBldmVuIHRoZW4gLSBhbmQgZXZlbiBtb3JlIHNvIGZv
ciBzdGFibGUKPj4+IHZlcnNpb25zIC0gdGhlIGNoYW5nZSBpbiBiZWhhdmlvciBtYXkgY29tZSBh
cyBhIHN1cnByaXNlIHRvIHBlb3BsZQo+Pj4gd2hvIGhhdmUgcGVyaGFwcyBldmVuIGRlbGliZXJh
dGVseSBjaG9zZW4gbm90IHRvIHVwZ3JhZGUgdGhlaXIKPj4+IGtlcm5lbHMuCj4+IElmIGl0IHdl
cmUgbm90IHdpdGggdGhlIGluc3RhYmlsaXR5LCBYU0EtMjczIHdvdWxkIGhhdmUgZ29uZSBvdXQg
d2l0aAo+PiB0aGlzIGRlZmF1bHQuCj4gSSdtIG5vdCBzdXJlIHRoaXMgd291bGQgaGF2ZSBiZWVu
IHRoZSBjYXNlIC0gdGhlIGFyZ3VtZW50IG9mCj4gYXZvaWRpbmcgYSBob3N0IGNyYXNoIHdvdWxk
IHN0aWxsIGhhdmUgYmVlbiBvbmUgdG8gY29uc2lkZXIuCj4gSSd2ZSBqdXN0IGNoZWNrZWQsIGFu
ZCBJIGRpZCBicmluZyB1cCB0aGF0IGFzcGVjdCBiYWNrIGF0IHRoZQo+IHRpbWUgYWxyZWFkeSwg
ZXNwZWNpYWxseSBhbHNvIGZvciB0aGUgIVNIQURPV19QQUdJTkcgY2FzZQo+ICh3aGVyZSBJIGFs
c28gY29udGludWUgdG8gdGhpbmsgaXQgd291bGQgYmUgd3JvbmcgdG8gY3Jhc2ggdGhlCj4gaG9z
dCBieSBkZWZhdWx0KSwgaXJyZXNwZWN0aXZlIG9mIHdoZXRoZXIgYWN0dWFsbHkgYnVpbGRpbmcg
dGhhdAo+IHdheSBpcyBhIHZpYWJsZSBvcHRpb24gYXQgdGhlIG1vbWVudC4KCkkga25vdyB3aGF0
IHlvdSBzYWlkIGF0IHRoZSB0aW1lLCBhbmQgcGVyaGFwcyBpdCBvdWdodCB0byBiZSB0ZWxsaW5n
CnRoYXQgeW91IGRpZG4ndCBjaGFuZ2UgbXkgbWluZC4KCkl0IGlzIGZyYW5rbHkgZXhoYXVzdGlu
ZyBoYXZpbmcgdGhpcyBhcmd1bWVudCByZXBlYXRlZGx5LCBidXQgbXkKcG9zaXRpb24gaXMgbm90
IGNoYW5naW5nLgoKVG8gYmUgYWJzb2x1dGVseSBjbGVhciwgSSB3b3VsZCBoYXZlIGdvbmUgYXMg
ZmFyIGFzIG5hY2tpbmcgYW4gYXR0ZW1wdAp0byBtYWtlIGl0IG5vdCB0aGUgZGVmYXVsdCwgaGFk
IGl0IG5vdCBiZWVuIGZvciB0aGUgaW5zdGFiaWxpdHkgd2UKdWx0aW1hdGVseSBmYWlsZWQgdG8g
Zml4IHdpdGhpbiB0aGUgZW1iYXJnbyB3aW5kb3cuCgpBYm91dCB+MTAwJSBvZiBkZXBsb3ltZW50
cyB3aGljaCBhcmUgZ29pbmcgdG8gdGFrZSB0aGlzIGNoYW5nZSB3aWxsIGhhdmUKYSBmaXhlZCBk
b20wIGtlcm5lbCwgc28gdGhpcyBpcyBhIG5vLW9wIGluIHRlcm1zIG9mIGJlaGF2aW91ci4KCkhv
d2V2ZXIsIHdlIHJlYWxseSBkbyBoYXZlIHByb2R1Y3Rpb24gZG93bnN0cmVhbSB1c2VycyB3aGVy
ZSBkb20wCmRvZXNuJ3QgaGF2ZSBjYXJ0ZSBibGFuY2ggYWNjZXNzIHRvIGd1ZXN0IG1lbW9yeSwg
YW5kIHRoZXJlZm9yZSB0aGUgImlzCmFsbCBwb3dlcmZ1bCIgYXJndW1lbnQgaXMgZmFsc2UuwqAg
Rm9yIHRob3NlIGRlcGxveW1lbnRzLCB0aGUgY3VycmVudApkZWZhdWx0IGlzIGEgc2VjdXJpdHkg
cmlzay4KCkRvbTAgaXMgbm90IHN1ZmZpY2llbnRseSBzcGVjaWFsIHRoYXQgdGhlIHB2LWwxdGYg
ZGVmYXVsdCB3YXJyYW50cyBiZWluZwp0aGUgb2RkLWZlYXR1cmUtb3V0LgoKfkFuZHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
