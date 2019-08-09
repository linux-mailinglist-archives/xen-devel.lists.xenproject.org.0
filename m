Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C087D72
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:01:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6M7-0006kV-Ey; Fri, 09 Aug 2019 14:58:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M0-0006Y8-B3
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:52 +0000
X-Inumbo-ID: 32421352-bab6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 32421352-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:58:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D79DEB0B3;
 Fri,  9 Aug 2019 14:58:49 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:19 +0200
Message-Id: <20190809145833.1020-35-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 34/48] xen/sched: add a percpu resource index
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
dG9vLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0K
UkZDIFYyOiBuZXcgcGF0Y2ggKGNhcnZlZCBvdXQgZnJvbSBSRkMgVjEgcGF0Y2ggNDkpCi0tLQog
eGVuL2NvbW1vbi9zY2hlZHVsZS5jIHwgMTEgKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGM2Y2QzNTdiYzguLjEzZDMz
OTI2NDAgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9u
L3NjaGVkdWxlLmMKQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIHZvaWQgcG9sbF90aW1lcl9mbih2
b2lkICpkYXRhKTsKIC8qIFRoaXMgaXMgZ2xvYmFsIGZvciBub3cgc28gdGhhdCBwcml2YXRlIGlt
cGxlbWVudGF0aW9ucyBjYW4gcmVhY2ggaXQgKi8KIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzY2hl
ZHVsZXIgKiwgc2NoZWR1bGVyKTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBz
Y2hlZF9yZXNvdXJjZSAqLCBzY2hlZF9yZXMpOworc3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHVuc2lnbmVkIGludCwgc2NoZWRfcmVzX2lkeCk7CiAKIC8qIFNjcmF0Y2ggc3BhY2Ug
Zm9yIGNwdW1hc2tzLiAqLwogREVGSU5FX1BFUl9DUFUoY3B1bWFza190LCBjcHVtYXNrX3NjcmF0
Y2gpOwpAQCAtMTMyLDYgKzEzMywxMiBAQCBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9p
ZGxlX29wcyA9IHsKICAgICAuc3dpdGNoX3NjaGVkICAgPSBzY2hlZF9pZGxlX3N3aXRjaF9zY2hl
ZCwKIH07CiAKK3N0YXRpYyBpbmxpbmUgc3RydWN0IHZjcHUgKnNjaGVkX3VuaXQydmNwdV9jcHUo
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUpCit7CisgICAgcmV0dXJuIHVuaXQtPmRv
bWFpbi0+dmNwdVt1bml0LT51bml0X2lkICsgcGVyX2NwdShzY2hlZF9yZXNfaWR4LCBjcHUpXTsK
K30KKwogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2NoZWR1bGVyICpkb21fc2NoZWR1bGVyKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQpCiB7CiAgICAgaWYgKCBsaWtlbHkoZC0+Y3B1cG9vbCAhPSBOVUxM
KSApCkBAIC0xOTg4LDcgKzE5OTUsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9zbGF2ZSh2b2lkKQog
CiAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7CiAKLSAgICBzY2hlZF9j
b250ZXh0X3N3aXRjaCh2cHJldiwgbmV4dC0+dmNwdV9saXN0LCBub3cpOworICAgIHNjaGVkX2Nv
bnRleHRfc3dpdGNoKHZwcmV2LCBzY2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksIG5vdyk7
CiB9CiAKIC8qCkBAIC0yMDQ3LDcgKzIwNTQsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lk
KQogCiAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7CiAKLSAgICB2bmV4
dCA9IG5leHQtPnZjcHVfbGlzdDsKKyAgICB2bmV4dCA9IHNjaGVkX3VuaXQydmNwdV9jcHUobmV4
dCwgY3B1KTsKICAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgdm5leHQsIG5vdyk7CiB9
CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
