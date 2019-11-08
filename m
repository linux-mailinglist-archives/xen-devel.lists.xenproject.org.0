Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD50F458F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 12:20:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT2Hh-0000XN-3G; Fri, 08 Nov 2019 11:18:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iT2Hg-0000XI-0x
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 11:18:32 +0000
X-Inumbo-ID: 7e53117a-0219-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e53117a-0219-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 11:18:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3914B23A;
 Fri,  8 Nov 2019 11:18:29 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
Date: Fri, 8 Nov 2019 12:18:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] build: provide option to disambiguate symbol
 names
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIC5maWxlIGFzc2VtYmxlciBkaXJlY3RpdmVzIGdlbmVyYXRlZCBieSB0aGUgY29tcGlsZXIg
ZG8gbm90IGluY2x1ZGUKYW55IHBhdGggY29tcG9uZW50cyAoZ2NjKSBvciBqdXN0IHRoZSBvbmVz
IHNwZWNpZmllZCBvbiB0aGUgY29tbWFuZCBsaW5lCihjbGFuZywgYXQgbGVhc3QgdmVyc2lvbiA1
KSwgYW5kIGhlbmNlIG11bHRpcGxlIGlkZW50aWNhbGx5IG5hbWVkIHNvdXJjZQpmaWxlcyAoaW4g
ZGlmZmVyZW50IGRpcmVjdG9yaWVzKSBtYXkgcHJvZHVjZSBpZGVudGljYWxseSBuYW1lZCBzdGF0
aWMKc3ltYm9scyAoaW4gdGhlaXIga2FsbHN5bXMgcmVwcmVzZW50YXRpb24pLiBUaGUgYmluYXJ5
IGRpZmZpbmcgYWxnb3JpdGhtCnVzZWQgYnkgeGVuLWxpdmVwYXRjaCwgaG93ZXZlciwgZGVwZW5k
cyBvbiBoYXZpbmcgdW5pcXVlIHN5bWJvbHMuCgpNYWtlIHRoZSBFTkZPUkNFX1VOSVFVRV9TWU1C
T0xTIEtjb25maWcgb3B0aW9uIGNvbnRyb2wgdGhlIChidWlsZCkKYmVoYXZpb3IsIGFuZCBpZiBl
bmFibGVkIHVzZSBvYmpjb3B5IHRvIHByZXBlbmQgdGhlIChyZWxhdGl2ZSB0byB0aGUKeGVuLyBz
dWJkaXJlY3RvcnkpIHBhdGggdG8gdGhlIGNvbXBpbGVyIGludm9rZWQgU1RUX0ZJTEUgc3ltYm9s
cy4gTm90ZQp0aGF0IHRoaXMgYnVpbGQgb3B0aW9uIGlzIG1hZGUgbm8gbG9uZ2VyIGRlcGVuZCBv
biBMSVZFUEFUQ0gsIGJ1dCBtZXJlbHkKZGVmYXVsdHMgdG8gaXRzIHNldHRpbmcgbm93LgoKQ29u
ZGl0aW9uYWxpemUgZXhwbGljaXQgLmZpbGUgZGlyZWN0aXZlIGluc2VydGlvbiBpbiBDIGZpbGVz
IHdoZXJlIGl0CmV4aXN0cyBqdXN0IHRvIGRpc2FtYmlndWF0ZSBuYW1lcyBpbiBhIGxlc3MgZ2Vu
ZXJpYyBtYW5uZXI7IG5vdGUgdGhhdAphdCB0aGUgc2FtZSB0aW1lIHRoZSByZWR1bmRhbnQgZW1p
c3Npb24gb2YgU1RUX0ZJTEUgc3ltYm9scyBnZXRzCnN1cHByZXNzZWQgZm9yIGNsYW5nLiBBc3Nl
bWJsZXIgZmlsZXMgYXMgd2VsbCBhcyBtdWx0aXBseSBjb21waWxlZCBDCm9uZXMgdXNpbmcgX19P
QkpFQ1RfRklMRV9fIGFyZSBsZWZ0IGFsb25lIGZvciB0aGUgdGltZSBiZWluZy4KClNpbmNlIHdl
IG5vdyBleHBlY3QgdGhlcmUgbm90IHRvIGJlIGFueSBkdXBsaWNhdGVzIGFueW1vcmUsIGFsc28g
ZG9uJ3QKZm9yY2UgdGhlIHNlbGVjdGlvbiBvZiB0aGUgb3B0aW9uIHRvICduJyBhbnltb3JlIGlu
IGFsbHJhbmRvbS5jb25maWcuClNpbWlsYXJseSBDT1ZFUkFHRSBubyBsb25nZXIgc3VwcHJlc3Nl
cyBkdXBsaWNhdGUgc3ltYm9sIHdhcm5pbmdzIGlmCmVuZm9yY2VtZW50IGlzIGluIGVmZmVjdCwg
d2hpY2ggaW4gdHVybiBhbGxvd3MKU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyB0
byBzaW1wbHkgZGVwZW5kIG9uCiFFTkZPUkNFX1VOSVFVRV9TWU1CT0xTLgoKU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KdjI6IFJlLWJhc2UuIENvbmRp
dGlvbmFsaXplIENPVkVSQUdFJ3Mgc2VsZWN0LgoKVGhlIGNsYW5nIGJlaGF2aW9yIG1heSByZXF1
aXJlIGZ1cnRoZXIgdHdlYWtpbmcgaWYgZGlmZmVyZW50IHZlcnNpb25zCmJlaGF2ZSBkaWZmZXJl
bnRseS4gQWx0ZXJuYXRpdmVseSB3ZSBjb3VsZCBwYXNzIHR3byAtLXJlZGVmaW5lLXN5bQphcmd1
bWVudHMgdG8gb2JqY29weS4KCi0tLSBhL3hlbi9LY29uZmlnLmRlYnVnCisrKyBiL3hlbi9LY29u
ZmlnLmRlYnVnCkBAIC0zOCw3ICszOCw3IEBAIGNvbmZpZyBGUkFNRV9QT0lOVEVSCiBjb25maWcg
Q09WRVJBR0UKIAlib29sICJDb2RlIGNvdmVyYWdlIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiAhTElW
RVBBVENICi0Jc2VsZWN0IFNVUFBSRVNTX0RVUExJQ0FURV9TWU1CT0xfV0FSTklOR1MKKwlzZWxl
Y3QgU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUyBpZiAhRU5GT1JDRV9VTklRVUVf
U1lNQk9MUwogCS0tLWhlbHAtLS0KIAkgIEVuYWJsZSBjb2RlIGNvdmVyYWdlIHN1cHBvcnQuCiAK
LS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9SdWxlcy5tawpAQCAtMTk0LDEyICsxOTQsMjQg
QEAgRk9SQ0U6CiAKIC5QSE9OWTogY2xlYW4KIGNsZWFuOjogJChhZGRwcmVmaXggX2NsZWFuXywg
JChzdWJkaXItYWxsKSkKLQlybSAtZiAqLm8gKn4gY29yZSAkKERFUFNfUk0pCisJcm0gLWYgKi5v
IC4qLm8udG1wICp+IGNvcmUgJChERVBTX1JNKQogX2NsZWFuXyUvOiBGT1JDRQogCSQoTUFLRSkg
LWYgJChCQVNFRElSKS9SdWxlcy5tayAtQyAkKiBjbGVhbgogCitTUkNQQVRIIDo9ICQocGF0c3Vi
c3QgJChCQVNFRElSKS8lLCUsJChDVVJESVIpKQorCiAlLm86ICUuYyBNYWtlZmlsZQoraWZlcSAo
JChDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUykseSkKKwkkKENDKSAkKENGTEFHUykgLWMg
JDwgLW8gJChARCkvLiQoQEYpLnRtcAoraWZlcSAoJChjbGFuZykseSkKKwkkKE9CSkNPUFkpIC0t
cmVkZWZpbmUtc3ltICQ8PSQoU1JDUEFUSCkvJDwgJChARCkvLiQoQEYpLnRtcCAkQAorZWxzZQor
CSQoT0JKQ09QWSkgLS1yZWRlZmluZS1zeW0gJCg8Rik9JChTUkNQQVRIKS8kPCAkKEBEKS8uJChA
RikudG1wICRACitlbmRpZgorCXJtIC1mICQoQEQpLy4kKEBGKS50bXAKK2Vsc2UKIAkkKENDKSAk
KENGTEFHUykgLWMgJDwgLW8gJEAKK2VuZGlmCiAKICUubzogJS5TIE1ha2VmaWxlCiAJJChDQykg
JChBRkxBR1MpIC1jICQ8IC1vICRACi0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvY29tcGF0LmMK
KysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9jb21wYXQuYwpAQCAtMiw3ICsyLDcgQEAKICAqIGNv
bXBhdC5jCiAgKi8KIAotYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7CitFTUlUX0ZJTEU7
CiAKICNpbmNsdWRlIDx4ZW4vaHlwZXJjYWxsLmg+CiAjaW5jbHVkZSA8Y29tcGF0L3hlbi5oPgot
LS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9t
bS5jCkBAIC0xNiw3ICsxNiw3IEBACiAgKiB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgogICovCiAKLWFzbSgiLmZpbGUgXCIiIF9f
RklMRV9fICJcIiIpOworRU1JVF9GSUxFOwogCiAjaW5jbHVkZSA8eGVuL2xpYi5oPgogI2luY2x1
ZGUgPHhlbi9pbml0Lmg+Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGh5c2Rldi5jCisrKyBi
L3hlbi9hcmNoL3g4Ni94ODZfNjQvcGh5c2Rldi5jCkBAIC0yLDcgKzIsNyBAQAogICogcGh5c2Rl
di5jCiAgKi8KIAotYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7CitFTUlUX0ZJTEU7CiAK
ICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+Ci0t
LSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGxhdGZvcm1faHlwZXJjYWxsLmMKKysrIGIveGVuL2Fy
Y2gveDg2L3g4Nl82NC9wbGF0Zm9ybV9oeXBlcmNhbGwuYwpAQCAtMiw3ICsyLDcgQEAKICAqIHBs
YXRmb3JtX2h5cGVyY2FsbC5jCiAgKi8KIAotYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7
CitFTUlUX0ZJTEU7CiAKICNpbmNsdWRlIDx4ZW4vbGliLmg+CiAjaW5jbHVkZSA8Y29tcGF0L3Bs
YXRmb3JtLmg+Ci0tLSBhL3hlbi9jb21tb24vS2NvbmZpZworKysgYi94ZW4vY29tbW9uL0tjb25m
aWcKQEAgLTM3Myw4ICszNzMsNyBAQCBjb25maWcgRkFTVF9TWU1CT0xfTE9PS1VQCiAKIGNvbmZp
ZyBFTkZPUkNFX1VOSVFVRV9TWU1CT0xTCiAJYm9vbCAiRW5mb3JjZSB1bmlxdWUgc3ltYm9scyIK
LQlkZWZhdWx0IHkKLQlkZXBlbmRzIG9uIExJVkVQQVRDSAorCWRlZmF1bHQgTElWRVBBVENICiAJ
LS0taGVscC0tLQogCSAgTXVsdGlwbGUgc3ltYm9scyB3aXRoIHRoZSBzYW1lIG5hbWUgYXJlbid0
IGdlbmVyYWxseSBhIHByb2JsZW0KIAkgIHVubGVzcyBsaXZlcGF0Y2hpbmcgaXMgdG8gYmUgdXNl
ZC4KQEAgLTM4Nyw4ICszODYsOCBAQCBjb25maWcgRU5GT1JDRV9VTklRVUVfU1lNQk9MUwogCSAg
bGl2ZXBhdGNoIGJ1aWxkIGFuZCBhcHBseSBjb3JyZWN0bHkuCiAKIGNvbmZpZyBTVVBQUkVTU19E
VVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTCi0JYm9vbCAiU3VwcHJlc3MgZHVwbGljYXRlIHN5bWJv
bCB3YXJuaW5ncyIgaWYgIUVORk9SQ0VfVU5JUVVFX1NZTUJPTFMKLQlkZWZhdWx0IHkgaWYgIUVO
Rk9SQ0VfVU5JUVVFX1NZTUJPTFMKKwlib29sICJTdXBwcmVzcyBkdXBsaWNhdGUgc3ltYm9sIHdh
cm5pbmdzIgorCWRlcGVuZHMgb24gIUVORk9SQ0VfVU5JUVVFX1NZTUJPTFMKIAktLS1oZWxwLS0t
CiAJICBNdWx0aXBsZSBzeW1ib2xzIHdpdGggdGhlIHNhbWUgbmFtZSBhcmVuJ3QgZ2VuZXJhbGx5
IGEgcHJvYmxlbQogCSAgdW5sZXNzIExpdmUgcGF0Y2hpbmcgaXMgdG8gYmUgdXNlZCwgc28gdGhl
c2Ugd2FybmluZ3MgY2FuIGJlCi0tLSBhL3hlbi9jb21tb24vY29tcGF0L2RvbWFpbi5jCisrKyBi
L3hlbi9jb21tb24vY29tcGF0L2RvbWFpbi5jCkBAIC0zLDcgKzMsNyBAQAogICoKICAqLwogCi1h
c20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKK0VNSVRfRklMRTsKIAogI2luY2x1ZGUgPHhl
bi9saWIuaD4KICNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KLS0tIGEveGVuL2NvbW1vbi9jb21wYXQv
a2VybmVsLmMKKysrIGIveGVuL2NvbW1vbi9jb21wYXQva2VybmVsLmMKQEAgLTIsNyArMiw3IEBA
CiAgKiBrZXJuZWwuYwogICovCiAKLWFzbSgiLmZpbGUgXCIiIF9fRklMRV9fICJcIiIpOworRU1J
VF9GSUxFOwogCiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KICNpbmNsdWRlIDx4ZW4vbGliLmg+Ci0t
LSBhL3hlbi9jb21tb24vY29tcGF0L21lbW9yeS5jCisrKyBiL3hlbi9jb21tb24vY29tcGF0L21l
bW9yeS5jCkBAIC0xLDQgKzEsNCBAQAotYXNtKCIuZmlsZSBcIiIgX19GSUxFX18gIlwiIik7CitF
TUlUX0ZJTEU7CiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KICNpbmNsdWRlIDx4ZW4vaHlwZXJj
YWxsLmg+Ci0tLSBhL3hlbi9jb21tb24vY29tcGF0L211bHRpY2FsbC5jCisrKyBiL3hlbi9jb21t
b24vY29tcGF0L211bHRpY2FsbC5jCkBAIC0yLDcgKzIsNyBAQAogICogbXVsdGljYWxsLmMKICAq
LwogCi1hc20oIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiKTsKK0VNSVRfRklMRTsKIAogI2luY2x1
ZGUgPHhlbi90eXBlcy5oPgogI2luY2x1ZGUgPHhlbi9tdWx0aWNhbGwuaD4KLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2NvbmZpZy5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaApAQCAtMTEs
NyArMTEsMTUgQEAKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KICNpbmNsdWRlIDx4ZW4vY29tcGls
ZXIuaD4KKworI2lmIGRlZmluZWQoQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFMpIHx8IGRl
ZmluZWQoX19jbGFuZ19fKQorIyBkZWZpbmUgRU1JVF9GSUxFIGFzbSAoICIiICkKKyNlbHNlCisj
IGRlZmluZSBFTUlUX0ZJTEUgYXNtICggIi5maWxlIFwiIiBfX0ZJTEVfXyAiXCIiICkKKyNlbmRp
ZgorCiAjZW5kaWYKKwogI2luY2x1ZGUgPGFzbS9jb25maWcuaD4KIAogI2RlZmluZSBFWFBPUlRf
U1lNQk9MKHZhcikKLS0tIGEveGVuL3Rvb2xzL2tjb25maWcvYWxscmFuZG9tLmNvbmZpZworKysg
Yi94ZW4vdG9vbHMva2NvbmZpZy9hbGxyYW5kb20uY29uZmlnCkBAIC0yLDQgKzIsMyBAQAogCiBD
T05GSUdfR0NPVl9GT1JNQVRfQVVUT0RFVEVDVD15CiBDT05GSUdfVUJTQU49bgotQ09ORklHX0VO
Rk9SQ0VfVU5JUVVFX1NZTUJPTFM9bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
