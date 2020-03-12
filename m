Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB7C182B3E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 09:32:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCJCu-0004uK-KU; Thu, 12 Mar 2020 08:28:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCJCs-0004u0-RD
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 08:28:42 +0000
X-Inumbo-ID: 76d89566-643b-11ea-b127-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76d89566-643b-11ea-b127-12813bfff9fa;
 Thu, 12 Mar 2020 08:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3401EB24A;
 Thu, 12 Mar 2020 08:28:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 12 Mar 2020 09:28:31 +0100
Message-Id: <20200312082831.22280-5-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200312082831.22280-1-jgross@suse.com>
References: <20200312082831.22280-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v5 4/4] xen/rcu: add per-lock counter in debug
 builds
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbG9jayBzcGVjaWZpYyBjb3VudGVyIHRvIHJjdSByZWFkIGxvY2tzIGluIGRlYnVnIGJ1
aWxkcy4gVGhpcwphbGxvd3MgdG8gdGVzdCBmb3IgbWF0Y2hpbmcgbG9jay91bmxvY2sgY2FsbHMu
CgpUaGlzIHdpbGwgaGVscCB0byBhdm9pZCBjYXNlcyBsaWtlIHRoZSBvbmUgZml4ZWQgYnkgY29t
bWl0Cjk4ZWQxZjQzY2MyYzg5IHdoZXJlIGRpZmZlcmVudCByY3UgcmVhZCBsb2NrcyB3ZXJlIHJl
ZmVyZW5jZWQgaW4gdGhlCmxvY2sgYW5kIHVubG9jayBjYWxscy4KClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClY1OgotIHVwZGF0ZWQgY29tbWl0IG1l
c3NhZ2UgKEphbiBCZXVsaWNoKQotLS0KIHhlbi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oIHwgNDYg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9yY3VwZGF0ZS5oIGIveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKaW5k
ZXggYmU4MDc2OTRlNy4uM2U5YjBiMTgwZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3Jj
dXBkYXRlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3JjdXBkYXRlLmgKQEAgLTM2LDIwICszNiw0
OSBAQAogI2luY2x1ZGUgPHhlbi9zcGlubG9jay5oPgogI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+
CiAjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgorI2luY2x1ZGUgPGFzbS9hdG9taWMuaD4KIAogI2Rl
ZmluZSBfX3JjdQogCisjaWZuZGVmIE5ERUJVRworLyogKiBMb2NrIHR5cGUgZm9yIHBhc3Npbmcg
dG8gcmN1X3JlYWRfe2xvY2ssdW5sb2NrfS4gKi8KK3N0cnVjdCBfcmN1X3JlYWRfbG9jayB7Cisg
ICAgYXRvbWljX3QgY250OworfTsKK3R5cGVkZWYgc3RydWN0IF9yY3VfcmVhZF9sb2NrIHJjdV9y
ZWFkX2xvY2tfdDsKKyNkZWZpbmUgREVGSU5FX1JDVV9SRUFEX0xPQ0soeCkgcmN1X3JlYWRfbG9j
a190IHggPSB7IC5jbnQgPSBBVE9NSUNfSU5JVCgwKSB9CisjZGVmaW5lIFJDVV9SRUFEX0xPQ0tf
SU5JVCh4KSAgIGF0b21pY19zZXQoJih4KS0+Y250LCAwKQorCisjZWxzZQorLyoKKyAqIER1bW15
IGxvY2sgdHlwZSBmb3IgcGFzc2luZyB0byByY3VfcmVhZF97bG9jayx1bmxvY2t9LiBDdXJyZW50
bHkgZXhpc3RzCisgKiBvbmx5IHRvIGRvY3VtZW50IHRoZSByZWFzb24gZm9yIHJjdV9yZWFkX2xv
Y2soKSBjcml0aWNhbCBzZWN0aW9ucy4KKyAqLworc3RydWN0IF9yY3VfcmVhZF9sb2NrIHt9Owor
dHlwZWRlZiBzdHJ1Y3QgX3JjdV9yZWFkX2xvY2sgcmN1X3JlYWRfbG9ja190OworI2RlZmluZSBE
RUZJTkVfUkNVX1JFQURfTE9DSyh4KSByY3VfcmVhZF9sb2NrX3QgeAorI2RlZmluZSBSQ1VfUkVB
RF9MT0NLX0lOSVQoeCkKKworI2VuZGlmCisKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQs
IHJjdV9sb2NrX2NudCk7CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcXVpZXNjZV9kaXNhYmxl
KHZvaWQpCitzdGF0aWMgaW5saW5lIHZvaWQgcmN1X3F1aWVzY2VfZGlzYWJsZShyY3VfcmVhZF9s
b2NrX3QgKmxvY2spCiB7CiAgICAgdGhpc19jcHUocmN1X2xvY2tfY250KSsrOworI2lmbmRlZiBO
REVCVUcKKyAgICBhdG9taWNfaW5jKCZsb2NrLT5jbnQpOworI2VuZGlmCiAgICAgYmFycmllcigp
OwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgcmN1X3F1aWVzY2VfZW5hYmxlKHZvaWQpCitzdGF0
aWMgaW5saW5lIHZvaWQgcmN1X3F1aWVzY2VfZW5hYmxlKHJjdV9yZWFkX2xvY2tfdCAqbG9jaykK
IHsKICAgICBiYXJyaWVyKCk7CisjaWZuZGVmIE5ERUJVRworICAgIEFTU0VSVChhdG9taWNfcmVh
ZCgmbG9jay0+Y250KSk7CisgICAgYXRvbWljX2RlYygmbG9jay0+Y250KTsKKyNlbmRpZgogICAg
IHRoaXNfY3B1KHJjdV9sb2NrX2NudCktLTsKIH0KIApAQCAtNzgsMTUgKzEwNyw2IEBAIHN0cnVj
dCByY3VfaGVhZCB7CiBpbnQgcmN1X3BlbmRpbmcoaW50IGNwdSk7CiBpbnQgcmN1X25lZWRzX2Nw
dShpbnQgY3B1KTsKIAotLyoKLSAqIER1bW15IGxvY2sgdHlwZSBmb3IgcGFzc2luZyB0byByY3Vf
cmVhZF97bG9jayx1bmxvY2t9LiBDdXJyZW50bHkgZXhpc3RzCi0gKiBvbmx5IHRvIGRvY3VtZW50
IHRoZSByZWFzb24gZm9yIHJjdV9yZWFkX2xvY2soKSBjcml0aWNhbCBzZWN0aW9ucy4KLSAqLwot
c3RydWN0IF9yY3VfcmVhZF9sb2NrIHt9OwotdHlwZWRlZiBzdHJ1Y3QgX3JjdV9yZWFkX2xvY2sg
cmN1X3JlYWRfbG9ja190OwotI2RlZmluZSBERUZJTkVfUkNVX1JFQURfTE9DSyh4KSByY3VfcmVh
ZF9sb2NrX3QgeAotI2RlZmluZSBSQ1VfUkVBRF9MT0NLX0lOSVQoeCkKLQogLyoqCiAgKiByY3Vf
cmVhZF9sb2NrIC0gbWFyayB0aGUgYmVnaW5uaW5nIG9mIGFuIFJDVSByZWFkLXNpZGUgY3JpdGlj
YWwgc2VjdGlvbi4KICAqCkBAIC0xMTUsNyArMTM1LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgX3JjdV9y
ZWFkX2xvY2sgcmN1X3JlYWRfbG9ja190OwogICovCiBzdGF0aWMgaW5saW5lIHZvaWQgcmN1X3Jl
YWRfbG9jayhyY3VfcmVhZF9sb2NrX3QgKmxvY2spCiB7Ci0gICAgcmN1X3F1aWVzY2VfZGlzYWJs
ZSgpOworICAgIHJjdV9xdWllc2NlX2Rpc2FibGUobG9jayk7CiB9CiAKIC8qKgpAQCAtMTI2LDcg
KzE0Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcmVhZF9sb2NrKHJjdV9yZWFkX2xvY2tf
dCAqbG9jaykKIHN0YXRpYyBpbmxpbmUgdm9pZCByY3VfcmVhZF91bmxvY2socmN1X3JlYWRfbG9j
a190ICpsb2NrKQogewogICAgIEFTU0VSVCghcmN1X3F1aWVzY2VfYWxsb3dlZCgpKTsKLSAgICBy
Y3VfcXVpZXNjZV9lbmFibGUoKTsKKyAgICByY3VfcXVpZXNjZV9lbmFibGUobG9jayk7CiB9CiAK
IC8qCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
