Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064D17372F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 13:29:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7ej1-0000Pb-6b; Fri, 28 Feb 2020 12:26:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7eiz-0000PL-M9
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 12:26:37 +0000
X-Inumbo-ID: 8fc238be-5a25-11ea-991c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fc238be-5a25-11ea-991c-12813bfff9fa;
 Fri, 28 Feb 2020 12:26:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4ACDDB00D;
 Fri, 28 Feb 2020 12:26:35 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Message-ID: <96db3325-fdc0-366a-5b14-e38d61dc0e9c@suse.com>
Date: Fri, 28 Feb 2020 13:26:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/5] IOMMU: iommu_intpost is x86/HVM-only
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBhICNkZWZpbmUgZm9yIGFsbCBvdGhlciBjYXNlcy4KClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKQEAg
LTEzMDksNiArMTMwOSw5IEBAIGJvb2xlYW4gKGUuZy4gYGlvbW11PW5vYCkgY2FuIG92ZXJyaWRl
IHQKICAgICBUaGlzIG9wdGlvbiBkZXBlbmRzIG9uIGBpbnRyZW1hcGAsIGFuZCBpcyBkaXNhYmxl
ZCBieSBkZWZhdWx0IGR1ZSB0byBzb21lCiAgICAgY29ybmVyIGNhc2VzIGluIHRoZSBpbXBsZW1l
bnRhdGlvbiB3aGljaCBoYXZlIHlldCB0byBiZSByZXNvbHZlZC4KIAorICAgIFRoaXMgb3B0aW9u
IGlzIG5vdCB2YWxpZCBvbiBBcm0sIG9yIG9uIHg4NiBidWlsZHMgb2YgWGVuIHdpdGhvdXQgSFZN
CisgICAgc3VwcG9ydC4KKwogKiAgIFRoZSBgY3Jhc2gtZGlzYWJsZWAgYm9vbGVhbiBjb250cm9s
cyBkaXNhYmxpbmcgSU9NTVUgZnVuY3Rpb25hbGl0eSAoRE1BUi9JUi9RSSkKICAgICBiZWZvcmUg
c3dpdGNoaW5nIHRvIGEgY3Jhc2gga2VybmVsLiBUaGlzIG9wdGlvbiBpcyBpbmFjdGl2ZSBieSBk
ZWZhdWx0IGFuZAogICAgIGlzIGZvciBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIga2R1bXAga2Vy
bmVscyBvbmx5LiBNb2Rlcm4ga2VybmVscyBjb3B5Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwpAQCAtNDMs
MTQgKzQzLDYgQEAgYm9vbCBfX3JlYWRfbW9zdGx5IGlvbW11X2h3ZG9tX3Bhc3N0aHJvdQogYm9v
bCBfX2h3ZG9tX2luaXRkYXRhIGlvbW11X2h3ZG9tX2luY2x1c2l2ZTsKIGludDhfdCBfX2h3ZG9t
X2luaXRkYXRhIGlvbW11X2h3ZG9tX3Jlc2VydmVkID0gLTE7CiAKLS8qCi0gKiBJbiB0aGUgY3Vy
cmVudCBpbXBsZW1lbnRhdGlvbiBvZiBWVC1kIHBvc3RlZCBpbnRlcnJ1cHRzLCBpbiBzb21lIGV4
dHJlbWUKLSAqIGNhc2VzLCB0aGUgcGVyIGNwdSBsaXN0IHdoaWNoIHNhdmVzIHRoZSBibG9ja2Vk
IHZDUFUgd2lsbCBiZSB2ZXJ5IGxvbmcsCi0gKiBhbmQgdGhpcyB3aWxsIGFmZmVjdCB0aGUgaW50
ZXJydXB0IGxhdGVuY3ksIHNvIGxldCB0aGlzIGZlYXR1cmUgb2ZmIGJ5Ci0gKiBkZWZhdWx0IHVu
dGlsIHdlIGZpbmQgYSBnb29kIHNvbHV0aW9uIHRvIHJlc29sdmUgaXQuCi0gKi8KLWJvb2xfdCBf
X3JlYWRfbW9zdGx5IGlvbW11X2ludHBvc3Q7Ci0KICNpZm5kZWYgaW9tbXVfaGFwX3B0X3NoYXJl
CiBib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfaGFwX3B0X3NoYXJlID0gdHJ1ZTsKICNlbmRpZgpA
QCAtOTMsOCArODUsMTAgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfaW9tbXVfcGFyYW0oY29u
cwogICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImludHJlbWFwIiwgcywg
c3MpKSA+PSAwICkKICAgICAgICAgICAgIGlvbW11X2ludHJlbWFwID0gdmFsID8gaW9tbXVfaW50
cmVtYXBfZnVsbCA6IGlvbW11X2ludHJlbWFwX29mZjsKICNlbmRpZgorI2lmbmRlZiBpb21tdV9p
bnRwb3N0CiAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigiaW50cG9zdCIs
IHMsIHNzKSkgPj0gMCApCiAgICAgICAgICAgICBpb21tdV9pbnRwb3N0ID0gdmFsOworI2VuZGlm
CiAjaWZkZWYgQ09ORklHX0tFWEVDCiAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9v
bGVhbigiY3Jhc2gtZGlzYWJsZSIsIHMsIHNzKSkgPj0gMCApCiAgICAgICAgICAgICBpb21tdV9j
cmFzaF9kaXNhYmxlID0gdmFsOwpAQCAtNDg2LDggKzQ4MCwxMCBAQCBpbnQgX19pbml0IGlvbW11
X3NldHVwKHZvaWQpCiAgICAgICAgIHBhbmljKCJDb3VsZG4ndCBlbmFibGUgJXMgYW5kIGlvbW11
PXJlcXVpcmVkL2ZvcmNlXG4iLAogICAgICAgICAgICAgICAhaW9tbXVfZW5hYmxlZCA/ICJJT01N
VSIgOiAiSW50ZXJydXB0IFJlbWFwcGluZyIpOwogCisjaWZuZGVmIGlvbW11X2ludHBvc3QKICAg
ICBpZiAoICFpb21tdV9pbnRyZW1hcCApCiAgICAgICAgIGlvbW11X2ludHBvc3QgPSAwOworI2Vu
ZGlmCiAKICAgICBwcmludGsoIkkvTyB2aXJ0dWFsaXNhdGlvbiAlc2FibGVkXG4iLCBpb21tdV9l
bmFibGVkID8gImVuIiA6ICJkaXMiKTsKICAgICBpZiAoICFpb21tdV9lbmFibGVkICkKQEAgLTU2
MywxMCArNTU5LDEzIEBAIHZvaWQgaW9tbXVfY3Jhc2hfc2h1dGRvd24odm9pZCkKIAogICAgIGlm
ICggaW9tbXVfZW5hYmxlZCApCiAgICAgICAgIGlvbW11X2dldF9vcHMoKS0+Y3Jhc2hfc2h1dGRv
d24oKTsKLSAgICBpb21tdV9lbmFibGVkID0gaW9tbXVfaW50cG9zdCA9IDA7CisgICAgaW9tbXVf
ZW5hYmxlZCA9IGZhbHNlOwogI2lmbmRlZiBpb21tdV9pbnRyZW1hcAogICAgIGlvbW11X2ludHJl
bWFwID0gaW9tbXVfaW50cmVtYXBfb2ZmOwogI2VuZGlmCisjaWZuZGVmIGlvbW11X2ludHBvc3QK
KyAgICBpb21tdV9pbnRwb3N0ID0gZmFsc2U7CisjZW5kaWYKIH0KIAogaW50IGlvbW11X2dldF9y
ZXNlcnZlZF9kZXZpY2VfbWVtb3J5KGlvbW11X2dyZG1fdCAqZnVuYywgdm9pZCAqY3R4dCkKLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTIyOTcsMTMgKzIyOTcsMTUgQEAgc3RhdGljIGlu
dCBfX2luaXQgdnRkX3NldHVwKHZvaWQpCiAgICAgICAgIGlmICggaW9tbXVfaW50cmVtYXAgJiYg
IWVjYXBfaW50cl9yZW1hcChpb21tdS0+ZWNhcCkgKQogICAgICAgICAgICAgaW9tbXVfaW50cmVt
YXAgPSBpb21tdV9pbnRyZW1hcF9vZmY7CiAKKyNpZm5kZWYgaW9tbXVfaW50cG9zdAogICAgICAg
ICAvKgogICAgICAgICAgKiBXZSBjYW5ub3QgdXNlIHBvc3RlZCBpbnRlcnJ1cHQgaWYgWDg2X0ZF
QVRVUkVfQ1gxNiBpcwogICAgICAgICAgKiBub3Qgc3VwcG9ydGVkLCBzaW5jZSB3ZSBjb3VudCBv
biB0aGlzIGZlYXR1cmUgdG8KICAgICAgICAgICogYXRvbWljYWxseSB1cGRhdGUgMTYtYnl0ZSBJ
UlRFIGluIHBvc3RlZCBmb3JtYXQuCiAgICAgICAgICAqLwogICAgICAgICBpZiAoICFjYXBfaW50
cl9wb3N0KGlvbW11LT5jYXApIHx8ICFpb21tdV9pbnRyZW1hcCB8fCAhY3B1X2hhc19jeDE2ICkK
LSAgICAgICAgICAgIGlvbW11X2ludHBvc3QgPSAwOworICAgICAgICAgICAgaW9tbXVfaW50cG9z
dCA9IGZhbHNlOworI2VuZGlmCiAKICAgICAgICAgaWYgKCAhdnRkX2VwdF9wYWdlX2NvbXBhdGli
bGUoaW9tbXUpICkKICAgICAgICAgICAgIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpOwpAQCAt
MjMzMCw3ICsyMzMyLDkgQEAgc3RhdGljIGludCBfX2luaXQgdnRkX3NldHVwKHZvaWQpCiAgICAg
UChpb21tdV9od2RvbV9wYXNzdGhyb3VnaCwgIkRvbTAgRE1BIFBhc3N0aHJvdWdoIik7CiAgICAg
UChpb21tdV9xaW52YWwsICJRdWV1ZWQgSW52YWxpZGF0aW9uIik7CiAgICAgUChpb21tdV9pbnRy
ZW1hcCwgIkludGVycnVwdCBSZW1hcHBpbmciKTsKKyNpZm5kZWYgaW9tbXVfaW50cG9zdAogICAg
IFAoaW9tbXVfaW50cG9zdCwgIlBvc3RlZCBJbnRlcnJ1cHQiKTsKKyNlbmRpZgogICAgIFAoaW9t
bXVfaGFwX3B0X3NoYXJlLCAiU2hhcmVkIEVQVCB0YWJsZXMiKTsKICN1bmRlZiBQCiAKQEAgLTIz
NDgsNyArMjM1Miw5IEBAIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQogICAgIGlv
bW11X2h3ZG9tX3Bhc3N0aHJvdWdoID0gZmFsc2U7CiAgICAgaW9tbXVfcWludmFsID0gMDsKICAg
ICBpb21tdV9pbnRyZW1hcCA9IGlvbW11X2ludHJlbWFwX29mZjsKLSAgICBpb21tdV9pbnRwb3N0
ID0gMDsKKyNpZm5kZWYgaW9tbXVfaW50cG9zdAorICAgIGlvbW11X2ludHBvc3QgPSBmYWxzZTsK
KyNlbmRpZgogICAgIHJldHVybiByZXQ7CiB9CiAKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gveDg2L2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMK
QEAgLTI5LDYgKzI5LDE2IEBAIHN0cnVjdCBpb21tdV9vcHMgX19yZWFkX21vc3RseSBpb21tdV9v
cHMKIAogZW51bSBpb21tdV9pbnRyZW1hcCBfX3JlYWRfbW9zdGx5IGlvbW11X2ludHJlbWFwID0g
aW9tbXVfaW50cmVtYXBfZnVsbDsKIAorI2lmbmRlZiBpb21tdV9pbnRwb3N0CisvKgorICogSW4g
dGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgVlQtZCBwb3N0ZWQgaW50ZXJydXB0cywgaW4g
c29tZSBleHRyZW1lCisgKiBjYXNlcywgdGhlIHBlciBjcHUgbGlzdCB3aGljaCBzYXZlcyB0aGUg
YmxvY2tlZCB2Q1BVIHdpbGwgYmUgdmVyeSBsb25nLAorICogYW5kIHRoaXMgd2lsbCBhZmZlY3Qg
dGhlIGludGVycnVwdCBsYXRlbmN5LCBzbyBsZXQgdGhpcyBmZWF0dXJlIG9mZiBieQorICogZGVm
YXVsdCB1bnRpbCB3ZSBmaW5kIGEgZ29vZCBzb2x1dGlvbiB0byByZXNvbHZlIGl0LgorICovCiti
b29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cG9zdDsKKyNlbmRpZgorCiBpbnQgX19pbml0IGlv
bW11X2hhcmR3YXJlX3NldHVwKHZvaWQpCiB7CiAgICAgc3RydWN0IElPX0FQSUNfcm91dGVfZW50
cnkgKippb2FwaWNfZW50cmllcyA9IE5VTEw7Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCkBAIC01NCw3ICs1NCw3IEBAIHN0YXRpYyBp
bmxpbmUgYm9vbF90IGRmbl9lcShkZm5fdCB4LCBkZm4KIAogZXh0ZXJuIGJvb2xfdCBpb21tdV9l
bmFibGUsIGlvbW11X2VuYWJsZWQ7CiBleHRlcm4gYm9vbCBmb3JjZV9pb21tdSwgaW9tbXVfcXVh
cmFudGluZSwgaW9tbXVfdmVyYm9zZSwgaW9tbXVfaWdmeDsKLWV4dGVybiBib29sX3QgaW9tbXVf
c25vb3AsIGlvbW11X3FpbnZhbCwgaW9tbXVfaW50cG9zdDsKK2V4dGVybiBib29sX3QgaW9tbXVf
c25vb3AsIGlvbW11X3FpbnZhbDsKIAogI2lmZGVmIENPTkZJR19YODYKIGV4dGVybiBlbnVtIF9f
cGFja2VkIGlvbW11X2ludHJlbWFwIHsKQEAgLTcwLDYgKzcwLDEyIEBAIGV4dGVybiBlbnVtIF9f
cGFja2VkIGlvbW11X2ludHJlbWFwIHsKICMgZGVmaW5lIGlvbW11X2ludHJlbWFwIGZhbHNlCiAj
ZW5kaWYKIAorI2lmIGRlZmluZWQoQ09ORklHX1g4NikgJiYgZGVmaW5lZChDT05GSUdfSFZNKQor
ZXh0ZXJuIGJvb2wgaW9tbXVfaW50cG9zdDsKKyNlbHNlCisjIGRlZmluZSBpb21tdV9pbnRwb3N0
IGZhbHNlCisjZW5kaWYKKwogI2lmIGRlZmluZWQoQ09ORklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJF
KQogI2RlZmluZSBpb21tdV9oYXBfcHRfc2hhcmUgdHJ1ZQogI2VsaWYgZGVmaW5lZChDT05GSUdf
SFZNKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
