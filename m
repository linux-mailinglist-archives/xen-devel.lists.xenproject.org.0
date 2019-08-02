Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C57FDE7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwK-0005o0-MK; Fri, 02 Aug 2019 15:57:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwJ-0005nY-8c
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:57:55 +0000
X-Inumbo-ID: 4784b75c-b53e-11e9-88c6-d7550dcbd3a0
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4784b75c-b53e-11e9-88c6-d7550dcbd3a0;
 Fri, 02 Aug 2019 15:57:50 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YTNn9mWiPmVoaR/3r5d6oXyOiwVlzUyRxDWdeKlIvzrfDwk8fxwUDmJWWZQYG1wTAKQaDss+eb
 pszbjjZwTfLWGn3bQDQccuxjPGKIOovB2JoqHX95g4evUHOET2da/3pdld9wsmuk2DRfbNRdhp
 w1oH41TTVuLm4pXeSo7WFz+W0Qzz4nd7KfBotQA1dejpRJCnheuaeFnuATR4x0lTiAWkINZ5YQ
 4ETDKzpzPLcttotJ+FKH0wHrEXrBfT3YK2eA83GbsADPo6aWD2sFt5ZyM7rS4mo2gz/eDBkrLz
 E1c=
X-SBRS: 2.7
X-MesageID: 3951211
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3951211"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:43 +0100
Message-ID: <20190802153606.32061-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 12/35] libxl: Re-introduce libxl__domain_unpause
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bGlieGxfX2RvbWFpbl91bnBhdXNlIGlzIGEgcmVpbXBsZW1lbnRhdGlvbiBvZgpsaWJ4bF9fZG9t
YWluX3VucGF1c2VfZGVwcmVjYXRlZCB3aXRoIGFzeW5jaHJvbm91cyBvcGVyYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0t
CiB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAgIHwgNTIgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDUgKysrLQog
MiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21h
aW4uYwppbmRleCBkNzhmZmE2YjYwLi41MmE4YmQ3ODk1IDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9kb21haW4uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwpAQCAtNjM5
LDYgKzYzOSw1OCBAQCBpbnQgbGlieGxfX2RvbWFpbl91bnBhdXNlX2RlcHJlY2F0ZWQobGlieGxf
X2djICpnYywgbGlieGxfZG9taWQgZG9taWQpCiAgICAgcmV0dXJuIHJjOwogfQogCitzdGF0aWMg
dm9pZCBkb21haW5fdW5wYXVzZV9kb25lKGxpYnhsX19lZ2MgKmVnYywKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfX2RtX3Jlc3VtZV9zdGF0ZSAqLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgcmMpOworCit2b2lkIGxpYnhsX19kb21haW5fdW5wYXVz
ZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF9fZG1f
cmVzdW1lX3N0YXRlICpkbXJzKQoreworICAgIFNUQVRFX0FPX0dDKGRtcnMtPmFvKTsKKyAgICBp
bnQgcmMgPSAwOworCisgICAgLyogQ29udmVuaWVuY2UgYWxpYXNlcyAqLworICAgIGxpYnhsX2Rv
bWlkIGRvbWlkID0gZG1ycy0+ZG9taWQ7CisKKyAgICBsaWJ4bF9kb21haW5fdHlwZSB0eXBlID0g
bGlieGxfX2RvbWFpbl90eXBlKGdjLCBkb21pZCk7CisgICAgaWYgKHR5cGUgPT0gTElCWExfRE9N
QUlOX1RZUEVfSU5WQUxJRCkgeworICAgICAgICByYyA9IEVSUk9SX0ZBSUw7CisgICAgICAgIGdv
dG8gb3V0OworICAgIH0KKworICAgIGlmICh0eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTSkg
eworICAgICAgICBkbXJzLT5kbV9yZXN1bWVkX2NhbGxiYWNrID0gZG9tYWluX3VucGF1c2VfZG9u
ZTsKKyAgICAgICAgbGlieGxfX2RtX3Jlc3VtZShlZ2MsIGRtcnMpOyAvKiBtdXN0IGJlIGxhc3Qg
Ki8KKyAgICAgICAgcmV0dXJuOworICAgIH0KKyAgICByYyA9IDA7CitvdXQ6CisgICAgZG9tYWlu
X3VucGF1c2VfZG9uZShlZ2MsIGRtcnMsIHJjKTsKK30KKworc3RhdGljIHZvaWQgZG9tYWluX3Vu
cGF1c2VfZG9uZShsaWJ4bF9fZWdjICplZ2MsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKmRtcnMsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludCByYykKK3sKKyAgICBFR0NfR0M7CisgICAgaW50IHI7CisKKyAgICAvKiBD
b252ZW5pZW5jZSBhbGlhc2VzICovCisgICAgbGlieGxfZG9taWQgZG9taWQgPSBkbXJzLT5kb21p
ZDsKKworICAgIGlmIChyYykgZ290byBvdXQ7CisKKyAgICByID0geGNfZG9tYWluX3VucGF1c2Uo
Q1RYLT54Y2gsIGRvbWlkKTsKKyAgICBpZiAociA8IDApIHsKKyAgICAgICAgTE9HRUQoRVJST1Is
IGRvbWlkLCAiVW5wYXVzaW5nIGRvbWFpbiIpOworICAgICAgICByYyA9IEVSUk9SX0ZBSUw7Cisg
ICAgICAgIGdvdG8gb3V0OworICAgIH0KKyAgICByYyA9IDA7CitvdXQ6CisgICAgZG1ycy0+Y2Fs
bGJhY2soZWdjLCBkbXJzLCByYyk7Cit9CisKIGludCBsaWJ4bF9kb21haW5fdW5wYXVzZShsaWJ4
bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgbGlieGxfYXN5bmNvcF9ob3cgKmFvX2hvdykKIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4IGJk
Yzk2Nzc1MjcuLjFjZmUzY2Y4M2YgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVy
bmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMTM1MCw5ICsxMzUw
LDEwIEBAIHN0cnVjdCBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlIHsKICAgICBsaWJ4bF9kb21pZCBk
b21pZDsKICAgICB2b2lkICgqY2FsbGJhY2spKGxpYnhsX19lZ2MgKiwgbGlieGxfX2RtX3Jlc3Vt
ZV9zdGF0ZSAqLCBpbnQgcmMpOwogCi0gICAgLyogcHJpdmF0ZSB0byBsaWJ4bF9fZG9tYWluX3Jl
c3VtZSAqLworICAgIC8qIHByaXZhdGUgdG8gbGlieGxfX2RvbWFpbl9yZXN1bWUgYW5kIGxpYnhs
X19kb21haW5fdW5wYXVzZSAqLwogICAgIHZvaWQgKCpkbV9yZXN1bWVkX2NhbGxiYWNrKShsaWJ4
bF9fZWdjICosCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1
bWVfc3RhdGUgKiwgaW50IHJjKTsKKyAgICAvKiBwcml2YXRlIHRvIGxpYnhsX19kb21haW5fcmVz
dW1lICovCiAgICAgYm9vbCBzdXNwZW5kX2NhbmNlbDsKIAogICAgIC8qIHByaXZhdGUgdG8gbGli
eGxfX2RtX3Jlc3VtZSAqLwpAQCAtMTM2NSw2ICsxMzY2LDggQEAgX2hpZGRlbiB2b2lkIGxpYnhs
X19kbV9yZXN1bWUobGlieGxfX2VnYyAqZWdjLAogX2hpZGRlbiB2b2lkIGxpYnhsX19kb21haW5f
cmVzdW1lKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBsaWJ4bF9fZG1fcmVzdW1lX3N0YXRlICpkbXJzLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJvb2wgc3VzcGVuZF9jYW5jZWwpOworX2hpZGRlbiB2b2lkIGxpYnhsX19kb21h
aW5fdW5wYXVzZShsaWJ4bF9fZWdjICosCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGxpYnhsX19kbV9yZXN1bWVfc3RhdGUgKmRtcnMpOwogCiAvKiByZXR1cm5zIDAgb3IgMSwg
b3IgYSBsaWJ4bCBlcnJvciBjb2RlICovCiBfaGlkZGVuIGludCBsaWJ4bF9fZG9tYWluX3B2Y29u
dHJvbF9hdmFpbGFibGUobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQpOwotLSAKQW50aG9u
eSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
