Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9E5D805C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 21:32:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKSUi-0004j1-Rc; Tue, 15 Oct 2019 19:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yms0=YI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKSUh-0004iw-2W
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 19:28:31 +0000
X-Inumbo-ID: f7f96010-ef81-11e9-a531-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7f96010-ef81-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 19:28:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16A8D2083B;
 Tue, 15 Oct 2019 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571167709;
 bh=jPd0koWyBw2hVZQ6NnBqUrhOsRRJiQQHkM4tbeqqjCI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nh/+pFrTVY2QiVcBTQWSRhrHRWZpaZ4KlAbmp+QJkcCNzUdwGmlrvUMHJeAH/LrUn
 +fu2rgTOUTUu0zf7sVrPaSrJd0muMtYurnMaRvJBGIxdL6Hdi7yEN4zUagjmLOa6xE
 vaf3fNc6PIaArFDzPzrZLsKJ2wLDpO7xL0q94M08=
Date: Tue, 15 Oct 2019 12:28:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191015181802.21957-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
References: <20191015181802.21957-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNSBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHZpcnRfdG9fbWFkZHIo
KSBpcyB1c2luZyB0aGUgaGFyZHdhcmUgcGFnZS10YWJsZSB3YWxrIGluc3RydWN0aW9ucyB0bwo+
IHRyYW5zbGF0ZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBwaHlzaWNhbCBhZGRyZXNzLiBUaGUgZnVu
Y3Rpb24gc2hvdWxkCj4gb25seSBiZSBjYWxsZWQgb24gdmlydHVhbCBhZGRyZXNzIG1hcHBlZC4K
PiAKPiBfZW5kIHBvaW50cyBwYXN0IHRoZSBlbmQgb2YgWGVuIGJpbmFyeSBhbmQgbWF5IG5vdCBi
ZSBtYXBwZWQgd2hlbiB0aGUKPiBiaW5hcnkgc2l6ZSBpcyBwYWdlLWFsaWduZWQuIFRoaXMgbWVh
bnMgdmlydF90b19tYWRkcigpIHdpbGwgbm90IGJlIGFibGUKPiB0byBkbyB0aGUgdHJhbnNsYXRp
b24gYW5kIHRoZXJlZm9yZSBjcmFzaCBYZW4uCj4gCj4gTm90ZSB0aGVyZSBpcyBhbHNvIGFuIG9m
Zi1ieS1vbmUgaXNzdWUgaW4gdGhpcyBjb2RlLCBidXQgdGhlIHBhbmljIHdpbGwKPiB0cnVtcCB0
aGF0Lgo+IAo+IEJvdGggaXNzdWVzIGNhbiBiZSBmaXhlZCBieSB1c2luZyBfZW5kIC0gMSBpbiB0
aGUgY2hlY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPgo+IC0tLQo+IAo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4K
PiBDYzogamdyb3NzQHN1c2UuY29tCj4gCj4geDg2IHNlZW1zIHRvIGJlIGFmZmVjdGVkIGJ5IHRo
ZSBvZmYtYnktb25lIGlzc3VlLiBKYW4sIEFuZHJldz8KPiAKPiBUaGlzIGNvdWxkIGJlIHJlYWNo
ZWQgYnkgYSBkb21haW4gdmlhIFhFTl9TWVNDVExfcGFnZV9vZmZsaW5lX29wLgo+IEhvd2V2ZXIs
IHRoZSBvcGVyYXRpb24gaXMgbm90IHNlY3VyaXR5IHN1cHBvcnRlZCAoc2VlIFhTQS03NykuIFNv
IHdlIGFyZQo+IGZpbmUgaGVyZS4KPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIHwg
MiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9tbS5oCj4gaW5kZXggMjYyZDkyZjE4ZC4uMTc0YWNkODg1OSAxMDA2NDQKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgK
PiBAQCAtMTUzLDcgKzE1Myw3IEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIHhlbmhlYXBfYmFzZV9w
ZHg7Cj4gIAo+ICAjZGVmaW5lIGlzX3hlbl9maXhlZF9tZm4obWZuKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgKChtZm5fdG9fbWFkZHIobWZuKSA+PSB2aXJ0X3Rv
X21hZGRyKCZfc3RhcnQpKSAmJiAgICAgICAgICAgXAo+IC0gICAgIChtZm5fdG9fbWFkZHIobWZu
KSA8PSB2aXJ0X3RvX21hZGRyKCZfZW5kKSkpCj4gKyAgICAgKG1mbl90b19tYWRkcihtZm4pIDw9
IHZpcnRfdG9fbWFkZHIoX2VuZCAtIDEpKSkKClRoYW5rIHlvdSBmb3Igc2VuZGluZyB0aGUgcGF0
Y2ggYW5kIEkgdGhpbmsgdGhhdCAiX2VuZCAtIDEiIGlzIHRoZSByaWdodApmaXguIEkgYW0ganVz
dCB3b25kZXJpbmcgd2hldGhlciB3ZSB3YW50L25lZWQgYW4gZXhwbGljaXQgY2FzdCBvZiBzb21l
CnNvcnQgaGVyZSwgYmVjYXVzZSB0ZWNobmljYWxseSBfZW5kIGlzIGEgY2hhcltdIGFuZCAxIGlz
IGEgaW50ZWdlci4KTWF5YmU6CgogICgodmFkZHJfdClfZW5kIC0gMSkKCj8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
