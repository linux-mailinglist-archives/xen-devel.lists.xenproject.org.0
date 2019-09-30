Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38555C1AEE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 07:24:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEo8H-00023v-8a; Mon, 30 Sep 2019 05:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEo8F-00022T-At
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 05:21:59 +0000
X-Inumbo-ID: 300de21a-e342-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 300de21a-e342-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 05:21:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B7C3B061;
 Mon, 30 Sep 2019 05:21:40 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 07:21:22 +0200
Message-Id: <20190930052135.11257-7-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190930052135.11257-1-jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 06/19] xen/sched: add a percpu resource index
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

QWRkIGEgcGVyY3B1IHZhcmlhYmxlIGhvbGRpbmcgdGhlIGluZGV4IG9mIHRoZSBjcHUgaW4gdGhl
IGN1cnJlbnQKc2NoZWRfcmVzb3VyY2Ugc3RydWN0dXJlLiBUaGlzIGluZGV4IGlzIHVzZWQgdG8g
Z2V0IHRoZSBjb3JyZWN0IHZjcHUKb2YgYSBzY2hlZF91bml0IG9uIGEgc3BlY2lmaWMgY3B1LgoK
Rm9yIG5vdyB0aGlzIGluZGV4IHdpbGwgYmUgemVybyBmb3IgYWxsIGNwdXMsIGJ1dCB3aXRoIGNv
cmUgc2NoZWR1bGluZwppdCB3aWxsIGJlIHBvc3NpYmxlIHRvIGhhdmUgaGlnaGVyIHZhbHVlcywg
dG9vLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZp
ZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KLS0tClJGQyBWMjog
bmV3IHBhdGNoIChjYXJ2ZWQgb3V0IGZyb20gUkZDIFYxIHBhdGNoIDQ5KQpWNDoKLSBtYWtlIGZ1
bmN0aW9uIHBhcmFtZXRlciBjb25zdCAoSmFuIEJldWxpY2gpCi0tLQogeGVuL2NvbW1vbi9zY2hl
ZHVsZS5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDM3MDAyYjRjMGUuLmM4ZTI5OTk0MDcgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAg
LTc3LDYgKzc3LDcgQEAgc3RhdGljIHZvaWQgcG9sbF90aW1lcl9mbih2b2lkICpkYXRhKTsKIC8q
IFRoaXMgaXMgZ2xvYmFsIGZvciBub3cgc28gdGhhdCBwcml2YXRlIGltcGxlbWVudGF0aW9ucyBj
YW4gcmVhY2ggaXQgKi8KIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzY2hlZHVsZXIgKiwgc2NoZWR1
bGVyKTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAq
LCBzY2hlZF9yZXMpOworc3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVk
IGludCwgc2NoZWRfcmVzX2lkeCk7CiAKIC8qIFNjcmF0Y2ggc3BhY2UgZm9yIGNwdW1hc2tzLiAq
LwogREVGSU5FX1BFUl9DUFUoY3B1bWFza190LCBjcHVtYXNrX3NjcmF0Y2gpOwpAQCAtMTQ0LDYg
KzE0NSwxMiBAQCBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9pZGxlX29wcyA9IHsKICAg
ICAuc3dpdGNoX3NjaGVkICAgPSBzY2hlZF9pZGxlX3N3aXRjaF9zY2hlZCwKIH07CiAKK3N0YXRp
YyBpbmxpbmUgc3RydWN0IHZjcHUgKnNjaGVkX3VuaXQydmNwdV9jcHUoY29uc3Qgc3RydWN0IHNj
aGVkX3VuaXQgKnVuaXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBjcHUpCit7CisgICAgcmV0dXJuIHVuaXQtPmRvbWFpbi0+dmNw
dVt1bml0LT51bml0X2lkICsgcGVyX2NwdShzY2hlZF9yZXNfaWR4LCBjcHUpXTsKK30KKwogc3Rh
dGljIGlubGluZSBzdHJ1Y3Qgc2NoZWR1bGVyICpkb21fc2NoZWR1bGVyKGNvbnN0IHN0cnVjdCBk
b21haW4gKmQpCiB7CiAgICAgaWYgKCBsaWtlbHkoZC0+Y3B1cG9vbCAhPSBOVUxMKSApCkBAIC0y
MDMwLDcgKzIwMzcsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9zbGF2ZSh2b2lkKQogCiAgICAgcGNw
dV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7CiAKLSAgICBzY2hlZF9jb250ZXh0X3N3
aXRjaCh2cHJldiwgbmV4dC0+dmNwdV9saXN0LCBub3cpOworICAgIHNjaGVkX2NvbnRleHRfc3dp
dGNoKHZwcmV2LCBzY2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksIG5vdyk7CiB9CiAKIC8q
CkBAIC0yMDkxLDcgKzIwOTgsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lkKQogCiAgICAg
cGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7CiAKLSAgICB2bmV4dCA9IG5leHQt
PnZjcHVfbGlzdDsKKyAgICB2bmV4dCA9IHNjaGVkX3VuaXQydmNwdV9jcHUobmV4dCwgY3B1KTsK
ICAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgdm5leHQsIG5vdyk7CiB9CiAKLS0gCjIu
MTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
