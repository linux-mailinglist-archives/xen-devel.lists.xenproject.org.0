Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB7C233C8
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 14:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hShRG-0004nw-G9; Mon, 20 May 2019 12:30:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hShRF-0004nr-1y
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 12:30:45 +0000
X-Inumbo-ID: 150343d4-7afb-11e9-9230-3fec633d6321
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 150343d4-7afb-11e9-9230-3fec633d6321;
 Mon, 20 May 2019 12:30:42 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 9sNvxzZYVEZe8WzbS2RYF2b0o9uBlj5BBI8Z6jx8ZHLumibziaJtnhbQa4bD22slOTCa3sxl54
 SxQWf+Er1qB9t7HF1bcKhqG9A7xRJhlCxJOkec4CHhn2qTl09dmYjS0H9+yHg6PSCU0VZ27+L0
 opF5QPXm8BkAvaVkV8h0m72UGTHHIx2pz6Yr6oV9l3rs7YmOFA+hEK6ZkjjS2qr5adi5Bm+y/j
 Klunk9GRhK6u4AqOGXLkEk2vcozR2+qsSdiLnGWwOVwjgkurxE9faInEyVG8WWnCxPekuKSndY
 7Rk=
X-SBRS: 2.7
X-MesageID: 632587
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="632587"
To: Jan Beulich <JBeulich@suse.com>
References: <1558347216-19179-1-git-send-email-andrew.cooper3@citrix.com>
 <5CE292370200007800230938@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <668eb835-cb3e-66de-953a-235d8d5ca5c1@citrix.com>
