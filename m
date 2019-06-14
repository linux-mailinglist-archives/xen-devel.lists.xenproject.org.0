Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9145B64
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:28:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKM-0007TI-La; Fri, 14 Jun 2019 11:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKL-0007T9-E3
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:25:01 +0000
X-Inumbo-ID: 0a0760aa-8e97-11e9-9df2-6f477a47ccb4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a0760aa-8e97-11e9-9df2-6f477a47ccb4;
 Fri, 14 Jun 2019 11:24:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B4g2j01qBHPBe1inYvHEy9tGwzv02NI4UcK0IMnEdTK+2o0y3bQVGy41sDpf6tM9bWD6VuD0mY
 bOzn5YvzW+cHng3GQ/U6gDl+CjVTpuxknHSXHHQPYcVtAY6c4Ki8sZqC7zPIsF404dCD/iOmDU
 hb67dLmR9vnbTGL8m/pBcZyeOthl3wYpJRcmu6HhVYqSPiMhPTNt/QkfXrpGaYdbHQ7WFPq0qK
 ygKuwT99ji/PPNyUsqF2Gy9GGzImaz/my3hCcPLbeM9+fxDxuY9q2CXgS8ve51IZmtokibOSeX
 i4U=
X-SBRS: 2.7
X-MesageID: 1737471
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737471"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:38 +0100
Message-ID: <20190614112444.29980-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 09/15] libxl_domain: Cleanup libxl__destroy_domid
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LSBkb21fcGF0aCBpc24ndCB1c2VkIGFueW1vcmUgaW4gdGhhdCBmdW5jdGlvbiwgcmVtb3ZlIGl0
LgotIFVzZSBgcicgdG8gc3RvcmUgcmV0dXJuIHZhbHVlIG9mIGV4dGVybmFsIGNhbGxzLgotIFVz
ZSBgQ1RYJywgbm8gbmVlZCBmb3IgYSBsb2NhbCBgY3R4Jy4KClNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX2RvbWFpbi5jIHwgMTggKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9s
aWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmluZGV4IGFlZTYyMWIw
YTUuLjExYTI5YjIzNWIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBAIC0xMDIzLDE0ICsxMDIzLDEzIEBAIHN0
YXRpYyB2b2lkIGRvbWFpbl9kZXN0cm95X2RvbWlkX2NiKGxpYnhsX19lZ2MgKmVnYywKIHZvaWQg
bGlieGxfX2Rlc3Ryb3lfZG9taWQobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZGVzdHJveV9kb21p
ZF9zdGF0ZSAqZGlzKQogewogICAgIFNUQVRFX0FPX0dDKGRpcy0+YW8pOwotICAgIGxpYnhsX2N0
eCAqY3R4ID0gQ1RYOwogICAgIHVpbnQzMl90IGRvbWlkID0gZGlzLT5kb21pZDsKLSAgICBjaGFy
ICpkb21fcGF0aDsKICAgICBpbnQgcmMsIGRtX3ByZXNlbnQ7CisgICAgaW50IHI7CiAKICAgICBs
aWJ4bF9fZXZfY2hpbGRfaW5pdCgmZGlzLT5kZXN0cm95ZXIpOwogCi0gICAgcmMgPSBsaWJ4bF9k
b21haW5faW5mbyhjdHgsIE5VTEwsIGRvbWlkKTsKKyAgICByYyA9IGxpYnhsX2RvbWFpbl9pbmZv
KENUWCwgTlVMTCwgZG9taWQpOwogICAgIHN3aXRjaChyYykgewogICAgIGNhc2UgMDoKICAgICAg
ICAgYnJlYWs7CkBAIC0xMDU4LDE3ICsxMDU3LDEyIEBAIHZvaWQgbGlieGxfX2Rlc3Ryb3lfZG9t
aWQobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZGVzdHJveV9kb21pZF9zdGF0ZSAqZGlzKQogICAg
ICAgICBhYm9ydCgpOwogICAgIH0KIAotICAgIGRvbV9wYXRoID0gbGlieGxfX3hzX2dldF9kb21w
YXRoKGdjLCBkb21pZCk7Ci0gICAgaWYgKCFkb21fcGF0aCkgewotICAgICAgICByYyA9IEVSUk9S
X0ZBSUw7Ci0gICAgICAgIGdvdG8gb3V0OwotICAgIH0KLQogICAgIGlmIChsaWJ4bF9fZGV2aWNl
X3BjaV9kZXN0cm95X2FsbChnYywgZG9taWQpIDwgMCkKICAgICAgICAgTE9HRChFUlJPUiwgZG9t
aWQsICJQY2kgc2h1dGRvd24gZmFpbGVkIik7Ci0gICAgcmMgPSB4Y19kb21haW5fcGF1c2UoY3R4
LT54Y2gsIGRvbWlkKTsKLSAgICBpZiAocmMgPCAwKSB7Ci0gICAgICAgIExPR0VWRChFUlJPUiwg
cmMsIGRvbWlkLCAieGNfZG9tYWluX3BhdXNlIGZhaWxlZCIpOworICAgIHIgPSB4Y19kb21haW5f
cGF1c2UoQ1RYLT54Y2gsIGRvbWlkKTsKKyAgICBpZiAociA8IDApIHsKKyAgICAgICAgTE9HRVZE
KEVSUk9SLCByLCBkb21pZCwgInhjX2RvbWFpbl9wYXVzZSBmYWlsZWQiKTsKKyAgICAgICAgcmMg
PSBFUlJPUl9GQUlMOwogICAgIH0KIAogICAgIGlmIChkbV9wcmVzZW50KSB7Ci0tIApBbnRob255
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
