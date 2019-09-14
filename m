Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DA7B2A91
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 10:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i93nt-0007cs-Sq; Sat, 14 Sep 2019 08:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i93ns-0007cD-Uf
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 08:53:13 +0000
X-Inumbo-ID: 0ef90c34-d6cd-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ef90c34-d6cd-11e9-978d-bc764e2007e4;
 Sat, 14 Sep 2019 08:53:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1491EB60E;
 Sat, 14 Sep 2019 08:53:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 10:52:24 +0200
Message-Id: <20190914085251.18816-21-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 20/47] xen: let vcpu_create() select processor
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG9kYXkgdGhlcmUgYXJlIHR3byBkaXN0aW5jdCBzY2VuYXJpb3MgZm9yIHZjcHVfY3JlYXRlKCk6
IGVpdGhlciBmb3IKY3JlYXRpb24gb2YgaWRsZS1kb21haW4gdmNwdXMgKHZjcHVpZCA9PSBwcm9j
ZXNzb3IpIG9yIGZvciBjcmVhdGlvbiBvZgoibm9ybWFsIiBkb21haW4gdmNwdXMgKGluY2x1ZGlu
ZyBkb20wKSwgd2hlcmUgdGhlIGNhbGxlciBzZWxlY3RzIHRoZQppbml0aWFsIHByb2Nlc3NvciBv
biBhIHJvdW5kLXJvYmluIHNjaGVtZSBvZiB0aGUgYWxsb3dlZCBwcm9jZXNzb3JzCihhbGxvd2Vk
IGJlaW5nIGJhc2VkIG9uIGNwdXBvb2wgYW5kIGFmZmluaXRpZXMpLgoKSW5zdGVhZCBvZiBwYXNz
aW5nIHRoZSBpbml0aWFsIHByb2Nlc3NvciB0byB2Y3B1X2NyZWF0ZSgpIGFuZCBwYXNzaW5nCm9u
IHRvIHNjaGVkX2luaXRfdmNwdSgpIGxldCBzY2hlZF9pbml0X3ZjcHUoKSBkbyB0aGUgcHJvY2Vz
c29yCnNlbGVjdGlvbi4gRm9yIHN1cHBvcnRpbmcgZG9tMCB2Y3B1IGNyZWF0aW9uIHVzZSB0aGUg
bm9kZV9hZmZpbml0eSBvZgp0aGUgZG9tYWluIGFzIGEgYmFzZSBmb3Igc2VsZWN0aW5nIHRoZSBw
cm9jZXNzb3JzLiBVc2VyIGRvbWFpbnMgd2lsbApoYXZlIGluaXRpYWxseSBhbGwgbm9kZXMgc2V0
LCBzbyB0aGlzIGlzIG5vIGRpZmZlcmVudCBiZWhhdmlvciBjb21wYXJlZAp0byB0b2RheS4gSW4g
dGhlb3J5IHRoaXMgaXMgbm90IGd1YXJhbnRlZWQgYXMgdmNwdXMgYXJlIGNyZWF0ZWQgb25seQp3
aXRoIFhFTl9ET01DVExfbWF4X3ZjcHVzIGJlaW5nIGNhbGxlZCwgYnV0IHRoaXMgY2FsbCBpcyBn
b2luZyB0byBiZQpyZW1vdmVkIGluIGZ1dHVyZSBhbmQgdGhlIHRvb2xzdGFjayBkb2Vzbid0IGNh
bGwKWEVOX0RPTUNUTF9zZXRub2RlYWZmaW5pdHkgYmVmb3JlIGNhbGxpbmcgWEVOX0RPTUNUTF9t
YXhfdmNwdXMuCgpUbyBiZSBhYmxlIHRvIHVzZSBjb25zdCBzdHJ1Y3QgZG9tYWluICogbWFrZSBj
cHVwb29sX2RvbWFpbl9jcHVtYXNrKCkKdGFrZSBhIGNvbnN0IGRvbWFpbiBwb2ludGVyLCB0b28u
CgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpBY2tlZC1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KLS0tClJGQyBWMjoKLSBhZGQgQVNTRVJU
KCksIG1vZGlmeSBlcnJvciBtZXNzYWdlIChBbmRyZXcgQ29vcGVyKQpWMToKLSBjb25zdGlmeSBw
b2ludGVycywgYXZvaWQgY3B1bWFzayBvbiBzdGFjayAoSmFuIEJldWxpY2gpClYzOgotIHN0eWxl
IGNvcnJlY3Rpb24gKEphbiBCZXVsaWNoKQotLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQu
YyAgICAgIHwgMTMgKysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAg
ICB8IDEwICsrKy0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgICAgfCAgOSAr
Ky0tLS0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICAgfCAxMCArKy0tLS0tLS0K
IHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgICAgICAgIHwgIDUgKystLS0KIHhlbi9jb21tb24v
ZG9tY3RsLmMgICAgICAgICAgICAgIHwgMTAgKystLS0tLS0tCiB4ZW4vY29tbW9uL3NjaGVkdWxl
LmMgICAgICAgICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tMF9idWlsZC5oIHwgIDMgKy0tCiB4ZW4vaW5jbHVk
ZS94ZW4vZG9tYWluLmggICAgICAgICB8ICAzICstLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLWlm
LmggICAgICAgfCAgMiArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgfCAgMiAr
LQogMTEgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jCmluZGV4IGEwZmVlMWVmMTMuLmY2NTc1ZjkxOGQgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKQEAgLTgwLDcgKzgwLDcgQEAgdW5zaWduZWQgaW50IF9faW5pdCBkb20wX21heF92Y3B1cyh2
b2lkKQogCiBzdHJ1Y3QgdmNwdSAqX19pbml0IGFsbG9jX2RvbTBfdmNwdTAoc3RydWN0IGRvbWFp
biAqZG9tMCkKIHsKLSAgICByZXR1cm4gdmNwdV9jcmVhdGUoZG9tMCwgMCwgMCk7CisgICAgcmV0
dXJuIHZjcHVfY3JlYXRlKGRvbTAsIDApOwogfQogCiBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5p
dCBnZXRfYWxsb2NhdGlvbl9zaXplKHBhZGRyX3Qgc2l6ZSkKQEAgLTE5MjUsNyArMTkyNSw3IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBmaW5kX2dudHRhYl9yZWdpb24oc3RydWN0IGRvbWFpbiAqZCwK
IAogc3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQogewotICAgIGludCBpLCBjcHU7CisgICAgaW50IGk7
CiAgICAgc3RydWN0IHZjcHUgKnYgPSBkLT52Y3B1WzBdOwogICAgIHN0cnVjdCBjcHVfdXNlcl9y
ZWdzICpyZWdzID0gJnYtPmFyY2guY3B1X2luZm8tPmd1ZXN0X2NwdV91c2VyX3JlZ3M7CiAKQEAg
LTE5ODgsMTIgKzE5ODgsMTEgQEAgc3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbWFpbihz
dHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQogICAgIH0KICNlbmRp
ZgogCi0gICAgZm9yICggaSA9IDEsIGNwdSA9IDA7IGkgPCBkLT5tYXhfdmNwdXM7IGkrKyApCisg
ICAgZm9yICggaSA9IDE7IGkgPCBkLT5tYXhfdmNwdXM7IGkrKyApCiAgICAgewotICAgICAgICBj
cHUgPSBjcHVtYXNrX2N5Y2xlKGNwdSwgJmNwdV9vbmxpbmVfbWFwKTsKLSAgICAgICAgaWYgKCB2
Y3B1X2NyZWF0ZShkLCBpLCBjcHUpID09IE5VTEwgKQorICAgICAgICBpZiAoIHZjcHVfY3JlYXRl
KGQsIGkpID09IE5VTEwgKQogICAgICAgICB7Ci0gICAgICAgICAgICBwcmludGsoIkZhaWxlZCB0
byBhbGxvY2F0ZSBkb20wIHZjcHUgJWQgb24gcGNwdSAlZFxuIiwgaSwgY3B1KTsKKyAgICAgICAg
ICAgIHByaW50aygiRmFpbGVkIHRvIGFsbG9jYXRlIGQwdiV1XG4iLCBpKTsKICAgICAgICAgICAg
IGJyZWFrOwogICAgICAgICB9CiAKQEAgLTIwMjgsNyArMjAyNyw3IEBAIHN0YXRpYyBpbnQgX19p
bml0IGNvbnN0cnVjdF9kb21VKHN0cnVjdCBkb21haW4gKmQsCiAKICAgICBraW5mby52cGwwMTEg
PSBkdF9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInZwbDAxMSIpOwogCi0gICAgaWYgKCB2Y3B1
X2NyZWF0ZShkLCAwLCAwKSA9PSBOVUxMICkKKyAgICBpZiAoIHZjcHVfY3JlYXRlKGQsIDApID09
IE5VTEwgKQogICAgICAgICByZXR1cm4gLUVOT01FTTsKICAgICBkLT5tYXhfcGFnZXMgPSB+MFU7
CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYv
ZG9tMF9idWlsZC5jCmluZGV4IGM2OTU3MDkyMGMuLjYyNjVkZDRhMWMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwpA
QCAtMTk4LDEyICsxOTgsOSBAQCBjdXN0b21fcGFyYW0oImRvbTBfbm9kZXMiLCBwYXJzZV9kb20w
X25vZGVzKTsKIAogc3RhdGljIGNwdW1hc2tfdCBfX2luaXRkYXRhIGRvbTBfY3B1czsKIAotc3Ry
dWN0IHZjcHUgKl9faW5pdCBkb20wX3NldHVwX3ZjcHUoc3RydWN0IGRvbWFpbiAqZCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCB2Y3B1X2lkLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHByZXZfY3B1KQor
c3RydWN0IHZjcHUgKl9faW5pdCBkb20wX3NldHVwX3ZjcHUoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IHZjcHVfaWQpCiB7Ci0gICAgdW5zaWduZWQgaW50IGNwdSA9IGNwdW1hc2tfY3lj
bGUocHJldl9jcHUsICZkb20wX2NwdXMpOwotICAgIHN0cnVjdCB2Y3B1ICp2ID0gdmNwdV9jcmVh
dGUoZCwgdmNwdV9pZCwgY3B1KTsKKyAgICBzdHJ1Y3QgdmNwdSAqdiA9IHZjcHVfY3JlYXRlKGQs
IHZjcHVfaWQpOwogCiAgICAgaWYgKCB2ICkKICAgICB7CkBAIC0yNzMsOCArMjcwLDcgQEAgc3Ry
dWN0IHZjcHUgKl9faW5pdCBhbGxvY19kb20wX3ZjcHUwKHN0cnVjdCBkb21haW4gKmRvbTApCiAg
ICAgZG9tMC0+bm9kZV9hZmZpbml0eSA9IGRvbTBfbm9kZXM7CiAgICAgZG9tMC0+YXV0b19ub2Rl
X2FmZmluaXR5ID0gIWRvbTBfbnJfcHhtczsKIAotICAgIHJldHVybiBkb20wX3NldHVwX3ZjcHUo
ZG9tMCwgMCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdW1hc2tfbGFzdCgmZG9tMF9j
cHVzKSAvKiBzbyBpdCB3cmFwcyBhcm91bmQgdG8gZmlyc3QgcGNwdSAqLyk7CisgICAgcmV0dXJu
IGRvbTBfc2V0dXBfdmNwdShkb20wLCAwKTsKIH0KIAogI2lmZGVmIENPTkZJR19TSEFET1dfUEFH
SU5HCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNo
L3g4Ni9odm0vZG9tMF9idWlsZC5jCmluZGV4IDg4NDUzOTlhZTkuLmZkOGQ5NjA5YjEgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vZG9tMF9idWlsZC5jCkBAIC02MTQsNyArNjE0LDcgQEAgc3RhdGljIGludCBfX2luaXQgcHZo
X3NldHVwX2NwdXMoc3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBlbnRyeSwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3Qgc3RhcnRfaW5mbykKIHsKICAgICBzdHJ1Y3Qg
dmNwdSAqdiA9IGQtPnZjcHVbMF07Ci0gICAgdW5zaWduZWQgaW50IGNwdSA9IHYtPnByb2Nlc3Nv
ciwgaTsKKyAgICB1bnNpZ25lZCBpbnQgaTsKICAgICBpbnQgcmM7CiAgICAgLyoKICAgICAgKiBU
aGlzIHNldHMgdGhlIHZDUFUgc3RhdGUgYWNjb3JkaW5nIHRvIHRoZSBzdGF0ZSBkZXNjcmliZWQg
aW4KQEAgLTYzNiwxMiArNjM2LDcgQEAgc3RhdGljIGludCBfX2luaXQgcHZoX3NldHVwX2NwdXMo
c3RydWN0IGRvbWFpbiAqZCwgcGFkZHJfdCBlbnRyeSwKICAgICB9OwogCiAgICAgZm9yICggaSA9
IDE7IGkgPCBkLT5tYXhfdmNwdXM7IGkrKyApCi0gICAgewotICAgICAgICBjb25zdCBzdHJ1Y3Qg
dmNwdSAqcCA9IGRvbTBfc2V0dXBfdmNwdShkLCBpLCBjcHUpOwotCi0gICAgICAgIGlmICggcCAp
Ci0gICAgICAgICAgICBjcHUgPSBwLT5wcm9jZXNzb3I7Ci0gICAgfQorICAgICAgICBkb20wX3Nl
dHVwX3ZjcHUoZCwgaSk7CiAKICAgICBkb21haW5fdXBkYXRlX25vZGVfYWZmaW5pdHkoZCk7CiAK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYv
cHYvZG9tMF9idWlsZC5jCmluZGV4IDFiZDUzZTljMDguLjU2NWM2YzhiNDQgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L2RvbTBf
YnVpbGQuYwpAQCAtMjg1LDcgKzI4NSw3IEBAIGludCBfX2luaXQgZG9tMF9jb25zdHJ1Y3RfcHYo
c3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbW9kdWxlX3Qg
KmluaXRyZCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqY21kbGluZSkKIHsK
LSAgICBpbnQgaSwgY3B1LCByYywgY29tcGF0aWJsZSwgb3JkZXIsIG1hY2hpbmU7CisgICAgaW50
IGksIHJjLCBjb21wYXRpYmxlLCBvcmRlciwgbWFjaGluZTsKICAgICBzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVnczsKICAgICB1bnNpZ25lZCBsb25nIHBmbiwgbWZuOwogICAgIHVuc2lnbmVkIGxv
bmcgbnJfcGFnZXM7CkBAIC02OTQsMTQgKzY5NCw4IEBAIGludCBfX2luaXQgZG9tMF9jb25zdHJ1
Y3RfcHYoc3RydWN0IGRvbWFpbiAqZCwKIAogICAgIHByaW50aygiRG9tJXUgaGFzIG1heGltdW0g
JXUgVkNQVXNcbiIsIGQtPmRvbWFpbl9pZCwgZC0+bWF4X3ZjcHVzKTsKIAotICAgIGNwdSA9IHYt
PnByb2Nlc3NvcjsKICAgICBmb3IgKCBpID0gMTsgaSA8IGQtPm1heF92Y3B1czsgaSsrICkKLSAg
ICB7Ci0gICAgICAgIGNvbnN0IHN0cnVjdCB2Y3B1ICpwID0gZG9tMF9zZXR1cF92Y3B1KGQsIGks
IGNwdSk7Ci0KLSAgICAgICAgaWYgKCBwICkKLSAgICAgICAgICAgIGNwdSA9IHAtPnByb2Nlc3Nv
cjsKLSAgICB9CisgICAgICAgIGRvbTBfc2V0dXBfdmNwdShkLCBpKTsKIAogICAgIGRvbWFpbl91
cGRhdGVfbm9kZV9hZmZpbml0eShkKTsKICAgICBkLT5hcmNoLnBhZ2luZy5tb2RlID0gMDsKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4
IDhjNzgyZWUwM2YuLmEzZTIzZjJlZTcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMK
KysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpAQCAtMTM1LDggKzEzNSw3IEBAIHN0YXRpYyB2b2lk
IHZjcHVfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdikKICAgICBmcmVlX3ZjcHVfc3RydWN0KHYpOwog
fQogCi1zdHJ1Y3QgdmNwdSAqdmNwdV9jcmVhdGUoCi0gICAgc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IHZjcHVfaWQsIHVuc2lnbmVkIGludCBjcHVfaWQpCitzdHJ1Y3QgdmNwdSAqdmNw
dV9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZjcHVfaWQpCiB7CiAgICAg
c3RydWN0IHZjcHUgKnY7CiAKQEAgLTE2OCw3ICsxNjcsNyBAQCBzdHJ1Y3QgdmNwdSAqdmNwdV9j
cmVhdGUoCiAgICAgICAgIGluaXRfd2FpdHF1ZXVlX3ZjcHUodik7CiAgICAgfQogCi0gICAgaWYg
KCBzY2hlZF9pbml0X3ZjcHUodiwgY3B1X2lkKSAhPSAwICkKKyAgICBpZiAoIHNjaGVkX2luaXRf
dmNwdSh2KSAhPSAwICkKICAgICAgICAgZ290byBmYWlsX3dxOwogCiAgICAgaWYgKCBhcmNoX3Zj
cHVfY3JlYXRlKHYpICE9IDAgKQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21jdGwuYyBiL3hl
bi9jb21tb24vZG9tY3RsLmMKaW5kZXggMmY5NzY4ZjA4Zi4uOGE2OTRlMGQzNyAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9kb21jdGwuYworKysgYi94ZW4vY29tbW9uL2RvbWN0bC5jCkBAIC01MzIs
OCArNTMyLDcgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9t
Y3RsX3QpIHVfZG9tY3RsKQogCiAgICAgY2FzZSBYRU5fRE9NQ1RMX21heF92Y3B1czoKICAgICB7
Ci0gICAgICAgIHVuc2lnbmVkIGludCBpLCBtYXggPSBvcC0+dS5tYXhfdmNwdXMubWF4LCBjcHU7
Ci0gICAgICAgIGNwdW1hc2tfdCAqb25saW5lOworICAgICAgICB1bnNpZ25lZCBpbnQgaSwgbWF4
ID0gb3AtPnUubWF4X3ZjcHVzLm1heDsKIAogICAgICAgICByZXQgPSAtRUlOVkFMOwogICAgICAg
ICBpZiAoIChkID09IGN1cnJlbnQtPmRvbWFpbikgfHwgLyogbm8gZG9tYWluX3BhdXNlKCkgKi8K
QEAgLTU0NCwxOCArNTQzLDEzIEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFS
QU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKICAgICAgICAgZG9tYWluX3BhdXNlKGQpOwogCiAg
ICAgICAgIHJldCA9IC1FTk9NRU07Ci0gICAgICAgIG9ubGluZSA9IGNwdXBvb2xfZG9tYWluX2Nw
dW1hc2soZCk7CiAKICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBtYXg7IGkrKyApCiAgICAgICAg
IHsKICAgICAgICAgICAgIGlmICggZC0+dmNwdVtpXSAhPSBOVUxMICkKICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKIAotICAgICAgICAgICAgY3B1ID0gKGkgPT0gMCkgPwotICAgICAgICAgICAg
ICAgIGNwdW1hc2tfYW55KG9ubGluZSkgOgotICAgICAgICAgICAgICAgIGNwdW1hc2tfY3ljbGUo
ZC0+dmNwdVtpLTFdLT5wcm9jZXNzb3IsIG9ubGluZSk7Ci0KLSAgICAgICAgICAgIGlmICggdmNw
dV9jcmVhdGUoZCwgaSwgY3B1KSA9PSBOVUxMICkKKyAgICAgICAgICAgIGlmICggdmNwdV9jcmVh
dGUoZCwgaSkgPT0gTlVMTCApCiAgICAgICAgICAgICAgICAgZ290byBtYXh2Y3B1X291dDsKICAg
ICAgICAgfQogCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9u
L3NjaGVkdWxlLmMKaW5kZXggMDViYzQyZDdlOS4uNzQ3NjlmMmY5YiAxMDA2NDQKLS0tIGEveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMzcxLDE0
ICszNzEsNTIgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0
cnVjdCB2Y3B1ICp2KQogICAgIHJldHVybiBOVUxMOwogfQogCi1pbnQgc2NoZWRfaW5pdF92Y3B1
KHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yKQorc3RhdGljIHVuc2lnbmVk
IGludCBzY2hlZF9zZWxlY3RfaW5pdGlhbF9jcHUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCit7Cisg
ICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKKyAgICBub2RlaWRfdCBub2Rl
OworICAgIHNwaW5sb2NrX3QgKmxvY2s7CisgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKKyAgICB1
bnNpZ25lZCBpbnQgY3B1X3JldCwgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOworICAgIGNwdW1h
c2tfdCAqY3B1cyA9IGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KTsKKworICAgIGxvY2sgPSBwY3B1
X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShjcHUsICZmbGFncyk7CisgICAgY3B1bWFza19jbGVhcihj
cHVzKTsKKyAgICBmb3JfZWFjaF9ub2RlX21hc2sgKCBub2RlLCBkLT5ub2RlX2FmZmluaXR5ICkK
KyAgICAgICAgY3B1bWFza19vcihjcHVzLCBjcHVzLCAmbm9kZV90b19jcHVtYXNrKG5vZGUpKTsK
KyAgICBjcHVtYXNrX2FuZChjcHVzLCBjcHVzLCBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGQpKTsK
KyAgICBpZiAoIGNwdW1hc2tfZW1wdHkoY3B1cykgKQorICAgICAgICBjcHVtYXNrX2NvcHkoY3B1
cywgY3B1cG9vbF9kb21haW5fY3B1bWFzayhkKSk7CisKKyAgICBpZiAoIHYtPnZjcHVfaWQgPT0g
MCApCisgICAgICAgIGNwdV9yZXQgPSBjcHVtYXNrX2ZpcnN0KGNwdXMpOworICAgIGVsc2UKKyAg
ICB7CisgICAgICAgIC8qIFdlIGNhbiByZWx5IG9uIHByZXZpb3VzIHZjcHUgYmVpbmcgYXZhaWxh
YmxlLiAqLworICAgICAgICBBU1NFUlQoIWlzX2lkbGVfZG9tYWluKGQpKTsKKworICAgICAgICBj
cHVfcmV0ID0gY3B1bWFza19jeWNsZShkLT52Y3B1W3YtPnZjcHVfaWQgLSAxXS0+cHJvY2Vzc29y
LCBjcHVzKTsKKyAgICB9CisKKyAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnFyZXN0b3JlKGxv
Y2ssIGZsYWdzLCBjcHUpOworCisgICAgcmV0dXJuIGNwdV9yZXQ7Cit9CisKK2ludCBzY2hlZF9p
bml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpCiB7CiAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRv
bWFpbjsKICAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdDsKKyAgICB1bnNpZ25lZCBpbnQgcHJv
Y2Vzc29yOwogCiAgICAgaWYgKCAodW5pdCA9IHNjaGVkX2FsbG9jX3VuaXQodikpID09IE5VTEwg
KQogICAgICAgICByZXR1cm4gMTsKIAorICAgIGlmICggaXNfaWRsZV9kb21haW4oZCkgKQorICAg
ICAgICBwcm9jZXNzb3IgPSB2LT52Y3B1X2lkOworICAgIGVsc2UKKyAgICAgICAgcHJvY2Vzc29y
ID0gc2NoZWRfc2VsZWN0X2luaXRpYWxfY3B1KHYpOworCiAgICAgc2NoZWRfc2V0X3Jlcyh1bml0
LCBnZXRfc2NoZWRfcmVzKHByb2Nlc3NvcikpOwogCiAgICAgLyogSW5pdGlhbGlzZSB0aGUgcGVy
LXZjcHUgdGltZXJzLiAqLwpAQCAtMTc2Myw3ICsxODAxLDcgQEAgc3RhdGljIGludCBjcHVfc2No
ZWR1bGVfdXAodW5zaWduZWQgaW50IGNwdSkKICAgICAgICAgcmV0dXJuIDA7CiAKICAgICBpZiAo
IGlkbGVfdmNwdVtjcHVdID09IE5VTEwgKQotICAgICAgICB2Y3B1X2NyZWF0ZShpZGxlX3ZjcHVb
MF0tPmRvbWFpbiwgY3B1LCBjcHUpOworICAgICAgICB2Y3B1X2NyZWF0ZShpZGxlX3ZjcHVbMF0t
PmRvbWFpbiwgY3B1KTsKICAgICBlbHNlCiAgICAgICAgIGlkbGVfdmNwdVtjcHVdLT5zY2hlZF91
bml0LT5yZXMgPSBzZDsKIApAQCAtMTk0Miw3ICsxOTgwLDcgQEAgdm9pZCBfX2luaXQgc2NoZWR1
bGVyX2luaXQodm9pZCkKICAgICBCVUdfT04obnJfY3B1X2lkcyA+IEFSUkFZX1NJWkUoaWRsZV92
Y3B1KSk7CiAgICAgaWRsZV9kb21haW4tPnZjcHUgPSBpZGxlX3ZjcHU7CiAgICAgaWRsZV9kb21h
aW4tPm1heF92Y3B1cyA9IG5yX2NwdV9pZHM7Ci0gICAgaWYgKCB2Y3B1X2NyZWF0ZShpZGxlX2Rv
bWFpbiwgMCwgMCkgPT0gTlVMTCApCisgICAgaWYgKCB2Y3B1X2NyZWF0ZShpZGxlX2RvbWFpbiwg
MCkgPT0gTlVMTCApCiAgICAgICAgIEJVRygpOwogICAgIGdldF9zY2hlZF9yZXMoMCktPmN1cnIg
PSBpZGxlX3ZjcHVbMF0tPnNjaGVkX3VuaXQ7CiB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L2RvbTBfYnVpbGQuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tMF9idWlsZC5oCmlu
ZGV4IDMzYTU0ODM3MzkuLjNlYjRiMDM2ZTEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZG9tMF9idWlsZC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tMF9idWlsZC5oCkBA
IC0xMSw4ICsxMSw3IEBAIGV4dGVybiB1bnNpZ25lZCBpbnQgZG9tMF9tZW1mbGFnczsKIHVuc2ln
bmVkIGxvbmcgZG9tMF9jb21wdXRlX25yX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZWxmX2RvbV9wYXJtcyAqcGFybXMs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGluaXRy
ZF9sZW4pOwotc3RydWN0IHZjcHUgKmRvbTBfc2V0dXBfdmNwdShzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBpbnQgdmNwdV9pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGNwdSk7CitzdHJ1Y3QgdmNwdSAqZG9tMF9zZXR1cF92Y3B1KHN0cnVjdCBkb21haW4g
KmQsIHVuc2lnbmVkIGludCB2Y3B1X2lkKTsKIGludCBkb20wX3NldHVwX3Blcm1pc3Npb25zKHN0
cnVjdCBkb21haW4gKmQpOwogCiBpbnQgZG9tMF9jb25zdHJ1Y3RfcHYoc3RydWN0IGRvbWFpbiAq
ZCwgY29uc3QgbW9kdWxlX3QgKmltYWdlLApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2Rv
bWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCmluZGV4IDNmMDljYjY2YzAuLjRjYTNk
YjVhMTggMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vZG9tYWluLmgKQEAgLTEzLDggKzEzLDcgQEAgdHlwZWRlZiB1bmlvbiB7CiAgICAg
c3RydWN0IGNvbXBhdF92Y3B1X2d1ZXN0X2NvbnRleHQgKmNtcDsKIH0gdmNwdV9ndWVzdF9jb250
ZXh0X3UgX19hdHRyaWJ1dGVfXygoX190cmFuc3BhcmVudF91bmlvbl9fKSk7CiAKLXN0cnVjdCB2
Y3B1ICp2Y3B1X2NyZWF0ZSgKLSAgICBzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgdmNw
dV9pZCwgdW5zaWduZWQgaW50IGNwdV9pZCk7CitzdHJ1Y3QgdmNwdSAqdmNwdV9jcmVhdGUoc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHZjcHVfaWQpOwogCiB1bnNpZ25lZCBpbnQgZG9t
MF9tYXhfdmNwdXModm9pZCk7CiBzdHJ1Y3QgdmNwdSAqYWxsb2NfZG9tMF92Y3B1MChzdHJ1Y3Qg
ZG9tYWluICpkb20wKTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKaW5kZXggYjU5NjdkMjZhZi4uZjcwMTgyZGQ0ZSAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKKysrIGIveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLWlmLmgKQEAgLTQ1OCw3ICs0NTgsNyBAQCBzdHJ1Y3QgY3B1cG9vbAogI2RlZmlu
ZSBjcHVwb29sX29ubGluZV9jcHVtYXNrKF9wb29sKSBcCiAgICAgKCgoX3Bvb2wpID09IE5VTEwp
ID8gJmNwdV9vbmxpbmVfbWFwIDogKF9wb29sKS0+Y3B1X3ZhbGlkKQogCi1zdGF0aWMgaW5saW5l
IGNwdW1hc2tfdCogY3B1cG9vbF9kb21haW5fY3B1bWFzayhzdHJ1Y3QgZG9tYWluICpkKQorc3Rh
dGljIGlubGluZSBjcHVtYXNrX3QgKmNwdXBvb2xfZG9tYWluX2NwdW1hc2soY29uc3Qgc3RydWN0
IGRvbWFpbiAqZCkKIHsKICAgICAvKgogICAgICAqIGQtPmNwdXBvb2wgaXMgTlVMTCBvbmx5IGZv
ciB0aGUgaWRsZSBkb21haW4sIGFuZCBubyBvbmUgc2hvdWxkCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IGQ0Njk4YjNm
MGQuLjU2ZWQ4NjNiMDggMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC02NTksNyArNjU5LDcgQEAgdm9pZCBfX2RvbWFp
bl9jcmFzaChzdHJ1Y3QgZG9tYWluICpkKTsKIHZvaWQgbm9yZXR1cm4gYXNtX2RvbWFpbl9jcmFz
aF9zeW5jaHJvbm91cyh1bnNpZ25lZCBsb25nIGFkZHIpOwogCiB2b2lkIHNjaGVkdWxlcl9pbml0
KHZvaWQpOwotaW50ICBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGlu
dCBwcm9jZXNzb3IpOworaW50ICBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYpOwogdm9p
ZCBzY2hlZF9kZXN0cm95X3ZjcHUoc3RydWN0IHZjcHUgKnYpOwogaW50ICBzY2hlZF9pbml0X2Rv
bWFpbihzdHJ1Y3QgZG9tYWluICpkLCBpbnQgcG9vbGlkKTsKIHZvaWQgc2NoZWRfZGVzdHJveV9k
b21haW4oc3RydWN0IGRvbWFpbiAqZCk7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
