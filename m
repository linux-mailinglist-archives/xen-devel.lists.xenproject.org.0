Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1E8132819
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:51:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iopEz-0007A9-Jq; Tue, 07 Jan 2020 13:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cF2B=24=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iopEy-0007A0-1K
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:49:48 +0000
X-Inumbo-ID: 90a7009c-3154-11ea-ac08-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90a7009c-3154-11ea-ac08-12813bfff9fa;
 Tue, 07 Jan 2020 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578404986;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=0oevOZdasruycRFVpcmzVgbOW7yD5e/MvIumfmVZHgI=;
 b=aN5VmUOMdIZ6cMvrMUCyeGHL/PfldtSEN7dy9ZuZgGjCbatwHKV1JpgC
 xICNM6aQsLYSRLnYDY40CQ1eVHVCERKEs+ro7aFxOqtHjWPEZbwQXZ7dJ
 0BZP16ikXqbOcNP+NWTxkSmbDHdjR9W9CNZyZilbRSWoZlPvGerh5ZfLw g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KIEKqkSMqZyUDa7B871gG4aglr03em1yKrH0e+l43HrNCHQTsRnhlvC83pQSYaphtK1TChMcqw
 7nrmgHJxIN63x5Xp0FDsMLU31/Hyy6oPyBkEI8QSqAS0KRyuQIMHcA8EOeD66bsp3d+Ir5xq2x
 pqGBLmPC4F063ByUFhYh9Bj4n/FVA9QFVYz6aHx2dEJhCarpp1aWOJbdBCAGME5AVOVrrGI13z
 MBA5nfEx7q3ZJrARSnQvOdMwZT+yAnpq7RLzid/3vRawZlNMImUhrgWtBCaju+Uq5HdbA9rv1W
 7AY=
X-SBRS: 2.7
X-MesageID: 10974597
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,406,1571716800"; d="scan'208";a="10974597"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 7 Jan 2020 13:49:43 +0000
Message-ID: <20200107134943.21063-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mem_sharing: Fix RANDCONFIG build
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VHJhdmlzIHJlcG9ydHM6IGh0dHBzOi8vdHJhdmlzLWNpLm9yZy9hbmR5aGhwL3hlbi9qb2JzLzYz
Mzc1MTgxMQoKICBtZW1fc2hhcmluZy5jOjM2MToxMzogZXJyb3I6ICdybWFwX2hhc19lbnRyaWVz
JyBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dCiAgIHN0YXRp
YyBib29sIHJtYXBfaGFzX2VudHJpZXMoY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKICAg
ICAgICAgICAgICAgXgogIGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3Jz
CgpUaGlzIGhhcHBlbnMgaW4gYSByZWxlYXNlIGJ1aWxkIChkaXNhYmxlcyBNRU1fU0hBUklOR19B
VURJVCkgd2hlbgpDT05GSUdfTUVNX1NIQVJJTkcgaXMgZW5hYmxlZC4KCk1hcmsgdGhlIGhlbHBl
ciBhcyBtYXliZV91bnVzZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4KClRoZSBhbHRlcm5hdGl2ZSBpcyB0byBkZWxldGUgdGhlIGhlbHBlciBhbmQgb3Bl
bmNvZGUgaXQgZm9yIGl0cyBvbmUgY2FsbGVyLgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYwppbmRleCBkZGYxZjBmOWY5Li4wYTE1NTBmZmQyIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYv
bW0vbWVtX3NoYXJpbmcuYwpAQCAtMzU4LDcgKzM1OCw3IEBAIHN0YXRpYyBib29sIHJtYXBfaGFz
X29uZV9lbnRyeShjb25zdCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogfQogCiAvKiBSZXR1cm5z
IHRydWUgaWYgdGhlIHJtYXAgaGFzIGFueSBlbnRyaWVzLiBPKDEpIGNvbXBsZXhpdHkuICovCi1z
dGF0aWMgYm9vbCBybWFwX2hhc19lbnRyaWVzKGNvbnN0IHN0cnVjdCBwYWdlX2luZm8gKnBhZ2Up
CitzdGF0aWMgYm9vbCBfX21heWJlX3VudXNlZCBybWFwX2hhc19lbnRyaWVzKGNvbnN0IHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2UpCiB7CiAgICAgcmV0dXJuIHJtYXBfY291bnQocGFnZSkgIT0gMDsK
IH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
