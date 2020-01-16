Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0B13F85C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 20:18:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isAbK-0001ze-Rh; Thu, 16 Jan 2020 19:14:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1k4+=3F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isAbJ-0001zZ-2t
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 19:14:41 +0000
X-Inumbo-ID: 70d38424-3894-11ea-87b2-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70d38424-3894-11ea-87b2-12813bfff9fa;
 Thu, 16 Jan 2020 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579202079;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eOrY2gk/q2XAj3jw2qgkVd0SyOJNCZjy6sNWseC7/C8=;
 b=CYl8smD7KSApjZ2LqOr6LLHSGM+00T8iOmo5HZSvyjA2R2UhOq/9guuw
 7T7DfCE83Pti+DFnPO+hftG1XAYRqJ9TR3y0Kl2WeYPKp6+5dFIcGrRYL
 5Z9IJJeDHSvRaYOyuIcPMhPoBO+rLnSW5r1JfFQu7VAoKPYomCJwZr+KA E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0QrqRYHoZSQgCFDgYC5V+Mjhhiee2xR1PkCKR1psXgSrvEEGfPCAEhLxSj9bhSfaTv87BJPY+E
 smVj+QDau2bkEBr4Dms3NxbM2u5VCfX0clf85X7Tk2ZY2K0Q6aGP2L0J0OlxMV+iidIymEDcQU
 Bbdgr2iHMSWCBG6k9whg7fjLs4fBAPlOdkpwkAfQd9kSFNvi1G8HN3UujKYbGQUa4D3kA3s2Ni
 7NcMAWE6yzNxbmpqJT9ngtqrJllB2zLRL8arp8xwCnIuuRdx3I24gknVuHT+aTQgjjofFsYJwq
 cxg=
