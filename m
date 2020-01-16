Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32613F5A7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:58:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isAID-0000G9-1E; Thu, 16 Jan 2020 18:54:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1k4+=3F=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isAIB-0000G4-TB
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:54:55 +0000
X-Inumbo-ID: ad679389-3891-11ea-87ad-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad679389-3891-11ea-87ad-12813bfff9fa;
 Thu, 16 Jan 2020 18:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579200892;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=NWTtFBHKwBB+eqhxxPJXo97bN/PgqYjigkCvIbGmbjM=;
 b=HgJuz3gtGILwaGsCP0eMimIJ+4k7e15UnM51sL0CFNdE00I0kMxqN1IT
 RDXQgqBNr8mPnQApP0OGmz6vJMQ3ZbkbUTuw+zp/ij8PYQeNZa5e/NvuV
 BH/uurELrH/NoDoV4IOwImyHK9bvHwk5LeJGVcYAif+4GWMPvGuvmEC/h g=;
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
IronPort-SDR: R61idBp4Et+XzBUIPAVIl5B5uKc45DNu9l9cnYMBlUwnp/1W4u9+k9Udl5R3ZQUHJ3Cl6cJd5v
 quaDVc4Jd87mqOFqbxQsYsK5gzsgOsulmlDpcfHIFWGl6mJOpSJ6v5qRW/67J9B0i0jf3shDBe
 E6b0UPl6oFc1b4OjmovbdwsqmM2QRLg3m+ejGBek0e1GtqsI1h35oSZI1qJds3VTkS+PBB3qNI
 JqrLAqDE8nAU5MKXv76Kk8BJS9O19jrwWRB/yN4V6bKIpusnBeL52JDs6pziJo4MKXMSpGs1HQ
 EYI=
