Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5741FB7FEA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:21:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB03C-0000sI-Qy; Thu, 19 Sep 2019 17:17:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB03B-0000sC-8A
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:17:01 +0000
X-Inumbo-ID: 49ee74f4-db01-11e9-a337-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49ee74f4-db01-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 17:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568913419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wpCQu9yT8V2b191ia7CuS8Z5qR1eobgDrX2wdGUOgKQ=;
 b=esrGqvXY0dKg7XwKYCdCCj6HxKBt/v9V7cnWgVxpCXfAM5JMhwryFwCJ
 Po0bsteBxtmXVLPHDlKx2eZ2sC+xAA96B3g+35x8TP0tfYCmXCWbuDaZ1
 Nb+t8EsS0w/kzGMtl+v111BduWgqyrg/PWrOXYYZdY49hoX1mcDfjeMPN c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1Z9O12gCQAHWXw20DejDi4CPdmqS/Tf/oytM+cO6OcJrusLIXJei6RakMM/BaPuUukOspaXL/9
 QWPAaOkg9bnAONYov//64rmhUU6kOM1dXM5AyjbflbfSJxKC40U5rIm+ShHJKoExgQ4+m3qxL+
 rDKDD0GYOkZp9Gi3wgaBKRxOKihgbCqTw5xp3mTzqPph7v2tsd5GfHuXmPnSrvHxEXmhgHCL3d
 l6qBRq5opRWnDdCAekOamMPk5DtTFjUXiYPPzb8Vc+359IklKQc3oMFU0qB8Y48pavoFhk7Dgd
 tXY=
X-SBRS: 2.7
X-MesageID: 6062784
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="6062784"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:28 +0100
Message-ID: <20190919171656.899649-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 08/35] libxl: Replace
 libxl__qmp_initializations by ev_qmp calls
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

