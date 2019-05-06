Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F14144D2
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYt-0002XM-VZ; Mon, 06 May 2019 06:57:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYk-0002Cl-5u
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:10 +0000
X-Inumbo-ID: 271b43fa-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 271b43fa-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9250AF3E;
 Mon,  6 May 2019 06:56:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:36 +0200
Message-Id: <20190506065644.7415-38-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 37/45] x86: optimize loading of GDT at
 context switch
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBkeW5hbWljYWxseSBkZWNpZGUgd2hldGhlciB0aGUgcHJldmlvdXMgdmNwdSB3
YXMgdXNpbmcgZnVsbApvciBkZWZhdWx0IEdEVCBqdXN0IGFkZCBhIHBlcmNwdSB2YXJpYWJsZSBm
b3IgdGhhdCBwdXJwb3NlLiBUaGlzIGF0Cm9uY2UgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgdGVzdGlu
ZyB2Y3B1X2lkcyB0byBkaWZmZXIgdHdpY2UuCgpDYWNoZSB0aGUgbmVlZF9mdWxsX2dkdChuZCkg
dmFsdWUgaW4gYSBsb2NhbCB2YXJpYWJsZS4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KLS0tClJGQyBWMjogbmV3IHBhdGNoIChzcGxpdCBmcm9tIHByZXZp
b3VzIG9uZSkKLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgfCAxOCArKysrKysrKysrKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwpp
bmRleCA3MmEzNjVmZjZhLi5kMDRlNzA0MTE2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9t
YWluLmMKKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCkBAIC03Miw2ICs3Miw4IEBACiAKIERF
RklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIGN1cnJfdmNwdSk7CiAKK3N0YXRpYyBERUZJTkVf
UEVSX0NQVShib29sLCBmdWxsX2dkdF9sb2FkZWQpOworCiBzdGF0aWMgdm9pZCBkZWZhdWx0X2lk
bGUodm9pZCk7CiB2b2lkICgqcG1faWRsZSkgKHZvaWQpIF9fcmVhZF9tb3N0bHkgPSBkZWZhdWx0
X2lkbGU7CiB2b2lkICgqZGVhZF9pZGxlKSAodm9pZCkgX19yZWFkX21vc3RseSA9IGRlZmF1bHRf
ZGVhZF9pZGxlOwpAQCAtMTYzOCw2ICsxNjQwLDggQEAgc3RhdGljIGlubGluZSB2b2lkIGxvYWRf
ZnVsbF9nZHQoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgZ2R0X2Rlc2Mu
YmFzZSA9IEdEVF9WSVJUX1NUQVJUKHYpOwogCiAgICAgbGdkdCgmZ2R0X2Rlc2MpOworCisgICAg
cGVyX2NwdShmdWxsX2dkdF9sb2FkZWQsIGNwdSkgPSB0cnVlOwogfQogCiBzdGF0aWMgaW5saW5l
IHZvaWQgbG9hZF9kZWZhdWx0X2dkdChzZWdfZGVzY190ICpnZHQsIHVuc2lnbmVkIGludCBjcHUp
CkBAIC0xNjQ4LDYgKzE2NTIsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9hZF9kZWZhdWx0X2dk
dChzZWdfZGVzY190ICpnZHQsIHVuc2lnbmVkIGludCBjcHUpCiAgICAgZ2R0X2Rlc2MuYmFzZSAg
PSAodW5zaWduZWQgbG9uZykoZ2R0IC0gRklSU1RfUkVTRVJWRURfR0RUX0VOVFJZKTsKIAogICAg
IGxnZHQoJmdkdF9kZXNjKTsKKworICAgIHBlcl9jcHUoZnVsbF9nZHRfbG9hZGVkLCBjcHUpID0g
ZmFsc2U7CiB9CiAKIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2godm9pZCkKQEAgLTE2NTgs
NiArMTY2NCw3IEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2godm9pZCkKICAgICBzdHJ1
Y3QgdmNwdSAgICAgICAgICAqbiA9IGN1cnJlbnQ7CiAgICAgc3RydWN0IGRvbWFpbiAgICAgICAg
KnBkID0gcC0+ZG9tYWluLCAqbmQgPSBuLT5kb21haW47CiAgICAgc2VnX2Rlc2NfdCAgICAgICAg
ICAgKmdkdDsKKyAgICBib29sICAgICAgICAgICAgICAgICAgbmVlZF9mdWxsX2dkdF9uOwogCiAg
ICAgQVNTRVJUKHAgIT0gbik7CiAgICAgQVNTRVJUKCF2Y3B1X2NwdV9kaXJ0eShuKSk7CkBAIC0x
NzAwLDExICsxNzA3LDEzIEBAIHN0YXRpYyB2b2lkIF9fY29udGV4dF9zd2l0Y2godm9pZCkKICAg
ICBnZHQgPSAhaXNfcHZfMzJiaXRfZG9tYWluKG5kKSA/IHBlcl9jcHUoZ2R0X3RhYmxlLCBjcHUp
IDoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBlcl9jcHUoY29tcGF0X2dk
dF90YWJsZSwgY3B1KTsKIAotICAgIGlmICggbmVlZF9mdWxsX2dkdChuZCkgKQorICAgIG5lZWRf
ZnVsbF9nZHRfbiA9IG5lZWRfZnVsbF9nZHQobmQpOworCisgICAgaWYgKCBuZWVkX2Z1bGxfZ2R0
X24gKQogICAgICAgICB3cml0ZV9mdWxsX2dkdF9wdGVzKGdkdCwgbik7CiAKLSAgICBpZiAoIG5l
ZWRfZnVsbF9nZHQocGQpICYmCi0gICAgICAgICAoKHAtPnZjcHVfaWQgIT0gbi0+dmNwdV9pZCkg
fHwgIW5lZWRfZnVsbF9nZHQobmQpKSApCisgICAgaWYgKCBwZXJfY3B1KGZ1bGxfZ2R0X2xvYWRl
ZCwgY3B1KSAmJgorICAgICAgICAgKChwLT52Y3B1X2lkICE9IG4tPnZjcHVfaWQpIHx8ICFuZWVk
X2Z1bGxfZ2R0X24pICkKICAgICAgICAgbG9hZF9kZWZhdWx0X2dkdChnZHQsIGNwdSk7CiAKICAg
ICB3cml0ZV9wdGJhc2Uobik7CkBAIC0xNzE2LDggKzE3MjUsNyBAQCBzdGF0aWMgdm9pZCBfX2Nv
bnRleHRfc3dpdGNoKHZvaWQpCiAgICAgICAgIHN2bV9sb2FkX3NlZ3MoMCwgMCwgMCwgMCwgMCwg
MCwgMCk7CiAjZW5kaWYKIAotICAgIGlmICggbmVlZF9mdWxsX2dkdChuZCkgJiYKLSAgICAgICAg
ICgocC0+dmNwdV9pZCAhPSBuLT52Y3B1X2lkKSB8fCAhbmVlZF9mdWxsX2dkdChwZCkpICkKKyAg
ICBpZiAoIG5lZWRfZnVsbF9nZHRfbiAmJiAhcGVyX2NwdShmdWxsX2dkdF9sb2FkZWQsIGNwdSkg
KQogICAgICAgICBsb2FkX2Z1bGxfZ2R0KG4sIGNwdSk7CiAKICAgICBpZiAoIHBkICE9IG5kICkK
LS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
