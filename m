Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7F6B1E1
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 00:30:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnVvP-0003Zj-98; Tue, 16 Jul 2019 22:27:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WCCO=VN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnVvO-0003Ze-3E
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 22:27:54 +0000
X-Inumbo-ID: f31b7f6b-a818-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f31b7f6b-a818-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 22:27:52 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BWnHlzmOwcVoPHwO6Vwbjjmekskx0ptMMmfhBNKSjlT4QFwC7SLrjsZECTXumXaT1kMw3k1oan
 hNiR98eQS6VvYKR7uSZzRMGbtBXyEufXd9AhOHNVkQ06WbZtv9KYj4/zNwR8idcy5XQTZ2Qy4G
 T8yXCkdm8uExN3f7oLhrFAuS/LXs03P8Zp7zAi2bGAeIi8eLmKHlRU1K0fV0RmQSXWgtiMEsQn
 1MmS47ny4mnxCf7R3FLmnuNoFk6nc9AeMx+1WoaH+YYXDYXnLv0Z8zQZvhsJkjrmbngOMPl8oL
 x4s=
X-SBRS: 2.7
X-MesageID: 3082408
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,271,1559534400"; 
   d="scan'208";a="3082408"
To: Sarah Newman <srn@prgmr.com>, Juergen Gross <jgross@suse.com>, "Foerster, 
 Leonard" <foersleo@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
 <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
 <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9d6fc9d6-f63a-ae65-bbfa-5e489fda9acf@citrix.com>
Date: Tue, 16 Jul 2019 23:27:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDcvMjAxOSAwNToyMCwgU2FyYWggTmV3bWFuIHdyb3RlOgo+IE9uIDcvMTUvMTkgODo0
OCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTUuMDcuMTkgMjE6MzEsIFNhcmFoIE5l
d21hbiB3cm90ZToKPj4+IE9uIDcvMTUvMTkgMTE6NTcgQU0sIEZvZXJzdGVyLCBMZW9uYXJkIHdy
b3RlOgo+Pj4gLi4uCj4+Pj4gQSBrZXkgY29ybmVyc3RvbmUgZm9yIExpdmUtdXBkYXRlIGlzIGd1
ZXN0IHRyYW5zcGFyZW50IGxpdmUgbWlncmF0aW9uCj4+PiAuLi4KPj4+PiDCoMKgwqDCoC0+IGZv
ciBsaXZlIG1pZ3JhdGlvbjogZG9taWQgaXMgYSBwcm9ibGVtIGluIHRoaXMgY2FzZQo+Pj4+IMKg
wqDCoMKgwqDCoMKgIC0+IHJhbmRvbWl6ZSBhbmQgcHJheSBkb2VzIG5vdCB3b3JrIG9uIHNtYWxs
ZXIgZmxlZXRzCj4+Pj4gwqDCoMKgwqDCoMKgwqAgLT4gdGhpcyBpcyBub3QgYSBwcm9ibGVtIGZv
ciBsaXZlLXVwZGF0ZQo+Pj4+IMKgwqDCoMKgwqDCoMKgIC0+IEJVVDogYXMgYSBjb21tdW5pdHkg
d2Ugc2hvdWRsIG1ha2UgdGhpcyByZXN0cmljdGlvbiBnbyBhd2F5Cj4+Pgo+Pj4gQW5kcmV3IENv
b3BlciBwb2ludGVkIG91dCB0byBtZSB0aGF0IG1hbnVhbGx5IGFzc2lnbmluZyBkb21haW4gSURz
Cj4+PiBpcyBzdXBwb3J0ZWQgaW4gbXVjaCBvZiB0aGUgY29kZSBhbHJlYWR5LiBJZiBndWVzdCB0
cmFuc3BhcmVudCBsaXZlCj4+PiBtaWdyYXRpb24gZ2V0cyBtZXJnZWQsIHdlJ2xsIGxvb2sgYXQg
cGFzc2luZyBpbiBhIGRvbWFpbiBJRCB0byB4bCwKPj4+IHdoaWNoIHdvdWxkIGJlIGdvb2QgZW5v
dWdoIGZvciB1cy4gSSBkb24ndCBrbm93IGFib3V0IHRoZSBvdGhlcgo+Pj4gdG9vbHN0YWNrcy4K
Pj4KPj4gVGhlIG1haW4gcHJvYmxlbSBpcyB0aGUgY2FzZSB3aGVyZSBvbiB0aGUgdGFyZ2V0IGhv
c3QgdGhlIGRvbWlkIG9mIHRoZQo+PiBtaWdyYXRlZCBkb21haW4gaXMgYWxyZWFkeSBpbiB1c2Ug
YnkgYW5vdGhlciBkb21haW4uIFNvIHlvdSBlaXRoZXIgbmVlZAo+PiBhIGRvbWlkIGFsbG9jYXRv
ciBzcGFubmluZyBhbGwgaG9zdHMgb3IgdGhlIGNoYW5nZSBvZiBkb21pZCBkdXJpbmcKPj4gbWln
cmF0aW9uIG11c3QgYmUgaGlkZGVuIGZyb20gdGhlIGd1ZXN0IGZvciBndWVzdCB0cmFuc3BhcmVu
dCBtaWdyYXRpb24uCj4KPiBZZXMuIFRoZXJlIGFyZSBzb21lIGNsdXN0ZXIgbWFuYWdlbWVudCBz
eXN0ZW1zIHdoaWNoIHVzZSB4bCByYXRoZXIKPiB0aGFuIHhhcGkuCj4gVGhleSBjb3VsZCBiZSBl
eHRlbmRlZCB0byBtYW5hZ2UgZG9tYWluIElEcyBpZiBpdCdzIHRvbyBkaWZmaWN1bHQgdG8KPiBh
bGxvdwo+IHRoZSBkb21haW4gSUQgdG8gY2hhbmdlIGR1cmluZyBtaWdyYXRpb24uCgpGb3IgYSB2
MSBmZWF0dXJlLCBoYXZpbmcgYSByZXN0cmljdGlvbiBvZiAieW91IG11c3QgbWFuYWdlIGRvbWlk
cyBhY3Jvc3MKdGhlIGNsdXN0ZXIiIGlzIGEgZmluZS7CoCBHdWVzdC10cmFuc3BhcmVudCBtaWdy
YXRpb24gaXMgYSB2ZXJ5IGltcG9ydGFudApmZWF0dXJlLCBhbmQgb25lIHdoZXJlIHdlIGFyZSBs
YWNraW5nIGluIHJlbGF0aW9uIHRvIG90aGVyIGh5cGVydmlzb3JzLgoKTG9uZ2VyIHRlcm0sIHdl
IGFzIHRoZSBYZW4gY29tbXVuaXR5IG5lZWQgdG8gZmlndXJlIG91dCBhIHdheSB0byByZW1vdmUK
dGhlIGRlcGVuZGVuY3kgb24gZG9taWRzLCBhdCB3aGljaCBwb2ludCB0aGUgY2x1c3Rlci13aWRl
IG1hbmFnZW1lbnQKcmVzdHJpY3Rpb24gY2FuIGJlIGRyb3BwZWQuwqAgVGhpcyBpc24ndCBnb2lu
ZyB0byBiZSBhIHRyaXZpYWwgdGFzaywgYnV0Cml0IHdpbGwgYmUgYSB3b3J0aHdoaWxlIG9uZS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
