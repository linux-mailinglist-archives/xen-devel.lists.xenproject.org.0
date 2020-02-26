Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C150416FF49
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:49:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6w6D-0002Te-Il; Wed, 26 Feb 2020 12:47:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6w6B-0002R9-NY
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:47:35 +0000
X-Inumbo-ID: 19d73147-5896-11ea-940b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19d73147-5896-11ea-940b-12813bfff9fa;
 Wed, 26 Feb 2020 12:47:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39DD7B07B;
 Wed, 26 Feb 2020 12:47:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 13:47:04 +0100
Message-Id: <20200226124705.29212-12-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200226124705.29212-1-jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 11/12] tools/libxc: remove xc_set_parameters()
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm8gdXNlciBvZiB4Y19zZXRfcGFyYW1ldGVycygpIGxlZnQsIHNvIHJlbW92ZSBp
dC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClY2
OgotIG5ldyBwYXRjaAotLS0KIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIHwgIDEgLQog
dG9vbHMvbGlieGMveGNfbWlzYy5jICAgICAgICAgfCAyMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAppbmRl
eCA5OTU1MmE1ZjczLi44Njc3NDMzYzVmIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy9pbmNsdWRl
L3hlbmN0cmwuaAorKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaApAQCAtMTIyNiw3
ICsxMjI2LDYgQEAgaW50IHhjX3JlYWRjb25zb2xlcmluZyh4Y19pbnRlcmZhY2UgKnhjaCwKICAg
ICAgICAgICAgICAgICAgICAgICAgaW50IGNsZWFyLCBpbnQgaW5jcmVtZW50YWwsIHVpbnQzMl90
ICpwaW5kZXgpOwogCiBpbnQgeGNfc2VuZF9kZWJ1Z19rZXlzKHhjX2ludGVyZmFjZSAqeGNoLCBj
aGFyICprZXlzKTsKLWludCB4Y19zZXRfcGFyYW1ldGVycyh4Y19pbnRlcmZhY2UgKnhjaCwgY2hh
ciAqcGFyYW1zKTsKIAogdHlwZWRlZiBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyB4Y19waHlz
aW5mb190OwogdHlwZWRlZiBzdHJ1Y3QgeGVuX3N5c2N0bF9jcHV0b3BvIHhjX2NwdXRvcG9fdDsK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX21pc2MuYyBiL3Rvb2xzL2xpYnhjL3hjX21pc2Mu
YwppbmRleCAwOTNmYTQ0MDgxLi45YjY2MzMwMDgyIDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94
Y19taXNjLmMKKysrIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCkBAIC0xODcsMjcgKzE4Nyw2IEBA
IGludCB4Y19zZW5kX2RlYnVnX2tleXMoeGNfaW50ZXJmYWNlICp4Y2gsIGNoYXIgKmtleXMpCiAg
ICAgcmV0dXJuIHJldDsKIH0KIAotaW50IHhjX3NldF9wYXJhbWV0ZXJzKHhjX2ludGVyZmFjZSAq
eGNoLCBjaGFyICpwYXJhbXMpCi17Ci0gICAgaW50IHJldCwgbGVuID0gc3RybGVuKHBhcmFtcyk7
Ci0gICAgREVDTEFSRV9TWVNDVEw7Ci0gICAgREVDTEFSRV9IWVBFUkNBTExfQk9VTkNFKHBhcmFt
cywgbGVuLCBYQ19IWVBFUkNBTExfQlVGRkVSX0JPVU5DRV9JTik7Ci0KLSAgICBpZiAoIHhjX2h5
cGVyY2FsbF9ib3VuY2VfcHJlKHhjaCwgcGFyYW1zKSApCi0gICAgICAgIHJldHVybiAtMTsKLQot
ICAgIHN5c2N0bC5jbWQgPSBYRU5fU1lTQ1RMX3NldF9wYXJhbWV0ZXI7Ci0gICAgc2V0X3hlbl9n
dWVzdF9oYW5kbGUoc3lzY3RsLnUuc2V0X3BhcmFtZXRlci5wYXJhbXMsIHBhcmFtcyk7Ci0gICAg
c3lzY3RsLnUuc2V0X3BhcmFtZXRlci5zaXplID0gbGVuOwotICAgIG1lbXNldChzeXNjdGwudS5z
ZXRfcGFyYW1ldGVyLnBhZCwgMCwgc2l6ZW9mKHN5c2N0bC51LnNldF9wYXJhbWV0ZXIucGFkKSk7
Ci0KLSAgICByZXQgPSBkb19zeXNjdGwoeGNoLCAmc3lzY3RsKTsKLQotICAgIHhjX2h5cGVyY2Fs
bF9ib3VuY2VfcG9zdCh4Y2gsIHBhcmFtcyk7Ci0KLSAgICByZXR1cm4gcmV0OwotfQotCiBpbnQg
eGNfcGh5c2luZm8oeGNfaW50ZXJmYWNlICp4Y2gsCiAgICAgICAgICAgICAgICAgeGNfcGh5c2lu
Zm9fdCAqcHV0X2luZm8pCiB7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
