Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3AB87D99
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 17:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw6M0-0006X0-00; Fri, 09 Aug 2019 14:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hw6Lx-0006TK-48
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:58:49 +0000
X-Inumbo-ID: 2d70953e-bab6-11e9-ba73-77a104decbdc
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d70953e-bab6-11e9-ba73-77a104decbdc;
 Fri, 09 Aug 2019 14:58:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 71042B05E;
 Fri,  9 Aug 2019 14:58:40 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 16:57:53 +0200
Message-Id: <20190809145833.1020-9-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809145833.1020-1-jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 08/48] xen/sched: switch vcpu_schedule_lock
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
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMg
IHwgMTcgKysrKysrKystLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgfCA0MCAr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX251
bGwuYyAgICB8IDE2ICsrKysrKystLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZF9ydC5jICAgICAg
fCAxNSArKysrKysrLS0tLS0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgfCA0OSArKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94
ZW4vc2NoZWQtaWYuaCB8IDEyICsrKysrKy0tLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNl
cnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVk
X2NyZWRpdC5jIGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwppbmRleCAyNjFkMjA4M2M3Li42
MDM3OTNmMWQwIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCisrKyBiL3hl
bi9jb21tb24vc2NoZWRfY3JlZGl0LmMKQEAgLTkyNiw3ICs5MjYsOCBAQCBfX2NzY2hlZF92Y3B1
X2FjY3Rfc3RvcF9sb2NrZWQoc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsCiBzdGF0aWMgdm9p
ZAogY3NjaGVkX3ZjcHVfYWNjdChzdHJ1Y3QgY3NjaGVkX3ByaXZhdGUgKnBydiwgdW5zaWduZWQg
aW50IGNwdSkKIHsKLSAgICBzdHJ1Y3QgY3NjaGVkX3VuaXQgKiBjb25zdCBzdmMgPSBDU0NIRURf
VU5JVChjdXJyZW50LT5zY2hlZF91bml0KTsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqY3VycnVu
aXQgPSBjdXJyZW50LT5zY2hlZF91bml0OworICAgIHN0cnVjdCBjc2NoZWRfdW5pdCAqIGNvbnN0
IHN2YyA9IENTQ0hFRF9VTklUKGN1cnJ1bml0KTsKICAgICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKIAogICAgIEFTU0VSVCggY3VycmVudC0+
cHJvY2Vzc29yID09IGNwdSApOwpAQCAtOTYyLDcgKzk2Myw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qo
c3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgewogICAg
ICAgICB1bnNpZ25lZCBpbnQgbmV3X2NwdTsKICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsK
LSAgICAgICAgc3BpbmxvY2tfdCAqbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKGN1
cnJlbnQsICZmbGFncyk7CisgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB1bml0X3NjaGVkdWxl
X2xvY2tfaXJxc2F2ZShjdXJydW5pdCwgJmZsYWdzKTsKIAogICAgICAgICAvKgogICAgICAgICAg
KiBJZiBpdCdzIGJlZW4gYWN0aXZlIGEgd2hpbGUsIGNoZWNrIGlmIHdlJ2QgYmUgYmV0dGVyIG9m
ZgpAQCAtOTcxLDcgKzk3Miw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qoc3RydWN0IGNzY2hlZF9wcml2
YXRlICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgICAgICAqLwogICAgICAgICBuZXdfY3B1
ID0gX2NzY2hlZF9jcHVfcGljayhvcHMsIGN1cnJlbnQsIDApOwogCi0gICAgICAgIHZjcHVfc2No
ZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIGN1cnJlbnQpOworICAgICAgICB1
bml0X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCBjdXJydW5pdCk7CiAK
ICAgICAgICAgaWYgKCBuZXdfY3B1ICE9IGNwdSApCiAgICAgICAgIHsKQEAgLTEwMjMsMTkgKzEw
MjQsMTkgQEAgY3NjaGVkX3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgQlVHX09OKCBpc19pZGxlX3ZjcHUodmMpICk7
CiAKICAgICAvKiBjc2NoZWRfcmVzX3BpY2soKSBsb29rcyBpbiB2Yy0+cHJvY2Vzc29yJ3MgcnVu
cSwgc28gd2UgbmVlZCB0aGUgbG9jay4gKi8KLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2Nr
X2lycSh2Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAg
ICB1bml0LT5yZXMgPSBjc2NoZWRfcmVzX3BpY2sob3BzLCB1bml0KTsKICAgICB2Yy0+cHJvY2Vz
c29yID0gdW5pdC0+cmVzLT5wcm9jZXNzb3I7CiAKICAgICBzcGluX3VubG9ja19pcnEobG9jayk7
CiAKLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgbG9jayA9IHVu
aXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAKICAgICBpZiAoICFfX3ZjcHVfb25fcnVucShz
dmMpICYmIHZjcHVfcnVubmFibGUodmMpICYmICF2Yy0+aXNfcnVubmluZyApCiAgICAgICAgIHJ1
bnFfaW5zZXJ0KHN2Yyk7CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdmMp
OworICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB1bml0KTsKIAogICAgIFNDSEVE
X1NUQVRfQ1JBTksodmNwdV9pbnNlcnQpOwogfQpAQCAtMjEzMywxMiArMjEzNCwxMiBAQCBjc2No
ZWRfZHVtcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCiAgICAgICAgICAgICBzcGlubG9j
a190ICpsb2NrOwogCiAgICAgICAgICAgICBzdmMgPSBsaXN0X2VudHJ5KGl0ZXJfc3ZjLCBzdHJ1
Y3QgY3NjaGVkX3VuaXQsIGFjdGl2ZV92Y3B1X2VsZW0pOwotICAgICAgICAgICAgbG9jayA9IHZj
cHVfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUpOworICAgICAgICAgICAgbG9jayA9IHVuaXRfc2No
ZWR1bGVfbG9jayhzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogCiAgICAgICAgICAgICBwcmludGso
Ilx0JTNkOiAiLCArK2xvb3ApOwogICAgICAgICAgICAgY3NjaGVkX2R1bXBfdmNwdShzdmMpOwog
Ci0gICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUpOworICAg
ICAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2sobG9jaywgc3ZjLT52Y3B1LT5zY2hlZF91bml0
KTsKICAgICAgICAgfQogICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVk
aXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwppbmRleCAwMmUyODU1ZDhkLi4xNzk4
ZmNmOGM0IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4v
Y29tbW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMTcxLDcgKzE3MSw3IEBACiAgKiAtIHJ1bnF1ZXVl
IGxvY2sKICAqICArIGl0IGlzIHBlci1ydW5xdWV1ZSwgc286CiAgKiAgICogY3B1cyBpbiBhIHJ1
bnF1ZXVlIHRha2UgdGhlIHJ1bnF1ZXVlIGxvY2ssIHdoZW4gdXNpbmcKLSAqICAgICBwY3B1X3Nj
aGVkdWxlX2xvY2soKSAvIHZjcHVfc2NoZWR1bGVfbG9jaygpIChhbmQgZnJpZW5kcyksCisgKiAg
ICAgcGNwdV9zY2hlZHVsZV9sb2NrKCkgLyB1bml0X3NjaGVkdWxlX2xvY2soKSAoYW5kIGZyaWVu
ZHMpLAogICogICAqIGEgY3B1IG1heSAodHJ5IHRvKSB0YWtlIGEgInJlbW90ZSIgcnVucXVldWUg
bG9jaywgZS5nLiwgZm9yCiAgKiAgICAgbG9hZCBiYWxhbmNpbmc7CiAgKiAgKyBzZXJpYWxpemVz
IHJ1bnF1ZXVlIG9wZXJhdGlvbnMgKHJlbW92aW5nIGFuZCBpbnNlcnRpbmcgdmNwdXMpOwpAQCAt
MTg5MSw3ICsxODkxLDcgQEAgdW5wYXJrX3BhcmtlZF92Y3B1cyhjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICpvcHMsIHN0cnVjdCBsaXN0X2hlYWQgKnZjcHVzKQogICAgICAgICB1bnNpZ25lZCBsb25n
IGZsYWdzOwogICAgICAgICBzX3RpbWVfdCBub3c7CiAKLSAgICAgICAgbG9jayA9IHZjcHVfc2No
ZWR1bGVfbG9ja19pcnFzYXZlKHN2Yy0+dmNwdSwgJmZsYWdzKTsKKyAgICAgICAgbG9jayA9IHVu
aXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCwgJmZsYWdzKTsK
IAogICAgICAgICBfX2NsZWFyX2JpdChfVlBGX3BhcmtlZCwgJnN2Yy0+dmNwdS0+cGF1c2VfZmxh
Z3MpOwogICAgICAgICBpZiAoIHVubGlrZWx5KHN2Yy0+ZmxhZ3MgJiBDU0ZMQUdfc2NoZWR1bGVk
KSApCkBAIC0xOTI0LDcgKzE5MjQsNyBAQCB1bnBhcmtfcGFya2VkX3ZjcHVzKGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IGxpc3RfaGVhZCAqdmNwdXMpCiAgICAgICAgIH0KICAg
ICAgICAgbGlzdF9kZWxfaW5pdCgmc3ZjLT5wYXJrZWRfZWxlbSk7CiAKLSAgICAgICAgdmNwdV9z
Y2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgc3ZjLT52Y3B1KTsKKyAgICAg
ICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgc3ZjLT52Y3B1
LT5zY2hlZF91bml0KTsKICAgICB9CiB9CiAKQEAgLTIxNjMsNyArMjE2Myw3IEBAIGNzY2hlZDJf
Y29udGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91
bml0ICp1bml0KQogewogICAgIHN0cnVjdCB2Y3B1ICp2YyA9IHVuaXQtPnZjcHVfbGlzdDsKICAg
ICBzdHJ1Y3QgY3NjaGVkMl91bml0ICogY29uc3Qgc3ZjID0gY3NjaGVkMl91bml0KHVuaXQpOwot
ICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHZjKTsKKyAgICBz
cGlubG9ja190ICpsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0KTsKICAgICBzX3Rp
bWVfdCBub3cgPSBOT1coKTsKICAgICBMSVNUX0hFQUQod2VyZV9wYXJrZWQpOwogCkBAIC0yMTk1
LDcgKzIxOTUsNyBAQCBjc2NoZWQyX2NvbnRleHRfc2F2ZWQoY29uc3Qgc3RydWN0IHNjaGVkdWxl
ciAqb3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKICAgICBlbHNlIGlmICggIWlzX2lkbGVf
dmNwdSh2YykgKQogICAgICAgICB1cGRhdGVfbG9hZChvcHMsIHN2Yy0+cnFkLCBzdmMsIC0xLCBu
b3cpOwogCi0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsKKyAgICB1bml0
X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7CiAKICAgICB1bnBhcmtfcGFya2VkX3Zj
cHVzKG9wcywgJndlcmVfcGFya2VkKTsKIH0KQEAgLTI4NDgsMTQgKzI4NDgsMTQgQEAgY3NjaGVk
Ml9kb21fY250bCgKICAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICBzdHJ1Y3QgY3NjaGVkMl91bml0ICpzdmMgPSBjc2NoZWQy
X3VuaXQodi0+c2NoZWRfdW5pdCk7Ci0gICAgICAgICAgICAgICAgc3BpbmxvY2tfdCAqbG9jayA9
IHZjcHVfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgIHNwaW5sb2Nr
X3QgKmxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKIAog
ICAgICAgICAgICAgICAgIEFTU0VSVChzdmMtPnJxZCA9PSBjMnJxZChvcHMsIHN2Yy0+dmNwdS0+
cHJvY2Vzc29yKSk7CiAKICAgICAgICAgICAgICAgICBzdmMtPndlaWdodCA9IHNkb20tPndlaWdo
dDsKICAgICAgICAgICAgICAgICB1cGRhdGVfbWF4X3dlaWdodChzdmMtPnJxZCwgc3ZjLT53ZWln
aHQsIG9sZF93ZWlnaHQpOwogCi0gICAgICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2so
bG9jaywgc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9jayhs
b2NrLCBzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgfQogICAgICAgICB9CiAg
ICAgICAgIC8qIENhcCAqLwpAQCAtMjg4Niw3ICsyODg2LDcgQEAgY3NjaGVkMl9kb21fY250bCgK
ICAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICBzdmMgPSBjc2NoZWQyX3VuaXQodi0+c2NoZWRfdW5pdCk7Ci0gICAgICAgICAg
ICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUpOworICAgICAgICAgICAg
ICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKICAg
ICAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICAgICAqIFRvbyBzbWFsbCBxdW90YXMgd291
bGQgaW4gdGhlb3J5IGNhdXNlIGEgbG90IG9mIG92ZXJoZWFkLAogICAgICAgICAgICAgICAgICAq
IHdoaWNoIHRoZW4gd29uJ3QgaGFwcGVuIGJlY2F1c2UsIGluIGNzY2hlZDJfcnVudGltZSgpLApA
QCAtMjg5NCw3ICsyODk0LDcgQEAgY3NjaGVkMl9kb21fY250bCgKICAgICAgICAgICAgICAgICAg
Ki8KICAgICAgICAgICAgICAgICBzdmMtPmJ1ZGdldF9xdW90YSA9IG1heChzZG9tLT50b3RfYnVk
Z2V0IC8gc2RvbS0+bnJfdmNwdXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQ1NDSEVEMl9NSU5fVElNRVIpOwotICAgICAgICAgICAgICAgIHZjcHVfc2NoZWR1bGVf
dW5sb2NrKGxvY2ssIHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgdW5pdF9zY2hlZHVsZV91
bmxvY2sobG9jaywgc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKICAgICAgICAgICAgIH0KIAogICAg
ICAgICAgICAgaWYgKCBzZG9tLT5jYXAgPT0gMCApCkBAIC0yOTI5LDcgKzI5MjksNyBAQCBjc2No
ZWQyX2RvbV9jbnRsKAogICAgICAgICAgICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKICAg
ICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIHN2YyA9IGNzY2hlZDJfdW5pdCh2
LT5zY2hlZF91bml0KTsKLSAgICAgICAgICAgICAgICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVf
bG9jayhzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgICAgICBsb2NrID0gdW5pdF9zY2hlZHVs
ZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgICAgICAgICAgICAgIGlmICgg
di0+aXNfcnVubmluZyApCiAgICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBjcHUgPSB2LT5wcm9jZXNzb3I7CkBAIC0yOTYwLDcgKzI5NjAs
NyBAQCBjc2NoZWQyX2RvbV9jbnRsKAogICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3JhaXNl
X3NvZnRpcnEoY3B1LCBTQ0hFRFVMRV9TT0ZUSVJRKTsKICAgICAgICAgICAgICAgICAgICAgfQog
ICAgICAgICAgICAgICAgICAgICBzdmMtPmJ1ZGdldCA9IDA7Ci0gICAgICAgICAgICAgICAgICAg
IHZjcHVfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAg
ICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAg
ICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgfQogCkBAIC0yOTc2LDEyICsyOTc2LDEyIEBA
IGNzY2hlZDJfZG9tX2NudGwoCiAgICAgICAgICAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAg
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgc3RydWN0IGNzY2hlZDJfdW5pdCAqc3ZjID0g
Y3NjaGVkMl91bml0KHYtPnNjaGVkX3VuaXQpOwotICAgICAgICAgICAgICAgIHNwaW5sb2NrX3Qg
KmxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2soc3ZjLT52Y3B1KTsKKyAgICAgICAgICAgICAgICBz
cGlubG9ja190ICpsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrKHN2Yy0+dmNwdS0+c2NoZWRfdW5p
dCk7CiAKICAgICAgICAgICAgICAgICBzdmMtPmJ1ZGdldCA9IFNUSU1FX01BWDsKICAgICAgICAg
ICAgICAgICBzdmMtPmJ1ZGdldF9xdW90YSA9IDA7CiAKLSAgICAgICAgICAgICAgICB2Y3B1X3Nj
aGVkdWxlX3VubG9jayhsb2NrLCBzdmMtPnZjcHUpOworICAgICAgICAgICAgICAgIHVuaXRfc2No
ZWR1bGVfdW5sb2NrKGxvY2ssIHN2Yy0+dmNwdS0+c2NoZWRfdW5pdCk7CiAgICAgICAgICAgICB9
CiAgICAgICAgICAgICBzZG9tLT5jYXAgPSAwOwogICAgICAgICAgICAgLyoKQEAgLTMxMjAsMTkg
KzMxMjAsMTkgQEAgY3NjaGVkMl91bml0X2luc2VydChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpv
cHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgIEFTU0VSVChsaXN0X2VtcHR5KCZzdmMt
PnJ1bnFfZWxlbSkpOwogCiAgICAgLyogY3NjaGVkMl9yZXNfcGljaygpIGV4cGVjdHMgdGhlIHBj
cHUgbG9jayB0byBiZSBoZWxkICovCi0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEo
dmMpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHVuaXQpOwogCiAgICAgdW5p
dC0+cmVzID0gY3NjaGVkMl9yZXNfcGljayhvcHMsIHVuaXQpOwogICAgIHZjLT5wcm9jZXNzb3Ig
PSB1bml0LT5yZXMtPnByb2Nlc3NvcjsKIAogICAgIHNwaW5fdW5sb2NrX2lycShsb2NrKTsKIAot
ICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHZjKTsKKyAgICBsb2NrID0gdW5pdF9z
Y2hlZHVsZV9sb2NrX2lycSh1bml0KTsKIAogICAgIC8qIEFkZCB2Y3B1IHRvIHJ1bnF1ZXVlIG9m
IGluaXRpYWwgcHJvY2Vzc29yICovCiAgICAgcnVucV9hc3NpZ24ob3BzLCB2Yyk7CiAKLSAgICB2
Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdmMpOworICAgIHVuaXRfc2NoZWR1bGVfdW5s
b2NrX2lycShsb2NrLCB1bml0KTsKIAogICAgIHNkb20tPm5yX3ZjcHVzKys7CiAKQEAgLTMxNjIs
MTEgKzMxNjIsMTEgQEAgY3NjaGVkMl91bml0X3JlbW92ZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgIFNDSEVEX1NUQVRfQ1JBTksodmNw
dV9yZW1vdmUpOwogCiAgICAgLyogUmVtb3ZlIGZyb20gcnVucXVldWUgKi8KLSAgICBsb2NrID0g
dmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9j
a19pcnEodW5pdCk7CiAKICAgICBydW5xX2RlYXNzaWduKG9wcywgdmMpOwogCi0gICAgdmNwdV9z
Y2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsKKyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19p
cnEobG9jaywgdW5pdCk7CiAKICAgICBzdmMtPnNkb20tPm5yX3ZjcHVzLS07CiB9CkBAIC0zNzUw
LDEyICszNzUwLDEyIEBAIGNzY2hlZDJfZHVtcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMp
CiAgICAgICAgICAgICBzdHJ1Y3QgY3NjaGVkMl91bml0ICogY29uc3Qgc3ZjID0gY3NjaGVkMl91
bml0KHYtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgc3BpbmxvY2tfdCAqbG9jazsKIAotICAg
ICAgICAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUpOworICAgICAgICAg
ICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9jayhzdmMtPnZjcHUtPnNjaGVkX3VuaXQpOwogCiAg
ICAgICAgICAgICBwcmludGsoIlx0JTNkOiAiLCArK2xvb3ApOwogICAgICAgICAgICAgY3NjaGVk
Ml9kdW1wX3ZjcHUocHJ2LCBzdmMpOwogCi0gICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9j
ayhsb2NrLCBzdmMtPnZjcHUpOworICAgICAgICAgICAgdW5pdF9zY2hlZHVsZV91bmxvY2sobG9j
aywgc3ZjLT52Y3B1LT5zY2hlZF91bml0KTsKICAgICAgICAgfQogICAgIH0KIApkaWZmIC0tZ2l0
IGEveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwppbmRl
eCA1ZjAzNTZjN2Y4Li40MGVmOWY5MDg5IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX251
bGwuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX251bGwuYwpAQCAtMzA5LDcgKzMwOSw3IEBAIHBp
Y2tfcmVzKHN0cnVjdCBudWxsX3ByaXZhdGUgKnBydiwgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQp
CiAgICAgICogYWxsIHRoZSBwQ1BVcyBhcmUgYnVzeS4KICAgICAgKgogICAgICAqIEluIGZhY3Qs
IHRoZXJlIG11c3QgYWx3YXlzIGJlIHNvbWV0aGluZyBzYW5lIGluIHYtPnByb2Nlc3Nvciwgb3IK
LSAgICAgKiB2Y3B1X3NjaGVkdWxlX2xvY2soKSBhbmQgZnJpZW5kcyB3b24ndCB3b3JrLiBUaGlz
IGlzIG5vdCBhIHByb2JsZW0sCisgICAgICogdW5pdF9zY2hlZHVsZV9sb2NrKCkgYW5kIGZyaWVu
ZHMgd29uJ3Qgd29yay4gVGhpcyBpcyBub3QgYSBwcm9ibGVtLAogICAgICAqIGFzIHdlIHdpbGwg
YWN0dWFsbHkgYXNzaWduIHRoZSB2Q1BVIHRvIHRoZSBwQ1BVIHdlIHJldHVybiBmcm9tIGhlcmUs
CiAgICAgICogb25seSBpZiB0aGUgcENQVSBpcyBmcmVlLgogICAgICAqLwpAQCAtNDUwLDExICs0
NTAsMTEgQEAgc3RhdGljIHZvaWQgbnVsbF91bml0X2luc2VydChjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICpvcHMsCiAKICAgICBBU1NFUlQoIWlzX2lkbGVfdmNwdSh2KSk7CiAKLSAgICBsb2NrID0g
dmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2Nr
X2lycSh1bml0KTsKIAogICAgIGlmICggdW5saWtlbHkoIWlzX3ZjcHVfb25saW5lKHYpKSApCiAg
ICAgewotICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7CisgICAgICAg
IHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB1bml0KTsKICAgICAgICAgcmV0dXJuOwog
ICAgIH0KIApAQCAtNDY0LDcgKzQ2NCw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF9pbnNlcnQo
Y29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogCiAgICAgc3Bpbl91bmxvY2sobG9jayk7CiAK
LSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrKHYpOworICAgIGxvY2sgPSB1bml0X3NjaGVk
dWxlX2xvY2sodW5pdCk7CiAKICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNw
dSksIHYtPmNwdV9oYXJkX2FmZmluaXR5LAogICAgICAgICAgICAgICAgIGNwdXBvb2xfZG9tYWlu
X2NwdW1hc2sodi0+ZG9tYWluKSk7CkBAIC01MTMsNyArNTEzLDcgQEAgc3RhdGljIHZvaWQgbnVs
bF91bml0X3JlbW92ZShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsCiAKICAgICBBU1NFUlQo
IWlzX2lkbGVfdmNwdSh2KSk7CiAKLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2
KTsKKyAgICBsb2NrID0gdW5pdF9zY2hlZHVsZV9sb2NrX2lycSh1bml0KTsKIAogICAgIC8qIElm
IG9mZmxpbmUsIHRoZSB2Y3B1IHNob3VsZG4ndCBiZSBhc3NpZ25lZCwgbm9yIGluIHRoZSB3YWl0
cXVldWUgKi8KICAgICBpZiAoIHVubGlrZWx5KCFpc192Y3B1X29ubGluZSh2KSkgKQpAQCAtNTM2
LDcgKzUzNiw3IEBAIHN0YXRpYyB2b2lkIG51bGxfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0IHNj
aGVkdWxlciAqb3BzLAogICAgIHZjcHVfZGVhc3NpZ24ocHJ2LCB2KTsKIAogIG91dDoKLSAgICB2
Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7CisgICAgdW5pdF9zY2hlZHVsZV91bmxv
Y2tfaXJxKGxvY2ssIHVuaXQpOwogCiAgICAgU0NIRURfU1RBVF9DUkFOSyh2Y3B1X3JlbW92ZSk7
CiB9CkBAIC05MzUsMTMgKzkzNSwxMyBAQCBzdGF0aWMgdm9pZCBudWxsX2R1bXAoY29uc3Qgc3Ry
dWN0IHNjaGVkdWxlciAqb3BzKQogICAgICAgICAgICAgc3RydWN0IG51bGxfdW5pdCAqIGNvbnN0
IG52YyA9IG51bGxfdW5pdCh2LT5zY2hlZF91bml0KTsKICAgICAgICAgICAgIHNwaW5sb2NrX3Qg
KmxvY2s7CiAKLSAgICAgICAgICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2sobnZjLT52Y3B1
KTsKKyAgICAgICAgICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2sobnZjLT52Y3B1LT5zY2hl
ZF91bml0KTsKIAogICAgICAgICAgICAgcHJpbnRrKCJcdCUzZDogIiwgKytsb29wKTsKICAgICAg
ICAgICAgIGR1bXBfdmNwdShwcnYsIG52Yyk7CiAgICAgICAgICAgICBwcmludGsoIlxuIik7CiAK
LSAgICAgICAgICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIG52Yy0+dmNwdSk7CisgICAg
ICAgICAgICB1bml0X3NjaGVkdWxlX3VubG9jayhsb2NrLCBudmMtPnZjcHUtPnNjaGVkX3VuaXQp
OwogICAgICAgICB9CiAgICAgfQogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX3J0LmMg
Yi94ZW4vY29tbW9uL3NjaGVkX3J0LmMKaW5kZXggM2NlODUxMjJjYy4uYTI3OTU4MjM5MiAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9ydC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfcnQu
YwpAQCAtMTc3LDcgKzE3Nyw3IEBAIHN0YXRpYyB2b2lkIHJlcGxfdGltZXJfaGFuZGxlcih2b2lk
ICpkYXRhKTsKIC8qCiAgKiBTeXN0ZW0td2lkZSBwcml2YXRlIGRhdGEsIGluY2x1ZGUgZ2xvYmFs
IFJ1blF1ZXVlL0RlcGxldGVkUQogICogR2xvYmFsIGxvY2sgaXMgcmVmZXJlbmNlZCBieSBzY2hl
ZF9yZXMtPnNjaGVkdWxlX2xvY2sgZnJvbSBhbGwKLSAqIHBoeXNpY2FsIGNwdXMuIEl0IGNhbiBi
ZSBncmFiYmVkIHZpYSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKCkKKyAqIHBoeXNpY2FsIGNwdXMu
IEl0IGNhbiBiZSBncmFiYmVkIHZpYSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKCkKICAqLwogc3Ry
dWN0IHJ0X3ByaXZhdGUgewogICAgIHNwaW5sb2NrX3QgbG9jazsgICAgICAgICAgICAvKiB0aGUg
Z2xvYmFsIGNvYXJzZS1ncmFpbmVkIGxvY2sgKi8KQEAgLTg5Niw3ICs4OTYsNyBAQCBydF91bml0
X2luc2VydChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1
bml0KQogICAgIHVuaXQtPnJlcyA9IHJ0X3Jlc19waWNrKG9wcywgdW5pdCk7CiAgICAgdmMtPnBy
b2Nlc3NvciA9IHVuaXQtPnJlcy0+cHJvY2Vzc29yOwogCi0gICAgbG9jayA9IHZjcHVfc2NoZWR1
bGVfbG9ja19pcnEodmMpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHVuaXQp
OwogCiAgICAgbm93ID0gTk9XKCk7CiAgICAgaWYgKCBub3cgPj0gc3ZjLT5jdXJfZGVhZGxpbmUg
KQpAQCAtOTA5LDcgKzkwOSw3IEBAIHJ0X3VuaXRfaW5zZXJ0KGNvbnN0IHN0cnVjdCBzY2hlZHVs
ZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCiAgICAgICAgIGlmICggIXZjLT5pc19y
dW5uaW5nICkKICAgICAgICAgICAgIHJ1bnFfaW5zZXJ0KG9wcywgc3ZjKTsKICAgICB9Ci0gICAg
dmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsKKyAgICB1bml0X3NjaGVkdWxlX3Vu
bG9ja19pcnEobG9jaywgdW5pdCk7CiAKICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfaW5zZXJ0
KTsKIH0KQEAgLTkyMCw3ICs5MjAsNiBAQCBydF91bml0X2luc2VydChjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogc3RhdGljIHZvaWQKIHJ0X3Vu
aXRfcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX3VuaXQg
KnVuaXQpCiB7Ci0gICAgc3RydWN0IHZjcHUgKnZjID0gdW5pdC0+dmNwdV9saXN0OwogICAgIHN0
cnVjdCBydF91bml0ICogY29uc3Qgc3ZjID0gcnRfdW5pdCh1bml0KTsKICAgICBzdHJ1Y3QgcnRf
ZG9tICogY29uc3Qgc2RvbSA9IHN2Yy0+c2RvbTsKICAgICBzcGlubG9ja190ICpsb2NrOwpAQCAt
OTI5LDE0ICs5MjgsMTQgQEAgcnRfdW5pdF9yZW1vdmUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIAogICAgIEJVR19PTiggc2RvbSA9PSBOVUxM
ICk7CiAKLSAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2Yyk7CisgICAgbG9jayA9
IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgICAgaWYgKCB2Y3B1X29uX3Eoc3ZjKSAp
CiAgICAgICAgIHFfcmVtb3ZlKHN2Yyk7CiAKICAgICBpZiAoIHZjcHVfb25fcmVwbHEoc3ZjKSAp
CiAgICAgICAgIHJlcGxxX3JlbW92ZShvcHMsc3ZjKTsKIAotICAgIHZjcHVfc2NoZWR1bGVfdW5s
b2NrX2lycShsb2NrLCB2Yyk7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHVu
aXQpOwogfQogCiAvKgpAQCAtMTMzMSw3ICsxMzMwLDcgQEAgcnRfY29udGV4dF9zYXZlZChjb25z
dCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogewogICAg
IHN0cnVjdCB2Y3B1ICp2YyA9IHVuaXQtPnZjcHVfbGlzdDsKICAgICBzdHJ1Y3QgcnRfdW5pdCAq
c3ZjID0gcnRfdW5pdCh1bml0KTsKLSAgICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9zY2hlZHVs
ZV9sb2NrX2lycSh2Yyk7CisgICAgc3BpbmxvY2tfdCAqbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9j
a19pcnEodW5pdCk7CiAKICAgICBfX2NsZWFyX2JpdChfX1JURFNfc2NoZWR1bGVkLCAmc3ZjLT5m
bGFncyk7CiAgICAgLyogbm90IGluc2VydCBpZGxlIHZjcHUgdG8gcnVucSAqLwpAQCAtMTM0OCw3
ICsxMzQ3LDcgQEAgcnRfY29udGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMs
IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgICAgICByZXBscV9yZW1vdmUob3BzLCBzdmMp
OwogCiBvdXQ6Ci0gICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHZjKTsKKyAgICB1
bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdW5pdCk7CiB9CiAKIC8qCmRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggYzE2
N2ViMjNmMi4uZTVhZTQwMmEyOSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisr
KyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMjUwLDcgKzI1MCw4IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgKIAogdm9pZCB2Y3B1X3J1bnN0YXRlX2dldChz
dHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3RhdGUpCiB7Ci0g
ICAgc3BpbmxvY2tfdCAqbG9jayA9IGxpa2VseSh2ID09IGN1cnJlbnQpID8gTlVMTCA6IHZjcHVf
c2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgc3BpbmxvY2tfdCAqbG9jayA9IGxpa2VseSh2ID09
IGN1cnJlbnQpCisgICAgICAgICAgICAgICAgICAgICAgID8gTlVMTCA6IHVuaXRfc2NoZWR1bGVf
bG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAgICAgc190aW1lX3QgZGVsdGE7CiAKICAgICBtZW1j
cHkocnVuc3RhdGUsICZ2LT5ydW5zdGF0ZSwgc2l6ZW9mKCpydW5zdGF0ZSkpOwpAQCAtMjU5LDcg
KzI2MCw3IEBAIHZvaWQgdmNwdV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2
Y3B1X3J1bnN0YXRlX2luZm8gKnJ1bnN0YXRlKQogICAgICAgICBydW5zdGF0ZS0+dGltZVtydW5z
dGF0ZS0+c3RhdGVdICs9IGRlbHRhOwogCiAgICAgaWYgKCB1bmxpa2VseShsb2NrICE9IE5VTEwp
ICkKLSAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYpOworICAgICAgICB1
bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdi0+c2NoZWRfdW5pdCk7CiB9CiAKIHVpbnQ2
NF90IGdldF9jcHVfaWRsZV90aW1lKHVuc2lnbmVkIGludCBjcHUpCkBAIC00NzMsNyArNDc0LDcg
QEAgaW50IHNjaGVkX21vdmVfZG9tYWluKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBjcHVwb29s
ICpjKQogICAgICAgICBtaWdyYXRlX3RpbWVyKCZ2LT5zaW5nbGVzaG90X3RpbWVyLCBuZXdfcCk7
CiAgICAgICAgIG1pZ3JhdGVfdGltZXIoJnYtPnBvbGxfdGltZXIsIG5ld19wKTsKIAotICAgICAg
ICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICAgICAgbG9jayA9IHVuaXRf
c2NoZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAKICAgICAgICAgc2NoZWRfc2V0X2Fm
ZmluaXR5KHYsICZjcHVtYXNrX2FsbCwgJmNwdW1hc2tfYWxsKTsKIApAQCAtNDgyLDcgKzQ4Myw3
IEBAIGludCBzY2hlZF9tb3ZlX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgY3B1cG9v
bCAqYykKICAgICAgICAgLyoKICAgICAgICAgICogV2l0aCB2LT5wcm9jZXNzb3IgbW9kaWZpZWQg
d2UgbXVzdCBub3QKICAgICAgICAgICogLSBtYWtlIGFueSBmdXJ0aGVyIGNoYW5nZXMgYXNzdW1p
bmcgd2UgaG9sZCB0aGUgc2NoZWR1bGVyIGxvY2ssCi0gICAgICAgICAqIC0gdXNlIHZjcHVfc2No
ZWR1bGVfdW5sb2NrX2lycSgpLgorICAgICAgICAgKiAtIHVzZSB1bml0X3NjaGVkdWxlX3VubG9j
a19pcnEoKS4KICAgICAgICAgICovCiAgICAgICAgIHNwaW5fdW5sb2NrX2lycShsb2NrKTsKIApA
QCAtNTgxLDExICs1ODIsMTEgQEAgdm9pZCB2Y3B1X3NsZWVwX25vc3luYyhzdHJ1Y3QgdmNwdSAq
dikKIAogICAgIFRSQUNFXzJEKFRSQ19TQ0hFRF9TTEVFUCwgdi0+ZG9tYWluLT5kb21haW5faWQs
IHYtPnZjcHVfaWQpOwogCi0gICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYs
ICZmbGFncyk7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYtPnNjaGVk
X3VuaXQsICZmbGFncyk7CiAKICAgICB2Y3B1X3NsZWVwX25vc3luY19sb2NrZWQodik7CiAKLSAg
ICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2KTsKKyAgICB1
bml0X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2LT5zY2hlZF91bml0
KTsKIH0KIAogdm9pZCB2Y3B1X3NsZWVwX3N5bmMoc3RydWN0IHZjcHUgKnYpCkBAIC02MDUsNyAr
NjA2LDcgQEAgdm9pZCB2Y3B1X3dha2Uoc3RydWN0IHZjcHUgKnYpCiAKICAgICBUUkFDRV8yRChU
UkNfU0NIRURfV0FLRSwgdi0+ZG9tYWluLT5kb21haW5faWQsIHYtPnZjcHVfaWQpOwogCi0gICAg
bG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYsICZmbGFncyk7CisgICAgbG9jayA9
IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYtPnNjaGVkX3VuaXQsICZmbGFncyk7CiAKICAg
ICBpZiAoIGxpa2VseSh2Y3B1X3J1bm5hYmxlKHYpKSApCiAgICAgewpAQCAtNjE5LDcgKzYyMCw3
IEBAIHZvaWQgdmNwdV93YWtlKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICAgICAgdmNwdV9ydW5z
dGF0ZV9jaGFuZ2UodiwgUlVOU1RBVEVfb2ZmbGluZSwgTk9XKCkpOwogICAgIH0KIAotICAgIHZj
cHVfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHYpOworICAgIHVuaXRf
c2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIHYtPnNjaGVkX3VuaXQpOwog
fQogCiB2b2lkIHZjcHVfdW5ibG9jayhzdHJ1Y3QgdmNwdSAqdikKQEAgLTY4Nyw5ICs2ODgsOSBA
QCBzdGF0aWMgdm9pZCB2Y3B1X21vdmVfbG9ja2VkKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBp
bnQgbmV3X2NwdSkKICAqIFRoZXNlIHN0ZXBzIGFyZSBlbmNhcHN1bGF0ZWQgaW4gdGhlIGZvbGxv
d2luZyB0d28gZnVuY3Rpb25zOyB0aGV5CiAgKiBzaG91bGQgYmUgY2FsbGVkIGxpa2UgdGhpczoK
ICAqCi0gKiAgICAgbG9jayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgKiAgICAgbG9j
ayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodW5pdCk7CiAgKiAgICAgdmNwdV9taWdyYXRlX3N0
YXJ0KHYpOwotICogICAgIHZjcHVfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB2KQorICogICAg
IHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycShsb2NrLCB1bml0KQogICogICAgIHZjcHVfbWlncmF0
ZV9maW5pc2godik7CiAgKgogICogdmNwdV9taWdyYXRlX2ZpbmlzaCgpIHdpbGwgZG8gdGhlIHdv
cmsgbm93IGlmIGl0IGNhbiwgb3Igc2ltcGx5CkBAIC03OTQsMTIgKzc5NSwxMiBAQCBzdGF0aWMg
dm9pZCB2Y3B1X21pZ3JhdGVfZmluaXNoKHN0cnVjdCB2Y3B1ICp2KQogICovCiB2b2lkIHZjcHVf
Zm9yY2VfcmVzY2hlZHVsZShzdHJ1Y3QgdmNwdSAqdikKIHsKLSAgICBzcGlubG9ja190ICpsb2Nr
ID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICBzcGlubG9ja190ICpsb2NrID0gdW5p
dF9zY2hlZHVsZV9sb2NrX2lycSh2LT5zY2hlZF91bml0KTsKIAogICAgIGlmICggdi0+aXNfcnVu
bmluZyApCiAgICAgICAgIHZjcHVfbWlncmF0ZV9zdGFydCh2KTsKIAotICAgIHZjcHVfc2NoZWR1
bGVfdW5sb2NrX2lycShsb2NrLCB2KTsKKyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9j
aywgdi0+c2NoZWRfdW5pdCk7CiAKICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYpOwogfQpAQCAt
ODI2LDcgKzgyNyw3IEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21haW4g
KmQpCiAgICAgICAgICAqIHNldCB2LT5wcm9jZXNzb3Igb2YgZWFjaCBvZiB0aGVpciB2Q1BVcyB0
byBzb21ldGhpbmcgdGhhdCB3aWxsCiAgICAgICAgICAqIG1ha2Ugc2Vuc2UgZm9yIHRoZSBzY2hl
ZHVsZXIgb2YgdGhlIGNwdXBvb2wgaW4gd2hpY2ggdGhleSBhcmUgaW4uCiAgICAgICAgICAqLwot
ICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKyAgICAgICAgbG9jayA9
IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEodi0+c2NoZWRfdW5pdCk7CiAKICAgICAgICAgY3B1bWFz
a19hbmQoY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLCB2LT5jcHVfaGFyZF9hZmZpbml0eSwKICAg
ICAgICAgICAgICAgICAgICAgY3B1cG9vbF9kb21haW5fY3B1bWFzayhkKSk7CkBAIC04NTUsNyAr
ODU2LDcgQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCkKICAg
ICAgICAgc3Bpbl91bmxvY2tfaXJxKGxvY2spOwogCiAgICAgICAgIC8qIHYtPnByb2Nlc3NvciBt
aWdodCBoYXZlIGNoYW5nZWQsIHNvIHJlYWNxdWlyZSB0aGUgbG9jay4gKi8KLSAgICAgICAgbG9j
ayA9IHZjcHVfc2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgICAgIGxvY2sgPSB1bml0X3NjaGVk
dWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOwogICAgICAgICB2LT5zY2hlZF91bml0LT5yZXMg
PSBzY2hlZF9waWNrX3Jlc291cmNlKHZjcHVfc2NoZWR1bGVyKHYpLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHYtPnNjaGVkX3VuaXQpOwogICAgICAg
ICB2LT5wcm9jZXNzb3IgPSB2LT5zY2hlZF91bml0LT5yZXMtPnByb2Nlc3NvcjsKQEAgLTg5MCw3
ICs4OTEsNyBAQCBpbnQgY3B1X2Rpc2FibGVfc2NoZWR1bGVyKHVuc2lnbmVkIGludCBjcHUpCiAg
ICAgICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKICAgICAgICAgewogICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsKLSAgICAgICAgICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB2Y3B1X3Nj
aGVkdWxlX2xvY2tfaXJxc2F2ZSh2LCAmZmxhZ3MpOworICAgICAgICAgICAgc3BpbmxvY2tfdCAq
bG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnFzYXZlKHYtPnNjaGVkX3VuaXQsICZmbGFncyk7
CiAKICAgICAgICAgICAgIGNwdW1hc2tfYW5kKCZvbmxpbmVfYWZmaW5pdHksIHYtPmNwdV9oYXJk
X2FmZmluaXR5LCBjLT5jcHVfdmFsaWQpOwogICAgICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5
KCZvbmxpbmVfYWZmaW5pdHkpICYmCkBAIC04OTksNyArOTAwLDcgQEAgaW50IGNwdV9kaXNhYmxl
X3NjaGVkdWxlcih1bnNpZ25lZCBpbnQgY3B1KQogICAgICAgICAgICAgICAgIGlmICggdi0+YWZm
aW5pdHlfYnJva2VuICkKICAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgIC8q
IFRoZSB2Y3B1IGlzIHRlbXBvcmFyaWx5IHBpbm5lZCwgY2FuJ3QgbW92ZSBpdC4gKi8KLSAgICAg
ICAgICAgICAgICAgICAgdmNwdV9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFn
cywgdik7CisgICAgICAgICAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3Rv
cmUobG9jaywgZmxhZ3MsIHYtPnNjaGVkX3VuaXQpOwogICAgICAgICAgICAgICAgICAgICByZXQg
PSAtRUFERFJJTlVTRTsKICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICAg
ICAgfQpAQCAtOTEyLDcgKzkxMyw3IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWdu
ZWQgaW50IGNwdSkKICAgICAgICAgICAgIGlmICggdi0+cHJvY2Vzc29yICE9IGNwdSApCiAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgLyogVGhlIHZjcHUgaXMgbm90IG9uIHRoaXMgY3B1
LCBzbyB3ZSBjYW4gbW92ZSBvbi4gKi8KLSAgICAgICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3Vu
bG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2KTsKKyAgICAgICAgICAgICAgICB1bml0X3Nj
aGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2LT5zY2hlZF91bml0KTsKICAg
ICAgICAgICAgICAgICBjb250aW51ZTsKICAgICAgICAgICAgIH0KIApAQCAtOTI1LDcgKzkyNiw3
IEBAIGludCBjcHVfZGlzYWJsZV9zY2hlZHVsZXIodW5zaWduZWQgaW50IGNwdSkKICAgICAgICAg
ICAgICAqICAgIHRoaW5ncyB3b3VsZCBoYXZlIGZhaWxlZCBiZWZvcmUgZ2V0dGluZyBpbiBoZXJl
LgogICAgICAgICAgICAgICovCiAgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfc3RhcnQodik7Ci0g
ICAgICAgICAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCB2
KTsKKyAgICAgICAgICAgIHVuaXRfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxh
Z3MsIHYtPnNjaGVkX3VuaXQpOwogCiAgICAgICAgICAgICB2Y3B1X21pZ3JhdGVfZmluaXNoKHYp
OwogCkBAIC05ODksNyArOTkwLDcgQEAgc3RhdGljIGludCB2Y3B1X3NldF9hZmZpbml0eSgKICAg
ICBzcGlubG9ja190ICpsb2NrOwogICAgIGludCByZXQgPSAwOwogCi0gICAgbG9jayA9IHZjcHVf
c2NoZWR1bGVfbG9ja19pcnEodik7CisgICAgbG9jayA9IHVuaXRfc2NoZWR1bGVfbG9ja19pcnEo
di0+c2NoZWRfdW5pdCk7CiAKICAgICBpZiAoIHYtPmFmZmluaXR5X2Jyb2tlbiApCiAgICAgICAg
IHJldCA9IC1FQlVTWTsKQEAgLTEwMTEsNyArMTAxMiw3IEBAIHN0YXRpYyBpbnQgdmNwdV9zZXRf
YWZmaW5pdHkoCiAgICAgICAgIHZjcHVfbWlncmF0ZV9zdGFydCh2KTsKICAgICB9CiAKLSAgICB2
Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdik7CisgICAgdW5pdF9zY2hlZHVsZV91bmxv
Y2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwogCiAgICAgZG9tYWluX3VwZGF0ZV9ub2RlX2Fm
ZmluaXR5KHYtPmRvbWFpbik7CiAKQEAgLTExNDMsMTAgKzExNDQsMTAgQEAgc3RhdGljIGxvbmcg
ZG9fcG9sbChzdHJ1Y3Qgc2NoZWRfcG9sbCAqc2NoZWRfcG9sbCkKIGxvbmcgdmNwdV95aWVsZCh2
b2lkKQogewogICAgIHN0cnVjdCB2Y3B1ICogdj1jdXJyZW50OwotICAgIHNwaW5sb2NrX3QgKmxv
Y2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHYpOworICAgIHNwaW5sb2NrX3QgKmxvY2sgPSB1
bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQpOwogCiAgICAgc2NoZWRfeWllbGQo
dmNwdV9zY2hlZHVsZXIodiksIHYtPnNjaGVkX3VuaXQpOwotICAgIHZjcHVfc2NoZWR1bGVfdW5s
b2NrX2lycShsb2NrLCB2KTsKKyAgICB1bml0X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgdi0+
c2NoZWRfdW5pdCk7CiAKICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfeWllbGQpOwogCkBAIC0x
MjQzLDcgKzEyNDQsNyBAQCBpbnQgdmNwdV90ZW1wb3JhcnlfYWZmaW5pdHkoc3RydWN0IHZjcHUg
KnYsIHVuc2lnbmVkIGludCBjcHUsIHVpbnQ4X3QgcmVhc29uKQogICAgIGludCByZXQgPSAtRUlO
VkFMOwogICAgIGJvb2wgbWlncmF0ZTsKIAotICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tf
aXJxKHYpOworICAgIGxvY2sgPSB1bml0X3NjaGVkdWxlX2xvY2tfaXJxKHYtPnNjaGVkX3VuaXQp
OwogCiAgICAgaWYgKCBjcHUgPT0gTlJfQ1BVUyApCiAgICAgewpAQCAtMTI3Niw3ICsxMjc3LDcg
QEAgaW50IHZjcHVfdGVtcG9yYXJ5X2FmZmluaXR5KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBp
bnQgY3B1LCB1aW50OF90IHJlYXNvbikKICAgICBpZiAoIG1pZ3JhdGUgKQogICAgICAgICB2Y3B1
X21pZ3JhdGVfc3RhcnQodik7CiAKLSAgICB2Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywg
dik7CisgICAgdW5pdF9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIHYtPnNjaGVkX3VuaXQpOwog
CiAgICAgaWYgKCBtaWdyYXRlICkKICAgICAgICAgdmNwdV9taWdyYXRlX2ZpbmlzaCh2KTsKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLWlmLmgKaW5kZXggMjEyYzYxMjM3NC4uZWQ3YjdkYTNhMyAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAg
LTEwMSwyMiArMTAxLDIyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBraW5kIyNfc2NoZWR1bGVfdW5s
b2NrIyNpcnEoc3BpbmxvY2tfdCAqbG9jayBcCiAKICNkZWZpbmUgRVhUUkFfVFlQRShhcmcpCiBz
Y2hlZF9sb2NrKHBjcHUsIHVuc2lnbmVkIGludCBjcHUsICAgICBjcHUsICkKLXNjaGVkX2xvY2so
dmNwdSwgY29uc3Qgc3RydWN0IHZjcHUgKnYsIHYtPnByb2Nlc3NvciwgKQorc2NoZWRfbG9jayh1
bml0LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqaSwgaS0+cmVzLT5wcm9jZXNzb3IsICkKIHNj
aGVkX2xvY2socGNwdSwgdW5zaWduZWQgaW50IGNwdSwgICAgIGNwdSwgICAgICAgICAgX2lycSkK
LXNjaGVkX2xvY2sodmNwdSwgY29uc3Qgc3RydWN0IHZjcHUgKnYsIHYtPnByb2Nlc3NvciwgX2ly
cSkKK3NjaGVkX2xvY2sodW5pdCwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKmksIGktPnJlcy0+
cHJvY2Vzc29yLCBfaXJxKQogc2NoZWRfdW5sb2NrKHBjcHUsIHVuc2lnbmVkIGludCBjcHUsICAg
ICBjcHUsICkKLXNjaGVkX3VubG9jayh2Y3B1LCBjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgdi0+cHJv
Y2Vzc29yLCApCitzY2hlZF91bmxvY2sodW5pdCwgY29uc3Qgc3RydWN0IHNjaGVkX3VuaXQgKmks
IGktPnJlcy0+cHJvY2Vzc29yLCApCiBzY2hlZF91bmxvY2socGNwdSwgdW5zaWduZWQgaW50IGNw
dSwgICAgIGNwdSwgICAgICAgICAgX2lycSkKLXNjaGVkX3VubG9jayh2Y3B1LCBjb25zdCBzdHJ1
Y3QgdmNwdSAqdiwgdi0+cHJvY2Vzc29yLCBfaXJxKQorc2NoZWRfdW5sb2NrKHVuaXQsIGNvbnN0
IHN0cnVjdCBzY2hlZF91bml0ICppLCBpLT5yZXMtPnByb2Nlc3NvciwgX2lycSkKICN1bmRlZiBF
WFRSQV9UWVBFCiAKICNkZWZpbmUgRVhUUkFfVFlQRShhcmcpICwgdW5zaWduZWQgbG9uZyBhcmcK
ICNkZWZpbmUgc3Bpbl91bmxvY2tfaXJxc2F2ZSBzcGluX3VubG9ja19pcnFyZXN0b3JlCiBzY2hl
ZF9sb2NrKHBjcHUsIHVuc2lnbmVkIGludCBjcHUsICAgICBjcHUsICAgICAgICAgIF9pcnFzYXZl
LCAqZmxhZ3MpCi1zY2hlZF9sb2NrKHZjcHUsIGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB2LT5wcm9j
ZXNzb3IsIF9pcnFzYXZlLCAqZmxhZ3MpCitzY2hlZF9sb2NrKHVuaXQsIGNvbnN0IHN0cnVjdCBz
Y2hlZF91bml0ICppLCBpLT5yZXMtPnByb2Nlc3NvciwgX2lycXNhdmUsICpmbGFncykKICN1bmRl
ZiBzcGluX3VubG9ja19pcnFzYXZlCiBzY2hlZF91bmxvY2socGNwdSwgdW5zaWduZWQgaW50IGNw
dSwgICAgIGNwdSwgICAgICAgICAgX2lycXJlc3RvcmUsIGZsYWdzKQotc2NoZWRfdW5sb2NrKHZj
cHUsIGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCB2LT5wcm9jZXNzb3IsIF9pcnFyZXN0b3JlLCBmbGFn
cykKK3NjaGVkX3VubG9jayh1bml0LCBjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqaSwgaS0+cmVz
LT5wcm9jZXNzb3IsIF9pcnFyZXN0b3JlLCBmbGFncykKICN1bmRlZiBFWFRSQV9UWVBFCiAKICN1
bmRlZiBzY2hlZF91bmxvY2sKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
