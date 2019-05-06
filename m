Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A35144D3
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYl-0002Db-3p; Mon, 06 May 2019 06:57:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYf-00022w-HW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:05 +0000
X-Inumbo-ID: 2743af03-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2743af03-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 393F1AF3F;
 Mon,  6 May 2019 06:56:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:38 +0200
Message-Id: <20190506065644.7415-40-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 39/45] xen/sched: support allocating
 multiple vcpus into one sched item
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2l0aCBhIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkgZ3JlYXRlciB0aGFuIDEgbXVsdGlwbGUgdmNw
dXMgc2hhcmUgdGhlCnNhbWUgc3RydWN0IHNjaGVkX2l0ZW0uIFN1cHBvcnQgdGhhdC4KClNldHRp
bmcgdGhlIGluaXRpYWwgcHJvY2Vzc29yIG11c3QgYmUgZG9uZSBjYXJlZnVsbHk6IHdlIGNhbid0
IHVzZQpzY2hlZF9zZXRfcmVzKCkgYXMgdGhhdCByZWxpZXMgb24gZm9yX2VhY2hfc2NoZWRfaXRl
bV92Y3B1KCkgd2hpY2ggaW4KdHVybiBuZWVkcyB0aGUgdmNwdSBhbHJlYWR5IGFzIGEgbWVtYmVy
IG9mIHRoZSBkb21haW4ncyB2Y3B1IGxpbmtlZApsaXN0LCB3aGljaCBpc24ndCB0aGUgY2FzZS4K
ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4v
Y29tbW9uL3NjaGVkdWxlLmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKaW5kZXggMjg3MGU5MWNjZS4uMzBjYTllZjI1ZSAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMjc1
LDEwICsyNzUsMjUgQEAgc3RhdGljIHZvaWQgc2NoZWRfc3Bpbl91bmxvY2tfZG91YmxlKHNwaW5s
b2NrX3QgKmxvY2sxLCBzcGlubG9ja190ICpsb2NrMiwKICAgICBzcGluX3VubG9ja19pcnFyZXN0
b3JlKGxvY2sxLCBmbGFncyk7CiB9CiAKLXN0YXRpYyB2b2lkIHNjaGVkX2ZyZWVfaXRlbShzdHJ1
Y3Qgc2NoZWRfaXRlbSAqaXRlbSkKK3N0YXRpYyB2b2lkIHNjaGVkX2ZyZWVfaXRlbShzdHJ1Y3Qg
c2NoZWRfaXRlbSAqaXRlbSwgc3RydWN0IHZjcHUgKnYpCiB7CiAgICAgc3RydWN0IHNjaGVkX2l0
ZW0gKnByZXZfaXRlbTsKICAgICBzdHJ1Y3QgZG9tYWluICpkID0gaXRlbS0+ZG9tYWluOworICAg
IHN0cnVjdCB2Y3B1ICp2aXRlbTsKKyAgICB1bnNpZ25lZCBpbnQgY250ID0gMDsKKworICAgIC8q
IERvbid0IGNvdW50IHRvIGJlIHJlbGVhc2VkIHZjcHUsIG1pZ2h0IGJlIG5vdCBpbiB2Y3B1IGxp
c3QgeWV0LiAqLworICAgIGZvcl9lYWNoX3NjaGVkX2l0ZW1fdmNwdSAoIGl0ZW0sIHZpdGVtICkK
KyAgICAgICAgaWYgKCB2aXRlbSAhPSB2ICkKKyAgICAgICAgICAgIGNudCsrOworCisgICAgdi0+
c2NoZWRfaXRlbSA9IE5VTEw7CisKKyAgICBpZiAoIGNudCApCisgICAgICAgIHJldHVybjsKKwor
ICAgIGlmICggaXRlbS0+dmNwdSA9PSB2ICkKKyAgICAgICAgaXRlbS0+dmNwdSA9IHYtPm5leHRf
aW5fbGlzdDsKIAogICAgIGlmICggZC0+c2NoZWRfaXRlbV9saXN0ID09IGl0ZW0gKQogICAgICAg
ICBkLT5zY2hlZF9pdGVtX2xpc3QgPSBpdGVtLT5uZXh0X2luX2xpc3Q7CkBAIC0yOTQsOCArMzA5
LDYgQEAgc3RhdGljIHZvaWQgc2NoZWRfZnJlZV9pdGVtKHN0cnVjdCBzY2hlZF9pdGVtICppdGVt
KQogICAgICAgICB9CiAgICAgfQogCi0gICAgaXRlbS0+dmNwdS0+c2NoZWRfaXRlbSA9IE5VTEw7
Ci0KICAgICBmcmVlX2NwdW1hc2tfdmFyKGl0ZW0tPmNwdV9oYXJkX2FmZmluaXR5KTsKICAgICBm
cmVlX2NwdW1hc2tfdmFyKGl0ZW0tPmNwdV9oYXJkX2FmZmluaXR5X3RtcCk7CiAgICAgZnJlZV9j
cHVtYXNrX3ZhcihpdGVtLT5jcHVfaGFyZF9hZmZpbml0eV9zYXZlZCk7CkBAIC0zMDQsMTcgKzMx
NywzNiBAQCBzdGF0aWMgdm9pZCBzY2hlZF9mcmVlX2l0ZW0oc3RydWN0IHNjaGVkX2l0ZW0gKml0
ZW0pCiAgICAgeGZyZWUoaXRlbSk7CiB9CiAKK3N0YXRpYyB2b2lkIHNjaGVkX2l0ZW1fYWRkX3Zj
cHUoc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0sIHN0cnVjdCB2Y3B1ICp2KQoreworICAgIHYtPnNj
aGVkX2l0ZW0gPSBpdGVtOworICAgIGlmICggIWl0ZW0tPnZjcHUgfHwgaXRlbS0+dmNwdS0+dmNw
dV9pZCA+IHYtPnZjcHVfaWQgKQorICAgIHsKKyAgICAgICAgaXRlbS0+dmNwdSA9IHY7CisgICAg
ICAgIGl0ZW0tPml0ZW1faWQgPSB2LT52Y3B1X2lkOworICAgIH0KK30KKwogc3RhdGljIHN0cnVj
dCBzY2hlZF9pdGVtICpzY2hlZF9hbGxvY19pdGVtKHN0cnVjdCB2Y3B1ICp2KQogewogICAgIHN0
cnVjdCBzY2hlZF9pdGVtICppdGVtLCAqKnByZXZfaXRlbTsKICAgICBzdHJ1Y3QgZG9tYWluICpk
ID0gdi0+ZG9tYWluOwogCisgICAgZm9yX2VhY2hfc2NoZWRfaXRlbSAoIGQsIGl0ZW0gKQorICAg
ICAgICBpZiAoIGl0ZW0tPnZjcHUtPnZjcHVfaWQgLyBzY2hlZF9ncmFudWxhcml0eSA9PQorICAg
ICAgICAgICAgIHYtPnZjcHVfaWQgLyBzY2hlZF9ncmFudWxhcml0eSApCisgICAgICAgICAgICBi
cmVhazsKKworICAgIGlmICggaXRlbSApCisgICAgeworICAgICAgICBzY2hlZF9pdGVtX2FkZF92
Y3B1KGl0ZW0sIHYpOworICAgICAgICByZXR1cm4gaXRlbTsKKyAgICB9CisKICAgICBpZiAoIChp
dGVtID0geHphbGxvYyhzdHJ1Y3Qgc2NoZWRfaXRlbSkpID09IE5VTEwgKQogICAgICAgICByZXR1
cm4gTlVMTDsKIAotICAgIHYtPnNjaGVkX2l0ZW0gPSBpdGVtOwotICAgIGl0ZW0tPnZjcHUgPSB2
OwotICAgIGl0ZW0tPml0ZW1faWQgPSB2LT52Y3B1X2lkOworICAgIHNjaGVkX2l0ZW1fYWRkX3Zj
cHUoaXRlbSwgdik7CiAgICAgaXRlbS0+ZG9tYWluID0gZDsKIAogICAgIGZvciAoIHByZXZfaXRl
bSA9ICZkLT5zY2hlZF9pdGVtX2xpc3Q7ICpwcmV2X2l0ZW07CkBAIC0zMzUsNyArMzY3LDcgQEAg
c3RhdGljIHN0cnVjdCBzY2hlZF9pdGVtICpzY2hlZF9hbGxvY19pdGVtKHN0cnVjdCB2Y3B1ICp2
KQogICAgIHJldHVybiBpdGVtOwogCiAgZmFpbDoKLSAgICBzY2hlZF9mcmVlX2l0ZW0oaXRlbSk7
CisgICAgc2NoZWRfZnJlZV9pdGVtKGl0ZW0sIHYpOwogICAgIHJldHVybiBOVUxMOwogfQogCkBA
IC0zNzcsOCArNDA5LDYgQEAgaW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNwdSAqdikKICAg
ICBlbHNlCiAgICAgICAgIHByb2Nlc3NvciA9IHNjaGVkX3NlbGVjdF9pbml0aWFsX2NwdSh2KTsK
IAotICAgIHNjaGVkX3NldF9yZXMoaXRlbSwgcGVyX2NwdShzY2hlZF9yZXMsIHByb2Nlc3Nvcikp
OwotCiAgICAgLyogSW5pdGlhbGlzZSB0aGUgcGVyLXZjcHUgdGltZXJzLiAqLwogICAgIGluaXRf
dGltZXIoJnYtPnBlcmlvZGljX3RpbWVyLCB2Y3B1X3BlcmlvZGljX3RpbWVyX2ZuLAogICAgICAg
ICAgICAgICAgdiwgdi0+cHJvY2Vzc29yKTsKQEAgLTM4NywxMCArNDE3LDIyIEBAIGludCBzY2hl
ZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAgICAgaW5pdF90aW1lcigmdi0+cG9sbF90aW1l
ciwgcG9sbF90aW1lcl9mbiwKICAgICAgICAgICAgICAgIHYsIHYtPnByb2Nlc3Nvcik7CiAKKyAg
ICAvKiBJZiB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgdmNwdSBvZiB0aGUgaXRlbSB3ZSBhcmUgZG9u
ZS4gKi8KKyAgICBpZiAoIGl0ZW0tPnByaXYgIT0gTlVMTCApCisgICAgeworICAgICAgICAvKiBX
ZSBjYW4gcmVseSBvbiBwcmV2aW91cyB2Y3B1IHRvIGV4aXN0LiAqLworICAgICAgICB2LT5wcm9j
ZXNzb3IgPSBjcHVtYXNrX25leHQoZC0+dmNwdVt2LT52Y3B1X2lkIC0gMV0tPnByb2Nlc3NvciwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGl0ZW0tPnJlcy0+Y3B1cyk7Cisg
ICAgICAgIHJldHVybiAwOworICAgIH0KKworICAgIC8qIFRoZSBmaXJzdCB2Y3B1IG9mIGFuIGl0
ZW0gY2FuIGJlIHNldCB2aWEgc2NoZWRfc2V0X3JlcygpLiAqLworICAgIHNjaGVkX3NldF9yZXMo
aXRlbSwgcGVyX2NwdShzY2hlZF9yZXMsIHByb2Nlc3NvcikpOworCiAgICAgaXRlbS0+cHJpdiA9
IHNjaGVkX2FsbG9jX3ZkYXRhKGRvbV9zY2hlZHVsZXIoZCksIGl0ZW0sIGQtPnNjaGVkX3ByaXYp
OwogICAgIGlmICggaXRlbS0+cHJpdiA9PSBOVUxMICkKICAgICB7Ci0gICAgICAgIHNjaGVkX2Zy
ZWVfaXRlbShpdGVtKTsKKyAgICAgICAgc2NoZWRfZnJlZV9pdGVtKGl0ZW0sIHYpOwogICAgICAg
ICByZXR1cm4gMTsKICAgICB9CiAKQEAgLTU0NCw5ICs1ODYsMTYgQEAgdm9pZCBzY2hlZF9kZXN0
cm95X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAgICAga2lsbF90aW1lcigmdi0+cG9sbF90aW1lcik7
CiAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9ib29sKHYtPmlzX3VyZ2VudCkgKQogICAgICAgICBh
dG9taWNfZGVjKCZwZXJfY3B1KHNjaGVkX3Jlcywgdi0+cHJvY2Vzc29yKS0+dXJnZW50X2NvdW50
KTsKLSAgICBzY2hlZF9yZW1vdmVfaXRlbSh2Y3B1X3NjaGVkdWxlcih2KSwgaXRlbSk7Ci0gICAg
c2NoZWRfZnJlZV92ZGF0YSh2Y3B1X3NjaGVkdWxlcih2KSwgaXRlbS0+cHJpdik7Ci0gICAgc2No
ZWRfZnJlZV9pdGVtKGl0ZW0pOworICAgIC8qCisgICAgICogVmNwdXMgYXJlIGJlaW5nIGRlc3Ry
b3llZCB0b3AtZG93bi4gU28gYmVpbmcgdGhlIGZpcnN0IHZjcHUgb2YgYW4gaXRlbQorICAgICAq
IGlzIHRoZSBzYW1lIGFzIGJlaW5nIHRoZSBvbmx5IG9uZS4KKyAgICAgKi8KKyAgICBpZiAoIGl0
ZW0tPnZjcHUgPT0gdiApCisgICAgeworICAgICAgICBzY2hlZF9yZW1vdmVfaXRlbSh2Y3B1X3Nj
aGVkdWxlcih2KSwgaXRlbSk7CisgICAgICAgIHNjaGVkX2ZyZWVfdmRhdGEodmNwdV9zY2hlZHVs
ZXIodiksIGl0ZW0tPnByaXYpOworICAgICAgICBzY2hlZF9mcmVlX2l0ZW0oaXRlbSwgdik7Cisg
ICAgfQogfQogCiBpbnQgc2NoZWRfaW5pdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgaW50IHBv
b2xpZCkKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
