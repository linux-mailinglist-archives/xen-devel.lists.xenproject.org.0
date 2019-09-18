Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBBAB6C6F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 21:25:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAfWg-0003gJ-SO; Wed, 18 Sep 2019 19:22:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suks=XN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAfWg-0003gE-15
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 19:22:06 +0000
X-Inumbo-ID: 99063fc6-da49-11e9-978d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99063fc6-da49-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 19:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568834525;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nDXpUhyo8wusVB0rrJSAuHK8SBmuPwNEa6fcaE+Tloo=;
 b=ep86Ks3uxZo3sDXYr783YhXiBtebCSsjVaqSoSiffq/f04WeqOkuLBVW
 OqVT2UPcCAOzYuczP7nONtuBQl2avVNGdzij0fqXjEnnIlq50HI0Qv8WF
 ltKZvOuHJy5t5Ft61vzPv4FRh33ijCCPlbuR4CvJUVlegdwSCvlGE/gJH c=;
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
IronPort-SDR: gyhbsJp/iWMZcNd1L/KxrN7+sW35ooRcMn+vByUBx8Hy+3XbdT1sISXjK6HEyCMAMYYNtJQ9rx
 H/ijpULB0KcwEdr1sLGvyQ4BZBRRalGuu4KI5kcDtKKdBiJOqMcahH84vD6zP6viRuBXK5c4i2
 gNF0BNx3f3sIFACogmkoEbhIeATMbUG7onT7x7ew3igQUyib7OHCcfUowwsWmWdfq1RgrZzQEd
 7Ns3oVZTlGPtE2pHsGhQGPSDLyaO5m8qhQpTapIje9sJhJhkBOMC7YV7R3EqzoZ2BCduC3eSjY
 6sA=
