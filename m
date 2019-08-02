Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAE17FDF2
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwy-0006dV-AJ; Fri, 02 Aug 2019 15:58:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZww-0006aH-1j
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:34 +0000
X-Inumbo-ID: 60d1086e-b53e-11e9-8f4b-ffbcaae814cf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60d1086e-b53e-11e9-8f4b-ffbcaae814cf;
 Fri, 02 Aug 2019 15:58:32 +0000 (UTC)
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
IronPort-SDR: xzcBt1ITsz0PlRLz7RLYxHuXGRC7tFnIqz5VT++3xWRx/laF06sl4wlnkVR2a1L9wah8J8Zy3s
 XPEa8+UdRDBM9zjQkHLUnJcpzz0gOyxywm75YmjopgzCN3H8o8CbVraZc9rh5kJvYPOjtgIV4B
 j+BAJXxY88PQg16bKELSa3Um0MCyRzE12PXYlTX/UFwZUf0Xp/+Rft3vsg5Wp/rP++bd8hBb51
 NIf+ohhMZUwzEqJUqHL6TfNPug5ESrv+7EdbsluXB4i5A6s3bpl44k3ipLscmr2W2AzqDG1IdT
 9jg=
X-SBRS: 2.7
X-MesageID: 3787857
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3787857"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:36:02 +0100
Message-ID: <20190802153606.32061-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 31/35] libxl: Use ev_qmp for libxl_send_trigger
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICB8IDQ5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAyIC0t
CiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgIDUgLS0tLQogMyBmaWxlcyBjaGFuZ2Vk
LCA0MiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9kb21haW4uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmluZGV4IGNk
NzE5MDAzNTAuLjA4ZDNmYzlmYmMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFp
bi5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBAIC0xNTU2LDE5ICsxNTU2LDM5
IEBAIGludCBsaWJ4bF9zZXRfdmNwdW9ubGluZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9t
aWQsCiAgICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9CiAKLXN0YXRpYyBpbnQgbGlieGxfX2Rv
bWFpbl9zM19yZXN1bWUobGlieGxfX2djICpnYywgaW50IGRvbWlkKQorc3RhdGljIHZvaWQgZG9t
YWluX3MzX3Jlc3VtZV9kb25lKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3FtcCAqcW1wLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVj
dCAqcmVzcG9uc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsK
Kworc3RhdGljIHZvaWQgZG9tYWluX3MzX3Jlc3VtZShsaWJ4bF9fYW8gKmFvLCBsaWJ4bF9fZWdj
ICplZ2MsIGludCBkb21pZCkKIHsKKyAgICBBT19HQzsKKyAgICBsaWJ4bF9fZXZfcW1wICpxbXA7
CiAgICAgaW50IHJjID0gMDsKKyAgICBpbnQgcjsKKworICAgIEdDTkVXKHFtcCk7CisgICAgbGli
eGxfX2V2X3FtcF9pbml0KHFtcCk7CisgICAgcW1wLT5hbyA9IGFvOworICAgIHFtcC0+ZG9taWQg
PSBkb21pZDsKKyAgICBxbXAtPnBheWxvYWRfZmQgPSAtMTsKKyAgICBxbXAtPmNhbGxiYWNrID0g
ZG9tYWluX3MzX3Jlc3VtZV9kb25lOwogCiAgICAgc3dpdGNoIChsaWJ4bF9fZG9tYWluX3R5cGUo
Z2MsIGRvbWlkKSkgewogICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfSFZNOgogICAgICAgICBz
d2l0Y2ggKGxpYnhsX19kZXZpY2VfbW9kZWxfdmVyc2lvbl9ydW5uaW5nKGdjLCBkb21pZCkpIHsK
ICAgICAgICAgY2FzZSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJ
T05BTDoKLSAgICAgICAgICAgIHJjID0geGNfaHZtX3BhcmFtX3NldChDVFgtPnhjaCwgZG9taWQs
IEhWTV9QQVJBTV9BQ1BJX1NfU1RBVEUsIDApOworICAgICAgICAgICAgciA9IHhjX2h2bV9wYXJh
bV9zZXQoQ1RYLT54Y2gsIGRvbWlkLCBIVk1fUEFSQU1fQUNQSV9TX1NUQVRFLCAwKTsKKyAgICAg
ICAgICAgIGlmIChyKSB7CisgICAgICAgICAgICAgICAgTE9HRUQoRVJST1IsIGRvbWlkLCAiU2Vu
ZCB0cmlnZ2VyICclcycgZmFpbGVkIiwKKyAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF90cmln
Z2VyX3RvX3N0cmluZyhMSUJYTF9UUklHR0VSX1MzUkVTVU1FKSk7CisgICAgICAgICAgICAgICAg
cmMgPSBFUlJPUl9GQUlMOworICAgICAgICAgICAgfQogICAgICAgICAgICAgYnJlYWs7CiAgICAg
ICAgIGNhc2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU46Ci0gICAgICAgICAg
ICByYyA9IGxpYnhsX19xbXBfc3lzdGVtX3dha2V1cChnYywgZG9taWQpOwotICAgICAgICAgICAg
YnJlYWs7CisgICAgICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAic3lz
dGVtX3dha2V1cCIsIE5VTEwpOworICAgICAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICAg
ICAgICAgIHJldHVybjsKICAgICAgICAgZGVmYXVsdDoKICAgICAgICAgICAgIHJjID0gRVJST1Jf
SU5WQUw7CiAgICAgICAgICAgICBicmVhazsKQEAgLTE1NzksNyArMTU5OSwyMiBAQCBzdGF0aWMg
aW50IGxpYnhsX19kb21haW5fczNfcmVzdW1lKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCkKICAg
ICAgICAgYnJlYWs7CiAgICAgfQogCi0gICAgcmV0dXJuIHJjOworb3V0OgorICAgIGRvbWFpbl9z
M19yZXN1bWVfZG9uZShlZ2MsIHFtcCwgTlVMTCwgcmMpOworfQorCitzdGF0aWMgdm9pZCBkb21h
aW5fczNfcmVzdW1lX2RvbmUobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfcW1wICpxbXAsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0
ICpyZXNwb25zZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCit7
CisgICAgRUdDX0dDOworCisgICAgaWYgKHJjKQorICAgICAgICBMT0dEKEVSUk9SLCBxbXAtPmRv
bWlkLCAiU2VuZCB0cmlnZ2VyICclcycgZmFpbGVkLCByYz0lZCIsCisgICAgICAgICAgICAgIGxp
YnhsX3RyaWdnZXJfdG9fc3RyaW5nKExJQlhMX1RSSUdHRVJfUzNSRVNVTUUpLCByYyk7CisKKyAg
ICBsaWJ4bF9fZXZfcW1wX2Rpc3Bvc2UoZ2MsIHFtcCk7CisgICAgbGlieGxfX2FvX2NvbXBsZXRl
KGVnYywgcW1wLT5hbywgcmMpOwogfQogCiBpbnQgbGlieGxfc2VuZF90cmlnZ2VyKGxpYnhsX2N0
eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKQEAgLTE2MTEsOCArMTY0Niw4IEBAIGludCBsaWJ4bF9z
ZW5kX3RyaWdnZXIobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9TRU5EVFJJR0dFUl9SRVNFVCwgdmNw
dWlkKTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBMSUJYTF9UUklHR0VSX1MzUkVTVU1FOgot
ICAgICAgICByYyA9IGxpYnhsX19kb21haW5fczNfcmVzdW1lKGdjLCBkb21pZCk7Ci0gICAgICAg
IGJyZWFrOworICAgICAgICBkb21haW5fczNfcmVzdW1lKGFvLCBlZ2MsIGRvbWlkKTsgLyogbXVz
dCBiZSBsYXN0ICovCisgICAgICAgIHJldHVybiBBT19JTlBST0dSRVNTOwogICAgIGRlZmF1bHQ6
CiAgICAgICAgIHJjID0gLTE7CiAgICAgICAgIGVycm5vID0gRUlOVkFMOwpkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFs
LmgKaW5kZXggM2U3Y2I0MDA1ZC4uYzZiOTY1NWFmMiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0x
OTgzLDggKzE5ODMsNiBAQCB0eXBlZGVmIHN0cnVjdCBsaWJ4bF9fcW1wX2hhbmRsZXIgbGlieGxf
X3FtcF9oYW5kbGVyOwogICovCiBfaGlkZGVuIGxpYnhsX19xbXBfaGFuZGxlciAqbGlieGxfX3Ft
cF9pbml0aWFsaXplKGxpYnhsX19nYyAqZ2MsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkKTsKLS8qIFJlc3VtZSBodm0gZG9t
YWluICovCi1faGlkZGVuIGludCBsaWJ4bF9fcW1wX3N5c3RlbV93YWtldXAobGlieGxfX2djICpn
YywgaW50IGRvbWlkKTsKIC8qIFJlc3VtZSBRRU1VLiAqLwogX2hpZGRlbiBpbnQgbGlieGxfX3Ft
cF9yZXN1bWUobGlieGxfX2djICpnYywgaW50IGRvbWlkKTsKIC8qIExvYWQgY3VycmVudCBRRU1V
IHN0YXRlIGZyb20gZmlsZS4gKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5j
IGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggOGZhYzczN2ZhZC4uNDAwNDNhMGE0NSAx
MDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwvbGli
eGxfcW1wLmMKQEAgLTc1MiwxMSArNzUyLDYgQEAgc3RhdGljIGludCBxbXBfcnVuX2NvbW1hbmQo
bGlieGxfX2djICpnYywgaW50IGRvbWlkLAogICAgIHJldHVybiByYzsKIH0KIAotaW50IGxpYnhs
X19xbXBfc3lzdGVtX3dha2V1cChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQpCi17Ci0gICAgcmV0
dXJuIHFtcF9ydW5fY29tbWFuZChnYywgZG9taWQsICJzeXN0ZW1fd2FrZXVwIiwgTlVMTCwgTlVM
TCwgTlVMTCk7Ci19Ci0KIGludCBsaWJ4bF9fcW1wX3Jlc3RvcmUobGlieGxfX2djICpnYywgaW50
IGRvbWlkLCBjb25zdCBjaGFyICpzdGF0ZV9maWxlKQogewogICAgIGxpYnhsX19qc29uX29iamVj
dCAqYXJncyA9IE5VTEw7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
