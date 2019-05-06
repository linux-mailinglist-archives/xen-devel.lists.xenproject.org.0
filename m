Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62734144BA
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 08:59:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYg-00025y-WF; Mon, 06 May 2019 06:57:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYd-0001z1-H0
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:03 +0000
X-Inumbo-ID: 25092881-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 25092881-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD36BAF2D;
 Mon,  6 May 2019 06:56:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:26 +0200
Message-Id: <20190506065644.7415-28-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 27/45] xen/sched: switch
 sched_move_irqs() to take sched_item as parameter
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

c2NoZWRfbW92ZV9pcnFzKCkgc2hvdWxkIHdvcmsgb24gYSBzY2hlZF9pdGVtIGFzIHRoYXQgaXMg
dGhlIGl0ZW0KbW92ZWQgYmV0d2VlbiBjcHVzLgoKUmVuYW1lIHRoZSBjdXJyZW50IGZ1bmN0aW9u
IHRvIHZjcHVfbW92ZV9pcnFzKCkgYXMgaXQgaXMgc3RpbGwgbmVlZGVkCmluIHNjaGVkdWxlKCku
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVu
L2NvbW1vbi9zY2hlZHVsZS5jIHwgMTggKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggZTlkN2U0MzdhYy4u
NTM2OGQ2NmNmYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWR1bGUuYwpAQCAtNDA2LDEyICs0MDYsMjAgQEAgaW50IHNjaGVkX2luaXRfdmNw
dShzdHJ1Y3QgdmNwdSAqdikKICAgICByZXR1cm4gMDsKIH0KIAotc3RhdGljIHZvaWQgc2NoZWRf
bW92ZV9pcnFzKHN0cnVjdCB2Y3B1ICp2KQorc3RhdGljIHZvaWQgdmNwdV9tb3ZlX2lycXMoc3Ry
dWN0IHZjcHUgKnYpCiB7CiAgICAgYXJjaF9tb3ZlX2lycXModik7CiAgICAgZXZ0Y2huX21vdmVf
cGlycXModik7CiB9CiAKK3N0YXRpYyB2b2lkIHNjaGVkX21vdmVfaXJxcyhzdHJ1Y3Qgc2NoZWRf
aXRlbSAqaXRlbSkKK3sKKyAgICBzdHJ1Y3QgdmNwdSAqdjsKKworICAgIGZvcl9lYWNoX3NjaGVk
X2l0ZW1fdmNwdSggaXRlbSwgdiApCisgICAgICAgIHZjcHVfbW92ZV9pcnFzKHYpOworfQorCiBp
bnQgc2NoZWRfbW92ZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMp
CiB7CiAgICAgc3RydWN0IHZjcHUgKnY7CkBAIC00OTEsNyArNDk5LDcgQEAgaW50IHNjaGVkX21v
dmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29sICpjKQogCiAgICAgICAg
IHYtPnNjaGVkX2l0ZW0tPnByaXYgPSB2Y3B1X3ByaXZbdi0+dmNwdV9pZF07CiAgICAgICAgIGlm
ICggIWQtPmlzX2R5aW5nICkKLSAgICAgICAgICAgIHNjaGVkX21vdmVfaXJxcyh2KTsKKyAgICAg
ICAgICAgIHNjaGVkX21vdmVfaXJxcyh2LT5zY2hlZF9pdGVtKTsKIAogICAgICAgICBuZXdfcCA9
IGNwdW1hc2tfY3ljbGUobmV3X3AsIGMtPmNwdV92YWxpZCk7CiAKQEAgLTc4NCw3ICs3OTIsNyBA
QCBzdGF0aWMgdm9pZCB2Y3B1X21pZ3JhdGVfZmluaXNoKHN0cnVjdCB2Y3B1ICp2KQogICAgIHNj
aGVkX3NwaW5fdW5sb2NrX2RvdWJsZShvbGRfbG9jaywgbmV3X2xvY2ssIGZsYWdzKTsKIAogICAg
IGlmICggb2xkX2NwdSAhPSBuZXdfY3B1ICkKLSAgICAgICAgc2NoZWRfbW92ZV9pcnFzKHYpOwor
ICAgICAgICBzY2hlZF9tb3ZlX2lycXModi0+c2NoZWRfaXRlbSk7CiAKICAgICAvKiBXYWtlIG9u
IG5ldyBDUFUuICovCiAgICAgdmNwdV93YWtlKHYpOwpAQCAtODYyLDcgKzg3MCw3IEBAIHZvaWQg
cmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21haW4gKmQpCiAgICAgICAgIHNwaW5fdW5s
b2NrX2lycShsb2NrKTsKIAogICAgICAgICBpZiAoIG9sZF9jcHUgIT0gdi0+cHJvY2Vzc29yICkK
LSAgICAgICAgICAgIHNjaGVkX21vdmVfaXJxcyh2KTsKKyAgICAgICAgICAgIHNjaGVkX21vdmVf
aXJxcyh2LT5zY2hlZF9pdGVtKTsKICAgICB9CiAKICAgICBkb21haW5fdXBkYXRlX25vZGVfYWZm
aW5pdHkoZCk7CkBAIC0xNjM1LDcgKzE2NDMsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lk
KQogICAgIHN0b3BfdGltZXIoJnByZXYtPnZjcHUtPnBlcmlvZGljX3RpbWVyKTsKIAogICAgIGlm
ICggbmV4dF9zbGljZS5taWdyYXRlZCApCi0gICAgICAgIHNjaGVkX21vdmVfaXJxcyhuZXh0LT52
Y3B1KTsKKyAgICAgICAgdmNwdV9tb3ZlX2lycXMobmV4dC0+dmNwdSk7CiAKICAgICB2Y3B1X3Bl
cmlvZGljX3RpbWVyX3dvcmsobmV4dC0+dmNwdSk7CiAKLS0gCjIuMTYuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
