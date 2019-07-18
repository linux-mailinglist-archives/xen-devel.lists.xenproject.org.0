Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA1E6CD63
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 13:30:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho4Xw-0007D2-Se; Thu, 18 Jul 2019 11:26:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hbxb=VP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ho4Xv-0007Cx-QX
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 11:25:59 +0000
X-Inumbo-ID: ce873aaa-a94e-11e9-bc16-1fac860299d7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce873aaa-a94e-11e9-bc16-1fac860299d7;
 Thu, 18 Jul 2019 11:25:55 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MDv6UqsOaFk2w3o0viUu9d/fUqScXum3eu2zpEZc19dEKOKwZMCzZEeD5UtQpHStQc8QCTGHPf
 BA2FIs+HJVn4XGayHu5PNJhpBrJPJIuSJZ6YgzjBdwP+bYQ6CT2WMDDFbiMMMSWj6SmvODKF+V
 vsCniUTckZC+BFvw17w2+3LHGxUempsr1Db7hn+Qt/DyAMXMXdu32SEDG6aRML20uBPZXwBGnl
 0sgLjx78Ep2+cfucYxe6pIFd8U/iyqxA9PslYjUB0r+eGTuYrriCgxYvFmy8FbehIxoUJBt8Av
 I9o=
X-SBRS: 2.7
X-MesageID: 3118322
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,278,1559534400"; 
   d="scan'208";a="3118322"
To: Jan Beulich <JBeulich@suse.com>
References: <f07114de1c9f440182359a1d7d064fdd@AMSPEX02CL03.citrite.net>
 <3131a159-5f19-64b0-2537-8b944b16ad16@citrix.com>
 <ca9a87de-9eea-5037-ae34-a6c30c48163e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <8c6b5395-e3b6-a7fd-e97f-3cc082119b31@citrix.com>
