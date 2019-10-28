Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A76E6A61
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 02:07:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOtSj-0003Pj-7J; Mon, 28 Oct 2019 01:04:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LXsm=YV=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iOtSh-0003Pc-QQ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 01:04:47 +0000
X-Inumbo-ID: ec99e00e-f91e-11e9-bbab-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec99e00e-f91e-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 01:04:44 +0000 (UTC)
Received: from lamp.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:9437:a98c:391f:36c5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 81F572001AE;
 Mon, 28 Oct 2019 12:04:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1572224681; bh=qHgDxGSCA3UXHhBwQWyQ5QhYJ/jKRPjiaQ0FrD2lAsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=aTJEzIZ5+iipzIAj0bQ1/Z/C2kq9XpxMSlErNkhPtIuvmpXghnGs5m6cCpayAQV8g
 JoBDPqGAYay4+Ru4osp1QLKzgdLZtft9EOdHn36z1wq5mobZTscywqrCmKSpmLKMia
 HCHsXfu49ZnDy65qnDsi2PJcabO7gpk+KHWUWjnA=
MIME-Version: 1.0
Date: Mon, 28 Oct 2019 12:04:38 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <cover.1572038720.git.m.a.young@durham.ac.uk>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
User-Agent: Roundcube Webmail/1.4-rc2
Message-ID: <9030946b88e75c5e31d33be421f5b153@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] [XEN PATCH 0/3] read grubenv and set default from it
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0xMC0yNiAwOTo1MiwgWU9VTkcsIE1JQ0hBRUwgQS4gd3JvdGU6Cj4gVGhpcyBzZXJp
ZXMgb2YgcGF0Y2hlcyBpcyB0byBpbXByb3ZlIHRoZSBwYXJzaW5nIGJ5IHB5Z3J1YiBvZiBncnVi
Cj4gY29uZmlndXJhdGlvbiBvbiBGZWRvcmEuIFRoZSBjdXJyZW50IHJlc3VsdCBvZiBwYXJzaW5n
IGlzIGdlbmVyYWxseQo+IHRoYXQgdGhlIHNlY29uZCBrZXJuZWwgbGlzdGVkIGlzIHNldCBhcyB0
aGUgZGVmYXVsdCBkdWUgdG8gYQo+IHNldCBkZWZhdWx0PTEgbGluZSBpbiBncnViLmNmZyB3aGlj
aCBpcyBvbmx5IGludGVuZGVkIHRvIGJlCj4gcmVhY2hlZCBhZnRlciByZXBlYXRlZCBib290IGZh
aWx1cmVzLgo+IAo+IFRoZSBwYXRjaGVzIHJlYWQgdGhlIGdydWJlbnYgZmlsZSAod2hpY2ggY29u
c2lzdHMgb2Yga2V5PXZhbHVlIGxpbmVzCj4gcGFkZGVkIHRvIDEwMjQgY2hhcmFjdGVycyBieSAj
IGNoYXJhY3RlcnMpIHRvIGdldCB0aGUgdmFsdWVzIG9mCj4gbmV4dF9lbnRyeSBhbmQgc2F2ZWRf
ZW50cnksIHdoaWNoIGNhbiBiZSBhIGtlcm5lbCBzdHJpbmcgb3IgYW4KPiBvcmRlciBudW1iZXIu
IFVuZm9ydHVuYXRlbHksIGZvciBGZWRvcmEgMzEgYXQgbGVhc3QsIHRoaXMgaXMKPiBvZnRlbiBh
IEJMUy1zdHlsZSBzdHJpbmcgc28gaXQgaXNuJ3QgbmVjZXNzYXJpbHkgdXNlZnVsLiBUaGUgcGF0
Y2hlcwo+IHVzZSB0aGUgdmFsdWUgb2YgbmV4dF9lbnRyeSBvciBvZiBzYXZlZF9lbnRyeSB0byBz
ZXQgdGhlIGRlZmF1bHQKPiBrZXJuZWwgb3Igc2V0cyBpdCB0byB0aGUgZmlyc3Qga2VybmVsIGxp
c3RlZCBpZiB0aG9zZSB2YWx1ZXMgYXJlIHNldAo+IGJ1dCBub3QgdXNlZC4KPiAKPiAKPiBNaWNo
YWVsIFlvdW5nICgzKToKPiAgIHNldCBkZWZhdWx0IGtlcm5lbCBmcm9tIGdydWJlbnYgbmV4dF9l
bnRyeSBvciBzYXZlZF9lbnRyeQo+ICAgcmVhZCBhIGdydWJlbnYgZmlsZSBpZiBpdCBpcyBuZXh0
IHRvIHRoZSBncnViLmNmZyBmaWxlCj4gICBFeGFtcGxlIEZlZG9yYSAzMSBncnViLmNmZyBhbmQg
Z3J1YmVudiBmaWxlcwo+IAo+ICB0b29scy9weWdydWIvZXhhbXBsZXMvZmVkb3JhLTMxLmdydWIu
Y2ZnIHwgMjAwICsrKysrKysrKysrKysrKysrKysrKysrCj4gIHRvb2xzL3B5Z3J1Yi9leGFtcGxl
cy9mZWRvcmEtMzEuZ3J1YmVudiAgfCAgIDUgKwo+ICB0b29scy9weWdydWIvc3JjL0dydWJDb25m
LnB5ICAgICAgICAgICAgIHwgIDMxICsrKy0KPiAgdG9vbHMvcHlncnViL3NyYy9weWdydWIgICAg
ICAgICAgICAgICAgICB8ICAyMSArKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAyNTMgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3B5Z3J1Yi9l
eGFtcGxlcy9mZWRvcmEtMzEuZ3J1Yi5jZmcKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3B5
Z3J1Yi9leGFtcGxlcy9mZWRvcmEtMzEuZ3J1YmVudgoKVGVzdGVkLWJ5OiBTdGV2ZW4gSGFpZ2gg
PG5ldHdpekBjcmMuaWQuYXU+CgpObyBpc3N1ZXMgbG9jYXRlZCwgc2VlbXMgdG8gd29yayB3aXRo
IEYzMSBndWVzdHMgYXMgYWR2ZXJ0aXNlZC4KCkkgYmVsaWV2ZSB0aGVzZSB3b3VsZCBiZSBjYW5k
aWRhdGVzIGZvciBiYWNrcG9ydHMgaW50byBvdGhlciBzdXBwb3J0ZWQgClhlbiB2ZXJzaW9ucyBh
cyB3ZWxsLgoKLS0gClN0ZXZlbiBIYWlnaAoKPyBuZXR3aXpAY3JjLmlkLmF1ICAgICA/IGh0dHA6
Ly93d3cuY3JjLmlkLmF1Cj8gKzYxICgzKSA5MDAxIDYwOTAgICAgPyAwNDEyIDkzNSA4OTcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
