Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9CBBFF8D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:03:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkGD-0003pB-PQ; Fri, 27 Sep 2019 07:01:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkGB-0003nF-Q1
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:01:47 +0000
X-Inumbo-ID: 920976c8-e0f4-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 920976c8-e0f4-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 07:01:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4BB6DB178;
 Fri, 27 Sep 2019 07:01:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:27 +0200
Message-Id: <20190927070050.12405-24-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 23/46] xen/sched: switch sched_move_irqs() to
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
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2Vk
LWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgotLS0KVjQ6Ci0gbWFrZSBw
YXJhbWV0ZXIgY29uc3QgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8
IDE4ICsrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGNlMDdiMmNmOTkuLjQ2ZjNjODVjYzUgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAg
LTQ4NSwxMiArNDg1LDIwIEBAIGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiAg
ICAgcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyB2b2lkIHNjaGVkX21vdmVfaXJxcyhzdHJ1Y3QgdmNw
dSAqdikKK3N0YXRpYyB2b2lkIHZjcHVfbW92ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KQogewogICAg
IGFyY2hfbW92ZV9pcnFzKHYpOwogICAgIGV2dGNobl9tb3ZlX3BpcnFzKHYpOwogfQogCitzdGF0
aWMgdm9pZCBzY2hlZF9tb3ZlX2lycXMoY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCit7
CisgICAgc3RydWN0IHZjcHUgKnY7CisKKyAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1
bml0LCB2ICkKKyAgICAgICAgdmNwdV9tb3ZlX2lycXModik7Cit9CisKIGludCBzY2hlZF9tb3Zl
X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKIHsKICAgICBzdHJ1
Y3QgdmNwdSAqdjsKQEAgLTU3MCw3ICs1NzgsNyBAQCBpbnQgc2NoZWRfbW92ZV9kb21haW4oc3Ry
dWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiAKICAgICAgICAgdi0+c2NoZWRfdW5p
dC0+cHJpdiA9IHZjcHVfcHJpdlt2LT52Y3B1X2lkXTsKICAgICAgICAgaWYgKCAhZC0+aXNfZHlp
bmcgKQotICAgICAgICAgICAgc2NoZWRfbW92ZV9pcnFzKHYpOworICAgICAgICAgICAgc2NoZWRf
bW92ZV9pcnFzKHYtPnNjaGVkX3VuaXQpOwogCiAgICAgICAgIG5ld19wID0gY3B1bWFza19jeWNs
ZShuZXdfcCwgYy0+Y3B1X3ZhbGlkKTsKIApAQCAtODYzLDcgKzg3MSw3IEBAIHN0YXRpYyB2b2lk
IHZjcHVfbWlncmF0ZV9maW5pc2goc3RydWN0IHZjcHUgKnYpCiAgICAgc2NoZWRfc3Bpbl91bmxv
Y2tfZG91YmxlKG9sZF9sb2NrLCBuZXdfbG9jaywgZmxhZ3MpOwogCiAgICAgaWYgKCBvbGRfY3B1
ICE9IG5ld19jcHUgKQotICAgICAgICBzY2hlZF9tb3ZlX2lycXModik7CisgICAgICAgIHNjaGVk
X21vdmVfaXJxcyh2LT5zY2hlZF91bml0KTsKIAogICAgIC8qIFdha2Ugb24gbmV3IENQVS4gKi8K
ICAgICB2Y3B1X3dha2Uodik7CkBAIC05MjgsNyArOTM2LDcgQEAgdm9pZCByZXN0b3JlX3ZjcHVf
YWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgc3Bpbl91bmxvY2tfaXJxKGxvY2sp
OwogCiAgICAgICAgIGlmICggb2xkX2NwdSAhPSB2LT5wcm9jZXNzb3IgKQotICAgICAgICAgICAg
c2NoZWRfbW92ZV9pcnFzKHYpOworICAgICAgICAgICAgc2NoZWRfbW92ZV9pcnFzKHYtPnNjaGVk
X3VuaXQpOwogICAgIH0KIAogICAgIGRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eShkKTsKQEAg
LTE3NDUsNyArMTc1Myw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCiAgICAgc3RvcF90
aW1lcigmcHJldi0+dmNwdV9saXN0LT5wZXJpb2RpY190aW1lcik7CiAKICAgICBpZiAoIG5leHRf
c2xpY2UubWlncmF0ZWQgKQotICAgICAgICBzY2hlZF9tb3ZlX2lycXMobmV4dC0+dmNwdV9saXN0
KTsKKyAgICAgICAgdmNwdV9tb3ZlX2lycXMobmV4dC0+dmNwdV9saXN0KTsKIAogICAgIHZjcHVf
cGVyaW9kaWNfdGltZXJfd29yayhuZXh0LT52Y3B1X2xpc3QpOwogCi0tIAoyLjE2LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
