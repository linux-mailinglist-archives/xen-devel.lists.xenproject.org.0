Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E2CF40D3
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 08:00:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSyDK-00027h-24; Fri, 08 Nov 2019 06:57:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iSyDI-00027Z-3w
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:57:44 +0000
X-Inumbo-ID: 0f7cb086-01f5-11ea-a1d0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f7cb086-01f5-11ea-a1d0-12813bfff9fa;
 Fri, 08 Nov 2019 06:57:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4ECABACE0;
 Fri,  8 Nov 2019 06:57:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  8 Nov 2019 07:57:39 +0100
Message-Id: <20191108065739.21345-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: fix a potential issue with core
 scheduling
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y3B1cG9vbF9vbmxpbmVfY3B1bWFzaygpIGlzIHVzZWQgYnkgY3JlZGl0IGFuZCBydCBzY2hlZHVs
ZXIuIEl0IHJldHVybnMKYWxsIHRoZSBjcHVzIG9mIGEgY3B1cG9vbCBvciBhbGwgb25saW5lIGNw
dXMgaW4gY2FzZSBubyBjcHVwb29sIGlzCnNwZWNpZmllZC4KClRoZSAibm8gY3B1cG9vbCIgY2Fz
ZSBjYW4gYmUgZHJvcHBlZCwgYXMgbm8gc2NoZWR1bGVyIG90aGVyIHRoYW4gdGhlCmluaXQgc2No
ZWR1bGVyIHdpbGwgZXZlciB3b3JrIG9uIGNwdXMgbm90IGFzc29jaWF0ZWQgd2l0aCBhbnkgY3B1
cG9vbC4KCkFzIHRoZSBpbmRpdmlkdWFsIHNjaGVkdWxlcnMgc2hvdWxkIG9ubHkgZXZlciB3b3Jr
IG9uIHNjaGVkdWxpbmcKcmVzb3VyY2VzIGluc3RlYWQgb2YgaW5kaXZpZHVhbCBjcHVzLCB0aGVp
ciBjcHVwb29sX29ubGluZV9jcHVtYXNrKCkKdXNlIHNob3VsZCBiZSByZXBsYWNlZCBieSBjcHVw
b29sLT5yZXNfdmFsaWQuCgpOb3RlIHRoYXQgb25seSB3aXRoIGNvcmUgc2NoZWR1bGluZyBhY3Rp
dmUgdGhpcyBtaWdodCByZXN1bHQgaW4KcG90ZW50aWFsIHByb2JsZW1zLCBhcyB3aXRoIGNwdSBz
Y2hlZHVsaW5nIGJvdGggbWFza3MgYXJlIGlkZW50aWNhbC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5j
ICB8IDMgKy0tCiB4ZW4vY29tbW9uL3NjaGVkX3J0LmMgICAgICB8IDQgKystLQogeGVuL2luY2x1
ZGUveGVuL3NjaGVkLWlmLmggfCAzIC0tLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQu
YyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKaW5kZXggZmJmZmNmMzk5Ni4uNjQ1Y2RjNWU5
YSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYworKysgYi94ZW4vY29tbW9u
L3NjaGVkX2NyZWRpdC5jCkBAIC0xNjg0LDEyICsxNjg0LDExIEBAIGNzY2hlZF9sb2FkX2JhbGFu
Y2Uoc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsIGludCBjcHUsCiAgICAgc3RydWN0IGNwdXBv
b2wgKmMgPSBnZXRfc2NoZWRfcmVzKGNwdSktPmNwdXBvb2w7CiAgICAgc3RydWN0IGNzY2hlZF91
bml0ICpzcGVlcjsKICAgICBjcHVtYXNrX3Qgd29ya2VyczsKLSAgICBjcHVtYXNrX3QgKm9ubGlu
ZTsKKyAgICBjcHVtYXNrX3QgKm9ubGluZSA9IGMtPnJlc192YWxpZDsKICAgICBpbnQgcGVlcl9j
cHUsIGZpcnN0X2NwdSwgcGVlcl9ub2RlLCBic3RlcDsKICAgICBpbnQgbm9kZSA9IGNwdV90b19u
b2RlKGNwdSk7CiAKICAgICBCVUdfT04oZ2V0X3NjaGVkX3JlcyhjcHUpICE9IHNuZXh0LT51bml0
LT5yZXMpOwotICAgIG9ubGluZSA9IGNwdXBvb2xfb25saW5lX2NwdW1hc2soYyk7CiAKICAgICAv
KgogICAgICAqIElmIHRoaXMgQ1BVIGlzIGdvaW5nIG9mZmxpbmUsIG9yIGlzIG5vdCAoeWV0KSBw
YXJ0IG9mIGFueSBjcHVwb29sCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkX3J0LmMgYi94
ZW4vY29tbW9uL3NjaGVkX3J0LmMKaW5kZXggNmU5M2U1MGFjYi4uYjJiMjk0ODFmMyAxMDA2NDQK
LS0tIGEveGVuL2NvbW1vbi9zY2hlZF9ydC5jCisrKyBiL3hlbi9jb21tb24vc2NoZWRfcnQuYwpA
QCAtNzc0LDggKzc3NCw4IEBAIHJ0X2RlaW5pdF9wZGF0YShjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMsIHZvaWQgKnBjcHUsIGludCBjcHUpCiAKICAgICBpZiAoIHBydi0+cmVwbF90aW1lci5j
cHUgPT0gY3B1ICkKICAgICB7Ci0gICAgICAgIHN0cnVjdCBjcHVwb29sICpjID0gZ2V0X3NjaGVk
X3JlcyhjcHUpLT5jcHVwb29sOwotICAgICAgICB1bnNpZ25lZCBpbnQgbmV3X2NwdSA9IGNwdW1h
c2tfY3ljbGUoY3B1LCBjcHVwb29sX29ubGluZV9jcHVtYXNrKGMpKTsKKyAgICAgICAgY3B1bWFz
a190ICpvbmxpbmUgPSBnZXRfc2NoZWRfcmVzKGNwdSktPmNwdXBvb2wtPnJlc192YWxpZDsKKyAg
ICAgICAgdW5zaWduZWQgaW50IG5ld19jcHUgPSBjcHVtYXNrX2N5Y2xlKGNwdSwgb25saW5lKTsK
IAogICAgICAgICAvKgogICAgICAgICAgKiBNYWtlIHN1cmUgdGhlIHRpbWVyIHJ1biBvbiBvbmUg
b2YgdGhlIGNwdXMgdGhhdCBhcmUgc3RpbGwgYXZhaWxhYmxlCmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IDI5
NzE1NjUyYmMuLmIwYWM1NGU2M2QgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC01NDUsOSArNTQ1LDYgQEAg
c3RydWN0IGNwdXBvb2wKICAgICBlbnVtIHNjaGVkX2dyYW4gIGdyYW47CiB9OwogCi0jZGVmaW5l
IGNwdXBvb2xfb25saW5lX2NwdW1hc2soX3Bvb2wpIFwKLSAgICAoKChfcG9vbCkgPT0gTlVMTCkg
PyAmY3B1X29ubGluZV9tYXAgOiAoX3Bvb2wpLT5jcHVfdmFsaWQpCi0KIHN0YXRpYyBpbmxpbmUg
Y3B1bWFza190ICpjcHVwb29sX2RvbWFpbl9tYXN0ZXJfY3B1bWFzayhjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKQogewogICAgIC8qCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
