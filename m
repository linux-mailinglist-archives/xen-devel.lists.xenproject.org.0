Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A74132C45D
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQC-0004mw-4K; Tue, 28 May 2019 10:33:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ6-0004cV-17
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:26 +0000
X-Inumbo-ID: 03c3f0b6-8134-11e9-8085-979a0a1d31f8
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03c3f0b6-8134-11e9-8085-979a0a1d31f8;
 Tue, 28 May 2019 10:33:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D41FB033;
 Tue, 28 May 2019 10:33:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:25 +0200
Message-Id: <20190528103313.1343-13-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 12/60] xen/sched: switch vcpu_schedule_lock to
 unit_schedule_lock
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
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVuYW1lIHZjcHVfc2NoZWR1bGVfW3VuXWxvY2tbX2lycV0oKSB0byB1bml0X3NjaGVkdWxlX1t1
bl1sb2NrW19pcnFdKCkKYW5kIGxldCBpdCB0YWtlIGEgc2NoZWRfdW5pdCBwb2ludGVyIGluc3Rl
YWQgb2YgYSB2Y3B1IHBvaW50ZXIgYXMKcGFyYW1ldGVyLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMg
IHwgMTcgKysrKysrKystLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgfCA0MCAr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX251
bGwuYyAgICB8IDE0ICsrKysrKy0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWRfcnQuYyAgICAgIHwg
MTUgKysrKysrKy0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgNTAgKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmggfCAxMiArKysrKy0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRp
b25zKCspLCA3MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2Ny
ZWRpdC5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwppbmRleCBmZTRmYzVhYmIxLi43NGM4
NWRmMzM0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWRfY3JlZGl0LmMKQEAgLTkzMSw3ICs5MzEsOCBAQCBfX2NzY2hlZF92Y3B1X2Fj
Y3Rfc3RvcF9sb2NrZWQoc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsCiBzdGF0aWMgdm9pZAog
Y3NjaGVkX3ZjcHVfYWNjdChzdHJ1Y3QgY3NjaGVkX3ByaXZhdGUgKnBydiwgdW5zaWduZWQgaW50
IGNwdSkKIHsKLSAgICBzdHJ1Y3QgY3NjaGVkX3VuaXQgKiBjb25zdCBzdmMgPSBDU0NIRURfVU5J
VChjdXJyZW50LT5zY2hlZF91bml0KTsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqY3VycnVuaXQg
PSBjdXJyZW50LT5zY2hlZF91bml0OworICAgIHN0cnVjdCBjc2NoZWRfdW5pdCAqIGNvbnN0IHN2
YyA9IENTQ0hFRF9VTklUKGN1cnJ1bml0KTsKICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpv
cHMgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKIAogICAgIEFTU0VSVCggY3VycmVudC0+cHJv
Y2Vzc29yID09IGNwdSApOwpAQCAtOTY3LDcgKzk2OCw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qoc3Ry
dWN0IGNzY2hlZF9wcml2YXRlICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgewogICAgICAg
ICB1bnNpZ25lZCBpbnQgbmV3X2NwdTsKICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKLSAg
ICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKGN1cnJl
bnQsICZmbGFncyk7CisgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB1bml0X3NjaGVkdWxlX2xv
Y2tfaXJxc2F2ZShjdXJydW5pdCwgJmZsYWdzKTsKIAogICAgICAgICAvKgogICAgICAgICAgKiBJ
ZiBpdCdzIGJlZW4gYWN0aXZlIGEgd2hpbGUsIGNoZWNrIGlmIHdlJ2QgYmUgYmV0dGVyIG9mZgpA
QCAtOTc2LDcgKzk3Nyw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qoc3RydWN0IGNzY2hlZF9wcml2YXRl
ICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgICAqLwogICAgICAgICBuZXdfY3B1ID0g
X2NzY2hlZF9jcHVfcGljayhvcHMsIGN1cnJlbnQsIDApOwogCi0gICAgICAgIHZjcHVfc2NoZWR1
bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIGN1cnJlbnQpOworICAgICAgICB1bml0
X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCBjdXJydW5pdCk7CiAKICAg
ICAgICAgaWYgKCBuZXdfY3B1ICE9IGNwdSApCiAgICAgICAgIHsKQEAgLTEwMjgsMTkgKzEwMjks
MTkgQEAgY3NjaGVkX3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgQlVHX09OKCBpc19pZGxlX3ZjcHUodmMpICk7CiAK
ICAgICAvKiBjc2NoZWRfcmVzX3BpY2soKSBsb29rcyBpbiB2Yy0+cHJvY2Vzc29yJ3MgcnVucSwg
c28gd2UgbmVlZCB0aGUgbG9jay4gKi8KLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2ly
cSh2Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICB1
bml0LT5yZXMgPSBjc2NoZWRfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2Yy0+cHJvY2Vzc29y
ID0gdW5pdC0+cmVzLT5wcm9jZXNzb3I7CiAKICAgICBzcGluX3VubG9ja19pcnEobG9jayk7CiAK
LSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgbG9jayA9IHVuaXRf
c2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICBpZiAoICFfX3ZjcHVfb25fcnVucShzdmMp
ICYmIHZjcHVfcnVubmFibGUodmMpICYmICF2Yy0+aXNfcnVubmluZyApCiAgICAgICAgIHJ1bnFf
aW5zZXJ0KHN2Yyk7CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdmMpOwor
ICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB1bml0KTsKIAogICAgIFNDSEVEX1NU
QVRfQ1JBTksodmNwdV9pbnNlcnQpOwogfQpAQCAtMjEzNywxMiArMjEzOCwxMiBAQCBjc2NoZWRf
ZHVtcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiAgICAgICAgICAgICBzcGlubG9ja190
ICpsb2NrOwogCiAgICAgICAgICAgICBzdmMgPSBsaXN0X2VudHJ5KGl0ZXJfc3ZjLCBzdHJ1Y3Qg
Y3NjaGVkX3VuaXQsIGFjdGl2ZV92Y3B1X2VsZW0pOwotICAgICAgICAgICAgbG9jayA9IHZjcHVf
c2NoZWR1bGVfbG9jayhzdmMtPnZjcHUpOworICAgICAgICAgICAgbG9jayA9IHVuaXRfc2NoZWR1
bGVfbG9jayhzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogCiAgICAgICAgICAgICBwcmludGsoIlx0
JTNkOiAiLCArK2xvb3ApOwogICAgICAgICAgICAgY3NjaGVkX2R1bXBfdmNwdShzdmMpOwogCi0g
ICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUpOworICAgICAg
ICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2sobG9jaywgc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsK
ICAgICAgICAgfQogICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQy
LmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwppbmRleCA5OWU5OTNiMzJmLi41NjJlNzNk
OTllIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4vY29t
bW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMTcxLDcgKzE3MSw3IEBACiAgKiAtIHJ1bnF1ZXVlIGxv
Y2sKICAqICArIGl0IGlzIHBlci1ydW5xdWV1ZSwgc286CiAgKiAgICogY3B1cyBpbiBhIHJ1bnF1
ZXVlIHRha2UgdGhlIHJ1bnF1ZXVlIGxvY2ssIHdoZW4gdXNpbmcKLSAqICAgICBwY3B1X3NjaGVk
dWxlX2xvY2soKSAvIHZjcHVfc2NoZWR1bGVfbG9jaygpIChhbmQgZnJpZW5kcyksCisgKiAgICAg
cGNwdV9zY2hlZHVsZV9sb2NrKCkgLyB1bml0X3NjaGVkdWxlX2xvY2soKSAoYW5kIGZyaWVuZHMp
LAogICogICAqIGEgY3B1IG1heSAodHJ5IHRvKSB0YWtlIGEgInJlbW90ZSIgcnVucXVldWUgbG9j
aywgZS5nLiwgZm9yCiAgKiAgICAgbG9hZCBiYWxhbmNpbmc7CiAgKiAgKyBzZXJpYWxpemVzIHJ1
bnF1ZXVlIG9wZXJhdGlvbnMgKHJlbW92aW5nIGFuZCBpbnNlcnRpbmcgdmNwdXMpOwpAQCAtMTg5
MCw3ICsxODkwLDcgQEAgdW5wYXJrX3BhcmtlZF92Y3B1cyhjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIHN0cnVjdCBsaXN0X2hlYWQgKnZjcHVzKQogICAgICAgICB1bnNpZ25lZCBsb25nIGZs
YWdzOwogICAgICAgICBzX3RpbWVfdCBub3c7CiAKLSAgICAgICAgbG9jayA9IHZjcHVfc2NoZWR1
bGVfbG9ja19pcnFzYXZlKHN2Yy0+dmNwdSwgJmZsYWdzKTsKKyAgICAgICAgbG9jayA9IHVuaXRf
c2NoZWR1bGVfbG9ja19pcnFzYXZlKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCwgJmZsYWdzKTsKIAog
ICAgICAgICBfX2NsZWFyX2JpdChfVlBGX3BhcmtlZCwgJnN2Yy0+dmNwdS0+cGF1c2VfZmxhZ3Mp
OwogICAgICAgICBpZiAoIHVubGlrZWx5KHN2Yy0+ZmxhZ3MgJiBDU0ZMQUdfc2NoZWR1bGVkKSAp
CkBAIC0xOTIzLDcgKzE5MjMsNyBAQCB1bnBhcmtfcGFya2VkX3ZjcHVzKGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0IGxpc3RfaGVhZCAqdmNwdXMpCiAgICAgICAgIH0KICAgICAg
ICAgbGlzdF9kZWxfaW5pdCgmc3ZjLT5wYXJrZWRfZWxlbSk7CiAKLSAgICAgICAgdmNwdV9zY2hl
ZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgc3ZjLT52Y3B1KTsKKyAgICAgICAg
dW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgc3ZjLT52Y3B1LT5z
Y2hlZF91bml0KTsKICAgICB9CiB9CiAKQEAgLTIxNjIsNyArMjE2Miw3IEBAIGNzY2hlZDJfY29u
dGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0
ICp1bml0KQogewogICAgIHN0cnVjdCB2Y3B1ICp2YyA9IHVuaXQtPnZjcHU7CiAgICAgc3RydWN0
IGNzY2hlZDJfdW5pdCAqIGNvbnN0IHN2YyA9IGNzY2hlZDJfdW5pdCh1bml0KTsKLSAgICBzcGlu
bG9ja190ICpsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgc3BpbmxvY2tf
dCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgICAgc190aW1lX3Qgbm93
ID0gTk9XKCk7CiAgICAgTElTVF9IRUFEKHdlcmVfcGFya2VkKTsKIApAQCAtMjE5NCw3ICsyMTk0
LDcgQEAgY3NjaGVkMl9jb250ZXh0X3NhdmVkKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgZWxzZSBpZiAoICFpc19pZGxlX3ZjcHUodmMp
ICkKICAgICAgICAgdXBkYXRlX2xvYWQob3BzLCBzdmMtPnJxZCwgc3ZjLCAtMSwgbm93KTsKIAot
ICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9zY2hlZHVs
ZV91bmxvY2tfaXJxKGxvY2ssIHVuaXQpOwogCiAgICAgdW5wYXJrX3BhcmtlZF92Y3B1cyhvcHMs
ICZ3ZXJlX3BhcmtlZCk7CiB9CkBAIC0yODQ3LDE0ICsyODQ3LDE0IEBAIGNzY2hlZDJfZG9tX2Nu
dGwoCiAgICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgc3RydWN0IGNzY2hlZDJfdW5pdCAqc3ZjID0gY3NjaGVkMl91bml0KHYt
PnNjaGVkX3VuaXQpOwotICAgICAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2Y3B1X3Nj
aGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICBzcGlubG9ja190ICpsb2Nr
ID0gdW5pdF9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAKICAgICAgICAg
ICAgICAgICBBU1NFUlQoc3ZjLT5ycWQgPT0gYzJycWQob3BzLCBzdmMtPnZjcHUtPnByb2Nlc3Nv
cikpOwogCiAgICAgICAgICAgICAgICAgc3ZjLT53ZWlnaHQgPSBzZG9tLT53ZWlnaHQ7CiAgICAg
ICAgICAgICAgICAgdXBkYXRlX21heF93ZWlnaHQoc3ZjLT5ycWQsIHN2Yy0+d2VpZ2h0LCBvbGRf
d2VpZ2h0KTsKIAotICAgICAgICAgICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIHN2
Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2sobG9jaywgc3Zj
LT52Y3B1LT5zY2hlZF91bml0KTsKICAgICAgICAgICAgIH0KICAgICAgICAgfQogICAgICAgICAv
KiBDYXAgKi8KQEAgLTI4ODUsNyArMjg4NSw3IEBAIGNzY2hlZDJfZG9tX2NudGwoCiAgICAgICAg
ICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgc3ZjID0gY3NjaGVkMl91bml0KHYtPnNjaGVkX3VuaXQpOwotICAgICAgICAgICAgICAgIGxv
Y2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICBsb2Nr
ID0gdW5pdF9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgICAg
ICAgICAgLyoKICAgICAgICAgICAgICAgICAgKiBUb28gc21hbGwgcXVvdGFzIHdvdWxkIGluIHRo
ZW9yeSBjYXVzZSBhIGxvdCBvZiBvdmVyaGVhZCwKICAgICAgICAgICAgICAgICAgKiB3aGljaCB0
aGVuIHdvbid0IGhhcHBlbiBiZWNhdXNlLCBpbiBjc2NoZWQyX3J1bnRpbWUoKSwKQEAgLTI4OTMs
NyArMjg5Myw3IEBAIGNzY2hlZDJfZG9tX2NudGwoCiAgICAgICAgICAgICAgICAgICovCiAgICAg
ICAgICAgICAgICAgc3ZjLT5idWRnZXRfcXVvdGEgPSBtYXgoc2RvbS0+dG90X2J1ZGdldCAvIHNk
b20tPm5yX3ZjcHVzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENT
Q0hFRDJfTUlOX1RJTUVSKTsKLSAgICAgICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9jayhs
b2NrLCBzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrKGxv
Y2ssIHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgICAgICB9CiAKICAgICAgICAgICAg
IGlmICggc2RvbS0+Y2FwID09IDAgKQpAQCAtMjkyOCw3ICsyOTI4LDcgQEAgY3NjaGVkMl9kb21f
Y250bCgKICAgICAgICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgICBzdmMgPSBjc2NoZWQyX3VuaXQodi0+c2NoZWRf
dW5pdCk7Ci0gICAgICAgICAgICAgICAgICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2soc3Zj
LT52Y3B1KTsKKyAgICAgICAgICAgICAgICAgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9jayhz
dmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgICAgICAgICBpZiAoIHYtPmlzX3J1
bm5pbmcgKQogICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgY3B1ID0gdi0+cHJvY2Vzc29yOwpAQCAtMjk1OSw3ICsyOTU5LDcgQEAgY3Nj
aGVkMl9kb21fY250bCgKICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9yYWlzZV9zb2Z0aXJx
KGNwdSwgU0NIRURVTEVfU09GVElSUSk7CiAgICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAg
ICAgICAgICAgICAgc3ZjLT5idWRnZXQgPSAwOwotICAgICAgICAgICAgICAgICAgICB2Y3B1X3Nj
aGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgICAgICB1bml0
X3NjaGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICAg
ICAgICAgIH0KICAgICAgICAgICAgIH0KIApAQCAtMjk3NSwxMiArMjk3NSwxMiBAQCBjc2NoZWQy
X2RvbV9jbnRsKAogICAgICAgICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQogICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgIHN0cnVjdCBjc2NoZWQyX3VuaXQgKnN2YyA9IGNzY2hlZDJf
dW5pdCh2LT5zY2hlZF91bml0KTsKLSAgICAgICAgICAgICAgICBzcGlubG9ja190ICpsb2NrID0g
dmNwdV9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgc3BpbmxvY2tf
dCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogCiAg
ICAgICAgICAgICAgICAgc3ZjLT5idWRnZXQgPSBTVElNRV9NQVg7CiAgICAgICAgICAgICAgICAg
c3ZjLT5idWRnZXRfcXVvdGEgPSAwOwogCi0gICAgICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91
bmxvY2sobG9jaywgc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICB1bml0X3NjaGVkdWxlX3Vu
bG9jayhsb2NrLCBzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgfQogICAgICAg
ICAgICAgc2RvbS0+Y2FwID0gMDsKICAgICAgICAgICAgIC8qCkBAIC0zMTE5LDE5ICszMTE5LDE5
IEBAIGNzY2hlZDJfdW5pdF9pbnNlcnQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAgICBBU1NFUlQobGlzdF9lbXB0eSgmc3ZjLT5ydW5xX2Vs
ZW0pKTsKIAogICAgIC8qIGNzY2hlZDJfcmVzX3BpY2soKSBleHBlY3RzIHRoZSBwY3B1IGxvY2sg
dG8gYmUgaGVsZCAqLwotICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHZjKTsKKyAg
ICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0KTsKIAogICAgIHVuaXQtPnJlcyA9
IGNzY2hlZDJfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2Yy0+cHJvY2Vzc29yID0gdW5pdC0+
cmVzLT5wcm9jZXNzb3I7CiAKICAgICBzcGluX3VubG9ja19pcnEobG9jayk7CiAKLSAgICBsb2Nr
ID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVf
bG9ja19pcnEodW5pdCk7CiAKICAgICAvKiBBZGQgdmNwdSB0byBydW5xdWV1ZSBvZiBpbml0aWFs
IHByb2Nlc3NvciAqLwogICAgIHJ1bnFfYXNzaWduKG9wcywgdmMpOwogCi0gICAgdmNwdV9zY2hl
ZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsKKyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEo
bG9jaywgdW5pdCk7CiAKICAgICBzZG9tLT5ucl92Y3B1cysrOwogCkBAIC0zMTYxLDExICszMTYx
LDExIEBAIGNzY2hlZDJfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfcmVtb3Zl
KTsKIAogICAgIC8qIFJlbW92ZSBmcm9tIHJ1bnF1ZXVlICovCi0gICAgbG9jayA9IHZjcHVfc2No
ZWR1bGVfbG9ja19pcnEodmMpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHVu
aXQpOwogCiAgICAgcnVucV9kZWFzc2lnbihvcHMsIHZjKTsKIAotICAgIHZjcHVfc2NoZWR1bGVf
dW5sb2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ss
IHVuaXQpOwogCiAgICAgc3ZjLT5zZG9tLT5ucl92Y3B1cy0tOwogfQpAQCAtMzc0OSwxMiArMzc0
OSwxMiBAQCBjc2NoZWQyX2R1bXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzKQogICAgICAg
ICAgICAgc3RydWN0IGNzY2hlZDJfdW5pdCAqIGNvbnN0IHN2YyA9IGNzY2hlZDJfdW5pdCh2LT5z
Y2hlZF91bml0KTsKICAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2s7CiAKLSAgICAgICAgICAg
IGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgIGxvY2sg
PSB1bml0X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKIAogICAgICAgICAg
ICAgcHJpbnRrKCJcdCUzZDogIiwgKytsb29wKTsKICAgICAgICAgICAgIGNzY2hlZDJfZHVtcF92
Y3B1KHBydiwgc3ZjKTsKIAotICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2sobG9jaywg
c3ZjLT52Y3B1KTsKKyAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIHN2Yy0+
dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgIH0KICAgICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vc2NoZWRfbnVsbC5jIGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKaW5kZXggOWRmNmY4
NjdhYS4uZWUzYThjZjA2NCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKKysr
IGIveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMKQEAgLTMxNyw3ICszMTcsNyBAQCBwaWNrX3Jlcyhz
dHJ1Y3QgbnVsbF9wcml2YXRlICpwcnYsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgICAq
IGFsbCB0aGUgcENQVXMgYXJlIGJ1c3kuCiAgICAgICoKICAgICAgKiBJbiBmYWN0LCB0aGVyZSBt
dXN0IGFsd2F5cyBiZSBzb21ldGhpbmcgc2FuZSBpbiB2LT5wcm9jZXNzb3IsIG9yCi0gICAgICog
dmNwdV9zY2hlZHVsZV9sb2NrKCkgYW5kIGZyaWVuZHMgd29uJ3Qgd29yay4gVGhpcyBpcyBub3Qg
YSBwcm9ibGVtLAorICAgICAqIHVuaXRfc2NoZWR1bGVfbG9jaygpIGFuZCBmcmllbmRzIHdvbid0
IHdvcmsuIFRoaXMgaXMgbm90IGEgcHJvYmxlbSwKICAgICAgKiBhcyB3ZSB3aWxsIGFjdHVhbGx5
IGFzc2lnbiB0aGUgdkNQVSB0byB0aGUgcENQVSB3ZSByZXR1cm4gZnJvbSBoZXJlLAogICAgICAq
IG9ubHkgaWYgdGhlIHBDUFUgaXMgZnJlZS4KICAgICAgKi8KQEAgLTQyMCw3ICs0MjAsNyBAQCBz
dGF0aWMgdm9pZCBudWxsX3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywK
IAogICAgIEFTU0VSVCghaXNfaWRsZV92Y3B1KHYpKTsKIAotICAgIGxvY2sgPSB2Y3B1X3NjaGVk
dWxlX2xvY2tfaXJxKHYpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHVuaXQp
OwogIHJldHJ5OgogCiAgICAgdW5pdC0+cmVzID0gcGlja19yZXMocHJ2LCB1bml0KTsKQEAgLTQy
OCw3ICs0MjgsNyBAQCBzdGF0aWMgdm9pZCBudWxsX3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywKIAogICAgIHNwaW5fdW5sb2NrKGxvY2spOwogCi0gICAgbG9jayA9IHZj
cHVfc2NoZWR1bGVfbG9jayh2KTsKKyAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrKHVuaXQp
OwogCiAgICAgY3B1bWFza19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB2LT5jcHVfaGFy
ZF9hZmZpbml0eSwKICAgICAgICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKHYtPmRv
bWFpbikpOwpAQCAtNTE0LDcgKzUxNCw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF9yZW1vdmUo
Y29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogCiAgICAgQVNTRVJUKCFpc19pZGxlX3ZjcHUo
dikpOwogCi0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgbG9jayA9
IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICAvKiBJZiB2IGlzIGluIHdhaXRx
dWV1ZSwganVzdCBnZXQgaXQgb3V0IG9mIHRoZXJlIGFuZCBiYWlsICovCiAgICAgaWYgKCB1bmxp
a2VseSghbGlzdF9lbXB0eSgmbnZjLT53YWl0cV9lbGVtKSkgKQpAQCAtNTMyLDcgKzUzMiw3IEBA
IHN0YXRpYyB2b2lkIG51bGxfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3Bz
LAogICAgIF92Y3B1X3JlbW92ZShwcnYsIHYpOwogCiAgb3V0OgotICAgIHZjcHVfc2NoZWR1bGVf
dW5sb2NrX2lycShsb2NrLCB2KTsKKyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywg
dW5pdCk7CiAKICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfcmVtb3ZlKTsKIH0KQEAgLTg1Miwx
MyArODUyLDEzIEBAIHN0YXRpYyB2b2lkIG51bGxfZHVtcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMpCiAgICAgICAgICAgICBzdHJ1Y3QgbnVsbF91bml0ICogY29uc3QgbnZjID0gbnVsbF91
bml0KHYtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgc3BpbmxvY2tfdCAqbG9jazsKIAotICAg
ICAgICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9jayhudmMtPnZjcHUpOworICAgICAgICAg
ICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9jayhudmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogCiAg
ICAgICAgICAgICBwcmludGsoIlx0JTNkOiAiLCArK2xvb3ApOwogICAgICAgICAgICAgZHVtcF92
Y3B1KHBydiwgbnZjKTsKICAgICAgICAgICAgIHByaW50aygiXG4iKTsKIAotICAgICAgICAgICAg
dmNwdV9zY2hlZHVsZV91bmxvY2sobG9jaywgbnZjLT52Y3B1KTsKKyAgICAgICAgICAgIHVuaXRf
c2NoZWR1bGVfdW5sb2NrKGxvY2ssIG52Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgIH0K
ICAgICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfcnQuYyBiL3hlbi9jb21tb24v
c2NoZWRfcnQuYwppbmRleCBjZWUwZDY5ZDU0Li5jZDczNzEzMWEzIDEwMDY0NAotLS0gYS94ZW4v
Y29tbW9uL3NjaGVkX3J0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCkBAIC0xNzcsNyAr
MTc3LDcgQEAgc3RhdGljIHZvaWQgcmVwbF90aW1lcl9oYW5kbGVyKHZvaWQgKmRhdGEpOwogLyoK
ICAqIFN5c3RlbS13aWRlIHByaXZhdGUgZGF0YSwgaW5jbHVkZSBnbG9iYWwgUnVuUXVldWUvRGVw
bGV0ZWRRCiAgKiBHbG9iYWwgbG9jayBpcyByZWZlcmVuY2VkIGJ5IHNjaGVkX3Jlcy0+c2NoZWR1
bGVfbG9jayBmcm9tIGFsbAotICogcGh5c2ljYWwgY3B1cy4gSXQgY2FuIGJlIGdyYWJiZWQgdmlh
IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEoKQorICogcGh5c2ljYWwgY3B1cy4gSXQgY2FuIGJlIGdy
YWJiZWQgdmlhIHVuaXRfc2NoZWR1bGVfbG9ja19pcnEoKQogICovCiBzdHJ1Y3QgcnRfcHJpdmF0
ZSB7CiAgICAgc3BpbmxvY2tfdCBsb2NrOyAgICAgICAgICAgIC8qIHRoZSBnbG9iYWwgY29hcnNl
LWdyYWluZWQgbG9jayAqLwpAQCAtODk3LDcgKzg5Nyw3IEBAIHJ0X3VuaXRfaW5zZXJ0KGNvbnN0
IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgdW5p
dC0+cmVzID0gcnRfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2Yy0+cHJvY2Vzc29yID0gdW5p
dC0+cmVzLT5wcm9jZXNzb3I7CiAKLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2
Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICBub3cg
PSBOT1coKTsKICAgICBpZiAoIG5vdyA+PSBzdmMtPmN1cl9kZWFkbGluZSApCkBAIC05MTAsNyAr
OTEwLDcgQEAgcnRfdW5pdF9pbnNlcnQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAgICAgICAgaWYgKCAhdmMtPmlzX3J1bm5pbmcgKQogICAg
ICAgICAgICAgcnVucV9pbnNlcnQob3BzLCBzdmMpOwogICAgIH0KLSAgICB2Y3B1X3NjaGVkdWxl
X3VubG9ja19pcnEobG9jaywgdmMpOworICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2Nr
LCB1bml0KTsKIAogICAgIFNDSEVEX1NUQVRfQ1JBTksodmNwdV9pbnNlcnQpOwogfQpAQCAtOTIx
LDcgKzkyMSw2IEBAIHJ0X3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiBzdGF0aWMgdm9pZAogcnRfdW5pdF9yZW1vdmUoY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIHsKLSAg
ICBzdHJ1Y3QgdmNwdSAqdmMgPSB1bml0LT52Y3B1OwogICAgIHN0cnVjdCBydF91bml0ICogY29u
c3Qgc3ZjID0gcnRfdW5pdCh1bml0KTsKICAgICBzdHJ1Y3QgcnRfZG9tICogY29uc3Qgc2RvbSA9
IHN2Yy0+c2RvbTsKICAgICBzcGlubG9ja190ICpsb2NrOwpAQCAtOTMwLDE0ICs5MjksMTQgQEAg
cnRfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCkKIAogICAgIEJVR19PTiggc2RvbSA9PSBOVUxMICk7CiAKLSAgICBsb2NrID0g
dmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9j
a19pcnEodW5pdCk7CiAgICAgaWYgKCB2Y3B1X29uX3Eoc3ZjKSApCiAgICAgICAgIHFfcmVtb3Zl
KHN2Yyk7CiAKICAgICBpZiAoIHZjcHVfb25fcmVwbHEoc3ZjKSApCiAgICAgICAgIHJlcGxxX3Jl
bW92ZShvcHMsc3ZjKTsKIAotICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2Yyk7
CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHVuaXQpOwogfQogCiAvKgpAQCAt
MTMzMiw3ICsxMzMxLDcgQEAgcnRfY29udGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogewogICAgIHN0cnVjdCB2Y3B1ICp2YyA9
IHVuaXQtPnZjcHU7CiAgICAgc3RydWN0IHJ0X3VuaXQgKnN2YyA9IHJ0X3VuaXQodW5pdCk7Ci0g
ICAgc3BpbmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodmMpOworICAgIHNw
aW5sb2NrX3QgKmxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHVuaXQpOwogCiAgICAgX19j
bGVhcl9iaXQoX19SVERTX3NjaGVkdWxlZCwgJnN2Yy0+ZmxhZ3MpOwogICAgIC8qIG5vdCBpbnNl
cnQgaWRsZSB2Y3B1IHRvIHJ1bnEgKi8KQEAgLTEzNDksNyArMTM0OCw3IEBAIHJ0X2NvbnRleHRf
c2F2ZWQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5p
dCkKICAgICAgICAgcmVwbHFfcmVtb3ZlKG9wcywgc3ZjKTsKIAogb3V0OgotICAgIHZjcHVfc2No
ZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJx
KGxvY2ssIHVuaXQpOwogfQogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IGVhNTNiZDcxODMuLjEzMjFjODYxMTEgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTE5NCw3ICsxOTQsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9j
aGFuZ2UoCiAKIHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2
Y3B1X3J1bnN0YXRlX2luZm8gKnJ1bnN0YXRlKQogewotICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBs
aWtlbHkodiA9PSBjdXJyZW50KSA/IE5VTEwgOiB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHYpOwor
ICAgIHNwaW5sb2NrX3QgKmxvY2sgPSBsaWtlbHkodiA9PSBjdXJyZW50KQorICAgICAgICAgICAg
ICAgICAgICAgICA/IE5VTEwgOiB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQp
OwogICAgIHNfdGltZV90IGRlbHRhOwogCiAgICAgbWVtY3B5KHJ1bnN0YXRlLCAmdi0+cnVuc3Rh
dGUsIHNpemVvZigqcnVuc3RhdGUpKTsKQEAgLTIwMyw3ICsyMDQsNyBAQCB2b2lkIHZjcHVfcnVu
c3RhdGVfZ2V0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5z
dGF0ZSkKICAgICAgICAgcnVuc3RhdGUtPnRpbWVbcnVuc3RhdGUtPnN0YXRlXSArPSBkZWx0YTsK
IAogICAgIGlmICggdW5saWtlbHkobG9jayAhPSBOVUxMKSApCi0gICAgICAgIHZjcHVfc2NoZWR1
bGVfdW5sb2NrX2lycShsb2NrLCB2KTsKKyAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJx
KGxvY2ssIHYtPnNjaGVkX3VuaXQpOwogfQogCiB1aW50NjRfdCBnZXRfY3B1X2lkbGVfdGltZSh1
bnNpZ25lZCBpbnQgY3B1KQpAQCAtNDE1LDcgKzQxNiw3IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFp
bihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9vbCAqYykKICAgICAgICAgbWlncmF0ZV90
aW1lcigmdi0+c2luZ2xlc2hvdF90aW1lciwgbmV3X3ApOwogICAgICAgICBtaWdyYXRlX3RpbWVy
KCZ2LT5wb2xsX3RpbWVyLCBuZXdfcCk7CiAKLSAgICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVf
bG9ja19pcnEodik7CisgICAgICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNj
aGVkX3VuaXQpOwogCiAgICAgICAgIHNjaGVkX3NldF9hZmZpbml0eSh2LCAmY3B1bWFza19hbGws
ICZjcHVtYXNrX2FsbCk7CiAKQEAgLTQyNCw3ICs0MjUsNyBAQCBpbnQgc2NoZWRfbW92ZV9kb21h
aW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGNwdXBvb2wgKmMpCiAgICAgICAgIC8qCiAgICAg
ICAgICAqIFdpdGggdi0+cHJvY2Vzc29yIG1vZGlmaWVkIHdlIG11c3Qgbm90CiAgICAgICAgICAq
IC0gbWFrZSBhbnkgZnVydGhlciBjaGFuZ2VzIGFzc3VtaW5nIHdlIGhvbGQgdGhlIHNjaGVkdWxl
ciBsb2NrLAotICAgICAgICAgKiAtIHVzZSB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEoKS4KKyAg
ICAgICAgICogLSB1c2UgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKCkuCiAgICAgICAgICAqLwog
ICAgICAgICBzcGluX3VubG9ja19pcnEobG9jayk7CiAKQEAgLTUyMywxMSArNTI0LDExIEBAIHZv
aWQgdmNwdV9zbGVlcF9ub3N5bmMoc3RydWN0IHZjcHUgKnYpCiAKICAgICBUUkFDRV8yRChUUkNf
U0NIRURfU0xFRVAsIHYtPmRvbWFpbi0+ZG9tYWluX2lkLCB2LT52Y3B1X2lkKTsKIAotICAgIGxv
Y2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZSh2LCAmZmxhZ3MpOworICAgIGxvY2sgPSB1
bml0X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZSh2LT5zY2hlZF91bml0LCAmZmxhZ3MpOwogCiAgICAg
dmNwdV9zbGVlcF9ub3N5bmNfbG9ja2VkKHYpOwogCi0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tf
aXJxcmVzdG9yZShsb2NrLCBmbGFncywgdik7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJx
cmVzdG9yZShsb2NrLCBmbGFncywgdi0+c2NoZWRfdW5pdCk7CiB9CiAKIHZvaWQgdmNwdV9zbGVl
cF9zeW5jKHN0cnVjdCB2Y3B1ICp2KQpAQCAtNTQ3LDcgKzU0OCw3IEBAIHZvaWQgdmNwdV93YWtl
KHN0cnVjdCB2Y3B1ICp2KQogCiAgICAgVFJBQ0VfMkQoVFJDX1NDSEVEX1dBS0UsIHYtPmRvbWFp
bi0+ZG9tYWluX2lkLCB2LT52Y3B1X2lkKTsKIAotICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xv
Y2tfaXJxc2F2ZSh2LCAmZmxhZ3MpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJx
c2F2ZSh2LT5zY2hlZF91bml0LCAmZmxhZ3MpOwogCiAgICAgaWYgKCBsaWtlbHkodmNwdV9ydW5u
YWJsZSh2KSkgKQogICAgIHsKQEAgLTU2MSw3ICs1NjIsNyBAQCB2b2lkIHZjcHVfd2FrZShzdHJ1
Y3QgdmNwdSAqdikKICAgICAgICAgICAgIHZjcHVfcnVuc3RhdGVfY2hhbmdlKHYsIFJVTlNUQVRF
X29mZmxpbmUsIE5PVygpKTsKICAgICB9CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFy
ZXN0b3JlKGxvY2ssIGZsYWdzLCB2KTsKKyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0
b3JlKGxvY2ssIGZsYWdzLCB2LT5zY2hlZF91bml0KTsKIH0KIAogdm9pZCB2Y3B1X3VuYmxvY2so
c3RydWN0IHZjcHUgKnYpCkBAIC02MjksOSArNjMwLDkgQEAgc3RhdGljIHZvaWQgdmNwdV9tb3Zl
X2xvY2tlZChzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IG5ld19jcHUpCiAgKiBUaGVzZSBz
dGVwcyBhcmUgZW5jYXBzdWxhdGVkIGluIHRoZSBmb2xsb3dpbmcgdHdvIGZ1bmN0aW9uczsgdGhl
eQogICogc2hvdWxkIGJlIGNhbGxlZCBsaWtlIHRoaXM6CiAgKgotICogICAgIGxvY2sgPSB2Y3B1
X3NjaGVkdWxlX2xvY2tfaXJxKHYpOworICogICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tf
aXJxKHVuaXQpOwogICogICAgIHZjcHVfbWlncmF0ZV9zdGFydCh2KTsKLSAqICAgICB2Y3B1X3Nj
aGVkdWxlX3VubG9ja19pcnEobG9jaywgdikKKyAqICAgICB1bml0X3NjaGVkdWxlX3VubG9ja19p
cnEobG9jaywgdW5pdCkKICAqICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYpOwogICoKICAqIHZj
cHVfbWlncmF0ZV9maW5pc2goKSB3aWxsIGRvIHRoZSB3b3JrIG5vdyBpZiBpdCBjYW4sIG9yIHNp
bXBseQpAQCAtNzM2LDEyICs3MzcsMTIgQEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2Zpbmlz
aChzdHJ1Y3QgdmNwdSAqdikKICAqLwogdm9pZCB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoc3RydWN0
IHZjcHUgKnYpCiB7Ci0gICAgc3BpbmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19p
cnEodik7CisgICAgc3BpbmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+
c2NoZWRfdW5pdCk7CiAKICAgICBpZiAoIHYtPmlzX3J1bm5pbmcgKQogICAgICAgICB2Y3B1X21p
Z3JhdGVfc3RhcnQodik7CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7
CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwogCiAg
ICAgdmNwdV9taWdyYXRlX2ZpbmlzaCh2KTsKIH0KQEAgLTc5Miw3ICs3OTMsNyBAQCB2b2lkIHJl
c3RvcmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICB2LT5wcm9jZXNz
b3IgPSBjcHVtYXNrX2FueShjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpOwogICAgICAgICB2LT5z
Y2hlZF91bml0LT5yZXMgPSBnZXRfc2NoZWRfcmVzKHYtPnByb2Nlc3Nvcik7CiAKLSAgICAgICAg
bG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgICAgIGxvY2sgPSB1bml0X3Nj
aGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOwogICAgICAgICB2LT5zY2hlZF91bml0LT5y
ZXMgPSBzY2hlZF9waWNrX3Jlc291cmNlKHZjcHVfc2NoZWR1bGVyKHYpLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHYtPnNjaGVkX3VuaXQpOwogICAg
ICAgICB2LT5wcm9jZXNzb3IgPSB2LT5zY2hlZF91bml0LT5yZXMtPnByb2Nlc3NvcjsKQEAgLTgy
Nyw3ICs4MjgsNyBAQCBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2lnbmVkIGludCBjcHUp
CiAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKICAgICAgICAgewogICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBmbGFnczsKLSAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2Y3B1
X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZSh2LCAmZmxhZ3MpOworICAgICAgICAgICAgc3BpbmxvY2tf
dCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYtPnNjaGVkX3VuaXQsICZmbGFn
cyk7CiAKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKCZvbmxpbmVfYWZmaW5pdHksIHYtPmNwdV9o
YXJkX2FmZmluaXR5LCBjLT5jcHVfdmFsaWQpOwogICAgICAgICAgICAgaWYgKCBjcHVtYXNrX2Vt
cHR5KCZvbmxpbmVfYWZmaW5pdHkpICYmCkBAIC04MzYsNyArODM3LDcgQEAgaW50IGNwdV9kaXNh
YmxlX3NjaGVkdWxlcih1bnNpZ25lZCBpbnQgY3B1KQogICAgICAgICAgICAgICAgIGlmICggdi0+
YWZmaW5pdHlfYnJva2VuICkKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAg
IC8qIFRoZSB2Y3B1IGlzIHRlbXBvcmFyaWx5IHBpbm5lZCwgY2FuJ3QgbW92ZSBpdC4gKi8KLSAg
ICAgICAgICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBm
bGFncywgdik7CisgICAgICAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJl
c3RvcmUobG9jaywgZmxhZ3MsIHYtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAtRUFERFJJTlVTRTsKICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAg
ICAgICAgfQpAQCAtODQ5LDcgKzg1MCw3IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5z
aWduZWQgaW50IGNwdSkKICAgICAgICAgICAgIGlmICggdi0+cHJvY2Vzc29yICE9IGNwdSApCiAg
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgLyogVGhlIHZjcHUgaXMgbm90IG9uIHRoaXMg
Y3B1LCBzbyB3ZSBjYW4gbW92ZSBvbi4gKi8KLSAgICAgICAgICAgICAgICB2Y3B1X3NjaGVkdWxl
X3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2KTsKKyAgICAgICAgICAgICAgICB1bml0
X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2LT5zY2hlZF91bml0KTsK
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgIH0KIApAQCAtODYyLDcgKzg2
Myw3IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKICAgICAg
ICAgICAgICAqICAgIHRoaW5ncyB3b3VsZCBoYXZlIGZhaWxlZCBiZWZvcmUgZ2V0dGluZyBpbiBo
ZXJlLgogICAgICAgICAgICAgICovCiAgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfc3RhcnQodik7
Ci0gICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdz
LCB2KTsKKyAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywg
ZmxhZ3MsIHYtPnNjaGVkX3VuaXQpOwogCiAgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNo
KHYpOwogCkBAIC05MjYsNyArOTI3LDcgQEAgc3RhdGljIGludCB2Y3B1X3NldF9hZmZpbml0eSgK
ICAgICBzcGlubG9ja190ICpsb2NrOwogICAgIGludCByZXQgPSAwOwogCi0gICAgbG9jayA9IHZj
cHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19p
cnEodi0+c2NoZWRfdW5pdCk7CiAKICAgICBpZiAoIHYtPmFmZmluaXR5X2Jyb2tlbiApCiAgICAg
ICAgIHJldCA9IC1FQlVTWTsKQEAgLTk0OCw3ICs5NDksNyBAQCBzdGF0aWMgaW50IHZjcHVfc2V0
X2FmZmluaXR5KAogICAgICAgICB2Y3B1X21pZ3JhdGVfc3RhcnQodik7CiAgICAgfQogCi0gICAg
dmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYpOworICAgIHVuaXRfc2NoZWR1bGVfdW5s
b2NrX2lycShsb2NrLCB2LT5zY2hlZF91bml0KTsKIAogICAgIGRvbWFpbl91cGRhdGVfbm9kZV9h
ZmZpbml0eSh2LT5kb21haW4pOwogCkBAIC0xMDgwLDEwICsxMDgxLDEwIEBAIHN0YXRpYyBsb25n
IGRvX3BvbGwoc3RydWN0IHNjaGVkX3BvbGwgKnNjaGVkX3BvbGwpCiBsb25nIHZjcHVfeWllbGQo
dm9pZCkKIHsKICAgICBzdHJ1Y3QgdmNwdSAqIHY9Y3VycmVudDsKLSAgICBzcGlubG9ja190ICps
b2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICBzcGlubG9ja190ICpsb2NrID0g
dW5pdF9zY2hlZHVsZV9sb2NrX2lycSh2LT5zY2hlZF91bml0KTsKIAogICAgIHNjaGVkX3lpZWxk
KHZjcHVfc2NoZWR1bGVyKHYpLCB2LT5zY2hlZF91bml0KTsKLSAgICB2Y3B1X3NjaGVkdWxlX3Vu
bG9ja19pcnEobG9jaywgdik7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYt
PnNjaGVkX3VuaXQpOwogCiAgICAgU0NIRURfU1RBVF9DUkFOSyh2Y3B1X3lpZWxkKTsKIApAQCAt
MTE2OSw3ICsxMTcwLDcgQEAgaW50IHZjcHVfcGluX292ZXJyaWRlKHN0cnVjdCB2Y3B1ICp2LCBp
bnQgY3B1KQogICAgIHNwaW5sb2NrX3QgKmxvY2s7CiAgICAgaW50IHJldCA9IC1FSU5WQUw7CiAK
LSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICBsb2NrID0gdW5pdF9z
Y2hlZHVsZV9sb2NrX2lycSh2LT5zY2hlZF91bml0KTsKIAogICAgIGlmICggY3B1IDwgMCApCiAg
ICAgewpAQCAtMTE5Niw3ICsxMTk3LDcgQEAgaW50IHZjcHVfcGluX292ZXJyaWRlKHN0cnVjdCB2
Y3B1ICp2LCBpbnQgY3B1KQogICAgIGlmICggcmV0ID09IDAgKQogICAgICAgICB2Y3B1X21pZ3Jh
dGVfc3RhcnQodik7CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7Cisg
ICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwogCiAgICAg
ZG9tYWluX3VwZGF0ZV9ub2RlX2FmZmluaXR5KHYtPmRvbWFpbik7CiAKQEAgLTE2NjMsNiArMTY2
NCw5IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX3VwKHVuc2lnbmVkIGludCBjcHUpCiAgICAg
ICAgIHVuaXQtPnByaXYgPSBzY2hlZF9hbGxvY192ZGF0YSgmb3BzLCB1bml0LCBpZGxlLT5kb21h
aW4tPnNjaGVkX3ByaXYpOwogICAgICAgICBpZiAoIHVuaXQtPnByaXYgPT0gTlVMTCApCiAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsKKworICAgICAgICAvKiBVcGRhdGUgdGhlIHJlc291cmNl
IHBvaW50ZXIgaW4gdGhlIGlkbGUgdW5pdC4gKi8KKyAgICAgICAgdW5pdC0+cmVzID0gc2Q7CiAg
ICAgfQogICAgIGlmICggaWRsZV92Y3B1W2NwdV0gPT0gTlVMTCApCiAgICAgICAgIHJldHVybiAt
RU5PTUVNOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggYi94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaAppbmRleCAwNDQzZmUxZDdlLi4yMGUzNmVhMzliIDEwMDY0NAot
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQtaWYuaApAQCAtMTAxLDIyICsxMDEsMjIgQEAgc3RhdGljIGlubGluZSB2b2lkIGtpbmQjI19z
Y2hlZHVsZV91bmxvY2sjI2lycShzcGlubG9ja190ICpsb2NrIFwKIAogI2RlZmluZSBFWFRSQV9U
WVBFKGFyZykKIHNjaGVkX2xvY2socGNwdSwgdW5zaWduZWQgaW50IGNwdSwgICAgIGNwdSwgKQot
c2NoZWRfbG9jayh2Y3B1LCBjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdi0+cHJvY2Vzc29yLCApCitz
Y2hlZF9sb2NrKHVuaXQsIGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICppLCBpLT5yZXMtPnByb2Nl
c3NvciwgKQogc2NoZWRfbG9jayhwY3B1LCB1bnNpZ25lZCBpbnQgY3B1LCAgICAgY3B1LCAgICAg
ICAgICBfaXJxKQotc2NoZWRfbG9jayh2Y3B1LCBjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdi0+cHJv
Y2Vzc29yLCBfaXJxKQorc2NoZWRfbG9jayh1bml0LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAq
aSwgaS0+cmVzLT5wcm9jZXNzb3IsIF9pcnEpCiBzY2hlZF91bmxvY2socGNwdSwgdW5zaWduZWQg
aW50IGNwdSwgICAgIGNwdSwgKQotc2NoZWRfdW5sb2NrKHZjcHUsIGNvbnN0IHN0cnVjdCB2Y3B1
ICp2LCB2LT5wcm9jZXNzb3IsICkKK3NjaGVkX3VubG9jayh1bml0LCBjb25zdCBzdHJ1Y3Qgc2No
ZWRfdW5pdCAqaSwgaS0+cmVzLT5wcm9jZXNzb3IsICkKIHNjaGVkX3VubG9jayhwY3B1LCB1bnNp
Z25lZCBpbnQgY3B1LCAgICAgY3B1LCAgICAgICAgICBfaXJxKQotc2NoZWRfdW5sb2NrKHZjcHUs
IGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB2LT5wcm9jZXNzb3IsIF9pcnEpCitzY2hlZF91bmxvY2so
dW5pdCwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKmksIGktPnJlcy0+cHJvY2Vzc29yLCBfaXJx
KQogI3VuZGVmIEVYVFJBX1RZUEUKIAogI2RlZmluZSBFWFRSQV9UWVBFKGFyZykgLCB1bnNpZ25l
ZCBsb25nIGFyZwogI2RlZmluZSBzcGluX3VubG9ja19pcnFzYXZlIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUKIHNjaGVkX2xvY2socGNwdSwgdW5zaWduZWQgaW50IGNwdSwgICAgIGNwdSwgICAgICAg
ICAgX2lycXNhdmUsICpmbGFncykKLXNjaGVkX2xvY2sodmNwdSwgY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHYtPnByb2Nlc3NvciwgX2lycXNhdmUsICpmbGFncykKK3NjaGVkX2xvY2sodW5pdCwgY29u
c3Qgc3RydWN0IHNjaGVkX3VuaXQgKmksIGktPnJlcy0+cHJvY2Vzc29yLCBfaXJxc2F2ZSwgKmZs
YWdzKQogI3VuZGVmIHNwaW5fdW5sb2NrX2lycXNhdmUKIHNjaGVkX3VubG9jayhwY3B1LCB1bnNp
Z25lZCBpbnQgY3B1LCAgICAgY3B1LCAgICAgICAgICBfaXJxcmVzdG9yZSwgZmxhZ3MpCi1zY2hl
ZF91bmxvY2sodmNwdSwgY29uc3Qgc3RydWN0IHZjcHUgKnYsIHYtPnByb2Nlc3NvciwgX2lycXJl
c3RvcmUsIGZsYWdzKQorc2NoZWRfdW5sb2NrKHVuaXQsIGNvbnN0IHN0cnVjdCBzY2hlZF91bml0
ICppLCBpLT5yZXMtPnByb2Nlc3NvciwgX2lycXJlc3RvcmUsIGZsYWdzKQogI3VuZGVmIEVYVFJB
X1RZUEUKIAogI3VuZGVmIHNjaGVkX3VubG9jawotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
