Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3AB8032
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0R7-0005Ag-3k; Thu, 19 Sep 2019 17:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0R5-00058c-6l
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:43 +0000
X-Inumbo-ID: b02ec61c-db04-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b02ec61c-db04-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3kw02pMw7RPV+3hTs5NSNRxwOudMz7z9RtfjH4vRfw=;
 b=hO6chc87jyk1H1KEUTXPSGrRH8cX89BQi+/64Anhcorh1Z85QELvwQkU
 UQSh2vTjkEpHxVUmFlf4ipS8yl99/QNHQ5GAg7gxnaUX0v/9OLew52cbU
 tY7NIzRJQnw52fx435EYagqFWU6IiMk2Nv6qsRa6m7olNm5t7RVA2vCOs 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 62Yu4TzZ2wEP++w/tcisTJ3Ta/GdKsRwyvJJoVB7oMKcqQI3bwwF+5aKbmbhUAIijYxGQOmplf
 4upb/G5bmULibllwSor7rgF6h11bM5dsZECcCh8dnTsDtWn6c6xv/8lL4/jx5a+DeyMnGdkBCk
 xnL8t8lxCc7nAedOpwxRNiIKUljrM6mw/t1lDB3zxK9xC3LNR8XCnbot/iS8JZtfEU+YxPYyIJ
 M/XEeKL7VsoGdqXn1Cz8KIAhzBL8E9IFZ1qaEVLcfaxGDAprOS6Of+LTxHc1Xvx7edadqafEbl
 noQ=
