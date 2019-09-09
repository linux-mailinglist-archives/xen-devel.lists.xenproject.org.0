Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19469ADB3F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:34:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Khh-0001Ns-KP; Mon, 09 Sep 2019 14:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7Khf-0001Nd-QH
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:31:39 +0000
X-Inumbo-ID: 8818dbe8-d30e-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8818dbe8-d30e-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 14:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 72CB0B66C;
 Mon,  9 Sep 2019 14:31:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 16:31:32 +0200
Message-Id: <20190909143134.15379-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190909143134.15379-1-jgross@suse.com>
References: <20190909143134.15379-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 3/5] xen: print lock profile info in panic()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJpbnQgdGhlIGxvY2sgcHJvZmlsZSBkYXRhIHdoZW4gdGhlIHN5c3RlbSBjcmFzaGVzIGFuZCBh
ZGQgc29tZSBtb3JlCmluZm9ybWF0aW9uIGZvciBlYWNoIGxvY2sgZGF0YSAobG9jayBhZGRyZXNz
LCBjcHUgaG9sZGluZyB0aGUgbG9jaykuCldoaWxlIGF0IGl0IHVzZSB0aGUgUFJJX3N0aW1lIGZv
cm1hdCBzcGVjaWZpZXIgZm9yIHByaW50aW5nIHRpbWUgZGF0YS4KClRoaXMgaXMgZXNwZWNpYWxs
eSBiZW5lZmljaWFsIGZvciB3YXRjaGRvZyB0cmlnZ2VyZWQgY3Jhc2hlcyBpbiBjYXNlCm9mIGRl
YWRsb2Nrcy4KCkluIG9yZGVyIHRvIGhhdmUgdGhlIGNwdSBob2xkaW5nIHRoZSBsb2NrIGF2YWls
YWJsZSBsZXQgdGhlCmxvY2sgcHJvZmlsZSBjb25maWcgb3B0aW9uIHNlbGVjdCBERUJVR19MT0NL
Uy4KCkFzIHByaW50aW5nIHRoZSBsb2NrIHByb2ZpbGUgZGF0YSB3aWxsIG1ha2UgdXNlIG9mIGxv
Y2tpbmcsIHRvbywgd2UKbmVlZCB0byBkaXNhYmxlIHNwaW5sb2NrIGRlYnVnZ2luZyBiZWZvcmUg
Y2FsbGluZwpzcGlubG9ja19wcm9maWxlX3ByaW50YWxsKCkgZnJvbSBwYW5pYygpLgoKV2hpbGUg
YXQgaXQgcmVtb3ZlIGEgc3VwZXJmbHVvdXMgI2lmZGVmIENPTkZJR19MT0NLX1BST0ZJTEUgYW5k
IHJlbmFtZQpDT05GSUdfTE9DS19QUk9GSUxFIHRvIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUu
CgpBbHNvIG1vdmUgdGhlIC5sb2NrcHJvZmlsZS5kYXRhIHNlY3Rpb24gdG8gaW5pdCBhcmVhIGlu
IGxpbmtlciBzY3JpcHRzCmFzIHRoZSBkYXRhIGlzIG5vIGxvbmdlciBuZWVkZWQgYWZ0ZXIgYm9v
dC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tClYyOgotIHJlbmFtZSBDT05G
SUdfTE9DS19QUk9GSUxFIHRvIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUgKEphbiBCZXVsaWNo
KQotIG1vdmUgLmxvY2twcm9maWxlLmRhdGEgc2VjdGlvbiB0byBpbml0IGFyZWEgaW4gbGlua2Vy
IHNjcmlwdHMKLSB1c2UgUFJJX3N0aW1lIChBbmRyZXcgQ29vcGVyKQotIGRvbid0IHByaW50ICJj
cHU9NDA5NSIsIGJ1dCAibm90IGxvY2tlZCIgKEFuZHJldyBDb29wZXIpCi0tLQogeGVuL0tjb25m
aWcuZGVidWcgICAgICAgICAgfCAgMyArKy0KIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgIHwg
MTMgKysrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgfCAgMiArLQogeGVu
L2FyY2gveDg2L3hlbi5sZHMuUyAgICAgfCAxMyArKysrKysrLS0tLS0tCiB4ZW4vY29tbW9uL2tl
eWhhbmRsZXIuYyAgICB8ICAyICstCiB4ZW4vY29tbW9uL3NwaW5sb2NrLmMgICAgICB8IDMzICsr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAg
ICAgfCAgMiArLQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAgNCArKystCiB4ZW4vaW5j
bHVkZS94ZW4vc3BpbmxvY2suaCB8IDEyICsrKysrKystLS0tLQogOSBmaWxlcyBjaGFuZ2VkLCA0
NyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vS2NvbmZp
Zy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCmluZGV4IDFmYWFhM2JhNmEuLjIyNTczZTc0ZGIg
MTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCisrKyBiL3hlbi9LY29uZmlnLmRlYnVnCkBA
IC00NCw4ICs0NCw5IEBAIGNvbmZpZyBDT1ZFUkFHRQogCiAJICBJZiB1bnN1cmUsIHNheSBOIGhl
cmUuCiAKLWNvbmZpZyBMT0NLX1BST0ZJTEUKK2NvbmZpZyBERUJVR19MT0NLX1BST0ZJTEUKIAli
b29sICJMb2NrIFByb2ZpbGluZyIKKwlzZWxlY3QgREVCVUdfTE9DS1MKIAktLS1oZWxwLS0tCiAJ
ICBMb2NrIHByb2ZpbGluZyBhbGxvd3MgeW91IHRvIHNlZSBob3cgb2Z0ZW4gbG9ja3MgYXJlIHRh
a2VuIGFuZCBibG9ja2VkLgogCSAgWW91IGNhbiB1c2Ugc2VyaWFsIGNvbnNvbGUgdG8gcHJpbnQg
KGFuZCByZXNldCkgdXNpbmcgJ2wnIGFuZCAnTCcKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS94
ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCmluZGV4IDE2Y2UxZGQwMWUuLmE0OTdm
NmE0OGQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gv
YXJtL3hlbi5sZHMuUwpAQCAtNTQsMTIgKzU0LDYgQEAgU0VDVElPTlMKICAgICAgICAqKC5kYXRh
LnJlbC5ybykKICAgICAgICAqKC5kYXRhLnJlbC5yby4qKQogCi0jaWZkZWYgQ09ORklHX0xPQ0tf
UFJPRklMRQotICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKLSAgICAgICBfX2xvY2tf
cHJvZmlsZV9zdGFydCA9IC47Ci0gICAgICAgKigubG9ja3Byb2ZpbGUuZGF0YSkKLSAgICAgICBf
X2xvY2tfcHJvZmlsZV9lbmQgPSAuOwotI2VuZGlmCiAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJf
QUxJR04pOwogICAgICAgIF9fcGFyYW1fc3RhcnQgPSAuOwogICAgICAgICooLmRhdGEucGFyYW0p
CkBAIC0xNzMsNiArMTY3LDEzIEBAIFNFQ1RJT05TCiAgICAgICAgLiA9IEFMSUdOKDQpOwogICAg
ICAgICooLmFsdGluc3RyX3JlcGxhY2VtZW50KQogCisjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tf
UFJPRklMRQorICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKKyAgICAgICBfX2xvY2tf
cHJvZmlsZV9zdGFydCA9IC47CisgICAgICAgKigubG9ja3Byb2ZpbGUuZGF0YSkKKyAgICAgICBf
X2xvY2tfcHJvZmlsZV9lbmQgPSAuOworI2VuZGlmCisKICAgICAgICAqKC5pbml0LmRhdGEpCiAg
ICAgICAgKiguaW5pdC5kYXRhLnJlbCkKICAgICAgICAqKC5pbml0LmRhdGEucmVsLiopCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKaW5k
ZXggZDUzOGRlOGVhZS4uZmFjYWVlZWQxZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWFp
bi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtMzA1LDcgKzMwNSw3IEBAIHN0cnVj
dCBkb21haW4gKmFsbG9jX2RvbWFpbl9zdHJ1Y3Qodm9pZCkKICNlbmRpZgogCiAKLSNpZm5kZWYg
Q09ORklHX0xPQ0tfUFJPRklMRQorI2lmbmRlZiBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxFCiAg
ICAgQlVJTERfQlVHX09OKHNpemVvZigqZCkgPiBQQUdFX1NJWkUpOwogI2VuZGlmCiAgICAgZCA9
IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIsIE1FTUZfYml0cyhiaXRzKSk7CmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCA4
N2ZhMDJiOWI1Li4xMTFlZGI1MzYwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5T
CisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTEyOCwxMiArMTI4LDYgQEAgU0VDVElP
TlMKICAgICAgICAqKC5leF90YWJsZS5wcmUpCiAgICAgICAgX19zdG9wX19fcHJlX2V4X3RhYmxl
ID0gLjsKIAotI2lmZGVmIENPTkZJR19MT0NLX1BST0ZJTEUKLSAgICAgICAuID0gQUxJR04oUE9J
TlRFUl9BTElHTik7Ci0gICAgICAgX19sb2NrX3Byb2ZpbGVfc3RhcnQgPSAuOwotICAgICAgICoo
LmxvY2twcm9maWxlLmRhdGEpCi0gICAgICAgX19sb2NrX3Byb2ZpbGVfZW5kID0gLjsKLSNlbmRp
ZgogICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKICAgICAgICBfX3BhcmFtX3N0YXJ0
ID0gLjsKICAgICAgICAqKC5kYXRhLnBhcmFtKQpAQCAtMjUxLDYgKzI0NSwxMyBAQCBTRUNUSU9O
UwogICAgICAgICAqKC5hbHRpbnN0cnVjdGlvbnMpCiAgICAgICAgIF9fYWx0X2luc3RydWN0aW9u
c19lbmQgPSAuOwogCisjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRQorICAgICAgIC4g
PSBBTElHTihQT0lOVEVSX0FMSUdOKTsKKyAgICAgICBfX2xvY2tfcHJvZmlsZV9zdGFydCA9IC47
CisgICAgICAgKigubG9ja3Byb2ZpbGUuZGF0YSkKKyAgICAgICBfX2xvY2tfcHJvZmlsZV9lbmQg
PSAuOworI2VuZGlmCisKICAgICAgICAuID0gQUxJR04oOCk7CiAgICAgICAgX19jdG9yc19zdGFy
dCA9IC47CiAgICAgICAgKiguY3RvcnMpCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2tleWhhbmRs
ZXIuYyBiL3hlbi9jb21tb24va2V5aGFuZGxlci5jCmluZGV4IDU3YjM2MGVlNGIuLmMzNmJhYTRk
ZmYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24va2V5aGFuZGxlci5jCisrKyBiL3hlbi9jb21tb24v
a2V5aGFuZGxlci5jCkBAIC02Miw3ICs2Miw3IEBAIHN0YXRpYyBzdHJ1Y3Qga2V5aGFuZGxlciB7
CiAgICAgS0VZSEFORExFUignUCcsIHBlcmZjX3Jlc2V0LCAicmVzZXQgcGVyZm9ybWFuY2UgY291
bnRlcnMiLCAwKSwKICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVm
IENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUKICAgICBLRVlIQU5ETEVSKCdsJywgc3BpbmxvY2tf
cHJvZmlsZV9wcmludGFsbCwgInByaW50IGxvY2sgcHJvZmlsZSBpbmZvIiwgMSksCiAgICAgS0VZ
SEFORExFUignTCcsIHNwaW5sb2NrX3Byb2ZpbGVfcmVzZXQsICJyZXNldCBsb2NrIHByb2ZpbGUg
aW5mbyIsIDApLAogI2VuZGlmCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NwaW5sb2NrLmMgYi94
ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggNzllNzBhOTk0Ny4uYzRmNzA2YzYyNyAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21tb24vc3BpbmxvY2suYwpA
QCAtMTA2LDcgKzEwNiw3IEBAIHZvaWQgc3Bpbl9kZWJ1Z19kaXNhYmxlKHZvaWQpCiAKICNlbmRp
ZgogCi0jaWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NL
X1BST0ZJTEUKIAogI2RlZmluZSBMT0NLX1BST0ZJTEVfUkVMICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgaWYgKGxvY2stPnByb2ZpbGUp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
QEAgLTI0Myw3ICsyNDMsNyBAQCBpbnQgX3NwaW5fdHJ5bG9jayhzcGlubG9ja190ICpsb2NrKQog
ICAgICAgICAgICAgICAgICBvbGQuaGVhZF90YWlsLCBuZXcuaGVhZF90YWlsKSAhPSBvbGQuaGVh
ZF90YWlsICkKICAgICAgICAgcmV0dXJuIDA7CiAgICAgZ290X2xvY2soJmxvY2stPmRlYnVnKTsK
LSNpZmRlZiBDT05GSUdfTE9DS19QUk9GSUxFCisjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJP
RklMRQogICAgIGlmIChsb2NrLT5wcm9maWxlKQogICAgICAgICBsb2NrLT5wcm9maWxlLT50aW1l
X2xvY2tlZCA9IE5PVygpOwogI2VuZGlmCkBAIC0yNTgsNyArMjU4LDcgQEAgaW50IF9zcGluX3Ry
eWxvY2soc3BpbmxvY2tfdCAqbG9jaykKIHZvaWQgX3NwaW5fYmFycmllcihzcGlubG9ja190ICps
b2NrKQogewogICAgIHNwaW5sb2NrX3RpY2tldHNfdCBzYW1wbGU7Ci0jaWZkZWYgQ09ORklHX0xP
Q0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUKICAgICBzX3RpbWVf
dCBibG9jayA9IE5PVygpOwogI2VuZGlmCiAKQEAgLTI2OSw3ICsyNjksNyBAQCB2b2lkIF9zcGlu
X2JhcnJpZXIoc3BpbmxvY2tfdCAqbG9jaykKICAgICB7CiAgICAgICAgIHdoaWxlICggb2JzZXJ2
ZV9oZWFkKCZsb2NrLT50aWNrZXRzKSA9PSBzYW1wbGUuaGVhZCApCiAgICAgICAgICAgICBhcmNo
X2xvY2tfcmVsYXgoKTsKLSNpZmRlZiBDT05GSUdfTE9DS19QUk9GSUxFCisjaWZkZWYgQ09ORklH
X0RFQlVHX0xPQ0tfUFJPRklMRQogICAgICAgICBpZiAoIGxvY2stPnByb2ZpbGUgKQogICAgICAg
ICB7CiAgICAgICAgICAgICBsb2NrLT5wcm9maWxlLT50aW1lX2Jsb2NrICs9IE5PVygpIC0gYmxv
Y2s7CkBAIC0zMjcsNyArMzI3LDcgQEAgdm9pZCBfc3Bpbl91bmxvY2tfcmVjdXJzaXZlKHNwaW5s
b2NrX3QgKmxvY2spCiAgICAgfQogfQogCi0jaWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lm
ZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUKIAogc3RydWN0IGxvY2tfcHJvZmlsZV9hbmMg
ewogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKmhlYWRfcTsgICAvKiBmaXJzdCBoZWFk
IG9mIHRoaXMgdHlwZSAqLwpAQCAtMzYyLDE0ICszNjIsMTkgQEAgc3RhdGljIHZvaWQgc3Bpbmxv
Y2tfcHJvZmlsZV9pdGVyYXRlKGxvY2tfcHJvZmlsZV9zdWJmdW5jICpzdWIsIHZvaWQgKnBhcikK
IHN0YXRpYyB2b2lkIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRfZWxlbShzdHJ1Y3QgbG9ja19wcm9m
aWxlICpkYXRhLAogICAgIGludDMyX3QgdHlwZSwgaW50MzJfdCBpZHgsIHZvaWQgKnBhcikKIHsK
LSAgICBpZiAoIHR5cGUgPT0gTE9DS1BST0ZfVFlQRV9HTE9CQUwgKQotICAgICAgICBwcmludGso
IiVzICVzOlxuIiwgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSwgZGF0YS0+bmFtZSk7Cisg
ICAgc3RydWN0IHNwaW5sb2NrICpsb2NrID0gZGF0YS0+bG9jazsKKworICAgIHByaW50aygiJXMg
IiwgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSk7CisgICAgaWYgKCB0eXBlICE9IExPQ0tQ
Uk9GX1RZUEVfR0xPQkFMICkKKyAgICAgICAgcHJpbnRrKCIlZCAiLCBpZHgpOworICAgIHByaW50
aygiJXM6IGFkZHI9JXAsIGxvY2t2YWw9JTA4eCwgIiwgZGF0YS0+bmFtZSwgbG9jaywKKyAgICAg
ICAgICAgbG9jay0+dGlja2V0cy5oZWFkX3RhaWwpOworICAgIGlmICggbG9jay0+ZGVidWcuY3B1
ID09IFNQSU5MT0NLX05PX0NQVSApCisgICAgICAgIHByaW50aygibm90IGxvY2tlZFxuIik7CiAg
ICAgZWxzZQotICAgICAgICBwcmludGsoIiVzICVkICVzOlxuIiwgbG9ja19wcm9maWxlX2FuY3Nb
dHlwZV0ubmFtZSwgaWR4LCBkYXRhLT5uYW1lKTsKLSAgICBwcmludGsoIiAgbG9jazolMTIiUFJJ
ZDY0IiglMDhYOiUwOFgpLCBibG9jazolMTIiUFJJZDY0IiglMDhYOiUwOFgpXG4iLAotICAgICAg
ICAgICBkYXRhLT5sb2NrX2NudCwgKHUzMikoZGF0YS0+dGltZV9ob2xkID4+IDMyKSwgKHUzMilk
YXRhLT50aW1lX2hvbGQsCi0gICAgICAgICAgIGRhdGEtPmJsb2NrX2NudCwgKHUzMikoZGF0YS0+
dGltZV9ibG9jayA+PiAzMiksCi0gICAgICAgICAgICh1MzIpZGF0YS0+dGltZV9ibG9jayk7Cisg
ICAgICAgIHByaW50aygiY3B1PSVkXG4iLCBsb2NrLT5kZWJ1Zy5jcHUpOworICAgIHByaW50aygi
ICBsb2NrOiUiIFBSSWQ2NCAiKCUiIFBSSV9zdGltZSAiKSwgYmxvY2s6JSIgUFJJZDY0ICIoJSIg
UFJJX3N0aW1lICIpXG4iLAorICAgICAgICAgICBkYXRhLT5sb2NrX2NudCwgZGF0YS0+dGltZV9o
b2xkLCBkYXRhLT5ibG9ja19jbnQsIGRhdGEtPnRpbWVfYmxvY2spOwogfQogCiB2b2lkIHNwaW5s
b2NrX3Byb2ZpbGVfcHJpbnRhbGwodW5zaWduZWQgY2hhciBrZXkpCkBAIC00ODgsNyArNDkzLDYg
QEAgdm9pZCBfbG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KAogICAgIHNwaW5fdW5sb2Nr
KCZsb2NrX3Byb2ZpbGVfbG9jayk7CiB9CiAKLSNpZmRlZiBDT05GSUdfTE9DS19QUk9GSUxFCiBz
dGF0aWMgaW50IF9faW5pdCBsb2NrX3Byb2ZfaW5pdCh2b2lkKQogewogICAgIHN0cnVjdCBsb2Nr
X3Byb2ZpbGUgKipxOwpAQCAtNTA3LDYgKzUxMSw1IEBAIHN0YXRpYyBpbnQgX19pbml0IGxvY2tf
cHJvZl9pbml0KHZvaWQpCiAgICAgcmV0dXJuIDA7CiB9CiBfX2luaXRjYWxsKGxvY2tfcHJvZl9p
bml0KTsKLSNlbmRpZgogCi0jZW5kaWYgLyogTE9DS19QUk9GSUxFICovCisjZW5kaWYgLyogQ09O
RklHX0RFQlVHX0xPQ0tfUFJPRklMRSAqLwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zeXNjdGwu
YyBiL3hlbi9jb21tb24vc3lzY3RsLmMKaW5kZXggOTJiNGVhMGQyMS4uYzhmODY0MjRkNSAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYworKysgYi94ZW4vY29tbW9uL3N5c2N0bC5jCkBA
IC0xMTksNyArMTE5LDcgQEAgbG9uZyBkb19zeXNjdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4
ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQogICAgICAgICBicmVhazsKICNlbmRpZgogCi0jaWZkZWYg
Q09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUKICAg
ICBjYXNlIFhFTl9TWVNDVExfbG9ja3Byb2Zfb3A6CiAgICAgICAgIHJldCA9IHNwaW5sb2NrX3By
b2ZpbGVfY29udHJvbCgmb3AtPnUubG9ja3Byb2Zfb3ApOwogICAgICAgICBicmVhazsKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25z
b2xlLmMKaW5kZXggN2YyOTE5MGVhZi4uZTEzMzUzNGJlNyAxMDA2NDQKLS0tIGEveGVuL2RyaXZl
cnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKQEAgLTEx
NzAsNyArMTE3MCw5IEBAIHZvaWQgcGFuaWMoY29uc3QgY2hhciAqZm10LCAuLi4pCiAgICAgdW5z
aWduZWQgbG9uZyBmbGFnczsKICAgICBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGxvY2spOwogICAg
IHN0YXRpYyBjaGFyIGJ1ZlsxMjhdOwotICAgIAorCisgICAgc3Bpbl9kZWJ1Z19kaXNhYmxlKCk7
CisgICAgc3BpbmxvY2tfcHJvZmlsZV9wcmludGFsbCgnXDAnKTsKICAgICBkZWJ1Z3RyYWNlX2R1
bXAoKTsKIAogICAgIC8qIFByb3RlY3RzIGJ1ZltdIGFuZCBlbnN1cmUgbXVsdGktbGluZSBtZXNz
YWdlIHByaW50cyBhdG9taWNhbGx5LiAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Nw
aW5sb2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAppbmRleCA2ZGE1NWU3NGEyLi4w
ZjgxYzVmOTAwIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAorKysgYi94
ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaApAQCAtMSw2ICsxLDcgQEAKICNpZm5kZWYgX19TUElO
TE9DS19IX18KICNkZWZpbmUgX19TUElOTE9DS19IX18KIAorI2luY2x1ZGUgPHhlbi90aW1lLmg+
CiAjaW5jbHVkZSA8YXNtL3N5c3RlbS5oPgogI2luY2x1ZGUgPGFzbS9zcGlubG9jay5oPgogI2lu
Y2x1ZGUgPGFzbS90eXBlcy5oPgpAQCAtMjgsNyArMjksNyBAQCB1bmlvbiBsb2NrX2RlYnVnIHsg
fTsKICNkZWZpbmUgc3Bpbl9kZWJ1Z19kaXNhYmxlKCkgKCh2b2lkKTApCiAjZW5kaWYKIAotI2lm
ZGVmIENPTkZJR19MT0NLX1BST0ZJTEUKKyNpZmRlZiBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxF
CiAKICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+CiAKQEAgLTc0LDkgKzc1LDkgQEAgc3RydWN0
IGxvY2tfcHJvZmlsZSB7CiAgICAgc3RydWN0IHNwaW5sb2NrICAgICAqbG9jazsgICAgICAgLyog
dGhlIGxvY2sgaXRzZWxmICovCiAgICAgdTY0ICAgICAgICAgICAgICAgICBsb2NrX2NudDsgICAg
LyogIyBvZiBjb21wbGV0ZSBsb2NraW5nIG9wcyAqLwogICAgIHU2NCAgICAgICAgICAgICAgICAg
YmxvY2tfY250OyAgIC8qICMgb2YgY29tcGxldGUgd2FpdCBmb3IgbG9jayAqLwotICAgIHM2NCAg
ICAgICAgICAgICAgICAgdGltZV9ob2xkOyAgIC8qIGN1bXVsYXRlZCBsb2NrIHRpbWUgKi8KLSAg
ICBzNjQgICAgICAgICAgICAgICAgIHRpbWVfYmxvY2s7ICAvKiBjdW11bGF0ZWQgd2FpdCB0aW1l
ICovCi0gICAgczY0ICAgICAgICAgICAgICAgICB0aW1lX2xvY2tlZDsgLyogc3lzdGVtIHRpbWUg
b2YgbGFzdCBsb2NraW5nICovCisgICAgc190aW1lX3QgICAgICAgICAgICB0aW1lX2hvbGQ7ICAg
LyogY3VtdWxhdGVkIGxvY2sgdGltZSAqLworICAgIHNfdGltZV90ICAgICAgICAgICAgdGltZV9i
bG9jazsgIC8qIGN1bXVsYXRlZCB3YWl0IHRpbWUgKi8KKyAgICBzX3RpbWVfdCAgICAgICAgICAg
IHRpbWVfbG9ja2VkOyAvKiBzeXN0ZW0gdGltZSBvZiBsYXN0IGxvY2tpbmcgKi8KIH07CiAKIHN0
cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgewpAQCAtMTMyLDYgKzEzMyw3IEBAIHN0cnVjdCBsb2Nr
X3Byb2ZpbGVfcWhlYWQgeyB9OwogI2RlZmluZSBzcGluX2xvY2tfaW5pdF9wcm9mKHMsIGwpIHNw
aW5fbG9ja19pbml0KCYoKHMpLT5sKSkKICNkZWZpbmUgbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0
cnVjdCh0eXBlLCBwdHIsIGlkeCwgcHJpbnQpCiAjZGVmaW5lIGxvY2tfcHJvZmlsZV9kZXJlZ2lz
dGVyX3N0cnVjdCh0eXBlLCBwdHIpCisjZGVmaW5lIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRhbGwo
a2V5KQogCiAjZW5kaWYKIApAQCAtMTUzLDcgKzE1NSw3IEBAIHR5cGVkZWYgc3RydWN0IHNwaW5s
b2NrIHsKICAgICB1MTYgcmVjdXJzZV9jbnQ6U1BJTkxPQ0tfUkVDVVJTRV9CSVRTOwogI2RlZmlu
ZSBTUElOTE9DS19NQVhfUkVDVVJTRSAgICgoMXUgPDwgU1BJTkxPQ0tfUkVDVVJTRV9CSVRTKSAt
IDEpCiAgICAgdW5pb24gbG9ja19kZWJ1ZyBkZWJ1ZzsKLSNpZmRlZiBDT05GSUdfTE9DS19QUk9G
SUxFCisjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRQogICAgIHN0cnVjdCBsb2NrX3By
b2ZpbGUgKnByb2ZpbGU7CiAjZW5kaWYKIH0gc3BpbmxvY2tfdDsKLS0gCjIuMTYuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
