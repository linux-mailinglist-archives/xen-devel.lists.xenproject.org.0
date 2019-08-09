Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D29887D8B
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:03:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6MA-0006pP-BG; Fri, 09 Aug 2019 14:59:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6M0-0006Yd-Nz
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:52 +0000
X-Inumbo-ID: 30bbe6ef-bab6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30bbe6ef-bab6-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:58:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B76C4B0BA;
 Fri,  9 Aug 2019 14:58:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:58:08 +0200
Message-Id: <20190809145833.1020-24-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 23/48] xen/sched: switch sched_move_irqs() to
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
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggYjg3YWVjNzRiNy4u
ZmNkMDgzZDMxZCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWR1bGUuYwpAQCAtNDcwLDEyICs0NzAsMjAgQEAgaW50IHNjaGVkX2luaXRfdmNw
dShzdHJ1Y3QgdmNwdSAqdikKICAgICByZXR1cm4gMDsKIH0KIAotc3RhdGljIHZvaWQgc2NoZWRf
bW92ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHZvaWQgdmNwdV9tb3ZlX2lycXMoc3Ry
dWN0IHZjcHUgKnYpCiB7CiAgICAgYXJjaF9tb3ZlX2lycXModik7CiAgICAgZXZ0Y2huX21vdmVf
cGlycXModik7CiB9CiAKK3N0YXRpYyB2b2lkIHNjaGVkX21vdmVfaXJxcyhzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCkKK3sKKyAgICBzdHJ1Y3QgdmNwdSAqdjsKKworICAgIGZvcl9lYWNoX3NjaGVk
X3VuaXRfdmNwdSAoIHVuaXQsIHYgKQorICAgICAgICB2Y3B1X21vdmVfaXJxcyh2KTsKK30KKwog
aW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpj
KQogewogICAgIHN0cnVjdCB2Y3B1ICp2OwpAQCAtNTU1LDcgKzU2Myw3IEBAIGludCBzY2hlZF9t
b3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKIAogICAgICAg
ICB2LT5zY2hlZF91bml0LT5wcml2ID0gdmNwdV9wcml2W3YtPnZjcHVfaWRdOwogICAgICAgICBp
ZiAoICFkLT5pc19keWluZyApCi0gICAgICAgICAgICBzY2hlZF9tb3ZlX2lycXModik7CisgICAg
ICAgICAgICBzY2hlZF9tb3ZlX2lycXModi0+c2NoZWRfdW5pdCk7CiAKICAgICAgICAgbmV3X3Ag
PSBjcHVtYXNrX2N5Y2xlKG5ld19wLCBjLT5jcHVfdmFsaWQpOwogCkBAIC04NDgsNyArODU2LDcg
QEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2ZpbmlzaChzdHJ1Y3QgdmNwdSAqdikKICAgICBz
Y2hlZF9zcGluX3VubG9ja19kb3VibGUob2xkX2xvY2ssIG5ld19sb2NrLCBmbGFncyk7CiAKICAg
ICBpZiAoIG9sZF9jcHUgIT0gbmV3X2NwdSApCi0gICAgICAgIHNjaGVkX21vdmVfaXJxcyh2KTsK
KyAgICAgICAgc2NoZWRfbW92ZV9pcnFzKHYtPnNjaGVkX3VuaXQpOwogCiAgICAgLyogV2FrZSBv
biBuZXcgQ1BVLiAqLwogICAgIHZjcHVfd2FrZSh2KTsKQEAgLTkzMSw3ICs5MzksNyBAQCB2b2lk
IHJlc3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICBzcGluX3Vu
bG9ja19pcnEobG9jayk7CiAKICAgICAgICAgaWYgKCBvbGRfY3B1ICE9IHYtPnByb2Nlc3NvciAp
Ci0gICAgICAgICAgICBzY2hlZF9tb3ZlX2lycXModik7CisgICAgICAgICAgICBzY2hlZF9tb3Zl
X2lycXModi0+c2NoZWRfdW5pdCk7CiAgICAgfQogCiAgICAgZG9tYWluX3VwZGF0ZV9ub2RlX2Fm
ZmluaXR5KGQpOwpAQCAtMTcyNiw3ICsxNzM0LDcgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9p
ZCkKICAgICBzdG9wX3RpbWVyKCZwcmV2LT52Y3B1X2xpc3QtPnBlcmlvZGljX3RpbWVyKTsKIAog
ICAgIGlmICggbmV4dF9zbGljZS5taWdyYXRlZCApCi0gICAgICAgIHNjaGVkX21vdmVfaXJxcyhu
ZXh0LT52Y3B1X2xpc3QpOworICAgICAgICB2Y3B1X21vdmVfaXJxcyhuZXh0LT52Y3B1X2xpc3Qp
OwogCiAgICAgdmNwdV9wZXJpb2RpY190aW1lcl93b3JrKG5leHQtPnZjcHVfbGlzdCk7CiAKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
