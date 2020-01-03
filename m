Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0588D12FCC5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 19:58:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inS6o-0004gF-7J; Fri, 03 Jan 2020 18:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Lau=2Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1inS6m-0004gA-Jo
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 18:55:40 +0000
X-Inumbo-ID: 9d0b8422-2e5a-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d0b8422-2e5a-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 18:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578077731;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DSTX9Jz+//ycETwPqzAqJYewcn2V0DmSJawVc4c0lis=;
 b=LJ6fsFOhYETm55fJI/8oHEn8a0UnQl3ZpaX4cwx+fg8MeIYvEaB3PT+o
 aw7gFac84QMnqauBl/7MguvdThpnRVMxXpQ9qyo8jXW+I5iMG6s5MY3S9
 jOPU5m3vCyyWvtimneqUY3XjlLl/7m+GwLPX62dMbh8HQQADg7rkUaYji E=;
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
IronPort-SDR: hrMKimTtiJFo+E5mu11xahA2UnOI+yET995utKkar+D0w8byl/uJ/4mTfpVuaMdKVWqJWtW6PK
 VRwnsYM4BVEO3iS2M4JaY+3MgwNOOWW4x8IHefj1d/0cuJ3ilhfHK/JDD9p6G69d+v+AmxtHRz
 nzg0N/4DME9OpdoGlD1MUjTvFJMDuKjjb4LlNqMGeHGbP4cX5PlcXRqAHFOqJt9B7yydcBGIl/
 r663lXPEGH5G1YXTB/TNUbcavORD60ZOiufGXYj45QylzMY323tkwgWf87RsUUgfjV/J1/E7Hh
 xZk=
X-SBRS: 2.7
X-MesageID: 10794383
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,391,1571716800"; d="scan'208";a="10794383"
To: Jan Beulich <jbeulich@suse.com>
References: <20200102145953.6503-1-andrew.cooper3@citrix.com>
 <d8abd43b-ac91-9eef-3c34-394ed9842342@suse.com>
 <d6e7c26b-2233-b1da-d866-d470a5c110e4@citrix.com>
 <5f6fff0a-d677-11e5-07ad-7e0250d29477@suse.com>
 <1628e07b-4599-e885-df5b-8b71872ca291@citrix.com>
 <8cc1f7c7-c40d-c155-0d69-239cd6ac4455@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <842fd790-4bfa-0e8a-f09b-81a22a773021@citrix.com>
