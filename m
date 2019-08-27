Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959729F0A8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 18:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2eat-0005R2-MU; Tue, 27 Aug 2019 16:45:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ssFz=WX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i2eas-0005Qx-6Y
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 16:45:18 +0000
X-Inumbo-ID: 0c0cb1ec-c8ea-11e9-951b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c0cb1ec-c8ea-11e9-951b-bc764e2007e4;
 Tue, 27 Aug 2019 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566924317;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0z8UYaMa0kXpwo1TvtqElB0WUIZ7fl8dh2PDq5G7Mwk=;
 b=gUuIxSRnEcQeezBrcbb7YZWndojeYNg0G/Ldow+oPvUWXJvqrJqQ/cC4
 ot6GXKzq/2P4I5PE8C0wHGTzhVuKdrtnVQlcUqD4blamsXDXXnO6p3UO/
 ks8s/myvx3LSi/WVqxeAx+NPip1MhaJjFJmbcpi5EyemMRohzNWvzwzZu 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HXFSKWIrpm0DKkfI25MVeAM3X+m95DusWqylcLMeC1z1Adp0MQulPxyrjJw//+hijdxAob8oix
 BbwunyTU2s9HrsNHiboDkx0HnJw3HYA0bxz6QT8vuEiKL/rzRSVERubsHMzXHofI/Ih59s53ad
 7ZGJC+C8F19hHFRBF4nt8rP0Y0N8avXcSVbI7fLUFrVxNQKV2whW4zZa7FZyRxno522TyQNCqw
 tssmo5Hp2Tc+eNu8anCl3PLwmZ2XUPPZwi6Pmb8CU00X+0SqtUZIpF3T4AucJgDoNPWOrskRtr
 z8I=
