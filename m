Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD486936
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 20:57:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvnZM-0000yG-Sl; Thu, 08 Aug 2019 18:55:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c+ws=WE=amazon.com=prvs=1167d0db8=elnikety@srs-us1.protection.inumbo.net>)
 id 1hvnZL-0000yB-AH
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 18:55:23 +0000
X-Inumbo-ID: 134d4c18-ba0e-11e9-afd9-937b6f869baa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 134d4c18-ba0e-11e9-afd9-937b6f869baa;
 Thu, 08 Aug 2019 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1565290522; x=1596826522;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xA+4SlnpmWdUgNP33Z4+ISMew2kC/bjMnE85VP95sfA=;
 b=NQAmenEl3gmh08qFQnyDz3qFDxuW2Upxbl4EXpiGrkOoUfpamEROI/3l
 32p91IwEhyPZxAEU0Bp7qw/qRY6hKRECqxao3KRmiS6vq1Lt74lQfxuA4
 9xbEB/5eA5T/c+3tFdBCKSooFTH/iJtsFtH/DLyutX+36bncG8ka7cTHF 4=;
X-IronPort-AV: E=Sophos;i="5.64,362,1559520000"; d="scan'208";a="778387131"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 08 Aug 2019 18:55:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id EF5EAA2C07; Thu,  8 Aug 2019 18:55:17 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 18:55:17 +0000
Received: from 8c859093ddbb.ant.amazon.com (10.43.160.25) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 18:55:11 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <20190807174223.67590-1-elnikety@amazon.com>
 <5752a9af-ec3b-1401-13d9-4b93bdd99d72@suse.com>
 <4FAA00A4-7025-4882-88C1-C8C5FEEAD18C@amazon.com>
 <bbfb372f-013f-461a-af50-5ac95c5c2d27@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <4fc14ea7-8b86-8c45-bc2c-df02b380553a@amazon.com>
Date: Thu, 8 Aug 2019 20:54:59 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bbfb372f-013f-461a-af50-5ac95c5c2d27@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.25]
X-ClientProxiedBy: EX13D17UWC004.ant.amazon.com (10.43.162.195) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] evtchn: make support for different ABIs
 tunable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDguMDguMTkgMTc6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjA4
