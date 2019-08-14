Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EC8CDA8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 10:08:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxoId-0002vJ-1d; Wed, 14 Aug 2019 08:06:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yzLY=WK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hxoIb-0002vC-MH
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 08:06:25 +0000
X-Inumbo-ID: 6727adaa-be6a-11e9-b7e3-37361c727069
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6727adaa-be6a-11e9-b7e3-37361c727069;
 Wed, 14 Aug 2019 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565769982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Jdx6yfE00wFG6fBhSxK3YVjm2NS4oHtymYH1A/b3cMY=;
 b=DSzlBkyuRI5VwLkf8wlSIxg9ABWj/PAAPcpE4Rpd0daMPm8LwCSgJwj7
 +SzjcFIYUrUYYguL6Qevm5dn1cdH0+21WUDS19vtlQGOeFYPFStOFUD1W
 v6uFgdjj884YMJpntTBua5Sg7Og13e2e+JAUAyOWsuUeDenQ6zKiuML1W Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5O7ZXJs7J9nUr8Szz0WJ91Z3XB2fmqwjX20gM5jiGxgAFA2iyRltFQYbI+q74ymVl10AaaNbJv
 bFoFV/n6G/a7IkaIH9adgfK3vGEecQSD5UG/iEg7o7gBXzvM6SUJs3AEs6qyvKpIZ1prNlNixJ
 uZ9Ht6xW+rjMJqMvo+gVqNFgMlUgrwOyEQbV1GOmW7R34yAMbZMlFBwVSnUia2y3s5MCuXgrzf
 QPIIuiI4PiNDeZ/FRuGqz8CKm7h/nmoqMacwq7tAULPMHt/hmg439jFIb8eOm3ano4dyGr9z78
 AP0=
X-SBRS: 2.7
X-MesageID: 4257361
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,384,1559534400"; 
   d="scan'208";a="4257361"
Date: Wed, 14 Aug 2019 10:06:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190814080614.m32cupba4f5jdlhs@Air-de-Roger>
References: <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
 <20190812085703.363a2xsypnacdpes@Air-de-Roger>
 <CAMmSBy_CfoRuJZjHT6bXk5zG5jeb8a6m7TK6+mAKtr+3TzS-Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy_CfoRuJZjHT6bXk5zG5jeb8a6m7TK6+mAKtr+3TzS-Vw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMTI6MjQ6MzJQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBIaSBSb2dlciwKPiAKPiBzb3JyeSBmb3IgdGhlIGRlbGF5IC0tIEkgaG9wZSB5
b3Ugd2lsbCB1bmRlcnN0YW5kIHRoYXQgSSBhY3R1YWxseSBoYWQKPiBhIGdvb2QgcmVhc29uLiBT
ZWUgYmVsb3c6CgpObyBwcm9ibGVtLCBqdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgdGhpcyBkb2Vz
bid0IGZlbGwgdGhyb3VnaCB0aGUKY3JhY2tzLgoKPiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAx
OjU3IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+
Cj4gPiBQaW5nPwo+ID4KPiA+IEkga25vdyBJJ3ZlIHBvc3RlZCB0aGlzIHF1aXRlIHJlY2VudGx5
LCBidXQgaGF2ZSB5b3UgYmVlbiBhYmxlIHRvIHRlc3QKPiA+IHRoZSB0d28gcHJvcG9zZWQgcGF0
Y2hlcz8KPiA+Cj4gPiBpZTogdGhlIG9uZSBoZXJlIGFuZDoKPiA+Cj4gPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDA2NDMu
aHRtbAo+ID4KPiA+IEkgd291bGQgbGlrZSB0byBmaWd1cmUgb3V0IGV4YWN0bHkgd2hhdCdzIGdv
aW5nIG9uIGFuZCBmaXggdGhpcwo+ID4gcHJvcGVybHkuCj4gCj4gVHVybnMgb3V0IHRoaXMgbWF5
IGFjdHVhbGx5IGJlIHJlbGF0ZWQgdG8gdGhlIEJJT1MgdmVyc2lvbiBvbiB0aGVzZQo+IGJveGVz
LiBJIGhhdmUKPiBvbmUgd2l0aCB0aGUgQklPUyBidWlsZCBmcm9tIDA2LzA3LzIwMTggYW5kIHRo
ZSBvdGhlciBvbmUgaXMgZnJvbSAyMDE3LiBTbyB3aXRoCj4gMiBvZiB5b3VyIHByb3Bvc2VkIHBh
dGNoZXMgLS0gd2Ugbm93IGhhdmUgYSAyeDIgdGVzdCBtYXRyaXguIFRoZSBhd2Z1bAo+IHBhcnQg
c2VlbXMKPiB0byBiZSB0aGF0IHRoZSBiZWhhdmlvciBsb29rcyB0byBiZSBzbGlnaHRseSBkaWZm
ZXJlbnQuCj4gCj4gSSBuZWVkIGFuIGV4dHJhIGRheSB0byBzdW1tYXJpemUgaXQgYWxsIGFuZCBJ
J2xsIGZvbGxvdyB1cCBxdWlja2x5LiBJdAo+IGp1c3Qgc28gZmFyIEkgbG9zdAo+IHRpbWUgdHJ5
aW5nIHRvIGZpZ3VyZSBvdXQgd2hpbGUgdGhlIHNhbWUgYnVpbGQgd291bGQgYmVoYXZlCj4gZGlm
ZmVyZW50bHkgb24gZGlmZmVyZW50Cj4gYm94ZXMgb25seSB0byBmaW5kIG91dCB0aGF0IHRoZSBC
SU9TIGlzIGRpZmZlcmVudCAoYW5kIHRoZSByZWFsbHkKPiBhd2Z1bCBwYXJ0IGlzIHRoYXQKPiB0
aGV5IGJvdGggcmVwb3J0IGFzIHZlcnNpb24gNS4wLjEuMSAtLSBpdCBpcyBvbmx5IHdoZW4geW91
IGxvb2sgYXQgdGhlIHRpbWVzdGFtcAo+IG9mIHRoZSBidWlsZCAtLSB0aGF0J3Mgd2hlcmUgeW91
IHNlZSB0aGVtIGJlaW5nIGRpZmZlcmVudCA6LSggKS4KCk9oLCB0aGF0J3MgYXdmdWwuIEkgaG9w
ZSB5b3UgY2FuIGdldCBzb21ldGhpbmcgY2xlYXIgb3V0IG9mIHRoaXMuCgpSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