Date: Fri, 3 Jan 2020 18:55:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8cc1f7c7-c40d-c155-0d69-239cd6ac4455@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Clean up the trampoline
 transition into Long mode
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDEvMjAyMCAxNDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDMuMDEuMjAyMCAx
NToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDMvMDEvMjAyMCAxMzo1MiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMy4wMS4yMDIwIDE0OjQ0LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Ogo+Pj4+IE9uIDAzLzAxLzIwMjAgMTM6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAw
Mi4wMS4yMDIwIDE1OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gQEAgLTExMSwyNiAr
MTA5LDYgQEAgdHJhbXBvbGluZV9wcm90bW9kZV9lbnRyeToKPj4+Pj4+ICBzdGFydDY0Ogo+Pj4+
Pj4gICAgICAgICAgLyogSnVtcCB0byBoaWdoIG1hcHBpbmdzLiAqLwo+Pj4+Pj4gICAgICAgICAg
bW92YWJzICAkX19oaWdoX3N0YXJ0LCAlcmRpCj4+Pj4+PiAtCj4+Pj4+PiAtI2lmZGVmIENPTkZJ
R19JTkRJUkVDVF9USFVOSwo+Pj4+Pj4gLSAgICAgICAgLyoKPj4+Pj4+IC0gICAgICAgICAqIElm
IGJvb3RpbmcgdmlydHVhbGlzZWQsIG9yIGhvdC1vbmxpbmluZyBhIENQVSwgc2libGluZyB0aHJl
YWRzIGNhbgo+Pj4+Pj4gLSAgICAgICAgICogYXR0ZW1wdCBCcmFuY2ggVGFyZ2V0IEluamVjdGlv
biBhZ2FpbnN0IHRoaXMgam1wLgo+Pj4+Pj4gLSAgICAgICAgICoKPj4+Pj4+IC0gICAgICAgICAq
IFdlJ3ZlIGdvdCBubyB1c2FibGUgc3RhY2sgc28gY2FuJ3QgdXNlIGEgUkVUUE9MSU5FIHRodW5r
LCBhbmQgYXJlCj4+Pj4+PiAtICAgICAgICAgKiBmdXJ0aGVyIHRoYW4gZGlzcDMyIGZyb20gdGhl
IGhpZ2ggbWFwcGluZ3Mgc28gY291bGRuJ3QgdXNlCj4+Pj4+PiAtICAgICAgICAgKiBKVU1QX1RI
VU5LIGV2ZW4gaWYgaXQgd2FzIGEgbm9uLVJFVFBPTElORSB0aHVuay4gIEZ1cnRoZXJtb3JlLCBh
bgo+Pj4+Pj4gLSAgICAgICAgICogTEZFTkNFIGlzbid0IG5lY2Vzc2FyaWx5IHNhZmUgdG8gdXNl
IGF0IHRoaXMgcG9pbnQuCj4+Pj4+PiAtICAgICAgICAgKgo+Pj4+Pj4gLSAgICAgICAgICogQXMg
dGhpcyBpc24ndCBhIGhvdHBhdGgsIHVzZSBhIGZ1bGx5IHNlcmlhbGlzaW5nIGV2ZW50IHRvIHJl
ZHVjZQo+Pj4+Pj4gLSAgICAgICAgICogdGhlIHNwZWN1bGF0aW9uIHdpbmRvdyBhcyBtdWNoIGFz
IHBvc3NpYmxlLiAgJWVieCBuZWVkcyBwcmVzZXJ2aW5nCj4+Pj4+PiAtICAgICAgICAgKiBmb3Ig
X19oaWdoX3N0YXJ0Lgo+Pj4+Pj4gLSAgICAgICAgICovCj4+Pj4+PiAtICAgICAgICBtb3YgICAg
ICVlYngsICVlc2kKPj4+Pj4+IC0gICAgICAgIGNwdWlkCj4+Pj4+PiAtICAgICAgICBtb3YgICAg
ICVlc2ksICVlYngKPj4+Pj4+IC0jZW5kaWYKPj4+Pj4+IC0KPj4+Pj4+ICAgICAgICAgIGptcHEg
ICAgKiVyZGkKPj4+Pj4gSSBjYW4gc2VlIHRoaXMgYmVpbmcgdW5uZWVkZWQgd2hlbiBydW5uaW5n
IHZpcnR1YWxpemVkLCBhcyB5b3Ugc2FpZAo+Pj4+PiBpbiByZXBseSB0byBXZWkuIEhvd2V2ZXIs
IGZvciBob3Qtb25saW5pbmcgKHdoZW4gb3RoZXIgQ1BVcyBtYXkgcnVuCj4+Pj4+IHJhbmRvbSB2
Q1BVLXMpIEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNhbiBzYWZlbHkgYmUgZHJvcHBlZC4gVGhlcmUn
cwo+Pj4+PiBubyBzaW1pbGFyIGNvbmNlcm4gZm9yIFMzIHJlc3VtZSwgYXMgdGhhd19kb21haW5z
KCkgaGFwcGVucyBvbmx5Cj4+Pj4+IGFmdGVyIGVuYWJsZV9ub25ib290X2NwdXMoKS4KPj4+PiBJ
IGNvdmVyZWQgdGhhdCBpbiB0aGUgc2FtZSByZXBseS7CoCBBbnkgZ3Vlc3Qgd2hpY2ggY2FuIHVz
ZSBicmFuY2ggdGFyZ2V0Cj4+Pj4gaW5qZWN0aW9uIGFnYWluc3QgdGhpcyBqbXAgY2FuIGFsc28g
cG9pc29uIHRoZSByZWd1bGFyIGJyYW5jaCBwcmVkaWN0b3IKPj4+PiBhbmQgZ2V0IGF0IGRhdGEg
dGhhdCB3YXkuCj4+PiBBcmVuJ3QgeW91IGltcGx5aW5nIHRoZW4gdGhhdCByZXRwb2xpbmVzIGNv
dWxkIGFsc28gYmUgZHJvcHBlZD8KPj4gTm8uwqAgSXQgaXMgYSBzaW1wbGUgcmlzayB2cyBjb21w
bGV4aXR5IHRyYWRlb2ZmLgo+Pgo+PiBHdWVzdHMgcnVubmluZyBvbiBhIHNpYmxpbmcgKmNhbiBh
bHJlYWR5KiBhdHRhY2sgdGhpcyBicmFuY2ggd2l0aCBCVEksCj4+IGJlY2F1c2UgQ1BVSUQgaXNu
J3QgYSBmaXggdG8gYmFkIEJUQiBzcGVjdWxhdGlvbiwgYW5kIHRoZSBsZWFrYWdlIGdhZGdldAo+
PiBuZWVkIG9ubHkgYmUgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uCj4+Cj4+IFN1Y2ggYSBndWVzdCBj
YW4gYWxzbyBhdHRhY2sgWGVuIGluIGdlbmVyYWwgd2l0aCBTcGVjdHJlIHYxLgo+Pgo+PiBBcyBJ
IHNhaWQgLSB0aGlzIHdhcyBpbnRyb2R1Y2VkIGJlY2F1c2Ugb2YgcGFyYW5vaWEsIGJhY2sgd2hp
bGUgdGhlIGZldwo+PiBwZW9wbGUgd2hvIGtuZXcgYWJvdXQgdGhlIGlzc3VlcyAob25seSBzZXZl
cmFsIGh1bmRyZWQgYXQgdGhlIHRpbWUpIHdlcmUKPj4gYXR0ZW1wdGluZyB0byBmaWd1cmUgb3V0
IHdoYXQgZXhhY3RseSBhIHNwZWN1bGF0aXZlIGF0dGFjayBsb29rZWQgbGlrZSwKPj4gYW5kIHdh
cyBhcHBseWluZyBkdWN0IHRhcGUgdG8gZXZlcnl0aGluZyBzdXNwaWNpb3VzIGJlY2F1c2Ugd2Ug
aGFkIDAKPj4gdGltZSB0byByZXdyaXRlIHNldmVyYWwgY29yZSBwaWVjZXMgb2Ygc3lzdGVtIGhh
bmRsaW5nLgo+IFdlbGwsIG9rYXkgdGhlbjoKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKVGhhbmtzLsKgIEkndmUgYWRqdXN0ZWQgdGhlIGNvbW1pdCBtZXNzYWdl
IGluIGxpZ2h0IG9mIHRoaXMgY29udmVyc2F0aW9uLgoKPgo+Pj4+IE9uY2UgYWdhaW4sIHdlIGdl
dCB0byBDUFUgSG90cGx1ZyBiZWluZyBhbiB1bnVzZWQgZmVhdHVyZSBpbiBwcmFjdGljZSwKPj4+
PiB3aGljaCBpcyBjb21wbGV0ZWx5IGV2aWRlbnQgbm93IHdpdGggSW50ZWwgTUNFIGJlaGF2aW91
ci4KPj4+IFdoYXQgZG9lcyBJbnRlbCdzIE1DRSBiZWhhdmlvciBoYXZlIHRvIGRvIHdpdGggd2hl
dGhlciBDUFUgaG90cGx1Zwo+Pj4gKG9yIGhvdC1vbmxpbmluZykgaXMgKHVuKXVzZWQgaW4gcHJh
Y3RpY2U/Cj4+IFRoZSBsb2dpY2FsIGNvbnNlcXVlbmNlIG9mIGhvdHBsdWcgYnJlYWtpbmcgTUNF
cy4KPj4KPj4gSWYgaG90cGx1ZyBoYWQgYmVlbiB1c2VkIGluIHByYWN0aWNlLCB0aGUgTUNFIGJl
aGF2aW91ciB3b3VsZCBoYXZlIGNvbWUKPj4gdG8gbGlnaHQgbXVjaCBzb29uZXIsIHdoZW4gTUNF
cyBkaWRuJ3Qgd29yayBpbiBwcmFjdGljZS4KPj4KPj4gR2l2ZW4gdGhhdCBNQ0VzIHJlYWxseSBk
aWQgd29yayBpbiBwcmFjdGljZSBldmVuIGJlZm9yZSB0aGUgTDFURiBkYXlzLAo+PiBob3RwbHVn
IHdhc24ndCBpbiBjb21tb24tZW5vdWdoIHVzZSBmb3IgYW55b25lIHRvIG5vdGljZSB0aGUgTUNF
IGJlaGF2aW91ci4KPiBPciBzeXN0ZW1zIHdoZXJlIENQVSBob3RwbHVnIHdhcyBhY3R1YWxseSB1
c2VkIG9uIHdlcmUgb2YgZ29vZAo+IGVub3VnaCBxdWFsaXR5IHRvIG5ldmVyIHN1cmZhY2UgI01D
CgpTdWZmaWNlIGl0IHRvIHNheSB0aGF0IHRoZXJlIGlzIHBsZW50eSBvZiBldmlkZW5jZSB0byB0
aGUgY29udHJhcnkgaGVyZS4KCldpdGhvdXQgZ29pbmcgaW50byBkZXRhaWxzIGZvciBvYnZpb3Vz
IHJlYXNvbnMsIHRoZXJlIGhhdmUgYmVlbiBudW1iZXIKb2YgI01DIGNvbmRpdGlvbnMgKGJvdGgg
cHJlZXhpc3RpbmcsIGFuZCByZWdyZXNzaW9ucykgaW4gcmVjZW50Cm1pY3JvY29kZSBkaXNjb3Zl
cmVkIGluIHRoZSBmaWVsZCBiZWNhdXNlIGV2ZXJ5b25lIGlzIG5lZWRpbmcgdG8KcHJvYWN0aXZl
bHkgdGFrZSBtaWNyb2NvZGUgdXBkYXRlcyB0aGVzZSBkYXlzLgoKPiAocGVyc29uYWxseSBJIGRv
bid0IHRoaW5rCj4gSSd2ZSBzZWVuIG1vcmUgdGhhbiBhIGhhbmRmdWwgb2Ygbm9uLXJlcHJvZHVj
aWJsZSAjTUMgaW5zdGFuY2VzKT8KCllvdSBkb24ndCBydW4gYSAiY2xvdWQgc2NhbGUiIG51bWJl
ciBvZiBzeXN0ZW1zLgoKRXZlbiBYZW5TZXJ2ZXJzIHRlc3Qgc3lzdGVtIG9mIGEgZmV3IGh1bmRy
ZWQgc3lzdGVtcyBzZWVzIGEgY29uY2VybmluZwooYnV0IHVsdGltYXRlbHksIGJhY2tncm91bmQg
bm9pc2UpIHJhdGUgb2YgI01DJ3MsIHNvbWUgb2Ygd2hpY2ggYXJlCmRlZmluaXRlIGhhcmR3YXJl
IGZhaWx1cmVzIChhbmQga2VwdCBhcm91bmQgZm9yIGVycm9yIHRlc3RpbmcgcHVycG9zZXMpLAph
bmQgb3RoZXJzIGFyZSBpbiBuZWVkIG9mIGludmVzdGlnYXRpb24uCgo+IE9yIHBlb3BsZSBoYXZp
bmcgcnVuIGludG8gdGhlIGJhZCBiZWhhdmlvciBzaW1wbHkgZGlkbid0IGhhdmUgdGhlCj4gcmVz
b3VyY2VzIHRvIGludmVzdGlnYXRlIHdoeSB0aGVpciBzeXN0ZW0gc2h1dCBkb3duIHNpbGVudGx5
Cj4gKHBlcmhhcHMgZ2l2aW5nIGVudGlyZWx5IHJhbmRvbSBhcHBlYXJhbmNlIG9mIHRoZSBiZWhh
dmlvcik/CgpDdXN0b21lcnMgZG9uJ3QgdG9sZXJhdGUgdGhlaXIgaG9zdHMgcmFuZG9tbHkgY3Jh
c2hpbmcsIGVzcGVjaWFsbHkgaWYgaXQKaGFwcGVucyBjb25zaXN0ZW50bHkuCgpZZXMgLSB0ZWNo
bmljYWxseSBzcGVha2luZyBhbGwgb2YgdGhlc2UgYXJlIG9wdGlvbnMsIGJ1dCB0aGUgYmFsYW5j
ZSBvZgpwcm9iYWJpbGl0eSBpcyB2YXN0bHkgb24gdGhlIHNpZGUgb2YgQ1BVIGhvdC1wbHVnIG5v
dCBhY3R1YWxseSBiZWluZwp1c2VkIGF0IGFueSBzY2FsZSBpbiBwcmFjdGljZS7CoCAoTm90IGxl
YXN0IGJlY2F1c2UgdGhlcmUgYXJlIHN0aWxsCmludGVycnVwdCBoYW5kbGluZyBidWdzIHByZXNl
bnQgaW4gWGVuJ3MgaW1wbGVtZW50YXRpb24uKQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
