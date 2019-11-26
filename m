Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFC310A1BD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:15:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZdS1-0004CH-5o; Tue, 26 Nov 2019 16:12:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZdRz-0004CC-0P
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:12:27 +0000
X-Inumbo-ID: 85ffc254-1067-11ea-a3a3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85ffc254-1067-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574784741;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=02ScHudxB38ftgDnCeZVtL1eq5k/OIi8q8FqrjvF3IM=;
 b=GGnDWdrC+G37xOH4mkdMSJ8aOgRUyzoReao9609U25v4sT4EF8v8/L3Q
 jp/PZgB3m3/XIx64JAuyGC7CtC06axxOhXKYMVeMQHmZwMlwf0faUNN+F
 hrgRkixNkCbdZgLK1Rq04TO1uhSD1gAy+YWZDt5WenlEdWalBZzAMNrvn 8=;
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
IronPort-SDR: Ymx5ru1bTK2banVtt3ziz7Mibx938Qp5cOxDpTrNcY+iusZMG8E8di1oCM5O/WB5GxIK3R6kSc
 N40dyqmW+zSSJBFZPlg97PUgiW0y9wkCzyJvjpi9mtSExcah7zLy4tZE87lh5gn0NAIKcUvfoZ
 TPDJIwj6L9Dko9SuxuCSVIa52EBJkyGSt5jnwhNOy4vZwD0e954roXSzty0l8p3DMYZcUm2KUz
 oSLjYDwspT4geNoC4rsF967RB1DT1Na9VmU5UONzAcKnWljdIFczbTsIs3YISLvDQK+rjWMCDD
 7ls=
X-SBRS: 2.7
X-MesageID: 8863589
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8863589"
To: Jan Beulich <jbeulich@suse.com>
References: <20191126120357.13398-1-andrew.cooper3@citrix.com>
 <20191126120357.13398-3-andrew.cooper3@citrix.com>
 <93e3dd69-698e-17ee-5eef-a932b1989786@suse.com>
 <fc3aea0d-1fec-7754-8f50-d00bfd2a52e1@citrix.com>
 <391ef1a5-a01f-4595-dc51-32a580f112a6@suse.com>
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
Message-ID: <4b464322-a25c-3ec1-0a75-f28eb81d2602@citrix.com>
Date: Tue, 26 Nov 2019 16:11:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <391ef1a5-a01f-4595-dc51-32a580f112a6@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/svm: Always intercept ICEBP
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Juergen Gross <jgross@suse.com>, Tamas K
 Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTEvMjAxOSAxNjowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMTEuMjAxOSAx
