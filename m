Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC5BFFA4
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:04:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkG8-0003iF-Qi; Fri, 27 Sep 2019 07:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkG6-0003gP-Pp
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:01:42 +0000
X-Inumbo-ID: 912360ac-e0f4-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 912360ac-e0f4-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 07:01:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2AE3FB176;
 Fri, 27 Sep 2019 07:01:00 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:23 +0200
Message-Id: <20190927070050.12405-20-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 19/46] xen: add sched_unit_pause_nosync() and
 sched_unit_unpause()
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNyZWRpdCBzY2hlZHVsZXIgY2FsbHMgdmNwdV9wYXVzZV9ub3N5bmMoKSBhbmQgdmNwdV91
bnBhdXNlKCkKdG9kYXkuIEFkZCBzY2hlZF91bml0X3BhdXNlX25vc3luYygpIGFuZCBzY2hlZF91
bml0X3VucGF1c2UoKSB0bwpwZXJmb3JtIHRoZSBzYW1lIG9wZXJhdGlvbnMgb24gc2NoZWR1bGVy
IHVuaXRzIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Ci0tLQpWNDoKLSBhZGQgdmNwdSBsb29wcyB0byBmdW5jdGlvbnMgKERhcmlvIEZhZ2dp
b2xpKQotIG1ha2UgdW5pdCBwYXJhbWV0ZXIgY29uc3QKLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2Ny
ZWRpdC5jICB8ICA2ICsrKy0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggfCAxNiArKysr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyBiL3hlbi9jb21t
b24vc2NoZWRfY3JlZGl0LmMKaW5kZXggZTcxMGIzYzZmYS4uMjFjM2EwMzNiOSAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRp
dC5jCkBAIC0xMDY1LDcgKzEwNjUsNyBAQCBjc2NoZWRfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0
IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAgICBpZiAoIHRlc3Rf
YW5kX2NsZWFyX2JpdChDU0NIRURfRkxBR19VTklUX1BBUktFRCwgJnN2Yy0+ZmxhZ3MpICkKICAg
ICB7CiAgICAgICAgIFNDSEVEX1NUQVRfQ1JBTksodW5pdF91bnBhcmspOwotICAgICAgICB2Y3B1
X3VucGF1c2Uoc3ZjLT51bml0LT52Y3B1X2xpc3QpOworICAgICAgICBzY2hlZF91bml0X3VucGF1
c2Uoc3ZjLT51bml0KTsKICAgICB9CiAKICAgICBzcGluX2xvY2tfaXJxKCZwcnYtPmxvY2spOwpA
QCAtMTUxNSw3ICsxNTE1LDcgQEAgY3NjaGVkX2FjY3Qodm9pZCogZHVtbXkpCiAgICAgICAgICAg
ICAgICAgICAgICAhdGVzdF9hbmRfc2V0X2JpdChDU0NIRURfRkxBR19VTklUX1BBUktFRCwgJnN2
Yy0+ZmxhZ3MpICkKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIFNDSEVE
X1NUQVRfQ1JBTksodW5pdF9wYXJrKTsKLSAgICAgICAgICAgICAgICAgICAgdmNwdV9wYXVzZV9u
b3N5bmMoc3ZjLT51bml0LT52Y3B1X2xpc3QpOworICAgICAgICAgICAgICAgICAgICBzY2hlZF91
bml0X3BhdXNlX25vc3luYyhzdmMtPnVuaXQpOwogICAgICAgICAgICAgICAgIH0KIAogICAgICAg
ICAgICAgICAgIC8qIExvd2VyIGJvdW5kIG9uIGNyZWRpdHMgKi8KQEAgLTE1MzksNyArMTUzOSw3
IEBAIGNzY2hlZF9hY2N0KHZvaWQqIGR1bW15KQogICAgICAgICAgICAgICAgICAgICAgKiBpZiBp
dCBpcyB3b2tlbiB1cCBoZXJlLgogICAgICAgICAgICAgICAgICAgICAgKi8KICAgICAgICAgICAg
ICAgICAgICAgU0NIRURfU1RBVF9DUkFOSyh1bml0X3VucGFyayk7Ci0gICAgICAgICAgICAgICAg
ICAgIHZjcHVfdW5wYXVzZShzdmMtPnVuaXQtPnZjcHVfbGlzdCk7CisgICAgICAgICAgICAgICAg
ICAgIHNjaGVkX3VuaXRfdW5wYXVzZShzdmMtPnVuaXQpOwogICAgICAgICAgICAgICAgICAgICBj
bGVhcl9iaXQoQ1NDSEVEX0ZMQUdfVU5JVF9QQVJLRUQsICZzdmMtPmZsYWdzKTsKICAgICAgICAg
ICAgICAgICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVu
L2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggMmI5ZDUwYjlmZS4uNDVhYzAzZjBmOCAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKQEAgLTQ2Niw2ICs0NjYsMjIgQEAgc3RhdGljIGlubGluZSBpbnQgc2NoZWRf
YWRqdXN0X2NwdXBvb2woY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqcywKICAgICByZXR1cm4gcy0+
YWRqdXN0X2dsb2JhbCA/IHMtPmFkanVzdF9nbG9iYWwocywgb3ApIDogMDsKIH0KIAorc3RhdGlj
IGlubGluZSB2b2lkIHNjaGVkX3VuaXRfcGF1c2Vfbm9zeW5jKGNvbnN0IHN0cnVjdCBzY2hlZF91
bml0ICp1bml0KQoreworICAgIHN0cnVjdCB2Y3B1ICp2OworCisgICAgZm9yX2VhY2hfc2NoZWRf
dW5pdF92Y3B1ICggdW5pdCwgdiApCisgICAgICAgIHZjcHVfcGF1c2Vfbm9zeW5jKHYpOworfQor
CitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfdW5pdF91bnBhdXNlKGNvbnN0IHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0KQoreworICAgIHN0cnVjdCB2Y3B1ICp2OworCisgICAgZm9yX2VhY2hfc2No
ZWRfdW5pdF92Y3B1ICggdW5pdCwgdiApCisgICAgICAgIHZjcHVfdW5wYXVzZSh2KTsKK30KKwog
I2RlZmluZSBSRUdJU1RFUl9TQ0hFRFVMRVIoeCkgc3RhdGljIGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKngjI19lbnRyeSBcCiAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS5zY2hlZHVsZXJzIikgPSAm
eDsKIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
