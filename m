Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956E12DC3A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:53:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVx6l-0003pk-Ce; Wed, 29 May 2019 11:51:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PiYs=T5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hVx6k-0003pf-BI
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:51:02 +0000
X-Inumbo-ID: 076a2fa5-8208-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 076a2fa5-8208-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 11:51:01 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: szBw84rIc3Xo3FgOfL13BerhOMobwhcDQullT9a+QUgXsGzraOe5FdyVjGg/q8/5eV9ewbQDLt
 HEtf6oCSDiL00jy1kw+aEcB+AM1GWgG8Va2ytwiCioGdaSpROojya6Za/XRcbw2gZF9XrbQCYj
 7V/EDywKtl0lOH0QW4grN2KtNMn0EqXLfwOlfHXTucb+psf9IUrHGVkStJNJzK/6lf1LgVkvrB
 7O6IzSxNHK8kXNv//bDlEdAco9HzhRinlaMIMsRNbWwXDj/66xK7VJIRExzUh2uxPy4oCvC+jH
 8rE=
X-SBRS: 2.7
X-MesageID: 1037055
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,527,1549947600"; 
   d="scan'208";a="1037055"
To: Jan Beulich <JBeulich@suse.com>
References: <1558606816-17842-3-git-send-email-andrew.cooper3@citrix.com>
 <1559103029-27912-1-git-send-email-andrew.cooper3@citrix.com>
 <EF573A6C020000F58E2C01CD@prv1-mh.provo.novell.com>
 <5CEE469802000078002334FE@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <c339648b-b6a8-147d-47be-c8ac35351f3d@citrix.com>
