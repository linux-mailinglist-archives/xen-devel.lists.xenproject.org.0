Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1A19020
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 20:23:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnf7-00089Q-C9; Thu, 09 May 2019 18:20:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOnf5-00089H-TV
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:20:55 +0000
X-Inumbo-ID: 2ecd9fc3-7287-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ecd9fc3-7287-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 18:20:54 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A59F520675;
 Thu,  9 May 2019 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557426054;
 bh=Ovjcz0vC5BEL9gGbYBXe8fAdqPQR8cr3bfA4qKaQc7w=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=K/IgxbL4Xb1xCABoEywfkuNCXzBrzucI/dC4lynNUskS7MwnsviRqilzc0bUU4f4W
 yybXC+jBAY8Ko6Kr2CxD55hnhtMypqr2I/CI3VwVXb3FZHtMoFO4mNDETBGc8ltIgm
 wMwWEwzsj+9hN3Sa/vqrBJvnHQ2DXSccfJIqSOnc=
Date: Thu, 9 May 2019 11:20:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190507151458.29350-15-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905091120440.25766@sstabellini-ThinkPad-T480s>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA3IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQXQgdGhlIG1vbWVudCwg
QXJtIGlzIHByb3ZpZGluZyBhIGR1bW15IGltcGxlbWVudGF0aW9uIGZvciB0aGUgTTJQCj4gaGVs
cGVycyB1c2VkIGluIGNvbW1vbiBjb2RlLiBIb3dldmVyLCB0aGV5IGFyZSBxdWl0ZSBpc29sYXRl
ZCBhbmQgY291bGQKPiBiZSB1c2VkIGJ5IG90aGVyIGFyY2hpdGVjdHVyZSBpbiB0aGUgZnV0dXJl
LiBTbyBtb3ZlIGFsbCB0aGUgaGVscGVycyBpbgo+IHhlbi9tbS5oLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENo
YW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9pbmNsdWRl
L2FzbS1hcm0vbW0uaCB8IDExIC0tLS0tLS0tLS0tCj4gIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAg
ICB8IDE0ICsrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
bW0uaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaAo+IGluZGV4IDNjMDNiZTNiY2EuLmQ2OGQx
Nzk0ZTUgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9tbS5oCj4gQEAgLTMxMywxNyArMzEzLDYgQEAgc3RhdGljIGlubGlu
ZSB2b2lkICpwYWdlX3RvX3ZpcnQoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGcpCj4gIHN0cnVj
dCBwYWdlX2luZm8gKmdldF9wYWdlX2Zyb21fZ3ZhKHN0cnVjdCB2Y3B1ICp2LCB2YWRkcl90IHZh
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzKTsKPiAgCj4gLS8qCj4gLSAqIEFybSBkb2VzIG5vdCBoYXZlIGFuIE0yUCwgYnV0IGNvbW1v
biBjb2RlIGV4cGVjdHMgYSBoYW5kZnVsIG9mCj4gLSAqIE0yUC1yZWxhdGVkIGRlZmluZXMgYW5k
IGZ1bmN0aW9ucy4gUHJvdmlkZSBkdW1teSB2ZXJzaW9ucyBvZiB0aGVzZS4KPiAtICovCj4gLSNk
ZWZpbmUgSU5WQUxJRF9NMlBfRU5UUlkgICAgICAgICh+MFVMKQo+IC0jZGVmaW5lIFNIQVJFRF9N
MlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPiAtI2RlZmluZSBTSEFSRURfTTJQKF9lKSAg
ICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPiAtCj4gLS8qIFdlIGRvbid0IGhh
dmUgYSBNMlAgb24gQXJtICovCj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcGZuX2Zyb21fbWZu
KG1mbl90IG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pIHt9Cj4gLQo+ICAvKiBBcmNoLXNwZWNpZmlj
IHBvcnRpb24gb2YgbWVtb3J5X29wIGh5cGVyY2FsbC4gKi8KPiAgbG9uZyBhcmNoX21lbW9yeV9v
cChpbnQgb3AsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9pZCkgYXJnKTsKPiAgCj4gZGlmZiAt
LWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPiBpbmRl
eCAzYmE3MTY4Y2M5Li4wN2QyZDQ0NDkxIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9t
bS5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPiBAQCAtNjU4LDQgKzY1OCwxOCBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9wcml2aWxlZ2VkX2d1ZXN0cygK
PiAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGFnZSwgZG9tX3hlbiwgZmxhZ3MpOwo+
ICB9Cj4gIAo+ICsvKgo+ICsgKiBEdW1teSBpbXBsZW1lbnRhdGlvbiBvZiBNMlAtcmVsYXRlZCBo
ZWxwZXJzIGZvciBjb21tb24gY29kZSB3aGVuCj4gKyAqIHRoZSBhcmNoaXRlY3R1cmUgZG9lc24n
dCBoYXZlIGFuIE0yUC4KPiArICovCj4gKyNpZm5kZWYgQ09ORklHX0hBU19NMlAKPiArCj4gKyNk
ZWZpbmUgSU5WQUxJRF9NMlBfRU5UUlkgICAgICAgICh+MFVMKQo+ICsjZGVmaW5lIFNIQVJFRF9N
MlBfRU5UUlkgICAgICAgICAofjBVTCAtIDFVTCkKPiArI2RlZmluZSBTSEFSRURfTTJQKF9lKSAg
ICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9FTlRSWSkKPiArCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBzZXRfcGZuX2Zyb21fbWZuKG1mbl90IG1mbiwgdW5zaWduZWQgbG9uZyBwZm4pIHt9Cj4g
Kwo+ICsjZW5kaWYKPiArCj4gICNlbmRpZiAvKiBfX1hFTl9NTV9IX18gKi8KPiAtLSAKPiAyLjEx
LjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
