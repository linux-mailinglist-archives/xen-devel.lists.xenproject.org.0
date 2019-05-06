Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A5144CF
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYs-0002Tt-IJ; Mon, 06 May 2019 06:57:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYj-0002CJ-Tg
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:09 +0000
X-Inumbo-ID: 261eecc0-6fcc-11e9-9e4d-9bcd72c1e9c5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 261eecc0-6fcc-11e9-9e4d-9bcd72c1e9c5;
 Mon, 06 May 2019 06:57:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CECB5AF32;
 Mon,  6 May 2019 06:56:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:29 +0200
Message-Id: <20190506065644.7415-31-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 30/45] xen/sched: rework and rename
 vcpu_force_reschedule()
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dmNwdV9mb3JjZV9yZXNjaGVkdWxlKCkgaXMgb25seSB1c2VkIGZvciBtb2RpZnlpbmcgdGhlIHBl
cmlvZGljIHRpbWVyCm9mIGEgdmNwdS4gRm9yY2luZyBhIHZjcHUgdG8gZ2l2ZSB1cCB0aGUgcGh5
c2ljYWwgY3B1IGZvciB0aGF0IHB1cnBvc2UKaXMga2luZCBvZiBicnV0YWwuCgpTbyBpbnN0ZWFk
IG9mIGRvaW5nIHRoZSByZXNjaGVkdWxlIGRhbmNlIGp1c3Qgb3BlcmF0ZSBvbiB0aGUgdGltZXIK
ZGlyZWN0bHkuCgpJbiBjYXNlIHdlIGFyZSBtb2RpZnlpbmcgdGhlIHRpbWVyIG9mIHRoZSBjdXJy
ZW50bHkgcnVubmluZyB2Y3B1IHdlCmNhbiBqdXN0IGRvIHRoYXQuIEluIGNhc2UgaXQgaXMgZm9y
IGEgZm9yZWlnbiB2Y3B1IHdlIHNob3VsZCBwYXVzZSBpdApmb3IgdGhhdCBwdXJwb3NlIGxpa2Ug
d2UgZG8gZm9yIGFsbCBvdGhlciB2Y3B1IHN0YXRlIG1vZGlmaWNhdGlvbnMuCgpSZW5hbWUgdGhl
IGZ1bmN0aW9uIHRvIHZjcHVfc2V0X3BlcmlvZGljX3RpbWVyKCkgYXMgdGhpcyBub3cgcmVmbGVj
dHMKdGhlIGZ1bmN0aW9uYWxpdHkuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgfCAgNCArLS0tCiB4ZW4v
Y29tbW9uL2RvbWFpbi5jICAgICB8ICA2ICsrLS0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAg
fCAyMyArKysrKysrKysrKysrLS0tLS0tLS0tLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAg
MiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3No
aW0uYwppbmRleCAzMjRjYTI3ZjkzLi41ZWRiY2Q5YWM1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvcHYvc2hpbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKQEAgLTQxMCw3ICs0MTAs
NyBAQCBpbnQgcHZfc2hpbV9zaHV0ZG93bih1aW50OF90IHJlYXNvbikKICAgICAgICAgdW5tYXBf
dmNwdV9pbmZvKHYpOwogCiAgICAgICAgIC8qIFJlc2V0IHRoZSBwZXJpb2RpYyB0aW1lciB0byB0
aGUgZGVmYXVsdCB2YWx1ZS4gKi8KLSAgICAgICAgdi0+cGVyaW9kaWNfcGVyaW9kID0gTUlMTElT
RUNTKDEwKTsKKyAgICAgICAgdmNwdV9zZXRfcGVyaW9kaWNfdGltZXIodiwgTUlMTElTRUNTKDEw
KSk7CiAgICAgICAgIC8qIFN0b3AgdGhlIHNpbmdsZXNob3QgdGltZXIuICovCiAgICAgICAgIHN0
b3BfdGltZXIoJnYtPnNpbmdsZXNob3RfdGltZXIpOwogCkBAIC00MTksOCArNDE5LDYgQEAgaW50
IHB2X3NoaW1fc2h1dGRvd24odWludDhfdCByZWFzb24pCiAKICAgICAgICAgaWYgKCB2ICE9IGN1
cnJlbnQgKQogICAgICAgICAgICAgdmNwdV91bnBhdXNlX2J5X3N5c3RlbWNvbnRyb2xsZXIodik7
Ci0gICAgICAgIGVsc2UKLSAgICAgICAgICAgIHZjcHVfZm9yY2VfcmVzY2hlZHVsZSh2KTsKICAg
ICB9CiAKICAgICByZXR1cm4gMDsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94
ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4IGQwZjllNWU4NmEuLjYzZWY2NGU0ZDQgMTAwNjQ0Ci0t
LSBhL3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMTQ0
MSwxNSArMTQ0MSwxMyBAQCBsb25nIGRvX3ZjcHVfb3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZj
cHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiAgICAgICAgIGlmICggc2V0
LnBlcmlvZF9ucyA+IFNUSU1FX0RFTFRBX01BWCApCiAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKIAotICAgICAgICB2LT5wZXJpb2RpY19wZXJpb2QgPSBzZXQucGVyaW9kX25zOwotICAgICAg
ICB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUodik7CisgICAgICAgIHZjcHVfc2V0X3BlcmlvZGljX3Rp
bWVyKHYsIHNldC5wZXJpb2RfbnMpOwogCiAgICAgICAgIGJyZWFrOwogICAgIH0KIAogICAgIGNh
c2UgVkNQVU9QX3N0b3BfcGVyaW9kaWNfdGltZXI6Ci0gICAgICAgIHYtPnBlcmlvZGljX3Blcmlv
ZCA9IDA7Ci0gICAgICAgIHZjcHVfZm9yY2VfcmVzY2hlZHVsZSh2KTsKKyAgICAgICAgdmNwdV9z
ZXRfcGVyaW9kaWNfdGltZXIodiwgMCk7CiAgICAgICAgIGJyZWFrOwogCiAgICAgY2FzZSBWQ1BV
T1Bfc2V0X3NpbmdsZXNob3RfdGltZXI6CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggNjc4NzFiNjYxOC4uNTJkYTVkNWEzMCAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1
bGUuYwpAQCAtODA4LDIxICs4MDgsMjQgQEAgc3RhdGljIHZvaWQgdmNwdV9taWdyYXRlX2Zpbmlz
aChzdHJ1Y3QgdmNwdSAqdikKIH0KIAogLyoKLSAqIEZvcmNlIGEgVkNQVSB0aHJvdWdoIGEgZGVz
Y2hlZHVsZS9yZXNjaGVkdWxlIHBhdGguCi0gKiBGb3IgZXhhbXBsZSwgdXNpbmcgdGhpcyB3aGVu
IHNldHRpbmcgdGhlIHBlcmlvZGljIHRpbWVyIHBlcmlvZCBtZWFucyB0aGF0Ci0gKiBtb3N0IHBl
cmlvZGljLXRpbWVyIHN0YXRlIG5lZWQgb25seSBiZSB0b3VjaGVkIGZyb20gd2l0aGluIHRoZSBz
Y2hlZHVsZXIKLSAqIHdoaWNoIGNhbiB0aHVzIGJlIGRvbmUgd2l0aG91dCBuZWVkIGZvciBzeW5j
aHJvbmlzYXRpb24uCisgKiBTZXQgdGhlIHBlcmlvZGljIHRpbWVyIG9mIGEgdmNwdS4KICAqLwot
dm9pZCB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoc3RydWN0IHZjcHUgKnYpCit2b2lkIHZjcHVfc2V0
X3BlcmlvZGljX3RpbWVyKHN0cnVjdCB2Y3B1ICp2LCBzX3RpbWVfdCB2YWx1ZSkKIHsKLSAgICBz
cGlubG9ja190ICpsb2NrID0gaXRlbV9zY2hlZHVsZV9sb2NrX2lycSh2LT5zY2hlZF9pdGVtKTsK
KyAgICBzX3RpbWVfdCBub3cgPSBOT1coKTsKIAotICAgIGlmICggdi0+c2NoZWRfaXRlbS0+aXNf
cnVubmluZyApCi0gICAgICAgIHZjcHVfbWlncmF0ZV9zdGFydCh2KTsKKyAgICBpZiAoIHYgIT0g
Y3VycmVudCApCisgICAgICAgIHZjcHVfcGF1c2Uodik7CisgICAgZWxzZQorICAgICAgICBzdG9w
X3RpbWVyKCZ2LT5wZXJpb2RpY190aW1lcik7CiAKLSAgICBpdGVtX3NjaGVkdWxlX3VubG9ja19p
cnEobG9jaywgdi0+c2NoZWRfaXRlbSk7CisgICAgdi0+cGVyaW9kaWNfcGVyaW9kID0gdmFsdWU7
CisgICAgdi0+cGVyaW9kaWNfbGFzdF9ldmVudCA9IG5vdzsKIAotICAgIHZjcHVfbWlncmF0ZV9m
aW5pc2godik7CisgICAgaWYgKCB2ICE9IGN1cnJlbnQgKQorICAgICAgICB2Y3B1X3VucGF1c2Uo
dik7CisgICAgZWxzZSBpZiAoIHZhbHVlICE9IDAgKQorICAgICAgICBzZXRfdGltZXIoJnYtPnBl
cmlvZGljX3RpbWVyLCBub3cgKyB2YWx1ZSk7CiB9CiAKIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmlu
aXR5KHN0cnVjdCBkb21haW4gKmQpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDU3MTYzMWYyMTcuLmNiZDk3ZjM0Yzcg
MTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hl
bi9zY2hlZC5oCkBAIC04OTcsNyArODk3LDcgQEAgc3RydWN0IHNjaGVkdWxlciAqc2NoZWR1bGVy
X2dldF9kZWZhdWx0KHZvaWQpOwogc3RydWN0IHNjaGVkdWxlciAqc2NoZWR1bGVyX2FsbG9jKHVu
c2lnbmVkIGludCBzY2hlZF9pZCwgaW50ICpwZXJyKTsKIHZvaWQgc2NoZWR1bGVyX2ZyZWUoc3Ry
dWN0IHNjaGVkdWxlciAqc2NoZWQpOwogaW50IHNjaGVkdWxlX2NwdV9zd2l0Y2godW5zaWduZWQg
aW50IGNwdSwgc3RydWN0IGNwdXBvb2wgKmMpOwotdm9pZCB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUo
c3RydWN0IHZjcHUgKnYpOwordm9pZCB2Y3B1X3NldF9wZXJpb2RpY190aW1lcihzdHJ1Y3QgdmNw
dSAqdiwgc190aW1lX3QgdmFsdWUpOwogaW50IGNwdV9kaXNhYmxlX3NjaGVkdWxlcih1bnNpZ25l
ZCBpbnQgY3B1KTsKIC8qIFdlIG5lZWQgaXQgaW4gZG9tMF9zZXR1cF92Y3B1ICovCiB2b2lkIHNj
aGVkX3NldF9hZmZpbml0eShzdHJ1Y3QgdmNwdSAqdiwgY29uc3QgY3B1bWFza190ICpoYXJkLAot
LSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