U2V0dXAgYSB0aW1lb3V0IG9mIDEwcyBmb3IgYWxsIHRoZSBjb21tYW5kcy4gSXQgdXNlZCB0byBi
ZSBhYm91dCA1cwpwZXIgY29tbWFuZHMuCgpUaGUgb3JkZXIgb2YgY29tbWFuZCBpcyBjaGFuZ2Vk
LCB3ZSBjYWxsICdxdWVyeS12bmMnIGJlZm9yZQonY2hhbmdlLXZuYy1wYXNzd29yZCcsIGJ1dCB0
aGF0IHNob3VsZCBub3QgbWF0dGVyLiBUaGF0IG1ha2VzIGl0CmVhc2llciB0byBjYWxsICdjaGFu
Z2Utdm5jLXBhc3N3b3JkJyBjb25kaXRpb25hbGx5LgoKQWxzbyAnY2hhbmdlJyBjb21tYW5kIGlz
IHJlcGxhY2VkIGJ5ICdjaGFuZ2Utdm5jLXBhc3N3b3JkJwpiZWNhdXNlICdjaGFuZ2UnIGlzIGRl
cHJlY2F0ZWQuIFRoZSBuZXcgY29tbWFuZCBpcyBhdmFpbGFibGUgaW4gYWxsClFFTVUgdmVyc2lv
bnMgdGhhdCBhbHNvIGhhdmUgWGVuIHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxp
YW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAg
ICAgfCAyMTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHRvb2xzL2xpYnhs
L2xpYnhsX2ludGVybmFsLmggfCAgIDggKy0KIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAg
fCAxNjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyMTIg
aW5zZXJ0aW9ucygrKSwgMTc2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDVhMmUzNDk3NzY5ZC4u
YmI1MzM5Nzg0ZWE4IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTIwNjMsMTEgKzIwNjMsMTMgQEAgc3RhdGljIGludCBs
aWJ4bF9fd3JpdGVfc3R1Yl9kbWFyZ3MobGlieGxfX2djICpnYywKIHN0YXRpYyB2b2lkIGRtc3Nf
aW5pdChsaWJ4bF9fZG1fc3Bhd25fc3RhdGUgKmRtc3MpCiB7CiAgICAgbGlieGxfX2V2X3FtcF9p
bml0KCZkbXNzLT5xbXApOworICAgIGxpYnhsX19ldl90aW1lX2luaXQoJmRtc3MtPnRpbWVvdXQp
OwogfQogCiBzdGF0aWMgdm9pZCBkbXNzX2Rpc3Bvc2UobGlieGxfX2djICpnYywgbGlieGxfX2Rt
X3NwYXduX3N0YXRlICpkbXNzKQogewogICAgIGxpYnhsX19ldl9xbXBfZGlzcG9zZShnYywgJmRt
c3MtPnFtcCk7CisgICAgbGlieGxfX2V2X3RpbWVfZGVyZWdpc3RlcihnYywgJmRtc3MtPnRpbWVv
dXQpOwogfQogCiBzdGF0aWMgdm9pZCBzcGF3bl9zdHViZG9tX3B2cWVtdV9jYihsaWJ4bF9fZWdj
ICplZ2MsCkBAIC0yNDYyLDYgKzI0NjQsMTYgQEAgc3RhdGljIHZvaWQgZGV2aWNlX21vZGVsX3Ft
cF9jYihsaWJ4bF9fZWdjICplZ2MsIGxpYnhsX19ldl9xbXAgKmV2LAogc3RhdGljIHZvaWQgZGV2
aWNlX21vZGVsX3NwYXduX291dGNvbWUobGlieGxfX2VnYyAqZWdjLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfX2RtX3NwYXduX3N0YXRlICpkbXNzLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKTsKK3N0YXRpYyB2b2lk
IGRldmljZV9tb2RlbF9wb3N0Y29uZmlnX2NoYXJkZXYobGlieGxfX2VnYyAqZWdjLAorICAgIGxp
YnhsX19ldl9xbXAgKnFtcCwgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpyZXNwb25zZSwgaW50
IHJjKTsKK3N0YXRpYyB2b2lkIGRldmljZV9tb2RlbF9wb3N0Y29uZmlnX3ZuYyhsaWJ4bF9fZWdj
ICplZ2MsCisgICAgbGlieGxfX2V2X3FtcCAqcW1wLCBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3Qg
KnJlc3BvbnNlLCBpbnQgcmMpOworc3RhdGljIHZvaWQgZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdf
dm5jX3Bhc3N3ZChsaWJ4bF9fZWdjICplZ2MsCisgICAgbGlieGxfX2V2X3FtcCAqcW1wLCBjb25z
dCBsaWJ4bF9fanNvbl9vYmplY3QgKnJlc3BvbnNlLCBpbnQgcmMpOworc3RhdGljIHZvaWQgZGV2
aXNlX21vZGVsX3Bvc3Rjb25maWdfdGltZW91dChsaWJ4bF9fZWdjICplZ2MsCisgICAgbGlieGxf
X2V2X3RpbWUgKmV2LCBjb25zdCBzdHJ1Y3QgdGltZXZhbCAqcmVxdWVzdGVkX2FicywgaW50IHJj
KTsKK3N0YXRpYyB2b2lkIGRldmljZV9tb2RlbF9wb3N0Y29uZmlnX2RvbmUobGlieGxfX2VnYyAq
ZWdjLAorICAgIGxpYnhsX19kbV9zcGF3bl9zdGF0ZSAqZG1zcywgaW50IHJjKTsKIAogdm9pZCBs
aWJ4bF9fc3Bhd25fbG9jYWxfZG0obGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZG1fc3Bhd25fc3Rh
dGUgKmRtc3MpCiB7CkBAIC0yNzYzLDEyICsyNzc1LDIwOSBAQCBzdGF0aWMgdm9pZCBkZXZpY2Vf
bW9kZWxfc3Bhd25fb3V0Y29tZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgICAgIH0KICAgICB9CiAK
KyAgICAvKiBDaGVjayBpZiBzcGF3biBmYWlsZWQgKi8KKyAgICBpZiAocmMpIGdvdG8gb3V0Owor
CiAgICAgaWYgKGRfY29uZmlnLT5iX2luZm8uZGV2aWNlX21vZGVsX3ZlcnNpb24KICAgICAgICAg
ICAgID09IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVOKSB7Ci0gICAgICAgIGxp
YnhsX19xbXBfaW5pdGlhbGl6YXRpb25zKGdjLCBkbXNzLT5ndWVzdF9kb21pZCwgZF9jb25maWcp
OworICAgICAgICByYyA9IGxpYnhsX19ldl90aW1lX3JlZ2lzdGVyX3JlbChhbywgJmRtc3MtPnRp
bWVvdXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmlzZV9t
b2RlbF9wb3N0Y29uZmlnX3RpbWVvdXQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIExJQlhMX1FNUF9DTURfVElNRU9VVCAqIDEwMDApOworICAgICAgICBpZiAocmMp
IGdvdG8gb3V0OworICAgICAgICBkbXNzLT5xbXAuYW8gPSBhbzsKKyAgICAgICAgZG1zcy0+cW1w
LmRvbWlkID0gZG1zcy0+Z3Vlc3RfZG9taWQ7CisgICAgICAgIGRtc3MtPnFtcC5wYXlsb2FkX2Zk
ID0gLTE7CisgICAgICAgIGRtc3MtPnFtcC5jYWxsYmFjayA9IGRldmljZV9tb2RlbF9wb3N0Y29u
ZmlnX2NoYXJkZXY7CisgICAgICAgIHJjID0gbGlieGxfX2V2X3FtcF9zZW5kKGdjLCAmZG1zcy0+
cW1wLCAicXVlcnktY2hhcmRldiIsIE5VTEwpOworICAgICAgICBpZiAocmMpIGdvdG8gb3V0Owor
ICAgICAgICByZXR1cm47CiAgICAgfQogCiAgb3V0OgorICAgIGRldmljZV9tb2RlbF9wb3N0Y29u
ZmlnX2RvbmUoZWdjLCBkbXNzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLworfQorCitzdGF0aWMg
dm9pZCBkZXZpY2VfbW9kZWxfcG9zdGNvbmZpZ19jaGFyZGV2KGxpYnhsX19lZ2MgKmVnYywKKyAg
ICBsaWJ4bF9fZXZfcW1wICpxbXAsIGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqcmVzcG9uc2Us
IGludCByYykKK3sKKyAgICBFR0NfR0M7CisgICAgbGlieGxfX2RtX3NwYXduX3N0YXRlICpkbXNz
ID0gQ09OVEFJTkVSX09GKHFtcCwgKmRtc3MsIHFtcCk7CisgICAgY29uc3QgbGlieGxfX2pzb25f
b2JqZWN0ICppdGVtID0gTlVMTDsKKyAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKm8gPSBO
VUxMOworICAgIGludCBpID0gMDsKKyAgICBjb25zdCBjaGFyICpsYWJlbDsKKyAgICBjb25zdCBj
aGFyICpmaWxlbmFtZTsKKyAgICBpbnQgcG9ydDsKKyAgICBjaGFyICplbmRwdHI7CisgICAgY29u
c3QgY2hhciAqZG9tcGF0aDsKKyAgICBjb25zdCBjaGFyIHNlcmlhbFtdID0gInNlcmlhbCI7Cisg
ICAgY29uc3Qgc2l6ZV90IHNlcmlhbGwgPSBzaXplb2Yoc2VyaWFsKSAtIDE7CisgICAgY29uc3Qg
Y2hhciBwdHlbXSA9ICJwdHk6IjsKKyAgICBjb25zdCBzaXplX3QgcHR5bCA9IHNpemVvZihwdHkp
IC0gMTsKKworICAgIGlmIChyYykgZ290byBvdXQ7CisKKyAgICAvKgorICAgICAqIHF1ZXJ5LWNo
YXJkZXYgcmVzcG9uc2U6CisgICAgICogW3sgJ2xhYmVsJzogJ3N0cicsCisgICAgICogICAgJ2Zp
bGVuYW1lJzogJ3N0cicsCisgICAgICogICAgJ2Zyb250ZW5kLW9wZW4nOiAnYm9vbCcgfSwgLi4u
XQorICAgICAqLworCisgICAgZm9yIChpID0gMDsgKGl0ZW0gPSBsaWJ4bF9fanNvbl9hcnJheV9n
ZXQocmVzcG9uc2UsIGkpKTsgaSsrKSB7CisgICAgICAgIG8gPSBsaWJ4bF9fanNvbl9tYXBfZ2V0
KCJsYWJlbCIsIGl0ZW0sIEpTT05fU1RSSU5HKTsKKyAgICAgICAgaWYgKCFvKSBnb3RvIHByb3Rv
Y29sX2Vycm9yOworICAgICAgICBsYWJlbCA9IGxpYnhsX19qc29uX29iamVjdF9nZXRfc3RyaW5n
KG8pOworCisgICAgICAgIC8qIENoZWNrIGlmIHRoZSAibGFiZWwiIHN0YXJ0IHdpdGggInNlcmlh
bCIuICovCisgICAgICAgIGlmICghbGFiZWwgfHwgc3RybmNtcChsYWJlbCwgc2VyaWFsLCBzZXJp
YWxsKSkKKyAgICAgICAgICAgIGNvbnRpbnVlOworICAgICAgICBwb3J0ID0gc3RydG9sKGxhYmVs
ICsgc2VyaWFsbCwgJmVuZHB0ciwgMTApOworICAgICAgICBpZiAoKihsYWJlbCArIHNlcmlhbGwp
ID09ICdcMCcgfHwgKmVuZHB0ciAhPSAnXDAnKSB7CisgICAgICAgICAgICBMT0dEKEVSUk9SLCBx
bXAtPmRvbWlkLAorICAgICAgICAgICAgICAgICAiSW52YWxpZCBzZXJpYWwgcG9ydCBudW1iZXI6
ICVzIiwgbGFiZWwpOworICAgICAgICAgICAgcmMgPSBFUlJPUl9RRU1VX0FQSTsKKyAgICAgICAg
ICAgIGdvdG8gb3V0OworICAgICAgICB9CisKKyAgICAgICAgbyA9IGxpYnhsX19qc29uX21hcF9n
ZXQoImZpbGVuYW1lIiwgaXRlbSwgSlNPTl9TVFJJTkcpOworICAgICAgICBpZiAoIW8pIGdvdG8g
cHJvdG9jb2xfZXJyb3I7CisgICAgICAgIGZpbGVuYW1lID0gbGlieGxfX2pzb25fb2JqZWN0X2dl
dF9zdHJpbmcobyk7CisKKyAgICAgICAgLyogQ2hlY2sgaWYgZmlsZW5hbWUgc3RhcnQgd2l0aCAi
cHR5OiIgKi8KKyAgICAgICAgaWYgKCFmaWxlbmFtZSB8fCBzdHJuY21wKGZpbGVuYW1lLCBwdHks
IHB0eWwpKQorICAgICAgICAgICAgY29udGludWU7CisKKyAgICAgICAgZG9tcGF0aCA9IGxpYnhs
X194c19nZXRfZG9tcGF0aChnYywgcW1wLT5kb21pZCk7CisgICAgICAgIGlmICghZG9tcGF0aCkg
eworICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOworICAgICAgICAgICAgZ290byBvdXQ7Cisg
ICAgICAgIH0KKyAgICAgICAgcmMgPSBsaWJ4bF9feHNfcHJpbnRmKGdjLCBYQlRfTlVMTCwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvc2VyaWFsLyVkL3R0eSIs
IGRvbXBhdGgsIHBvcnQpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiVzIiwgZmls
ZW5hbWUgKyBwdHlsKTsKKyAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICB9CisKKyAgICBx
bXAtPmNhbGxiYWNrID0gZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfdm5jOworICAgIHJjID0gbGli
eGxfX2V2X3FtcF9zZW5kKGdjLCBxbXAsICJxdWVyeS12bmMiLCBOVUxMKTsKKyAgICBpZiAocmMp
IGdvdG8gb3V0OworICAgIHJldHVybjsKKworcHJvdG9jb2xfZXJyb3I6CisgICAgcmMgPSBFUlJP
Ul9RRU1VX0FQSTsKKyAgICBMT0dEKEVSUk9SLCBxbXAtPmRvbWlkLAorICAgICAgICAgInVuZXhw
ZWN0ZWQgcmVzcG9uc2UgdG8gUU1QIGNtZCAncXVlcnktY2hhcmRldicsIHJlY2VpdmVkOlxuJXMi
LAorICAgICAgICAgSlNPTihyZXNwb25zZSkpOworb3V0OgorICAgIGRldmljZV9tb2RlbF9wb3N0
Y29uZmlnX2RvbmUoZWdjLCBkbXNzLCByYyk7IC8qIG11c3QgYmUgbGFzdCAqLworfQorCitzdGF0
aWMgdm9pZCBkZXZpY2VfbW9kZWxfcG9zdGNvbmZpZ192bmMobGlieGxfX2VnYyAqZWdjLAorICAg
IGxpYnhsX19ldl9xbXAgKnFtcCwgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpyZXNwb25zZSwg
aW50IHJjKQoreworICAgIEVHQ19HQzsKKyAgICBsaWJ4bF9fZG1fc3Bhd25fc3RhdGUgKmRtc3Mg
PSBDT05UQUlORVJfT0YocW1wLCAqZG1zcywgcW1wKTsKKyAgICBjb25zdCBsaWJ4bF92bmNfaW5m
byAqdm5jID0gbGlieGxfX2RtX3ZuYyhkbXNzLT5ndWVzdF9jb25maWcpOworICAgIGNvbnN0IGxp
YnhsX19qc29uX29iamVjdCAqbzsKKyAgICBsaWJ4bF9fanNvbl9vYmplY3QgKmFyZ3MgPSBOVUxM
OworCisgICAgaWYgKHJjKSBnb3RvIG91dDsKKworICAgIC8qCisgICAgICogcXVlcnktdm5jIHJl
c3BvbnNlOgorICAgICAqIHsgJ2VuYWJsZWQnOiAnYm9vbCcsICcqaG9zdCc6ICdzdHInLCAnKnNl
cnZpY2UnOiAnc3RyJyB9CisgICAgICovCisKKyAgICBvID0gbGlieGxfX2pzb25fbWFwX2dldCgi
ZW5hYmxlZCIsIHJlc3BvbnNlLCBKU09OX0JPT0wpOworICAgIGlmICghbykgZ290byBwcm90b2Nv
bF9lcnJvcjsKKyAgICBpZiAobGlieGxfX2pzb25fb2JqZWN0X2dldF9ib29sKG8pKSB7CisgICAg
ICAgIGNvbnN0IGNoYXIgKmFkZHIsICpwb3J0OworICAgICAgICBjb25zdCBjaGFyICpkb21wYXRo
OworCisgICAgICAgIG8gPSBsaWJ4bF9fanNvbl9tYXBfZ2V0KCJob3N0IiwgcmVzcG9uc2UsIEpT
T05fU1RSSU5HKTsKKyAgICAgICAgaWYgKCFvKSBnb3RvIHByb3RvY29sX2Vycm9yOworICAgICAg
ICBhZGRyID0gbGlieGxfX2pzb25fb2JqZWN0X2dldF9zdHJpbmcobyk7CisgICAgICAgIG8gPSBs
aWJ4bF9fanNvbl9tYXBfZ2V0KCJzZXJ2aWNlIiwgcmVzcG9uc2UsIEpTT05fU1RSSU5HKTsKKyAg
ICAgICAgaWYgKCFvKSBnb3RvIHByb3RvY29sX2Vycm9yOworICAgICAgICBwb3J0ID0gbGlieGxf
X2pzb25fb2JqZWN0X2dldF9zdHJpbmcobyk7CisKKyAgICAgICAgZG9tcGF0aCA9IGxpYnhsX194
c19nZXRfZG9tcGF0aChnYywgcW1wLT5kb21pZCk7CisgICAgICAgIGlmICghZG9tcGF0aCkgewor
ICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOworICAgICAgICAgICAgZ290byBvdXQ7CisgICAg
ICAgIH0KKyAgICAgICAgcmMgPSBsaWJ4bF9feHNfcHJpbnRmKGdjLCBYQlRfTlVMTCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvY29uc29sZS92bmMtbGlzdGVu
IiwgZG9tcGF0aCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMiLCBhZGRyKTsK
KyAgICAgICAgaWYgKHJjKSBnb3RvIG91dDsKKyAgICAgICAgcmMgPSBsaWJ4bF9feHNfcHJpbnRm
KGdjLCBYQlRfTlVMTCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigi
JXMvY29uc29sZS92bmMtcG9ydCIsIGRvbXBhdGgpLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIiVzIiwgcG9ydCk7CisgICAgICAgIGlmIChyYykgZ290byBvdXQ7CisgICAgfQorCisg
ICAgaWYgKHZuYyAmJiB2bmMtPnBhc3N3ZCkgeworICAgICAgICBxbXAtPmNhbGxiYWNrID0gZGV2
aWNlX21vZGVsX3Bvc3Rjb25maWdfdm5jX3Bhc3N3ZDsKKyAgICAgICAgbGlieGxfX3FtcF9wYXJh
bV9hZGRfc3RyaW5nKGdjLCAmYXJncywgInBhc3N3b3JkIiwgdm5jLT5wYXNzd2QpOworICAgICAg
ICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAiY2hhbmdlLXZuYy1wYXNzd29yZCIs
IGFyZ3MpOworICAgICAgICBpZiAocmMpIGdvdG8gb3V0OworICAgICAgICByZXR1cm47CisgICAg
fQorCisgICAgcmMgPSAwOworICAgIGdvdG8gb3V0OworCitwcm90b2NvbF9lcnJvcjoKKyAgICBy
YyA9IEVSUk9SX1FFTVVfQVBJOworICAgIExPR0QoRVJST1IsIHFtcC0+ZG9taWQsCisgICAgICAg
ICAidW5leHBlY3RlZCByZXNwb25zZSB0byBRTVAgY21kICdxdWVyeS12bmMnLCByZWNlaXZlZDpc
biVzIiwKKyAgICAgICAgIEpTT04ocmVzcG9uc2UpKTsKK291dDoKKyAgICBkZXZpY2VfbW9kZWxf
cG9zdGNvbmZpZ19kb25lKGVnYywgZG1zcywgcmMpOyAvKiBtdXN0IGJlIGxhc3QgKi8KK30KKwor
c3RhdGljIHZvaWQgZGV2aWNlX21vZGVsX3Bvc3Rjb25maWdfdm5jX3Bhc3N3ZChsaWJ4bF9fZWdj
ICplZ2MsCisgICAgbGlieGxfX2V2X3FtcCAqcW1wLCBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3Qg
KnJlc3BvbnNlLCBpbnQgcmMpCit7CisgICAgRUdDX0dDOworICAgIGxpYnhsX19kbV9zcGF3bl9z
dGF0ZSAqZG1zcyA9IENPTlRBSU5FUl9PRihxbXAsICpkbXNzLCBxbXApOworICAgIGNvbnN0IGxp
YnhsX3ZuY19pbmZvICp2bmMgPSBsaWJ4bF9fZG1fdm5jKGRtc3MtPmd1ZXN0X2NvbmZpZyk7Cisg
ICAgY29uc3QgY2hhciAqZG9tcGF0aDsKKworICAgIGlmIChyYykgZ290byBvdXQ7CisKKyAgICBk
b21wYXRoID0gbGlieGxfX3hzX2dldF9kb21wYXRoKGdjLCBxbXAtPmRvbWlkKTsKKyAgICBpZiAo
IWRvbXBhdGgpIHsKKyAgICAgICAgcmMgPSBFUlJPUl9GQUlMOworICAgICAgICBnb3RvIG91dDsK
KyAgICB9CisgICAgcmMgPSBsaWJ4bF9feHNfcHJpbnRmKGdjLCBYQlRfTlVMTCwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgR0NTUFJJTlRGKCIlcy9jb25zb2xlL3ZuYy1wYXNzIiwgZG9tcGF0
aCksCisgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyIsIHZuYy0+cGFzc3dkKTsKKworb3V0
OgorICAgIGRldmljZV9tb2RlbF9wb3N0Y29uZmlnX2RvbmUoZWdjLCBkbXNzLCByYyk7IC8qIG11
c3QgYmUgbGFzdCAqLworfQorCit2b2lkIGRldmlzZV9tb2RlbF9wb3N0Y29uZmlnX3RpbWVvdXQo
bGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fZXZfdGltZSAqZXYsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHRpbWV2YWwgKnJlcXVlc3RlZF9hYnMsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHJjKQoreworICAgIGxpYnhs
X19kbV9zcGF3bl9zdGF0ZSAqZG1zcyA9IENPTlRBSU5FUl9PRihldiwgKmRtc3MsIHRpbWVvdXQp
OworICAgIGRldmljZV9tb2RlbF9wb3N0Y29uZmlnX2RvbmUoZWdjLCBkbXNzLCByYyk7IC8qIG11
c3QgYmUgbGFzdCAqLworfQorCisKK3N0YXRpYyB2b2lkIGRldmljZV9tb2RlbF9wb3N0Y29uZmln
X2RvbmUobGlieGxfX2VnYyAqZWdjLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJ4bF9fZG1fc3Bhd25fc3RhdGUgKmRtc3MsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCByYykKK3sKKyAgICBFR0NfR0M7CisKKyAgICBpZiAo
cmMpCisgICAgICAgIExPR0QoRVJST1IsIGRtc3MtPmd1ZXN0X2RvbWlkLAorICAgICAgICAgICAg
ICJQb3N0IERNIHN0YXJ0dXAgY29uZmlncyBmYWlsZWQsIHJjPSVkIiwgcmMpOwogICAgIGRtc3Nf
ZGlzcG9zZShnYywgZG1zcyk7CiAgICAgZG1zcy0+Y2FsbGJhY2soZWdjLCBkbXNzLCByYyk7CiB9
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwv
bGlieGxfaW50ZXJuYWwuaAppbmRleCBjNDgzNGFjOWM2YzUuLmY1ZjIzNGJlN2UzYyAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oCkBAIC0xMDAsNiArMTAwLDcgQEAKICNkZWZpbmUgTElCWExfREVWSUNFX01P
REVMX1NUQVJUX1RJTUVPVVQgNjAKICNkZWZpbmUgTElCWExfREVWSUNFX01PREVMX1NBVkVfRklM
RSBYRU5fTElCX0RJUiAiL3FlbXUtc2F2ZSIgLyogLiRkb21pZCAqLwogI2RlZmluZSBMSUJYTF9E
RVZJQ0VfTU9ERUxfUkVTVE9SRV9GSUxFIFhFTl9MSUJfRElSICIvcWVtdS1yZXN1bWUiIC8qIC4k
ZG9taWQgKi8KKyNkZWZpbmUgTElCWExfUU1QX0NNRF9USU1FT1VUIDEwCiAjZGVmaW5lIExJQlhM
X1NUVUJET01fU1RBUlRfVElNRU9VVCAzMAogI2RlZmluZSBMSUJYTF9RRU1VX0JPREdFX1RJTUVP
VVQgMgogI2RlZmluZSBMSUJYTF9YRU5DT05TT0xFX0xJTUlUIDEwNDg1NzYKQEAgLTE5NDcsOCAr
MTk0OCw2IEBAIF9oaWRkZW4gbGlieGxfX3FtcF9oYW5kbGVyICpsaWJ4bF9fcW1wX2luaXRpYWxp
emUobGlieGxfX2djICpnYywKIF9oaWRkZW4gaW50IGxpYnhsX19xbXBfcnVuX2NvbW1hbmRfZmxl
eGFycmF5KGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmNtZCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsZXhhcnJheV90ICphcnJheSk7Ci0vKiBhc2sg
dG8gUUVNVSB0aGUgc2VyaWFsIHBvcnQgaW5mb3JtYXRpb24gYW5kIHN0b3JlIGl0IGluIHhlbnN0
b3JlLiAqLwotX2hpZGRlbiBpbnQgbGlieGxfX3FtcF9xdWVyeV9zZXJpYWwobGlieGxfX3FtcF9o
YW5kbGVyICpxbXApOwogX2hpZGRlbiBpbnQgbGlieGxfX3FtcF9wY2lfYWRkKGxpYnhsX19nYyAq
Z2MsIGludCBkLCBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYpOwogX2hpZGRlbiBpbnQgbGlieGxf
X3FtcF9wY2lfZGVsKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsaWJ4bF9kZXZpY2VfcGNpICpwY2lkZXYpOwpAQCAtMTk5NCwxMCArMTk5
Myw2IEBAIF9oaWRkZW4gdm9pZCBsaWJ4bF9fcW1wX2Nsb3NlKGxpYnhsX19xbXBfaGFuZGxlciAq
cW1wKTsKICAqIG5vdGhpbmcgaGFwcGVuICovCiBfaGlkZGVuIHZvaWQgbGlieGxfX3FtcF9jbGVh
bnVwKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkKTsKIAotLyogdGhpcyBoZWxwZXIgY2Fs
bHMgcW1wX2luaXRpYWxpemUsIHF1ZXJ5X3NlcmlhbCBhbmQgcW1wX2Nsb3NlICovCi1faGlkZGVu
IGludCBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucyhsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBk
b21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhs
X2RvbWFpbl9jb25maWcgKmd1ZXN0X2NvbmZpZyk7Ci0KIC8qIGBkYXRhJyBzaG91bGQgY29udGFp
biBhIGJ5dGUgdG8gc2VuZC4KICAqIFdoZW4gZGVhbGluZyB3aXRoIGEgbm9uLWJsb2NraW5nIGZk
LCBpdCByZXR1cm5zCiAgKiAgIEVSUk9SX05PVF9SRUFEWSBvbiBFV09VTERCTE9DSwpAQCAtMzk1
NCw2ICszOTQ5LDcgQEAgc3RydWN0IGxpYnhsX19kbV9zcGF3bl9zdGF0ZSB7CiAgICAgLyogbWl4
ZWQgLSBzcGF3bi5hbyBtdXN0IGJlIGluaXRpYWxpc2VkIGJ5IHVzZXI7IHJlc3QgaXMgcHJpdmF0
ZTogKi8KICAgICBsaWJ4bF9fc3Bhd25fc3RhdGUgc3Bhd247CiAgICAgbGlieGxfX2V2X3FtcCBx
bXA7CisgICAgbGlieGxfX2V2X3RpbWUgdGltZW91dDsKICAgICAvKiBmaWxsZWQgaW4gYnkgdXNl
ciwgbXVzdCByZW1haW4gdmFsaWQ6ICovCiAgICAgdWludDMyX3QgZ3Vlc3RfZG9taWQ7IC8qIGRv
bWFpbiBiZWluZyBzZXJ2ZWQgKi8KICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpndWVzdF9jb25m
aWc7CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9xbXAuYyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX3FtcC5jCmluZGV4IGYxNTI5OTI1ZWUwZS4uMGQ2YWVkY2M3ZDNjIDEwMDY0NAotLS0gYS90
b29scy9saWJ4bC9saWJ4bF9xbXAuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9xbXAuYwpAQCAt
MTQzLDEyMSArMTQzLDYgQEAgc3RhdGljIGNvbnN0IGludCBRTVBfU09DS0VUX0NPTk5FQ1RfVElN
RU9VVCA9IDU7CiAgKiBRTVAgY2FsbGJhY2tzIGZ1bmN0aW9ucwogICovCiAKLXN0YXRpYyBpbnQg
c3RvcmVfc2VyaWFsX3BvcnRfaW5mbyhsaWJ4bF9fcW1wX2hhbmRsZXIgKnFtcCwKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpjaGFyZGV2LAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBwb3J0KQotewotICAgIEdDX0lOSVQocW1wLT5j
dHgpOwotICAgIGNoYXIgKnBhdGggPSBOVUxMOwotICAgIGludCByZXQgPSAwOwotCi0gICAgaWYg
KCEoY2hhcmRldiAmJiBzdHJuY21wKCJwdHk6IiwgY2hhcmRldiwgNCkgPT0gMCkpIHsKLSAgICAg
ICAgcmV0dXJuIDA7Ci0gICAgfQotCi0gICAgcGF0aCA9IGxpYnhsX194c19nZXRfZG9tcGF0aChn
YywgcW1wLT5kb21pZCk7Ci0gICAgcGF0aCA9IEdDU1BSSU5URigiJXMvc2VyaWFsLyVkL3R0eSIs
IHBhdGgsIHBvcnQpOwotCi0gICAgcmV0ID0gbGlieGxfX3hzX3ByaW50ZihnYywgWEJUX05VTEws
IHBhdGgsICIlcyIsIGNoYXJkZXYgKyA0KTsKLQotICAgIEdDX0ZSRUU7Ci0gICAgcmV0dXJuIHJl
dDsKLX0KLQotc3RhdGljIGludCByZWdpc3Rlcl9zZXJpYWxzX2NoYXJkZXZfY2FsbGJhY2sobGli
eGxfX3FtcF9oYW5kbGVyICpxbXAsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBsaWJ4bF9fanNvbl9vYmplY3QgKm8sCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICp1bnVzZWQpCi17Ci0gICAgY29uc3Qg
bGlieGxfX2pzb25fb2JqZWN0ICpvYmogPSBOVUxMOwotICAgIGNvbnN0IGxpYnhsX19qc29uX29i
amVjdCAqbGFiZWwgPSBOVUxMOwotICAgIGNvbnN0IGNoYXIgKnMgPSBOVUxMOwotICAgIGludCBp
ID0gMDsKLSAgICBjb25zdCBjaGFyICpjaGFyZGV2ID0gTlVMTDsKLSAgICBpbnQgcmV0ID0gMDsK
LQotICAgIGZvciAoaSA9IDA7IChvYmogPSBsaWJ4bF9fanNvbl9hcnJheV9nZXQobywgaSkpOyBp
KyspIHsKLSAgICAgICAgaWYgKCFsaWJ4bF9fanNvbl9vYmplY3RfaXNfbWFwKG9iaikpCi0gICAg
ICAgICAgICBjb250aW51ZTsKLSAgICAgICAgbGFiZWwgPSBsaWJ4bF9fanNvbl9tYXBfZ2V0KCJs
YWJlbCIsIG9iaiwgSlNPTl9TVFJJTkcpOwotICAgICAgICBzID0gbGlieGxfX2pzb25fb2JqZWN0
X2dldF9zdHJpbmcobGFiZWwpOwotCi0gICAgICAgIGlmIChzICYmIHN0cm5jbXAoInNlcmlhbCIs
IHMsIHN0cmxlbigic2VyaWFsIikpID09IDApIHsKLSAgICAgICAgICAgIGNvbnN0IGxpYnhsX19q
c29uX29iamVjdCAqZmlsZW5hbWUgPSBOVUxMOwotICAgICAgICAgICAgY2hhciAqZW5kcHRyID0g
TlVMTDsKLSAgICAgICAgICAgIGludCBwb3J0X251bWJlcjsKLQotICAgICAgICAgICAgZmlsZW5h
bWUgPSBsaWJ4bF9fanNvbl9tYXBfZ2V0KCJmaWxlbmFtZSIsIG9iaiwgSlNPTl9TVFJJTkcpOwot
ICAgICAgICAgICAgY2hhcmRldiA9IGxpYnhsX19qc29uX29iamVjdF9nZXRfc3RyaW5nKGZpbGVu
YW1lKTsKLQotICAgICAgICAgICAgcyArPSBzdHJsZW4oInNlcmlhbCIpOwotICAgICAgICAgICAg
cG9ydF9udW1iZXIgPSBzdHJ0b2wocywgJmVuZHB0ciwgMTApOwotICAgICAgICAgICAgaWYgKCpz
ID09IDAgfHwgKmVuZHB0ciAhPSAwKSB7Ci0gICAgICAgICAgICAgICAgTElCWExfX0xPR0QocW1w
LT5jdHgsIExJQlhMX19MT0dfRVJST1IsIHFtcC0+ZG9taWQsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIkludmFsaWQgc2VyaWFsIHBvcnQgbnVtYmVyOiAlcyIsIHMpOwotICAgICAgICAg
ICAgICAgIHJldHVybiAtMTsKLSAgICAgICAgICAgIH0KLSAgICAgICAgICAgIHJldCA9IHN0b3Jl
X3NlcmlhbF9wb3J0X2luZm8ocW1wLCBjaGFyZGV2LCBwb3J0X251bWJlcik7Ci0gICAgICAgICAg
ICBpZiAocmV0KSB7Ci0gICAgICAgICAgICAgICAgTElCWExfX0xPR0RfRVJSTk8ocW1wLT5jdHgs
IExJQlhMX19MT0dfRVJST1IsIHFtcC0+ZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIkZhaWxlZCB0byBzdG9yZSBzZXJpYWwgcG9ydCBpbmZvcm1hdGlvbiIKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiIGluIHhlbnN0b3JlIik7Ci0gICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKLSAgICAgICAgICAgIH0KLSAgICAgICAgfQotICAgIH07Ci0KLSAg
ICByZXR1cm4gcmV0OwotfQotCi1zdGF0aWMgaW50IHFtcF93cml0ZV9kb21haW5fY29uc29sZV9p
dGVtKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3QgY2hhciAqaXRlbSwgY29uc3QgY2hhciAqdmFsdWUpCi17Ci0g
ICAgY2hhciAqcGF0aDsKLQotICAgIHBhdGggPSBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2MsIGRv
bWlkKTsKLSAgICBwYXRoID0gR0NTUFJJTlRGKCIlcy9jb25zb2xlLyVzIiwgcGF0aCwgaXRlbSk7
Ci0KLSAgICByZXR1cm4gbGlieGxfX3hzX3ByaW50ZihnYywgWEJUX05VTEwsIHBhdGgsICIlcyIs
IHZhbHVlKTsKLX0KLQotc3RhdGljIGludCBxbXBfcmVnaXN0ZXJfdm5jX2NhbGxiYWNrKGxpYnhs
X19xbXBfaGFuZGxlciAqcW1wLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqbywKLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICp1bnVzZWQpCi17Ci0gICAgR0NfSU5JVChxbXAtPmN0eCk7Ci0gICAg
Y29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpvYmo7Ci0gICAgY29uc3QgY2hhciAqYWRkciwgKnBv
cnQ7Ci0gICAgaW50IHJjID0gLTE7Ci0KLSAgICBpZiAoIWxpYnhsX19qc29uX29iamVjdF9pc19t
YXAobykpIHsKLSAgICAgICAgZ290byBvdXQ7Ci0gICAgfQotCi0gICAgb2JqID0gbGlieGxfX2pz
b25fbWFwX2dldCgiZW5hYmxlZCIsIG8sIEpTT05fQk9PTCk7Ci0gICAgaWYgKCFvYmogfHwgIWxp
YnhsX19qc29uX29iamVjdF9nZXRfYm9vbChvYmopKSB7Ci0gICAgICAgIHJjID0gMDsKLSAgICAg
ICAgZ290byBvdXQ7Ci0gICAgfQotCi0gICAgb2JqID0gbGlieGxfX2pzb25fbWFwX2dldCgiaG9z
dCIsIG8sIEpTT05fU1RSSU5HKTsKLSAgICBhZGRyID0gbGlieGxfX2pzb25fb2JqZWN0X2dldF9z
dHJpbmcob2JqKTsKLSAgICBvYmogPSBsaWJ4bF9fanNvbl9tYXBfZ2V0KCJzZXJ2aWNlIiwgbywg
SlNPTl9TVFJJTkcpOwotICAgIHBvcnQgPSBsaWJ4bF9fanNvbl9vYmplY3RfZ2V0X3N0cmluZyhv
YmopOwotCi0gICAgaWYgKCFhZGRyIHx8ICFwb3J0KSB7Ci0gICAgICAgIExPR0QoRVJST1IsIHFt
cC0+ZG9taWQsICJGYWlsZWQgdG8gcmV0cmlldmUgVk5DIGNvbm5lY3QgaW5mb3JtYXRpb24uIik7
Ci0gICAgICAgIGdvdG8gb3V0OwotICAgIH0KLQotICAgIHJjID0gcW1wX3dyaXRlX2RvbWFpbl9j
b25zb2xlX2l0ZW0oZ2MsIHFtcC0+ZG9taWQsICJ2bmMtbGlzdGVuIiwgYWRkcik7Ci0gICAgaWYg
KCFyYykKLSAgICAgICAgcmMgPSBxbXBfd3JpdGVfZG9tYWluX2NvbnNvbGVfaXRlbShnYywgcW1w
LT5kb21pZCwgInZuYy1wb3J0IiwgcG9ydCk7Ci0KLW91dDoKLSAgICBHQ19GUkVFOwotICAgIHJl
dHVybiByYzsKLX0KLQogc3RhdGljIGludCBxbXBfY2FwYWJpbGl0aWVzX2NhbGxiYWNrKGxpYnhs
X19xbXBfaGFuZGxlciAqcW1wLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IGxpYnhsX19qc29uX29iamVjdCAqbywgdm9pZCAqdW51c2VkKQogewpAQCAtODUxLDIw
ICs3MzYsNiBAQCB2b2lkIGxpYnhsX19xbXBfY2xlYW51cChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJf
dCBkb21pZCkKICAgICB9CiB9CiAKLWludCBsaWJ4bF9fcW1wX3F1ZXJ5X3NlcmlhbChsaWJ4bF9f
cW1wX2hhbmRsZXIgKnFtcCkKLXsKLSAgICByZXR1cm4gcW1wX3N5bmNocm9ub3VzX3NlbmQocW1w
LCAicXVlcnktY2hhcmRldiIsIE5VTEwsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZ2lzdGVyX3NlcmlhbHNfY2hhcmRldl9jYWxsYmFjaywKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTlVMTCwgcW1wLT50aW1lb3V0KTsKLX0KLQotc3RhdGljIGludCBxbXBfcXVl
cnlfdm5jKGxpYnhsX19xbXBfaGFuZGxlciAqcW1wKQotewotICAgIHJldHVybiBxbXBfc3luY2hy
b25vdXNfc2VuZChxbXAsICJxdWVyeS12bmMiLCBOVUxMLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBxbXBfcmVnaXN0ZXJfdm5jX2NhbGxiYWNrLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBOVUxMLCBxbXAtPnRpbWVvdXQpOwotfQotCiBzdGF0aWMgaW50IHBjaV9h
ZGRfY2FsbGJhY2sobGlieGxfX3FtcF9oYW5kbGVyICpxbXAsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgbGlieGxfX2pzb25fb2JqZWN0ICpyZXNwb25zZSwgdm9pZCAqb3BhcXVl
KQogewpAQCAtMTA4NSwyNCArOTU2LDYgQEAgaW50IGxpYnhsX19xbXBfcmVzdG9yZShsaWJ4bF9f
Z2MgKmdjLCBpbnQgZG9taWQsIGNvbnN0IGNoYXIgKnN0YXRlX2ZpbGUpCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBOVUxMLCBOVUxMKTsKIH0KIAotc3RhdGljIGludCBxbXBfY2hhbmdlKGxp
YnhsX19nYyAqZ2MsIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wLAotICAgICAgICAgICAgICAgICAg
ICAgIGNoYXIgKmRldmljZSwgY2hhciAqdGFyZ2V0LCBjaGFyICphcmcpCi17Ci0gICAgbGlieGxf
X2pzb25fb2JqZWN0ICphcmdzID0gTlVMTDsKLSAgICBpbnQgcmMgPSAwOwotCi0gICAgbGlieGxf
X3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgImRldmljZSIsIGRldmljZSk7Ci0gICAg
bGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdjLCAmYXJncywgInRhcmdldCIsIHRhcmdldCk7
Ci0gICAgaWYgKGFyZykgewotICAgICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2Ms
ICZhcmdzLCAiYXJnIiwgYXJnKTsKLSAgICB9Ci0KLSAgICByYyA9IHFtcF9zeW5jaHJvbm91c19z
ZW5kKHFtcCwgImNoYW5nZSIsIGFyZ3MsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBO
VUxMLCBOVUxMLCBxbXAtPnRpbWVvdXQpOwotCi0gICAgcmV0dXJuIHJjOwotfQotCiBpbnQgbGli
eGxfX3FtcF9yZXN1bWUobGlieGxfX2djICpnYywgaW50IGRvbWlkKQogewogICAgIHJldHVybiBx
bXBfcnVuX2NvbW1hbmQoZ2MsIGRvbWlkLCAiY29udCIsIE5VTEwsIE5VTEwsIE5VTEwpOwpAQCAt
MTI5MywyOCArMTE0Niw2IEBAIGludCBsaWJ4bF9xZW11X21vbml0b3JfY29tbWFuZChsaWJ4bF9j
dHggKmN0eCwgdWludDMyX3QgZG9taWQsCiAgICAgcmV0dXJuIEFPX0lOUFJPR1JFU1M7CiB9CiAK
LWludCBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucyhsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBk
b21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9kb21haW5f
Y29uZmlnICpndWVzdF9jb25maWcpCi17Ci0gICAgY29uc3QgbGlieGxfdm5jX2luZm8gKnZuYyA9
IGxpYnhsX19kbV92bmMoZ3Vlc3RfY29uZmlnKTsKLSAgICBsaWJ4bF9fcW1wX2hhbmRsZXIgKnFt
cCA9IE5VTEw7Ci0gICAgaW50IHJldCA9IDA7Ci0KLSAgICBxbXAgPSBsaWJ4bF9fcW1wX2luaXRp
YWxpemUoZ2MsIGRvbWlkKTsKLSAgICBpZiAoIXFtcCkKLSAgICAgICAgcmV0dXJuIC0xOwotICAg
IHJldCA9IGxpYnhsX19xbXBfcXVlcnlfc2VyaWFsKHFtcCk7Ci0gICAgaWYgKCFyZXQgJiYgdm5j
ICYmIHZuYy0+cGFzc3dkKSB7Ci0gICAgICAgIHJldCA9IHFtcF9jaGFuZ2UoZ2MsIHFtcCwgInZu
YyIsICJwYXNzd29yZCIsIHZuYy0+cGFzc3dkKTsKLSAgICAgICAgcW1wX3dyaXRlX2RvbWFpbl9j
b25zb2xlX2l0ZW0oZ2MsIGRvbWlkLCAidm5jLXBhc3MiLCB2bmMtPnBhc3N3ZCk7Ci0gICAgfQot
ICAgIGlmICghcmV0KSB7Ci0gICAgICAgIHJldCA9IHFtcF9xdWVyeV92bmMocW1wKTsKLSAgICB9
Ci0gICAgbGlieGxfX3FtcF9jbG9zZShxbXApOwotICAgIHJldHVybiByZXQ7Ci19Ci0KIAogLyoK
ICAqIEZ1bmN0aW9ucyB1c2luZyBsaWJ4bF9fZXZfcW1wCi0tIApBbnRob255IFBFUkFSRAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