Date: Wed, 29 May 2019 04:50:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CEE469802000078002334FE@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 2/2] docs: Introduce some hypercall page
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDUvMjAxOSAwOTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDUuMTkg
YXQgMDY6MTAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhpcyBhbHNv
IGludHJvZHVjZWQgdGhlIHRvcC1sZXZlbCBHdWVzdCBEb2N1bWVudGF0aW9uIHNlY3Rpb24uCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcy4K
Cj4gd2l0aCBvbmUgZnVydGhlciByZW1hcmsgLyBxdWVzdGlvbjoKPgo+PiArSHlwZXJjYWxsIFBh
Z2UKPj4gKz09PT09PT09PT09PT09Cj4+ICsKPj4gK1RoZSBoeXBlcmNhbGwgcGFnZSBpcyBhIHBh
Z2Ugb2YgZ3Vlc3QgUkFNIGludG8gd2hpY2ggWGVuIHdpbGwgd3JpdGUgc3VpdGFibGUKPj4gK3Ry
YW5zZmVyIHN0dWJzLgo+PiArCj4+ICtDcmVhdGluZyBhIGh5cGVyY2FsbCBwYWdlIGlzIGFuIGlz
b2xhdGVkIG9wZXJhdGlvbiBmcm9tIFhlbidzIHBvaW50IG9mIHZpZXcuCj4+ICtJdCBpcyB0aGUg
Z3Vlc3RzIHJlc3BvbnNpYmlsaXR5IHRvIGVuc3VyZSB0aGF0IHRoZSBoeXBlcmNhbGwgcGFnZSwg
b25jZQo+PiArd3JpdHRlbiBieSBYZW4sIGlzIG1hcHBlZCB3aXRoIGV4ZWN1dGFibGUgcGVybWlz
c2lvbnMgc28gaXQgbWF5IGJlIHVzZWQuCj4+ICtNdWx0aXBsZSBoeXBlcmNhbGwgcGFnZXMgbWF5
IGJlIGNyZWF0ZWQgYnkgdGhlIGd1ZXN0LCBpZiBpdCB3aXNoZXMuCj4+ICsKPj4gK1RoZSBzdHVi
cyBhcmUgYXJyYW5nZWQgYnkgaHlwZXJjYWxsIGluZGV4LCBhbmQgc3RhcnQgb24gMzItYnl0ZSBi
b3VuZGFyaWVzLgo+PiArVG8gaW52b2tlIGEgc3BlY2lmaWMgaHlwZXJjYWxsLCBgYGNhbGxgYCB0
aGUgcmVsZXZhbnQgc3R1YiBbM11fOgo+PiArCj4+ICsuLiBjb2RlLWJsb2NrOjogbm9uZQo+PiAr
Cj4+ICsgIGNhbGwgaHlwZXJjYWxsX3BhZ2UgKyBpbmRleCAqIDMyCj4+ICsKPj4gK1RoZXJlIHJl
c3VsdCBpcyBhbiBBQkkgd2hpY2ggaXMgaW52YXJpYW50IG9mIHRoZSBleGFjdCBvcGVyYXRpbmcg
bW9kZSBvcgo+PiAraGFyZHdhcmUgdmVuZG9yLiAgVGhpcyBpcyBpbnRlbmRlZCB0byBzaW1wbGlm
eSBndWVzdCBrZXJuZWwgaW50ZXJmYWNlcyBieQo+PiArYWJzdHJhY3RpbmcgYXdheSB0aGUgZGV0
YWlscyBvZiBob3cgaXQgaXMgY3VycmVudGx5IHJ1bm5pbmcuCj4gSXMgaXQgd29ydGggbWVudGlv
bmluZyBoZXJlIHRoYXQgY2VydGFpbiBhc3BlY3RzIG9mIHRoZSBoeXBlcnZpc29yIGludGVyZmFj
ZQo+IChzaGFyZWQgZGF0YSBzdHJ1Y3R1cmVzKSBhcmUgaW5mbHVlbmNlZCBieSB0aGUgbW9kZSB0
aGUgZ3Vlc3QgaXMgaW4gYXQgdGhlCj4gdGltZSB0aGUgbW9zdCByZWNlbnQgaHlwZXJjYWxsIHBh
Z2UgcmVnaXN0cmF0aW9uIChvZGRseSBlbm91Z2ggYWx0ZXJuYXRpdmVseQo+IHRoZSBtb3N0IHJl
Y2VudCBzZXR0aW5nIG9mIEhWTV9QQVJBTV9DQUxMQkFDS19JUlEpIGhhcyBvY2N1cnJlZD8KClRo
YXQgYXNwZWN0IGhhZCBjcm9zc2VkIG15IG1pbmQsIGJ1dCBJIGRlY2lkZWQgdG8gbGVhdmUgaXQg
Zm9yIG5vdy4KCkRldGFpbHMgb24gdGhlIGZvcm1hdCBvZiB0aGUgc2hhcmVkX2luZm8gcGFnZSBz
aG91bGQgbGl2ZSBwcmltYXJpbHkgaW4KdGhlIHNoYXJlZF9pbmZvIGRvY3VtZW50YXRpb24sIGJ1
dCBJIGRvIGludGVuZCB0byBjcm9zcyByZWZlcmVuY2UKYXBwcm9wcmlhdGUgZG9jdW1lbnRhdGlv
biB3aGVuIGJvdGggc2lkZXMgYXJlIGluIHBsYWNlLsKgIEknZCBwcmVmZXIgdGhhdAphbnkgYWRk
aXRpb24gdG8gdGhpcyBkb2N1bWVudCBoYXBwZW5zIHdoZW4gdGhlIG1haW4gc2hhcmVkX2luZm8K
ZG9jdW1lbnRhdGlvbiBpcyBkb25lLCByYXRoZXIgdGhhbiBoYXZpbmcgYW4gdW5xdWFsaWZpZWQg
ZnJhY3Rpb24gb2YgdGhlCmVuZCByZXN1bHQuCgpOb3RlIGhvd2V2ZXIgdGhhdCBJIGFtIHRha2lu
ZyB0aGlzIG9wcG9ydHVuaXR5IHRvIGV2YWx1YXRlIHRoZSBjdXJyZW50CmJlaGF2aW91ciBvZiB0
aGUgYXJlYXMgYmVpbmcgZG9jdW1lbnRlZCAoaGVuY2UgdGhlIGNsZWFudXAgcGF0Y2hlcyksIGFu
ZApJIG1ha2Ugbm8gZ3VhcmFudGVlcyB0aGF0IHRoZSBkZXRhaWxzIG9mIHNoYXJlZF9pbmZvIGxh
dGNoaW5nIHdpbGwgYmUKaWRlbnRpY2FsIHRvIGhvdyB0aGV5IGN1cnJlbnRseSBhcmUsIHdoZW4g
dGhlIGRvY3VtZW50YXRpb24gaXMKZXZlbnR1YWxseSBjb21wbGV0ZS4KCn5BbmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
