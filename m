Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D53684ED0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:34:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMyN-0000za-Hm; Wed, 07 Aug 2019 14:31:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTKn=WD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvMyL-0000yO-Pj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:31:25 +0000
X-Inumbo-ID: 0805b33a-b920-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0805b33a-b920-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 14:31:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42685B048;
 Wed,  7 Aug 2019 14:31:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  7 Aug 2019 16:31:19 +0200
Message-Id: <20190807143119.8360-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190807143119.8360-1-jgross@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 4/4] xen: modify lock profiling interface
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
amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL2xpYnhjL3hjX21pc2MuYyAgICAgICB8ICAxICsK
IHRvb2xzL21pc2MveGVubG9ja3Byb2YuYyAgICB8IDE3ICsrLS0tLS0tLQogeGVuL2NvbW1vbi9k
b21haW4uYyAgICAgICAgIHwgIDQgKy0KIHhlbi9jb21tb24vc3BpbmxvY2suYyAgICAgICB8IDky
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogeGVuL2luY2x1
ZGUvcHVibGljL3N5c2N0bC5oIHwgMTEgKystLS0tCiB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2su
aCAgfCAyMyArKysrKystLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwg
NjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfbWlzYy5jIGIvdG9v
bHMvbGlieGMveGNfbWlzYy5jCmluZGV4IDVlNjcxNGFlMmIuLjY4YzE3MjkzYmQgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL2xpYnhjL3hjX21pc2MuYworKysgYi90b29scy9saWJ4Yy94Y19taXNjLmMKQEAg
LTUxMCw2ICs1MTAsNyBAQCBpbnQgeGNfbG9ja3Byb2ZfcXVlcnkoeGNfaW50ZXJmYWNlICp4Y2gs
CiAgICAgcmMgPSBkb19zeXNjdGwoeGNoLCAmc3lzY3RsKTsKIAogICAgICpuX2VsZW1zID0gc3lz
Y3RsLnUubG9ja3Byb2Zfb3AubnJfZWxlbTsKKyAgICAqdGltZSA9IHN5c2N0bC51LmxvY2twcm9m
X29wLnRpbWU7CiAKICAgICByZXR1cm4gcmM7CiB9CmRpZmYgLS1naXQgYS90b29scy9taXNjL3hl
bmxvY2twcm9mLmMgYi90b29scy9taXNjL3hlbmxvY2twcm9mLmMKaW5kZXggMTFmNDNhMzVlMy4u
YzZhYTNmZTg0MSAxMDA2NDQKLS0tIGEvdG9vbHMvbWlzYy94ZW5sb2NrcHJvZi5jCisrKyBiL3Rv
b2xzL21pc2MveGVubG9ja3Byb2YuYwpAQCAtODgsMTkgKzg4LDEwIEBAIGludCBtYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pCiAgICAgc2IgPSAwOwogICAgIGZvciAoIGogPSAwOyBqIDwgaTsg
aisrICkKICAgICB7Ci0gICAgICAgIHN3aXRjaCAoIGRhdGFbal0udHlwZSApCi0gICAgICAgIHsK
LSAgICAgICAgY2FzZSBMT0NLUFJPRl9UWVBFX0dMT0JBTDoKLSAgICAgICAgICAgIHNwcmludGYo
bmFtZSwgImdsb2JhbCBsb2NrICVzIiwgZGF0YVtqXS5uYW1lKTsKLSAgICAgICAgICAgIGJyZWFr
OwotICAgICAgICBjYXNlIExPQ0tQUk9GX1RZUEVfUEVSRE9NOgotICAgICAgICAgICAgc3ByaW50
ZihuYW1lLCAiZG9tYWluICVkIGxvY2sgJXMiLCBkYXRhW2pdLmlkeCwgZGF0YVtqXS5uYW1lKTsK
LSAgICAgICAgICAgIGJyZWFrOwotICAgICAgICBkZWZhdWx0OgotICAgICAgICAgICAgc3ByaW50
ZihuYW1lLCAidW5rbm93biB0eXBlKCVkKSAlZCBsb2NrICVzIiwgZGF0YVtqXS50eXBlLAotICAg
ICAgICAgICAgICAgICAgICBkYXRhW2pdLmlkeCwgZGF0YVtqXS5uYW1lKTsKLSAgICAgICAgICAg
IGJyZWFrOwotICAgICAgICB9CisgICAgICAgIGlmICggZGF0YVtqXS5pZHggPT0gTE9DS1BST0Zf
SURYX05PTkUgKQorICAgICAgICAgICAgc3ByaW50ZihuYW1lLCAiJXMgJXMiLCBkYXRhW2pdLnR5
cGUsIGRhdGFbal0ubmFtZSk7CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIHNwcmludGYobmFt
ZSwgIiVzICVkICVzIiwgZGF0YVtqXS50eXBlLCBkYXRhW2pdLmlkeCwgZGF0YVtqXS5uYW1lKTsK
ICAgICAgICAgbCA9IChkb3VibGUpKGRhdGFbal0ubG9ja190aW1lKSAvIDFFKzA5OwogICAgICAg
ICBiID0gKGRvdWJsZSkoZGF0YVtqXS5ibG9ja190aW1lKSAvIDFFKzA5OwogICAgICAgICBzbCAr
PSBsOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWlu
LmMKaW5kZXggNzQ0YjU3MjE5NS4uMTA1MWJmMzhhMyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9k
b21haW4uYworKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCkBAIC0yOTAsNyArMjkwLDcgQEAgc3Rh
dGljIHZvaWQgX2RvbWFpbl9kZXN0cm95KHN0cnVjdCBkb21haW4gKmQpCiAKICAgICB4c21fZnJl
ZV9zZWN1cml0eV9kb21haW4oZCk7CiAKLSAgICBsb2NrX3Byb2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1
Y3QoTE9DS1BST0ZfVFlQRV9QRVJET00sIGQpOworICAgIGxvY2tfcHJvZmlsZV9kZXJlZ2lzdGVy
X3N0cnVjdChkLCAiRG9tYWluIik7CiAKICAgICBmcmVlX2RvbWFpbl9zdHJ1Y3QoZCk7CiB9CkBA
IC0zNjksNyArMzY5LDcgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShkb21pZF90IGRv
bWlkLAogICAgICAgICBkLT5tYXhfdmNwdXMgPSBjb25maWctPm1heF92Y3B1czsKICAgICB9CiAK
LSAgICBsb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KExPQ0tQUk9GX1RZUEVfUEVSRE9NLCBk
LCBkb21pZCwgIkRvbWFpbiIpOworICAgIGxvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3QoZCwg
ZG9taWQsICJEb21haW4iKTsKIAogICAgIGlmICggKGVyciA9IHhzbV9hbGxvY19zZWN1cml0eV9k
b21haW4oZCkpICE9IDAgKQogICAgICAgICBnb3RvIGZhaWw7CmRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggNTczMDA3NjU4MS4u
MjU4MmI0ZTM0MCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9j
b21tb24vc3BpbmxvY2suYwpAQCAtMzMwLDQyICszMzAsNDMgQEAgdm9pZCBfc3Bpbl91bmxvY2tf
cmVjdXJzaXZlKHNwaW5sb2NrX3QgKmxvY2spCiAjaWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQog
CiBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyB7CisgICAgc3RydWN0IGxvY2tfcHJvZmlsZV9hbmMg
ICAqbmV4dDsgICAgIC8qIG5leHQgdHlwZSAqLwogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhl
YWQgKmhlYWRfcTsgICAvKiBmaXJzdCBoZWFkIG9mIHRoaXMgdHlwZSAqLwotICAgIGNoYXIgICAg
ICAgICAgICAgICAgICAgICAgKm5hbWU7ICAgICAvKiBkZXNjcmlwdGl2ZSBzdHJpbmcgZm9yIHBy
aW50ICovCisgICAgY29uc3QgY2hhciAgICAgICAgICAgICAgICAqbmFtZTsgICAgIC8qIGRlc2Ny
aXB0aXZlIHN0cmluZyBmb3IgcHJpbnQgKi8KIH07CiAKIHR5cGVkZWYgdm9pZCBsb2NrX3Byb2Zp
bGVfc3ViZnVuYygKLSAgICBzdHJ1Y3QgbG9ja19wcm9maWxlICosIGludDMyX3QsIGludDMyX3Qs
IHZvaWQgKik7CisgICAgc3RydWN0IGxvY2tfcHJvZmlsZSAqLCBjb25zdCBjaGFyICosIGludDMy
X3QsIHZvaWQgKik7CiAKIGV4dGVybiBzdHJ1Y3QgbG9ja19wcm9maWxlICpfX2xvY2tfcHJvZmls
ZV9zdGFydDsKIGV4dGVybiBzdHJ1Y3QgbG9ja19wcm9maWxlICpfX2xvY2tfcHJvZmlsZV9lbmQ7
CiAKIHN0YXRpYyBzX3RpbWVfdCBsb2NrX3Byb2ZpbGVfc3RhcnQ7Ci1zdGF0aWMgc3RydWN0IGxv
Y2tfcHJvZmlsZV9hbmMgbG9ja19wcm9maWxlX2FuY3NbTE9DS1BST0ZfVFlQRV9OXTsKK3N0YXRp
YyBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqbG9ja19wcm9maWxlX2FuY3M7CiBzdGF0aWMgc3Ry
dWN0IGxvY2tfcHJvZmlsZV9xaGVhZCBsb2NrX3Byb2ZpbGVfZ2xiX3E7CiBzdGF0aWMgc3Bpbmxv
Y2tfdCBsb2NrX3Byb2ZpbGVfbG9jayA9IFNQSU5fTE9DS19VTkxPQ0tFRDsKIAogc3RhdGljIHZv
aWQgc3BpbmxvY2tfcHJvZmlsZV9pdGVyYXRlKGxvY2tfcHJvZmlsZV9zdWJmdW5jICpzdWIsIHZv
aWQgKnBhcikKIHsKLSAgICBpbnQgaTsKKyAgICBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqYW5j
OwogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKmhxOwogICAgIHN0cnVjdCBsb2NrX3By
b2ZpbGUgKmVxOwogCiAgICAgc3Bpbl9sb2NrKCZsb2NrX3Byb2ZpbGVfbG9jayk7Ci0gICAgZm9y
ICggaSA9IDA7IGkgPCBMT0NLUFJPRl9UWVBFX047IGkrKyApCi0gICAgICAgIGZvciAoIGhxID0g
bG9ja19wcm9maWxlX2FuY3NbaV0uaGVhZF9xOyBocTsgaHEgPSBocS0+aGVhZF9xICkKKyAgICBm
b3IgKCBhbmMgPSBsb2NrX3Byb2ZpbGVfYW5jczsgYW5jOyBhbmMgPSBhbmMtPm5leHQgKQorICAg
ICAgICBmb3IgKCBocSA9IGFuYy0+aGVhZF9xOyBocTsgaHEgPSBocS0+aGVhZF9xICkKICAgICAg
ICAgICAgIGZvciAoIGVxID0gaHEtPmVsZW1fcTsgZXE7IGVxID0gZXEtPm5leHQgKQotICAgICAg
ICAgICAgICAgIHN1YihlcSwgaSwgaHEtPmlkeCwgcGFyKTsKKyAgICAgICAgICAgICAgICBzdWIo
ZXEsIGFuYy0+bmFtZSwgaHEtPmlkeCwgcGFyKTsKICAgICBzcGluX3VubG9jaygmbG9ja19wcm9m
aWxlX2xvY2spOwogfQogCiBzdGF0aWMgdm9pZCBzcGlubG9ja19wcm9maWxlX3ByaW50X2VsZW0o
c3RydWN0IGxvY2tfcHJvZmlsZSAqZGF0YSwKLSAgICBpbnQzMl90IHR5cGUsIGludDMyX3QgaWR4
LCB2b2lkICpwYXIpCisgICAgY29uc3QgY2hhciAqdHlwZSwgaW50MzJfdCBpZHgsIHZvaWQgKnBh
cikKIHsKICAgICBzdHJ1Y3Qgc3BpbmxvY2sgKmxvY2sgPSBkYXRhLT5sb2NrOwogCi0gICAgcHJp
bnRrKCIlcyAiLCBsb2NrX3Byb2ZpbGVfYW5jc1t0eXBlXS5uYW1lKTsKLSAgICBpZiAoIHR5cGUg
IT0gTE9DS1BST0ZfVFlQRV9HTE9CQUwgKQorICAgIHByaW50aygiJXMgIiwgdHlwZSk7CisgICAg
aWYgKCBpZHggIT0gTE9DS1BST0ZfSURYX05PTkUgKQogICAgICAgICBwcmludGsoIiVkICIsIGlk
eCk7CiAgICAgcHJpbnRrKCIlczogYWRkcj0lcCwgbG9ja3ZhbD0lMDR4LCBjcHU9JWRcbiIsIGRh
dGEtPm5hbWUsIGxvY2ssCiAgICAgICAgICAgIGxvY2stPnRpY2tldHMuaGVhZF90YWlsLCBsb2Nr
LT5kZWJ1Zy5jcHUpOwpAQCAtMzg3LDcgKzM4OCw3IEBAIHZvaWQgc3BpbmxvY2tfcHJvZmlsZV9w
cmludGFsbCh1bnNpZ25lZCBjaGFyIGtleSkKIH0KIAogc3RhdGljIHZvaWQgc3BpbmxvY2tfcHJv
ZmlsZV9yZXNldF9lbGVtKHN0cnVjdCBsb2NrX3Byb2ZpbGUgKmRhdGEsCi0gICAgaW50MzJfdCB0
eXBlLCBpbnQzMl90IGlkeCwgdm9pZCAqcGFyKQorICAgIGNvbnN0IGNoYXIgKnR5cGUsIGludDMy
X3QgaWR4LCB2b2lkICpwYXIpCiB7CiAgICAgZGF0YS0+bG9ja19jbnQgPSAwOwogICAgIGRhdGEt
PmJsb2NrX2NudCA9IDA7CkBAIC00MTEsNyArNDEyLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogfSBz
cGlubG9ja19wcm9maWxlX3Vjb3B5X3Q7CiAKIHN0YXRpYyB2b2lkIHNwaW5sb2NrX3Byb2ZpbGVf
dWNvcHlfZWxlbShzdHJ1Y3QgbG9ja19wcm9maWxlICpkYXRhLAotICAgIGludDMyX3QgdHlwZSwg
aW50MzJfdCBpZHgsIHZvaWQgKnBhcikKKyAgICBjb25zdCBjaGFyICp0eXBlLCBpbnQzMl90IGlk
eCwgdm9pZCAqcGFyKQogewogICAgIHNwaW5sb2NrX3Byb2ZpbGVfdWNvcHlfdCAqcCA9IHBhcjsK
ICAgICBzdHJ1Y3QgeGVuX3N5c2N0bF9sb2NrcHJvZl9kYXRhIGVsZW07CkBAIC00MjIsNyArNDIz
LDcgQEAgc3RhdGljIHZvaWQgc3BpbmxvY2tfcHJvZmlsZV91Y29weV9lbGVtKHN0cnVjdCBsb2Nr
X3Byb2ZpbGUgKmRhdGEsCiAgICAgaWYgKCBwLT5wYy0+bnJfZWxlbSA8IHAtPnBjLT5tYXhfZWxl
bSApCiAgICAgewogICAgICAgICBzYWZlX3N0cmNweShlbGVtLm5hbWUsIGRhdGEtPm5hbWUpOwot
ICAgICAgICBlbGVtLnR5cGUgPSB0eXBlOworICAgICAgICBzYWZlX3N0cmNweShlbGVtLnR5cGUs
IHR5cGUpOwogICAgICAgICBlbGVtLmlkeCA9IGlkeDsKICAgICAgICAgZWxlbS5sb2NrX2NudCA9
IGRhdGEtPmxvY2tfY250OwogICAgICAgICBlbGVtLmJsb2NrX2NudCA9IGRhdGEtPmJsb2NrX2Nu
dDsKQEAgLTQ2MywzMSArNDY0LDY3IEBAIGludCBzcGlubG9ja19wcm9maWxlX2NvbnRyb2woc3Ry
dWN0IHhlbl9zeXNjdGxfbG9ja3Byb2Zfb3AgKnBjKQogICAgIHJldHVybiByYzsKIH0KIAotdm9p
ZCBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgKLSAgICBpbnQzMl90IHR5cGUsIHN0cnVj
dCBsb2NrX3Byb2ZpbGVfcWhlYWQgKnFoZWFkLCBpbnQzMl90IGlkeCwgY2hhciAqbmFtZSkKK3N0
YXRpYyBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqZmluZF9wcm9mX2FuYyhjb25zdCBjaGFyICpu
YW1lKQogewotICAgIHFoZWFkLT5pZHggPSBpZHg7CisgICAgc3RydWN0IGxvY2tfcHJvZmlsZV9h
bmMgKmFuYzsKKworICAgIGZvciAoIGFuYyA9IGxvY2tfcHJvZmlsZV9hbmNzOyBhbmM7IGFuYyA9
IGFuYy0+bmV4dCApCisgICAgICAgIGlmICggIXN0cmNtcChhbmMtPm5hbWUsIG5hbWUpICkKKyAg
ICAgICAgICAgIHJldHVybiBhbmM7CisgICAgcmV0dXJuIE5VTEw7Cit9CisKK3ZvaWQgX2xvY2tf
cHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3Qoc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCAqcWhlYWQs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludDMyX3QgaWR4LCBjb25zdCBj
aGFyICpuYW1lKQoreworICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVfYW5jICphbmM7CisKICAgICBz
cGluX2xvY2soJmxvY2tfcHJvZmlsZV9sb2NrKTsKLSAgICBxaGVhZC0+aGVhZF9xID0gbG9ja19w
cm9maWxlX2FuY3NbdHlwZV0uaGVhZF9xOwotICAgIGxvY2tfcHJvZmlsZV9hbmNzW3R5cGVdLmhl
YWRfcSA9IHFoZWFkOwotICAgIGxvY2tfcHJvZmlsZV9hbmNzW3R5cGVdLm5hbWUgPSBuYW1lOwor
CisgICAgYW5jID0gZmluZF9wcm9mX2FuYyhuYW1lKTsKKyAgICBpZiAoICFhbmMgKQorICAgIHsK
KyAgICAgICAgYW5jID0geHphbGxvYyhzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyk7CisgICAgICAg
IGFuYy0+bmFtZSA9IG5hbWU7CisgICAgICAgIGFuYy0+bmV4dCA9IGxvY2tfcHJvZmlsZV9hbmNz
OworICAgICAgICBsb2NrX3Byb2ZpbGVfYW5jcyA9IGFuYzsKKyAgICB9CisKKyAgICBxaGVhZC0+
aWR4ID0gaWR4OworICAgIHFoZWFkLT5oZWFkX3EgPSBhbmMtPmhlYWRfcTsKKyAgICBhbmMtPmhl
YWRfcSA9IHFoZWFkOworCiAgICAgc3Bpbl91bmxvY2soJmxvY2tfcHJvZmlsZV9sb2NrKTsKIH0K
IAotdm9pZCBfbG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KAotICAgIGludDMyX3QgdHlw
ZSwgc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCAqcWhlYWQpCit2b2lkIF9sb2NrX3Byb2ZpbGVf
ZGVyZWdpc3Rlcl9zdHJ1Y3Qoc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCAqcWhlYWQsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSkKIHsKKyAg
ICBzdHJ1Y3QgbG9ja19wcm9maWxlX2FuYyAqYW5jOwogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVf
cWhlYWQgKipxOworICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGUgKmVsZW07CiAKICAgICBzcGluX2xv
Y2soJmxvY2tfcHJvZmlsZV9sb2NrKTsKLSAgICBmb3IgKCBxID0gJmxvY2tfcHJvZmlsZV9hbmNz
W3R5cGVdLmhlYWRfcTsgKnE7IHEgPSAmKCpxKS0+aGVhZF9xICkKKworICAgIGFuYyA9IGZpbmRf
cHJvZl9hbmMobmFtZSk7CisgICAgaWYgKCBhbmMgKQogICAgIHsKLSAgICAgICAgaWYgKCAqcSA9
PSBxaGVhZCApCisgICAgICAgIGZvciAoIHEgPSAmYW5jLT5oZWFkX3E7ICpxOyBxID0gJigqcSkt
PmhlYWRfcSApCiAgICAgICAgIHsKLSAgICAgICAgICAgICpxID0gcWhlYWQtPmhlYWRfcTsKLSAg
ICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgaWYgKCAqcSA9PSBxaGVhZCApCisgICAgICAg
ICAgICB7CisgICAgICAgICAgICAgICAgKnEgPSBxaGVhZC0+aGVhZF9xOworICAgICAgICAgICAg
ICAgIHdoaWxlICggcWhlYWQtPmVsZW1fcSApCisgICAgICAgICAgICAgICAgeworICAgICAgICAg
ICAgICAgICAgICBlbGVtID0gcWhlYWQtPmVsZW1fcTsKKyAgICAgICAgICAgICAgICAgICAgcWhl
YWQtPmVsZW1fcSA9IGVsZW0tPm5leHQ7CisgICAgICAgICAgICAgICAgICAgIHhmcmVlKGVsZW0p
OworICAgICAgICAgICAgICAgIH0KKyAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAg
IH0KICAgICAgICAgfQogICAgIH0KKwogICAgIHNwaW5fdW5sb2NrKCZsb2NrX3Byb2ZpbGVfbG9j
ayk7CiB9CiAKQEAgLTUwMyw5ICs1NDAsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBsb2NrX3Byb2Zf
aW5pdCh2b2lkKQogICAgICAgICAoKnEpLT5sb2NrLT5wcm9maWxlID0gKnE7CiAgICAgfQogCi0g
ICAgX2xvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3QoCi0gICAgICAgIExPQ0tQUk9GX1RZUEVf
R0xPQkFMLCAmbG9ja19wcm9maWxlX2dsYl9xLAotICAgICAgICAwLCAiR2xvYmFsIGxvY2siKTsK
KyAgICBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgmbG9ja19wcm9maWxlX2dsYl9xLCBM
T0NLUFJPRl9JRFhfTk9ORSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiR2xv
YmFsIik7CiAKICAgICByZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAppbmRleCA5MWM0OGRjYWUw
Li5mYWZjZTY0ZjAyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKKysr
IGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCkBAIC0zNSw3ICszNSw3IEBACiAjaW5jbHVk
ZSAiZG9tY3RsLmgiCiAjaW5jbHVkZSAicGh5c2Rldi5oIgogCi0jZGVmaW5lIFhFTl9TWVNDVExf
SU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAxMgorI2RlZmluZSBYRU5fU1lTQ1RMX0lOVEVSRkFD
RV9WRVJTSU9OIDB4MDAwMDAwMTMKIAogLyoKICAqIFJlYWQgY29uc29sZSBjb250ZW50IGZyb20g
WGVuIGJ1ZmZlciByaW5nLgpAQCAtNDMzLDE0ICs0MzMsMTEgQEAgc3RydWN0IHhlbl9zeXNjdGxf
cGFnZV9vZmZsaW5lX29wIHsKIC8qIFN1Yi1vcGVyYXRpb25zOiAqLwogI2RlZmluZSBYRU5fU1lT
Q1RMX0xPQ0tQUk9GX3Jlc2V0IDEgICAvKiBSZXNldCBhbGwgcHJvZmlsZSBkYXRhIHRvIHplcm8u
ICovCiAjZGVmaW5lIFhFTl9TWVNDVExfTE9DS1BST0ZfcXVlcnkgMiAgIC8qIEdldCBsb2NrIHBy
b2ZpbGUgaW5mb3JtYXRpb24uICovCi0vKiBSZWNvcmQtdHlwZTogKi8KLSNkZWZpbmUgTE9DS1BS
T0ZfVFlQRV9HTE9CQUwgICAgICAwICAgLyogZ2xvYmFsIGxvY2ssIGlkeCBtZWFuaW5nbGVzcyAq
LwotI2RlZmluZSBMT0NLUFJPRl9UWVBFX1BFUkRPTSAgICAgIDEgICAvKiBwZXItZG9tYWluIGxv
Y2ssIGlkeCBpcyBkb21pZCAqLwotI2RlZmluZSBMT0NLUFJPRl9UWVBFX04gICAgICAgICAgIDIg
ICAvKiBudW1iZXIgb2YgdHlwZXMgKi8KIHN0cnVjdCB4ZW5fc3lzY3RsX2xvY2twcm9mX2RhdGEg
ewotICAgIGNoYXIgICAgIG5hbWVbNDBdOyAgICAgLyogbG9jayBuYW1lIChtYXkgaW5jbHVkZSB1
cCB0byAyICVkIHNwZWNpZmllcnMpICovCi0gICAgaW50MzJfdCAgdHlwZTsgICAgICAgICAvKiBM
T0NLUFJPRl9UWVBFXz8/PyAqLworICAgIGNoYXIgICAgIG5hbWVbNDBdOyAgICAgLyogbG9jayBu
YW1lICovCisgICAgY2hhciAgICAgdHlwZVsyMF07ICAgICAvKiBlLmcuICJkb21haW4iICovCiAg
ICAgaW50MzJfdCAgaWR4OyAgICAgICAgICAvKiBpbmRleCAoZS5nLiBkb21haW4gaWQpICovCisj
ZGVmaW5lIExPQ0tQUk9GX0lEWF9OT05FICAtMQogICAgIHVpbnQ2NF9hbGlnbmVkX3QgbG9ja19j
bnQ7ICAgICAvKiAjIG9mIGxvY2tpbmcgc3VjY2VlZGVkICovCiAgICAgdWludDY0X2FsaWduZWRf
dCBibG9ja19jbnQ7ICAgIC8qICMgb2Ygd2FpdCBmb3IgbG9jayAqLwogICAgIHVpbnQ2NF9hbGln
bmVkX3QgbG9ja190aW1lOyAgICAvKiBuc2VjcyBsb2NrIGhlbGQgKi8KZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9zcGlubG9jay5oIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgKaW5k
ZXggMjY4OTE0NDVmZS4uZmU1NjBmNWY1YyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3Nw
aW5sb2NrLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmgKQEAgLTUxLDE3ICs1MSwx
NiBAQCB1bmlvbiBsb2NrX2RlYnVnIHsgfTsKIAogICAgIC0gZWFjaCBzdHJ1Y3R1cmUgaGFzIHRv
IGJlIGFkZGVkIHRvIHByb2ZpbGluZyB3aXRoCiAKLSAgICAgIGxvY2tfcHJvZmlsZV9yZWdpc3Rl
cl9zdHJ1Y3QodHlwZSwgcHRyLCBpZHgsIHByaW50KTsKKyAgICAgIGxvY2tfcHJvZmlsZV9yZWdp
c3Rlcl9zdHJ1Y3QocHRyLCBpZHgsIHByaW50KTsKIAogICAgICAgd2l0aDoKLSAgICAgICAgdHlw
ZTogIHNvbWV0aGluZyBsaWtlIExPQ0tQUk9GX1RZUEVfUEVSRE9NCiAgICAgICAgIHB0cjogICBw
b2ludGVyIHRvIHRoZSBzdHJ1Y3R1cmUKICAgICAgICAgaWR4OiAgIGluZGV4IG9mIHRoYXQgc3Ry
dWN0dXJlLCBlLmcuIGRvbWlkCiAgICAgICAgIHByaW50OiBkZXNjcmlwdGl2ZSBzdHJpbmcgbGlr
ZSAiZG9tYWluIgogCiAgICAgLSByZW1vdmluZyBvZiBhIHN0cnVjdHVyZSBpcyBkb25lIHZpYQog
Ci0gICAgICBsb2NrX3Byb2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QodHlwZSwgcHRyKTsKKyAgICAg
IGxvY2tfcHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdChwdHIsIHByaW50KTsKICovCiAKIHN0cnVj
dCBzcGlubG9jazsKQEAgLTEwNywxNCArMTA2LDE0IEBAIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhl
YWQgewogICAgICAgICAocyktPnByb2ZpbGVfaGVhZC5lbGVtX3EgPSBwcm9mOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIH0gd2hpbGUoMCkKIAotdm9pZCBfbG9j
a19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgKLSAgICBpbnQzMl90LCBzdHJ1Y3QgbG9ja19wcm9m
aWxlX3FoZWFkICosIGludDMyX3QsIGNoYXIgKik7Ci12b2lkIF9sb2NrX3Byb2ZpbGVfZGVyZWdp
c3Rlcl9zdHJ1Y3QoaW50MzJfdCwgc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCAqKTsKK3ZvaWQg
X2xvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3Qoc3RydWN0IGxvY2tfcHJvZmlsZV9xaGVhZCAq
LCBpbnQzMl90LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFy
ICopOwordm9pZCBfbG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KHN0cnVjdCBsb2NrX3By
b2ZpbGVfcWhlYWQgKiwgY29uc3QgY2hhciAqKTsKIAotI2RlZmluZSBsb2NrX3Byb2ZpbGVfcmVn
aXN0ZXJfc3RydWN0KHR5cGUsIHB0ciwgaWR4LCBwcmludCkgICAgICAgICAgICAgICAgICAgXAot
ICAgIF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KHR5cGUsICYoKHB0ciktPnByb2ZpbGVf
aGVhZCksIGlkeCwgcHJpbnQpCi0jZGVmaW5lIGxvY2tfcHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVj
dCh0eXBlLCBwdHIpICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgX2xvY2tfcHJv
ZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdCh0eXBlLCAmKChwdHIpLT5wcm9maWxlX2hlYWQpKQorI2Rl
ZmluZSBsb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KHB0ciwgaWR4LCBwcmludCkgICAgICAg
ICAgICAgICAgICAgICAgICAgXAorICAgIF9sb2NrX3Byb2ZpbGVfcmVnaXN0ZXJfc3RydWN0KCYo
KHB0ciktPnByb2ZpbGVfaGVhZCksIGlkeCwgcHJpbnQpCisjZGVmaW5lIGxvY2tfcHJvZmlsZV9k
ZXJlZ2lzdGVyX3N0cnVjdChwdHIsIHByaW50KSAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CisgICAgX2xvY2tfcHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdCgmKChwdHIpLT5wcm9maWxlX2hl
YWQpLCBwcmludCkKIAogZXh0ZXJuIGludCBzcGlubG9ja19wcm9maWxlX2NvbnRyb2woc3RydWN0
IHhlbl9zeXNjdGxfbG9ja3Byb2Zfb3AgKnBjKTsKIGV4dGVybiB2b2lkIHNwaW5sb2NrX3Byb2Zp
bGVfcHJpbnRhbGwodW5zaWduZWQgY2hhciBrZXkpOwpAQCAtMTI4LDggKzEyNyw4IEBAIHN0cnVj
dCBsb2NrX3Byb2ZpbGVfcWhlYWQgeyB9OwogI2RlZmluZSBERUZJTkVfU1BJTkxPQ0sobCkgc3Bp
bmxvY2tfdCBsID0gU1BJTl9MT0NLX1VOTE9DS0VECiAKICNkZWZpbmUgc3Bpbl9sb2NrX2luaXRf
cHJvZihzLCBsKSBzcGluX2xvY2tfaW5pdCgmKChzKS0+bCkpCi0jZGVmaW5lIGxvY2tfcHJvZmls
ZV9yZWdpc3Rlcl9zdHJ1Y3QodHlwZSwgcHRyLCBpZHgsIHByaW50KQotI2RlZmluZSBsb2NrX3By
b2ZpbGVfZGVyZWdpc3Rlcl9zdHJ1Y3QodHlwZSwgcHRyKQorI2RlZmluZSBsb2NrX3Byb2ZpbGVf
cmVnaXN0ZXJfc3RydWN0KHB0ciwgaWR4LCBwcmludCkKKyNkZWZpbmUgbG9ja19wcm9maWxlX2Rl
cmVnaXN0ZXJfc3RydWN0KHB0ciwgcHJpbnQpCiAjZGVmaW5lIHNwaW5sb2NrX3Byb2ZpbGVfcHJp
bnRhbGwoa2V5KQogCiAjZW5kaWYKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
