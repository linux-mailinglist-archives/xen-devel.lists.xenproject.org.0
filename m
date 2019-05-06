Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBA9144DA
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:00:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYj-0002Al-MZ; Mon, 06 May 2019 06:57:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYf-00022t-ES
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:05 +0000
X-Inumbo-ID: 2508648d-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2508648d-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9731FAF26;
 Mon,  6 May 2019 06:56:55 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:24 +0200
Message-Id: <20190506065644.7415-26-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 25/45] xen/sched: use sched_resource cpu
 instead smp_processor_id in schedulers
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXNwZWNpYWxseSBpbiB0aGUgZG9fc2NoZWR1bGUoKSBmdW5jdGlvbnMgb2YgdGhlIGRpZmZlcmVu
dCBzY2hlZHVsZXJzCnVzaW5nIHNtcF9wcm9jZXNzb3JfaWQoKSBmb3IgdGhlIGxvY2FsIGNwdSBu
dW1iZXIgaXMgY29ycmVjdCBvbmx5IGlmCnRoZSBzY2hlZF9pdGVtIGlzIGEgc2luZ2xlIHZjcHUu
IEFzIHNvb24gYXMgbGFyZ2VyIHNjaGVkX2l0ZW1zIGFyZQp1c2VkIG1vc3QgdXNlcyBzaG91bGQg
YmUgcmVwbGFjZWQgYnkgdGhlIGNwdSBudW1iZXIgb2YgdGhlIGxvY2FsCnNjaGVkX3Jlc291cmNl
IGluc3RlYWQuCgpBZGQgYSBoZWxwZXIgdG8gZ2V0IHRoYXQgc2NoZWRfcmVzb3VyY2UgY3B1IGFu
ZCBtb2RpZnkgdGhlIHNjaGVkdWxlcnMKdG8gdXNlIGl0IGluIGEgY29ycmVjdCB3YXkuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9zY2hlZF9hcmluYzY1My5jIHwgIDIgKy0KIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMgICB8
IDE5ICsrKysrKysrLS0tLS0tLS0KIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jICB8IDUzICsr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9z
Y2hlZF9udWxsLmMgICAgIHwgMTcgKysrKysrKystLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkX3J0
LmMgICAgICAgfCAxNyArKysrKysrKy0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
ICB8ICA1ICsrKysrCiA2IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDUyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfYXJpbmM2NTMuYyBiL3hlbi9j
b21tb24vc2NoZWRfYXJpbmM2NTMuYwppbmRleCA2MWY5ZWE2ODI0Li4zOTE5YzBhM2U5IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKKysrIGIveGVuL2NvbW1vbi9zY2hl
ZF9hcmluYzY1My5jCkBAIC01MTMsNyArNTEzLDcgQEAgYTY1M3NjaGVkX2RvX3NjaGVkdWxlKAog
ICAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgc2NoZWRfaW5kZXggPSAwOwogICAgIHN0YXRpYyBzX3Rp
bWVfdCBuZXh0X3N3aXRjaF90aW1lOwogICAgIGE2NTNzY2hlZF9wcml2X3QgKnNjaGVkX3ByaXYg
PSBTQ0hFRF9QUklWKG9wcyk7Ci0gICAgY29uc3QgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9j
ZXNzb3JfaWQoKTsKKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3B1ID0gc2NoZWRfZ2V0X3Jlc291
cmNlX2NwdShzbXBfcHJvY2Vzc29yX2lkKCkpOwogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAK
ICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmc2NoZWRfcHJpdi0+bG9jaywgZmxhZ3MpOwpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0
LmMKaW5kZXggOWRiNWMzZmM3MS4uNDczNGY1MmZjNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9z
Y2hlZF9jcmVkaXQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCkBAIC0xODM5LDgg
KzE4MzksOSBAQCBzdGF0aWMgc3RydWN0IHRhc2tfc2xpY2UKIGNzY2hlZF9zY2hlZHVsZSgKICAg
ICBjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMsIHNfdGltZV90IG5vdywgYm9vbF90IHRhc2ts
ZXRfd29ya19zY2hlZHVsZWQpCiB7Ci0gICAgY29uc3QgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3Jf
aWQoKTsKLSAgICBzdHJ1Y3QgbGlzdF9oZWFkICogY29uc3QgcnVucSA9IFJVTlEoY3B1KTsKKyAg
ICBjb25zdCB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOworICAgIGNvbnN0
IHVuc2lnbmVkIGludCBzY2hlZF9jcHUgPSBzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSk7Cisg
ICAgc3RydWN0IGxpc3RfaGVhZCAqIGNvbnN0IHJ1bnEgPSBSVU5RKHNjaGVkX2NwdSk7CiAgICAg
c3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0gPSBjdXJyZW50LT5zY2hlZF9pdGVtOwogICAgIHN0cnVj
dCBjc2NoZWRfaXRlbSAqIGNvbnN0IHNjdXJyID0gQ1NDSEVEX0lURU0oaXRlbSk7CiAgICAgc3Ry
dWN0IGNzY2hlZF9wcml2YXRlICpwcnYgPSBDU0NIRURfUFJJVihvcHMpOwpAQCAtMTk1MCw3ICsx
OTUxLDcgQEAgY3NjaGVkX3NjaGVkdWxlKAogICAgIHsKICAgICAgICAgQlVHX09OKCBpc19pZGxl
X2l0ZW0oaXRlbSkgfHwgbGlzdF9lbXB0eShydW5xKSApOwogICAgICAgICAvKiBDdXJyZW50IGhh
cyBibG9ja2VkLiBVcGRhdGUgdGhlIHJ1bm5hYmxlIGNvdW50ZXIgZm9yIHRoaXMgY3B1LiAqLwot
ICAgICAgICBkZWNfbnJfcnVubmFibGUoY3B1KTsKKyAgICAgICAgZGVjX25yX3J1bm5hYmxlKHNj
aGVkX2NwdSk7CiAgICAgfQogCiAgICAgc25leHQgPSBfX3J1bnFfZWxlbShydW5xLT5uZXh0KTsK
QEAgLTE5NjAsNyArMTk2MSw3IEBAIGNzY2hlZF9zY2hlZHVsZSgKICAgICBpZiAoIHRhc2tsZXRf
d29ya19zY2hlZHVsZWQgKQogICAgIHsKICAgICAgICAgVFJBQ0VfMEQoVFJDX0NTQ0hFRF9TQ0hF
RF9UQVNLTEVUKTsKLSAgICAgICAgc25leHQgPSBDU0NIRURfSVRFTShzY2hlZF9pZGxlX2l0ZW0o
Y3B1KSk7CisgICAgICAgIHNuZXh0ID0gQ1NDSEVEX0lURU0oc2NoZWRfaWRsZV9pdGVtKHNjaGVk
X2NwdSkpOwogICAgICAgICBzbmV4dC0+cHJpID0gQ1NDSEVEX1BSSV9UU19CT09TVDsKICAgICB9
CiAKQEAgLTE5ODAsNyArMTk4MSw3IEBAIGNzY2hlZF9zY2hlZHVsZSgKICAgICBpZiAoIHNuZXh0
LT5wcmkgPiBDU0NIRURfUFJJX1RTX09WRVIgKQogICAgICAgICBfX3J1bnFfcmVtb3ZlKHNuZXh0
KTsKICAgICBlbHNlCi0gICAgICAgIHNuZXh0ID0gY3NjaGVkX2xvYWRfYmFsYW5jZShwcnYsIGNw
dSwgc25leHQsICZyZXQubWlncmF0ZWQpOworICAgICAgICBzbmV4dCA9IGNzY2hlZF9sb2FkX2Jh
bGFuY2UocHJ2LCBzY2hlZF9jcHUsIHNuZXh0LCAmcmV0Lm1pZ3JhdGVkKTsKIAogICAgIC8qCiAg
ICAgICogVXBkYXRlIGlkbGVycyBtYXNrIGlmIG5lY2Vzc2FyeS4gV2hlbiB3ZSdyZSBpZGxpbmcs
IG90aGVyIENQVXMKQEAgLTE5ODgsMTIgKzE5ODksMTIgQEAgY3NjaGVkX3NjaGVkdWxlKAogICAg
ICAqLwogICAgIGlmICggIXRhc2tsZXRfd29ya19zY2hlZHVsZWQgJiYgc25leHQtPnByaSA9PSBD
U0NIRURfUFJJX0lETEUgKQogICAgIHsKLSAgICAgICAgaWYgKCAhY3B1bWFza190ZXN0X2NwdShj
cHUsIHBydi0+aWRsZXJzKSApCi0gICAgICAgICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCBwcnYt
PmlkbGVycyk7CisgICAgICAgIGlmICggIWNwdW1hc2tfdGVzdF9jcHUoc2NoZWRfY3B1LCBwcnYt
PmlkbGVycykgKQorICAgICAgICAgICAgY3B1bWFza19zZXRfY3B1KHNjaGVkX2NwdSwgcHJ2LT5p
ZGxlcnMpOwogICAgIH0KLSAgICBlbHNlIGlmICggY3B1bWFza190ZXN0X2NwdShjcHUsIHBydi0+
aWRsZXJzKSApCisgICAgZWxzZSBpZiAoIGNwdW1hc2tfdGVzdF9jcHUoc2NoZWRfY3B1LCBwcnYt
PmlkbGVycykgKQogICAgIHsKLSAgICAgICAgY3B1bWFza19jbGVhcl9jcHUoY3B1LCBwcnYtPmlk
bGVycyk7CisgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KHNjaGVkX2NwdSwgcHJ2LT5pZGxlcnMp
OwogICAgIH0KIAogICAgIGlmICggIWlzX2lkbGVfaXRlbShzbmV4dC0+aXRlbSkgKQpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRp
dDIuYwppbmRleCA3OTE4ZDQ2YTIzLi5kNWNiOGMwMjAwIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdDIuYwpAQCAtMzQ0
Nyw3ICszNDQ3LDggQEAgc3RhdGljIHN0cnVjdCB0YXNrX3NsaWNlCiBjc2NoZWQyX3NjaGVkdWxl
KAogICAgIGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc190aW1lX3Qgbm93LCBib29sIHRh
c2tsZXRfd29ya19zY2hlZHVsZWQpCiB7Ci0gICAgY29uc3QgaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgp
OworICAgIGNvbnN0IHVuc2lnbmVkIGludCBzY2hlZF9jcHUgPSBzY2hlZF9nZXRfcmVzb3VyY2Vf
Y3B1KGNwdSk7CiAgICAgc3RydWN0IGNzY2hlZDJfcnVucXVldWVfZGF0YSAqcnFkOwogICAgIHN0
cnVjdCBzY2hlZF9pdGVtICpjdXJyaXRlbSA9IGN1cnJlbnQtPnNjaGVkX2l0ZW07CiAgICAgc3Ry
dWN0IGNzY2hlZDJfaXRlbSAqIGNvbnN0IHNjdXJyID0gY3NjaGVkMl9pdGVtKGN1cnJpdGVtKTsK
QEAgLTM0NTksMjIgKzM0NjAsMjIgQEAgY3NjaGVkMl9zY2hlZHVsZSgKICAgICBTQ0hFRF9TVEFU
X0NSQU5LKHNjaGVkdWxlKTsKICAgICBDU0NIRUQyX0lURU1fQ0hFQ0soY3Vycml0ZW0pOwogCi0g
ICAgQlVHX09OKCFjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJmNzY2hlZDJfcHJpdihvcHMpLT5pbml0
aWFsaXplZCkpOworICAgIEJVR19PTighY3B1bWFza190ZXN0X2NwdShzY2hlZF9jcHUsICZjc2No
ZWQyX3ByaXYob3BzKS0+aW5pdGlhbGl6ZWQpKTsKIAotICAgIHJxZCA9IGMycnFkKG9wcywgY3B1
KTsKLSAgICBCVUdfT04oIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmcnFkLT5hY3RpdmUpKTsKKyAg
ICBycWQgPSBjMnJxZChvcHMsIHNjaGVkX2NwdSk7CisgICAgQlVHX09OKCFjcHVtYXNrX3Rlc3Rf
Y3B1KHNjaGVkX2NwdSwgJnJxZC0+YWN0aXZlKSk7CiAKLSAgICBBU1NFUlQoc3Bpbl9pc19sb2Nr
ZWQocGVyX2NwdShzY2hlZF9yZXMsIGNwdSktPnNjaGVkdWxlX2xvY2spKTsKKyAgICBBU1NFUlQo
c3Bpbl9pc19sb2NrZWQocGVyX2NwdShzY2hlZF9yZXMsIHNjaGVkX2NwdSktPnNjaGVkdWxlX2xv
Y2spKTsKIAogICAgIEJVR19PTighaXNfaWRsZV9pdGVtKGN1cnJpdGVtKSAmJiBzY3Vyci0+cnFk
ICE9IHJxZCk7CiAKICAgICAvKiBDbGVhciAidGlja2xlZCIgYml0IG5vdyB0aGF0IHdlJ3ZlIGJl
ZW4gc2NoZWR1bGVkICovCi0gICAgdGlja2xlZCA9IGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmcnFk
LT50aWNrbGVkKTsKKyAgICB0aWNrbGVkID0gY3B1bWFza190ZXN0X2NwdShzY2hlZF9jcHUsICZy
cWQtPnRpY2tsZWQpOwogICAgIGlmICggdGlja2xlZCApCiAgICAgewotICAgICAgICBfX2NwdW1h
c2tfY2xlYXJfY3B1KGNwdSwgJnJxZC0+dGlja2xlZCk7CisgICAgICAgIF9fY3B1bWFza19jbGVh
cl9jcHUoc2NoZWRfY3B1LCAmcnFkLT50aWNrbGVkKTsKICAgICAgICAgY3B1bWFza19hbmRub3Qo
Y3B1bWFza19zY3JhdGNoLCAmcnFkLT5pZGxlLCAmcnFkLT50aWNrbGVkKTsKLSAgICAgICAgc210
X2lkbGVfbWFza19zZXQoY3B1LCBjcHVtYXNrX3NjcmF0Y2gsICZycWQtPnNtdF9pZGxlKTsKKyAg
ICAgICAgc210X2lkbGVfbWFza19zZXQoc2NoZWRfY3B1LCBjcHVtYXNrX3NjcmF0Y2gsICZycWQt
PnNtdF9pZGxlKTsKICAgICB9CiAKICAgICBpZiAoIHVubGlrZWx5KHRiX2luaXRfZG9uZSkgKQpA
QCAtMzQ4NCwxMCArMzQ4NSwxMCBAQCBjc2NoZWQyX3NjaGVkdWxlKAogICAgICAgICAgICAgdW5z
aWduZWQgdGFza2xldDo4LCBpZGxlOjgsIHNtdF9pZGxlOjgsIHRpY2tsZWQ6ODsKICAgICAgICAg
fSBkOwogICAgICAgICBkLmNwdSA9IGNwdTsKLSAgICAgICAgZC5ycV9pZCA9IGMycihjcHUpOwor
ICAgICAgICBkLnJxX2lkID0gYzJyKHNjaGVkX2NwdSk7CiAgICAgICAgIGQudGFza2xldCA9IHRh
c2tsZXRfd29ya19zY2hlZHVsZWQ7CiAgICAgICAgIGQuaWRsZSA9IGlzX2lkbGVfaXRlbShjdXJy
aXRlbSk7Ci0gICAgICAgIGQuc210X2lkbGUgPSBjcHVtYXNrX3Rlc3RfY3B1KGNwdSwgJnJxZC0+
c210X2lkbGUpOworICAgICAgICBkLnNtdF9pZGxlID0gY3B1bWFza190ZXN0X2NwdShzY2hlZF9j
cHUsICZycWQtPnNtdF9pZGxlKTsKICAgICAgICAgZC50aWNrbGVkID0gdGlja2xlZDsKICAgICAg
ICAgX190cmFjZV92YXIoVFJDX0NTQ0hFRDJfU0NIRURVTEUsIDEsCiAgICAgICAgICAgICAgICAg
ICAgIHNpemVvZihkKSwKQEAgLTM1MjcsMTAgKzM1MjgsMTAgQEAgY3NjaGVkMl9zY2hlZHVsZSgK
ICAgICB7CiAgICAgICAgIF9fY2xlYXJfYml0KF9fQ1NGTEFHX2l0ZW1feWllbGQsICZzY3Vyci0+
ZmxhZ3MpOwogICAgICAgICB0cmFjZV92YXIoVFJDX0NTQ0hFRDJfU0NIRURfVEFTS0xFVCwgMSwg
MCwgTlVMTCk7Ci0gICAgICAgIHNuZXh0ID0gY3NjaGVkMl9pdGVtKHNjaGVkX2lkbGVfaXRlbShj
cHUpKTsKKyAgICAgICAgc25leHQgPSBjc2NoZWQyX2l0ZW0oc2NoZWRfaWRsZV9pdGVtKHNjaGVk
X2NwdSkpOwogICAgIH0KICAgICBlbHNlCi0gICAgICAgIHNuZXh0ID0gcnVucV9jYW5kaWRhdGUo
cnFkLCBzY3VyciwgY3B1LCBub3csICZza2lwcGVkX2l0ZW1zKTsKKyAgICAgICAgc25leHQgPSBy
dW5xX2NhbmRpZGF0ZShycWQsIHNjdXJyLCBzY2hlZF9jcHUsIG5vdywgJnNraXBwZWRfaXRlbXMp
OwogCiAgICAgLyogSWYgc3dpdGNoaW5nIGZyb20gYSBub24taWRsZSBydW5uYWJsZSBpdGVtLCBw
dXQgaXQKICAgICAgKiBiYWNrIG9uIHRoZSBydW5xdWV1ZS4gKi8KQEAgLTM1NTUsMTAgKzM1NTYs
MTAgQEAgY3NjaGVkMl9zY2hlZHVsZSgKICAgICAgICAgfQogCiAgICAgICAgIC8qIENsZWFyIHRo
ZSBpZGxlIG1hc2sgaWYgbmVjZXNzYXJ5ICovCi0gICAgICAgIGlmICggY3B1bWFza190ZXN0X2Nw
dShjcHUsICZycWQtPmlkbGUpICkKKyAgICAgICAgaWYgKCBjcHVtYXNrX3Rlc3RfY3B1KHNjaGVk
X2NwdSwgJnJxZC0+aWRsZSkgKQogICAgICAgICB7Ci0gICAgICAgICAgICBfX2NwdW1hc2tfY2xl
YXJfY3B1KGNwdSwgJnJxZC0+aWRsZSk7Ci0gICAgICAgICAgICBzbXRfaWRsZV9tYXNrX2NsZWFy
KGNwdSwgJnJxZC0+c210X2lkbGUpOworICAgICAgICAgICAgX19jcHVtYXNrX2NsZWFyX2NwdShz
Y2hlZF9jcHUsICZycWQtPmlkbGUpOworICAgICAgICAgICAgc210X2lkbGVfbWFza19jbGVhcihz
Y2hlZF9jcHUsICZycWQtPnNtdF9pZGxlKTsKICAgICAgICAgfQogCiAgICAgICAgIC8qCkBAIC0z
NTc3LDE4ICszNTc4LDE4IEBAIGNzY2hlZDJfc2NoZWR1bGUoCiAgICAgICAgICAqLwogICAgICAg
ICBpZiAoIHNraXBwZWRfaXRlbXMgPT0gMCAmJiBzbmV4dC0+Y3JlZGl0IDw9IENTQ0hFRDJfQ1JF
RElUX1JFU0VUICkKICAgICAgICAgewotICAgICAgICAgICAgcmVzZXRfY3JlZGl0KG9wcywgY3B1
LCBub3csIHNuZXh0KTsKLSAgICAgICAgICAgIGJhbGFuY2VfbG9hZChvcHMsIGNwdSwgbm93KTsK
KyAgICAgICAgICAgIHJlc2V0X2NyZWRpdChvcHMsIHNjaGVkX2NwdSwgbm93LCBzbmV4dCk7Cisg
ICAgICAgICAgICBiYWxhbmNlX2xvYWQob3BzLCBzY2hlZF9jcHUsIG5vdyk7CiAgICAgICAgIH0K
IAogICAgICAgICBzbmV4dC0+c3RhcnRfdGltZSA9IG5vdzsKICAgICAgICAgc25leHQtPnRpY2ts
ZWRfY3B1ID0gLTE7CiAKICAgICAgICAgLyogU2FmZSBiZWNhdXNlIGxvY2sgZm9yIG9sZCBwcm9j
ZXNzb3IgaXMgaGVsZCAqLwotICAgICAgICBpZiAoIHNjaGVkX2l0ZW1fY3B1KHNuZXh0LT5pdGVt
KSAhPSBjcHUgKQorICAgICAgICBpZiAoIHNjaGVkX2l0ZW1fY3B1KHNuZXh0LT5pdGVtKSAhPSBz
Y2hlZF9jcHUgKQogICAgICAgICB7CiAgICAgICAgICAgICBzbmV4dC0+Y3JlZGl0ICs9IENTQ0hF
RDJfTUlHUkFURV9DT01QRU5TQVRJT047Ci0gICAgICAgICAgICBzY2hlZF9zZXRfcmVzKHNuZXh0
LT5pdGVtLCBwZXJfY3B1KHNjaGVkX3JlcywgY3B1KSk7CisgICAgICAgICAgICBzY2hlZF9zZXRf
cmVzKHNuZXh0LT5pdGVtLCBwZXJfY3B1KHNjaGVkX3Jlcywgc2NoZWRfY3B1KSk7CiAgICAgICAg
ICAgICBTQ0hFRF9TVEFUX0NSQU5LKG1pZ3JhdGVkKTsKICAgICAgICAgICAgIHJldC5taWdyYXRl
ZCA9IDE7CiAgICAgICAgIH0KQEAgLTM2MDEsMTcgKzM2MDIsMTcgQEAgY3NjaGVkMl9zY2hlZHVs
ZSgKICAgICAgICAgICovCiAgICAgICAgIGlmICggdGFza2xldF93b3JrX3NjaGVkdWxlZCApCiAg
ICAgICAgIHsKLSAgICAgICAgICAgIGlmICggY3B1bWFza190ZXN0X2NwdShjcHUsICZycWQtPmlk
bGUpICkKKyAgICAgICAgICAgIGlmICggY3B1bWFza190ZXN0X2NwdShzY2hlZF9jcHUsICZycWQt
PmlkbGUpICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBfX2NwdW1hc2tfY2xlYXJf
Y3B1KGNwdSwgJnJxZC0+aWRsZSk7Ci0gICAgICAgICAgICAgICAgc210X2lkbGVfbWFza19jbGVh
cihjcHUsICZycWQtPnNtdF9pZGxlKTsKKyAgICAgICAgICAgICAgICBfX2NwdW1hc2tfY2xlYXJf
Y3B1KHNjaGVkX2NwdSwgJnJxZC0+aWRsZSk7CisgICAgICAgICAgICAgICAgc210X2lkbGVfbWFz
a19jbGVhcihzY2hlZF9jcHUsICZycWQtPnNtdF9pZGxlKTsKICAgICAgICAgICAgIH0KICAgICAg
ICAgfQotICAgICAgICBlbHNlIGlmICggIWNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmcnFkLT5pZGxl
KSApCisgICAgICAgIGVsc2UgaWYgKCAhY3B1bWFza190ZXN0X2NwdShzY2hlZF9jcHUsICZycWQt
PmlkbGUpICkKICAgICAgICAgewotICAgICAgICAgICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCAm
cnFkLT5pZGxlKTsKKyAgICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1KHNjaGVkX2NwdSwgJnJx
ZC0+aWRsZSk7CiAgICAgICAgICAgICBjcHVtYXNrX2FuZG5vdChjcHVtYXNrX3NjcmF0Y2gsICZy
cWQtPmlkbGUsICZycWQtPnRpY2tsZWQpOwotICAgICAgICAgICAgc210X2lkbGVfbWFza19zZXQo
Y3B1LCBjcHVtYXNrX3NjcmF0Y2gsICZycWQtPnNtdF9pZGxlKTsKKyAgICAgICAgICAgIHNtdF9p
ZGxlX21hc2tfc2V0KHNjaGVkX2NwdSwgY3B1bWFza19zY3JhdGNoLCAmcnFkLT5zbXRfaWRsZSk7
CiAgICAgICAgIH0KICAgICAgICAgLyogTWFrZSBzdXJlIGF2Z2xvYWQgZ2V0cyB1cGRhdGVkIHBl
cmlvZGljYWxseSBldmVuCiAgICAgICAgICAqIGlmIHRoZXJlJ3Mgbm8gYWN0aXZpdHkgKi8KQEAg
LTM2MjEsNyArMzYyMiw3IEBAIGNzY2hlZDJfc2NoZWR1bGUoCiAgICAgLyoKICAgICAgKiBSZXR1
cm4gdGFzayB0byBydW4gbmV4dC4uLgogICAgICAqLwotICAgIHJldC50aW1lID0gY3NjaGVkMl9y
dW50aW1lKG9wcywgY3B1LCBzbmV4dCwgbm93KTsKKyAgICByZXQudGltZSA9IGNzY2hlZDJfcnVu
dGltZShvcHMsIHNjaGVkX2NwdSwgc25leHQsIG5vdyk7CiAgICAgcmV0LnRhc2sgPSBzbmV4dC0+
aXRlbTsKIAogICAgIENTQ0hFRDJfSVRFTV9DSEVDSyhyZXQudGFzayk7CmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3NjaGVkX251bGwuYyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCmluZGV4IGNl
YjAyNmM4YWYuLjM0Y2U3YTA1ZDMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfbnVsbC5j
CisrKyBiL3hlbi9jb21tb24vc2NoZWRfbnVsbC5jCkBAIC03MDksNiArNzA5LDcgQEAgc3RhdGlj
IHN0cnVjdCB0YXNrX3NsaWNlIG51bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAq
b3BzLAogewogICAgIHVuc2lnbmVkIGludCBiczsKICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOworICAgIGNvbnN0IHVuc2lnbmVkIGludCBzY2hlZF9jcHUg
PSBzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KGNwdSk7CiAgICAgc3RydWN0IG51bGxfcHJpdmF0ZSAq
cHJ2ID0gbnVsbF9wcml2KG9wcyk7CiAgICAgc3RydWN0IG51bGxfaXRlbSAqd3ZjOwogICAgIHN0
cnVjdCB0YXNrX3NsaWNlIHJldDsKQEAgLTcyNCwxNCArNzI1LDE0IEBAIHN0YXRpYyBzdHJ1Y3Qg
dGFza19zbGljZSBudWxsX3NjaGVkdWxlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywKICAg
ICAgICAgfSBkOwogICAgICAgICBkLmNwdSA9IGNwdTsKICAgICAgICAgZC50YXNrbGV0ID0gdGFz
a2xldF93b3JrX3NjaGVkdWxlZDsKLSAgICAgICAgaWYgKCBwZXJfY3B1KG5wYywgY3B1KS5pdGVt
ID09IE5VTEwgKQorICAgICAgICBpZiAoIHBlcl9jcHUobnBjLCBzY2hlZF9jcHUpLml0ZW0gPT0g
TlVMTCApCiAgICAgICAgIHsKICAgICAgICAgICAgIGQuaXRlbSA9IGQuZG9tID0gLTE7CiAgICAg
ICAgIH0KICAgICAgICAgZWxzZQogICAgICAgICB7Ci0gICAgICAgICAgICBkLml0ZW0gPSBwZXJf
Y3B1KG5wYywgY3B1KS5pdGVtLT5pdGVtX2lkOwotICAgICAgICAgICAgZC5kb20gPSBwZXJfY3B1
KG5wYywgY3B1KS5pdGVtLT5kb21haW4tPmRvbWFpbl9pZDsKKyAgICAgICAgICAgIGQuaXRlbSA9
IHBlcl9jcHUobnBjLCBzY2hlZF9jcHUpLml0ZW0tPml0ZW1faWQ7CisgICAgICAgICAgICBkLmRv
bSA9IHBlcl9jcHUobnBjLCBzY2hlZF9jcHUpLml0ZW0tPmRvbWFpbi0+ZG9tYWluX2lkOwogICAg
ICAgICB9CiAgICAgICAgIF9fdHJhY2VfdmFyKFRSQ19TTlVMTF9TQ0hFRFVMRSwgMSwgc2l6ZW9m
KGQpLCAmZCk7CiAgICAgfQpAQCAtNzM5LDEwICs3NDAsMTAgQEAgc3RhdGljIHN0cnVjdCB0YXNr
X3NsaWNlIG51bGxfc2NoZWR1bGUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogICAgIGlm
ICggdGFza2xldF93b3JrX3NjaGVkdWxlZCApCiAgICAgewogICAgICAgICB0cmFjZV92YXIoVFJD
X1NOVUxMX1RBU0tMRVQsIDEsIDAsIE5VTEwpOwotICAgICAgICByZXQudGFzayA9IHNjaGVkX2lk
bGVfaXRlbShjcHUpOworICAgICAgICByZXQudGFzayA9IHNjaGVkX2lkbGVfaXRlbShzY2hlZF9j
cHUpOwogICAgIH0KICAgICBlbHNlCi0gICAgICAgIHJldC50YXNrID0gcGVyX2NwdShucGMsIGNw
dSkuaXRlbTsKKyAgICAgICAgcmV0LnRhc2sgPSBwZXJfY3B1KG5wYywgc2NoZWRfY3B1KS5pdGVt
OwogICAgIHJldC5taWdyYXRlZCA9IDA7CiAgICAgcmV0LnRpbWUgPSAtMTsKIApAQCAtNzczLDkg
Kzc3NCw5IEBAIHN0YXRpYyBzdHJ1Y3QgdGFza19zbGljZSBudWxsX3NjaGVkdWxlKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywKICAgICAgICAgICAgICAgICAgICAgICFoYXNfc29mdF9hZmZp
bml0eSh3dmMtPml0ZW0pICkKICAgICAgICAgICAgICAgICAgICAgY29udGludWU7CiAKLSAgICAg
ICAgICAgICAgICBpZiAoIGl0ZW1fY2hlY2tfYWZmaW5pdHkod3ZjLT5pdGVtLCBjcHUsIGJzKSAp
CisgICAgICAgICAgICAgICAgaWYgKCBpdGVtX2NoZWNrX2FmZmluaXR5KHd2Yy0+aXRlbSwgc2No
ZWRfY3B1LCBicykgKQogICAgICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAgaXRl
bV9hc3NpZ24ocHJ2LCB3dmMtPml0ZW0sIGNwdSk7CisgICAgICAgICAgICAgICAgICAgIGl0ZW1f
YXNzaWduKHBydiwgd3ZjLT5pdGVtLCBzY2hlZF9jcHUpOwogICAgICAgICAgICAgICAgICAgICBs
aXN0X2RlbF9pbml0KCZ3dmMtPndhaXRxX2VsZW0pOwogICAgICAgICAgICAgICAgICAgICByZXQu
dGFzayA9IHd2Yy0+aXRlbTsKICAgICAgICAgICAgICAgICAgICAgZ290byB1bmxvY2s7CkBAIC03
ODcsNyArNzg4LDcgQEAgc3RhdGljIHN0cnVjdCB0YXNrX3NsaWNlIG51bGxfc2NoZWR1bGUoY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLAogICAgIH0KIAogICAgIGlmICggdW5saWtlbHkocmV0
LnRhc2sgPT0gTlVMTCB8fCAhaXRlbV9ydW5uYWJsZShyZXQudGFzaykpICkKLSAgICAgICAgcmV0
LnRhc2sgPSBzY2hlZF9pZGxlX2l0ZW0oY3B1KTsKKyAgICAgICAgcmV0LnRhc2sgPSBzY2hlZF9p
ZGxlX2l0ZW0oc2NoZWRfY3B1KTsKIAogICAgIE5VTExfSVRFTV9DSEVDSyhyZXQudGFzayk7CiAg
ICAgcmV0dXJuIHJldDsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfcnQuYyBiL3hlbi9j
b21tb24vc2NoZWRfcnQuYwppbmRleCA3MzBhYTI5MmQ0Li4yMzY2ZTMzYmViIDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL3NjaGVkX3J0LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZF9ydC5jCkBAIC0x
MDY1LDcgKzEwNjUsOCBAQCBydW5xX3BpY2soY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBj
b25zdCBjcHVtYXNrX3QgKm1hc2spCiBzdGF0aWMgc3RydWN0IHRhc2tfc2xpY2UKIHJ0X3NjaGVk
dWxlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc190aW1lX3Qgbm93LCBib29sX3QgdGFz
a2xldF93b3JrX3NjaGVkdWxlZCkKIHsKLSAgICBjb25zdCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nv
cl9pZCgpOworICAgIGNvbnN0IHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7
CisgICAgY29uc3QgdW5zaWduZWQgaW50IHNjaGVkX2NwdSA9IHNjaGVkX2dldF9yZXNvdXJjZV9j
cHUoY3B1KTsKICAgICBzdHJ1Y3QgcnRfcHJpdmF0ZSAqcHJ2ID0gcnRfcHJpdihvcHMpOwogICAg
IHN0cnVjdCBydF9pdGVtICpjb25zdCBzY3VyciA9IHJ0X2l0ZW0oY3VycmVudC0+c2NoZWRfaXRl
bSk7CiAgICAgc3RydWN0IHJ0X2l0ZW0gKnNuZXh0ID0gTlVMTDsKQEAgLTEwNzksNyArMTA4MCw3
IEBAIHJ0X3NjaGVkdWxlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc190aW1lX3Qgbm93
LCBib29sX3QgdGFza2xldF93b3JrX3NjaGVkCiAgICAgICAgIH0gZDsKICAgICAgICAgZC5jcHUg
PSBjcHU7CiAgICAgICAgIGQudGFza2xldCA9IHRhc2tsZXRfd29ya19zY2hlZHVsZWQ7Ci0gICAg
ICAgIGQudGlja2xlZCA9IGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAmcHJ2LT50aWNrbGVkKTsKKyAg
ICAgICAgZC50aWNrbGVkID0gY3B1bWFza190ZXN0X2NwdShzY2hlZF9jcHUsICZwcnYtPnRpY2ts
ZWQpOwogICAgICAgICBkLmlkbGUgPSBpc19pZGxlX2l0ZW0oY3Vycml0ZW0pOwogICAgICAgICB0
cmFjZV92YXIoVFJDX1JURFNfU0NIRURVTEUsIDEsCiAgICAgICAgICAgICAgICAgICBzaXplb2Yo
ZCksCkBAIC0xMDg3LDcgKzEwODgsNyBAQCBydF9zY2hlZHVsZShjb25zdCBzdHJ1Y3Qgc2NoZWR1
bGVyICpvcHMsIHNfdGltZV90IG5vdywgYm9vbF90IHRhc2tsZXRfd29ya19zY2hlZAogICAgIH0K
IAogICAgIC8qIGNsZWFyIHRpY2tlZCBiaXQgbm93IHRoYXQgd2UndmUgYmVlbiBzY2hlZHVsZWQg
Ki8KLSAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsICZwcnYtPnRpY2tsZWQpOworICAgIGNwdW1h
c2tfY2xlYXJfY3B1KHNjaGVkX2NwdSwgJnBydi0+dGlja2xlZCk7CiAKICAgICAvKiBidXJuX2J1
ZGdldCB3b3VsZCByZXR1cm4gZm9yIElETEUgSVRFTSAqLwogICAgIGJ1cm5fYnVkZ2V0KG9wcywg
c2N1cnIsIG5vdyk7CkBAIC0xMDk1LDEzICsxMDk2LDEzIEBAIHJ0X3NjaGVkdWxlKGNvbnN0IHN0
cnVjdCBzY2hlZHVsZXIgKm9wcywgc190aW1lX3Qgbm93LCBib29sX3QgdGFza2xldF93b3JrX3Nj
aGVkCiAgICAgaWYgKCB0YXNrbGV0X3dvcmtfc2NoZWR1bGVkICkKICAgICB7CiAgICAgICAgIHRy
YWNlX3ZhcihUUkNfUlREU19TQ0hFRF9UQVNLTEVULCAxLCAwLCAgTlVMTCk7Ci0gICAgICAgIHNu
ZXh0ID0gcnRfaXRlbShzY2hlZF9pZGxlX2l0ZW0oY3B1KSk7CisgICAgICAgIHNuZXh0ID0gcnRf
aXRlbShzY2hlZF9pZGxlX2l0ZW0oc2NoZWRfY3B1KSk7CiAgICAgfQogICAgIGVsc2UKICAgICB7
Ci0gICAgICAgIHNuZXh0ID0gcnVucV9waWNrKG9wcywgY3B1bWFza19vZihjcHUpKTsKKyAgICAg
ICAgc25leHQgPSBydW5xX3BpY2sob3BzLCBjcHVtYXNrX29mKHNjaGVkX2NwdSkpOwogICAgICAg
ICBpZiAoIHNuZXh0ID09IE5VTEwgKQotICAgICAgICAgICAgc25leHQgPSBydF9pdGVtKHNjaGVk
X2lkbGVfaXRlbShjcHUpKTsKKyAgICAgICAgICAgIHNuZXh0ID0gcnRfaXRlbShzY2hlZF9pZGxl
X2l0ZW0oc2NoZWRfY3B1KSk7CiAKICAgICAgICAgLyogaWYgc2N1cnIgaGFzIGhpZ2hlciBwcmlv
cml0eSBhbmQgYnVkZ2V0LCBzdGlsbCBwaWNrIHNjdXJyICovCiAgICAgICAgIGlmICggIWlzX2lk
bGVfaXRlbShjdXJyaXRlbSkgJiYKQEAgLTExMjYsOSArMTEyNyw5IEBAIHJ0X3NjaGVkdWxlKGNv
bnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc190aW1lX3Qgbm93LCBib29sX3QgdGFza2xldF93
b3JrX3NjaGVkCiAgICAgICAgICAgICBxX3JlbW92ZShzbmV4dCk7CiAgICAgICAgICAgICBfX3Nl
dF9iaXQoX19SVERTX3NjaGVkdWxlZCwgJnNuZXh0LT5mbGFncyk7CiAgICAgICAgIH0KLSAgICAg
ICAgaWYgKCBzY2hlZF9pdGVtX2NwdShzbmV4dC0+aXRlbSkgIT0gY3B1ICkKKyAgICAgICAgaWYg
KCBzY2hlZF9pdGVtX2NwdShzbmV4dC0+aXRlbSkgIT0gc2NoZWRfY3B1ICkKICAgICAgICAgewot
ICAgICAgICAgICAgc2NoZWRfc2V0X3JlcyhzbmV4dC0+aXRlbSwgcGVyX2NwdShzY2hlZF9yZXMs
IGNwdSkpOworICAgICAgICAgICAgc2NoZWRfc2V0X3JlcyhzbmV4dC0+aXRlbSwgcGVyX2NwdShz
Y2hlZF9yZXMsIHNjaGVkX2NwdSkpOwogICAgICAgICAgICAgcmV0Lm1pZ3JhdGVkID0gMTsKICAg
ICAgICAgfQogICAgICAgICByZXQudGltZSA9IHNuZXh0LT5jdXJfYnVkZ2V0OyAvKiBpbnZva2Ug
dGhlIHNjaGVkdWxlciBuZXh0IHRpbWUgKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggNjVlMmMzYmJhOC4u
MjUwNjUzODY0OSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKQEAgLTEwMCw2ICsxMDAsMTEgQEAgc3RhdGljIGlu
bGluZSBzdHJ1Y3Qgc2NoZWRfaXRlbSAqc2NoZWRfaWRsZV9pdGVtKHVuc2lnbmVkIGludCBjcHUp
CiAgICAgcmV0dXJuIGlkbGVfdmNwdVtjcHVdLT5zY2hlZF9pdGVtOwogfQogCitzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGludCBzY2hlZF9nZXRfcmVzb3VyY2VfY3B1KHVuc2lnbmVkIGludCBjcHUp
Cit7CisgICAgcmV0dXJuIHBlcl9jcHUoc2NoZWRfcmVzLCBjcHUpLT5wcm9jZXNzb3I7Cit9CisK
IC8qCiAgKiBTY3JhdGNoIHNwYWNlLCBmb3IgYXZvaWRpbmcgaGF2aW5nIHRvbyBtYW55IGNwdW1h
c2tfdCBvbiB0aGUgc3RhY2suCiAgKiBXaXRoaW4gZWFjaCBzY2hlZHVsZXIsIHdoZW4gdXNpbmcg
dGhlIHNjcmF0Y2ggbWFzayBvZiBvbmUgcENQVToKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