X-SBRS: 2.7
X-MesageID: 11048421
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11048421"
To: Wei Liu <wl@xen.org>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
 <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
 <20200105212231.ty7cjfdu5di5sf4j@debian>
 <ec16fcba-099d-1a73-d33c-3ee9f0f7c005@citrix.com>
 <20200107161733.i3hedh2wcoijcglo@debian>
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
Message-ID: <a42bdfcf-cbb8-56d9-1155-79ae0531001a@citrix.com>
Date: Thu, 16 Jan 2020 19:14:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200107161733.i3hedh2wcoijcglo@debian>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDEvMjAyMCAxNjoxNywgV2VpIExpdSB3cm90ZToKPiBPbiBTdW4sIEphbiAwNSwgMjAy
MCBhdCAxMDowNjowOFBNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAwNS8wMS8y
MDIwIDIxOjIyLCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gU3VuLCBKYW4gMDUsIDIwMjAgYXQgMDc6
MDg6MjhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gK3N0YXRpYyBpbmxpbmUg
dWludDY0X3QgaHZfZG9faHlwZXJjYWxsKHVpbnQ2NF90IGNvbnRyb2wsIHBhZGRyX3QgaW5wdXQs
IHBhZGRyX3Qgb3V0cHV0KQo+Pj4+PiArewo+Pj4+PiArICAgIHVpbnQ2NF90IHN0YXR1czsKPj4+
Pj4gKwo+Pj4+PiArICAgIGFzbSB2b2xhdGlsZSAoIm1vdiAlW291dHB1dF0sICUlcjhcbiIKPj4+
Pj4gKyAgICAgICAgICAgICAgICAgICJjYWxsIGh2X2h5cGVyY2FsbF9wYWdlIgo+Pj4+PiArICAg
ICAgICAgICAgICAgICAgOiAiPWEiIChzdGF0dXMpLCAiK2MiIChjb250cm9sKSwKPj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgIitkIiAoaW5wdXQpIEFTTV9DQUxMX0NPTlNUUkFJTlQKPj4+Pj4g
KyAgICAgICAgICAgICAgICAgIDogW291dHB1dF0gInJtIiAob3V0cHV0KQo+Pj4+PiArICAgICAg
ICAgICAgICAgICAgOiAiY2MiLCAibWVtb3J5IiwgInI4IiwgInI5IiwgInIxMCIsICJyMTEiKTsK
Pj4+PiBJIHRoaW5rIHlvdSB3YW50Ogo+Pj4+Cj4+Pj4gcmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBy
OCBhc20oInI4IikgPSBvdXRwdXQ7Cj4+Pj4KPj4+PiBhbmQgIityIiAocjgpIGFzIGFuIG91dHB1
dCBjb25zdHJhaW50Lgo+Pj4gQWx0aG91Z2ggaXQgaXMgbmFtZWQgYG91dHB1dGAsIGl0IGlzIHJl
YWxseSBqdXN0IGFuIGlucHV0IHBhcmFtZXRlciBmcm9tCj4+PiBIeXBlci1WJ3MgUG9WLgo+PiBZ
ZXMsIGJ1dCBpdCBpcyBhbHNvIGNsb2JiZXJlZC4KPj4KPj4gVGhpcyBpcyBhbiBhd2t3YXJkIGNv
cm5lciBjYXNlIG9mIGdudSBpbmxpbmUgYXNzZW1ibHkuCj4+Cj4+IEl0IGlzIG5vdCBwZXJtaXR0
ZWQgdG8gaGF2ZSBhIGNsb2JiZXIgbGlzdCBvdmVybGFwIHdpdGggYW55IGlucHV0L291dHB1dAo+
PiBvcGVyYXRpb25zLCBhbmQgYmVjYXVzZSByOCBkb2Vzbid0IGhhdmUgYSB1bmlxdWUgbGV0dGVy
LCB5b3UgY2FuJ3QgZG8KPj4gdGhlIHVzdWFsIHRyaWNrIG9mICI9cjgiIChkaXNjYXJkKSA6ICJy
OCIgKGlucHV0KS4KPj4KPj4gVGhlIG9ubHkgYXZhaWxhYmxlIG9wdGlvbiBpcyB0byBtYXJrIGl0
IGFzIHJlYWQgYW5kIHdyaXR0ZW4gKHdoaWNoIGlzCj4+ICIrciIgaW4gdGhlIG91dHB1dCBsaXN0
KSwgYW5kIG5vdCB1c2UgdGhlIEMgdmFyaWFibGUgcjggYXQgYW55IHBvaW50IGxhdGVyLgo+IEJ1
dCByOCBpcyBvbmx5IGxpc3RlZCBpbiBjbG9iYmVyIGxpc3QsIHNvIGl0IGNlcnRhaW5seSBkb2Vz
bid0IG92ZXJsYXAKPiB3aXRoIGFueSBpbnB1dCByZWdpc3Rlci4gSSBmYWlsIHRvIHNlZSB3aGF0
IHRoZSBidWcgKGlmIHRoZXJlIGlzIGFueSkgaXMKPiBoZXJlLgoKJXI4IGlzIGFuIGlucHV0IHBh
cmFtZXRlci7CoCBZb3UgaGF2ZSAibW92ICVbb3V0cHV0XSwgJSVyOCIgaW4gdGhlIGFzbS4KClRo
ZSB3YXkgdGhpcyBpcyB3cml0dGVuIGNhdXNlcyB0aGUgY29tcGlsZXIgdG8gY29uc3RydWN0ICVb
b3V0cHV0XSBpbiBhCnJlZ2lzdGVyLCBwYXNzIGl0IGluIHZpYSB0aGUgc29sZSBpbnB1dCBwYXJh
bWV0ZXIsIGFuZCBiZWhpbmQgdGhlIHNjZW5lcwptb3ZlIGl0IGludG8gJXI4LgoKVGhlcmUgaXMg
YSBzbWFsbCBjaGFuY2Ugb2YgdGhlIGVtaXR0ZWQgYXNtIGJlaW5nICJtb3YgJXI4LCAlcjgiLCBh
bmQgYQptdWNoIGxhcmdlciBjaGFuY2Ugb2YgdGhlIGNvbXBpbGVyIGJlaW5nIGZvcmNlZCB0byBz
cGlsbCBhIGRpZmZlcmVudApyZWdpc3RlciB3aGVuIGl0IGNvdWxkIGhhdmUgdXNlZCAlcjggaW4g
dGhlIGZpcnN0IHBsYWNlLgoKPiBJIHRoaW5rIHdoYXQgeW91J3JlIGFza2luZyBmb3IgaGVyZSBp
cyBhbiBvcHRpbWlzYXRpb24uIElzIHRoYXQgY29ycmVjdD8KPiBJIGRvbid0IG1pbmQgY2hhbmdp
bmcgdGhlIGNvZGUuIFdoYXQgSSBuZWVkIGlzIGNsYXJpZmljYXRpb24gaGVyZS4KCkknbSBvbiB0
aGUgZmVuY2UgYXMgdG8gd2hldGhlciB0byBwdXQgaW4gdGhlIGNhdGVnb3J5IG9mIG9wdGltaXNh
dGlvbiwKb3IgYnVnZ3kgYXNtLgoKSSB0aGluayB0aGUgZ2VuZXJhdGVkIGNvZGUgd2lsbCBEVFJU
LCBidXQgaXQgaXMgYSBzdXNwaWNpb3VzIGxvb2tpbmcKcGllY2Ugb2YgYXNzZW1ibHksIHNvICJv
cHRpbWlzYXRpb24iIEkgZ3Vlc3M/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