X-SBRS: 2.7
X-MesageID: 6062714
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="6062714"
To: Jan Beulich <jbeulich@suse.com>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
 <f075274c-46ed-bedd-9a0f-3ab157544cb1@suse.com>
 <16d3de95-bcb3-87c3-dec2-f436a17e4b29@citrix.com>
 <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
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
Message-ID: <3f304d31-5047-b4ec-83f1-aa1a65e341fc@citrix.com>
Date: Wed, 18 Sep 2019 20:22:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <902700ef-3405-ecfd-45ba-fd0d6f63ac4d@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] x86emul: adjust MOVSXD source operand
 handling
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDkvMjAxOSAwNzozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDkuMjAxOSAx
OToxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTYvMDkvMjAxOSAxMDo0OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBYRUQgY29tbWl0IDFiMmZkOTQ0MjUgKCJVcGRhdGUgTU9WU1hEIHRv
IG1vZGVybiBiZWhhdmlvciIpIHBvaW50cyBvdXQKPj4+IHRoYXQgYXMgb2YgU0RNIHJldiAwNjQg
TU9WU1hEIGlzIHNwZWNpZmllZCB0byByZWFkIG9ubHkgMTYgYml0cyBmcm9tCj4+PiBtZW1vcnkg
KG9yIHJlZ2lzdGVyKSB3aGVuIHVzZWQgd2l0aG91dCBSRVguVyBhbmQgd2l0aCBvcGVyYW5kIHNp
emUKPj4+IG92ZXJyaWRlLiBTaW5jZSB0aGUgdXBwZXIgMTYgYml0cyBvZiB0aGUgdmFsdWUgcmVh
ZCB3b24ndCBiZSB1c2VkCj4+PiBhbnl3YXkgaW4gdGhpcyBjYXNlLCBtYWtlIHRoZSBlbXVsYXRp
b24gdW5pZm9ybWx5IGZvbGxvdyB0aGlzIG1vcmUKPj4+IGNvbXBhdGlibGUgYmVoYXZpb3Igd2hl
biBub3QgZW11bGF0aW5nIGFuIEFNRC1saWtlIENQVSwgYXQgdGhlIHJpc2sKPj4+IG9mIG1pc3Np
bmcgYW4gZXhjZXB0aW9uIHdoZW4gZW11bGF0aW5nIG9uL2ZvciBvbGRlciBoYXJkd2FyZSAodGhl
Cj4+PiBib3VuZGFyeSBhdCBTYW5keUJyaWRnZSBub3RlZCBpbiBzYWlkIGNvbW1pdCBsb29rcyBx
dWVzdGlvbmFibGUgLSBJJ3ZlCj4+PiBvYnNlcnZlZCB0aGUgIm5ldyIgYmVoYXZpb3IgYWxzbyBv
biBXZXN0bWVyZSkuCj4+IEFNRCBkb2N1bWVudHMgdGhpcyBpbnN0cnVjdGlvbiBoYXMgYWx3YXlz
IHVzaW5nIGFuIDggb3IgMTZiaXQgc291cmNlCj4+IG9wZXJhbmQuCj4gSGF2ZSB5b3UgbWl4ZWQg
dXAgTU9WU1ggd2l0aCBNT1ZTWEQ/IEJvdGggaGF2ZSBzZXBhcmF0ZSBwYWdlcyBpbgo+IEFNRCdz
IGRvYywgYnV0IGEgY29tbW9uIHBhZ2UgaW4gSW50ZWwncy4KCkkgaGFkIGNvbmZ1c2VkIHRoZSB0
d28sIHllcy4KCkkgY29uc3RydWN0ZWQgYW4gZXhwZXJpbWVudCB1c2luZyA2NiA2ZSAwOCwgaS5l
LgoKbW92c2xxICglcmF4KSwlY3gKCmFjY29yZGluZyB0byBvYmpkdW1wLCBhbmQgaXRlcmF0aW5n
IGJhY2t3YXJkcyBvdmVyIHRoZSBib3VuZGFyeSB0byB0aGUKdW5tYXBwZWQgcGFnZSBhdCAwLgoK
T24gYSBSb21lIHN5c3RlbToKCihkMjQpIFB0cjogMDAwMDAwMDAwMDAwMTAwMAooZDI0KcKgID0+
IGMyYzIKKGQyNCkgUHRyOiAwMDAwMDAwMDAwMDAwZmZmCihkMjQpICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKgooZDI0KSBQQU5JQzogVW5oYW5kbGVkIGV4Y2VwdGlvbiBhdCAwMDA4OjAw
MDAwMDAwMDAxMDQ3YTUKKGQyNCkgVmVjIDE0ICNQRlstZC1zci1dICVjcjIgMDAwMDAwMDAwMDAw
MGZmZgooZDI0KSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKCldoaWNoIGFsc28gY29u
ZmlybXMgdGhlIGRlc2NyaXB0aW9uIHdoaWNoIHN0YXRlcyB0aGF0IGluIHRoZSBjYXNlIG9mIGEK
MTYgYml0IG9wZXJhbmQsIG5vIHNpZ24gZXh0ZW5zaW9uIG9jY3Vycy4KCkkgdGhlbiB0cmllZCB0
aGUgc2FtZSB0ZXN0IG9uIGFuIEludGVsIEhhc3dlbGwgc3lzdGVtOgoKKGQ5MSkgUHRyOiAwMDAw
MDAwMDAwMDAxMDAwCihkOTEpwqAgPT4gYzJjMgooZDkxKSBQdHI6IDAwMDAwMDAwMDAwMDBmZmYK
KGQ5MSkgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCihkOTEpIFBBTklDOiBVbmhhbmRs
ZWQgZXhjZXB0aW9uIGF0IDAwMDg6MDAwMDAwMDAwMDEwNDdhNQooZDkxKSBWZWMgMTQgI1BGWy1k
LXNyLV0gJWNyMiAwMDAwMDAwMDAwMDAwZmZmCihkOTEpICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgoKU28gZnJvbSB0aGlzIGV4cGVyaW1lbnRhdGlvbiwgSSBkaXNiZWxpZXZlIHRoZSBj
bGFpbSBpbiBYRUQsIGFuZCBhbmQgaXQKbG9va3MgYXMgaWYgdGhlIEludGVsIGJlaGF2aW91ciBt
YXRjaGVzIHRoZSBBTUQgZG9jdW1lbnRhdGlvbi4KCkVpdGhlciB3YXksIEkgdGhpbmsgZnVydGhl
ciBjbGFyaWZpY2F0aW9uIGZyb20gSW50ZWwgaXMgbmVlZGVkLgoKPgo+PiBUaGVyZSBhcmUgY29y
bmVyIGNhc2VzIHdoaWNoIHdlIGNhbid0IHBvc3NpYmx5IHJlYXNvbmFibHkgY29wZSB3aXRoLsKg
Cj4+IGUuZy4gSXQgaXMgbW9kZWwgc3BlY2lmaWMgYXMgdG8gd2hldGhlciBVRDAgdGFrZXMgYSBN
b2RSTSBieXRlIG9yIG5vdCwKPj4gYW5kIEknbGwgbm90ZSB0aGF0IHRoZSBsYXRlc3QgcmV2aXNp
b24gKDMuMzEpIG9mIEFQTSBWb2wyIGNsYXJpZmllcyBpbgo+PiBUYWJsZSA4LTg6Cj4+Cj4+ICJU
aGlzIHJlZmxlY3RzIHRoZSByZWxhdGl2ZSBwcmlvcml0eSBmb3IgZmF1bHRzIGVuY291bnRlcmVk
IHdoZW4KPj4gZmV0Y2hpbmcgdGhlIGZpcnN0IGJ5dGUgb2YgYW4gaW5zdHJ1Y3Rpb24uIEluIHRo
ZSBmZXRjaGluZyBhbmQgZGVjb2RpbmcKPj4gb2Ygc3Vic2VxdWVudCBieXRlcyBvZiBhbiBpbnN0
cnVjdGlvbiwgaWYgdGhvc2UgYnl0ZXMgc3BhbiB0aGUgc2VnbWVudAo+PiBsaW1pdCBvciBjcm9z
cyBpbnRvIGEgbm9uLWV4ZWN1dGFibGUgb3Igbm90LXByZXNlbnQgcGFnZSwgdGhlIGZldGNoIHdp
bGwKPj4gcmVzdWx0IGluIGEgI0dQKDApIGZhdWx0IG9yICNQRiBhcyBhcHByb3ByaWF0ZSwgcHJl
dmVudGluZyB0aG9zZSBieXRlcwo+PiBmcm9tIGJlaW5nIGFjY2Vzc2VkLiBIb3dldmVyLCBpZiB0
aGUgaW5zdHJ1Y3Rpb24gY2FuIGJlIGRldGVybWluZWQgdG8gYmUKPj4gaW52YWxpZCBiYXNlZCBq
dXN0IG9uIHRoZSBieXRlcyBwcmVjZWRpbmcgdGhhdCBib3VuZGFyeSwgYSAjVUQgZmF1bHQgbWF5
Cj4+IHRha2UgcHJpb3JpdHkuIFRoaXMgYmVoYXZpb3IgaXMgbW9kZWwtZGVwZW5kZW50LiIKPj4K
Pj4gc28gd2UgaGF2ZSBubyBob3BlIG9mIGdldHRpbmcgbW9kZWwtYWNjdXJhdGUgZmF1bHQgYmVo
YXZpb3VyLgo+IEhvdyBpcyBVRDAgcmVsZXZhbnQgaGVyZT8KCnRvICJ0aGVyZSBhcmUgbW9kZWwt
c3BlY2lmaWMgY29ybmVyIGNhc2VzIHdoaWNoIHdlIGNhbid0IHBvc3NpYmx5CnJlYXNvbmFibHkg
Y29wZSB3aXRoLiIKCj4gQW5kIHdhcyB0aGUgcmVtYWluZGVyIG9mIHRoZSBhYm92ZSBwZXJoYXBz
Cj4gbWVhbnQgdG8gYmUgaW4gcmVzcG9uc2UgdG8gdGhlIEFSUEwgYWRqdXN0bWVudCwgZGVzY3Jp
YmVkIGJlbG93PyBJZgo+IHNvLCBJIHN0aWxsIHdvdWxkbid0IGtub3cgd2hhdCB0byB0YWtlIGZy
b20gaXQgYXMgZmFyIGFzIHRoaXMgcGF0Y2gKPiBnb2VzLgoKVGhlIEFSUEwgYml0IGlzIGZpbmUg
aW4gaXNvbGF0aW9uLCBhbmQgcHJvYmFibHkgd2FudHMgc3VibWl0dGluZyBpbgppc29sYXRpb24s
IGdpdmVuIHRoZSBjb25mbGljdGluZyBldmlkZW5jZSBhYm91dCBNT1ZTWEQuCgpJZiB5b3UgZG8g
d2FudCB0byBzdWJtaXQgaXQgaW5kaXZpZHVhbGx5LCBjb25zaWRlciBpdCBSLWJ5IG1lIHRvIGF2
b2lkCmZ1cnRoZXIgbGF0ZW5jeS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