X-SBRS: 2.7
X-MesageID: 6010802
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6010802"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:51 +0100
Message-ID: <20190919171656.899649-32-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 31/35] libxl: Use ev_qmp for
 libxl_send_trigger
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDIgLS0KIHRvb2xz
L2xpYnhsL2xpYnhsX3FtcC5jICAgICAgfCAgNSAtLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQyIGlu
c2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2RvbWFpbi5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMKaW5kZXggY2Q3MTkwMDM1
MDA1Li4wOGQzZmM5ZmJjMDMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBAIC0xNTU2LDE5ICsxNTU2LDM5IEBA
IGludCBsaWJ4bF9zZXRfdmNwdW9ubGluZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQs
CiAgICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9CiAKLXN0YXRpYyBpbnQgbGlieGxfX2RvbWFp
bl9zM19yZXN1bWUobGlieGxfX2djICpnYywgaW50IGRvbWlkKQorc3RhdGljIHZvaWQgZG9tYWlu
X3MzX3Jlc3VtZV9kb25lKGxpYnhsX19lZ2MgKmVnYywgbGlieGxfX2V2X3FtcCAqcW1wLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAq
cmVzcG9uc2UsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKKwor
c3RhdGljIHZvaWQgZG9tYWluX3MzX3Jlc3VtZShsaWJ4bF9fYW8gKmFvLCBsaWJ4bF9fZWdjICpl
Z2MsIGludCBkb21pZCkKIHsKKyAgICBBT19HQzsKKyAgICBsaWJ4bF9fZXZfcW1wICpxbXA7CiAg
ICAgaW50IHJjID0gMDsKKyAgICBpbnQgcjsKKworICAgIEdDTkVXKHFtcCk7CisgICAgbGlieGxf
X2V2X3FtcF9pbml0KHFtcCk7CisgICAgcW1wLT5hbyA9IGFvOworICAgIHFtcC0+ZG9taWQgPSBk
b21pZDsKKyAgICBxbXAtPnBheWxvYWRfZmQgPSAtMTsKKyAgICBxbXAtPmNhbGxiYWNrID0gZG9t
YWluX3MzX3Jlc3VtZV9kb25lOwogCiAgICAgc3dpdGNoIChsaWJ4bF9fZG9tYWluX3R5cGUoZ2Ms
IGRvbWlkKSkgewogICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfSFZNOgogICAgICAgICBzd2l0
Y2ggKGxpYnhsX19kZXZpY2VfbW9kZWxfdmVyc2lvbl9ydW5uaW5nKGdjLCBkb21pZCkpIHsKICAg
ICAgICAgY2FzZSBMSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJT05B
TDoKLSAgICAgICAgICAgIHJjID0geGNfaHZtX3BhcmFtX3NldChDVFgtPnhjaCwgZG9taWQsIEhW
TV9QQVJBTV9BQ1BJX1NfU1RBVEUsIDApOworICAgICAgICAgICAgciA9IHhjX2h2bV9wYXJhbV9z
ZXQoQ1RYLT54Y2gsIGRvbWlkLCBIVk1fUEFSQU1fQUNQSV9TX1NUQVRFLCAwKTsKKyAgICAgICAg
ICAgIGlmIChyKSB7CisgICAgICAgICAgICAgICAgTE9HRUQoRVJST1IsIGRvbWlkLCAiU2VuZCB0
cmlnZ2VyICclcycgZmFpbGVkIiwKKyAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF90cmlnZ2Vy
X3RvX3N0cmluZyhMSUJYTF9UUklHR0VSX1MzUkVTVU1FKSk7CisgICAgICAgICAgICAgICAgcmMg
PSBFUlJPUl9GQUlMOworICAgICAgICAgICAgfQogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAg
IGNhc2UgTElCWExfREVWSUNFX01PREVMX1ZFUlNJT05fUUVNVV9YRU46Ci0gICAgICAgICAgICBy
YyA9IGxpYnhsX19xbXBfc3lzdGVtX3dha2V1cChnYywgZG9taWQpOwotICAgICAgICAgICAgYnJl
YWs7CisgICAgICAgICAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAic3lzdGVt
X3dha2V1cCIsIE5VTEwpOworICAgICAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICAgICAg
ICAgIHJldHVybjsKICAgICAgICAgZGVmYXVsdDoKICAgICAgICAgICAgIHJjID0gRVJST1JfSU5W
QUw7CiAgICAgICAgICAgICBicmVhazsKQEAgLTE1NzksNyArMTU5OSwyMiBAQCBzdGF0aWMgaW50
IGxpYnhsX19kb21haW5fczNfcmVzdW1lKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCkKICAgICAg
ICAgYnJlYWs7CiAgICAgfQogCi0gICAgcmV0dXJuIHJjOworb3V0OgorICAgIGRvbWFpbl9zM19y
ZXN1bWVfZG9uZShlZ2MsIHFtcCwgTlVMTCwgcmMpOworfQorCitzdGF0aWMgdm9pZCBkb21haW5f
czNfcmVzdW1lX2RvbmUobGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfcW1wICpxbXAsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpy
ZXNwb25zZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMpCit7Cisg
ICAgRUdDX0dDOworCisgICAgaWYgKHJjKQorICAgICAgICBMT0dEKEVSUk9SLCBxbXAtPmRvbWlk
LCAiU2VuZCB0cmlnZ2VyICclcycgZmFpbGVkLCByYz0lZCIsCisgICAgICAgICAgICAgIGxpYnhs
X3RyaWdnZXJfdG9fc3RyaW5nKExJQlhMX1RSSUdHRVJfUzNSRVNVTUUpLCByYyk7CisKKyAgICBs
aWJ4bF9fZXZfcW1wX2Rpc3Bvc2UoZ2MsIHFtcCk7CisgICAgbGlieGxfX2FvX2NvbXBsZXRlKGVn
YywgcW1wLT5hbywgcmMpOwogfQogCiBpbnQgbGlieGxfc2VuZF90cmlnZ2VyKGxpYnhsX2N0eCAq
Y3R4LCB1aW50MzJfdCBkb21pZCwKQEAgLTE2MTEsOCArMTY0Niw4IEBAIGludCBsaWJ4bF9zZW5k
X3RyaWdnZXIobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9TRU5EVFJJR0dFUl9SRVNFVCwgdmNwdWlk
KTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBMSUJYTF9UUklHR0VSX1MzUkVTVU1FOgotICAg
ICAgICByYyA9IGxpYnhsX19kb21haW5fczNfcmVzdW1lKGdjLCBkb21pZCk7Ci0gICAgICAgIGJy
ZWFrOworICAgICAgICBkb21haW5fczNfcmVzdW1lKGFvLCBlZ2MsIGRvbWlkKTsgLyogbXVzdCBi
ZSBsYXN0ICovCisgICAgICAgIHJldHVybiBBT19JTlBST0dSRVNTOwogICAgIGRlZmF1bHQ6CiAg
ICAgICAgIHJjID0gLTE7CiAgICAgICAgIGVycm5vID0gRUlOVkFMOwpkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgK
aW5kZXggMDBlM2NhZDk5NmM0Li43YWExYTZhOTI0MDkgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAt
MTk4NCw4ICsxOTg0LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgbGlieGxfX3FtcF9oYW5kbGVyIGxpYnhs
X19xbXBfaGFuZGxlcjsKICAqLwogX2hpZGRlbiBsaWJ4bF9fcW1wX2hhbmRsZXIgKmxpYnhsX19x
bXBfaW5pdGlhbGl6ZShsaWJ4bF9fZ2MgKmdjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBkb21pZCk7Ci0vKiBSZXN1bWUgaHZtIGRv
bWFpbiAqLwotX2hpZGRlbiBpbnQgbGlieGxfX3FtcF9zeXN0ZW1fd2FrZXVwKGxpYnhsX19nYyAq
Z2MsIGludCBkb21pZCk7CiAvKiBSZXN1bWUgUUVNVS4gKi8KIF9oaWRkZW4gaW50IGxpYnhsX19x
bXBfcmVzdW1lKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCk7CiAvKiBMb2FkIGN1cnJlbnQgUUVN
VSBzdGF0ZSBmcm9tIGZpbGUuICovCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAu
YyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCmluZGV4IDhmYWM3MzdmYWQwMy4uNDAwNDNhMGE0
NWIyIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYworKysgYi90b29scy9saWJ4
bC9saWJ4bF9xbXAuYwpAQCAtNzUyLDExICs3NTIsNiBAQCBzdGF0aWMgaW50IHFtcF9ydW5fY29t
bWFuZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsCiAgICAgcmV0dXJuIHJjOwogfQogCi1pbnQg
bGlieGxfX3FtcF9zeXN0ZW1fd2FrZXVwKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCkKLXsKLSAg
ICByZXR1cm4gcW1wX3J1bl9jb21tYW5kKGdjLCBkb21pZCwgInN5c3RlbV93YWtldXAiLCBOVUxM
LCBOVUxMLCBOVUxMKTsKLX0KLQogaW50IGxpYnhsX19xbXBfcmVzdG9yZShsaWJ4bF9fZ2MgKmdj
LCBpbnQgZG9taWQsIGNvbnN0IGNoYXIgKnN0YXRlX2ZpbGUpCiB7CiAgICAgbGlieGxfX2pzb25f
b2JqZWN0ICphcmdzID0gTlVMTDsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
