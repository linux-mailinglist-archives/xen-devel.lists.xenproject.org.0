Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B4B7D2F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 16:49:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAxgk-0001Kf-90; Thu, 19 Sep 2019 14:45:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Iqgf=XO=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1iAxgj-0001KR-2T
 for xen-devel@lists.xen.org; Thu, 19 Sep 2019 14:45:41 +0000
X-Inumbo-ID: 2287cdc7-daec-11e9-9661-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2287cdc7-daec-11e9-9661-12813bfff9fa;
 Thu, 19 Sep 2019 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568904335;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1lP+dmewBIfoMTsKOoPxpV3MXnkXn+zCicAXPFrRA9A=;
 b=gCafer4rwmU+yaYTPgqjuRC4Uy0/eWf1X5adEkEcDgB/paG6G8lrE3Ke
 h31PcuVV+O0/r813VhGU09KqQZYpaq4GgGds3vkjyCikq7ryjC3XIgBFC
 cM9vocUjxChE0nSsJlWc60tYJdP1qvwIRXt8rR3xcr7SODLQIlu2rbQtw U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U+o9I59nvLM698faULxqrHXZ8kpt2vDY0Jy/hnkPG/nQycMubDG0PPTW/QtyBufqFqGbPvit02
 WZ3woADwaVntTXTxPKzNQAIEaow8XmUm588KLRXUC373fcO+FD2j4gr7Qbg+HqhrADVK7PpSGG
 XCPCc4nkZzKQFqkBbye9q+GrgZDvfVuffDzHamC1p/PNS7B8nzhiiWrHixgyfMOVeKbnNu+KL+
 crydloqmFk0G37KICFWdPioed1QjfP2yDbM6wlclxOHup4RLiP9062DN1nZ4lQjzYK6AO6d3FM
 JUs=
X-SBRS: 2.7
X-MesageID: 5998096
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="5998096"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>,
 <xen-devel@lists.xenproject.org>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-7-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <3be8fc2a-fca4-0711-48b0-5ce450424c26@citrix.com>
