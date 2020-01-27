Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0614AA23
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 20:00:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw9YY-0004Zq-Rj; Mon, 27 Jan 2020 18:56:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V40H=3Q=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iw9YW-0004Zl-TR
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 18:56:16 +0000
X-Inumbo-ID: b182abf8-4136-11ea-859d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b182abf8-4136-11ea-859d-12813bfff9fa;
 Mon, 27 Jan 2020 18:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580151376;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=ywQ0ZJqmvvPJIZ5OQ/KNiQV+lAY3DsCIgW5Mnl9+td0=;
 b=HXRdoYxsE5u+eQXlkg9TRLjrFq4cSz+mnAu5ezKT0KdLLcQvYLqVpICW
 kNbUF4XcHQppTp8FNN/eLw3vm0QrBIlGNJseY+WMnAvGKuz2yRNLdSGPd
 GALSJd0lnztUh0CcaPuQICqPBXOmQjZH/3t8SK1OlUbVa/uFv0EBp3SEr c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nk0n1KqGm7LM/fbcGK9peGFQ7c0rqJDjuPTn2ri8/L3B/WnJaX52DuwMXsp9cNE76JX4Xm3AT+
 6uB+VJDzsmdEj9t2mEEUpy+V171UrHWDJObdknz6sq4rFMqlzKLvcNSACzgMc9JMdWw3KCnIMP
 rthqWh7lqLgAC+ABeNsiAIeUn5J+3xMAsHuEGmp8r1pPnybDw6Nr0ZxRgeG7OJ56ZZa3lZ+Xf3
 seODrtF9WVGMcKXS0c31U5pHjOZJ3y+k9k7XoebQ1QEbNLYIb+ThKnZUmG9n3fJ5OfLeghrrO/
 psI=
X-SBRS: 2.7
X-MesageID: 11503677
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11503677"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 18:56:10 +0000
Message-ID: <1580151370-6409-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] RCU: reimplement RCU barrier to avoid deadlock
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
Cc: Igor
 Druzhinin <igor.druzhinin@citrix.com>, sstabellini@kernel.org, julien@xen.org,
 wl@xen.org, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGV4aXN0aW5nIFJDVSBiYXJyaWVyIGltcGxlbWVudGF0aW9uIGlzIHByb25lIHRvIGEgZGVh
