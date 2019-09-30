Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85AC1AE8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 07:24:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEo8e-0002UE-Dy; Mon, 30 Sep 2019 05:22:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEo8c-0002S9-Ix
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 05:22:22 +0000
X-Inumbo-ID: 31b6aa72-e342-11e9-96c8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 31b6aa72-e342-11e9-96c8-12813bfff9fa;
 Mon, 30 Sep 2019 05:21:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85B9CB12A;
 Mon, 30 Sep 2019 05:21:44 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 07:21:35 +0200
Message-Id: <20190930052135.11257-20-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190930052135.11257-1-jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 19/19] xen/sched: add scheduling granularity
 enum
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

QWRkIGEgc2NoZWR1bGluZyBncmFudWxhcml0eSBlbnVtICgiY3B1IiwgImNvcmUiLCAic29ja2V0
IikgZm9yCnNwZWNpZmljYXRpb24gb2YgdGhlIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkuIEluaXRp
YWxseSBpdCBpcyBzZXQgdG8KImNwdSIsIHRoaXMgY2FuIGJlIG1vZGlmaWVkIGJ5IHRoZSBuZXcg
Ym9vdCBwYXJhbWV0ZXIgKHg4NiBvbmx5KQoic2NoZWQtZ3JhbiIuCgpBY2NvcmRpbmcgdG8gdGhl
IHNlbGVjdGVkIGdyYW51bGFyaXR5IHNjaGVkX2dyYW51bGFyaXR5IGlzIHNldCBhZnRlcgphbGwg
Y3B1cyBhcmUgb25saW5lLgoKQSB0ZXN0IGlzIGFkZGVkIGZvciBhbGwgc2NoZWQgcmVzb3VyY2Vz
IGhvbGRpbmcgdGhlIHNhbWUgbnVtYmVyIG9mCmNwdXMuIEZhbGwgYmFjayB0byBjb3JlLSBvciBj
cHUtc2NoZWR1bGluZyBpbiB0aGF0IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xp
QHN1c2UuY29tPgotLS0KUkZDIFYyOgotIGZpeGVkIGZyZWVpbmcgb2Ygc2NoZWRfcmVzIHdoZW4g
bWVyZ2luZyBjcHVzCi0gcmVuYW1lIHBhcmFtZXRlciB0byAic2NoZWQtZ3JhbiIgKEphbiBCZXVs
aWNoKQotIHJlbmFtZSBwYXJhbWV0ZXIgb3B0aW9uIGZyb20gInRocmVhZCIgdG8gImNwdSIgKEph
biBCZXVsaWNoKQoKVjE6Ci0gcmVuYW1lIHNjaGVkdWxlcl9zbXBfaW5pdCgpIHRvIHNjaGVkdWxl
cl9ncmFuX2luaXQoKSwgbGV0IGl0IGJlIGNhbGxlZAogIGJ5IGNwdXBvb2xfaW5pdCgpCi0gYXZv
aWQgdXNpbmcgbGl0ZXJhbCBjcHUgbnVtYmVyIDAgaW4gc2NoZWR1bGVyX3BlcmNwdV9pbml0KCkg
KEphbiBCZXVsaWNoKQotIHN0eWxlIGNvcnJlY3Rpb24gKEphbiBCZXVsaWNoKQotIGZhbGxiYWNr
IHRvIHNtYWxsZXIgZ3JhbnVsYXJpdHkgaW5zdGVhZCBvZiBwYW5pYyBpbiBjYXNlIG9mCiAgdW5i
YWxhbmNlZCBjcHUgY29uZmlndXJhdGlvbgoKVjI6Ci0gc3R5bGUgY2hhbmdlcyAoSmFuIEJldWxp
Y2gpCi0gaW50cm9kdWNlIENPTkZJR19IQVNfU0NIRURfR1JBTlVMQVJJVFkgKEphbiBCZXVsaWNo
KQoKVjQ6Ci0gbW92ZSBjb2RlIHRvIGNwdXBvb2wuYwotLS0KIHhlbi9hcmNoL3g4Ni9LY29uZmln
IHwgIDEgKwogeGVuL2NvbW1vbi9LY29uZmlnICAgfCAgMyArKwogeGVuL2NvbW1vbi9jcHVwb29s
LmMgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAzIGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvS2NvbmZpZyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCmluZGV4IDI4OGRjNmMwNDIu
LjNmODhhZGFlOTcgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCisrKyBiL3hlbi9h
cmNoL3g4Ni9LY29uZmlnCkBAIC0yMiw2ICsyMiw3IEBAIGNvbmZpZyBYODYKIAlzZWxlY3QgSEFT
X1BBU1NUSFJPVUdICiAJc2VsZWN0IEhBU19QQ0kKIAlzZWxlY3QgSEFTX1BEWAorCXNlbGVjdCBI
QVNfU0NIRURfR1JBTlVMQVJJVFkKIAlzZWxlY3QgSEFTX1VCU0FOCiAJc2VsZWN0IEhBU19WUENJ
IGlmICFQVl9TSElNX0VYQ0xVU0lWRSAmJiBIVk0KIAlzZWxlY3QgTkVFRFNfTElCRUxGCmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tjb25maWcKaW5kZXggMTY4
MjlmNjI3NC4uZTkyNDc4NzFhOCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBi
L3hlbi9jb21tb24vS2NvbmZpZwpAQCAtNjMsNiArNjMsOSBAQCBjb25maWcgSEFTX0dEQlNYCiBj
b25maWcgSEFTX0lPUE9SVFMKIAlib29sCiAKK2NvbmZpZyBIQVNfU0NIRURfR1JBTlVMQVJJVFkK
Kwlib29sCisKIGNvbmZpZyBORUVEU19MSUJFTEYKIAlib29sCiAKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9jcHVwb29sLmMKaW5kZXggZjdhMTNjN2E0Yy4u
NGQzYWRiZGQ4ZCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jcHVwb29sLmMKKysrIGIveGVuL2Nv
bW1vbi9jcHVwb29sLmMKQEAgLTE3LDYgKzE3LDcgQEAKICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+
CiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CiAjaW5jbHVkZSA8eGVuL3NjaGVkLWlmLmg+CisjaW5j
bHVkZSA8eGVuL3dhcm5pbmcuaD4KICNpbmNsdWRlIDx4ZW4va2V5aGFuZGxlci5oPgogI2luY2x1
ZGUgPHhlbi9jcHUuaD4KIApAQCAtMzcsNiArMzgsODMgQEAgc3RhdGljIERFRklORV9TUElOTE9D
SyhjcHVwb29sX2xvY2spOwogc3RhdGljIGVudW0gc2NoZWRfZ3JhbiBfX3JlYWRfbW9zdGx5IG9w
dF9zY2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5fY3B1Owogc3RhdGljIHVuc2lnbmVkIGlu
dCBfX3JlYWRfbW9zdGx5IHNjaGVkX2dyYW51bGFyaXR5ID0gMTsKIAorI2lmZGVmIENPTkZJR19I
QVNfU0NIRURfR1JBTlVMQVJJVFkKK3N0YXRpYyBpbnQgX19pbml0IHNjaGVkX3NlbGVjdF9ncmFu
dWxhcml0eShjb25zdCBjaGFyICpzdHIpCit7CisgICAgaWYgKCBzdHJjbXAoImNwdSIsIHN0cikg
PT0gMCApCisgICAgICAgIG9wdF9zY2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5fY3B1Owor
ICAgIGVsc2UgaWYgKCBzdHJjbXAoImNvcmUiLCBzdHIpID09IDAgKQorICAgICAgICBvcHRfc2No
ZWRfZ3JhbnVsYXJpdHkgPSBTQ0hFRF9HUkFOX2NvcmU7CisgICAgZWxzZSBpZiAoIHN0cmNtcCgi
c29ja2V0Iiwgc3RyKSA9PSAwICkKKyAgICAgICAgb3B0X3NjaGVkX2dyYW51bGFyaXR5ID0gU0NI
RURfR1JBTl9zb2NrZXQ7CisgICAgZWxzZQorICAgICAgICByZXR1cm4gLUVJTlZBTDsKKworICAg
IHJldHVybiAwOworfQorY3VzdG9tX3BhcmFtKCJzY2hlZC1ncmFuIiwgc2NoZWRfc2VsZWN0X2dy
YW51bGFyaXR5KTsKKyNlbmRpZgorCitzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdCBjcHVwb29s
X2NoZWNrX2dyYW51bGFyaXR5KHZvaWQpCit7CisgICAgdW5zaWduZWQgaW50IGNwdTsKKyAgICB1
bnNpZ25lZCBpbnQgc2libGluZ3MsIGdyYW4gPSAwOworCisgICAgaWYgKCBvcHRfc2NoZWRfZ3Jh
bnVsYXJpdHkgPT0gU0NIRURfR1JBTl9jcHUgKQorICAgICAgICByZXR1cm4gMTsKKworICAgIGZv
cl9lYWNoX29ubGluZV9jcHUgKCBjcHUgKQorICAgIHsKKyAgICAgICAgc2libGluZ3MgPSBjcHVt
YXNrX3dlaWdodChzY2hlZF9nZXRfb3B0X2NwdW1hc2sob3B0X3NjaGVkX2dyYW51bGFyaXR5LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
cHUpKTsKKyAgICAgICAgaWYgKCBncmFuID09IDAgKQorICAgICAgICAgICAgZ3JhbiA9IHNpYmxp
bmdzOworICAgICAgICBlbHNlIGlmICggZ3JhbiAhPSBzaWJsaW5ncyApCisgICAgICAgICAgICBy
ZXR1cm4gMDsKKyAgICB9CisKKyAgICBzY2hlZF9kaXNhYmxlX3NtdF9zd2l0Y2hpbmcgPSB0cnVl
OworCisgICAgcmV0dXJuIGdyYW47Cit9CisKKy8qIFNldHVwIGRhdGEgZm9yIHNlbGVjdGVkIHNj
aGVkdWxlciBncmFudWxhcml0eS4gKi8KK3N0YXRpYyB2b2lkIF9faW5pdCBjcHVwb29sX2dyYW5f
aW5pdCh2b2lkKQoreworICAgIHVuc2lnbmVkIGludCBncmFuID0gMDsKKyAgICBjb25zdCBjaGFy
ICpmYWxsYmFjayA9IE5VTEw7CisKKyAgICB3aGlsZSAoIGdyYW4gPT0gMCApCisgICAgeworICAg
ICAgICBncmFuID0gY3B1cG9vbF9jaGVja19ncmFudWxhcml0eSgpOworCisgICAgICAgIGlmICgg
Z3JhbiA9PSAwICkKKyAgICAgICAgeworICAgICAgICAgICAgc3dpdGNoICggb3B0X3NjaGVkX2dy
YW51bGFyaXR5ICkKKyAgICAgICAgICAgIHsKKyAgICAgICAgICAgIGNhc2UgU0NIRURfR1JBTl9j
b3JlOgorICAgICAgICAgICAgICAgIG9wdF9zY2hlZF9ncmFudWxhcml0eSA9IFNDSEVEX0dSQU5f
Y3B1OworICAgICAgICAgICAgICAgIGZhbGxiYWNrID0gIkFzeW1tZXRyaWMgY3B1IGNvbmZpZ3Vy
YXRpb24uXG4iCisgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFsbGluZyBiYWNrIHRvIHNj
aGVkLWdyYW49Y3B1LlxuIjsKKyAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAgIGNh
c2UgU0NIRURfR1JBTl9zb2NrZXQ6CisgICAgICAgICAgICAgICAgb3B0X3NjaGVkX2dyYW51bGFy
aXR5ID0gU0NIRURfR1JBTl9jb3JlOworICAgICAgICAgICAgICAgIGZhbGxiYWNrID0gIkFzeW1t
ZXRyaWMgY3B1IGNvbmZpZ3VyYXRpb24uXG4iCisgICAgICAgICAgICAgICAgICAgICAgICAgICAi
RmFsbGluZyBiYWNrIHRvIHNjaGVkLWdyYW49Y29yZS5cbiI7CisgICAgICAgICAgICAgICAgYnJl
YWs7CisgICAgICAgICAgICBkZWZhdWx0OgorICAgICAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNI
QUJMRSgpOworICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgfQorICAgICAgICB9
CisgICAgfQorCisgICAgaWYgKCBmYWxsYmFjayApCisgICAgICAgIHdhcm5pbmdfYWRkKGZhbGxi
YWNrKTsKKworICAgIHNjaGVkX2dyYW51bGFyaXR5ID0gZ3JhbjsKK30KKwogdW5zaWduZWQgaW50
IGNwdXBvb2xfZ2V0X2dyYW51bGFyaXR5KGNvbnN0IHN0cnVjdCBjcHVwb29sICpjKQogewogICAg
IHJldHVybiBjID8gc2NoZWRfZ3JhbnVsYXJpdHkgOiAxOwpAQCAtODcxLDYgKzk0OSw4IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNwdXBvb2xfaW5pdCh2b2lkKQogICAgIHVuc2lnbmVkIGludCBjcHU7
CiAgICAgaW50IGVycjsKIAorICAgIGNwdXBvb2xfZ3Jhbl9pbml0KCk7CisKICAgICBjcHVwb29s
MCA9IGNwdXBvb2xfY3JlYXRlKDAsIDAsICZlcnIpOwogICAgIEJVR19PTihjcHVwb29sMCA9PSBO
VUxMKTsKICAgICBjcHVwb29sX3B1dChjcHVwb29sMCk7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
