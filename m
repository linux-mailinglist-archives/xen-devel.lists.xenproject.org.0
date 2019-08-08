Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B623D86245
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:51:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhrQ-0005pQ-7a; Thu, 08 Aug 2019 12:49:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvhrO-0005pC-BQ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 12:49:38 +0000
X-Inumbo-ID: fa461c95-b9da-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fa461c95-b9da-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:49:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED291AF57;
 Thu,  8 Aug 2019 12:49:35 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
 <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
 <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
 <3a17204b-c569-11d3-ad4b-52e6f6214c65@suse.com>
 <7bcbb3ac-3df0-d53b-67f0-6e644b6ff076@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a811ae21-1b6c-8239-a15f-d50bb579904c@suse.com>
Date: Thu, 8 Aug 2019 14:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7bcbb3ac-3df0-d53b-67f0-6e644b6ff076@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMTQ6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjA4LjIwMTkgMTM6
NTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA4LjA4LjE5IDEyOjI4LCBKdWxpZW4gR3Jh
bGwgd3JvdGU6Cj4+PiBPbiAwOC8wOC8yMDE5IDA4OjUxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4+IE9uIDA4LjA4LjE5IDA4OjU4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMDcuMDgu
MjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gRG8gd2UgaGF2ZSBhbiBpbXBs
aWVkIGFzc3VtcHRpb24gc29tZXdoZXJlIHRoYXQgdW5zaWduZWQgc2hvcnQgaXMKPj4+Pj4gZXhh
Y3RseSAxNiBiaXRzIHdpZGU/IEkgdGhpbmsgInZhbCIgd2FudHMgdG8gYmUgdWludDE2X3QgaGVy
ZSAoYXMKPj4+Pj4geW91IHJlYWxseSBtZWFuICJleGFjdGx5IDE2IGJpdHMiKSwgdGhlIHR3byBi
b29sZWFuIGZpZWxkcyB3YW50Cj4+Pj4+IHRvIGJlIGJvb2wsIGFuZCB0aGUgcmVtYWluaW5nIHR3
byBvbmVzIHVuc2lnbmVkIGludC4KPj4+Pgo+Pj4+IEJ1dCB0aGF0IHdvdWxkIGluY3JlYXNlIHRo
ZSBzaXplIG9mIHRoZSB1bmlvbiB0byA0IGJ5dGVzIGluc3RlYWQgb2YgMi4KPj4+PiBTbyBhdCBs
ZWFzdCBwYWQgYW5kIGNwdSBtdXN0IGJlIHVuc2lnbmVkIHNob3J0IG9yIChiZXR0ZXIpIHVpbnQx
Nl90Lgo+Pj4KPj4+IEhvdyBhYm91dCBib29sIGlycV9zYWZlOjE/Cj4+Cj4+IEkgZGlkbid0IHF1
ZXN0aW9uIHRoYXQsIGJ1dCBPVE9IIEknbSBub3Qgc3VyZSBkb2luZyBzb21ldGhpbmcgbGlrZToK
Pj4KPj4gc3RydWN0IHsKPj4gICDCoCBib29swqDCoMKgwqAgdW5zZWVuOjE7Cj4+ICAgwqAgYm9v
bMKgwqDCoMKgIGlycV9zYWZlOjE7Cj4+ICAgwqAgdWludDE2X3QgcGFkOjI7Cj4+ICAgwqAgdWlu
dDE2X3QgY3B1OjEyOwo+PiB9Cj4+Cj4+IGlzIGd1YXJhbnRlZWQgdG8gYmUgMiBieXRlcyBsb25n
LiBJIHRoaW5rIHBhZCB3aWxsIGJlIHN0aWxsIHB1dCBpbnRvIHRoZQo+PiBmaXJzdCBieXRlLCBi
dXQgdGhlIGNvbXBpbGVyIG1pZ2h0IGRlY2lkZSB0aGF0IHRoZSA0IGJpdHMgbGVmdCB3b24ndCBi
ZQo+PiBhYmxlIHRvIGhvbGQgdGhlIG5leHQgMTIgYml0cyBzbyBpdCBjb3VsZCBzdGFydCBhIG5l
dyB1aW50MTZfdCBhdCBvZmZzZXQKPj4gMi4KPj4KPj4gTW92aW5nIHRoZSBib29sIHR5cGVzIHRv
IHRoZSBlbmQgb2YgdGhlIHN0cnVjdCB3b3VsZCBhdm9pZCB0aGF0IElNSE8uCj4gCj4gTW92aW5n
IHRoZSB0d28gYm9vbC1zIGZ1cnRoZXIgZG93biB3aWxsIGFsc28gc2ltcGxpZnkgZXh0cmFjdGlv
biBhbmQKPiBpbnNlcnRpb24gb2YgdGhlICJjcHUiIGZpZWxkLgoKT2theSwgbGV0cyByZXZlcnNl
IGFib3ZlIHN0cnVjdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
