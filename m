Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A935A8427
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:49:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Vc4-0003oT-Pr; Wed, 04 Sep 2019 13:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVaO=W7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5Vc2-0003n9-Jl
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:46:18 +0000
X-Inumbo-ID: 5b95284e-cf1a-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b95284e-cf1a-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 13:46:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 25A9DAD7B;
 Wed,  4 Sep 2019 13:46:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  4 Sep 2019 15:46:08 +0200
Message-Id: <20190904134608.18425-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190904134608.18425-1-jgross@suse.com>
References: <20190904134608.18425-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 4/4] xen: add per-cpu buffer option to
 debugtrace
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

ZGVidWd0cmFjZSBpcyBub3JtYWxseSB3cml0aW5nIHRyYWNlIGVudHJpZXMgaW50byBhIHNpbmds
ZSB0cmFjZQpidWZmZXIuIFRoZXJlIGFyZSBjYXNlcyB3aGVyZSB0aGlzIGlzIG5vdCBvcHRpbWFs
LCBlLmcuIHdoZW4gaHVudGluZwphIGJ1ZyB3aGljaCByZXF1aXJlcyB3cml0aW5nIGxvdHMgb2Yg
dHJhY2UgZW50cmllcyBhbmQgb25lIGNwdSBpcwpzdHVjay4gVGhpcyB3aWxsIHJlc3VsdCBpbiBv
dGhlciBjcHVzIGZpbGxpbmcgdGhlIHRyYWNlIGJ1ZmZlciBhbmQKZmluYWxseSBvdmVyd3JpdGlu
ZyB0aGUgaW50ZXJlc3RpbmcgdHJhY2UgZW50cmllcyBvZiB0aGUgaGFuZ2luZyBjcHUuCgpJbiBv
cmRlciB0byBiZSBhYmxlIHRvIGRlYnVnIHN1Y2ggc2l0dWF0aW9ucyBhZGQgdGhlIGNhcGFiaWxp
dHkgdG8gdXNlCnBlci1jcHUgdHJhY2UgYnVmZmVycy4gVGhpcyBjYW4gYmUgc2VsZWN0ZWQgYnkg
c3BlY2lmeWluZyB0aGUKZGVidWd0cmFjZSBib290IHBhcmFtZXRlciB3aXRoIHRoZSBtb2RpZmll
ciAiY3B1OiIsIGxpa2U6CgogIGRlYnVndHJhY2U9Y3B1OjE2CgpBdCB0aGUgc2FtZSB0aW1lIHN3
aXRjaCB0aGUgcGFyc2luZyBmdW5jdGlvbiB0byBhY2NlcHQgc2l6ZSBtb2RpZmllcnMKKGUuZy4g
NE0gb3IgMUcpLgoKUHJpbnRpbmcgb3V0IHRoZSB0cmFjZSBlbnRyaWVzIGlzIGRvbmUgZm9yIGVh
Y2ggYnVmZmVyIGluIG9yZGVyIHRvCm1pbmltaXplIHRoZSBlZmZvcnQgbmVlZGVkIGR1cmluZyBw
cmludGluZy4gQXMgZWFjaCBlbnRyeSBpcyBwcmVmaXhlZAp3aXRoIGl0cyBzZXF1ZW5jZSBudW1i
ZXIgc29ydGluZyB0aGUgZW50cmllcyBjYW4gZWFzaWx5IGJlIGRvbmUgd2hlbgphbmFseXppbmcg
dGhlbS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0t
ClYyOgotIG9ubHkgYWxsb2NhdGUgYnVmZmVyIGlmIG5vdCBhbHJlYWR5IGRvbmUgc28KVjQ6Ci0g
dW5zaWduZWQgaW50IC0+IHVuc2lnbmVkIGxvbmcgKEphbiBCZXVsaWNoKQotIHJlcGxhY2UgY2hl
Y2sgZm9yIGJ5dGVzIDwgUEFHRV9TSVpFIGJ5ICFieXRlcyAoSmFuIEJldWxpY2gpCi0gcHJpbnQg
aW5mbyB3aGljaCBidWZmZXIgYWxsb2NhdGlvbiBmYWlsZWQgKEphbiBCZXVsaWNoKQotIHJlcGxh
Y2Ugc3dpdGNoIGJ5IGlmIGluIGNwdSBub3RpZmllciBoYW5kbGVyIChKYW4gQmV1bGljaCkKLS0t
CiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgIDcgKy0KIHhlbi9jb21tb24v
ZGVidWd0cmFjZS5jICAgICAgICAgICB8IDE0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCmluZGV4IDdjNzJlMzEwMzIuLjgzMjc5
N2UyZTIgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYworKysg
Yi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKQEAgLTY0NCwxMiArNjQ0LDEzIEBA
IG92ZXIgdGhlIFBDSSBidXNzZXMgc2VxdWVudGlhbGx5KSBvciBieSBQQ0kgZGV2aWNlIChtdXN0
IGJlIG9uIHNlZ21lbnQgMCkuCiBMaW1pdHMgdGhlIG51bWJlciBsaW5lcyBwcmludGVkIGluIFhl
biBzdGFjayB0cmFjZXMuCiAKICMjIyBkZWJ1Z3RyYWNlCi0+IGA9IDxpbnRlZ2VyPmAKKz4gYD0g
W2NwdTpdPHNpemU+YAogCiA+IERlZmF1bHQ6IGAxMjhgCiAKLVNwZWNpZnkgdGhlIHNpemUgb2Yg
dGhlIGNvbnNvbGUgZGVidWcgdHJhY2UgYnVmZmVyIGluIEtpQi4gVGhlIGRlYnVnCi10cmFjZSBm
ZWF0dXJlIGlzIG9ubHkgZW5hYmxlZCBpbiBkZWJ1Z2dpbmcgYnVpbGRzIG9mIFhlbi4KK1NwZWNp
ZnkgdGhlIHNpemUgb2YgdGhlIGNvbnNvbGUgZGVidWcgdHJhY2UgYnVmZmVyLiBCeSBzcGVjaWZ5
aW5nIGBjcHU6YAorYWRkaXRpb25hbGx5IGEgdHJhY2UgYnVmZmVyIG9mIHRoZSBzcGVjaWZpZWQg
c2l6ZSBpcyBhbGxvY2F0ZWQgcGVyIGNwdS4KK1RoZSBkZWJ1ZyB0cmFjZSBmZWF0dXJlIGlzIG9u
bHkgZW5hYmxlZCBpbiBkZWJ1Z2dpbmcgYnVpbGRzIG9mIFhlbi4KIAogIyMjIGRtYV9iaXRzCiA+
IGA9IDxpbnRlZ2VyPmAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5jIGIveGVu
L2NvbW1vbi9kZWJ1Z3RyYWNlLmMKaW5kZXggOGZhMGU3ZmIwZS4uNDQ5NDA2YjliNiAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKKysrIGIveGVuL2NvbW1vbi9kZWJ1Z3RyYWNl
LmMKQEAgLTYsNiArNiw3IEBACiAKIAogI2luY2x1ZGUgPHhlbi9jb25zb2xlLmg+CisjaW5jbHVk
ZSA8eGVuL2NwdS5oPgogI2luY2x1ZGUgPHhlbi9pbml0Lmg+CiAjaW5jbHVkZSA8eGVuL2tleWhh
bmRsZXIuaD4KICNpbmNsdWRlIDx4ZW4vbGliLmg+CkBAIC0yNSwzMyArMjYsNjMgQEAgc3RydWN0
IGRlYnVndHJhY2VfZGF0YSB7CiB9OwogCiBzdGF0aWMgc3RydWN0IGRlYnVndHJhY2VfZGF0YSAq
ZHRfZGF0YTsKK3N0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgZGVidWd0cmFjZV9kYXRhICos
IGR0X2NwdV9kYXRhKTsKIAotc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX2tpbG9ieXRl
cyA9IDEyODsKK3N0YXRpYyB1bnNpZ25lZCBsb25nIGRlYnVndHJhY2VfYnl0ZXMgPSAxMjggPDwg
MTA7CitzdGF0aWMgYm9vbCBkZWJ1Z3RyYWNlX3Blcl9jcHU7CiBzdGF0aWMgYm9vbCBkZWJ1Z3Ry
YWNlX3VzZWQ7CiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGRlYnVndHJhY2VfbG9jayk7Ci1pbnRl
Z2VyX3BhcmFtKCJkZWJ1Z3RyYWNlIiwgZGVidWd0cmFjZV9raWxvYnl0ZXMpOwogCi1zdGF0aWMg
dm9pZCBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKHZvaWQpCitzdGF0aWMgaW50IF9faW5pdCBkZWJ1
Z3RyYWNlX3BhcnNlX3BhcmFtKGNvbnN0IGNoYXIgKnMpCiB7Ci0gICAgaWYgKCAhZGVidWd0cmFj
ZV91c2VkICkKKyAgICBpZiAoICFzdHJuY21wKHMsICJjcHU6IiwgNCkgKQorICAgIHsKKyAgICAg
ICAgZGVidWd0cmFjZV9wZXJfY3B1ID0gdHJ1ZTsKKyAgICAgICAgcyArPSA0OworICAgIH0KKyAg
ICBkZWJ1Z3RyYWNlX2J5dGVzID0gcGFyc2Vfc2l6ZV9hbmRfdW5pdChzLCBOVUxMKTsKKyAgICBy
ZXR1cm4gMDsKK30KK2N1c3RvbV9wYXJhbSgiZGVidWd0cmFjZSIsIGRlYnVndHJhY2VfcGFyc2Vf
cGFyYW0pOworCitzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBfYnVmZmVyKHN0cnVjdCBkZWJ1
Z3RyYWNlX2RhdGEgKmRhdGEsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IGNoYXIgKndoaWNoKQoreworICAgIGlmICggIWRhdGEgKQogICAgICAgICByZXR1cm47CiAK
LSAgICBwcmludGsoImRlYnVndHJhY2VfZHVtcCgpIHN0YXJ0aW5nXG4iKTsKKyAgICBwcmludGso
ImRlYnVndHJhY2VfZHVtcCgpICVzIGJ1ZmZlciBzdGFydGluZ1xuIiwgd2hpY2gpOwogCiAgICAg
LyogUHJpbnQgb2xkZXN0IHBvcnRpb24gb2YgdGhlIHJpbmcuICovCi0gICAgaWYgKCBkdF9kYXRh
LT5idWZbZHRfZGF0YS0+cHJkXSAhPSAnXDAnICkKLSAgICAgICAgY29uc29sZV9zZXJpYWxfcHV0
cygmZHRfZGF0YS0+YnVmW2R0X2RhdGEtPnByZF0sCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHRfZGF0YS0+Ynl0ZXMgLSBkdF9kYXRhLT5wcmQpOworICAgIGlmICggZGF0YS0+YnVmW2Rh
dGEtPnByZF0gIT0gJ1wwJyApCisgICAgICAgIGNvbnNvbGVfc2VyaWFsX3B1dHMoJmRhdGEtPmJ1
ZltkYXRhLT5wcmRdLCBkYXRhLT5ieXRlcyAtIGRhdGEtPnByZCk7CiAKICAgICAvKiBQcmludCB5
b3VuZ2VzdCBwb3J0aW9uIG9mIHRoZSByaW5nLiAqLwotICAgIGR0X2RhdGEtPmJ1ZltkdF9kYXRh
LT5wcmRdID0gJ1wwJzsKLSAgICBjb25zb2xlX3NlcmlhbF9wdXRzKCZkdF9kYXRhLT5idWZbMF0s
IGR0X2RhdGEtPnByZCk7CisgICAgZGF0YS0+YnVmW2RhdGEtPnByZF0gPSAnXDAnOworICAgIGNv
bnNvbGVfc2VyaWFsX3B1dHMoJmRhdGEtPmJ1ZlswXSwgZGF0YS0+cHJkKTsKIAotICAgIG1lbXNl
dChkdF9kYXRhLT5idWYsICdcMCcsIGR0X2RhdGEtPmJ5dGVzKTsKLSAgICBkdF9kYXRhLT5wcmQg
PSAwOwotICAgIGR0X2RhdGEtPnByZF9sYXN0ID0gMDsKKyAgICBtZW1zZXQoZGF0YS0+YnVmLCAn
XDAnLCBkYXRhLT5ieXRlcyk7CisgICAgZGF0YS0+cHJkID0gMDsKKyAgICBkYXRhLT5wcmRfbGFz
dCA9IDA7CiAKLSAgICBwcmludGsoImRlYnVndHJhY2VfZHVtcCgpIGZpbmlzaGVkXG4iKTsKKyAg
ICBwcmludGsoImRlYnVndHJhY2VfZHVtcCgpICVzIGJ1ZmZlciBmaW5pc2hlZFxuIiwgd2hpY2gp
OworfQorCitzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2R1bXBfd29ya2VyKHZvaWQpCit7CisgICAg
dW5zaWduZWQgaW50IGNwdTsKKyAgICBjaGFyIGJ1ZlsxNl07CisKKyAgICBpZiAoICFkZWJ1Z3Ry
YWNlX3VzZWQgKQorICAgICAgICByZXR1cm47CisKKyAgICBkZWJ1Z3RyYWNlX2R1bXBfYnVmZmVy
KGR0X2RhdGEsICJnbG9iYWwiKTsKKworICAgIGZvciAoIGNwdSA9IDA7IGNwdSA8IG5yX2NwdV9p
ZHM7IGNwdSsrICkKKyAgICB7CisgICAgICAgIHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJj
cHUgJXUiLCBjcHUpOworICAgICAgICBkZWJ1Z3RyYWNlX2R1bXBfYnVmZmVyKHBlcl9jcHUoZHRf
Y3B1X2RhdGEsIGNwdSksIGJ1Zik7CisgICAgfQogfQogCiBzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNl
X3RvZ2dsZSh2b2lkKQpAQCAtOTEsMjcgKzEyMiwzNCBAQCB2b2lkIGRlYnVndHJhY2VfZHVtcCh2
b2lkKQogCiBzdGF0aWMgdm9pZCBkZWJ1Z3RyYWNlX2FkZF90b19idWYoY2hhciAqYnVmKQogewor
ICAgIHN0cnVjdCBkZWJ1Z3RyYWNlX2RhdGEgKmRhdGE7CiAgICAgY2hhciAqcDsKIAorICAgIGRh
dGEgPSBkZWJ1Z3RyYWNlX3Blcl9jcHUgPyB0aGlzX2NwdShkdF9jcHVfZGF0YSkgOiBkdF9kYXRh
OworCiAgICAgZm9yICggcCA9IGJ1ZjsgKnAgIT0gJ1wwJzsgcCsrICkKICAgICB7Ci0gICAgICAg
IGR0X2RhdGEtPmJ1ZltkdF9kYXRhLT5wcmQrK10gPSAqcDsKLSAgICAgICAgaWYgKCBkdF9kYXRh
LT5wcmQgPT0gZHRfZGF0YS0+Ynl0ZXMgKQotICAgICAgICAgICAgZHRfZGF0YS0+cHJkID0gMDsK
KyAgICAgICAgZGF0YS0+YnVmW2RhdGEtPnByZCsrXSA9ICpwOworICAgICAgICBpZiAoIGRhdGEt
PnByZCA9PSBkYXRhLT5ieXRlcyApCisgICAgICAgICAgICBkYXRhLT5wcmQgPSAwOwogICAgIH0K
IH0KIAogdm9pZCBkZWJ1Z3RyYWNlX3ByaW50ayhjb25zdCBjaGFyICpmbXQsIC4uLikKIHsKICAg
ICBzdGF0aWMgY2hhciBidWZbMTAyNF0sIGxhc3RfYnVmWzEwMjRdOwotICAgIHN0YXRpYyB1bnNp
Z25lZCBpbnQgY291bnQsIGxhc3RfY291bnQ7CisgICAgc3RhdGljIHVuc2lnbmVkIGludCBjb3Vu
dCwgbGFzdF9jb3VudCwgbGFzdF9jcHU7CiAKICAgICBjaGFyICAgICAgICAgIGNudGJ1ZlsyNF07
CiAgICAgdmFfbGlzdCAgICAgICBhcmdzOwogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAgICAg
dW5zaWduZWQgaW50IG5yOworICAgIHN0cnVjdCBkZWJ1Z3RyYWNlX2RhdGEgKmRhdGE7CisgICAg
dW5zaWduZWQgaW50IGNwdTsKIAotICAgIGlmICggIWR0X2RhdGEgKQorICAgIGRhdGEgPSBkZWJ1
Z3RyYWNlX3Blcl9jcHUgPyB0aGlzX2NwdShkdF9jcHVfZGF0YSkgOiBkdF9kYXRhOworICAgIGNw
dSA9IGRlYnVndHJhY2VfcGVyX2NwdSA/IHNtcF9wcm9jZXNzb3JfaWQoKSA6IDA7CisgICAgaWYg
KCAhZGF0YSApCiAgICAgICAgIHJldHVybjsKIAogICAgIGRlYnVndHJhY2VfdXNlZCA9IHRydWU7
CkBAIC0xMzEsMTYgKzE2OSwxNyBAQCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIg
KmZtdCwgLi4uKQogICAgIH0KICAgICBlbHNlCiAgICAgewotICAgICAgICBpZiAoIHN0cmNtcChi
dWYsIGxhc3RfYnVmKSApCisgICAgICAgIGlmICggc3RyY21wKGJ1ZiwgbGFzdF9idWYpIHx8IGNw
dSAhPSBsYXN0X2NwdSApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGR0X2RhdGEtPnByZF9sYXN0
ID0gZHRfZGF0YS0+cHJkOworICAgICAgICAgICAgZGF0YS0+cHJkX2xhc3QgPSBkYXRhLT5wcmQ7
CiAgICAgICAgICAgICBsYXN0X2NvdW50ID0gKytjb3VudDsKKyAgICAgICAgICAgIGxhc3RfY3B1
ID0gY3B1OwogICAgICAgICAgICAgc2FmZV9zdHJjcHkobGFzdF9idWYsIGJ1Zik7CiAgICAgICAg
ICAgICBzbnByaW50ZihjbnRidWYsIHNpemVvZihjbnRidWYpLCAiJXUgIiwgY291bnQpOwogICAg
ICAgICB9CiAgICAgICAgIGVsc2UKICAgICAgICAgewotICAgICAgICAgICAgZHRfZGF0YS0+cHJk
ID0gZHRfZGF0YS0+cHJkX2xhc3Q7CisgICAgICAgICAgICBkYXRhLT5wcmQgPSBkYXRhLT5wcmRf
bGFzdDsKICAgICAgICAgICAgIHNucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICIldS0l
dSAiLCBsYXN0X2NvdW50LCArK2NvdW50KTsKICAgICAgICAgfQogICAgICAgICBkZWJ1Z3RyYWNl
X2FkZF90b19idWYoY250YnVmKTsKQEAgLTE1NSwzNCArMTk0LDcwIEBAIHN0YXRpYyB2b2lkIGRl
YnVndHJhY2Vfa2V5KHVuc2lnbmVkIGNoYXIga2V5KQogICAgIGRlYnVndHJhY2VfdG9nZ2xlKCk7
CiB9CiAKLXN0YXRpYyBpbnQgX19pbml0IGRlYnVndHJhY2VfaW5pdCh2b2lkKQorc3RhdGljIHZv
aWQgZGVidWd0cmFjZV9hbGxvY19idWZmZXIoc3RydWN0IGRlYnVndHJhY2VfZGF0YSAqKnB0ciwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHUpCiB7
CiAgICAgaW50IG9yZGVyOwotICAgIHVuc2lnbmVkIGxvbmcga2J5dGVzLCBieXRlczsKICAgICBz
dHJ1Y3QgZGVidWd0cmFjZV9kYXRhICpkYXRhOwogCi0gICAgLyogUm91bmQgc2l6ZSBkb3duIHRv
IG5leHQgcG93ZXIgb2YgdHdvLiAqLwotICAgIHdoaWxlICggKGtieXRlcyA9IChkZWJ1Z3RyYWNl
X2tpbG9ieXRlcyAmIChkZWJ1Z3RyYWNlX2tpbG9ieXRlcy0xKSkpICE9IDAgKQotICAgICAgICBk
ZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IGtieXRlczsKLQotICAgIGJ5dGVzID0gZGVidWd0cmFjZV9r
aWxvYnl0ZXMgPDwgMTA7Ci0gICAgaWYgKCBieXRlcyA9PSAwICkKLSAgICAgICAgcmV0dXJuIDA7
CisgICAgaWYgKCAhZGVidWd0cmFjZV9ieXRlcyB8fCAqcHRyICkKKyAgICAgICAgcmV0dXJuOwog
Ci0gICAgb3JkZXIgPSBnZXRfb3JkZXJfZnJvbV9ieXRlcyhieXRlcyk7CisgICAgb3JkZXIgPSBn
ZXRfb3JkZXJfZnJvbV9ieXRlcyhkZWJ1Z3RyYWNlX2J5dGVzKTsKICAgICBkYXRhID0gYWxsb2Nf
eGVuaGVhcF9wYWdlcyhvcmRlciwgMCk7CiAgICAgaWYgKCAhZGF0YSApCi0gICAgICAgIHJldHVy
biAtRU5PTUVNOworICAgIHsKKyAgICAgICAgaWYgKCBkZWJ1Z3RyYWNlX3Blcl9jcHUgKQorICAg
ICAgICAgICAgcHJpbnRrKCJmYWlsZWQgdG8gYWxsb2NhdGUgZGVidWd0cmFjZSBidWZmZXIgZm9y
IGNwdSAldVxuIiwgY3B1KTsKKyAgICAgICAgZWxzZQorICAgICAgICAgICAgcHJpbnRrKCJmYWls
ZWQgdG8gYWxsb2NhdGUgZGVidWd0cmFjZSBidWZmZXJcbiIpOworICAgICAgICByZXR1cm47Cisg
ICAgfQogCi0gICAgYnl0ZXMgPSBQQUdFX1NJWkUgPDwgb3JkZXI7Ci0gICAgbWVtc2V0KGRhdGEs
ICdcMCcsIGJ5dGVzKTsKKyAgICBkZWJ1Z3RyYWNlX2J5dGVzID0gUEFHRV9TSVpFIDw8IG9yZGVy
OworICAgIG1lbXNldChkYXRhLCAnXDAnLCBkZWJ1Z3RyYWNlX2J5dGVzKTsKKyAgICBkYXRhLT5i
eXRlcyA9IGRlYnVndHJhY2VfYnl0ZXMgLSBzaXplb2YoKmRhdGEpOwogCi0gICAgZGF0YS0+Ynl0
ZXMgPSBieXRlcyAtIHNpemVvZigqZGF0YSk7Ci0gICAgZHRfZGF0YSA9IGRhdGE7CisgICAgKnB0
ciA9IGRhdGE7Cit9CisKK3N0YXRpYyBpbnQgZGVidWd0cmFjZV9jcHVfY2FsbGJhY2soc3RydWN0
IG5vdGlmaWVyX2Jsb2NrICpuZmIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgYWN0aW9uLCB2b2lkICpoY3B1KQoreworICAgIHVuc2lnbmVkIGludCBj
cHUgPSAodW5zaWduZWQgbG9uZyloY3B1OworCisgICAgLyogQnVmZmVycyBhcmUgb25seSBldmVy
IGFsbG9jYXRlZCwgbmV2ZXIgZnJlZWQuICovCisgICAgaWYgKCBhY3Rpb24gPT0gQ1BVX1VQX1BS
RVBBUkUgKQorICAgICAgICBkZWJ1Z3RyYWNlX2FsbG9jX2J1ZmZlcigmcGVyX2NwdShkdF9jcHVf
ZGF0YSwgY3B1KSwgY3B1KTsKKworICAgIHJldHVybiAwOworfQorCitzdGF0aWMgc3RydWN0IG5v
dGlmaWVyX2Jsb2NrIGRlYnVndHJhY2VfbmZiID0geworICAgIC5ub3RpZmllcl9jYWxsID0gZGVi
dWd0cmFjZV9jcHVfY2FsbGJhY2sKK307CisKK3N0YXRpYyBpbnQgX19pbml0IGRlYnVndHJhY2Vf
aW5pdCh2b2lkKQoreworICAgIHVuc2lnbmVkIGxvbmcgYnl0ZXM7CisgICAgdW5zaWduZWQgaW50
IGNwdTsKKworICAgIC8qIFJvdW5kIHNpemUgZG93biB0byBuZXh0IHBvd2VyIG9mIHR3by4gKi8K
KyAgICB3aGlsZSAoIChieXRlcyA9IChkZWJ1Z3RyYWNlX2J5dGVzICYgKGRlYnVndHJhY2VfYnl0
ZXMgLSAxKSkpICE9IDAgKQorICAgICAgICBkZWJ1Z3RyYWNlX2J5dGVzID0gYnl0ZXM7CiAKICAg
ICByZWdpc3Rlcl9rZXloYW5kbGVyKCdUJywgZGVidWd0cmFjZV9rZXksCiAgICAgICAgICAgICAg
ICAgICAgICAgICAidG9nZ2xlIGRlYnVndHJhY2UgdG8gY29uc29sZS9idWZmZXIiLCAwKTsKIAor
ICAgIGlmICggZGVidWd0cmFjZV9wZXJfY3B1ICkKKyAgICB7CisgICAgICAgIGZvcl9lYWNoX29u
bGluZV9jcHUgKCBjcHUgKQorICAgICAgICAgICAgZGVidWd0cmFjZV9hbGxvY19idWZmZXIoJnBl
cl9jcHUoZHRfY3B1X2RhdGEsIGNwdSksIGNwdSk7CisgICAgICAgIHJlZ2lzdGVyX2NwdV9ub3Rp
ZmllcigmZGVidWd0cmFjZV9uZmIpOworICAgIH0KKyAgICBlbHNlCisgICAgICAgIGRlYnVndHJh
Y2VfYWxsb2NfYnVmZmVyKCZkdF9kYXRhLCAwKTsKKwogICAgIHJldHVybiAwOwogfQogX19pbml0
Y2FsbChkZWJ1Z3RyYWNlX2luaXQpOwotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
