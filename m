Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582D18D3E
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 17:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOlB4-0007eX-6I; Thu, 09 May 2019 15:41:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0k/=TJ=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1hOlB2-0007eD-HN
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 15:41:44 +0000
X-Inumbo-ID: f165be5c-7270-11e9-8980-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f165be5c-7270-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 15:41:43 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Thu, 09 May 2019 17:41:41 +0200
Received: from linux-nq5u.suse.de (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (NOT encrypted);
 Thu, 09 May 2019 16:41:33 +0100
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 17:41:26 +0200
Message-Id: <20190509154128.9196-3-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509154128.9196-1-vliaskovitis@suse.com>
References: <20190509154128.9196-1-vliaskovitis@suse.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/4] libxc: add function to get hypervisor
 parameters
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
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com,
 vliaskovitis@suse.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com,
 dgdegra@tycho.nsa.gov
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbmV3IGxpYnhjIGZ1bmN0aW9uIHRvIGdldCBoeXBlcnZpc29yIHBhcmFtZXRlcnMuCgpT
aWduZWQtb2ZmLWJ5OiBWYXNpbGlzIExpYXNrb3ZpdGlzIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+
Ci0tLQogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggfCAgMSArCiB0b29scy9saWJ4Yy94
Y19taXNjLmMgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNs
dWRlL3hlbmN0cmwuaCBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCmluZGV4IGEzNjI4
ZTU2YmIuLjM0ODJjYTFhOTEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3Ry
bC5oCisrKyBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCkBAIC0xMjI4LDYgKzEyMjgs
NyBAQCBpbnQgeGNfcmVhZGNvbnNvbGVyaW5nKHhjX2ludGVyZmFjZSAqeGNoLAogCiBpbnQgeGNf
c2VuZF9kZWJ1Z19rZXlzKHhjX2ludGVyZmFjZSAqeGNoLCBjaGFyICprZXlzKTsKIGludCB4Y19z
ZXRfcGFyYW1ldGVycyh4Y19pbnRlcmZhY2UgKnhjaCwgY2hhciAqcGFyYW1zKTsKK2ludCB4Y19n
ZXRfcGFyYW1ldGVycyh4Y19pbnRlcmZhY2UgKnhjaCwgY2hhciAqcGFyYW1zLCBjaGFyICp2YWx1
ZXMpOwogCiB0eXBlZGVmIHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvIHhjX3BoeXNpbmZvX3Q7
CiB0eXBlZGVmIHN0cnVjdCB4ZW5fc3lzY3RsX2NwdXRvcG8geGNfY3B1dG9wb190OwpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGMveGNfbWlzYy5jIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCmluZGV4
IDVlNjcxNGFlMmIuLjQzOWFkOTExOTQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX21pc2Mu
YworKysgYi90b29scy9saWJ4Yy94Y19taXNjLmMKQEAgLTIwOCw2ICsyMDgsMzIgQEAgaW50IHhj
X3NldF9wYXJhbWV0ZXJzKHhjX2ludGVyZmFjZSAqeGNoLCBjaGFyICpwYXJhbXMpCiAgICAgcmV0
dXJuIHJldDsKIH0KIAoraW50IHhjX2dldF9wYXJhbWV0ZXJzKHhjX2ludGVyZmFjZSAqeGNoLCBj
aGFyICpwYXJhbXMsIGNoYXIgKnZhbHVlcykKK3sKKyAgICBpbnQgcmV0LCBsZW4gPSBzdHJsZW4o
cGFyYW1zKTsKKyAgICBERUNMQVJFX1NZU0NUTDsKKyAgICBERUNMQVJFX0hZUEVSQ0FMTF9CT1VO
Q0UocGFyYW1zLCBsZW4sIFhDX0hZUEVSQ0FMTF9CVUZGRVJfQk9VTkNFX0lOKTsKKyAgICBERUNM
QVJFX0hZUEVSQ0FMTF9CT1VOQ0UodmFsdWVzLCAxMDIzLCBYQ19IWVBFUkNBTExfQlVGRkVSX0JP
VU5DRV9PVVQpOworCisgICAgaWYgKCB4Y19oeXBlcmNhbGxfYm91bmNlX3ByZSh4Y2gsIHBhcmFt
cykgKQorICAgICAgICByZXR1cm4gLTE7CisgICAgaWYgKCB4Y19oeXBlcmNhbGxfYm91bmNlX3By
ZSh4Y2gsIHZhbHVlcykgKQorICAgICAgICByZXR1cm4gLTE7CisKKyAgICBzeXNjdGwuY21kID0g
WEVOX1NZU0NUTF9nZXRfcGFyYW1ldGVyOworICAgIHNldF94ZW5fZ3Vlc3RfaGFuZGxlKHN5c2N0
bC51LmdldF9wYXJhbWV0ZXIucGFyYW1zLCBwYXJhbXMpOworICAgIHNldF94ZW5fZ3Vlc3RfaGFu
ZGxlKHN5c2N0bC51LmdldF9wYXJhbWV0ZXIudmFsdWVzLCB2YWx1ZXMpOworICAgIHN5c2N0bC51
LmdldF9wYXJhbWV0ZXIuc2l6ZSA9IGxlbjsKKyAgICBtZW1zZXQoc3lzY3RsLnUuZ2V0X3BhcmFt
ZXRlci5wYWQsIDAsIHNpemVvZihzeXNjdGwudS5nZXRfcGFyYW1ldGVyLnBhZCkpOworCisgICAg
cmV0ID0gZG9fc3lzY3RsKHhjaCwgJnN5c2N0bCk7CisKKyAgICB4Y19oeXBlcmNhbGxfYm91bmNl
X3Bvc3QoeGNoLCBwYXJhbXMpOworICAgIHhjX2h5cGVyY2FsbF9ib3VuY2VfcG9zdCh4Y2gsIHZh
bHVlcyk7CisKKyAgICByZXR1cm4gcmV0OworfQorCiBpbnQgeGNfcGh5c2luZm8oeGNfaW50ZXJm
YWNlICp4Y2gsCiAgICAgICAgICAgICAgICAgeGNfcGh5c2luZm9fdCAqcHV0X2luZm8pCiB7Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
