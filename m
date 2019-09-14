Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA456B2AB2
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 10:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i93of-0000Ia-GL; Sat, 14 Sep 2019 08:54:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i93oc-0000F5-M9
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 08:53:58 +0000
X-Inumbo-ID: 0fccd2db-d6cd-11e9-95c1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0fccd2db-d6cd-11e9-95c1-12813bfff9fa;
 Sat, 14 Sep 2019 08:53:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5668B66D;
 Sat, 14 Sep 2019 08:53:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 10:52:27 +0200
Message-Id: <20190914085251.18816-24-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 23/47] xen/sched: switch sched_move_irqs() to
 take sched_unit as parameter
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

c2NoZWRfbW92ZV9pcnFzKCkgc2hvdWxkIHdvcmsgb24gYSBzY2hlZF91bml0IGFzIHRoYXQgaXMg
dGhlIHVuaXQKbW92ZWQgYmV0d2VlbiBjcHVzLgoKUmVuYW1lIHRoZSBjdXJyZW50IGZ1bmN0aW9u
IHRvIHZjcHVfbW92ZV9pcnFzKCkgYXMgaXQgaXMgc3RpbGwgbmVlZGVkCmluIHNjaGVkdWxlKCku
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVu
L2NvbW1vbi9zY2hlZHVsZS5jIHwgMTggKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggMjI3MjE5MmQ0OS4u
OWM0MWIyZGQ0ZCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWR1bGUuYwpAQCAtNDc0LDEyICs0NzQsMjAgQEAgaW50IHNjaGVkX2luaXRfdmNw
dShzdHJ1Y3QgdmNwdSAqdikKICAgICByZXR1cm4gMDsKIH0KIAotc3RhdGljIHZvaWQgc2NoZWRf
bW92ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHZvaWQgdmNwdV9tb3ZlX2lycXMoc3Ry
dWN0IHZjcHUgKnYpCiB7CiAgICAgYXJjaF9tb3ZlX2lycXModik7CiAgICAgZXZ0Y2huX21vdmVf
cGlycXModik7CiB9CiAKK3N0YXRpYyB2b2lkIHNjaGVkX21vdmVfaXJxcyhzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCkKK3sKKyAgICBzdHJ1Y3QgdmNwdSAqdjsKKworICAgIGZvcl9lYWNoX3NjaGVk
X3VuaXRfdmNwdSAoIHVuaXQsIHYgKQorICAgICAgICB2Y3B1X21vdmVfaXJxcyh2KTsKK30KKwog
aW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpj
KQogewogICAgIHN0cnVjdCB2Y3B1ICp2OwpAQCAtNTU5LDcgKzU2Nyw3IEBAIGludCBzY2hlZF9t
b3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKIAogICAgICAg
ICB2LT5zY2hlZF91bml0LT5wcml2ID0gdmNwdV9wcml2W3YtPnZjcHVfaWRdOwogICAgICAgICBp
ZiAoICFkLT5pc19keWluZyApCi0gICAgICAgICAgICBzY2hlZF9tb3ZlX2lycXModik7CisgICAg
ICAgICAgICBzY2hlZF9tb3ZlX2lycXModi0+c2NoZWRfdW5pdCk7CiAKICAgICAgICAgbmV3X3Ag
PSBjcHVtYXNrX2N5Y2xlKG5ld19wLCBjLT5jcHVfdmFsaWQpOwogCkBAIC04NTIsNyArODYwLDcg
QEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKICAgICBz
Y2hlZF9zcGluX3VubG9ja19kb3VibGUob2xkX2xvY2ssIG5ld19sb2NrLCBmbGFncyk7CiAKICAg
ICBpZiAoIG9sZF9jcHUgIT0gbmV3X2NwdSApCi0gICAgICAgIHNjaGVkX21vdmVfaXJxcyh2KTsK
KyAgICAgICAgc2NoZWRfbW92ZV9pcnFzKHYtPnNjaGVkX3VuaXQpOwogCiAgICAgLyogV2FrZSBv
biBuZXcgQ1BVLiAqLwogICAgIHZjcHVfd2FrZSh2KTsKQEAgLTkxNyw3ICs5MjUsNyBAQCB2b2lk
IHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICBzcGluX3Vu
bG9ja19pcnEobG9jayk7CiAKICAgICAgICAgaWYgKCBvbGRfY3B1ICE9IHYtPnByb2Nlc3NvciAp
Ci0gICAgICAgICAgICBzY2hlZF9tb3ZlX2lycXModik7CisgICAgICAgICAgICBzY2hlZF9tb3Zl
X2lycXModi0+c2NoZWRfdW5pdCk7CiAgICAgfQogCiAgICAgZG9tYWluX3VwZGF0ZV9ub2RlX2Fm
ZmluaXR5KGQpOwpAQCAtMTczNiw3ICsxNzQ0LDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9p
ZCkKICAgICBzdG9wX3RpbWVyKCZwcmV2LT52Y3B1X2xpc3QtPnBlcmlvZGljX3RpbWVyKTsKIAog
ICAgIGlmICggbmV4dF9zbGljZS5taWdyYXRlZCApCi0gICAgICAgIHNjaGVkX21vdmVfaXJxcyhu
ZXh0LT52Y3B1X2xpc3QpOworICAgICAgICB2Y3B1X21vdmVfaXJxcyhuZXh0LT52Y3B1X2xpc3Qp
OwogCiAgICAgdmNwdV9wZXJpb2RpY190aW1lcl93b3JrKG5leHQtPnZjcHVfbGlzdCk7CiAKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
