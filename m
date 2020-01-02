Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7421012E983
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:44:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in4Sq-0000Oa-Dz; Thu, 02 Jan 2020 17:40:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WNQ8=2X=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1in4So-0000OV-ON
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:40:50 +0000
X-Inumbo-ID: fef039dc-2d86-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fef039dc-2d86-11ea-88e7-bc764e2007e4;
 Thu, 02 Jan 2020 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577986841;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vHGfpV7s8Q3O0a7coK97YPRIqMPeaUzR8BJ+CZX3X/4=;
 b=iSaivY9mDVJY8i7Hvpdp1xKEBkyIT3ByOeFRPLbLfIF9lFLyLIVrMiOf
 YT0gNKjlF7AAwsojX/QoRJ78yAxh6s0orO+1Bmw62AAbUZaWPvqgfdSQo
 UYpqydnOp1Yc45mIhuVopVBshVzUmVVFRcQHqBSNXt623bYWGMOHLnx2i w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4o1etkernMF09n8RLUt1q206qu+ycygFSm/Il8brKdGdsz8slFEDl5yb6+sODg+CiNVvHFHQNe
 8qNPHK7d7ieQUXZ//M8QiE0XFtO0+Mi1RpxTDP0EapWUcRPc/1BEeRoF+9p8T213Sp8Cf7+F7l
 ZjKX7OS1qqbYKQ9IEYidfh4nHDNyL6LGFu90D9bxRMVFLTozuWhnWuoQvi6CXLG5WpxTtOtPK8
 P0FhoXmlkH2/U09Ew2shNEc50wPIeTe3ExJLbHxJd/QaVviOdBsNm/fiQp4bdX9sdq8qTXCayQ
 foY=
