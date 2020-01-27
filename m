Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E514A64C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:37:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5Tx-0001mF-AB; Mon, 27 Jan 2020 14:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5Tv-0001lC-JN
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:35:15 +0000
X-Inumbo-ID: 2f48dd2a-4112-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f48dd2a-4112-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=UbsHe1wi3bTySabmAStCVzWgNCVaNfk2EHfbK/LjL+0=;
 b=KSBI2A4ph531kVSEnmdRn5rfr2JFSaMRFj+rVPa4Y0CeemBv3yDX5z+c
 27grabNur+x+Oa7DRtsWfBCPte1Vbab/7wA15c1NQ1feXJSUCmobXuzLH
 v0ZvHtD3AHXPPJ2sOhZTZ57WoM45BToU66peBOGCcc9+acn9/Sk9ZPKg1 o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n26TYleU3B6VHBVLUCxZWwCT7npHwNnkpCvMJx1MrqsJ8lg/s3nbzrTvRbiiVEcscmaqX8Zdvr
 jawnTBmQrGi7Bz8iMvPMjJvvncSL52srocGldwR/SbB+Fm7ivCWLHxjrKq7DusdJ/y1XcMffqt
 5yY4iVobU77ZUO/KPWm3vu4i7LzqMXksyWlHbVnXE6Al3+MW5IIVpk1YhMrxEWWNffuXEawf9w
 XT9hfptcpibPmWdG37d+fnAZzj7WSYuc/MhfGB0o3vcUOJBb7juy20sE+KmwpSEFlYQGkttH4x
 q3E=
X-SBRS: 2.7
X-MesageID: 11664983
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11664983"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:36 +0000
Message-ID: <20200127143444.25538-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 09/17] tools/libxl: Provide a
 static_data_done callback for domain restore
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3aWxsIGJlIG5lZWRlZCBzaG9ydGx5IHRvIHByb3ZpZGUgYmFja3dhcmRzIGNvbXBhdGli
bGl0eSBmb3IgbWlncmF0aW9uCnN0cmVhbXMgd2hpY2ggZG8gbm90IGhhdmUgQ1BVSUQgaW5mb3Jt
YXRpb24gY29udGFpbmVkIHdpdGhpbiB0aGVtLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgeWV0LgoK
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT4KCnYyOgogKiBTcGxpdC9yZWFycmFuZ2VkIGZyb20gdjEKLS0tCiB0b29scy9saWJ4bC9saWJ4
bF9jcmVhdGUuYyAgICAgICAgIHwgMTIgKysrKysrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9z
YXZlX21zZ3NfZ2VuLnBsIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYwppbmRleCAzMmQ0NWRjZWYwLi4xMjExMzE4NWFjIDEwMDY0NAotLS0gYS90
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUu
YwpAQCAtMTIyNyw2ICsxMjI3LDcgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2Jvb3Rsb2FkZXJf
ZG9uZShsaWJ4bF9fZWdjICplZ2MsCiAgICAgZGNzLT5zcnMuZGNzID0gZGNzOwogCiAgICAgLyog
UmVzdG9yZSAqLworICAgIGNhbGxiYWNrcy0+c3RhdGljX2RhdGFfZG9uZSA9IGxpYnhsX19zcm1f
Y2FsbG91dF9jYWxsYmFja19zdGF0aWNfZGF0YV9kb25lOwogICAgIGNhbGxiYWNrcy0+cmVzdG9y
ZV9yZXN1bHRzID0gbGlieGxfX3NybV9jYWxsb3V0X2NhbGxiYWNrX3Jlc3RvcmVfcmVzdWx0czsK
IAogICAgIC8qIENPTE8gb25seSBzdXBwb3J0cyBIVk0gbm93IGJlY2F1c2UgaXQgZG9lcyBub3Qg
d29yayB2ZXJ5CkBAIC0xMjk2LDYgKzEyOTcsMTcgQEAgc3RhdGljIHZvaWQgbGlieGxfX2NvbG9f
cmVzdG9yZV9zZXR1cF9kb25lKGxpYnhsX19lZ2MgKmVnYywKICAgICBsaWJ4bF9fc3RyZWFtX3Jl
YWRfc3RhcnQoZWdjLCAmZGNzLT5zcnMpOwogfQogCitpbnQgbGlieGxfX3NybV9jYWxsb3V0X2Nh
bGxiYWNrX3N0YXRpY19kYXRhX2RvbmUodm9pZCAqdXNlcikKK3sKKyAgICBsaWJ4bF9fc2F2ZV9o
ZWxwZXJfc3RhdGUgKnNocyA9IHVzZXI7CisgICAgbGlieGxfX2RvbWFpbl9jcmVhdGVfc3RhdGUg
KmRjcyA9IHNocy0+Y2FsbGVyX3N0YXRlOworICAgIFNUQVRFX0FPX0dDKGRjcy0+YW8pOworCisg
ICAgLyogTm90aGluZyB0byBkbyAoeWV0KS4gKi8KKworICAgIHJldHVybiAwOworfQorCiB2b2lk
IGxpYnhsX19zcm1fY2FsbG91dF9jYWxsYmFja19yZXN0b3JlX3Jlc3VsdHMoeGVuX3Bmbl90IHN0
b3JlX21mbiwKICAgICAgICAgICB4ZW5fcGZuX3QgY29uc29sZV9tZm4sIHZvaWQgKnVzZXIpCiB7
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsIGIvdG9vbHMv
bGlieGwvbGlieGxfc2F2ZV9tc2dzX2dlbi5wbAppbmRleCA4MzFhMTVlMGJiLi45M2RjMjUyMzcw
IDEwMDc1NQotLS0gYS90b29scy9saWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX3NhdmVfbXNnc19nZW4ucGwKQEAgLTI5LDYgKzI5LDcgQEAgb3VyIEBt
c2dzID0gKAogICAgIFsgJ3NyY3hBJywgICJ3YWl0X2NoZWNrcG9pbnQiLCBbXSBdLAogICAgIFsg
J3NjeEEnLCAgICJzd2l0Y2hfcWVtdV9sb2dkaXJ0eSIsICBbcXcodWludDMyX3QgZG9taWQKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGVuYWJsZSld
IF0sCisgICAgWyAncmN4VycsICAgInN0YXRpY19kYXRhX2RvbmUiLCAgICAgIFtdIF0sCiAgICAg
WyAncmN4JywgICAgInJlc3RvcmVfcmVzdWx0cyIsICAgICAgIFsneGVuX3Bmbl90JywgJ3N0b3Jl
X2dmbicsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAneGVuX3Bm
bl90JywgJ2NvbnNvbGVfZ2ZuJ10gXSwKICAgICBbICdzclcnLCAgICAiY29tcGxldGUiLCAgICAg
ICAgICAgICAgW3F3KGludCByZXR2YWwKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