Njo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjYvMTEvMjAxOSAxNTozMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyNi4xMS4yMDE5IDEzOjAzLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IElDRUJQIGlzbid0IGhhbmRsZWQgd2VsbCBieSBTVk0uCj4+Pj4KPj4+PiBUaGUgVk1l
eGl0IHN0YXRlIGZvciBhICNEQi12ZWN0b3JlZCBUQVNLX1NXSVRDSCBoYXMgJXJpcCBwb2ludGlu
ZyB0byB0aGUKPj4+PiBhcHByb3ByaWF0ZSBpbnN0cnVjdGlvbiBib3VuZGFyeSAoZmF1bHQgb3Ig
dHJhcCwgYXMgYXBwcm9wcmlhdGUpLCBleGNlcHQgZm9yCj4+Pj4gYW4gSUNFQlAtaW5kdWNlZCAj
REIgVEFTS19TV0lUQ0gsIHdoZXJlICVyaXAgcG9pbnRzIGF0IHRoZSBJQ0VCUCBpbnN0cnVjdGlv
bgo+Pj4+IHJhdGhlciB0aGFuIGFmdGVyIGl0LiAgQXMgSUNFQlAgaXNuJ3QgZGlzdGluZ3Vpc2hl
ZCBpbiB0aGUgdmVjdG9yaW5nIGV2ZW50Cj4+Pj4gdHlwZSwgdGhlIHN0YXRlIGlzIGFtYmlndW91
cy4KPj4+Pgo+Pj4+IFRvIGFkZCB0byB0aGUgY29uZnVzaW9uLCBhbiBJQ0VCUCB3aGljaCBvY2N1
cnMgZHVlIHRvIEludHJvc3BlY3Rpb24KPj4+PiBpbnRlcmNlcHRpbmcgdGhlIGluc3RydWN0aW9u
LCBvciBmcm9tIHg4Nl9lbXVsYXRlKCkgd2lsbCBoYXZlICVyaXAgdXBkYXRlZCBhcwo+Pj4+IGEg
Y29uc2VxdWVuY2Ugb2YgcGFydGlhbCBlbXVsYXRpb24gcmVxdWlyZWQgdG8gaW5qZWN0IGFuIElD
RUJQIGV2ZW50IGluIHRoZQo+Pj4+IGZpcnN0IHBsYWNlLgo+Pj4+Cj4+Pj4gV2UgY291bGQgaW4g
cHJpbmNpcGxlIHNwb3QgdGhlIG5vbi1pbmplY3RlZCBjYXNlIGluIHRoZSBUQVNLX1NXSVRDSCBo
YW5kbGVyLAo+Pj4+IGJ1dCB0aGlzIHN0aWxsIHJlc3VsdHMgaW4gY29tcGxleGl0eSBpZiB0aGUg
SUNFQlAgaW5zdHJ1Y3Rpb24gYWxzbyBoYXMgYW4KPj4+PiBJbnN0cnVjdGlvbiBCcmVha3BvaW50
IGFjdGl2ZSBvbiBpdCAod2hpY2ggZ2VudWluZWx5IGhhcyBmYXVsdCBzZW1hbnRpY3MpLgo+Pj4+
Cj4+Pj4gVW5jb25kaXRpb25hbGx5IGludGVyY2VwdCBJQ0VCUC4gIFRoaXMgZG9lcyBoYXZlIGEg
dHJhcCBzZW1hbnRpY3MgZm9yIHRoZQo+Pj4+IGludGVyY2VwdCwgYW5kIGFsbG93cyB1cyB0byBt
b3ZlICVyaXAgZm9yd2FyZHMgYXBwcm9wcmlhdGVseSBiZWZvcmUgdGhlCj4+Pj4gVEFTS19TV0lU
Q0ggaW50ZXJjZXB0IGlzIGhpdC4KPj4+IEJvdGggYmVjYXVzZSBvZiB5b3UgbWVudGlvbmluZyB0
aGUgbW92aW5nIGZvcndhcmRzIG9mICVyaXAgYW5kIHdpdGggdGhlCj4+PiBpcmMgZGlzY3Vzc2lv
biBpbiBtaW5kIHRoYXQgd2UgaGFkIG5vIGlyYywgZG9uJ3QgeW91IG1lYW4gImZhdWx0Cj4+PiBz
ZW1hbnRpY3MiIGhlcmU/Cj4+IElDRUJQIHJlYWxseSBpcyB0b28gYnJva2VuIHVuZGVyIFNWTSB0
byBoYW5kbGUgYXJjaGl0ZWN0dXJhbGx5Lgo+Pgo+PiBUaGUgSUNFQlAgaW50ZXJjZXB0IGhhcyBu
UklQIGRlY29kZSBzdXBwb3J0LCBiZWNhdXNlIGl0IGlzIGFuCj4+IGluc3RydWN0aW9uIGludGVy
Y2VwdC7CoCBXZSBlbXVsYXRlIHRoZSBpbmplY3Rpb24gKGJlY2F1c2UgaXQgaXMgSUNFQlApLAo+
PiB3aGljaCBtZWFucyB3ZSByZS1lbnRlciB0aGUgZ3Vlc3Qgd2l0aCAlcmlwIG1vdmVkIGZvcndh
cmQsIGFuZCAjREIKPj4gKEhXX0VYQ0VQVElPTikgcGVuZGluZyBmb3IgaW5qZWN0aW9uLsKgIFRo
aXMgbWVhbnMgdGhhdC4uLgo+Pgo+Pj4gIElmIHNvCj4+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAuLi4gdGhlIElDRUJQLSNEQi12ZWN0b3JlZCBUQVNL
X1NXSVRDSCB3aWxsIG5vdyBmaW5kICVyaXAgcG9pbnRpbmcgYWZ0ZXIKPj4gdGhlIElDRUJQIGlu
c3RydWN0aW9uLCByYXRoZXIgdGhhbiBhdCBpdCwgbWFraW5nIGl0IGNvbnNpc3RlbnQgd2l0aAo+
PiBldmVyeSBvdGhlciAjREItdmVjdG9yZWQgVEFTS19TV0lUQ0guCj4+Cj4+IFRoaXMgZG9lcyBt
ZWFucyB0aGF0IGFuIGVhcmx5IHRhc2stc3dpdGNoIGZhdWx0IGZvciBJQ0VCUCB3aWxsIHJlbGlh
Ymx5Cj4+IGJlIGRlbGl2ZXJlZCB3aXRoIHRoZSB3cm9uZyAoaS5lLiB0cmFwKSBzZW1hbnRpY3Ms
IGJ1dCB0aGlzIGlzIGxlc3MgYmFkCj4+IHRoYW4gbWl4ZWQgZmF1bHQvdHJhcCBzZW1hbnRpY3Mg
ZGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIHNvdXJjZSBvZiB0aGUKPj4gSUNFQlAgd2FzIGludHJv
c3BlY3Rpb24vZW11bGF0aW9uIG9yIG5hdGl2ZSBleGVjdXRpb24uCj4+Cj4+IFdlIGNvdWxkIHJl
c3RvcmUgcHJvcGVyIGZhdWx0IGJlaGF2aW91ciBieSBleHRlbmRpbmcKPj4gc3ZtX2VtdWxfc3dp
bnRfaW5qZWN0aW9uKCkgdG8gZmlndXJlIG91dCB0aGF0IGEgdGFzayBzd2l0Y2ggaXMgbmVlZGVk
LAo+PiBhbmQgaW52b2tlIGh2bV90YXNrX3N3aXRjaCgpIGRpcmVjdGx5LCBidXQgSSBkb24ndCBo
YXZlIGVub3VnaCBUVUlUUwo+PiByaWdodCBub3cuCj4+Cj4+PiBPdGhlcndpc2UgSSBndWVzcyBJ
J20gc3RpbGwgbWlzc2luZyBzb21ldGhpbmcuCj4+IEkgaG9wZSB0aGlzIGNsZWFycyBpdCB1cC4K
PiBXZWxsLCBpdCBoZWxwcywgYnV0IHlvdSBkb24ndCByZWFsbHkgYW5zd2VyIHRoZSBxdWVzdGlv
bjogSXMgInRyYXAiCj4gaW4gdGhhdCBzZW50ZW5jZSBvZiB0aGUgZGVzY3JpcHRpb24gcmVhbGx5
IGNvcnJlY3Q/IEkuZS4gZG9uJ3QgeW91Cj4gaW5zdGVhZCBtZWFuICJmYXVsdCIgdGhlcmU/CgpJ
J3ZlIHJld29yZGVkIHRoYXQgYml0IHRvOgoKVW5jb25kaXRpb25hbGx5IGludGVyY2VwdCBJQ0VC
UC7CoCBUaGlzIGRvZXMgaGF2ZSBOUklQcyBzdXBwb3J0IGFzIGl0IGlzIGFuCmluc3RydWN0aW9u
IGludGVyY2VwdCwgd2hpY2ggYWxsb3dzIHVzIGFsbG93cyB1cyB0byBtb3ZlICVyaXAgZm9yd2Fy
ZHMKYXBwcm9wcmlhdGVseSBiZWZvcmUgdGhlIFRBU0tfU1dJVENIIGludGVyY2VwdCBpcyBoaXQu
wqAgVGhpcyBhbGxvd3MuLi4KCkFueSBiZXR0ZXI/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