Date: Thu, 18 Jul 2019 12:25:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ca9a87de-9eea-5037-ae34-a6c30c48163e@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] IOMMU page-tables
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel\(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxMjoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMDcuMjAxOSAx
MjoxMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTgvMDcvMjAxOSAxMDo0OSwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gICAgQmVmb3JlIEkgZ2V0IHRvbyBmYXIgaW50
byB0aGlzIEkgd2FudCB0byBnZXQgc29tZSBvcGluaW9ucyBmcm9tIHRoZSB3aWRlciBjb21tdW5p
dHkuLi4KPj4+Cj4+PiAgICBBdCB0aGUgbW9tZW50IHdoZW4gdGhlIGZpcnN0IFBDSSBkZXZpY2Ug
aXMgYXNzaWduZWQgdG8gYSBkb21haW4gKGkuZS4gcGFzc2VkIHRocm91Z2gpIHRoaXMgd2lsbCB0
cmlnZ2VyIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcyBmb3IgdGhhdCBkb21haW4u
IFNpbWlsYXJseSB3aGVuIHRoZSBsYXN0IFBDSSBkZXZpY2UgaXMgZGUtYXNzaWduZWQgdGhlIHRh
YmxlcyBhcmUgdG9ybiBkb3duIGFnYWluLiBCb3RoIG9mIHRoZXNlIG9wZXJhdGlvbnMgY2FuIGJl
IHF1aXRlIGV4cGVuc2l2ZSBpZiB0aGUgZG9tYWluIGlzIGEgbGFyZ2UgYW1vdW50IGZvciBSQU0s
IGFuZCBpZiB0aGUgSU9NTVUgZG9lcyBub3Qgc3VwcG9ydCBzaGFyaW5nIHRoZSBzZWNvbmQgbGV2
ZWwgQ1BVIHBhZ2UgdGFibGVzIChvciB0aGUgZG9tYWluIGlzIFBWKS4gTW9yZW92ZXIsIHRoZSBn
dWVzdCBjb3VsZCBzaW11bHRhbmVvdXNseSBiZSBiYWxsb29uaW5nIG9yIGRvaW5nIG90aGVyIG9w
ZXJhdGlvbnMgdGhhdCBhZmZlY3QgaXRzIHBhZ2UgdHlwZXMgYW5kIHNvIHRoZSBwcm9jZXNzIG9m
IGJ1aWxkaW5nIHRoZSB0YWJsZXMgaGFzIHRvIHRha2UgaW50byBhY2NvdW50IHN1Y2ggcmFjZXMu
Cj4+PiAgICBJZiB3ZSB3ZXJlIGluc3RlYWQgdG8gc2F5IHRoYXQgZ2l2aW5nIGEgZG9tYWluIElP
TU1VIHBhZ2UgdGFibGVzIGlzIGFuIG9wdGlvbiB0aGF0IG5lZWRzIHRvIGJlIHNlbGVjdGVkIGF0
IGRvbWFpbiBjcmVhdGUgdGltZSB0aGVuIGl0IG1ha2VzIHRoZSBjb2RlIHNpZ25pZmljYW50bHkg
c2ltcGxlciBhbmQgdGhlcmUgaXMgbm8gbmVlZCB0byBkZWFsIHdpdGggcGFnZSB0eXBlIGNoYW5n
ZS9iYWxsb29uaW5nIHJhY2VzIGFueSBtb3JlLiBJIGhhY2tlZCB0b2dldGhlciBhIHRlc3QgcGF0
Y2ggYW5kIGl0IGdldHMgcmlkIG9mIHJvdWdobHkgMjAwIGxpbmVzIG9mIGNvZGUgKGFuZCB0aGVy
ZSBtYXkgYmUgbW9yZSB0aGF0IEkgbWlzc2VkKS4KPj4+ICAgIERvZXMgYW55b25lIHRoaW5rIHRo
YXQgZGVjaWRpbmcgd2hldGhlciBhIGRvbWFpbiBzaG91bGQgZ2V0IElPTU1VIHBhZ2UgdGFibGVz
IGlzIG5vdCBhIHJlYXNvbmFibGUgdGhpbmcgdG8gaGF2ZSB0byBkbyBhdCBjcmVhdGUgdGltZT8K
Pj4gVG8gYmUgYWJzb2x1dGVseSBjbGVhciBoZXJlLCBJIGRvbid0IHNlZSBhbnkgZXZpZGVuY2Ug
Zm9yIHRoZSBjdXJyZW50Cj4+IGJlaGF2aW91ciB0byBiZSBhIGNvbW1vbmx5IHVzZWQgZmVhdHVy
ZSBpbiBwcmFjdGljZS4KPj4KPj4gSWYgYW55b25lIGhhcyBhIGNvdW50ZXJleGFtcGxlLCBwbGVh
c2Ugc3BlYWsgdXAgdXJnZW50bHkuCj4gSSBkb24ndCBoYXZlIGEgY291bnRlcmV4YW1wbGUsIG5v
ciBhbSBJIG91dHJpZ2h0IG9wcG9zZWQgdG8gdGhlCj4gc3VnZ2VzdGVkIGNoYW5nZS4gTmV2ZXJ0
aGVsZXNzIEknZCBsaWtlIHRvIHBvaW50IG91dCB0aGF0ICJqdXN0Cj4gaW4gY2FzZSIgc2V0dGlu
ZyB0byBJT01NVS1lbmFibGVkIG9mIGEgZG9tYWluIGlzIGEgd2FzdGUgb2YKPiBtZW1vcnkgaWYg
bm8gZGV2aWNlIGV2ZXIgZ2V0cyBhc3NpZ25lZCB0byBpdC4KCkluIHNoYXJlZCBwYWdldGFibGUg
Y2FzZSwgdGhlcmUgaXMgb25seSBzb21lIHRyaXZpYWwgYWNjb3VudGluZyBpbiBYZW4KQUZBQ0lU
LgoKRm9yIHRoZSBub24tc2hhcmVkIGNhc2UsIHRoZW4geWVzIC0gYW4gZXh0cmEgMSUgb2YgdGhl
IHNpemUgb2YgdGhlCmd1ZXN0LCBpbiB0aGUgd29yc3QgY2FzZS4KCj4gQW5kIGlmIHRoZXJlIGFy
ZQo+IHBlb3BsZSByZWx5aW5nIG9uIGJlaW5nIGFibGUgdG8gYXR0YWNoIGEgZGV2aWNlIG9uIGRl
bWFuZCwgdGhlbgo+IHRoZXkgbWF5IGJlIGNhdWdodCBieSBzdXJwcmlzZSB3aGVuIHRoZXkgdXBn
cmFkZSAoYW5kIHdlIGFsbAo+IGtub3cgaG93IG11Y2ggZG9jdW1lbnRhdGlvbiBwZW9wbGUgcmVh
ZCB3aGVuIHRoZXkgdGhpbmsgdGhleQo+IGtub3cgd2hhdCB0aGV5J3JlIGRvaW5nLCB3aGljaCBp
cyB0byBzYXk6IEFkZGluZyBhIHJlc3BlY3RpdmUKPiBub3RlIHRvIHRoZSByZWxlYXNlIG5vdGVz
IGlzIG5vdCB2ZXJ5IGxpa2VseSB0byBoZWxwLikuCgpPdXIgcmVsZWFzZSBub3RlcyBhcmUgc29t
ZXdoZXJlIGJldHdlZW4gcG9vciBhbmQgbm9uLWV4aXN0ZW50LsKgIFdlIGNhbgpkZWZpbml0ZWx5
IG1hbmFnZSBiZXR0ZXIsIGFuZCB0aGVyZSBpcyBubyBiZXR0ZXIgdGltZSB0aGFuIG5vdyB0byBt
YWtlIGEKc3RhcnQuCgpJbiBwYXJ0aWN1bGFyLCB3ZSBjYW4gdHJ5IGFuZCBoaWdobGlnaHQgaXQg
ZHVyaW5nIHRoZSBSQydzIGFuZCB0ZXN0CmRheXMsIHdoaWNoIHdpbGwgcHJvYmFibHkgYmUgdGhl
IGJlc3Qgd2F5IGZvciBkb3duc3RyZWFtcyB0byBub3RpY2UuwqAKKENDJ2luZyBMYXJzIGFuZCBK
dWVyZ2VuIGZvciB2aXNpYmlsaXR5IGluIHRoZWlyIHJlbGVhc2UgY2FwYWNpdGllcyBoZXJlLikK
Cn5BbmRyZXcKCj4KPj4gRnVydGhlcm1vcmUsIHRoZSBjb21wbGV4aXR5IGFuZCAoYmVzdC13ZS1j
YW4tbWFuYWdlLXNlY3VyaXR5LXdpc2UpCj4+IGxpdmVsb2NrcyBpbiB0aGUgaHlwZXJ2aXNvci90
b29sc3RhY2sgaXMganVzdGlmaWNhdGlvbiBhbG9uZSB0bwo+PiBzZXJpb3VzbHkgY29uc2lkZXIg
ZHJvcHBpbmcgaXQgbW92aW5nIGZvcndhcmRzLsKgIFRoZSBjb21wbGV4aXR5IGluCj4+IHBhcnRp
Y3VsYXIgaXMgYW4gaW1wZWRpbWVudCB0byBzZXZlcmFsIGFzcGVjdHMgb2YgSU9NTVUgZGV2ZWxv
cG1lbnQgd29yawo+PiB3aGljaCBhcmUgaW4gcHJvZ3Jlc3MuCj4+Cj4+IEluIHBhcnRpY3VsYXIs
IEkgZG8gbm90IHNlZSBpdCBhcyBhbiB1bnJlYXNvbmFibGUgYnVyZGVuIGZvcgo+PiBhZG1pbnMv
Z3Vlc3RzIHRvIHNwZWNpZnkgd2hldGhlciB0aGV5IHdhbnQgYW4gSU9NTVUgYXQgZG9tYWluIGNy
ZWF0aW9uCj4+IHRpbWUuwqAgSSBleHBlY3QgdGhhdCB0aGUgb3ZlcndoZWxtaW5nIG1ham9yaXR5
IG9mIGNhc2VzIGFscmVhZHkga25vdyBhdAo+PiBjcmVhdGlvbiB0aW1lIHdoaWNoIFBDSSBkZXZp
Y2VzIHdhbnQgYXNzaWduaW5nLgo+Pgo+PiBBcyBmYXIgYXMgSSdtIGNvbmNlcm5lZCwgdGhpcyBm
ZWF0dXJlL2Nvcm5lciBjYXNlIHdhbnRzIHJpcHBpbmcgb3V0Lgo+PiBXaGF0ZXZlciB0aGUgb3Jp
Z2luYWwgaW50ZW50aW9uLCBoaW5kc2lnaHQgaGFzIGRlbW9uc3RyYXRlZCB0aGF0IGl0Cj4+IHJl
YWxseSBpc24ndCBjbGV2ZXIgaWRlYS4KPiBGQU9EIC0gSSBhZ3JlZSB3aXRoIGFsbCB0aGUgdGVj
aG5pY2FsIGFzcGVjdHMgaGVyZS4KPgo+IEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
