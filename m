Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69565B0FF8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:30:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8P9N-0005y7-9z; Thu, 12 Sep 2019 13:28:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pap2=XH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8P9L-0005xV-K8
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:28:39 +0000
X-Inumbo-ID: 2e5fa5f1-d561-11e9-9599-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e5fa5f1-d561-11e9-9599-12813bfff9fa;
 Thu, 12 Sep 2019 13:28:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65491B65A;
 Thu, 12 Sep 2019 13:28:18 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Sep 2019 15:28:12 +0200
Message-Id: <20190912132813.6509-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190912132813.6509-1-jgross@suse.com>
References: <20190912132813.6509-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 4/5] xen: modify lock profiling interface
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgYWRkaW5nIGxvY2tzIGxvY2F0ZWQgaW4gYSBzdHJ1Y3QgdG8gbG9jayBwcm9maWxpbmcg
cmVxdWlyZXMgYQp1bmlxdWUgdHlwZSBpbmRleCBmb3IgZWFjaCBzdHJ1Y3R1cmUuIFRoaXMgbWFr
ZXMgaXQgaGFyZCB0byBhZGQgYW55Cm5ldyBzdHJ1Y3R1cmUgYXMgdGhlIHJlbGF0ZWQgc3lzY3Rs
IGludGVyZmFjZSBuZWVkcyB0byBiZSBjaGFuZ2VkLCB0b28uCgpJbnN0ZWFkIG9mIHVzaW5nIGFu
IGluZGV4IHRoZSBhbHJlYWR5IGV4aXN0aW5nIHN0cnVjdCBuYW1lIHNwZWNpZmllZAppbiBsb2Nr
X3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KCkgY2FuIGJlIHVzZWQgYXMgYW4gaWRlbnRpZmllciBp
bnN0ZWFkLgoKTW9kaWZ5IHRoZSBzeXNjdGwgaW50ZXJmYWNlIHRvIHVzZSB0aGUgc3RydWN0IG5h
bWUgaW5zdGVhZCBvZiB0aGUgdHlwZQppbmRleCBhbmQgYWRhcHQgdGhlIHJlbGF0ZWQgY29kaW5n
IGFjY29yZGluZ2x5LiBJbnN0ZWFkIG9mIGFuIGFycmF5IG9mCnN0cnVjdCBhbmNob3JzIGZvciBs
b2NrIHByb2ZpbGluZyB3ZSBub3cgdXNlIGEgbGlua2VkIGxpc3QgZm9yIHRoYXQKcHVycG9zZS4g
VXNlIHRoZSBzcGVjaWFsIGlkeCB2YWx1ZSAtMSBmb3IgY2FzZXMgd2hlcmUgdGhlIGlkeCBpc24n
dApyZWxldmFudCAoZ2xvYmFsIGxvY2tzKSBhbmQgc2hvdWxkbid0IGJlIHByaW50ZWQuCgpJbmNy
ZW1lbnQgdGhlIHN5c2N0bC5oIGludGVyZmFjZSB2ZXJzaW9uIGFzIGFuIGludGVyZmFjZSBpcyBi
ZWluZwptb2RpZmllZC4KCkFkZCB0aGUgbWlzc2luZyBzZXR0aW5nIG9mIHByb2ZpbGluZyB0aW1l
IHRvIHhjX2xvY2twcm9mX3F1ZXJ5KCkuCgpBZGQgZnJlZWluZyBlbGVtZW50IGRhdGEgd2hlbiBk
ZXJlZ2lzdGVyaW5nIGEgc3RydWN0dXJlLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgotLS0KVjI6Ci0gYWRkIGNvbW1lbnQgYWJvdXQgbWVtb3J5IGFsbG9j
YXRpb24gbmVlZHMgKEphbiBCZXVsaWNoKQotIGNoZWNrIHN1Y2Nlc3Mgb2YgbWVtb3J5IGFsbG9j
YXRpb24gKEphbiBCZXVsaWNoKQpWNDoKLSBzdHlsZSBjb3JyZWN0aW9uIChKYW4gQmV1bGljaCkK
LSBhdm9pZCBtZW1vcnkgYWxsb2NhdGlvbiB3aGlsZSBob2xkaW5nIGxvY2sgKEphbiBCZXVsaWNo
KQotLS0KIHRvb2xzL2xpYnhjL3hjX21pc2MuYyAgICAgICB8ICAgMSArCiB0b29scy9taXNjL3hl
bmxvY2twcm9mLmMgICAgfCAgMTcgKystLS0tLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAg
IHwgICA0ICstCiB4ZW4vY29tbW9uL3NwaW5sb2NrLmMgICAgICAgfCAxMDcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNj
dGwuaCB8ICAxMSArKy0tLQogeGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmggIHwgIDI5ICsrKysr
KystLS0tLQogNiBmaWxlcyBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfbWlzYy5jIGIvdG9vbHMvbGlieGMveGNf
bWlzYy5jCmluZGV4IDhlNjBiNmU5ZjAuLjIyNzA4ZjFiMWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhjL3hjX21pc2MuYworKysgYi90b29scy9saWJ4Yy94Y19taXNjLmMKQEAgLTUzMyw2ICs1MzMs
NyBAQCBpbnQgeGNfbG9ja3Byb2ZfcXVlcnkoeGNfaW50ZXJmYWNlICp4Y2gsCiAgICAgcmMgPSBk
b19zeXNjdGwoeGNoLCAmc3lzY3RsKTsKIAogICAgICpuX2VsZW1zID0gc3lzY3RsLnUubG9ja3By
b2Zfb3AubnJfZWxlbTsKKyAgICAqdGltZSA9IHN5c2N0bC51LmxvY2twcm9mX29wLnRpbWU7CiAK
ICAgICByZXR1cm4gcmM7CiB9CmRpZmYgLS1naXQgYS90b29scy9taXNjL3hlbmxvY2twcm9mLmMg
Yi90b29scy9taXNjL3hlbmxvY2twcm9mLmMKaW5kZXggMTFmNDNhMzVlMy4uYzZhYTNmZTg0MSAx
MDA2NDQKLS0tIGEvdG9vbHMvbWlzYy94ZW5sb2NrcHJvZi5jCisrKyBiL3Rvb2xzL21pc2MveGVu
bG9ja3Byb2YuYwpAQCAtODgsMTkgKzg4LDEwIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCiAgICAgc2IgPSAwOwogICAgIGZvciAoIGogPSAwOyBqIDwgaTsgaisrICkKICAgICB7
Ci0gICAgICAgIHN3aXRjaCAoIGRhdGFbal0udHlwZSApCi0gICAgICAgIHsKLSAgICAgICAgY2Fz
ZSBMT0NLUFJPRl9UWVBFX0dMT0JBTDoKLSAgICAgICAgICAgIHNwcmludGYobmFtZSwgImdsb2Jh
bCBsb2NrICVzIiwgZGF0YVtqXS5uYW1lKTsKLSAgICAgICAgICAgIGJyZWFrOwotICAgICAgICBj
YXNlIExPQ0tQUk9GX1RZUEVfUEVSRE9NOgotICAgICAgICAgICAgc3ByaW50ZihuYW1lLCAiZG9t
YWluICVkIGxvY2sgJXMiLCBkYXRhW2pdLmlkeCwgZGF0YVtqXS5uYW1lKTsKLSAgICAgICAgICAg
IGJyZWFrOwotICAgICAgICBkZWZhdWx0OgotICAgICAgICAgICAgc3ByaW50ZihuYW1lLCAidW5r
bm93biB0eXBlKCVkKSAlZCBsb2NrICVzIiwgZGF0YVtqXS50eXBlLAotICAgICAgICAgICAgICAg
ICAgICBkYXRhW2pdLmlkeCwgZGF0YVtqXS5uYW1lKTsKLSAgICAgICAgICAgIGJyZWFrOwotICAg
ICAgICB9CisgICAgICAgIGlmICggZGF0YVtqXS5pZHggPT0gTE9DS1BST0ZfSURYX05PTkUgKQor
ICAgICAgICAgICAgc3ByaW50ZihuYW1lLCAiJXMgJXMiLCBkYXRhW2pdLnR5cGUsIGRhdGFbal0u
bmFtZSk7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIHNwcmludGYobmFtZSwgIiVzICVkICVz
IiwgZGF0YVtqXS50eXBlLCBkYXRhW2pdLmlkeCwgZGF0YVtqXS5uYW1lKTsKICAgICAgICAgbCA9
IChkb3VibGUpKGRhdGFbal0ubG9ja190aW1lKSAvIDFFKzA5OwogICAgICAgICBiID0gKGRvdWJs
ZSkoZGF0YVtqXS5ibG9ja190aW1lKSAvIDFFKzA5OwogICAgICAgICBzbCArPSBsOwpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWluLmMKaW5kZXggMDk5
MTdiMjg4NS4uOWE0OGIyNTA0YiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYworKysg
Yi94ZW4vY29tbW9uL2RvbWFpbi5jCkBAIC0yOTAsNyArMjkwLDcgQEAgc3RhdGljIHZvaWQgX2Rv
bWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpCiAKICAgICB4c21fZnJlZV9zZWN1cml0eV9k
b21haW4oZCk7CiAKLSAgICBsb2NrX3Byb2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QoTE9DS1BST0Zf
VFlQRV9QRVJET00sIGQpOworICAgIGxvY2tfcHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdChkLCAi
RG9tYWluIik7CiAKICAgICBmcmVlX2RvbWFpbl9zdHJ1Y3QoZCk7CiB9CkBAIC0zNzYsNyArMzc2
LDcgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRvbWlkLAogICAgICAg
ICBkLT5tYXhfdmNwdXMgPSBjb25maWctPm1heF92Y3B1czsKICAgICB9CiAKLSAgICBsb2NrX3By
b2ZpbGVfcmVnaXN0ZXJfc3RydWN0KExPQ0tQUk9GX1RZUEVfUEVSRE9NLCBkLCBkb21pZCwgIkRv
bWFpbiIpOworICAgIGxvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3QoZCwgZG9taWQsICJEb21h
aW4iKTsKIAogICAgIGlmICggKGVyciA9IHhzbV9hbGxvY19zZWN1cml0eV9kb21haW4oZCkpICE9
IDAgKQogICAgICAgICBnb3RvIGZhaWw7CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NwaW5sb2Nr
LmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggZjczMzExZWE0MS4uNjczZWYxNjhkYSAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21tb24vc3Bpbmxv
Y2suYwpAQCAtMzMzLDQyICszMzMsNDMgQEAgdm9pZCBfc3Bpbl91bmxvY2tfcmVjdXJzaXZlKHNw
aW5sb2NrX3QgKmxvY2spCiAjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRQogCiBzdHJ1
Y3QgbG9ja19wcm9maWxlX2FuYyB7CisgICAgc3RydWN0IGxvY2tfcHJvZmlsZV9hbmMgICAqbmV4
dDsgICAgIC8qIG5leHQgdHlwZSAqLwogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKmhl
YWRfcTsgICAvKiBmaXJzdCBoZWFkIG9mIHRoaXMgdHlwZSAqLwotICAgIGNoYXIgICAgICAgICAg
ICAgICAgICAgICAgKm5hbWU7ICAgICAvKiBkZXNjcmlwdGl2ZSBzdHJpbmcgZm9yIHByaW50ICov
CisgICAgY29uc3QgY2hhciAgICAgICAgICAgICAgICAqbmFtZTsgICAgIC8qIGRlc2NyaXB0aXZl
IHN0cmluZyBmb3IgcHJpbnQgKi8KIH07CiAKIHR5cGVkZWYgdm9pZCBsb2NrX3Byb2ZpbGVfc3Vi
ZnVuYygKLSAgICBzdHJ1Y3QgbG9ja19wcm9maWxlICosIGludDMyX3QsIGludDMyX3QsIHZvaWQg
Kik7CisgICAgc3RydWN0IGxvY2tfcHJvZmlsZSAqLCBjb25zdCBjaGFyICosIGludDMyX3QsIHZv
aWQgKik7CiAKIGV4dGVybiBzdHJ1Y3QgbG9ja19wcm9maWxlICpfX2xvY2tfcHJvZmlsZV9zdGFy
dDsKIGV4dGVybiBzdHJ1Y3QgbG9ja19wcm9maWxlICpfX2xvY2tfcHJvZmlsZV9lbmQ7CiAKIHN0
YXRpYyBzX3RpbWVfdCBsb2NrX3Byb2ZpbGVfc3RhcnQ7Ci1zdGF0aWMgc3RydWN0IGxvY2tfcHJv
ZmlsZV9hbmMgbG9ja19wcm9maWxlX2FuY3NbTE9DS1BST0ZfVFlQRV9OXTsKK3N0YXRpYyBzdHJ1
Y3QgbG9ja19wcm9maWxlX2FuYyAqbG9ja19wcm9maWxlX2FuY3M7CiBzdGF0aWMgc3RydWN0IGxv
Y2tfcHJvZmlsZV9xaGVhZCBsb2NrX3Byb2ZpbGVfZ2xiX3E7CiBzdGF0aWMgc3BpbmxvY2tfdCBs
b2NrX3Byb2ZpbGVfbG9jayA9IFNQSU5fTE9DS19VTkxPQ0tFRDsKIAogc3RhdGljIHZvaWQgc3Bp
bmxvY2tfcHJvZmlsZV9pdGVyYXRlKGxvY2tfcHJvZmlsZV9zdWJmdW5jICpzdWIsIHZvaWQgKnBh
cikKIHsKLSAgICBpbnQgaTsKKyAgICBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqYW5jOwogICAg
IHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKmhxOwogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGUg
KmVxOwogCiAgICAgc3Bpbl9sb2NrKCZsb2NrX3Byb2ZpbGVfbG9jayk7Ci0gICAgZm9yICggaSA9
IDA7IGkgPCBMT0NLUFJPRl9UWVBFX047IGkrKyApCi0gICAgICAgIGZvciAoIGhxID0gbG9ja19w
cm9maWxlX2FuY3NbaV0uaGVhZF9xOyBocTsgaHEgPSBocS0+aGVhZF9xICkKKyAgICBmb3IgKCBh
bmMgPSBsb2NrX3Byb2ZpbGVfYW5jczsgYW5jOyBhbmMgPSBhbmMtPm5leHQgKQorICAgICAgICBm
b3IgKCBocSA9IGFuYy0+aGVhZF9xOyBocTsgaHEgPSBocS0+aGVhZF9xICkKICAgICAgICAgICAg
IGZvciAoIGVxID0gaHEtPmVsZW1fcTsgZXE7IGVxID0gZXEtPm5leHQgKQotICAgICAgICAgICAg
ICAgIHN1YihlcSwgaSwgaHEtPmlkeCwgcGFyKTsKKyAgICAgICAgICAgICAgICBzdWIoZXEsIGFu
Yy0+bmFtZSwgaHEtPmlkeCwgcGFyKTsKICAgICBzcGluX3VubG9jaygmbG9ja19wcm9maWxlX2xv
Y2spOwogfQogCiBzdGF0aWMgdm9pZCBzcGlubG9ja19wcm9maWxlX3ByaW50X2VsZW0oc3RydWN0
IGxvY2tfcHJvZmlsZSAqZGF0YSwKLSAgICBpbnQzMl90IHR5cGUsIGludDMyX3QgaWR4LCB2b2lk
ICpwYXIpCisgICAgY29uc3QgY2hhciAqdHlwZSwgaW50MzJfdCBpZHgsIHZvaWQgKnBhcikKIHsK
ICAgICBzdHJ1Y3Qgc3BpbmxvY2sgKmxvY2sgPSBkYXRhLT5sb2NrOwogCi0gICAgcHJpbnRrKCIl
cyAiLCBsb2NrX3Byb2ZpbGVfYW5jc1t0eXBlXS5uYW1lKTsKLSAgICBpZiAoIHR5cGUgIT0gTE9D
S1BST0ZfVFlQRV9HTE9CQUwgKQorICAgIHByaW50aygiJXMgIiwgdHlwZSk7CisgICAgaWYgKCBp
ZHggIT0gTE9DS1BST0ZfSURYX05PTkUgKQogICAgICAgICBwcmludGsoIiVkICIsIGlkeCk7CiAg
ICAgcHJpbnRrKCIlczogYWRkcj0lcCwgbG9ja3ZhbD0lMDh4LCAiLCBkYXRhLT5uYW1lLCBsb2Nr
LAogICAgICAgICAgICBsb2NrLT50aWNrZXRzLmhlYWRfdGFpbCk7CkBAIC0zOTIsNyArMzkzLDcg
QEAgdm9pZCBzcGlubG9ja19wcm9maWxlX3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KQogfQog
CiBzdGF0aWMgdm9pZCBzcGlubG9ja19wcm9maWxlX3Jlc2V0X2VsZW0oc3RydWN0IGxvY2tfcHJv
ZmlsZSAqZGF0YSwKLSAgICBpbnQzMl90IHR5cGUsIGludDMyX3QgaWR4LCB2b2lkICpwYXIpCisg
ICAgY29uc3QgY2hhciAqdHlwZSwgaW50MzJfdCBpZHgsIHZvaWQgKnBhcikKIHsKICAgICBkYXRh
LT5sb2NrX2NudCA9IDA7CiAgICAgZGF0YS0+YmxvY2tfY250ID0gMDsKQEAgLTQxNiw3ICs0MTcs
NyBAQCB0eXBlZGVmIHN0cnVjdCB7CiB9IHNwaW5sb2NrX3Byb2ZpbGVfdWNvcHlfdDsKIAogc3Rh
dGljIHZvaWQgc3BpbmxvY2tfcHJvZmlsZV91Y29weV9lbGVtKHN0cnVjdCBsb2NrX3Byb2ZpbGUg
KmRhdGEsCi0gICAgaW50MzJfdCB0eXBlLCBpbnQzMl90IGlkeCwgdm9pZCAqcGFyKQorICAgIGNv
bnN0IGNoYXIgKnR5cGUsIGludDMyX3QgaWR4LCB2b2lkICpwYXIpCiB7CiAgICAgc3BpbmxvY2tf
cHJvZmlsZV91Y29weV90ICpwID0gcGFyOwogICAgIHN0cnVjdCB4ZW5fc3lzY3RsX2xvY2twcm9m
X2RhdGEgZWxlbTsKQEAgLTQyNyw3ICs0MjgsNyBAQCBzdGF0aWMgdm9pZCBzcGlubG9ja19wcm9m
aWxlX3Vjb3B5X2VsZW0oc3RydWN0IGxvY2tfcHJvZmlsZSAqZGF0YSwKICAgICBpZiAoIHAtPnBj
LT5ucl9lbGVtIDwgcC0+cGMtPm1heF9lbGVtICkKICAgICB7CiAgICAgICAgIHNhZmVfc3RyY3B5
KGVsZW0ubmFtZSwgZGF0YS0+bmFtZSk7Ci0gICAgICAgIGVsZW0udHlwZSA9IHR5cGU7CisgICAg
ICAgIHNhZmVfc3RyY3B5KGVsZW0udHlwZSwgdHlwZSk7CiAgICAgICAgIGVsZW0uaWR4ID0gaWR4
OwogICAgICAgICBlbGVtLmxvY2tfY250ID0gZGF0YS0+bG9ja19jbnQ7CiAgICAgICAgIGVsZW0u
YmxvY2tfY250ID0gZGF0YS0+YmxvY2tfY250OwpAQCAtNDY4LDMxICs0NjksODIgQEAgaW50IHNw
aW5sb2NrX3Byb2ZpbGVfY29udHJvbChzdHJ1Y3QgeGVuX3N5c2N0bF9sb2NrcHJvZl9vcCAqcGMp
CiAgICAgcmV0dXJuIHJjOwogfQogCi12b2lkIF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0
KAotICAgIGludDMyX3QgdHlwZSwgc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCAqcWhlYWQsIGlu
dDMyX3QgaWR4LCBjaGFyICpuYW1lKQorc3RhdGljIHN0cnVjdCBsb2NrX3Byb2ZpbGVfYW5jICpm
aW5kX3Byb2ZfYW5jKGNvbnN0IGNoYXIgKm5hbWUpCiB7Ci0gICAgcWhlYWQtPmlkeCA9IGlkeDsK
KyAgICBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqYW5jOworCisgICAgZm9yICggYW5jID0gbG9j
a19wcm9maWxlX2FuY3M7IGFuYzsgYW5jID0gYW5jLT5uZXh0ICkKKyAgICAgICAgaWYgKCAhc3Ry
Y21wKGFuYy0+bmFtZSwgbmFtZSkgKQorICAgICAgICAgICAgcmV0dXJuIGFuYzsKKworICAgIHJl
dHVybiBOVUxMOworfQorCit2b2lkIF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KHN0cnVj
dCBsb2NrX3Byb2ZpbGVfcWhlYWQgKnFoZWFkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQzMl90IGlkeCwgY29uc3QgY2hhciAqbmFtZSkKK3sKKyAgICBzdHJ1Y3QgbG9j
a19wcm9maWxlX2FuYyAqYW5jLCAqYW5jX25ldzsKKwogICAgIHNwaW5fbG9jaygmbG9ja19wcm9m
aWxlX2xvY2spOwotICAgIHFoZWFkLT5oZWFkX3EgPSBsb2NrX3Byb2ZpbGVfYW5jc1t0eXBlXS5o
ZWFkX3E7Ci0gICAgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0uaGVhZF9xID0gcWhlYWQ7Ci0gICAg
bG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSA9IG5hbWU7CisKKyAgICBhbmMgPSBmaW5kX3By
b2ZfYW5jKG5hbWUpOworICAgIGlmICggIWFuYyApCisgICAgeworICAgICAgICBzcGluX3VubG9j
aygmbG9ja19wcm9maWxlX2xvY2spOworCisgICAgICAgIGFuY19uZXcgPSB4emFsbG9jKHN0cnVj
dCBsb2NrX3Byb2ZpbGVfYW5jKTsKKyAgICAgICAgaWYgKCAhYW5jX25ldyApCisgICAgICAgICAg
ICByZXR1cm47CisKKyAgICAgICAgc3Bpbl9sb2NrKCZsb2NrX3Byb2ZpbGVfbG9jayk7CisKKyAg
ICAgICAgYW5jID0gZmluZF9wcm9mX2FuYyhuYW1lKTsKKyAgICAgICAgaWYgKCBhbmMgKQorICAg
ICAgICAgICAgeGZyZWUoYW5jX25ldyk7CisgICAgICAgIGVsc2UKKyAgICAgICAgeworICAgICAg
ICAgICAgYW5jID0gYW5jX25ldzsKKyAgICAgICAgICAgIGFuYy0+bmFtZSA9IG5hbWU7CisgICAg
ICAgICAgICBhbmMtPm5leHQgPSBsb2NrX3Byb2ZpbGVfYW5jczsKKyAgICAgICAgICAgIGxvY2tf
cHJvZmlsZV9hbmNzID0gYW5jOworICAgICAgICB9CisgICAgfQorCisgICAgcWhlYWQtPmlkeCA9
IGlkeDsKKyAgICBxaGVhZC0+aGVhZF9xID0gYW5jLT5oZWFkX3E7CisgICAgYW5jLT5oZWFkX3Eg
PSBxaGVhZDsKKwogICAgIHNwaW5fdW5sb2NrKCZsb2NrX3Byb2ZpbGVfbG9jayk7CiB9CiAKLXZv
aWQgX2xvY2tfcHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdCgKLSAgICBpbnQzMl90IHR5cGUsIHN0
cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKnFoZWFkKQordm9pZCBfbG9ja19wcm9maWxlX2RlcmVn
aXN0ZXJfc3RydWN0KHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKnFoZWFkLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCiB7CisgICAgc3Ry
dWN0IGxvY2tfcHJvZmlsZV9hbmMgKmFuYzsKICAgICBzdHJ1Y3QgbG9ja19wcm9maWxlX3FoZWFk
ICoqcTsKKyAgICBzdHJ1Y3QgbG9ja19wcm9maWxlICplbGVtOwogCiAgICAgc3Bpbl9sb2NrKCZs
b2NrX3Byb2ZpbGVfbG9jayk7Ci0gICAgZm9yICggcSA9ICZsb2NrX3Byb2ZpbGVfYW5jc1t0eXBl
XS5oZWFkX3E7ICpxOyBxID0gJigqcSktPmhlYWRfcSApCisKKyAgICBhbmMgPSBmaW5kX3Byb2Zf
YW5jKG5hbWUpOworICAgIGlmICggYW5jICkKICAgICB7Ci0gICAgICAgIGlmICggKnEgPT0gcWhl
YWQgKQorICAgICAgICBmb3IgKCBxID0gJmFuYy0+aGVhZF9xOyAqcTsgcSA9ICYoKnEpLT5oZWFk
X3EgKQogICAgICAgICB7Ci0gICAgICAgICAgICAqcSA9IHFoZWFkLT5oZWFkX3E7Ci0gICAgICAg
ICAgICBicmVhazsKKyAgICAgICAgICAgIGlmICggKnEgPT0gcWhlYWQgKQorICAgICAgICAgICAg
eworICAgICAgICAgICAgICAgICpxID0gcWhlYWQtPmhlYWRfcTsKKyAgICAgICAgICAgICAgICB3
aGlsZSAoIHFoZWFkLT5lbGVtX3EgKQorICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAg
ICAgICAgZWxlbSA9IHFoZWFkLT5lbGVtX3E7CisgICAgICAgICAgICAgICAgICAgIHFoZWFkLT5l
bGVtX3EgPSBlbGVtLT5uZXh0OworICAgICAgICAgICAgICAgICAgICB4ZnJlZShlbGVtKTsKKyAg
ICAgICAgICAgICAgICB9CisgICAgICAgICAgICAgICAgYnJlYWs7CisgICAgICAgICAgICB9CiAg
ICAgICAgIH0KICAgICB9CisKICAgICBzcGluX3VubG9jaygmbG9ja19wcm9maWxlX2xvY2spOwog
fQogCkBAIC01MDcsOSArNTU5LDggQEAgc3RhdGljIGludCBfX2luaXQgbG9ja19wcm9mX2luaXQo
dm9pZCkKICAgICAgICAgKCpxKS0+bG9jay0+cHJvZmlsZSA9ICpxOwogICAgIH0KIAotICAgIF9s
b2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KAotICAgICAgICBMT0NLUFJPRl9UWVBFX0dMT0JB
TCwgJmxvY2tfcHJvZmlsZV9nbGJfcSwKLSAgICAgICAgMCwgIkdsb2JhbCBsb2NrIik7CisgICAg
X2xvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3QoJmxvY2tfcHJvZmlsZV9nbGJfcSwgTE9DS1BS
T0ZfSURYX05PTkUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIkdsb2JhbCIp
OwogCiAgICAgcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lz
Y3RsLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKaW5kZXggZTMyNDQ0MmY5Mi4uMGNi
M2M5OGE4NCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCisrKyBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaApAQCAtMzUsNyArMzUsNyBAQAogI2luY2x1ZGUgImRv
bWN0bC5oIgogI2luY2x1ZGUgInBoeXNkZXYuaCIKIAotI2RlZmluZSBYRU5fU1lTQ1RMX0lOVEVS
RkFDRV9WRVJTSU9OIDB4MDAwMDAwMTIKKyNkZWZpbmUgWEVOX1NZU0NUTF9JTlRFUkZBQ0VfVkVS
U0lPTiAweDAwMDAwMDEzCiAKIC8qCiAgKiBSZWFkIGNvbnNvbGUgY29udGVudCBmcm9tIFhlbiBi
dWZmZXIgcmluZy4KQEAgLTQ0MywxNCArNDQzLDExIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX3BhZ2Vf
b2ZmbGluZV9vcCB7CiAvKiBTdWItb3BlcmF0aW9uczogKi8KICNkZWZpbmUgWEVOX1NZU0NUTF9M
T0NLUFJPRl9yZXNldCAxICAgLyogUmVzZXQgYWxsIHByb2ZpbGUgZGF0YSB0byB6ZXJvLiAqLwog
I2RlZmluZSBYRU5fU1lTQ1RMX0xPQ0tQUk9GX3F1ZXJ5IDIgICAvKiBHZXQgbG9jayBwcm9maWxl
IGluZm9ybWF0aW9uLiAqLwotLyogUmVjb3JkLXR5cGU6ICovCi0jZGVmaW5lIExPQ0tQUk9GX1RZ
UEVfR0xPQkFMICAgICAgMCAgIC8qIGdsb2JhbCBsb2NrLCBpZHggbWVhbmluZ2xlc3MgKi8KLSNk
ZWZpbmUgTE9DS1BST0ZfVFlQRV9QRVJET00gICAgICAxICAgLyogcGVyLWRvbWFpbiBsb2NrLCBp
ZHggaXMgZG9taWQgKi8KLSNkZWZpbmUgTE9DS1BST0ZfVFlQRV9OICAgICAgICAgICAyICAgLyog
bnVtYmVyIG9mIHR5cGVzICovCiBzdHJ1Y3QgeGVuX3N5c2N0bF9sb2NrcHJvZl9kYXRhIHsKLSAg
ICBjaGFyICAgICBuYW1lWzQwXTsgICAgIC8qIGxvY2sgbmFtZSAobWF5IGluY2x1ZGUgdXAgdG8g
MiAlZCBzcGVjaWZpZXJzKSAqLwotICAgIGludDMyX3QgIHR5cGU7ICAgICAgICAgLyogTE9DS1BS
T0ZfVFlQRV8/Pz8gKi8KKyAgICBjaGFyICAgICBuYW1lWzQwXTsgICAgIC8qIGxvY2sgbmFtZSAq
LworICAgIGNoYXIgICAgIHR5cGVbMjBdOyAgICAgLyogZS5nLiAiZG9tYWluIiAqLwogICAgIGlu
dDMyX3QgIGlkeDsgICAgICAgICAgLyogaW5kZXggKGUuZy4gZG9tYWluIGlkKSAqLworI2RlZmlu
ZSBMT0NLUFJPRl9JRFhfTk9ORSAgLTEKICAgICB1aW50NjRfYWxpZ25lZF90IGxvY2tfY250OyAg
ICAgLyogIyBvZiBsb2NraW5nIHN1Y2NlZWRlZCAqLwogICAgIHVpbnQ2NF9hbGlnbmVkX3QgYmxv
Y2tfY250OyAgICAvKiAjIG9mIHdhaXQgZm9yIGxvY2sgKi8KICAgICB1aW50NjRfYWxpZ25lZF90
IGxvY2tfdGltZTsgICAgLyogbnNlY3MgbG9jayBoZWxkICovCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaCBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oCmluZGV4IDQ2
OGI5YWM5ZWYuLjQwMWNjMzQ1ZmUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9j
ay5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oCkBAIC01MywxOSArNTMsMjQgQEAg
dW5pb24gbG9ja19kZWJ1ZyB7IH07CiAKICAgICAgIHdpdGggcHRyIGJlaW5nIHRoZSBtYWluIHN0
cnVjdHVyZSBwb2ludGVyIGFuZCBsb2NrIHRoZSBzcGlubG9jayBmaWVsZAogCisgICAgICBJdCBz
aG91bGQgYmUgbm90ZWQgdGhhdCB0aGlzIHdpbGwgbmVlZCB0byBhbGxvY2F0ZSBtZW1vcnksIHNv
IGludGVycnVwdHMKKyAgICAgIG11c3QgYmUgZW5hYmxlZC4KKwogICAgIC0gZWFjaCBzdHJ1Y3R1
cmUgaGFzIHRvIGJlIGFkZGVkIHRvIHByb2ZpbGluZyB3aXRoCiAKLSAgICAgIGxvY2tfcHJvZmls
ZV9yZWdpc3Rlcl9zdHJ1Y3QodHlwZSwgcHRyLCBpZHgsIHByaW50KTsKKyAgICAgIGxvY2tfcHJv
ZmlsZV9yZWdpc3Rlcl9zdHJ1Y3QocHRyLCBpZHgsIHByaW50KTsKIAogICAgICAgd2l0aDoKLSAg
ICAgICAgdHlwZTogIHNvbWV0aGluZyBsaWtlIExPQ0tQUk9GX1RZUEVfUEVSRE9NCiAgICAgICAg
IHB0cjogICBwb2ludGVyIHRvIHRoZSBzdHJ1Y3R1cmUKICAgICAgICAgaWR4OiAgIGluZGV4IG9m
IHRoYXQgc3RydWN0dXJlLCBlLmcuIGRvbWlkCiAgICAgICAgIHByaW50OiBkZXNjcmlwdGl2ZSBz
dHJpbmcgbGlrZSAiZG9tYWluIgogCisgICAgICBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCB0aGlz
IHdpbGwgbWlnaHQgbmVlZCB0byBhbGxvY2F0ZSBtZW1vcnksIHNvCisgICAgICBpbnRlcnJ1cHRz
IG11c3QgYmUgZW5hYmxlZC4KKwogICAgIC0gcmVtb3Zpbmcgb2YgYSBzdHJ1Y3R1cmUgaXMgZG9u
ZSB2aWEKIAotICAgICAgbG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KHR5cGUsIHB0cik7
CisgICAgICBsb2NrX3Byb2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QocHRyLCBwcmludCk7CiAqLwog
CiBzdHJ1Y3Qgc3BpbmxvY2s7CkBAIC0xMTEsMTQgKzExNiwxNCBAQCBzdHJ1Y3QgbG9ja19wcm9m
aWxlX3FoZWFkIHsKICAgICAgICAgKHMpLT5wcm9maWxlX2hlYWQuZWxlbV9xID0gcHJvZjsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICB9IHdoaWxlKDApCiAKLXZv
aWQgX2xvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3QoCi0gICAgaW50MzJfdCwgc3RydWN0IGxv
Y2tfcHJvZmlsZV9xaGVhZCAqLCBpbnQzMl90LCBjaGFyICopOwotdm9pZCBfbG9ja19wcm9maWxl
X2RlcmVnaXN0ZXJfc3RydWN0KGludDMyX3QsIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKik7
Cit2b2lkIF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KHN0cnVjdCBsb2NrX3Byb2ZpbGVf
cWhlYWQgKiwgaW50MzJfdCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqKTsKK3ZvaWQgX2xvY2tfcHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdChzdHJ1Y3Qg
bG9ja19wcm9maWxlX3FoZWFkICosIGNvbnN0IGNoYXIgKik7CiAKLSNkZWZpbmUgbG9ja19wcm9m
aWxlX3JlZ2lzdGVyX3N0cnVjdCh0eXBlLCBwdHIsIGlkeCwgcHJpbnQpICAgICAgICAgICAgICAg
ICAgIFwKLSAgICBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCh0eXBlLCAmKChwdHIpLT5w
cm9maWxlX2hlYWQpLCBpZHgsIHByaW50KQotI2RlZmluZSBsb2NrX3Byb2ZpbGVfZGVyZWdpc3Rl
cl9zdHJ1Y3QodHlwZSwgcHRyKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgIF9s
b2NrX3Byb2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QodHlwZSwgJigocHRyKS0+cHJvZmlsZV9oZWFk
KSkKKyNkZWZpbmUgbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdChwdHIsIGlkeCwgcHJpbnQp
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0
cnVjdCgmKChwdHIpLT5wcm9maWxlX2hlYWQpLCBpZHgsIHByaW50KQorI2RlZmluZSBsb2NrX3By
b2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QocHRyLCBwcmludCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAorICAgIF9sb2NrX3Byb2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QoJigocHRyKS0+cHJv
ZmlsZV9oZWFkKSwgcHJpbnQpCiAKIGV4dGVybiBpbnQgc3BpbmxvY2tfcHJvZmlsZV9jb250cm9s
KHN0cnVjdCB4ZW5fc3lzY3RsX2xvY2twcm9mX29wICpwYyk7CiBleHRlcm4gdm9pZCBzcGlubG9j
a19wcm9maWxlX3ByaW50YWxsKHVuc2lnbmVkIGNoYXIga2V5KTsKQEAgLTEzMiw4ICsxMzcsOCBA
QCBzdHJ1Y3QgbG9ja19wcm9maWxlX3FoZWFkIHsgfTsKICNkZWZpbmUgREVGSU5FX1NQSU5MT0NL
KGwpIHNwaW5sb2NrX3QgbCA9IFNQSU5fTE9DS19VTkxPQ0tFRAogCiAjZGVmaW5lIHNwaW5fbG9j
a19pbml0X3Byb2YocywgbCkgc3Bpbl9sb2NrX2luaXQoJigocyktPmwpKQotI2RlZmluZSBsb2Nr
X3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KHR5cGUsIHB0ciwgaWR4LCBwcmludCkKLSNkZWZpbmUg
bG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KHR5cGUsIHB0cikKKyNkZWZpbmUgbG9ja19w
cm9maWxlX3JlZ2lzdGVyX3N0cnVjdChwdHIsIGlkeCwgcHJpbnQpCisjZGVmaW5lIGxvY2tfcHJv
ZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdChwdHIsIHByaW50KQogI2RlZmluZSBzcGlubG9ja19wcm9m
aWxlX3ByaW50YWxsKGtleSkKIAogI2VuZGlmCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