Date: Mon, 20 May 2019 13:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE292370200007800230938@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/svm: Drop support for AMD's Lightweight
 Profiling
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
Cc: Wei Liu <wei.liu2@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMDUvMjAxOSAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjAuMDUuMTkg
YXQgMTI6MTMsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gTGlnaHR3ZWln
aHQgUHJvZmlsaW5nIHdhcyBpbnRyb2R1Y2VkIGluIEJ1bGxkb3plciAoRmFtMTVoKSwgYnV0IHdh
cyBkcm9wcGVkCj4+IGZyb20gWmVuIChGYW0xN2gpIHByb2Nlc3NvcnMuICBGdXJ0aGVybW9yZSwg
TFdQIHdhcyBkcm9wcGVkIGZyb20gRmFtMTUvMTYgQ1BVcwo+PiB3aGVuIElCUEIgZm9yIFNwZWN0
cmUgdjIgd2FzIGludHJvZHVjZWQgaW4gbWljcm9jb2RlLCBvd2luZyB0byBMV1Agbm90IGJlaW5n
Cj4+IHVzZWQgaW4gcHJhY3RpY2UuCj4+Cj4+IEFzIGEgcmVzdWx0LCBDUFVzIHdoaWNoIGFyZSBv
cGVyYXRpbmcgd2l0aGluIHNwZWNpZmljYXRpb24gKGkuZS4gd2l0aCB1cCB0bwo+PiBkYXRlIG1p
Y3JvY29kZSkgbm8gbG9uZ2VyIGhhdmUgdGhpcyBmZWF0dXJlLCBhbmQgdGhlcmVmb3JlIGFyZSBu
b3QgdXNpbmcgaXQuCj4+Cj4+IERyb3Agc3VwcG9ydCBmcm9tIFhlbi4gIFRoZSBtYWluIG1vdGl2
YXRpb24gaGVyZSBpcyB0byByZW1vdmUgdW5uZWNlc3NhcnkKPj4gY29tcGxleGl0eSBmcm9tIENQ
VUlEIGhhbmRsaW5nLCBidXQgaXQgYWxzbyB0aWRpZXMgdXAgdGhlIFNWTSBjb2RlIG5pY2VseS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhh
bmtzLgoKPgo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNl
dC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgK
Pj4gQEAgLTE3Niw3ICsxNzYsNyBAQCBYRU5fQ1BVRkVBVFVSRShJQlMsICAgICAgICAgICAzKjMy
KzEwKSAvKiAgIEluc3RydWN0aW9uIEJhc2VkIFNhbXBsaW5nICovCj4+ICBYRU5fQ1BVRkVBVFVS
RShYT1AsICAgICAgICAgICAzKjMyKzExKSAvKkEgIGV4dGVuZGVkIEFWWCBpbnN0cnVjdGlvbnMg
Ki8KPj4gIFhFTl9DUFVGRUFUVVJFKFNLSU5JVCwgICAgICAgIDMqMzIrMTIpIC8qICAgU0tJTklU
L1NUR0kgaW5zdHJ1Y3Rpb25zICovCj4+ICBYRU5fQ1BVRkVBVFVSRShXRFQsICAgICAgICAgICAz
KjMyKzEzKSAvKiAgIFdhdGNoZG9nIHRpbWVyICovCj4+IC1YRU5fQ1BVRkVBVFVSRShMV1AsICAg
ICAgICAgICAzKjMyKzE1KSAvKlMgIExpZ2h0IFdlaWdodCBQcm9maWxpbmcgKi8KPj4gK1hFTl9D
UFVGRUFUVVJFKExXUCwgICAgICAgICAgIDMqMzIrMTUpIC8qICAgTGlnaHQgV2VpZ2h0IFByb2Zp
bGluZyAqLwo+IFN0cmljdGx5IHNwZWFraW5nIHRoaXMgaXMgbm90IHBlcm1pdHRlZCAoc2VlIHRo
ZSBvdGhlciB0aHJlYWQgb24KPiB0aGlzIGJlaW5nIHBhcnQgb2YgdGhlIHB1YmxpYyBpbnRlcmZh
Y2UpLiBCdXQgb2YgY291cnNlIHN0cmljdGx5Cj4gc3BlYWtpbmcgaXQgd2FzIGFsc28gbm90IHBl
cm1pdHRlZCBmb3IgQU1EIHRvIHJlbW92ZSB0aGUKPiBmZWF0dXJlIGluIGEgdWNvZGUgdXBkYXRl
IChJIHdvbmRlciBidHcgd2hldGhlciB0aGUgaW5zbnMKPiBpbmRlZWQgI1VEIG5vdyBvbiBGYW0x
NS8xNikuCgpUaGVyZSBpcyBub3RoaW5nICJub3QgcGVybWl0dGVkIiBhYm91dCBpdC7CoCBBTUQg
Y2FuIGRvIHdoYXRldmVyIHRoZXkKd2FudCBpbiBtaWNyb2NvZGUsIGFzIGNhbiB3ZSB3aXRoIG91
ciBmZWF0dXJlIHN1cHBvcnQuCgpJdCBpcyBjZXJ0YWlubHkgaW4gdGhlaXIgKGFuZCBvdXIpIGlu
dGVyZXN0IHRvIG5vdCBicmVhayBiYWNrd2FyZHMKY29tcGF0aWJpbGl0eSwgd2hpY2ggaXMgd2h5
IHRoZXJlIHNob3VsZCBiZSBhIHZlcnkgZ29vZCByZWFzb24gdG8KcmVncmVzcyB0aGUgY3VzdG9t
ZXIgZXhwZXJpZW5jZS4KCkluIHRoaXMgY2FzZSwgTFdQIGhhZCBhbHJlYWR5IGJlZW4gZHJvcHBl
ZCBmcm9tIFplbiBiZWNhdXNlIGl0IHdhc24ndAp1c2VkIGluIHByYWN0aWNlLCBhbmQgdGhlbiBz
dWRkZW5seSBTcGVjdHJlL01lbHRkb3duIGNhbWUgYWxvbmcgYW5kCnVyZ2VudGx5IG5lZWRlZCBh
IGZpeC7CoCBBTUQgZGlkbid0IGRyb3AgTFdQIGxpZ2h0bHksIGFuZCB3b3VsZCBoYXZlCmF2b2lk
ZWQgZG9pbmcgc28gaWYgaXQgd2FzIHBvc3NpYmxlLgoKSG93ZXZlciwgZ2l2ZW4gYSBjaG9pY2Ug
YmV0d2VlbiBmaXhpbmcgU3BlY3RyZSwgYW5kIHJldGFpbmluZyBzdXBwb3J0CmZvciBhIGZlYXR1
cmUgd2hpY2ggaXNuJ3QgdXNlZCwgZHJvcHBpbmcgTFdQIHdhcyB0aGUgY29ycmVjdCBkZWNpc2lv
biB0bwptYWtlLCBob3dldmVyIHVuY29tZm9ydGFibGUgdGhlIGRlY2lzaW9uIHdhcyB0byBtYWtl
LgoKQXMgZm9yICNVRCwgSSBoYXZlbid0IHRyaWVkIGJ1dCBJJ2QgZXhwZWN0IHNvLsKgIEFsbCB0
aGUgaW5zdHJ1Y3Rpb25zCndlcmUgYWxyZWFkeSBzcGVjaWZpZWQgdG8gI1VEIGFueXdheSB3aGVu
IFhDUjAuTFdQIHdhcyBjbGVhci4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