X-SBRS: 2.7
X-MesageID: 10751258
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10751258"
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
 <b190ca53-3541-438f-7a61-723a51e0d57d@xen.org>
 <967aad91-812f-3178-e8f5-1b787127ee8d@citrix.com>
 <7b5aa597-1cc9-a601-4eec-a6400a312cfc@xen.org>
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
Message-ID: <3139d26f-62e1-6afe-822a-75fb2144ca5c@citrix.com>
Date: Thu, 2 Jan 2020 17:40:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7b5aa597-1cc9-a601-4eec-a6400a312cfc@xen.org>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMTIvMjAxOSAxMzo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMzAv
MTIvMjAxOSAxMzozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMzAvMTIvMjAxOSAxMzox
NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGkgQW5kcmV3LAo+Pj4KPj4+IE9uIDI3LzEyLzIw
MTkgMTM6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gVGhlIGNhbGwgdG8geGNfZG9tYWlu
X2Rpc2FibGVfbWlncmF0ZSgpIGlzIG1hZGUgb25seSBmcm9tIHg4NiwKPj4+PiB3aGlsZSBpdHMK
Pj4+PiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLsKgIE1vdmUgaXQgdG8gdGhlIGxpYnhsX19i
dWlsZF9wcmUoKS4KPj4+Pgo+Pj4+IGh2bV9zZXRfY29uZl9wYXJhbXMoKSwgaHZtX3NldF92aXJp
ZGlhbl9mZWF0dXJlcygpLAo+Pj4+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGllcygpLCBhbmQgdGhl
IGFsdHAybSBsb2dpYyBpcyBhbGwgaW4gY29tbW9uCj4+Pj4gY29kZSAocGFydHMgaWZkZWYnZCkg
YnV0IGRlc3BpdGUgdGhpcywgaXMgYWxsIGFjdHVhbGx5IHg4NiBzcGVjaWZpYy4KPj4+Cj4+PiBX
aGlsZSBhbHRwMm0gaXMgb25seSBzdXBwb3J0ZWQgb24geDg2LCB0aGUgY29uY2VwdCBpcyBub3QK
Pj4+IHg4Ni1zcGVjaWZpYy4gSSBhbSBhY3R1YWxseSBhd2FyZSBvZiBwZW9wbGUgdXNpbmcgYWx0
cDJtIG9uIEFybSwKPj4+IGFsdGhvdWdodCB0aGUgc3VwcG9ydCBpcyBub3QgdXBzdHJlYW0geWV0
Lgo+Pj4KPj4+Pgo+Pj4+IE1vdmUgaXQgaW50byB4ODYgc3BlY2lmaWMgY29kZSwgYW5kIGZvbGQg
YWxsIG9mIHRoZQo+Pj4+IHhjX2h2bV9wYXJhbV9zZXQoKSBjYWxscwo+Pj4+IHRvZ2V0aGVyIGlu
dG8gaHZtX3NldF9jb25mX3BhcmFtcygpIGluIGEgZmFyIG1vcmUgY29oZXJlbnQgd2F5Lgo+Pj4+
Cj4+Pj4gRmluYWxseSAtIGVuc3VyZSB0aGF0IGFsbCBoeXBlcmNhbGxzIGhhdmUgdGhlaXIgcmV0
dXJuIHZhbHVlcyBjaGVja2VkLgo+Pj4+Cj4+Pj4gTm8gcHJhY3RpY2FsIGNoYW5nZSBpbiBjb25z
dHJ1Y3RlZCBkb21haW5zLsKgIEZld2VyIHVzZWxlc3MgaHlwZXJjYWxscwo+Pj4+IG5vdyB0bwo+
Pj4+IGNvbnN0cnVjdCBhbiBBUk0gZ3Vlc3QuCj4+Pgo+Pj4gSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXN0IHRvIGtlZXAgYW55dGhpbmcgdGhhdCB3ZSBrbm93IGNhbiBiZSB1c2VkIG9uCj4+PiBhcm0g
KG9yIG5ldyBhcmNoaXRlY3R1cmUpIGluIGNvbW1vbiBjb2RlLiBJIGFtIHRoaW5raW5nIGFib3V0
Cj4+PiAibmVzdGVkaHZtIiBhbmQgImFsdHAybSIuCj4+Cj4+IE5laXRoZXIgb2YgdGhvc2Ugb3B0
aW9ucyBhcmUgZ29pbmcgdG8gc3Vydml2ZSBpbiB0aGlzIGZvcm0uCj4KPiBPaCwgaXQgd2Fzbid0
IGNsZWFyIGZyb20gdGhlIGNvbW1pdCBtZXNzYWdlLiBXb3VsZCB5b3UgbWluZCB0byBhZGQgYQo+
IHNlbnRlbmNlIGluIHRoZSBjb21taXQgbWVzc2FnZSBhYm91dCBpdD8KCldlbGwgLSB0aGV5IGFy
ZW4ndCBnb2luZyB0byBzdXJ2aXZlIGxvbmctdGVybSBpbiB0aGlzIGZvcm0uwqAgQm90aCBuZWVk
CnRvIGJlY29tZSBkb21haW5fY3JlYXRlIHBhcmFtZXRlcnMuCgpXaGV0aGVyIG9yIG5vdCB0aGV5
IGFjdHVhbGx5IGdldCBjaGFuZ2VkIGJlZm9yZSBzb21lb25lIHRyaWVzCnVwc3RyZWFtaW5nIHRo
ZSBBUk0gQWx0cDJtIHdvcmsgaXMgYSBkaWZmZXJlbnQgbWF0dGVyLCBpZiB0aGF0IGFmZmVjdHMK
eW91ciBhbnN3ZXIuCgo+Cj4+Cj4+IEFsc28sIHRoZSBjaGVja3MgY2FuJ3Qgc3RheSBpbiBjb21t
b24gY29kZS7CoCBDdXJyZW50bHksIFhlbiBkb2Vzbid0Cj4+IHJlamVjdCBiYWQgcGFyYW1ldGVy
cywgYW5kIHRoZSB0b29sc3RhY2sgZG9lc24ndCBjaGVjayByZXR1cm4gdmFsdWVzLgo+PiBGcmFu
a2x5LCBuZWl0aGVyIG9mIHRoZXNlIGJ1Z3Mgc2hvdWxkIGV2ZXIgaGF2ZSBnb3QgdGhyb3VnaCBj
b2RlIHJldmlldywKPj4gc2VlaW5nIGFzIHdlIHdlcmUgZG9pbmcgcmF0aGVyIGJldHRlciBjb2Rl
IHJldmlldyBieSB0aGUgdGltZSB0aGUgQVJNCj4+IHBvcnQgY2FtZSBhYm91dC4KPgo+IFRoZSBI
Vk1fUEFSQU0gaXMgbm90IGdyZWF0IG9uIEFybSA6KC4gSXQgd291bGQgYmUgbmljZSB0byBnZXQg
dGhpcwo+IGZpeGVkIHByb3Blcmx5LgoKSSBsb29rZWQgYmFjayBhdCBteSBwYXRjaCBzZXJpZXMg
ZG9pbmcganVzdCB0aGlzLCBhbmQgZGVzcGl0ZSBiZWluZyBhCnllYXIgb2xkLCBJJ20gc3RpbGwg
c3VmZmljaWVudGx5IGlycml0YXRlZCBhdCB0aGUgbml0cGlja2luZyBhbmQKaW5hYmlsaXR5IHRv
IHJlYWQvaW50ZXJwcmV0IENPRElOR19TVFlMRSB0aGF0IEkgZG9uJ3QgZmVlbCBsaWtlIHdhc3Rp
bmcKYW55IG1vcmUgb2YgbXkgdGltZSByaWdodCBub3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