X-SBRS: 2.7
X-MesageID: 11401392
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11401392"
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
References: <20200109134825.31482-1-jgross@suse.com>
 <20200109134825.31482-2-jgross@suse.com>
 <f1e82975-0789-68b8-691b-02f557c27400@suse.com>
 <aacfae4e-39ca-b183-8b8a-b347415ba553@suse.com>
 <251bd26c-1937-e70b-3ec3-6ebb10e879dc@suse.com>
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
Message-ID: <aedc415a-5a54-5f54-8daa-14685eb78276@citrix.com>
Date: Thu, 16 Jan 2020 18:54:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <251bd26c-1937-e70b-3ec3-6ebb10e879dc@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDEvMjAyMCAxNjoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTQuMDEuMjAyMCAx
NzowMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMTQuMDEuMjAgMTY6NDcsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMDkuMDEuMjAyMCAxNDo0OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiAtLS0gYS94ZW4vS2NvbmZpZy5kZWJ1Zwo+Pj4+ICsrKyBiL3hlbi9LY29uZmlnLmRlYnVn
Cj4+Pj4gQEAgLTgxLDYgKzgxLDEyIEBAIGNvbmZpZyBQRVJGX0FSUkFZUwo+Pj4+ICAgCS0tLWhl
bHAtLS0KPj4+PiAgIAkgIEVuYWJsZXMgc29mdHdhcmUgcGVyZm9ybWFuY2UgY291bnRlciBhcnJh
eSBoaXN0b2dyYW1zLgo+Pj4+ICAgCj4+Pj4gK2NvbmZpZyBERUJVR19CVUdWRVJCT1NFCj4+Pj4g
Kwlib29sICJWZXJib3NlIEJVR19PTiBtZXNzYWdlcyIKPj4+PiArCWRlZmF1bHQgREVCVUcKPj4+
PiArCS0tLWhlbHAtLS0KPj4+PiArCSAgSW4gY2FzZSBhIEJVR19PTiB0cmlnZ2VycyBhZGRpdGlv
bmFsbHkgcHJpbnQgdGhlIHRyaWdnZXJpbmcKPj4+PiArCSAgY29uZGl0aW9uIG9uIHRoZSBjb25z
b2xlLgo+Pj4+ICAgCj4+Pj4gICBjb25maWcgVkVSQk9TRV9ERUJVRwo+Pj4gV2hpbGUgSSBjYW4g
c2VlIHJlYXNvbnMgdG8gcHV0IHRoaXMgaGVyZSwgZG9pbmcgc28gbWVhbnMgdGhlIG9wdGlvbgo+
Pj4gd2lsbCBiZSB1bmF2YWlsYWJsZSBpbiBub24tRVhQRVJUIHJlbGVhc2UgYnVpbGRzLiBJcyBp
dCBpbnRlbmRlZCB0bwo+Pj4gYmUgdGhhdCB3YXk/Cj4+IEkgY2FuIG1vdmUgaXQgZWl0aGVyIHRv
IHhlbi9LY29uZmlnIG9yIGluIEtjb25maWcuZGVidWcgb3V0IG9mIHRoZQo+PiAiaWYgZXhwZXJ0
IiBzZWN0aW9uIGlmIHlvdSB3YW50Lgo+IEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBiZXR0ZXIsIGJ1
dCBnaXZlIG90aGVycyBhIGNoYW5jZSB0byB2b2ljZQo+IG9waW5pb25zLgoKVEJILCBJIGRvbid0
IHRoaW5rIGFueW9uZSB3aWxsIGJlIGludGVyZXN0ZWQgaW4gbm90IGhhdmluZyB0aGUgc3RyaW5n
cy7CoApUaGUgY2hhbmdlIGlzIHdoYXQ/IGEgY291cGxlIG9mIGh1bmRyZWQgYnl0ZXM/wqAgVGhh
dCBpcyBhIGZyYWN0aW9uIG9mCnRoZSBzaXplIG9mIHNvbWUgZnVuY3Rpb25zIHdlIGhhdmUuCgpQ
ZXJzb25hbGx5LCBJIHdvdWxkbid0IGV2ZW4gYm90aGVyIGhhdmluZyB0aGUgb3B0aW9uLgoKPgo+
Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9saWIuaAo+Pj4+IEBAIC04LDcgKzgsMTIgQEAKPj4+PiAgICNpbmNsdWRlIDx4ZW4vc3RyaW5n
Lmg+Cj4+Pj4gICAjaW5jbHVkZSA8YXNtL2J1Zy5oPgo+Pj4+ICAgCj4+Pj4gKyNkZWZpbmUgQlVH
X09OX1ZFUkJPU0UocCkgZG8geyBpZiAodW5saWtlbHkocCkpIEJVR19WRVJCT1NFKCNwKTsgIH0g
d2hpbGUgKDApCj4+Pj4gKyNpZmRlZiBDT05GSUdfREVCVUdfQlVHVkVSQk9TRQo+Pj4+ICsjZGVm
aW5lIEJVR19PTihwKSAgQlVHX09OX1ZFUkJPU0UocCkKPj4+IExvb2tzIGxpa2UgdGhpcyB3aWxs
IGZhaWwgdG8gYnVpbGQgb24gQXJtPyBBbHNvIC0gYW55IHBhcnRpY3VsYXIKPj4gVWgsIHNoYW1l
IG9uIG1lIQo+Pgo+Pj4gcmVhc29uIGZvciB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZSBzZXBhcmF0
ZSBCVUdfT05fVkVSQk9TRSgpLAo+Pj4gd2hlbiBCVUdfT04oKSBjb3VsZCBkaXJlY3RseSB1c2Ug
QlVHX1ZFUkJPU0UoKT8gSSBkb24ndCB0aGluayB3ZQo+Pj4gd2FudCB0byBlbmNvdXJhZ2UgdXNl
IG9mIEJVR19PTl9WRVJCT1NFKCkgZWxzZXdoZXJlIC4uLgo+PiBJIHdhbnRlZCB0byBvZmZlciB0
aGF0IG9wdGlvbi4gSWYgeW91IHdhbnQgbWUgdG8gcmVtb3ZlIGl0IEkgd291bGRuJ3QKPj4gbWlu
ZC4KPiBBcyBhYm92ZSAtIHVubGVzcyB0aGVyZSBhcmUgZ29vZCByZWFzb25zIChtYWtpbmcgb3Ro
ZXJzIHRvIGFncmVlCj4gd2l0aCB5b3UgdG8gaGF2ZSBpdCksIEknZCBwcmVmZXIgdG8gbm90IHNl
ZSBpdCBiZWluZyBpbmRlcGVuZGVudGx5Cj4gdXNhYmxlLCBhdCBsZWFzdCBmb3IgdGhlIHRpbWUg
YmVpbmcuCgpJJ2QgYWdyZWUgd2l0aCB0aGUgd2lzaCB0byBub3QgaGF2ZSBhIG5ldyBmbGF2b3Vy
IG9mIEJVR19PTigpLgoKUGVvcGxlIHdyaXRpbmcgY29kZSBhcmVuJ3QgZ29pbmcgdG8gd2FudCB0
aGUgY29tcGxleGl0eSBvZiB0aGlua2luZwphYm91dCBpdCwgYW5kIHBlb3BsZSB3aG8gY2FyZSBh
Ym91dCB0aGUgcHJlc2VuY2UvYWJzZW5jZSBvZiBtZXNzYWdlcwp3aWxsIGNhcmUgYWJvdXQgaXQg
Z2xvYmFsbHksIG5vdCBvbiBhIHBlci11c2UgYmFzZXMuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
