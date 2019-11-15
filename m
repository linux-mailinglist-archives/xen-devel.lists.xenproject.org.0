Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15EBFE19B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:38:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVddE-0006ZG-OJ; Fri, 15 Nov 2019 15:35:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVddC-0006Yu-MM
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:35:30 +0000
X-Inumbo-ID: 8d7f2e00-07bd-11ea-a276-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d7f2e00-07bd-11ea-a276-12813bfff9fa;
 Fri, 15 Nov 2019 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573832130;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EJ/LuRznmRAy7PUR1CLnDpmma3UYnr1AeCbEMajmulo=;
 b=bQxDbnH96V0WCZE1VhCKjBUhi4sSecswg5AW1sqpUPS5VCRDF61fbZpA
 ZCRM5jpQVZsN902QrC76SM+ps3fwkPDTEp5pQGhD22dRj/tdXpdFYnriw
 Pd3bsC0XQo8Xijscrw7K1kkyRqLK2nL+EYqvWqLiqf67nPIYKeb1/H8F0 4=;
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
IronPort-SDR: P3f/Rbu75VlKCC1+Hfd+GY2VlR8yAzM+Mn11Z8MCIwQamuDyNa7XfN5ipH4vpmeBSl0jKEieg5
 a8MWh7YyzmpLuJlb+QByQfHvewoRnFDuaOk4kWICQErz1UbMNaHxhrzAzl+JjQXvC4R6Lqcv8u
 dsoHk0U2MIYj630E05qsPgv3Nmkzr9fH4GMDT6Gfrb0BdVnXuh9IVNsL4gR4kIlM94FiOpuAF2
 Q6ADlQwRU3FWgyCRxFTDH1kmvZcy1/c5P6t+PdX23nSRAe2KUqlyWLxDiouGA5RpOhZ6Rv3v5j
 HrI=