ZGxvY2sgc2NlbmFyaW8KZHVlIHRvIElSUXMgYmVpbmcgcmUtZW5hYmxlZCBpbnNpZGUgc3RvcG1h
Y2hpbmUgY29udGV4dC4gSWYgZHVlIHRvIGEgcmFjZQpJUlFzIGFyZSByZS1lbmFibGVkIG9uIHNv
bWUgb2YgQ1BVcyBhbmQgc29mdGlycXMgYXJlIGFsbG93ZWQgdG8gYmUKcHJvY2Vzc2VkIGluIHN0
b3BtYWNoaW5lLCBpLmUuIHdoYXQgY3VycmVudGx5IGhhcHBlbnMgaW4gcmN1X2JhcnJpZXIoKSwK
dGltZXIgaW50ZXJydXB0IGlzIGFibGUgdG8gaW52b2tlIFRTQyBzeW5jaHJvbml6YXRpb24gcmVu
ZGV6dm91cy4KQXQgdGhpcyBtb21lbnQgc2VuZGluZyBUU0Mgc3luY2hyb25pemF0aW9uIElQSSB3
aWxsIHN0YWxsIHdhaXRpbmcgZm9yCm90aGVyIENQVXMgdG8gc3luY2hyb25pemUgd2hpbGUgdGhl
eSBpbiB0dXJuIGFyZSB3YWl0aW5nIGluIHN0b3BtYWNoaW5lCmJ1c3kgbG9vcCB3aXRoIElSUXMg
ZGlzYWJsZWQuCgpUbyBhdm9pZCB0aGUgc2NlbmFyaW8gYWJvdmUgLSByZWltcGxlbWVudCByY3Vf
YmFycmllcigpIGluIGEgd2F5IHdoZXJlCklSUXMgYXJlIG5vdCBiZWluZyBkaXNhYmxlZCBhdCBh
bnkgbW9tZW50LiBUaGUgcHJvcG9zZWQgaW1wbGVtZW50YXRpb24KaXMganVzdCBhIHNpbXBsaWZp
ZWQgYW5kIHNwZWNpYWxpemVkIHZlcnNpb24gb2Ygc3RvcG1hY2hpbmUuIFRoZSBzZW1hbnRpYwpv
ZiB0aGUgY2FsbCBpcyBwcmVzZXJ2ZWQuCgpTaWduZWQtb2ZmLWJ5OiBJZ29yIERydXpoaW5pbiA8
aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4KLS0tClRoaXMgY2hhbmdlIGhhcyBiZWVuIHN0cmVz
cyB0ZXN0ZWQgYnkgZG9pbmcgYWN0aW9ucyBpbnZva2luZyByY3VfYmFycmllcigpCmZ1bmN0aW9u
YWxpdHkgYW5kIGRpZG4ndCBzaG93IGFueSBpc3N1ZXMuCi0tLQogeGVuL2NvbW1vbi9yY3VwZGF0
ZS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9yY3VwZGF0ZS5jIGIveGVuL2NvbW1vbi9yY3VwZGF0ZS5jCmluZGV4IGNiNzEyYzgu
Ljk1YTFmODUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcmN1cGRhdGUuYworKysgYi94ZW4vY29t
bW9uL3JjdXBkYXRlLmMKQEAgLTE0NSw2ICsxNDUsOSBAQCBzdHJ1Y3QgcmN1X2JhcnJpZXJfZGF0
YSB7CiAgICAgYXRvbWljX3QgKmNwdV9jb3VudDsKIH07CiAKK3N0YXRpYyBERUZJTkVfUEVSX0NQ
VShzdHJ1Y3QgdGFza2xldCwgcmN1X2JhcnJpZXJfdGFza2xldCk7CitzdGF0aWMgYXRvbWljX3Qg
cmN1X2JhcnJpZXJfY3B1X2NvdW50LCByY3VfYmFycmllcl9jcHVfZG9uZTsKKwogc3RhdGljIHZv
aWQgcmN1X2JhcnJpZXJfY2FsbGJhY2soc3RydWN0IHJjdV9oZWFkICpoZWFkKQogewogICAgIHN0
cnVjdCByY3VfYmFycmllcl9kYXRhICpkYXRhID0gY29udGFpbmVyX29mKApAQCAtMTUyLDEyICsx
NTUsOSBAQCBzdGF0aWMgdm9pZCByY3VfYmFycmllcl9jYWxsYmFjayhzdHJ1Y3QgcmN1X2hlYWQg
KmhlYWQpCiAgICAgYXRvbWljX2luYyhkYXRhLT5jcHVfY291bnQpOwogfQogCi1zdGF0aWMgaW50
IHJjdV9iYXJyaWVyX2FjdGlvbih2b2lkICpfY3B1X2NvdW50KQorc3RhdGljIHZvaWQgcmN1X2Jh
cnJpZXJfYWN0aW9uKHZvaWQgKnVudXNlZCkKIHsKLSAgICBzdHJ1Y3QgcmN1X2JhcnJpZXJfZGF0
YSBkYXRhID0geyAuY3B1X2NvdW50ID0gX2NwdV9jb3VudCB9OwotCi0gICAgQVNTRVJUKCFsb2Nh
bF9pcnFfaXNfZW5hYmxlZCgpKTsKLSAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CisgICAgc3RydWN0
IHJjdV9iYXJyaWVyX2RhdGEgZGF0YSA9IHsgLmNwdV9jb3VudCA9ICZyY3VfYmFycmllcl9jcHVf
Y291bnQgfTsKIAogICAgIC8qCiAgICAgICogV2hlbiBjYWxsYmFjayBpcyBleGVjdXRlZCwgYWxs
IHByZXZpb3VzbHktcXVldWVkIFJDVSB3b3JrIG9uIHRoaXMgQ1BVCkBAIC0xNzIsMTUgKzE3Miwz
MCBAQCBzdGF0aWMgaW50IHJjdV9iYXJyaWVyX2FjdGlvbih2b2lkICpfY3B1X2NvdW50KQogICAg
ICAgICBjcHVfcmVsYXgoKTsKICAgICB9CiAKLSAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwotCi0g
ICAgcmV0dXJuIDA7CisgICAgYXRvbWljX2luYygmcmN1X2JhcnJpZXJfY3B1X2RvbmUpOwogfQog
CiBpbnQgcmN1X2JhcnJpZXIodm9pZCkKIHsKLSAgICBhdG9taWNfdCBjcHVfY291bnQgPSBBVE9N
SUNfSU5JVCgwKTsKLSAgICByZXR1cm4gc3RvcF9tYWNoaW5lX3J1bihyY3VfYmFycmllcl9hY3Rp
b24sICZjcHVfY291bnQsIE5SX0NQVVMpOworICAgIHVuc2lnbmVkIGludCBpOworCisgICAgaWYg
KCAhZ2V0X2NwdV9tYXBzKCkgKQorICAgICAgICByZXR1cm4gLUVCVVNZOworCisgICAgYXRvbWlj
X3NldCgmcmN1X2JhcnJpZXJfY3B1X2NvdW50LCAwKTsKKyAgICBhdG9taWNfc2V0KCZyY3VfYmFy
cmllcl9jcHVfZG9uZSwgMCk7CisKKyAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggaSApCisgICAg
ICAgIGlmICggaSAhPSBzbXBfcHJvY2Vzc29yX2lkKCkgKQorICAgICAgICAgICAgdGFza2xldF9z
Y2hlZHVsZV9vbl9jcHUoJnBlcl9jcHUocmN1X2JhcnJpZXJfdGFza2xldCwgaSksIGkpOworCisg
ICAgcmN1X2JhcnJpZXJfYWN0aW9uKE5VTEwpOworCisgICAgd2hpbGUgKCBhdG9taWNfcmVhZCgm
cmN1X2JhcnJpZXJfY3B1X2RvbmUpICE9IG51bV9vbmxpbmVfY3B1cygpICkKKyAgICAgICAgY3B1
X3JlbGF4KCk7CisKKyAgICBwdXRfY3B1X21hcHMoKTsKKyAgICByZXR1cm4gMDsKIH0KIAogLyog
SXMgYmF0Y2ggYSBiZWZvcmUgYmF0Y2ggYiA/ICovCkBAIC01NjQsNiArNTc5LDcgQEAgc3RhdGlj
IHZvaWQgcmN1X2luaXRfcGVyY3B1X2RhdGEoaW50IGNwdSwgc3RydWN0IHJjdV9jdHJsYmxrICpy
Y3AsCiAgICAgcmRwLT5jcHUgPSBjcHU7CiAgICAgcmRwLT5ibGltaXQgPSBibGltaXQ7CiAgICAg
aW5pdF90aW1lcigmcmRwLT5pZGxlX3RpbWVyLCByY3VfaWRsZV90aW1lcl9oYW5kbGVyLCByZHAs
IGNwdSk7CisgICAgdGFza2xldF9pbml0KCZwZXJfY3B1KHJjdV9iYXJyaWVyX3Rhc2tsZXQsIGNw
dSksIHJjdV9iYXJyaWVyX2FjdGlvbiwgTlVMTCk7CiB9CiAKIHN0YXRpYyBpbnQgY3B1X2NhbGxi
YWNrKAotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