Date: Thu, 19 Sep 2019 15:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190916105945.93632-7-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 06/12] livepatch: Do not enforce
 ELF_LIVEPATCH_FUNC section presence
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
Cc: wipawel@amazon.com, mpohlack@amazon.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xNi8xOSAxMTo1OSBBTSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gV2l0aCBk
ZWZhdWx0IGltcGxlbWVudGF0aW9uIHRoZSBFTEZfTElWRVBBVENIX0ZVTkMgc2VjdGlvbiBjb250
YWluaW5nCj4gYWxsIGZ1bmN0aW9ucyB0byBiZSByZXBsYWNlZCBvciBhZGRlZCBtdXN0IGJlIHBh
cnQgb2YgdGhlIGhvdHBhdGNoCj4gcGF5bG9hZCwgb3RoZXJ3aXNlIHRoZSBwYXlsb2FkIGlzIHJl
amVjdGVkICh3aXRoIC1FSU5WQUwpLgo+IAo+IEhvd2V2ZXIsIHdpdGggdGhlIGV4dGVuZGVkIGhv
b2tzIGltcGxlbWVudGF0aW9uLCBhIGhvdHBhdGNoIG1heSBiZQo+IGNvbnN0cnVjdGVkIG9mIG9u
bHkgaG9va3MgdG8gcGVyZm9ybSBjZXJ0YWluIGFjdGlvbnMgd2l0aG91dCBhbnkgY29kZQo+IHRv
IGJlIGFkZGVkIG9yIHJlcGxhY2VkLgo+IFRoZXJlZm9yZSwgZG8gbm90IGFsd2F5cyBleHBlY3Qg
dGhlIGZ1bmN0aW9ucyBzZWN0aW9uIGFuZCBhbGxvdyBpdCB0bwo+IGJlIG1pc3NpbmcsIHByb3Zp
ZGVkIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSBzZWN0aW9uIGNvbnRhaW5pbmcgaG9va3MKPiBwcmVz
ZW50LiBUaGUgZnVuY3Rpb25zIHNlY3Rpb24sIHdoZW4gcHJlc2VudCBpbiBhIHBheWxvYWQsIG11
c3QgYmUgYQo+IHNpbmdsZSwgbm9uLWVtcHR5IHNlY3Rpb24uCj4gCj4gQ2hlY2sgYWxzbyBhbGwg
ZXh0ZW5kZWQgaG9va3Mgc2VjdGlvbnMgaWYgdGhleSBhcmUgYSBzaW5nbGUsIG5vbi1lbXB0eQo+
IHNlY3Rpb25zIGVhY2guCj4gCj4gQXQgbGVhc3Qgb25lIG9mIHRoZSBmdW5jdGlvbnMgb3IgaG9v
a3Mgc2VjdGlvbiBtdXN0IGJlIHByZXNlbnQgaW4gYQo+IHZhbGlkIHBheWxvYWQuCnNuaXAKPiAK
PiArICAgIC8qCj4gKyAgICAgKiBUaGUgcGF0Y2hpbmcgc2VjdGlvbnMgYXJlIG9wdGlvbmFsLCBi
dXQgYXQgbGVhc3Qgb25lCj4gKyAgICAgKiBtdXN0IGJlIHByZXNlbnQuIE90aGVyd2lzZSwgdGhl
cmUgaXMgbm90aGluZyB0byBkby4KPiArICAgICAqIEFsbCB0aGUgZXhpc3Rpbmcgc2VjdGlvbnMg
bXVzdCBub3QgYmUgZW1wdHkgYW5kIG11c3QKPiArICAgICAqIGJlIHByZXNlbnQgYXQgbW9zdCBv
bmNlLgo+ICsgICAgICovCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUobmFtZXMp
OyBpKysgKQo+ICsgICAgewo+ICsgICAgICAgIGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZWxmX3Nl
YyAqc2VjOwo+ICsKPiArICAgICAgICBzZWMgPSBsaXZlcGF0Y2hfZWxmX3NlY19ieV9uYW1lKGVs
ZiwgbmFtZXNbaV0pOwo+ICsgICAgICAgIGlmICggIXNlYyApCj4gKyAgICAgICAgewo+ICsgICAg
ICAgICAgICBkcHJpbnRrKFhFTkxPR19ERUJVRywgTElWRVBBVENIICIlczogJXMgaXMgbWlzc2lu
Z1xuIiwKPiArICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIG5hbWVzW2ldKTsKPiArICAg
ICAgICAgICAgY29udGludWU7IC8qIFRoaXMgc2VjdGlvbiBpcyBvcHRpb25hbCAqLwo+ICsgICAg
ICAgIH0KPiArCj4gKyAgICAgICAgaWYgKCAhc2VjLT5zZWMtPnNoX3NpemUgKQo+ICsgICAgICAg
IHsKPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogJXMgaXMg
ZW1wdHlcbiIsCj4gKyAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIG5hbWVzW2ldKTsKPiAr
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICAgICAgfQo+ICsKPiArICAgICAgICBp
ZiAoIHRlc3RfYW5kX3NldF9iaXQoaSwgZm91bmQpICkKPiArICAgICAgICB7Cj4gKyAgICAgICAg
ICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6ICVzIHdhcyBzZWVuIG1vcmUgdGhh
biBvbmNlXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgbmFtZXNbaV0pOwoK
VGhpcyBpbmRlbnRhdGlvbiBpcyB3cm9uZy4KCj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ICsgICAgICAgIH0KPiArICAgIH0KPiArCj4gKyAgICAvKiBDaGVja2luZyBpZiBhdCBsZWFz
dCBvbmUgc2VjdGlvbiBpcyBwcmVzZW50LiAqLwo+ICsgICAgaWYgKCBiaXRtYXBfZW1wdHkoZm91
bmQsIEFSUkFZX1NJWkUobmFtZXMpKSApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgTElWRVBBVENIICIlczogTm90aGluZyB0byBwYXRjaC4gQWJvcnRpbmcuLi5cbiIsCj4g
KyAgICAgICAgICAgICAgIGVsZi0+bmFtZSk7Cj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICB9Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArCgpMR1RNLAoKUmV2aWV3ZWQtYnk6
IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
