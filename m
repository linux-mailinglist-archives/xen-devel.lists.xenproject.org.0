Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CCE9CBC9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 10:40:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2AUx-0005kx-D6; Mon, 26 Aug 2019 08:37:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2AUw-0005ko-4P
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 08:37:10 +0000
X-Inumbo-ID: b1083ab8-c7dc-11e9-ae23-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1083ab8-c7dc-11e9-ae23-12813bfff9fa;
 Mon, 26 Aug 2019 08:37:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C401B011;
 Mon, 26 Aug 2019 08:37:08 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190802130730.15942-1-jgross@suse.com>
 <20190802130730.15942-3-jgross@suse.com>
 <207a0624d8ea32e46694a31716e79b7f2ed4cce8.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c82cfb4c-8df9-ec9c-cbb6-b6597109f8de@suse.com>
Date: Mon, 26 Aug 2019 10:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <207a0624d8ea32e46694a31716e79b7f2ed4cce8.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/3] xen/sched: remove cpu from pool0 before
 removing it
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDguMTkgMTk6MTEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIEZyaSwgMjAxOS0w
OC0wMiBhdCAxNTowNyArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgYSBjcHUg
d2hpY2ggaXMgcmVtb3ZlZCBmcm9tIHRoZSBzeXN0ZW0gaXMgdGFrZW4gZGlyZWN0bHkgZnJvbQo+
PiBQb29sMCB0byB0aGUgb2ZmbGluZSBzdGF0ZS4gVGhpcyB3aWxsIGNvbmZsaWN0IHdpdGggdGhl
IG5ldyBpZGxlCj4+IHNjaGVkdWxlciwgc28gcmVtb3ZlIGl0IGZyb20gUG9vbDAgZmlyc3QuIEFk
ZGl0aW9uYWxseSBhY2NlcHQKPj4gcmVtb3ZpbmcKPj4gYSBmcmVlIGNwdSBpbnN0ZWFkIG9mIHJl
cXVpcmluZyBpdCB0byBiZSBpbiBQb29sMC4KPj4KPj4gRm9yIHRoZSByZXN1bWUgZmFpbGVkIGNh
c2Ugd2UgbmVlZCB0byBjYWxsIHRoZSBzY2hlZHVsZXIgY29kZSBmb3IKPj4gdGhhdAo+PiBzaXR1
YXRpb24gYWZ0ZXIgdGhlIGNwdXBvb2wgaGFuZGxpbmcsIHNvIG1vdmUgdGhlIHNjaGVkdWxlciBj
b2RlIGludG8KPj4gYSBmdW5jdGlvbiBhbmQgY2FsbCBpdCBmcm9tIGNwdXBvb2xfY3B1X3JlbW92
ZV9mb3JjZWQoKSBhbmQgcmVtb3ZlCj4+IHRoZQo+PiBDUFVfUkVTVU1FX0ZBSUxFRCBjYXNlIGZy
b20gY3B1X3NjaGVkdWxlX2NhbGxiYWNrKCkuCj4+Cj4+IE5vdGUgdGhhdCB3ZSBhcmUgY2FsbGlu
ZyBub3cgc2NoZWR1bGVfY3B1X3N3aXRjaCgpIGluIHN0b3BfbWFjaGluZQo+PiBjb250ZXh0IHNv
IHdlIG5lZWQgdG8gc3dpdGNoIGZyb20gc3BpbmxvY2tfaXJxIHRvIHNwaW5sb2NrX2lycXNhdmUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4g
LS0tCj4+Cj4+IC0tLSBhL3hlbi9jb21tb24vY3B1cG9vbC5jCj4+ICsrKyBiL3hlbi9jb21tb24v
Y3B1cG9vbC5jCj4+IEBAIC0yODIsMjIgKzI4MiwxNCBAQCBzdGF0aWMgaW50IGNwdXBvb2xfYXNz
aWduX2NwdV9sb2NrZWQoc3RydWN0Cj4+IGNwdXBvb2wgKmMsIHVuc2lnbmVkIGludCBjcHUpCj4+
ICAgICAgIHJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gLXN0YXRpYyBsb25nIGNwdXBvb2xfdW5h
c3NpZ25fY3B1X2hlbHBlcih2b2lkICppbmZvKQo+PiArc3RhdGljIGludCBjcHVwb29sX3VuYXNz
aWduX2NwdV9lcGlsb2d1ZShzdHJ1Y3QgY3B1cG9vbCAqYykKPj4KPiBpbiBzY2hlZHVsZS5jLCBm
b3IgYSBzaW1pbGFyIHNpdHVhdGlvbiwgd2UgaGF2ZSB1c2VkICdfc3RhcnQnIGFuZAo+ICdfZmlu
aXNoJyBhcyBzdWZmaXhlcy4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdXNpbmcgdGhvc2UgaGVy
ZSB0b28/Cj4gCj4gSXQncyBjZXJ0YWlubHkgYSBtaW5vciB0aGluZywgSSBrbm93LCBidXQgSSAo
cGVyc29uYWxseSkgbGlrZSB0aGVtCj4gYmV0dGVyIChlc3BlY2lhbGx5IHRoYW4gJ2VwaWxvZ3Vl
JykgYW5kIEkgdGhpbmsgaXQgZ2l2ZXMgdXMgc29tZQo+IGNvbnNpc3RlbmN5ICh5ZXMsIHN1cmUs
IGRpZmZlcmVudCBmaWxlcy4uIGJ1dCBzY2hlZHVsaW5nIGFuZCBjcHVwb29scwo+IGFyZSBxdWl0
ZSB0aWdodGx5IHJlbGF0ZWQpLgoKT2theSwgd2lsbCByZW5hbWUuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
