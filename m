Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B429BD9576
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 17:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKl88-0000MZ-If; Wed, 16 Oct 2019 15:22:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eWLc=YJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKl86-0000MQ-U5
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 15:22:26 +0000
X-Inumbo-ID: c23d72b7-f028-11e9-93b8-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c23d72b7-f028-11e9-93b8-12813bfff9fa;
 Wed, 16 Oct 2019 15:22:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 458702067D;
 Wed, 16 Oct 2019 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571239345;
 bh=4RmU39CeANuvXwWtm34pRCmYzSXK5T2j++DTJCTv7A4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=rNluFNt0Yt6zIYEOw5Luc5AuzcF8239G7pBmy721aAKrhFxf6rqiRL9U9jPs7m14R
 thZSr8Q/LHJUC1PvqKZ3G+z1y4FC+BYbIbolZdohuTrC7OnVUR5NgebDAWDCk+cEFp
 GmsrnbDTn2iDS82YEQUJDVNcvFjeMVTWoRinpyYM=
Date: Wed, 16 Oct 2019 08:22:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191016105303.21948-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910160822120.30080@sstabellini-ThinkPad-T480s>
References: <20191016105303.21948-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] xen/arm: Don't use _end in
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxNiBPY3QgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHZpcnRfdG9fbWFkZHIo
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
YXJtLmNvbT4KPiBSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgoKCj4gLS0tCj4gCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
PiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6
IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IAo+
IHg4NiBzZWVtcyB0byBiZSBhZmZlY3RlZCBieSB0aGUgb2ZmLWJ5LW9uZSBpc3N1ZS4gSmFuLCBB
bmRyZXc/Cj4gCj4gVGhpcyBjb3VsZCBiZSByZWFjaGVkIGJ5IGEgZG9tYWluIHZpYSBYRU5fU1lT
Q1RMX3BhZ2Vfb2ZmbGluZV9vcC4KPiBIb3dldmVyLCB0aGUgb3BlcmF0aW9uIGlzIG5vdCBzZWN1
cml0eSBzdXBwb3J0ZWQgKHNlZSBYU0EtNzcpLiBTbyB3ZSBhcmUKPiBmaW5lIGhlcmUuCj4gCj4g
ICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIENhc3QgX2VuZCB0byB2YWRkcl90IHRvIHBy
ZXZlbnQgVUIuCj4gICAgICAgICAtIEFkZCBKdWVyZ2VuJ3MgcmVsZWFzZWQtYWNrZWQtYnkKPiAt
LS0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gaW5kZXggMjYyZDky
ZjE4ZC4uMzMzZWZkM2E2MCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgK
PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKPiBAQCAtMTUzLDcgKzE1Myw3IEBAIGV4
dGVybiB1bnNpZ25lZCBsb25nIHhlbmhlYXBfYmFzZV9wZHg7Cj4gIAo+ICAjZGVmaW5lIGlzX3hl
bl9maXhlZF9tZm4obWZuKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAg
ICAgKChtZm5fdG9fbWFkZHIobWZuKSA+PSB2aXJ0X3RvX21hZGRyKCZfc3RhcnQpKSAmJiAgICAg
ICAgICAgXAo+IC0gICAgIChtZm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKCZfZW5k
KSkpCj4gKyAgICAgKG1mbl90b19tYWRkcihtZm4pIDw9IHZpcnRfdG9fbWFkZHIoKHZhZGRyX3Qp
X2VuZCAtIDEpKSkKPiAgCj4gICNkZWZpbmUgcGFnZV9nZXRfb3duZXIoX3ApICAgIChfcCktPnYu
aW51c2UuZG9tYWluCj4gICNkZWZpbmUgcGFnZV9zZXRfb3duZXIoX3AsX2QpICgoX3ApLT52Lmlu
dXNlLmRvbWFpbiA9IChfZCkpCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
