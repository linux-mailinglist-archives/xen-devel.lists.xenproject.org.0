Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE6D11440C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:51:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ictM8-0000ZB-CE; Thu, 05 Dec 2019 15:47:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G9sg=Z3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ictM7-0000Z6-Gs
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:47:51 +0000
X-Inumbo-ID: 973f8c5a-1776-11ea-822f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 973f8c5a-1776-11ea-822f-12813bfff9fa;
 Thu, 05 Dec 2019 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575560870;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=raUYVyH9wQ/HzklDGRVY6LgNKcTbLWxK3ODg0v10+uk=;
 b=D2hBbc+vBg5deH5wkkDgnkL82foEyUmvcXDvYPLQd2nzYBfaiX5S/JZz
 ASMGCFBCKwLd3USJxOHxBNOAO4pwoBNvj+Z7pspwFkaJNbz54XVe32CbZ
 euriva1RQGcExxrA121yFxeADec/odqe7fO0w7kZyY+MWVwzwKjePZS0Q k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9/9yihJGo7HQ+z1YROqQxYFsqnwX7dyWo+39cZ7z4PM4Z9H0u41XJkPwMH/mHd3UQjAqKBYMDv
 PJ24FGAG7XISp7jdkWUqJ4i85NjrnIzGuLVqWLmBjmXvG5VdX8Vr5Etg2EM0Ba/k9SyuFdQJMt
 1eZ7XK/mIATENjslo6VV3CgWkV7RhOsTCjFnYRwyYObm9nlQwzk3G1WS4An6UTlTDoHqg0AwXJ
 JE8Kp/ZWVJmpA6NIRK4SH+9vkcOr+7YdvGtnPypU0rXoPAUCNsmKoeYmojBP/3nRcnVxCOPhAe
 n2s=
