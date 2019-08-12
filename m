Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AB8971D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 08:19:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hx3d5-0004m3-Lk; Mon, 12 Aug 2019 06:16:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hx3d3-0004ls-8u
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 06:16:25 +0000
X-Inumbo-ID: b54a5e88-bcc8-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b54a5e88-bcc8-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 06:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4980AC63;
 Mon, 12 Aug 2019 06:16:22 +0000 (UTC)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
References: <20190809121440.5668-1-julien.grall@arm.com>
 <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
 <62e082b025d8483d8b577c283fce1873@dornerworks.com>
 <alpine.DEB.2.21.1908091123020.7788@sstabellini-ThinkPad-T480s>
 <edf1b7aaef154e4991a68d148b3e5fdc@dornerworks.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44c840a1-1405-9b1c-bd6e-351be5cb11f7@suse.com>
Date: Mon, 12 Aug 2019 08:16:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <edf1b7aaef154e4991a68d148b3e5fdc@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the
 buddy allocator
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
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAyMDozNCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOgo+IE9uIEZyaWRh
eSwgQXVndXN0IDksIDIwMTkgMjoyNCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+PiBPbiBGcmksIDkgQXVnIDIwMTksIFN0ZXdhcnQgSGlsZGVicmFuZCB3
cm90ZToKPj4+IEhlcmUgaXMgSmVmZidzIGluaXRpYWwgcGF0Y2ggZm9yIHRoZSBpc3N1ZS4KPj4K
Pj4gSSBjb21taXR0ZWQgSnVsaWVuJ3MgcGF0Y2ggZm9yIG5vdywKPiAKPiBHcmVhdCEgVGhhbmtz
IQo+IAo+PiBidXQgaWYgd2UgbmVlZCB0byBtYWtlIGFueSBjaGFuZ2VzCj4+IG9yIGRlY2lkZSBm
b3IgYSBiZXR0ZXIgYWx0ZXJuYXRpdmUsIHdlIGNhbiBhbHdheXMgcmV2ZXJ0IGl0Lgo+IAo+IENh
biB3ZSBlbnRlcnRhaW4gY29tbWl0dGluZyBib3RoIHBhdGNoZXM/Cj4gVG8gcGFyYXBocmFzZSBH
ZW9yZ2UgZnJvbSBhbiBlYXJsaWVyIGRpc2N1c3Npb246IFJlbW92aW5nIE1GTiAwIGZpeGVzIHRo
ZSBpc3N1ZSBieSByZWx5aW5nIG9uIHNpZGUgZWZmZWN0cy4gQWRkaW5nIGFuIGV4cGxpY2l0IGNo
ZWNrIGluIHRoZSBtZXJnaW5nIGxvZ2ljIGRpcmVjdGx5IGZpeGVzIHRoZSBpc3N1ZS4KPiAKCkkg
dGhvdWdodCBwcmV2aW91cyBkaXNjdXNzaW9uICh3aGVuIHlvdSBoYWQgZmlyc3QgcG9zdGVkIHlv
dSB2YXJpYW50Cm9mIHRoZSBmaXgpIGhhZCBjbGFyaWZpZWQgdGhhdCB0aGVyZSBhcmUgb2JqZWN0
aW9ucyB0byB5b3UgbW9kaWZ5aW5nCmFuIG9mdGVuIGV4ZWN1dGVkIGNvZGUgcGF0aCB3aGVuIHRo
ZSBzYW1lIGVmZmVjdCBjYW4gYmUgYWNoaWV2ZWQgYnkKbW9kaWZ5aW5nIGFuIGluZnJlcXVlbnRs
eSBleGVjdXRlZCBvbmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
