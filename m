Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F443BFFB0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:05:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkHI-0005pu-K0; Fri, 27 Sep 2019 07:02:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkHH-0005o5-78
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:02:55 +0000
X-Inumbo-ID: 9563c134-e0f4-11e9-966c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 9563c134-e0f4-11e9-966c-12813bfff9fa;
 Fri, 27 Sep 2019 07:01:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AD60B052;
 Fri, 27 Sep 2019 07:01:08 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:49 +0200
Message-Id: <20190927070050.12405-46-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 45/46] xen/sched: disable scheduling when
 entering ACPI deep sleep states
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
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

V2hlbiBlbnRlcmluZyBkZWVwIHNsZWVwIHN0YXRlcyBhbGwgZG9tYWlucyBhcmUgcGF1c2VkIHJl
c3VsdGluZyBpbgphbGwgY3B1cyBvbmx5IHJ1bm5pbmcgaWRsZSB2Y3B1cy4gVGhpcyBlbmFibGVz
IHVzIHRvIHN0b3Agc2NoZWR1bGluZwpjb21wbGV0ZWx5IGluIG9yZGVyIHRvIGF2b2lkIHN5bmNo
cm9uaXphdGlvbiBwcm9ibGVtcyB3aXRoIGNvcmUKc2NoZWR1bGluZyB3aGVuIGluZGl2aWR1YWwg
Y3B1cyBhcmUgb2ZmbGluZWQuCgpEaXNhYmxpbmcgdGhlIHNjaGVkdWxlciBpcyBkb25lIGJ5IHJl
cGxhY2luZyB0aGUgc29mdGlycSBoYW5kbGVyCndpdGggYSBkdW1teSBzY2hlZHVsaW5nIHJvdXRp
bmUgb25seSBlbmFibGluZyB0YXNrbGV0cyB0byBydW4uCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+ClJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29t
PgotLS0KVjI6IG5ldyBwYXRjaAotLS0KIHhlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMgfCAgNCAr
KysrCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgICAgIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICB8ICAyICsrCiAzIGZpbGVzIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2FjcGkvcG93ZXIuYyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKaW5kZXgg
MjY5YjE0MDhkNC4uNDdhNmM0N2JiZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYworKysgYi94ZW4vYXJjaC94ODYvYWNwaS9wb3dlci5jCkBAIC0xNDUsMTIgKzE0NSwxNiBA
QCBzdGF0aWMgdm9pZCBmcmVlemVfZG9tYWlucyh2b2lkKQogICAgIGZvcl9lYWNoX2RvbWFpbiAo
IGQgKQogICAgICAgICBkb21haW5fcGF1c2UoZCk7CiAgICAgcmN1X3JlYWRfdW5sb2NrKCZkb21s
aXN0X3JlYWRfbG9jayk7CisKKyAgICBzY2hlZHVsZXJfZGlzYWJsZSgpOwogfQogCiBzdGF0aWMg
dm9pZCB0aGF3X2RvbWFpbnModm9pZCkKIHsKICAgICBzdHJ1Y3QgZG9tYWluICpkOwogCisgICAg
c2NoZWR1bGVyX2VuYWJsZSgpOworCiAgICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xv
Y2spOwogICAgIGZvcl9lYWNoX2RvbWFpbiAoIGQgKQogICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCBkMjEzMzU1OGM4
Li5hYzg0MGI5ZGZkIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCkBAIC04OSw2ICs4OSw4IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qg
c2NoZWR1bGVyICpfX3N0YXJ0X3NjaGVkdWxlcnNfYXJyYXlbXSwgKl9fZW5kX3NjaGVkdWxlcnNf
YXJyCiAKIHN0YXRpYyBzdHJ1Y3Qgc2NoZWR1bGVyIF9fcmVhZF9tb3N0bHkgb3BzOwogCitzdGF0
aWMgYm9vbCBzY2hlZHVsZXJfYWN0aXZlOworCiBzdGF0aWMgdm9pZCBzY2hlZF9zZXRfYWZmaW5p
dHkoCiAgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIGNvbnN0IGNwdW1hc2tfdCAqaGFyZCwg
Y29uc3QgY3B1bWFza190ICpzb2Z0KTsKIApAQCAtMjI2MCw2ICsyMjYyLDEzIEBAIHN0YXRpYyBz
dHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHN0cnVjdCBzY2hlZF91
bml0ICpwcmV2LAogICAgICAgICBjcHVfcmVsYXgoKTsKIAogICAgICAgICAqbG9jayA9IHBjcHVf
c2NoZWR1bGVfbG9ja19pcnEoY3B1KTsKKworICAgICAgICBpZiAoIHVubGlrZWx5KCFzY2hlZHVs
ZXJfYWN0aXZlKSApCisgICAgICAgIHsKKyAgICAgICAgICAgIEFTU0VSVChpc19pZGxlX3VuaXQo
cHJldikpOworICAgICAgICAgICAgYXRvbWljX3NldCgmcHJldi0+bmV4dF90YXNrLT5yZW5kZXp2
b3VzX291dF9jbnQsIDApOworICAgICAgICAgICAgcHJldi0+cmVuZGV6dm91c19pbl9jbnQgPSAw
OworICAgICAgICB9CiAgICAgfQogCiAgICAgcmV0dXJuIHByZXYtPm5leHRfdGFzazsKQEAgLTI2
MTQsMTQgKzI2MjMsMzIgQEAgY29uc3QgY3B1bWFza190ICpzY2hlZF9nZXRfb3B0X2NwdW1hc2so
ZW51bSBzY2hlZF9ncmFuIG9wdCwgdW5zaWduZWQgaW50IGNwdSkKICAgICByZXR1cm4gbWFzazsK
IH0KIAorc3RhdGljIHZvaWQgc2NoZWR1bGVfZHVtbXkodm9pZCkKK3sKKyAgICBzY2hlZF90YXNr
bGV0X2NoZWNrX2NwdShzbXBfcHJvY2Vzc29yX2lkKCkpOworfQorCit2b2lkIHNjaGVkdWxlcl9k
aXNhYmxlKHZvaWQpCit7CisgICAgc2NoZWR1bGVyX2FjdGl2ZSA9IGZhbHNlOworICAgIG9wZW5f
c29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRLCBzY2hlZHVsZV9kdW1teSk7CisgICAgb3Blbl9zb2Z0
aXJxKFNDSEVEX1NMQVZFX1NPRlRJUlEsIHNjaGVkdWxlX2R1bW15KTsKK30KKwordm9pZCBzY2hl
ZHVsZXJfZW5hYmxlKHZvaWQpCit7CisgICAgb3Blbl9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEs
IHNjaGVkdWxlKTsKKyAgICBvcGVuX3NvZnRpcnEoU0NIRURfU0xBVkVfU09GVElSUSwgc2NoZWRf
c2xhdmUpOworICAgIHNjaGVkdWxlcl9hY3RpdmUgPSB0cnVlOworfQorCiAvKiBJbml0aWFsaXNl
IHRoZSBkYXRhIHN0cnVjdHVyZXMuICovCiB2b2lkIF9faW5pdCBzY2hlZHVsZXJfaW5pdCh2b2lk
KQogewogICAgIHN0cnVjdCBkb21haW4gKmlkbGVfZG9tYWluOwogICAgIGludCBpOwogCi0gICAg
b3Blbl9zb2Z0aXJxKFNDSEVEVUxFX1NPRlRJUlEsIHNjaGVkdWxlKTsKLSAgICBvcGVuX3NvZnRp
cnEoU0NIRURfU0xBVkVfU09GVElSUSwgc2NoZWRfc2xhdmUpOworICAgIHNjaGVkdWxlcl9lbmFi
bGUoKTsKIAogICAgIGZvciAoIGkgPSAwOyBpIDwgTlVNX1NDSEVEVUxFUlM7IGkrKykKICAgICB7
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oCmluZGV4IGE0MGJkNWZiNTYuLjYyOWE0YzUyZTAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC05MzMsNiAr
OTMzLDggQEAgdm9pZCByZXN0b3JlX3ZjcHVfYWZmaW5pdHkoc3RydWN0IGRvbWFpbiAqZCk7CiB2
b2lkIHZjcHVfcnVuc3RhdGVfZ2V0KHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgdmNwdV9ydW5zdGF0
ZV9pbmZvICpydW5zdGF0ZSk7CiB1aW50NjRfdCBnZXRfY3B1X2lkbGVfdGltZSh1bnNpZ25lZCBp
bnQgY3B1KTsKIHZvaWQgc2NoZWRfZ3Vlc3RfaWRsZSh2b2lkICgqaWRsZSkgKHZvaWQpLCB1bnNp
Z25lZCBpbnQgY3B1KTsKK3ZvaWQgc2NoZWR1bGVyX2VuYWJsZSh2b2lkKTsKK3ZvaWQgc2NoZWR1
bGVyX2Rpc2FibGUodm9pZCk7CiAKIC8qCiAgKiBVc2VkIGJ5IGlkbGUgbG9vcCB0byBkZWNpZGUg
d2hldGhlciB0aGVyZSBpcyB3b3JrIHRvIGRvOgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