X-SBRS: 2.7
X-MesageID: 8389375
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8389375"
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
 <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
 <607854b0-00a2-df11-d977-af6498050c40@citrix.com>
 <f9c4d160-1567-d622-e056-f61b7085198e@citrix.com>
 <b6bf2826-eb8f-4e3c-42ce-a9923d3af1c3@citrix.com>
 <380e865b-3092-6a85-0d77-dc99e33678e4@citrix.com>
 <0f27d518-e6c4-a728-e59d-237acc92d493@suse.com>
 <0ec711d3-90d4-5fa0-7f16-8bf1ac8dc0ca@citrix.com>
 <f6c3a7dc-e42f-36ab-7905-75e34c5158bf@suse.com>
 <69319c0a-b064-5cb9-664c-7e7fe7eb1c3e@citrix.com>
 <b06aa658-7dea-bc6e-1488-362403f42790@citrix.com>
 <e059f1dd-aa03-ad7e-9306-3627e0949057@citrix.com>
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
Message-ID: <f36a5455-5ba5-026e-2f77-f89332f6fb2d@citrix.com>
Date: Fri, 15 Nov 2019 15:35:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e059f1dd-aa03-ad7e-9306-3627e0949057@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 IanJackson <ian.jackson@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTEvMjAxOSAxNToyMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAy
OjU5IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNS8xMS8yMDE5IDE0OjU1LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOgo+Pj4+PiArICAgICAgICAgICAgcC0+YmFzaWMuaHR0ID0gZmFsc2U7
Cj4+Pj4gSSB0aGluayBldmVyeXRoaW5nIGJlbG93IGhlcmUgaW5kZWVkIHNpbXBseSB1bmRvZXMg
d2hhdCBzYWlkIG9sZAo+Pj4+IGNvbW1pdCBkaWQsIGJ1dCBJIGNhbid0IG1hdGNoIHVwIHRoaXMg
b25lLiBBbmQgdG9nZXRoZXIgd2l0aCB0aGUKPj4+PiBxdWVzdGlvbiBvZiB3aGV0aGVyIGluc3Rl
YWQgbGVhdmluZyBpdCBhbG9uZSwgY21wX2xlZ2FjeSB0aGVuCj4+Pj4gd291bGQgaGF2ZSB0aGUg
c2FtZSBxdWVzdGlvbiByYWlzZWQuCj4+PiBUaGlzIGlzIGJhc2VkIG9uIGEgWGVuU2VydmVyIHBh
dGNoIHdoaWNoIHJldmVydHMgdGhlIGVudGlyZSBjb21taXQsIGFuZAo+Pj4gaGFzIGJlZW4gbWFp
bnRhaW5lZCBpbiB0aGUgcGF0Y2hxdWV1ZSBzaW5jZSB0aGUgY29tbWl0IG1hZGUgaXQgdXBzdHJl
YW0sCj4+PiBBRkFJQ1QuICBTbyBJJ2xsIGxldCBzb21lb25lIGZyb20gdGhhdCB0ZWFtIGNvbW1l
bnQgb24gdGhlIHdoZXJlZm9yZXM7Cj4+PiBidXQgYXMgSSBzYWlkLCBpdCdzIGJ5IGZhciB0aGUg
YmVzdCB0ZXN0ZWQgb3B0aW9uIHdlJ3JlIGdvaW5nIHRvIGdldC4KPj4gWWVzLsKgIEl0IGlzIGEg
cmV2ZXJ0IG9mIGMvcyBjYTJlZWU5MmRmNDQgKFhlbiAzLjQsIGFuZCBtYWludGFpbmVkCj4+IGZv
cndhcmRzIHVudGlsIG5vdykgYmVjYXVzZSBpdCBicm9rZSBtaWdyYXRpb24gYWNyb3NzIHRoYXQg
Y2hhbmdlc2V0Lgo+Pgo+PiBJdCBpcyBhbHNvIHRoaXMgZXhhY3QgdmVyc2lvbiBvZiB0aGUgcmV2
ZXJ0IHdoaWNoIGhhcyBiZWVuIHRlc3RlZCBhbmQKPj4gY29uZmlybWVkIHRvIGZpeCB0aGUgUnl6
ZW4gM3h4eCBmaXhlcy4KPj4KPj4gQSBzZXBhcmF0ZSBleHBlcmltZW50IHRyaWVkIHBsYXlpbmcg
d2l0aCBvbmx5IHRoZSBmbGFncywgdmlhCj4+IGNwdWlkPSJob3N0Omh0dD0wLGNtcF9sZWdhY3k9
MSIgYW5kIHRoaXMgZGlkIG5vdCByZXNvbHZlIHRoZSBjcmFzaGVzLgo+IElzIHRoYXQgYmVjYXVz
ZSB0aGUgInJldmVydCIgIHN0aWxsIGNsZWFycyBjbXBfbGVnYWN5LCByYXRoZXIgdGhhbgo+IHNl
dHRpbmcgaXQgdG8gMT8KPgo+IEkgdGhpbmsgd2hhdCBKYW4gd2FzIGdldHRpbmcgYXQgd2FzIHRo
YXQgY2EyZWVlOTJkZjQ0ICpzZXRzKiBodHQgYW5kCj4gKmNsZWFycyogY21wX2xlZ2FjeSwgYnV0
IHByZXZpb3VzIHRvIHRoYXQgY29tbWl0LCBodHQgYW5kIGNtcF9sZWdhY3kKPiB3ZXJlbid0IGNo
YW5nZWQsIHRoZXkgd2VyZSBzaW1wbHkgbGVmdCBhbG9uZS4gIFdoZW4gcmV2ZXJ0aW5nIHRoaXMK
PiBwYXRjaCwgd2h5IGRvIHdlIG5vdCBzaW1wbHkgbGVhdmUgaXQgYWxvbmUsIGFzIHdhcyBkb25l
IGJlZm9yZSwgcmF0aGVyCj4gdGhhbiBhY3RpdmVseSBjbGVhcmluZyB0aGVtPwoKWW91IGFsc28g
bmVlZCB0byBhY2NvdW50IGZvciB0aGUgYWNjdW11bGF0ZWQgYnVnZml4ZXMgb2YgdGhlIGNvZGUg
c2luY2UKY2EyZWVlOTJkZjQ0LgoKPiBJIHRoaW5rIGl0J3MgYSBnb29kIHF1ZXN0aW9uIHRvIGFz
aywgYnV0IHVubGVzcyB0aGVyZSBpcyBhIGtub3duIGlzc3VlCj4gd2l0aCB3aGF0IHRoZSBwYXRj
aCBkb2VzLCBJIHRoaW5rIGl0J3MgZmFyIGxlc3Mgcmlza3kganVzdCB0byB0YWtlIHRoZQo+IHZl
cnNpb24gd2hpY2ggaGFzIGJlZW4gdGVzdGVkLgoKSW4gc2hvcnQsIHllcyBJIGJlbGlldmUgdGhl
IGJlaGF2aW91ciBpcyBkZWxpYmVyYXRlLCBhbHRob3VnaCBJIGRvbid0CmhhdmUgdGhlIGJ1ZyB0
aWNrZXRzIHRvIGhhbmQgdG8gcmVtZW1iZXIgZXhhY3RseSB3aGF0IHdlbnQgd3JvbmcuCgpUaGUg
b25seSBvdGhlciBwb3NzaWJpbGl0eSAoYW5kIHBlcmhhcHMgaXMgYmV0dGVyLCBub3cgdGhhdCBp
dCBpcwpwb3NzaWJsZSkgaXMgdG8gZm93YXJkIHRob3NlIHR3byBiaXRzIGZyb20gdGhlIGhvc3Qg
cG9saWN5LsKgIFRoZXkgYXJlCnNldCBpbiB0aGUgZ3Vlc3QgcG9saWN5IGR1ZSB0byAoc3RpbGwp
IG5vdCBoYXZpbmcgYSBzcGxpdCBiZXR3ZWVuCmRlZmF1bHQgYW5kIG1heCAoYW5vdGhlciBpc3N1
ZSBpbiB0aGUgcXVldWUgdG8gYmUgZml4ZWQpLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
