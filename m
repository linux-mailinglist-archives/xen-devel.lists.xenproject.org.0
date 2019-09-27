Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E41BFFA9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:04:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkFo-0003Kd-7c; Fri, 27 Sep 2019 07:01:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkFm-0003JZ-Qk
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:01:22 +0000
X-Inumbo-ID: 8ed0d28a-e0f4-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 8ed0d28a-e0f4-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 07:00:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC294AFCC;
 Fri, 27 Sep 2019 07:00:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:12 +0200
Message-Id: <20190927070050.12405-9-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 08/46] xen/sched: switch vcpu_schedule_lock
 to unit_schedule_lock
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
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRm
YWdnaW9saUBzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jICB8IDE3ICsr
KysrKysrKy0tLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYyB8IDQwICsrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWRfbnVsbC5j
ICAgIHwgMTYgKysrKysrKystLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9ydC5jICAgICAgfCAx
NSArKysrKysrLS0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgIHwgNDUgKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4v
c2NoZWQtaWYuaCB8IDEyICsrKysrKy0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRp
b25zKCspLCA3MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX2Ny
ZWRpdC5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwppbmRleCA1OWE3N2U4NzRiLi5kMGU0
ZGRjNzZiIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCisrKyBiL3hlbi9j
b21tb24vc2NoZWRfY3JlZGl0LmMKQEAgLTkyNiw3ICs5MjYsOCBAQCBfX2NzY2hlZF92Y3B1X2Fj
Y3Rfc3RvcF9sb2NrZWQoc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsCiBzdGF0aWMgdm9pZAog
Y3NjaGVkX3ZjcHVfYWNjdChzdHJ1Y3QgY3NjaGVkX3ByaXZhdGUgKnBydiwgdW5zaWduZWQgaW50
IGNwdSkKIHsKLSAgICBzdHJ1Y3QgY3NjaGVkX3VuaXQgKiBjb25zdCBzdmMgPSBDU0NIRURfVU5J
VChjdXJyZW50LT5zY2hlZF91bml0KTsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqY3VycnVuaXQg
PSBjdXJyZW50LT5zY2hlZF91bml0OworICAgIHN0cnVjdCBjc2NoZWRfdW5pdCAqIGNvbnN0IHN2
YyA9IENTQ0hFRF9VTklUKGN1cnJ1bml0KTsKICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpv
cHMgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKIAogICAgIEFTU0VSVCggY3VycmVudC0+cHJv
Y2Vzc29yID09IGNwdSApOwpAQCAtOTYyLDcgKzk2Myw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qoc3Ry
dWN0IGNzY2hlZF9wcml2YXRlICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgewogICAgICAg
ICB1bnNpZ25lZCBpbnQgbmV3X2NwdTsKICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKLSAg
ICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKGN1cnJl
bnQsICZmbGFncyk7CisgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB1bml0X3NjaGVkdWxlX2xv
Y2tfaXJxc2F2ZShjdXJydW5pdCwgJmZsYWdzKTsKIAogICAgICAgICAvKgogICAgICAgICAgKiBJ
ZiBpdCdzIGJlZW4gYWN0aXZlIGEgd2hpbGUsIGNoZWNrIGlmIHdlJ2QgYmUgYmV0dGVyIG9mZgpA
QCAtOTcxLDcgKzk3Miw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qoc3RydWN0IGNzY2hlZF9wcml2YXRl
ICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgICAqLwogICAgICAgICBuZXdfY3B1ID0g
X2NzY2hlZF9jcHVfcGljayhvcHMsIGN1cnJlbnQsIDApOwogCi0gICAgICAgIHZjcHVfc2NoZWR1
bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIGN1cnJlbnQpOworICAgICAgICB1bml0
X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCBjdXJydW5pdCk7CiAKICAg
ICAgICAgaWYgKCBuZXdfY3B1ICE9IGNwdSApCiAgICAgICAgIHsKQEAgLTEwMjMsMTkgKzEwMjQs
MTkgQEAgY3NjaGVkX3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgQlVHX09OKCBpc19pZGxlX3ZjcHUodmMpICk7CiAK
ICAgICAvKiBjc2NoZWRfcmVzX3BpY2soKSBsb29rcyBpbiB2Yy0+cHJvY2Vzc29yJ3MgcnVucSwg
c28gd2UgbmVlZCB0aGUgbG9jay4gKi8KLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2ly
cSh2Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICB1
bml0LT5yZXMgPSBjc2NoZWRfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2Yy0+cHJvY2Vzc29y
ID0gdW5pdC0+cmVzLT5tYXN0ZXJfY3B1OwogCiAgICAgc3Bpbl91bmxvY2tfaXJxKGxvY2spOwog
Ci0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodmMpOworICAgIGxvY2sgPSB1bml0
X3NjaGVkdWxlX2xvY2tfaXJxKHVuaXQpOwogCiAgICAgaWYgKCAhX192Y3B1X29uX3J1bnEoc3Zj
KSAmJiB2Y3B1X3J1bm5hYmxlKHZjKSAmJiAhdmMtPmlzX3J1bm5pbmcgKQogICAgICAgICBydW5x
X2luc2VydChzdmMpOwogCi0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsK
KyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7CiAKICAgICBTQ0hFRF9T
VEFUX0NSQU5LKHZjcHVfaW5zZXJ0KTsKIH0KQEAgLTIxMzMsMTIgKzIxMzQsMTIgQEAgY3NjaGVk
X2R1bXAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzKQogICAgICAgICAgICAgc3BpbmxvY2tf
dCAqbG9jazsKIAogICAgICAgICAgICAgc3ZjID0gbGlzdF9lbnRyeShpdGVyX3N2Yywgc3RydWN0
IGNzY2hlZF91bml0LCBhY3RpdmVfdmNwdV9lbGVtKTsKLSAgICAgICAgICAgIGxvY2sgPSB2Y3B1
X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgIGxvY2sgPSB1bml0X3NjaGVk
dWxlX2xvY2soc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKIAogICAgICAgICAgICAgcHJpbnRrKCJc
dCUzZDogIiwgKytsb29wKTsKICAgICAgICAgICAgIGNzY2hlZF9kdW1wX3ZjcHUoc3ZjKTsKIAot
ICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2sobG9jaywgc3ZjLT52Y3B1KTsKKyAgICAg
ICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7
CiAgICAgICAgIH0KICAgICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0
Mi5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKaW5kZXggZWYwZGQxZDIyOC4uODJkMDNh
MDY4MyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZF9jcmVkaXQyLmMKQEAgLTE3MSw3ICsxNzEsNyBAQAogICogLSBydW5xdWV1ZSBs
b2NrCiAgKiAgKyBpdCBpcyBwZXItcnVucXVldWUsIHNvOgogICogICAqIGNwdXMgaW4gYSBydW5x
dWV1ZSB0YWtlIHRoZSBydW5xdWV1ZSBsb2NrLCB3aGVuIHVzaW5nCi0gKiAgICAgcGNwdV9zY2hl
ZHVsZV9sb2NrKCkgLyB2Y3B1X3NjaGVkdWxlX2xvY2soKSAoYW5kIGZyaWVuZHMpLAorICogICAg
IHBjcHVfc2NoZWR1bGVfbG9jaygpIC8gdW5pdF9zY2hlZHVsZV9sb2NrKCkgKGFuZCBmcmllbmRz
KSwKICAqICAgKiBhIGNwdSBtYXkgKHRyeSB0bykgdGFrZSBhICJyZW1vdGUiIHJ1bnF1ZXVlIGxv
Y2ssIGUuZy4sIGZvcgogICogICAgIGxvYWQgYmFsYW5jaW5nOwogICogICsgc2VyaWFsaXplcyBy
dW5xdWV1ZSBvcGVyYXRpb25zIChyZW1vdmluZyBhbmQgaW5zZXJ0aW5nIHZjcHVzKTsKQEAgLTE4
OTEsNyArMTg5MSw3IEBAIHVucGFya19wYXJrZWRfdmNwdXMoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqb3BzLCBzdHJ1Y3QgbGlzdF9oZWFkICp2Y3B1cykKICAgICAgICAgdW5zaWduZWQgbG9uZyBm
bGFnczsKICAgICAgICAgc190aW1lX3Qgbm93OwogCi0gICAgICAgIGxvY2sgPSB2Y3B1X3NjaGVk
dWxlX2xvY2tfaXJxc2F2ZShzdmMtPnZjcHUsICZmbGFncyk7CisgICAgICAgIGxvY2sgPSB1bml0
X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShzdmMtPnZjcHUtPnNjaGVkX3VuaXQsICZmbGFncyk7CiAK
ICAgICAgICAgX19jbGVhcl9iaXQoX1ZQRl9wYXJrZWQsICZzdmMtPnZjcHUtPnBhdXNlX2ZsYWdz
KTsKICAgICAgICAgaWYgKCB1bmxpa2VseShzdmMtPmZsYWdzICYgQ1NGTEFHX3NjaGVkdWxlZCkg
KQpAQCAtMTkyNCw3ICsxOTI0LDcgQEAgdW5wYXJrX3BhcmtlZF92Y3B1cyhjb25zdCBzdHJ1Y3Qg
c2NoZWR1bGVyICpvcHMsIHN0cnVjdCBsaXN0X2hlYWQgKnZjcHVzKQogICAgICAgICB9CiAgICAg
ICAgIGxpc3RfZGVsX2luaXQoJnN2Yy0+cGFya2VkX2VsZW0pOwogCi0gICAgICAgIHZjcHVfc2No
ZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHN2Yy0+dmNwdSk7CisgICAgICAg
IHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHN2Yy0+dmNwdS0+
c2NoZWRfdW5pdCk7CiAgICAgfQogfQogCkBAIC0yMTYzLDcgKzIxNjMsNyBAQCBjc2NoZWQyX2Nv
bnRleHRfc2F2ZWQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5p
dCAqdW5pdCkKIHsKICAgICBzdHJ1Y3QgdmNwdSAqdmMgPSB1bml0LT52Y3B1X2xpc3Q7CiAgICAg
c3RydWN0IGNzY2hlZDJfdW5pdCAqIGNvbnN0IHN2YyA9IGNzY2hlZDJfdW5pdCh1bml0KTsKLSAg
ICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgc3Bp
bmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgICAgc190aW1l
X3Qgbm93ID0gTk9XKCk7CiAgICAgTElTVF9IRUFEKHdlcmVfcGFya2VkKTsKIApAQCAtMjE5NSw3
ICsyMTk1LDcgQEAgY3NjaGVkMl9jb250ZXh0X3NhdmVkKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIg
Km9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgZWxzZSBpZiAoICFpc19pZGxlX3Zj
cHUodmMpICkKICAgICAgICAgdXBkYXRlX2xvYWQob3BzLCBzdmMtPnJxZCwgc3ZjLCAtMSwgbm93
KTsKIAotICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9z
Y2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHVuaXQpOwogCiAgICAgdW5wYXJrX3BhcmtlZF92Y3B1
cyhvcHMsICZ3ZXJlX3BhcmtlZCk7CiB9CkBAIC0yODQ4LDE0ICsyODQ4LDE0IEBAIGNzY2hlZDJf
ZG9tX2NudGwoCiAgICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgc3RydWN0IGNzY2hlZDJfdW5pdCAqc3ZjID0gY3NjaGVkMl91
bml0KHYtPnNjaGVkX3VuaXQpOwotICAgICAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2
Y3B1X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICBzcGlubG9ja190
ICpsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAKICAg
ICAgICAgICAgICAgICBBU1NFUlQoc3ZjLT5ycWQgPT0gYzJycWQob3BzLCBzdmMtPnZjcHUtPnBy
b2Nlc3NvcikpOwogCiAgICAgICAgICAgICAgICAgc3ZjLT53ZWlnaHQgPSBzZG9tLT53ZWlnaHQ7
CiAgICAgICAgICAgICAgICAgdXBkYXRlX21heF93ZWlnaHQoc3ZjLT5ycWQsIHN2Yy0+d2VpZ2h0
LCBvbGRfd2VpZ2h0KTsKIAotICAgICAgICAgICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrKGxv
Y2ssIHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2sobG9j
aywgc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKICAgICAgICAgICAgIH0KICAgICAgICAgfQogICAg
ICAgICAvKiBDYXAgKi8KQEAgLTI4ODYsNyArMjg4Niw3IEBAIGNzY2hlZDJfZG9tX2NudGwoCiAg
ICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgc3ZjID0gY3NjaGVkMl91bml0KHYtPnNjaGVkX3VuaXQpOwotICAgICAgICAgICAg
ICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAg
ICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAg
ICAgICAgICAgICAgLyoKICAgICAgICAgICAgICAgICAgKiBUb28gc21hbGwgcXVvdGFzIHdvdWxk
IGluIHRoZW9yeSBjYXVzZSBhIGxvdCBvZiBvdmVyaGVhZCwKICAgICAgICAgICAgICAgICAgKiB3
aGljaCB0aGVuIHdvbid0IGhhcHBlbiBiZWNhdXNlLCBpbiBjc2NoZWQyX3J1bnRpbWUoKSwKQEAg
LTI4OTQsNyArMjg5NCw3IEBAIGNzY2hlZDJfZG9tX2NudGwoCiAgICAgICAgICAgICAgICAgICov
CiAgICAgICAgICAgICAgICAgc3ZjLT5idWRnZXRfcXVvdGEgPSBtYXgoc2RvbS0+dG90X2J1ZGdl
dCAvIHNkb20tPm5yX3ZjcHVzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIENTQ0hFRDJfTUlOX1RJTUVSKTsKLSAgICAgICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3Vu
bG9jayhsb2NrLCBzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5s
b2NrKGxvY2ssIHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgICAgICB9CiAKICAgICAg
ICAgICAgIGlmICggc2RvbS0+Y2FwID09IDAgKQpAQCAtMjkyOSw3ICsyOTI5LDcgQEAgY3NjaGVk
Ml9kb21fY250bCgKICAgICAgICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAg
ICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICBzdmMgPSBjc2NoZWQyX3VuaXQodi0+
c2NoZWRfdW5pdCk7Ci0gICAgICAgICAgICAgICAgICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xv
Y2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICAgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVf
bG9jayhzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgICAgICAgICBpZiAoIHYt
PmlzX3J1bm5pbmcgKQogICAgICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgY3B1ID0gdi0+cHJvY2Vzc29yOwpAQCAtMjk2MCw3ICsyOTYwLDcg
QEAgY3NjaGVkMl9kb21fY250bCgKICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9yYWlzZV9z
b2Z0aXJxKGNwdSwgU0NIRURVTEVfU09GVElSUSk7CiAgICAgICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgICAgICAgICAgc3ZjLT5idWRnZXQgPSAwOwotICAgICAgICAgICAgICAgICAgICB2
Y3B1X3NjaGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgICAg
ICB1bml0X3NjaGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAg
ICAgICAgICAgICAgIH0KICAgICAgICAgICAgIH0KIApAQCAtMjk3NiwxMiArMjk3NiwxMiBAQCBj
c2NoZWQyX2RvbV9jbnRsKAogICAgICAgICAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQogICAg
ICAgICAgICAgewogICAgICAgICAgICAgICAgIHN0cnVjdCBjc2NoZWQyX3VuaXQgKnN2YyA9IGNz
Y2hlZDJfdW5pdCh2LT5zY2hlZF91bml0KTsKLSAgICAgICAgICAgICAgICBzcGlubG9ja190ICps
b2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgc3Bp
bmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUtPnNjaGVkX3VuaXQp
OwogCiAgICAgICAgICAgICAgICAgc3ZjLT5idWRnZXQgPSBTVElNRV9NQVg7CiAgICAgICAgICAg
ICAgICAgc3ZjLT5idWRnZXRfcXVvdGEgPSAwOwogCi0gICAgICAgICAgICAgICAgdmNwdV9zY2hl
ZHVsZV91bmxvY2sobG9jaywgc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICB1bml0X3NjaGVk
dWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgfQog
ICAgICAgICAgICAgc2RvbS0+Y2FwID0gMDsKICAgICAgICAgICAgIC8qCkBAIC0zMTIwLDE5ICsz
MTIwLDE5IEBAIGNzY2hlZDJfdW5pdF9pbnNlcnQoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3Bz
LCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAgICBBU1NFUlQobGlzdF9lbXB0eSgmc3ZjLT5y
dW5xX2VsZW0pKTsKIAogICAgIC8qIGNzY2hlZDJfcmVzX3BpY2soKSBleHBlY3RzIHRoZSBwY3B1
IGxvY2sgdG8gYmUgaGVsZCAqLwotICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHZj
KTsKKyAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0KTsKIAogICAgIHVuaXQt
PnJlcyA9IGNzY2hlZDJfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2Yy0+cHJvY2Vzc29yID0g
dW5pdC0+cmVzLT5tYXN0ZXJfY3B1OwogCiAgICAgc3Bpbl91bmxvY2tfaXJxKGxvY2spOwogCi0g
ICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodmMpOworICAgIGxvY2sgPSB1bml0X3Nj
aGVkdWxlX2xvY2tfaXJxKHVuaXQpOwogCiAgICAgLyogQWRkIHZjcHUgdG8gcnVucXVldWUgb2Yg
aW5pdGlhbCBwcm9jZXNzb3IgKi8KICAgICBydW5xX2Fzc2lnbihvcHMsIHZjKTsKIAotICAgIHZj
cHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9zY2hlZHVsZV91bmxv
Y2tfaXJxKGxvY2ssIHVuaXQpOwogCiAgICAgc2RvbS0+bnJfdmNwdXMrKzsKIApAQCAtMzE2Miwx
MSArMzE2MiwxMSBAQCBjc2NoZWQyX3VuaXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIg
Km9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgU0NIRURfU1RBVF9DUkFOSyh2Y3B1
X3JlbW92ZSk7CiAKICAgICAvKiBSZW1vdmUgZnJvbSBydW5xdWV1ZSAqLwotICAgIGxvY2sgPSB2
Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHZjKTsKKyAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2Nr
X2lycSh1bml0KTsKIAogICAgIHJ1bnFfZGVhc3NpZ24ob3BzLCB2Yyk7CiAKLSAgICB2Y3B1X3Nj
aGVkdWxlX3VubG9ja19pcnEobG9jaywgdmMpOworICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2ly
cShsb2NrLCB1bml0KTsKIAogICAgIHN2Yy0+c2RvbS0+bnJfdmNwdXMtLTsKIH0KQEAgLTM3NTAs
MTIgKzM3NTAsMTIgQEAgY3NjaGVkMl9kdW1wKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcykK
ICAgICAgICAgICAgIHN0cnVjdCBjc2NoZWQyX3VuaXQgKiBjb25zdCBzdmMgPSBjc2NoZWQyX3Vu
aXQodi0+c2NoZWRfdW5pdCk7CiAgICAgICAgICAgICBzcGlubG9ja190ICpsb2NrOwogCi0gICAg
ICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdSk7CisgICAgICAgICAg
ICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAKICAg
ICAgICAgICAgIHByaW50aygiXHQlM2Q6ICIsICsrbG9vcCk7CiAgICAgICAgICAgICBjc2NoZWQy
X2R1bXBfdmNwdShwcnYsIHN2Yyk7CiAKLSAgICAgICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2Nr
KGxvY2ssIHN2Yy0+dmNwdSk7CisgICAgICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9jayhsb2Nr
LCBzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICB9CiAgICAgfQogCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmluZGV4
IGI5NTIxNDYwMWYuLjQ3ZDFiMmFiNTYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVs
bC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCkBAIC0zMDksNyArMzA5LDcgQEAgcGlj
a19yZXMoc3RydWN0IG51bGxfcHJpdmF0ZSAqcHJ2LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAq
dW5pdCkKICAgICAgKiBhbGwgdGhlIHBDUFVzIGFyZSBidXN5LgogICAgICAqCiAgICAgICogSW4g
ZmFjdCwgdGhlcmUgbXVzdCBhbHdheXMgYmUgc29tZXRoaW5nIHNhbmUgaW4gdi0+cHJvY2Vzc29y
LCBvcgotICAgICAqIHZjcHVfc2NoZWR1bGVfbG9jaygpIGFuZCBmcmllbmRzIHdvbid0IHdvcmsu
IFRoaXMgaXMgbm90IGEgcHJvYmxlbSwKKyAgICAgKiB1bml0X3NjaGVkdWxlX2xvY2soKSBhbmQg
ZnJpZW5kcyB3b24ndCB3b3JrLiBUaGlzIGlzIG5vdCBhIHByb2JsZW0sCiAgICAgICogYXMgd2Ug
d2lsbCBhY3R1YWxseSBhc3NpZ24gdGhlIHZDUFUgdG8gdGhlIHBDUFUgd2UgcmV0dXJuIGZyb20g
aGVyZSwKICAgICAgKiBvbmx5IGlmIHRoZSBwQ1BVIGlzIGZyZWUuCiAgICAgICovCkBAIC00NTAs
MTEgKzQ1MCwxMSBAQCBzdGF0aWMgdm9pZCBudWxsX3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywKIAogICAgIEFTU0VSVCghaXNfaWRsZV92Y3B1KHYpKTsKIAotICAgIGxv
Y2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHYpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxl
X2xvY2tfaXJxKHVuaXQpOwogCiAgICAgaWYgKCB1bmxpa2VseSghaXNfdmNwdV9vbmxpbmUodikp
ICkKICAgICB7Ci0gICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2KTsKKyAg
ICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHVuaXQpOwogICAgICAgICByZXR1
cm47CiAgICAgfQogCkBAIC00NjQsNyArNDY0LDcgQEAgc3RhdGljIHZvaWQgbnVsbF91bml0X2lu
c2VydChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCiAKICAgICBzcGluX3VubG9jayhsb2Nr
KTsKIAotICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2sodik7CisgICAgbG9jayA9IHVuaXRf
c2NoZWR1bGVfbG9jayh1bml0KTsKIAogICAgIGNwdW1hc2tfYW5kKGNwdW1hc2tfc2NyYXRjaF9j
cHUoY3B1KSwgdi0+Y3B1X2hhcmRfYWZmaW5pdHksCiAgICAgICAgICAgICAgICAgY3B1cG9vbF9k
b21haW5fY3B1bWFzayh2LT5kb21haW4pKTsKQEAgLTUxMyw3ICs1MTMsNyBAQCBzdGF0aWMgdm9p
ZCBudWxsX3VuaXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKIAogICAgIEFT
U0VSVCghaXNfaWRsZV92Y3B1KHYpKTsKIAotICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tf
aXJxKHYpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHVuaXQpOwogCiAgICAg
LyogSWYgb2ZmbGluZSwgdGhlIHZjcHUgc2hvdWxkbid0IGJlIGFzc2lnbmVkLCBub3IgaW4gdGhl
IHdhaXRxdWV1ZSAqLwogICAgIGlmICggdW5saWtlbHkoIWlzX3ZjcHVfb25saW5lKHYpKSApCkBA
IC01MzYsNyArNTM2LDcgQEAgc3RhdGljIHZvaWQgbnVsbF91bml0X3JlbW92ZShjb25zdCBzdHJ1
Y3Qgc2NoZWR1bGVyICpvcHMsCiAgICAgdmNwdV9kZWFzc2lnbihwcnYsIHYpOwogCiAgb3V0Ogot
ICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2KTsKKyAgICB1bml0X3NjaGVkdWxl
X3VubG9ja19pcnEobG9jaywgdW5pdCk7CiAKICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfcmVt
b3ZlKTsKIH0KQEAgLTkzNSwxMyArOTM1LDEzIEBAIHN0YXRpYyB2b2lkIG51bGxfZHVtcChjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiAgICAgICAgICAgICBzdHJ1Y3QgbnVsbF91bml0ICog
Y29uc3QgbnZjID0gbnVsbF91bml0KHYtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgc3Bpbmxv
Y2tfdCAqbG9jazsKIAotICAgICAgICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9jayhudmMt
PnZjcHUpOworICAgICAgICAgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9jayhudmMtPnZjcHUt
PnNjaGVkX3VuaXQpOwogCiAgICAgICAgICAgICBwcmludGsoIlx0JTNkOiAiLCArK2xvb3ApOwog
ICAgICAgICAgICAgZHVtcF92Y3B1KHBydiwgbnZjKTsKICAgICAgICAgICAgIHByaW50aygiXG4i
KTsKIAotICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2sobG9jaywgbnZjLT52Y3B1KTsK
KyAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIG52Yy0+dmNwdS0+c2NoZWRf
dW5pdCk7CiAgICAgICAgIH0KICAgICB9CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRf
cnQuYyBiL3hlbi9jb21tb24vc2NoZWRfcnQuYwppbmRleCBhMTY4NjY4YTcwLi5kYTBhOWM0MDJm
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX3J0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hl
ZF9ydC5jCkBAIC0xNzcsNyArMTc3LDcgQEAgc3RhdGljIHZvaWQgcmVwbF90aW1lcl9oYW5kbGVy
KHZvaWQgKmRhdGEpOwogLyoKICAqIFN5c3RlbS13aWRlIHByaXZhdGUgZGF0YSwgaW5jbHVkZSBn
bG9iYWwgUnVuUXVldWUvRGVwbGV0ZWRRCiAgKiBHbG9iYWwgbG9jayBpcyByZWZlcmVuY2VkIGJ5
IHNjaGVkX3Jlcy0+c2NoZWR1bGVfbG9jayBmcm9tIGFsbAotICogcGh5c2ljYWwgY3B1cy4gSXQg
Y2FuIGJlIGdyYWJiZWQgdmlhIHZjcHVfc2NoZWR1bGVfbG9ja19pcnEoKQorICogcGh5c2ljYWwg
Y3B1cy4gSXQgY2FuIGJlIGdyYWJiZWQgdmlhIHVuaXRfc2NoZWR1bGVfbG9ja19pcnEoKQogICov
CiBzdHJ1Y3QgcnRfcHJpdmF0ZSB7CiAgICAgc3BpbmxvY2tfdCBsb2NrOyAgICAgICAgICAgIC8q
IHRoZSBnbG9iYWwgY29hcnNlLWdyYWluZWQgbG9jayAqLwpAQCAtODk1LDcgKzg5NSw3IEBAIHJ0
X3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQpCiAgICAgdW5pdC0+cmVzID0gcnRfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2
Yy0+cHJvY2Vzc29yID0gdW5pdC0+cmVzLT5tYXN0ZXJfY3B1OwogCi0gICAgbG9jayA9IHZjcHVf
c2NoZWR1bGVfbG9ja19pcnEodmMpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJx
KHVuaXQpOwogCiAgICAgbm93ID0gTk9XKCk7CiAgICAgaWYgKCBub3cgPj0gc3ZjLT5jdXJfZGVh
ZGxpbmUgKQpAQCAtOTA4LDcgKzkwOCw3IEBAIHJ0X3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBz
Y2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgICAgIGlmICggIXZj
LT5pc19ydW5uaW5nICkKICAgICAgICAgICAgIHJ1bnFfaW5zZXJ0KG9wcywgc3ZjKTsKICAgICB9
Ci0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsKKyAgICB1bml0X3NjaGVk
dWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7CiAKICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVf
aW5zZXJ0KTsKIH0KQEAgLTkxOSw3ICs5MTksNiBAQCBydF91bml0X2luc2VydChjb25zdCBzdHJ1
Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogc3RhdGljIHZvaWQK
IHJ0X3VuaXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVk
X3VuaXQgKnVuaXQpCiB7Ci0gICAgc3RydWN0IHZjcHUgKnZjID0gdW5pdC0+dmNwdV9saXN0Owog
ICAgIHN0cnVjdCBydF91bml0ICogY29uc3Qgc3ZjID0gcnRfdW5pdCh1bml0KTsKICAgICBzdHJ1
Y3QgcnRfZG9tICogY29uc3Qgc2RvbSA9IHN2Yy0+c2RvbTsKICAgICBzcGlubG9ja190ICpsb2Nr
OwpAQCAtOTI4LDE0ICs5MjcsMTQgQEAgcnRfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0IHNjaGVk
dWxlciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIAogICAgIEJVR19PTiggc2RvbSA9
PSBOVUxMICk7CiAKLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAg
bG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgICAgaWYgKCB2Y3B1X29uX3Eo
c3ZjKSApCiAgICAgICAgIHFfcmVtb3ZlKHN2Yyk7CiAKICAgICBpZiAoIHZjcHVfb25fcmVwbHEo
c3ZjKSApCiAgICAgICAgIHJlcGxxX3JlbW92ZShvcHMsc3ZjKTsKIAotICAgIHZjcHVfc2NoZWR1
bGVfdW5sb2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxv
Y2ssIHVuaXQpOwogfQogCiAvKgpAQCAtMTMzMCw3ICsxMzI5LDcgQEAgcnRfY29udGV4dF9zYXZl
ZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQog
ewogICAgIHN0cnVjdCB2Y3B1ICp2YyA9IHVuaXQtPnZjcHVfbGlzdDsKICAgICBzdHJ1Y3QgcnRf
dW5pdCAqc3ZjID0gcnRfdW5pdCh1bml0KTsKLSAgICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9z
Y2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgc3BpbmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1
bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICBfX2NsZWFyX2JpdChfX1JURFNfc2NoZWR1bGVkLCAm
c3ZjLT5mbGFncyk7CiAgICAgLyogbm90IGluc2VydCBpZGxlIHZjcHUgdG8gcnVucSAqLwpAQCAt
MTM0Nyw3ICsxMzQ2LDcgQEAgcnRfY29udGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgICAgICByZXBscV9yZW1vdmUob3Bz
LCBzdmMpOwogCiBvdXQ6Ci0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsK
KyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7CiB9CiAKIC8qCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5k
ZXggNjdjY2I3ODczOS4uNmM4ZmEzODA1MiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMjUzLDcgKzI1Myw4IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgKIAogdm9pZCB2Y3B1X3J1bnN0YXRl
X2dldChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3RhdGUp
CiB7Ci0gICAgc3BpbmxvY2tfdCAqbG9jayA9IGxpa2VseSh2ID09IGN1cnJlbnQpID8gTlVMTCA6
IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgc3BpbmxvY2tfdCAqbG9jayA9IGxpa2Vs
eSh2ID09IGN1cnJlbnQpCisgICAgICAgICAgICAgICAgICAgICAgID8gTlVMTCA6IHVuaXRfc2No
ZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAgICAgc190aW1lX3QgZGVsdGE7CiAKICAg
ICBtZW1jcHkocnVuc3RhdGUsICZ2LT5ydW5zdGF0ZSwgc2l6ZW9mKCpydW5zdGF0ZSkpOwpAQCAt
MjYyLDcgKzI2Myw3IEBAIHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0
cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gKnJ1bnN0YXRlKQogICAgICAgICBydW5zdGF0ZS0+dGlt
ZVtydW5zdGF0ZS0+c3RhdGVdICs9IGRlbHRhOwogCiAgICAgaWYgKCB1bmxpa2VseShsb2NrICE9
IE5VTEwpICkKLSAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYpOworICAg
ICAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdi0+c2NoZWRfdW5pdCk7CiB9CiAK
IHVpbnQ2NF90IGdldF9jcHVfaWRsZV90aW1lKHVuc2lnbmVkIGludCBjcHUpCkBAIC00NzgsNyAr
NDc5LDcgQEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBj
cHVwb29sICpjKQogICAgICAgICBtaWdyYXRlX3RpbWVyKCZ2LT5zaW5nbGVzaG90X3RpbWVyLCBu
ZXdfcCk7CiAgICAgICAgIG1pZ3JhdGVfdGltZXIoJnYtPnBvbGxfdGltZXIsIG5ld19wKTsKIAot
ICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICAgICAgbG9jayA9
IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAKICAgICAgICAgc2NoZWRf
c2V0X2FmZmluaXR5KHYsICZjcHVtYXNrX2FsbCwgJmNwdW1hc2tfYWxsKTsKIApAQCAtNDg3LDcg
KzQ4OCw3IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qg
Y3B1cG9vbCAqYykKICAgICAgICAgLyoKICAgICAgICAgICogV2l0aCB2LT5wcm9jZXNzb3IgbW9k
aWZpZWQgd2UgbXVzdCBub3QKICAgICAgICAgICogLSBtYWtlIGFueSBmdXJ0aGVyIGNoYW5nZXMg
YXNzdW1pbmcgd2UgaG9sZCB0aGUgc2NoZWR1bGVyIGxvY2ssCi0gICAgICAgICAqIC0gdXNlIHZj
cHVfc2NoZWR1bGVfdW5sb2NrX2lycSgpLgorICAgICAgICAgKiAtIHVzZSB1bml0X3NjaGVkdWxl
X3VubG9ja19pcnEoKS4KICAgICAgICAgICovCiAgICAgICAgIHNwaW5fdW5sb2NrX2lycShsb2Nr
KTsKIApAQCAtNTg2LDExICs1ODcsMTEgQEAgdm9pZCB2Y3B1X3NsZWVwX25vc3luYyhzdHJ1Y3Qg
dmNwdSAqdikKIAogICAgIFRSQUNFXzJEKFRSQ19TQ0hFRF9TTEVFUCwgdi0+ZG9tYWluLT5kb21h
aW5faWQsIHYtPnZjcHVfaWQpOwogCi0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFz
YXZlKHYsICZmbGFncyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYt
PnNjaGVkX3VuaXQsICZmbGFncyk7CiAKICAgICB2Y3B1X3NsZWVwX25vc3luY19sb2NrZWQodik7
CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2KTsK
KyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2LT5zY2hl
ZF91bml0KTsKIH0KIAogdm9pZCB2Y3B1X3NsZWVwX3N5bmMoc3RydWN0IHZjcHUgKnYpCkBAIC02
MTAsNyArNjExLDcgQEAgdm9pZCB2Y3B1X3dha2Uoc3RydWN0IHZjcHUgKnYpCiAKICAgICBUUkFD
RV8yRChUUkNfU0NIRURfV0FLRSwgdi0+ZG9tYWluLT5kb21haW5faWQsIHYtPnZjcHVfaWQpOwog
Ci0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYsICZmbGFncyk7CisgICAg
bG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYtPnNjaGVkX3VuaXQsICZmbGFncyk7
CiAKICAgICBpZiAoIGxpa2VseSh2Y3B1X3J1bm5hYmxlKHYpKSApCiAgICAgewpAQCAtNjI0LDcg
KzYyNSw3IEBAIHZvaWQgdmNwdV93YWtlKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICAgICAgdmNw
dV9ydW5zdGF0ZV9jaGFuZ2UodiwgUlVOU1RBVEVfb2ZmbGluZSwgTk9XKCkpOwogICAgIH0KIAot
ICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHYpOworICAg
IHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHYtPnNjaGVkX3Vu
aXQpOwogfQogCiB2b2lkIHZjcHVfdW5ibG9jayhzdHJ1Y3QgdmNwdSAqdikKQEAgLTY5Miw5ICs2
OTMsOSBAQCBzdGF0aWMgdm9pZCB2Y3B1X21vdmVfbG9ja2VkKHN0cnVjdCB2Y3B1ICp2LCB1bnNp
Z25lZCBpbnQgbmV3X2NwdSkKICAqIFRoZXNlIHN0ZXBzIGFyZSBlbmNhcHN1bGF0ZWQgaW4gdGhl
IGZvbGxvd2luZyB0d28gZnVuY3Rpb25zOyB0aGV5CiAgKiBzaG91bGQgYmUgY2FsbGVkIGxpa2Ug
dGhpczoKICAqCi0gKiAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgKiAg
ICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgKiAgICAgdmNwdV9taWdy
YXRlX3N0YXJ0KHYpOwotICogICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2KQor
ICogICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB1bml0KQogICogICAgIHZjcHVf
bWlncmF0ZV9maW5pc2godik7CiAgKgogICogdmNwdV9taWdyYXRlX2ZpbmlzaCgpIHdpbGwgZG8g
dGhlIHdvcmsgbm93IGlmIGl0IGNhbiwgb3Igc2ltcGx5CkBAIC04MTMsNyArODE0LDcgQEAgdm9p
ZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKICAgICAgICAgICogc2V0
IHYtPnByb2Nlc3NvciBvZiBlYWNoIG9mIHRoZWlyIHZDUFVzIHRvIHNvbWV0aGluZyB0aGF0IHdp
bGwKICAgICAgICAgICogbWFrZSBzZW5zZSBmb3IgdGhlIHNjaGVkdWxlciBvZiB0aGUgY3B1cG9v
bCBpbiB3aGljaCB0aGV5IGFyZSBpbi4KICAgICAgICAgICovCi0gICAgICAgIGxvY2sgPSB2Y3B1
X3NjaGVkdWxlX2xvY2tfaXJxKHYpOworICAgICAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2Nr
X2lycSh2LT5zY2hlZF91bml0KTsKIAogICAgICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0
Y2hfY3B1KGNwdSksIHYtPmNwdV9oYXJkX2FmZmluaXR5LAogICAgICAgICAgICAgICAgICAgICBj
cHVwb29sX2RvbWFpbl9jcHVtYXNrKGQpKTsKQEAgLTg0Miw3ICs4NDMsNyBAQCB2b2lkIHJlc3Rv
cmVfdmNwdV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICBzcGluX3VubG9ja19p
cnEobG9jayk7CiAKICAgICAgICAgLyogdi0+cHJvY2Vzc29yIG1pZ2h0IGhhdmUgY2hhbmdlZCwg
c28gcmVhY3F1aXJlIHRoZSBsb2NrLiAqLwotICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9s
b2NrX2lycSh2KTsKKyAgICAgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+c2No
ZWRfdW5pdCk7CiAgICAgICAgIHYtPnNjaGVkX3VuaXQtPnJlcyA9IHNjaGVkX3BpY2tfcmVzb3Vy
Y2UodmNwdV9zY2hlZHVsZXIodiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdi0+c2NoZWRfdW5pdCk7CiAgICAgICAgIHYtPnByb2Nlc3NvciA9IHYt
PnNjaGVkX3VuaXQtPnJlcy0+bWFzdGVyX2NwdTsKQEAgLTg3Nyw3ICs4NzgsNyBAQCBpbnQgY3B1
X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgIGZvcl9lYWNoX3Zj
cHUgKCBkLCB2ICkKICAgICAgICAgewogICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsK
LSAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2
ZSh2LCAmZmxhZ3MpOworICAgICAgICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1
bGVfbG9ja19pcnFzYXZlKHYtPnNjaGVkX3VuaXQsICZmbGFncyk7CiAKICAgICAgICAgICAgIGNw
dW1hc2tfYW5kKCZvbmxpbmVfYWZmaW5pdHksIHYtPmNwdV9oYXJkX2FmZmluaXR5LCBjLT5jcHVf
dmFsaWQpOwogICAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KCZvbmxpbmVfYWZmaW5pdHkp
ICYmCkBAIC04ODYsNyArODg3LDcgQEAgaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcih1bnNpZ25l
ZCBpbnQgY3B1KQogICAgICAgICAgICAgICAgIGlmICggdi0+YWZmaW5pdHlfYnJva2VuICkKICAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIC8qIFRoZSB2Y3B1IGlzIHRlbXBv
cmFyaWx5IHBpbm5lZCwgY2FuJ3QgbW92ZSBpdC4gKi8KLSAgICAgICAgICAgICAgICAgICAgdmNw
dV9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgdik7CisgICAgICAgICAg
ICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHYt
PnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgICAgICAgICByZXQgPSAtRUFERFJJTlVTRTsKICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICAgICAgfQpAQCAtODk5LDcgKzkw
MCw3IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKICAgICAg
ICAgICAgIGlmICggdi0+cHJvY2Vzc29yICE9IGNwdSApCiAgICAgICAgICAgICB7CiAgICAgICAg
ICAgICAgICAgLyogVGhlIHZjcHUgaXMgbm90IG9uIHRoaXMgY3B1LCBzbyB3ZSBjYW4gbW92ZSBv
bi4gKi8KLSAgICAgICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxv
Y2ssIGZsYWdzLCB2KTsKKyAgICAgICAgICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnFy
ZXN0b3JlKGxvY2ssIGZsYWdzLCB2LT5zY2hlZF91bml0KTsKICAgICAgICAgICAgICAgICBjb250
aW51ZTsKICAgICAgICAgICAgIH0KIApAQCAtOTEyLDcgKzkxMyw3IEBAIGludCBjcHVfZGlzYWJs
ZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgICAgICAqICAgIHRoaW5ncyB3
b3VsZCBoYXZlIGZhaWxlZCBiZWZvcmUgZ2V0dGluZyBpbiBoZXJlLgogICAgICAgICAgICAgICov
CiAgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfc3RhcnQodik7Ci0gICAgICAgICAgICB2Y3B1X3Nj
aGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2KTsKKyAgICAgICAgICAgIHVu
aXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHYtPnNjaGVkX3VuaXQp
OwogCiAgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYpOwogCkBAIC05NzYsNyArOTc3
LDcgQEAgc3RhdGljIGludCB2Y3B1X3NldF9hZmZpbml0eSgKICAgICBzcGlubG9ja190ICpsb2Nr
OwogICAgIGludCByZXQgPSAwOwogCi0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEo
dik7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAK
ICAgICBpZiAoIHYtPmFmZmluaXR5X2Jyb2tlbiApCiAgICAgICAgIHJldCA9IC1FQlVTWTsKQEAg
LTk5OCw3ICs5OTksNyBAQCBzdGF0aWMgaW50IHZjcHVfc2V0X2FmZmluaXR5KAogICAgICAgICB2
Y3B1X21pZ3JhdGVfc3RhcnQodik7CiAgICAgfQogCi0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tf
aXJxKGxvY2ssIHYpOworICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2LT5zY2hl
ZF91bml0KTsKIAogICAgIGRvbWFpbl91cGRhdGVfbm9kZV9hZmZpbml0eSh2LT5kb21haW4pOwog
CkBAIC0xMTMwLDEwICsxMTMxLDEwIEBAIHN0YXRpYyBsb25nIGRvX3BvbGwoc3RydWN0IHNjaGVk
X3BvbGwgKnNjaGVkX3BvbGwpCiBsb25nIHZjcHVfeWllbGQodm9pZCkKIHsKICAgICBzdHJ1Y3Qg
dmNwdSAqIHY9Y3VycmVudDsKLSAgICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9zY2hlZHVsZV9s
b2NrX2lycSh2KTsKKyAgICBzcGlubG9ja190ICpsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2ly
cSh2LT5zY2hlZF91bml0KTsKIAogICAgIHNjaGVkX3lpZWxkKHZjcHVfc2NoZWR1bGVyKHYpLCB2
LT5zY2hlZF91bml0KTsKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7Cisg
ICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwogCiAgICAg
U0NIRURfU1RBVF9DUkFOSyh2Y3B1X3lpZWxkKTsKIApAQCAtMTIzMCw3ICsxMjMxLDcgQEAgaW50
IHZjcHVfdGVtcG9yYXJ5X2FmZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgY3B1
LCB1aW50OF90IHJlYXNvbikKICAgICBpbnQgcmV0ID0gLUVJTlZBTDsKICAgICBib29sIG1pZ3Jh
dGU7CiAKLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICBsb2NrID0g
dW5pdF9zY2hlZHVsZV9sb2NrX2lycSh2LT5zY2hlZF91bml0KTsKIAogICAgIGlmICggY3B1ID09
IE5SX0NQVVMgKQogICAgIHsKQEAgLTEyNjMsNyArMTI2NCw3IEBAIGludCB2Y3B1X3RlbXBvcmFy
eV9hZmZpbml0eShzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IGNwdSwgdWludDhfdCByZWFz
b24pCiAgICAgaWYgKCBtaWdyYXRlICkKICAgICAgICAgdmNwdV9taWdyYXRlX3N0YXJ0KHYpOwog
Ci0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYpOworICAgIHVuaXRfc2NoZWR1
bGVfdW5sb2NrX2lycShsb2NrLCB2LT5zY2hlZF91bml0KTsKIAogICAgIGlmICggbWlncmF0ZSAp
CiAgICAgICAgIHZjcHVfbWlncmF0ZV9maW5pc2godik7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IDRkYmY4
Zjk3NGMuLmYyYzA3MTM1OGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC0xMDUsMjIgKzEwNSwyMiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQga2luZCMjX3NjaGVkdWxlX3VubG9jayMjaXJxKHNwaW5sb2NrX3Qg
KmxvY2sgXAogCiAjZGVmaW5lIEVYVFJBX1RZUEUoYXJnKQogc2NoZWRfbG9jayhwY3B1LCB1bnNp
Z25lZCBpbnQgY3B1LCAgICAgY3B1LCApCi1zY2hlZF9sb2NrKHZjcHUsIGNvbnN0IHN0cnVjdCB2
Y3B1ICp2LCB2LT5wcm9jZXNzb3IsICkKK3NjaGVkX2xvY2sodW5pdCwgY29uc3Qgc3RydWN0IHNj
aGVkX3VuaXQgKmksIGktPnJlcy0+bWFzdGVyX2NwdSwgKQogc2NoZWRfbG9jayhwY3B1LCB1bnNp
Z25lZCBpbnQgY3B1LCAgICAgY3B1LCAgICAgICAgICBfaXJxKQotc2NoZWRfbG9jayh2Y3B1LCBj
b25zdCBzdHJ1Y3QgdmNwdSAqdiwgdi0+cHJvY2Vzc29yLCBfaXJxKQorc2NoZWRfbG9jayh1bml0
LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqaSwgaS0+cmVzLT5tYXN0ZXJfY3B1LCBfaXJxKQog
c2NoZWRfdW5sb2NrKHBjcHUsIHVuc2lnbmVkIGludCBjcHUsICAgICBjcHUsICkKLXNjaGVkX3Vu
bG9jayh2Y3B1LCBjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdi0+cHJvY2Vzc29yLCApCitzY2hlZF91
bmxvY2sodW5pdCwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKmksIGktPnJlcy0+bWFzdGVyX2Nw
dSwgKQogc2NoZWRfdW5sb2NrKHBjcHUsIHVuc2lnbmVkIGludCBjcHUsICAgICBjcHUsICAgICAg
ICAgIF9pcnEpCi1zY2hlZF91bmxvY2sodmNwdSwgY29uc3Qgc3RydWN0IHZjcHUgKnYsIHYtPnBy
b2Nlc3NvciwgX2lycSkKK3NjaGVkX3VubG9jayh1bml0LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5p
dCAqaSwgaS0+cmVzLT5tYXN0ZXJfY3B1LCBfaXJxKQogI3VuZGVmIEVYVFJBX1RZUEUKIAogI2Rl
ZmluZSBFWFRSQV9UWVBFKGFyZykgLCB1bnNpZ25lZCBsb25nIGFyZwogI2RlZmluZSBzcGluX3Vu
bG9ja19pcnFzYXZlIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUKIHNjaGVkX2xvY2socGNwdSwgdW5z
aWduZWQgaW50IGNwdSwgICAgIGNwdSwgICAgICAgICAgX2lycXNhdmUsICpmbGFncykKLXNjaGVk
X2xvY2sodmNwdSwgY29uc3Qgc3RydWN0IHZjcHUgKnYsIHYtPnByb2Nlc3NvciwgX2lycXNhdmUs
ICpmbGFncykKK3NjaGVkX2xvY2sodW5pdCwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKmksIGkt
PnJlcy0+bWFzdGVyX2NwdSwgX2lycXNhdmUsICpmbGFncykKICN1bmRlZiBzcGluX3VubG9ja19p
cnFzYXZlCiBzY2hlZF91bmxvY2socGNwdSwgdW5zaWduZWQgaW50IGNwdSwgICAgIGNwdSwgICAg
ICAgICAgX2lycXJlc3RvcmUsIGZsYWdzKQotc2NoZWRfdW5sb2NrKHZjcHUsIGNvbnN0IHN0cnVj
dCB2Y3B1ICp2LCB2LT5wcm9jZXNzb3IsIF9pcnFyZXN0b3JlLCBmbGFncykKK3NjaGVkX3VubG9j
ayh1bml0LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqaSwgaS0+cmVzLT5tYXN0ZXJfY3B1LCBf
aXJxcmVzdG9yZSwgZmxhZ3MpCiAjdW5kZWYgRVhUUkFfVFlQRQogCiAjdW5kZWYgc2NoZWRfdW5s
b2NrCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