LjIwMTkgMTY6MzEsICBFbG5pa2V0eSwgRXNsYW0gIHdyb3RlOgo+IAo+IEZpcnN0IG9mIGFsbCAt
IGNhbiB5b3UgcGxlYXNlIHRyeSB0byBnZXQgeW91ciByZXBseSBxdW90aW5nCj4gaW1wcm92ZWQs
IHN1Y2ggdGhhdCByZWFkZXJzIGNhbiBhY3R1YWxseSB0ZWxsIHlvdXIgcmVwbGllcwo+IGZyb20g
Y29udGV4dD8gKEkgZGlkbid0IGNoZWNrIHdoZXRoZXIgcGVyaGFwcyB5b3VyIG1haWwgd2FzCj4g
YSBIVE1MIG9uZSwgYW5kIG15IHBsYWluIHRleHQgcmVhZGluZyBvZiBpdCBkaXNjYXJkZWQgdGhl
Cj4gbWFya2luZ3MuIElmIHNvIC0gcGxlYXNlIGRvbid0IHNlbmQgSFRNTCBtYWlsLikKCk9vcHN5
LiBJdCB3YXMgSFRNTC4gSSB3aWxsIGJlIG1vcmUgZGlsaWdlbnQgZ29pbmcgZm9yd2FyZCA6KQoK
PiAKPj4gT24gOC4gQXVnIDIwMTksIGF0IDE1OjI3LCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb208bWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tPj4gd3JvdGU6Cj4+IE9uIDA3LjA4LjIwMTkg
MTk6NDIsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL2V2ZW50X2No
YW5uZWwuYwo+PiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYwo+PiBAQCAtMTE3MCw2
ICsxMTcwLDExIEBAIGxvbmcgZG9fZXZlbnRfY2hhbm5lbF9vcChpbnQgY21kLCBYRU5fR1VFU1Rf
SEFORExFX1BBUkFNKHZvaWQpIGFyZykKPj4KPj4gICAgICAgIGNhc2UgRVZUQ0hOT1BfaW5pdF9j
b250cm9sOiB7Cj4+ICAgICAgICAgICAgc3RydWN0IGV2dGNobl9pbml0X2NvbnRyb2wgaW5pdF9j
b250cm9sOwo+PiArCj4+ICsgICAgICAgIC8qIEZhaWwgaW5pdF9jb250cm9sIGZvciBkb21haW5z
IHRoYXQgbXVzdCB1c2UgMmwgQUJJICovCj4+ICsgICAgICAgIGlmICggY3VycmVudC0+ZG9tYWlu
LT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICkKPj4gKyAgICAgICAgICAg
IHJldHVybiAtRVBFUk07Cj4+ICsKPj4gICAgICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgm
aW5pdF9jb250cm9sLCBhcmcsIDEpICE9IDAgKQo+PiAgICAgICAgICAgICAgICByZXR1cm4gLUVG
QVVMVDsKPj4gICAgICAgICAgICByYyA9IGV2dGNobl9maWZvX2luaXRfY29udHJvbCgmaW5pdF9j
b250cm9sKTsKPj4KPj4gSSB0aGluayB0aGUgY2hlY2sgd291bGQgYmV0dGVyIGdvIGludG8gZXZ0
Y2huX2ZpZm9faW5pdF9jb250cm9sKCksCj4+IGF0IGxlYXN0IGFzIGxvbmcgYXMgdGhlIHNldHRp
bmcgcmVhbGx5IGlzIEZJRk8tY2VudHJpYy4gQWxzbyB0aGUKPj4KPj4gTm90IHN1cmUuIEl0IGlz
IHRoZSBGSUZPIEFCSSB0aGF0IGRlZmluZXMgRVZUQ0hOT1BfaW5pdF9jb250cm9sCj4+IChub3Qg
ZGVmaW5lZCBpbiAyTCkuIFNob3J0LWNpcmN1aXRpbmcgdGhlIGh5cGVyY2FsbCBhdCB0aGlzIHBs
YWNlCj4+IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUuCj4gCj4gSSdkIGV4cGVjdCBhbnkgM3JkIHZh
cmlhbnQgdG8gYWxzbyBoYXZlIGEgbmVlZCBmb3IgYW4gaW5pdC1jb250cm9sCj4gb3BlcmF0aW9u
LCBhbmQgaGVuY2UgYXQgdGhhdCBwb2ludCB0aGlzIHdvdWxkIGJlY29tZSBhIGhvb2sgbGlrZQo+
IG1hbnkgb2YgdGhlIG90aGVyIG9wcy4gQW5kIGF0IHRoYXQgcG9pbnQgdGhlIGNoZWNrIHdvdWxk
IG5lZWQgdG8KPiBtb3ZlIGFueXdheS4gSGVuY2UgaXQncyBiZXR0ZXIgdG8gcHV0IGl0IGluIGl0
cyBsb25nIHRlcm0KPiBkZXNpZ25hdGVkIHBsYWNlIHJpZ2h0IGF3YXkuCj4gCj4+IE1vcmVvdmVy
LCBkb2luZyBjb3B5X2Zyb21fZ3Vlc3QgYW5kIGNhbGxpbmcgaW50bwo+PiBldnRjaG5fZmlmb19p
bml0X2NvbnRyb2wgb25seSB0byByZXR1cm4gZXJyb3IgaXMgbm90IG9wdGltYWwuCj4gCj4gVHJ1
ZSwgeWV0IGZyb20gbXkgcG92IHRoZSBtb3JlIGxvZ2ljYWwgYWx0ZXJuYXRpdmUgY29kZSBzdHJ1
Y3R1cmUKPiBpcyBzdGlsbCBwcmVmZXJhYmxlLgoKRmFpciBwb2ludC4gT24gYSBzZWNvbmQgdGhv
dWdodCwgdGhlIGFkZGl0aW9uYWwgY3ljbGVzIGFyZSBub3QgYSBwcm9ibGVtIAooZ2l2ZW4gdGhh
dCBpbml0X2NvbnRyb2wgaXMgbm90IG9uIGEgY3JpdGljYWwgX19tdXN0IGJlIHBlcmZvcm1hbnRf
XyAKcGF0aCkuIEkgYW0gbm93IGFsc28gaW4gZmF2b3Igb2YgbW92aW5nIHRoZSBjaGVjayB0byAK
ZXZlbnRfZmlmb19pbml0X2NvbnRyb2wuCgo+IAo+PiBJcnJlc3BlY3RpdmUgb2YgdGhlc2UgcmVt
YXJrcywgYW5kIGFsb25nIHRoZSBsaW5lcyBvZiBjb21tZW50cyBvbgo+PiB0aGUgdjEgdGhyZWFk
LCBpbnRyb2R1Y2luZyB3aWRlciBjb250cm9sIHRoYXQgd291bGQgYWxzbyBhbGxvdwo+PiBkaXNh
YmxpbmcgMi1sZXZlbCAoZm9yIEhWTSBndWVzdHMpIHdvdWxkIHNlZW0gYmV0dGVyIHRvIG1lLiBU
aGlzCj4+IHdvdWxkIHRoZW4gaG9wZWZ1bGx5IGJlIGNvZGVkIHVwIGluIGEgd2F5IHRoYXQgd291
bGQgbWFrZSBleHRlbmRpbmcKPj4gaXQgc3RyYWlnaHRmb3J3YXJkLCBvbmNlIGEgM3JkIG1lY2hh
bmlzbSBhcHBlYXJzLgo+Pgo+PiBIbW1tLi4uIHdlIGNhbm5vdCBmb3JjZSBndWVzdHMgdG8gY2Fs
bCBpbml0X2NvbnRyb2wgKGluIG9yZGVyIHRvIGZsaXAgZnJvbSAyTCB0byBGSUZPKS4gUXVvdGlu
ZyBmcm9tIFsxXSA0LjQg4oCcSWYgdGhpcyBjYWxsIChFVlRDSE5PUF9pbml0X2NvbnRyb2wpIGZh
aWxzIG9uIHRoZSBib290IFZDUFUsIHRoZSBndWVzdCBzaG91bGQgY29udGludWUgdG8gdXNlIHRo
ZSAyLWxldmVsIGV2ZW50IGNoYW5uZWwgQUJJIGZvciBhbGwgVkNQVXMu4oCdIFN1cHBvcnQgZm9y
IDJMIEFCSSBkb2VzIG5vdCBzb3VuZCBsaWtlIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBvcHRpb25h
bC4gT25jZSBhIDNyZCBtZWNoYW5pc20gYXBwZWFycywgSSBpbWFnaW5lIGFkZGluZyBhIGNvcnJl
c3BvbmRpbmcgZG9tY3RsIGZsYWcgdG8gY29udHJvbCBzdWNoIG1lY2hhbmlzbS4KPiAKPiBGb3Ig
SFZNLCBldmVudCBjaGFubmVscyBhcyBhIHdob2xlIHNob3VsZCBiZSBvcHRpb25hbDsgd2Ugc2hv
dWxkbid0Cj4gZGVmYXVsdCBhIHBvc3NpYmxlIGNvbnRyb2wgZm9yIHRoaXMgdG8gb2ZmIHRob3Vn
aC4gRm9yIFBWLCB0aGUKPiAyLWxldmVsIGludGVyZmFjZSBpbmRlZWQgaGFzIHRvIGJlIGNvbnNp
ZGVyZWQgbWFuZGF0b3J5LiBIZW5jZQo+IHRvZGF5IHRoZXJlIGFyZSB0aGVzZSAodGhlb3JldGlj
YWxseSkgcG9zc2libGUgY29tYmluYXRpb25zCj4gCj4gCQlQVgkJSFZNCj4gbm90aGluZwkJaW52
YWxpZAkJdmFsaWQKPiAyLWxldmVsIG9ubHkJdmFsaWQJCXZhbGlkCgpUaGUgcGF0Y2ggYXQgaGFu
ZCBoZXJlIGlzIGNvbmNlcm5lZCBvbmx5IHdpdGggdGhlIGFib3ZlIGxpbmUuIChJbiBmYWN0LCAK
djMgd2lsbCByZW5hbWUgdGhlIHN1YmplY3QgdG86ICJldnRjaG46IGludHJvZHVjZSBhIGtub2Ig
dG8gb24vb2ZmIEZJRk8gCkFCSSBwZXIgZ3Vlc3QiLikKCkkgdGFrZSBpdCB0aGF0IHRoZSBjb25j
ZXJuIGhlcmUgaXMgdGhhdCB3aGF0ZXZlciBjaGFuZ2VzIHRoZSBwYXRjaCAKcHJvcG9zZXMgc2hv
dWxkIHBsYXkgbmljZWx5IHdpdGggcG90ZW50aWFsIGZ1dHVyZSBjaGFuZ2VzIGludHJvZHVjaW5n
IApzdWNoIGEgZ2VuZXJpYyBmcmFtZXdvcmsuIEFueSBjb25jcmV0ZSBzdWdnZXN0aW9ucz8KClRo
YW5rcywKRXNsYW0KCj4gRklGTyBvbmx5CT8/PwkJdmFsaWQKPiBib3RoCQl2YWxpZAkJdmFsaWQK
CgoKPiAKPiBKYW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