X-SBRS: 2.7
X-MesageID: 9383582
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9383582"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
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
Message-ID: <e882a253-848a-0f03-4dbd-af7714c1fb3f@citrix.com>
Date: Thu, 5 Dec 2019 15:47:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4] gnttab: don't expose host physical
 address without need
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMTIvMjAxOSAxNTozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVHJhbnNsYXRlZCBkb21h
aW5zIHNob3VsZG4ndCBzZWUgaG9zdCBwaHlzaWNhbCBhZGRyZXNzZXMuIFdoaWxlIHRoZQo+IGFk
ZHJlc3MgaXMgYWxzbyBub3Qgc3VwcG9zZWQgdG8gYmUgaGFuZGVkIGJhY2sgZXZlbiB0byBub24t
dHJhbnNsYXRlZAo+IGRvbWFpbnMgd2hlbiBHTlRNQVBfZGV2aWNlX21hcCBpcyBub3Qgc2V0IChh
cyBleHBsaWNpdGx5IHN0YXRlZCBieSBhCj4gY29tbWVudCBpbiB0aGUgcHVibGljIGhlYWRlciks
IFBWIGtlcm5lbHMgKExpbnV4IGF0IGxlYXN0KSBhc3N1bWUgdGhlCj4gZmllbGQgdG8gZ2V0IHBv
cHVsYXRlZCBuZXZlcnRoZWxlc3MuCgpUaGlzIHJlYWxseSBtZWFucyB0aGF0IHRoZSBwdWJsaWMg
aGVhZGVyIG5lZWRzIGNvcnJlY3RpbmcuwqAgVGhlIGZpZWxkCm1heSBub3QgaGF2ZSBpbnRlbmRl
ZCB0byBlc2NhcGUgb3V0IG9mIFhlbiwgYnV0IGl0IGlzIGRlZmFjdG8gcGFydCBvZgp0aGUgQUJJ
IG5vdy4KCj4gKFNpbWlsYXJseSBtYXBraW5kKCkgc2hvdWxkIGNoZWNrIG9ubHkgR05UTUFQX2Rl
dmljZV9tYXAuKQoKSXMgdGhpcyBjb21tZW50IHN0YWxlLCBvciBoYXZlIEkgbWlzdW5kZXJzdG9v
ZCBzb21lIG9mIHRoZSByZWFzb25pbmc/Cgo+Cj4gQWxvbmcgdGhlc2UgbGluZXMgc3BsaXQgdGhl
IHBhZ2luZyBtb2RlIHJlbGF0ZWQgY2hlY2sgbmVhciB0aGUgdG9wIG9mCj4gbWFwX2dyYW50X3Jl
ZigpIHRvIGhhbmRsZSB0aGUgImV4dGVybmFsIiBhbmQgInRyYW5zbGF0ZWQiIGNhc2VzCj4gc2Vw
YXJhdGVseSAoR05UTUFQX2RldmljZV9tYXAgdXNlIGdldHRpbmcgdGllZCB0byBiZWluZyBub24t
dHJhbnNsYXRlZAo+IHJhdGhlciB0aGFuIG5vbi1leHRlcm5hbCkuCj4KPiBTdGlsbCBhbG9uZyB0
aGVzZSBsaW5lcyBpbiB0aGUgdW5tYXBwaW5nIGNhc2UgdGhlcmUncyBubyBwb2ludCBjaGVja2lu
Zwo+IC0+ZGV2X2J1c19hZGRyIHdoZW4gR05UTUFQX2RldmljZV9tYXAgaXNuJ3Qgc2V0IChhbmQg
aGVuY2UgdGhlIGZpZWxkCj4gaXNuJ3QgZ29pbmcgdG8gYmUgY29uc3VtZWQpLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IHY0OiBSZS1i
YXNlIG92ZXIgZHJvcHBlZCBwYXRjaGVzLgo+IHYzOiBOZXcuCj4KPiAtLS0gYS94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMKPiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKPiBAQCAtOTY3
LDEwICs5NjcsMTYgQEAgbWFwX2dyYW50X3JlZigKPiAgICAgIH0KPiAgCj4gICAgICBpZiAoIHVu
bGlrZWx5KHBhZ2luZ19tb2RlX2V4dGVybmFsKGxkKSAmJgo+IC0gICAgICAgICAgICAgICAgICAo
b3AtPmZsYWdzICYgKEdOVE1BUF9kZXZpY2VfbWFwfEdOVE1BUF9hcHBsaWNhdGlvbl9tYXB8Cj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICBHTlRNQVBfY29udGFpbnNfcHRlKSkpICkKPiAr
ICAgICAgICAgICAgICAgICAgKG9wLT5mbGFncyAmIChHTlRNQVBfYXBwbGljYXRpb25fbWFwfEdO
VE1BUF9jb250YWluc19wdGUpKSkgKQo+ICAgICAgewo+IC0gICAgICAgIGdkcHJpbnRrKFhFTkxP
R19JTkZPLCAiTm8gZGV2aWNlIG1hcHBpbmcgaW4gSFZNIGRvbWFpblxuIik7Cj4gKyAgICAgICAg
Z2RwcmludGsoWEVOTE9HX0lORk8sICJObyBhcHAvcHRlIG1hcHBpbmcgaW4gSFZNIGRvbWFpblxu
Iik7Cj4gKyAgICAgICAgb3AtPnN0YXR1cyA9IEdOVFNUX2dlbmVyYWxfZXJyb3I7Cj4gKyAgICAg
ICAgcmV0dXJuOwo+ICsgICAgfQo+ICsKPiArICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRl
KGxkKSAmJiB1bmxpa2VseShvcC0+ZmxhZ3MgJiBHTlRNQVBfZGV2aWNlX21hcCkgKQo+ICsgICAg
ewo+ICsgICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiTm8gZGV2aWNlIG1hcHBpbmcgaW4g
dHJhbnNsYXRlZCBkb21haW5cbiIpOwo+ICAgICAgICAgIG9wLT5zdGF0dXMgPSBHTlRTVF9nZW5l
cmFsX2Vycm9yOwo+ICAgICAgICAgIHJldHVybjsKPiAgICAgIH0KPiBAQCAtMTIxMyw3ICsxMjE5
LDggQEAgbWFwX2dyYW50X3JlZigKPiAgICAgIGlmICggbmVlZF9pb21tdSApCj4gICAgICAgICAg
ZG91YmxlX2d0X3VubG9jayhsZ3QsIHJndCk7Cj4gIAo+IC0gICAgb3AtPmRldl9idXNfYWRkciA9
IG1mbl90b19tYWRkcihtZm4pOwo+ICsgICAgb3AtPmRldl9idXNfYWRkciA9IHBhZ2luZ19tb2Rl
X3RyYW5zbGF0ZShsZCkgPyBvcC0+aG9zdF9hZGRyCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA6IG1mbl90b19tYWRkcihtZm4pOwo+ICAgICAgb3At
PmhhbmRsZSAgICAgICA9IGhhbmRsZTsKPiAgICAgIG9wLT5zdGF0dXMgICAgICAgPSBHTlRTVF9v
a2F5Owo+ICAKPiBAQCAtMTM5NCw3ICsxNDAxLDcgQEAgdW5tYXBfY29tbW9uKAo+ICAKPiAgICAg
IG9wLT5tZm4gPSBhY3QtPm1mbjsKPiAgCj4gLSAgICBpZiAoIG9wLT5kZXZfYnVzX2FkZHIgJiYK
PiArICAgIGlmICggb3AtPmRldl9idXNfYWRkciAmJiAoZmxhZ3MgJiBHTlRNQVBfZGV2aWNlX21h
cCkgJiYKCkRyb3AgdGhlIGZpcnN0IGNsYXVzZSBlbnRpcmVseT/CoCBhY3QtPm1mbiB3aWxsIG5l
dmVyIGJlIDAgc28gY2FuIHN1YnN1bWUKdGhlIGNoZWNrIHdpdGggb25lIGZld2VyIGJyYW5jaC4K
Cn5BbmRyZXcKCj4gICAgICAgICAgIHVubGlrZWx5KG9wLT5kZXZfYnVzX2FkZHIgIT0gbWZuX3Rv
X21hZGRyKGFjdC0+bWZuKSkgKQo+ICAgICAgICAgIFBJTl9GQUlMKGFjdF9yZWxlYXNlX291dCwg
R05UU1RfZ2VuZXJhbF9lcnJvciwKPiAgICAgICAgICAgICAgICAgICAiQnVzIGFkZHJlc3MgZG9l
c24ndCBtYXRjaCBnbnRyZWYgKCUiUFJJeDY0IiAhPSAlIlBSSXBhZGRyIilcbiIsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