X-SBRS: 2.7
X-MesageID: 4788052
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4788052"
To: Jan Beulich <jbeulich@suse.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3008be8e-a5ee-7e90-6ab0-daf44ee71d44@suse.com>
 <06684b85-6500-6066-d282-97ef4c0d1923@citrix.com>
 <da32d44d-286b-b80c-f1c0-22ccec9f627a@suse.com>
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
Message-ID: <4350302e-a01d-0c72-ba8d-e3b4486a7626@citrix.com>
Date: Tue, 27 Aug 2019 17:45:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <da32d44d-286b-b80c-f1c0-22ccec9f627a@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/6] x86emul: support WBNOINVD
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDgvMjAxOSAxNjowOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDguMjAxOSAx
Njo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDEvMDcvMjAxOSAxMjo1NiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvZW11bC1wcml2LW9wLmMKPj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwo+Pj4gQEAgLTExMjEsNyArMTEy
MSw3IEBAIHN0YXRpYyBpbnQgd3JpdGVfbXNyKHVuc2lnbmVkIGludCByZWcsIHUKPj4+IEBAIC0x
MTMwLDYgKzExMzAsOCBAQCBzdGF0aWMgaW50IGNhY2hlX29wKGVudW0geDg2ZW11bF9jYWNoZV9v
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbmV3ZXIgbGludXggdXNlcyB0aGlzIGluIHNv
bWUgc3RhcnQtb2YtZGF5IHRpbWluZyBsb29wcy4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ki8KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIDsKPj4+ICvCoMKgwqAgZWxzZSBpZiAoIG9wID09
IHg4NmVtdWxfd2Jub2ludmQgJiYgY3B1X2hhc193Ym5vaW52ZCApCj4+PiArwqDCoMKgwqDCoMKg
wqAgd2Jub2ludmQoKTsKPj4+IMKgwqDCoMKgwqDCoCBlbHNlCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB3YmludmQoKTsKPj4KPj4gVGhlIGNwdV9oYXNfd2Jub2ludmQgY2hlY2sgaXNuJ3QgbmVj
ZXNzYXJ5LsKgIFRoZSBlbmNvZGluZyB3YXMgY2hvc2VuCj4+IGJlY2F1c2UgaXQgZG9lcyBnZXQg
aW50ZXJwcmV0ZWQgYXMgd2JpbnZkIG9uIG9sZGVyIHByb2Nlc3NvcnMuCj4KPiBJIGFncmVlLCBi
dXQgd2FudGVkIHRvIG1ha2UgdGhlIGNvZGUgbG9vayBjb21wbGV0ZSAvIGNvbnNpc3RlbnQuCj4g
V291bGQgeW91IGJlIG9rYXkgd2l0aCB0aGUgJiYgLi4uIGJlaW5nIHJldGFpbmVkLCBidXQgaW4g
YQo+IGNvbW1lbnQ/CgpPay4KCj4KPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVt
LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVtLmgKPj4+IEBAIC0xNiw2ICsx
NiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd2JpbnZkKHZvaWQpCj4+PiDCoMKgwqDCoMKgwqAg
YXNtIHZvbGF0aWxlICggIndiaW52ZCIgOjo6ICJtZW1vcnkiICk7Cj4+PiDCoMKgIH0KPj4+IMKg
wqAgK3N0YXRpYyBpbmxpbmUgdm9pZCB3Ym5vaW52ZCh2b2lkKQo+Pj4gK3sKPj4+ICvCoMKgwqAg
YXNtIHZvbGF0aWxlICggInJlcGU7IHdiaW52ZCIgOiA6IDogIm1lbW9yeSIgKTsKPj4KPj4gU2Vt
aWNvbG9uLgo+Cj4gSXQgaGFzIHRvIHN0YXksIGFzIGdhcyByZWplY3RzIHVzZSBvZiBSRVAgb24g
aW5zbnMgaXQgZG9lc24ndCB0aGluawo+IHBlcm1pdCB1c2Ugb2YgUkVQLiBILkouIGFjdHVhbGx5
IHByb3Bvc2VzIGV2ZW4gbW9yZSBzdHJpY3QgKG9yIHNob3VsZAo+IEkgc2F5IGhvc3RpbGUpIGdh
cyBiZWhhdmlvciwgd2hpY2ggd291bGQgdGhlbiBhbHNvIHJlamVjdCB0aGUgYWJvdmUKPiBjb25z
dHJ1Y3Q6Cj4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9tbC9iaW51dGlscy8yMDE5LTA3L21zZzAw
MTg2Lmh0bWwKCk9oLsKgIFRoYXQncyBkdWxsLCBlc3BlY2lhbGx5IGNvbnNpZGVyaW5nIHRoZSB2
ZW5kb3JzIHByb3BlbnNpdHkgdG8KY3JlYXRlIG5ldyBpbnN0cnVjdGlvbnMgYnkgdXNpbmcgcHJl
Zml4ZXMgaW4gdGhpcyB3YXkuCgo+Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14
ODYvY3B1ZmVhdHVyZXNldC5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYv
Y3B1ZmVhdHVyZXNldC5oCj4+PiBAQCAtMjQzLDYgKzI0NCw3IEBAIFhFTl9DUFVGRUFUVVJFKEVG
Uk8swqDCoMKgwqDCoMKgwqDCoMKgIDcqMzIrMTApIC8KPj4+IMKgwqAgwqDCoCAvKiBBTUQtZGVm
aW5lZCBDUFUgZmVhdHVyZXMsIENQVUlEIGxldmVsIDB4ODAwMDAwMDguZWJ4LCB3b3JkCj4+PiA4
ICovCj4+PiDCoMKgIFhFTl9DUFVGRUFUVVJFKENMWkVSTyzCoMKgwqDCoMKgwqDCoCA4KjMyKyAw
KSAvKkHCoCBDTFpFUk8gaW5zdHJ1Y3Rpb24gKi8KPj4+ICtYRU5fQ1BVRkVBVFVSRShXQk5PSU5W
RCzCoMKgwqDCoMKgIDgqMzIrIDkpIC8qQcKgIFdCTk9JTlZEIGluc3RydWN0aW9uICovCj4+Cj4+
IFRoaXMgaXMgaW1wbGljaXRseSBsaW5rZWQgd2l0aCBDUFVJRC44MDAwMDAxZCB3aGljaCB3ZSBk
b24ndCBleHBvc2UgeWV0Lgo+Cj4gT24gQU1ELCBidXQgbm90IChzbyBmYXIgYXQgbGVhc3QsIGp1
ZGdpbmcgZnJvbSB0aGUgU0RNKSBvbiBJbnRlbC4KCkludGVsIGhhdmUgbGVhZiA0IHdoaWNoIHNw
ZWNpZmllcyBXQklOVkQncyBiZWhhdmlvdXIgb24gZGlmZmVyZW50IGNhY2hlCmxldmVscy7CoCBU
QkgsIEknZCBleHBlY3QgdG8gc2VlIGFuIGFkanVzdG1lbnQgdG8gdGhlIGxlYWYgNApkb2N1bWVu
dGF0aW9uIHRvIGluY2x1ZGUgV0JOT0lOVkQuCgpBTUQgZXhwbGljaXRseSBkb2Vzbid0IGhhdmUg
bGVhZiA0LsKgIFRoZWlyIGxlYWYgMHg4MDAwMDAxZCBpcyBzaW1pbGFyIGluCmJlaGF2aW91ciAo
YnkgaGF2aW5nIHN1YmxlYWZzKSwgYW5kIGlzIG1vc3RseSBjb21wYXRpYmxlLCBidXQKaXJyaXRh
dGluZ2x5IGRvZXNuJ3QgaGF2ZSBhbiBpZGVudGljYWwgZGF0YSBsYXlvdXQuCgpJJ3ZlIGdvdCBh
bm90aGVyIHF1ZXJ5IG91dCB3aXRoIEFNRCBiZWNhdXNlIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0
aGlzCmxlYWYgYWxvbmUgY2xhaW1zIHRoYXQgQ1BVSUQgd2lsbCAjVUQgd2l0aCBhbiBvdXQtb2Yt
cmFuZ2Ugc3VibGVhZiwgYW5kCkkgZG9uJ3QgYmVsaWV2ZSB0aGlzIGNhbiBiZSB0cnVlLgoKPgo+
PiBUbyBnZXQgdGhlIGVtdWxhdGlvbiBzaWRlIG9mIHRoaW5ncyBzb3J0ZWQsIEknZCBiZSBoYXBw
eSB3aXRoIHRoaXMgZ29pbmcKPj4gaW4gd2l0aG91dCB0aGUgQSBmb3Igbm93LCBhbmQgImV4cG9z
aW5nIFdCTk9JTlZEIHRvIGd1ZXN0cyIgY2FuIGJlIGEKPj4gZm9sbG93dXAgdGFzay4KPgo+IEkn
dmUgZHJvcHBlZCB0aGUgQSBmb3Igbm93LCBidXQgYXMgcGVyIGFib3ZlIEknbSBub3QgZW50aXJl
bHkKPiBjZXJ0YWluIHRoYXQncyBhcHByb3ByaWF0ZTsgaXQncyBjZXJ0YWlubHkgdGhlIG1vcmUg
ZGVmZW5zaXZlIHN0ZXAuCj4gTXkgdW5jZXJ0YWludHkgaXMgYWxzbyBiZWNhdXNlIHBlb3BsZSBh
cmUgZnJlZSB0byB1c2UgdGhlIFdCTk9JTlZECj4gZW5jb2RpbmcgZXZlbiB3aXRob3V0IHRoZSBm
ZWF0dXJlIGZsYWcgc2V0LCBhcyBpdCB3b24ndCAjVUQgKGFzIHlvdQo+IGFsc28gc3VnZ2VzdCBl
bHNld2hlcmUgaW4geW91ciByZXBseSkuCgpBbmQgdGhlIGVtdWxhdGUgYmVoYXZpb3VyIG1hdGNo
ZXMsIGJ5IGZhbGxpbmcgYmFjayB0byBXQklOVkQuCgpJJ2QgcHJlZmVyIHRvIGF2b2lkIGFkdmVy
dGlzaW5nIHRoZSBmZWF0dXJlIHdoZW4gd2UgaGF2ZSBrbm93biB3b3JrCnN0aWxsIHRvIGRvLCBi
ZWNhdXNlIG90aGVyd2lzZSB3ZSB3aWxsIGluZXZpdGFibHkgZm9yZ2V0IHRvIGRvIGl0LgoKSGF2
aW5nIGZ1bmN0aW9uYWxpdHkgaW4gdGhlIGVtdWxhdG9yIHdpdGhvdXQgdGhlIGZlYXR1cmUgYmVp
bmcKYWR2ZXJ0aXNlZCBpcyBmaW5lIGluIGdlbmVyYWwsIGJlY2F1c2UgdGhhdCBzdGlsbCBiZWhh
dmVzIGxpa2UgYQpwaXBlbGluZSB3aGljaCBoYXMgaGFkIENQVUlEIGxldmVsbGVkIGRvd24uCgp+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
