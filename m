Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303D087202
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 08:11:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvy4A-0006br-A0; Fri, 09 Aug 2019 06:07:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvy48-0006bV-Po
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 06:07:52 +0000
X-Inumbo-ID: 047873df-ba6c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 047873df-ba6c-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 06:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB115B05E;
 Fri,  9 Aug 2019 06:07:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 08:07:42 +0200
Message-Id: <20190809060744.8985-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190809060744.8985-1-jgross@suse.com>
References: <20190809060744.8985-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 3/5] xen: print lock profile info in panic()
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
dC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYy
OgotIHJlbmFtZSBDT05GSUdfTE9DS19QUk9GSUxFIHRvIENPTkZJR19ERUJVR19MT0NLX1BST0ZJ
TEUgKEphbiBCZXVsaWNoKQotIG1vdmUgLmxvY2twcm9maWxlLmRhdGEgc2VjdGlvbiB0byBpbml0
IGFyZWEgaW4gbGlua2VyIHNjcmlwdHMKLSB1c2UgUFJJX3N0aW1lIChBbmRyZXcgQ29vcGVyKQot
IGRvbid0IHByaW50ICJjcHU9NDA5NSIsIGJ1dCAibm90IGxvY2tlZCIgKEFuZHJldyBDb29wZXIp
Ci0tLQogeGVuL0tjb25maWcuZGVidWcgICAgICAgICAgfCAgMyArKy0KIHhlbi9hcmNoL2FybS94
ZW4ubGRzLlMgICAgIHwgMTMgKysrKysrKy0tLS0tLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAg
ICAgfCAgMiArLQogeGVuL2FyY2gveDg2L3hlbi5sZHMuUyAgICAgfCAxMyArKysrKysrLS0tLS0t
CiB4ZW4vY29tbW9uL2tleWhhbmRsZXIuYyAgICB8ICAyICstCiB4ZW4vY29tbW9uL3NwaW5sb2Nr
LmMgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1v
bi9zeXNjdGwuYyAgICAgICAgfCAgMiArLQogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgfCAg
NCArKystCiB4ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaCB8IDEyICsrKysrKystLS0tLQogOSBm
aWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vS2NvbmZpZy5kZWJ1ZyBiL3hlbi9LY29uZmlnLmRlYnVnCmluZGV4IDFmYWFhM2Jh
NmEuLjIyNTczZTc0ZGIgMTAwNjQ0Ci0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCisrKyBiL3hlbi9L
Y29uZmlnLmRlYnVnCkBAIC00NCw4ICs0NCw5IEBAIGNvbmZpZyBDT1ZFUkFHRQogCiAJICBJZiB1
bnN1cmUsIHNheSBOIGhlcmUuCiAKLWNvbmZpZyBMT0NLX1BST0ZJTEUKK2NvbmZpZyBERUJVR19M
T0NLX1BST0ZJTEUKIAlib29sICJMb2NrIFByb2ZpbGluZyIKKwlzZWxlY3QgREVCVUdfTE9DS1MK
IAktLS1oZWxwLS0tCiAJICBMb2NrIHByb2ZpbGluZyBhbGxvd3MgeW91IHRvIHNlZSBob3cgb2Z0
ZW4gbG9ja3MgYXJlIHRha2VuIGFuZCBibG9ja2VkLgogCSAgWW91IGNhbiB1c2Ugc2VyaWFsIGNv
bnNvbGUgdG8gcHJpbnQgKGFuZCByZXNldCkgdXNpbmcgJ2wnIGFuZCAnTCcKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS94ZW4ubGRzLlMgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCmluZGV4IDEy
YzEwN2Y0NWQuLmJhMjBlOTBlODMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMK
KysrIGIveGVuL2FyY2gvYXJtL3hlbi5sZHMuUwpAQCAtNTUsMTIgKzU1LDYgQEAgU0VDVElPTlMK
ICAgICAgICAqKC5kYXRhLnJlbC5ybykKICAgICAgICAqKC5kYXRhLnJlbC5yby4qKQogCi0jaWZk
ZWYgQ09ORklHX0xPQ0tfUFJPRklMRQotICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsK
LSAgICAgICBfX2xvY2tfcHJvZmlsZV9zdGFydCA9IC47Ci0gICAgICAgKigubG9ja3Byb2ZpbGUu
ZGF0YSkKLSAgICAgICBfX2xvY2tfcHJvZmlsZV9lbmQgPSAuOwotI2VuZGlmCiAgICAgICAgLiA9
IEFMSUdOKFBPSU5URVJfQUxJR04pOwogICAgICAgIF9fcGFyYW1fc3RhcnQgPSAuOwogICAgICAg
ICooLmRhdGEucGFyYW0pCkBAIC0xNzQsNiArMTY4LDEzIEBAIFNFQ1RJT05TCiAgICAgICAgLiA9
IEFMSUdOKDQpOwogICAgICAgICooLmFsdGluc3RyX3JlcGxhY2VtZW50KQogCisjaWZkZWYgQ09O
RklHX0RFQlVHX0xPQ0tfUFJPRklMRQorICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsK
KyAgICAgICBfX2xvY2tfcHJvZmlsZV9zdGFydCA9IC47CisgICAgICAgKigubG9ja3Byb2ZpbGUu
ZGF0YSkKKyAgICAgICBfX2xvY2tfcHJvZmlsZV9lbmQgPSAuOworI2VuZGlmCisKICAgICAgICAq
KC5pbml0LmRhdGEpCiAgICAgICAgKiguaW5pdC5kYXRhLnJlbCkKICAgICAgICAqKC5pbml0LmRh
dGEucmVsLiopCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94ZW4vYXJjaC94
ODYvZG9tYWluLmMKaW5kZXggNTkzM2IzZjUxYi4uMzY5ZTI5YzEyYyAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2RvbWFpbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpAQCAtMzA1LDcg
KzMwNSw3IEBAIHN0cnVjdCBkb21haW4gKmFsbG9jX2RvbWFpbl9zdHJ1Y3Qodm9pZCkKICNlbmRp
ZgogCiAKLSNpZm5kZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmbmRlZiBDT05GSUdfREVCVUdf
TE9DS19QUk9GSUxFCiAgICAgQlVJTERfQlVHX09OKHNpemVvZigqZCkgPiBQQUdFX1NJWkUpOwog
I2VuZGlmCiAgICAgZCA9IGFsbG9jX3hlbmhlYXBfcGFnZXMob3JkZXIsIE1FTUZfYml0cyhiaXRz
KSk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TIGIveGVuL2FyY2gveDg2L3hl
bi5sZHMuUwppbmRleCBhNzMxMzljZDI5Li43YjRmYzc0OTczIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMKQEAgLTEyOSwxMiAr
MTI5LDYgQEAgU0VDVElPTlMKICAgICAgICAqKC5leF90YWJsZS5wcmUpCiAgICAgICAgX19zdG9w
X19fcHJlX2V4X3RhYmxlID0gLjsKIAotI2lmZGVmIENPTkZJR19MT0NLX1BST0ZJTEUKLSAgICAg
ICAuID0gQUxJR04oUE9JTlRFUl9BTElHTik7Ci0gICAgICAgX19sb2NrX3Byb2ZpbGVfc3RhcnQg
PSAuOwotICAgICAgICooLmxvY2twcm9maWxlLmRhdGEpCi0gICAgICAgX19sb2NrX3Byb2ZpbGVf
ZW5kID0gLjsKLSNlbmRpZgogICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKICAgICAg
ICBfX3BhcmFtX3N0YXJ0ID0gLjsKICAgICAgICAqKC5kYXRhLnBhcmFtKQpAQCAtMjUyLDYgKzI0
NiwxMyBAQCBTRUNUSU9OUwogICAgICAgICAqKC5hbHRpbnN0cnVjdGlvbnMpCiAgICAgICAgIF9f
YWx0X2luc3RydWN0aW9uc19lbmQgPSAuOwogCisjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJP
RklMRQorICAgICAgIC4gPSBBTElHTihQT0lOVEVSX0FMSUdOKTsKKyAgICAgICBfX2xvY2tfcHJv
ZmlsZV9zdGFydCA9IC47CisgICAgICAgKigubG9ja3Byb2ZpbGUuZGF0YSkKKyAgICAgICBfX2xv
Y2tfcHJvZmlsZV9lbmQgPSAuOworI2VuZGlmCisKICAgICAgICAuID0gQUxJR04oOCk7CiAgICAg
ICAgX19jdG9yc19zdGFydCA9IC47CiAgICAgICAgKiguY3RvcnMpCmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL2tleWhhbmRsZXIuYyBiL3hlbi9jb21tb24va2V5aGFuZGxlci5jCmluZGV4IDU3YjM2
MGVlNGIuLmMzNmJhYTRkZmYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24va2V5aGFuZGxlci5jCisr
KyBiL3hlbi9jb21tb24va2V5aGFuZGxlci5jCkBAIC02Miw3ICs2Miw3IEBAIHN0YXRpYyBzdHJ1
Y3Qga2V5aGFuZGxlciB7CiAgICAgS0VZSEFORExFUignUCcsIHBlcmZjX3Jlc2V0LCAicmVzZXQg
cGVyZm9ybWFuY2UgY291bnRlcnMiLCAwKSwKICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX0xPQ0tf
UFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUKICAgICBLRVlIQU5ETEVS
KCdsJywgc3BpbmxvY2tfcHJvZmlsZV9wcmludGFsbCwgInByaW50IGxvY2sgcHJvZmlsZSBpbmZv
IiwgMSksCiAgICAgS0VZSEFORExFUignTCcsIHNwaW5sb2NrX3Byb2ZpbGVfcmVzZXQsICJyZXNl
dCBsb2NrIHByb2ZpbGUgaW5mbyIsIDApLAogI2VuZGlmCmRpZmYgLS1naXQgYS94ZW4vY29tbW9u
L3NwaW5sb2NrLmMgYi94ZW4vY29tbW9uL3NwaW5sb2NrLmMKaW5kZXggNzllNzBhOTk0Ny4uYzRm
NzA2YzYyNyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zcGlubG9jay5jCisrKyBiL3hlbi9jb21t
b24vc3BpbmxvY2suYwpAQCAtMTA2LDcgKzEwNiw3IEBAIHZvaWQgc3Bpbl9kZWJ1Z19kaXNhYmxl
KHZvaWQpCiAKICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVmIENP
TkZJR19ERUJVR19MT0NLX1BST0ZJTEUKIAogI2RlZmluZSBMT0NLX1BST0ZJTEVfUkVMICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgaWYg
KGxvY2stPnByb2ZpbGUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKQEAgLTI0Myw3ICsyNDMsNyBAQCBpbnQgX3NwaW5fdHJ5bG9jayhzcGlu
bG9ja190ICpsb2NrKQogICAgICAgICAgICAgICAgICBvbGQuaGVhZF90YWlsLCBuZXcuaGVhZF90
YWlsKSAhPSBvbGQuaGVhZF90YWlsICkKICAgICAgICAgcmV0dXJuIDA7CiAgICAgZ290X2xvY2so
JmxvY2stPmRlYnVnKTsKLSNpZmRlZiBDT05GSUdfTE9DS19QUk9GSUxFCisjaWZkZWYgQ09ORklH
X0RFQlVHX0xPQ0tfUFJPRklMRQogICAgIGlmIChsb2NrLT5wcm9maWxlKQogICAgICAgICBsb2Nr
LT5wcm9maWxlLT50aW1lX2xvY2tlZCA9IE5PVygpOwogI2VuZGlmCkBAIC0yNTgsNyArMjU4LDcg
QEAgaW50IF9zcGluX3RyeWxvY2soc3BpbmxvY2tfdCAqbG9jaykKIHZvaWQgX3NwaW5fYmFycmll
cihzcGlubG9ja190ICpsb2NrKQogewogICAgIHNwaW5sb2NrX3RpY2tldHNfdCBzYW1wbGU7Ci0j
aWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJ
TEUKICAgICBzX3RpbWVfdCBibG9jayA9IE5PVygpOwogI2VuZGlmCiAKQEAgLTI2OSw3ICsyNjks
NyBAQCB2b2lkIF9zcGluX2JhcnJpZXIoc3BpbmxvY2tfdCAqbG9jaykKICAgICB7CiAgICAgICAg
IHdoaWxlICggb2JzZXJ2ZV9oZWFkKCZsb2NrLT50aWNrZXRzKSA9PSBzYW1wbGUuaGVhZCApCiAg
ICAgICAgICAgICBhcmNoX2xvY2tfcmVsYXgoKTsKLSNpZmRlZiBDT05GSUdfTE9DS19QUk9GSUxF
CisjaWZkZWYgQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRQogICAgICAgICBpZiAoIGxvY2stPnBy
b2ZpbGUgKQogICAgICAgICB7CiAgICAgICAgICAgICBsb2NrLT5wcm9maWxlLT50aW1lX2Jsb2Nr
ICs9IE5PVygpIC0gYmxvY2s7CkBAIC0zMjcsNyArMzI3LDcgQEAgdm9pZCBfc3Bpbl91bmxvY2tf
cmVjdXJzaXZlKHNwaW5sb2NrX3QgKmxvY2spCiAgICAgfQogfQogCi0jaWZkZWYgQ09ORklHX0xP
Q0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUKIAogc3RydWN0IGxv
Y2tfcHJvZmlsZV9hbmMgewogICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgKmhlYWRfcTsg
ICAvKiBmaXJzdCBoZWFkIG9mIHRoaXMgdHlwZSAqLwpAQCAtMzYyLDE0ICszNjIsMTkgQEAgc3Rh
dGljIHZvaWQgc3BpbmxvY2tfcHJvZmlsZV9pdGVyYXRlKGxvY2tfcHJvZmlsZV9zdWJmdW5jICpz
dWIsIHZvaWQgKnBhcikKIHN0YXRpYyB2b2lkIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRfZWxlbShz
dHJ1Y3QgbG9ja19wcm9maWxlICpkYXRhLAogICAgIGludDMyX3QgdHlwZSwgaW50MzJfdCBpZHgs
IHZvaWQgKnBhcikKIHsKLSAgICBpZiAoIHR5cGUgPT0gTE9DS1BST0ZfVFlQRV9HTE9CQUwgKQot
ICAgICAgICBwcmludGsoIiVzICVzOlxuIiwgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSwg
ZGF0YS0+bmFtZSk7CisgICAgc3RydWN0IHNwaW5sb2NrICpsb2NrID0gZGF0YS0+bG9jazsKKwor
ICAgIHByaW50aygiJXMgIiwgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSk7CisgICAgaWYg
KCB0eXBlICE9IExPQ0tQUk9GX1RZUEVfR0xPQkFMICkKKyAgICAgICAgcHJpbnRrKCIlZCAiLCBp
ZHgpOworICAgIHByaW50aygiJXM6IGFkZHI9JXAsIGxvY2t2YWw9JTA4eCwgIiwgZGF0YS0+bmFt
ZSwgbG9jaywKKyAgICAgICAgICAgbG9jay0+dGlja2V0cy5oZWFkX3RhaWwpOworICAgIGlmICgg
bG9jay0+ZGVidWcuY3B1ID09IFNQSU5MT0NLX05PX0NQVSApCisgICAgICAgIHByaW50aygibm90
IGxvY2tlZFxuIik7CiAgICAgZWxzZQotICAgICAgICBwcmludGsoIiVzICVkICVzOlxuIiwgbG9j
a19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSwgaWR4LCBkYXRhLT5uYW1lKTsKLSAgICBwcmludGso
IiAgbG9jazolMTIiUFJJZDY0IiglMDhYOiUwOFgpLCBibG9jazolMTIiUFJJZDY0IiglMDhYOiUw
OFgpXG4iLAotICAgICAgICAgICBkYXRhLT5sb2NrX2NudCwgKHUzMikoZGF0YS0+dGltZV9ob2xk
ID4+IDMyKSwgKHUzMilkYXRhLT50aW1lX2hvbGQsCi0gICAgICAgICAgIGRhdGEtPmJsb2NrX2Nu
dCwgKHUzMikoZGF0YS0+dGltZV9ibG9jayA+PiAzMiksCi0gICAgICAgICAgICh1MzIpZGF0YS0+
dGltZV9ibG9jayk7CisgICAgICAgIHByaW50aygiY3B1PSVkXG4iLCBsb2NrLT5kZWJ1Zy5jcHUp
OworICAgIHByaW50aygiICBsb2NrOiUiIFBSSWQ2NCAiKCUiIFBSSV9zdGltZSAiKSwgYmxvY2s6
JSIgUFJJZDY0ICIoJSIgUFJJX3N0aW1lICIpXG4iLAorICAgICAgICAgICBkYXRhLT5sb2NrX2Nu
dCwgZGF0YS0+dGltZV9ob2xkLCBkYXRhLT5ibG9ja19jbnQsIGRhdGEtPnRpbWVfYmxvY2spOwog
fQogCiB2b2lkIHNwaW5sb2NrX3Byb2ZpbGVfcHJpbnRhbGwodW5zaWduZWQgY2hhciBrZXkpCkBA
IC00ODgsNyArNDkzLDYgQEAgdm9pZCBfbG9ja19wcm9maWxlX2RlcmVnaXN0ZXJfc3RydWN0KAog
ICAgIHNwaW5fdW5sb2NrKCZsb2NrX3Byb2ZpbGVfbG9jayk7CiB9CiAKLSNpZmRlZiBDT05GSUdf
TE9DS19QUk9GSUxFCiBzdGF0aWMgaW50IF9faW5pdCBsb2NrX3Byb2ZfaW5pdCh2b2lkKQogewog
ICAgIHN0cnVjdCBsb2NrX3Byb2ZpbGUgKipxOwpAQCAtNTA3LDYgKzUxMSw1IEBAIHN0YXRpYyBp
bnQgX19pbml0IGxvY2tfcHJvZl9pbml0KHZvaWQpCiAgICAgcmV0dXJuIDA7CiB9CiBfX2luaXRj
YWxsKGxvY2tfcHJvZl9pbml0KTsKLSNlbmRpZgogCi0jZW5kaWYgLyogTE9DS19QUk9GSUxFICov
CisjZW5kaWYgLyogQ09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRSAqLwpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zeXNjdGwuYyBiL3hlbi9jb21tb24vc3lzY3RsLmMKaW5kZXggNzY1ZWZmZGU4ZC4u
NDZhZWJlY2JkMyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYworKysgYi94ZW4vY29t
bW9uL3N5c2N0bC5jCkBAIC0xMTksNyArMTE5LDcgQEAgbG9uZyBkb19zeXNjdGwoWEVOX0dVRVNU
X0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQogICAgICAgICBicmVhazsKICNl
bmRpZgogCi0jaWZkZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19M
T0NLX1BST0ZJTEUKICAgICBjYXNlIFhFTl9TWVNDVExfbG9ja3Byb2Zfb3A6CiAgICAgICAgIHJl
dCA9IHNwaW5sb2NrX3Byb2ZpbGVfY29udHJvbCgmb3AtPnUubG9ja3Byb2Zfb3ApOwogICAgICAg
ICBicmVhazsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVuL2Ry
aXZlcnMvY2hhci9jb25zb2xlLmMKaW5kZXggMTY4MGQwNzhkYi4uNDA0ZDI4YTcyNSAxMDA2NDQK
LS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9j
b25zb2xlLmMKQEAgLTExNjcsNyArMTE2Nyw5IEBAIHZvaWQgcGFuaWMoY29uc3QgY2hhciAqZm10
LCAuLi4pCiAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKICAgICBzdGF0aWMgREVGSU5FX1NQSU5M
T0NLKGxvY2spOwogICAgIHN0YXRpYyBjaGFyIGJ1ZlsxMjhdOwotICAgIAorCisgICAgc3Bpbl9k
ZWJ1Z19kaXNhYmxlKCk7CisgICAgc3BpbmxvY2tfcHJvZmlsZV9wcmludGFsbCgnXDAnKTsKICAg
ICBkZWJ1Z3RyYWNlX2R1bXAoKTsKIAogICAgIC8qIFByb3RlY3RzIGJ1ZltdIGFuZCBlbnN1cmUg
bXVsdGktbGluZSBtZXNzYWdlIHByaW50cyBhdG9taWNhbGx5LiAqLwpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL3NwaW5sb2NrLmggYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaAppbmRl
eCBkZmEwYjcyZjhkLi4wYjAxMGZmNmFkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3Bp
bmxvY2suaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaApAQCAtMSw2ICsxLDcgQEAK
ICNpZm5kZWYgX19TUElOTE9DS19IX18KICNkZWZpbmUgX19TUElOTE9DS19IX18KIAorI2luY2x1
ZGUgPHhlbi90aW1lLmg+CiAjaW5jbHVkZSA8YXNtL3N5c3RlbS5oPgogI2luY2x1ZGUgPGFzbS9z
cGlubG9jay5oPgogI2luY2x1ZGUgPGFzbS90eXBlcy5oPgpAQCAtMjcsNyArMjgsNyBAQCB1bmlv
biBsb2NrX2RlYnVnIHsgfTsKICNkZWZpbmUgc3Bpbl9kZWJ1Z19kaXNhYmxlKCkgKCh2b2lkKTAp
CiAjZW5kaWYKIAotI2lmZGVmIENPTkZJR19MT0NLX1BST0ZJTEUKKyNpZmRlZiBDT05GSUdfREVC
VUdfTE9DS19QUk9GSUxFCiAKICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+CiAKQEAgLTczLDkg
Kzc0LDkgQEAgc3RydWN0IGxvY2tfcHJvZmlsZSB7CiAgICAgc3RydWN0IHNwaW5sb2NrICAgICAq
bG9jazsgICAgICAgLyogdGhlIGxvY2sgaXRzZWxmICovCiAgICAgdTY0ICAgICAgICAgICAgICAg
ICBsb2NrX2NudDsgICAgLyogIyBvZiBjb21wbGV0ZSBsb2NraW5nIG9wcyAqLwogICAgIHU2NCAg
ICAgICAgICAgICAgICAgYmxvY2tfY250OyAgIC8qICMgb2YgY29tcGxldGUgd2FpdCBmb3IgbG9j
ayAqLwotICAgIHM2NCAgICAgICAgICAgICAgICAgdGltZV9ob2xkOyAgIC8qIGN1bXVsYXRlZCBs
b2NrIHRpbWUgKi8KLSAgICBzNjQgICAgICAgICAgICAgICAgIHRpbWVfYmxvY2s7ICAvKiBjdW11
bGF0ZWQgd2FpdCB0aW1lICovCi0gICAgczY0ICAgICAgICAgICAgICAgICB0aW1lX2xvY2tlZDsg
Lyogc3lzdGVtIHRpbWUgb2YgbGFzdCBsb2NraW5nICovCisgICAgc190aW1lX3QgICAgICAgICAg
ICB0aW1lX2hvbGQ7ICAgLyogY3VtdWxhdGVkIGxvY2sgdGltZSAqLworICAgIHNfdGltZV90ICAg
ICAgICAgICAgdGltZV9ibG9jazsgIC8qIGN1bXVsYXRlZCB3YWl0IHRpbWUgKi8KKyAgICBzX3Rp
bWVfdCAgICAgICAgICAgIHRpbWVfbG9ja2VkOyAvKiBzeXN0ZW0gdGltZSBvZiBsYXN0IGxvY2tp
bmcgKi8KIH07CiAKIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgewpAQCAtMTMxLDYgKzEzMiw3
IEBAIHN0cnVjdCBsb2NrX3Byb2ZpbGVfcWhlYWQgeyB9OwogI2RlZmluZSBzcGluX2xvY2tfaW5p
dF9wcm9mKHMsIGwpIHNwaW5fbG9ja19pbml0KCYoKHMpLT5sKSkKICNkZWZpbmUgbG9ja19wcm9m
aWxlX3JlZ2lzdGVyX3N0cnVjdCh0eXBlLCBwdHIsIGlkeCwgcHJpbnQpCiAjZGVmaW5lIGxvY2tf
cHJvZmlsZV9kZXJlZ2lzdGVyX3N0cnVjdCh0eXBlLCBwdHIpCisjZGVmaW5lIHNwaW5sb2NrX3By
b2ZpbGVfcHJpbnRhbGwoa2V5KQogCiAjZW5kaWYKIApAQCAtMTUxLDcgKzE1Myw3IEBAIHR5cGVk
ZWYgc3RydWN0IHNwaW5sb2NrIHsKICAgICB1MTYgcmVjdXJzZV9jbnQ6NDsKICNkZWZpbmUgU1BJ
TkxPQ0tfTUFYX1JFQ1VSU0UgMHhmdQogICAgIHVuaW9uIGxvY2tfZGVidWcgZGVidWc7Ci0jaWZk
ZWYgQ09ORklHX0xPQ0tfUFJPRklMRQorI2lmZGVmIENPTkZJR19ERUJVR19MT0NLX1BST0ZJTEUK
ICAgICBzdHJ1Y3QgbG9ja19wcm9maWxlICpwcm9maWxlOwogI2VuZGlmCiB9IHNwaW5sb2NrX3Q7
Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
