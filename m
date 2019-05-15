Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E01EA67
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 10:47:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQpWG-0004o9-6w; Wed, 15 May 2019 08:44:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQpWE-0004nG-Q5
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 08:44:10 +0000
X-Inumbo-ID: 9aaa0f73-76ed-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9aaa0f73-76ed-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 08:44:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 02:44:07 -0600
Message-Id: <5CDBD157020000780022F1EA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 02:44:07 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] page-alloc: accompany BUG() with printk()
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TG9nIGluZm9ybWF0aW9uIGxpa2VseSByZWxldmFudCBmb3IgdW5kZXJzdGFuZGluZyB3aHkgdGhl
IEJVRygpcyB3ZXJlCnRyaWdnZXJpbmcuCgpSZXF1ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCisrKyBiL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCkBAIC05ODQsNyArOTg0LDE1IEBAIHN0YXRpYyBzdHJ1Y3QgcGFn
ZV9pbmZvICphbGxvY19oZWFwX3BhZ2UKICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVy
KTsgaSsrICkKICAgICB7CiAgICAgICAgIC8qIFJlZmVyZW5jZSBjb3VudCBtdXN0IGNvbnRpbnVv
dXNseSBiZSB6ZXJvIGZvciBmcmVlIHBhZ2VzLiAqLwotICAgICAgICBCVUdfT04oKHBnW2ldLmNv
dW50X2luZm8gJiB+UEdDX25lZWRfc2NydWIpICE9IFBHQ19zdGF0ZV9mcmVlKTsKKyAgICAgICAg
aWYgKCAocGdbaV0uY291bnRfaW5mbyAmIH5QR0NfbmVlZF9zY3J1YikgIT0gUEdDX3N0YXRlX2Zy
ZWUgKQorICAgICAgICB7CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUgorICAgICAgICAg
ICAgICAgICAgICJwZ1sldV0gTUZOICUiUFJJX21mbiIgYz0lI2x4IG89JXUgdj0lI2x4IHQ9JSN4
XG4iLAorICAgICAgICAgICAgICAgICAgIGksIG1mbl94KHBhZ2VfdG9fbWZuKHBnICsgaSkpLAor
ICAgICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8sIHBnW2ldLnYuZnJlZS5vcmRlciwK
KyAgICAgICAgICAgICAgICAgICBwZ1tpXS51LmZyZWUudmFsLCBwZ1tpXS50bGJmbHVzaF90aW1l
c3RhbXApOworICAgICAgICAgICAgQlVHKCk7CisgICAgICAgIH0KIAogICAgICAgICAvKiBQR0Nf
bmVlZF9zY3J1YiBjYW4gb25seSBiZSBzZXQgaWYgZmlyc3RfZGlydHkgaXMgdmFsaWQgKi8KICAg
ICAgICAgQVNTRVJUKGZpcnN0X2RpcnR5ICE9IElOVkFMSURfRElSVFlfSURYIHx8ICEocGdbaV0u
Y291bnRfaW5mbyAmIFBHQ19uZWVkX3NjcnViKSk7CkBAIC0xMzkzLDYgKzE0MDEsMTEgQEAgc3Rh
dGljIHZvaWQgZnJlZV9oZWFwX3BhZ2VzKAogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAg
ZGVmYXVsdDoKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSCisgICAgICAgICAgICAgICAg
ICAgInBnWyV1XSBNRk4gJSJQUklfbWZuIiBjPSUjbHggbz0ldSB2PSUjbHggdD0lI3hcbiIsCisg
ICAgICAgICAgICAgICAgICAgaSwgbWZuX3gocGFnZV90b19tZm4ocGcgKyBpKSksCisgICAgICAg
ICAgICAgICAgICAgcGdbaV0uY291bnRfaW5mbywgcGdbaV0udi5mcmVlLm9yZGVyLAorICAgICAg
ICAgICAgICAgICAgIHBnW2ldLnUuZnJlZS52YWwsIHBnW2ldLnRsYmZsdXNoX3RpbWVzdGFtcCk7
CiAgICAgICAgICAgICBCVUcoKTsKICAgICAgICAgfQogCkBAIC0yMzM2LDcgKzIzNDksMTUgQEAg
dm9pZCBmcmVlX2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbwogCiAgICAgICAgICAgICBm
b3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsgaSsrICkKICAgICAgICAgICAgIHsKLSAgICAg
ICAgICAgICAgICBCVUdfT04oKHBnW2ldLnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21h
c2spICE9IDApOworICAgICAgICAgICAgICAgIGlmICggcGdbaV0udS5pbnVzZS50eXBlX2luZm8g
JiBQR1RfY291bnRfbWFzayApCisgICAgICAgICAgICAgICAgeworICAgICAgICAgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX0VSUgorICAgICAgICAgICAgICAgICAgICAgICAgICAgInBnWyV1XSBN
Rk4gJSJQUklfbWZuIiBjPSUjbHggbz0ldSB2PSUjbHggdD0lI3hcbiIsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpLCBtZm5feChwYWdlX3RvX21mbihwZyArIGkpKSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8sIHBnW2ldLnYuZnJlZS5vcmRlciwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBnW2ldLnUuZnJlZS52YWwsIHBnW2ldLnRsYmZsdXNo
X3RpbWVzdGFtcCk7CisgICAgICAgICAgICAgICAgICAgIEJVRygpOworICAgICAgICAgICAgICAg
IH0KICAgICAgICAgICAgICAgICBhcmNoX2ZyZWVfaGVhcF9wYWdlKGQsICZwZ1tpXSk7CiAgICAg
ICAgICAgICB9CiAKCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
