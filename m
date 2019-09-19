Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA0B8049
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:44:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0RB-0005Gu-IX; Thu, 19 Sep 2019 17:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0RA-0005FO-7b
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:48 +0000
X-Inumbo-ID: b17915ae-db04-11e9-a337-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b17915ae-db04-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1joyt2oTnmoDoh4BUR7K40cbB7Y8Nc6WE5CdjgCQcxg=;
 b=adf4k1lUtTlQbSutUhd12P2Ivwm4N3+0D3dQFjh6we1GH8ZcW4pFXkUp
 4F58xcdoaLUr7QvALoiaGmLp97e3RdNyBukooFARXsWF1NXUIs2jXG6b0
 QyjHHF01soMbTYaii/8EDTMPlgmuseVJkwRrPfdLszDyxHGq8p1fV5jx3 0=;
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
IronPort-SDR: UYZ1MTGEY2TV0LZUQGlLG5Ve+mpx1Squ7lwgnwMsgAj0PS/XiDnQmbf/Pp/RWtQ+LG25rsOILE
 mbXXdai7SX1mv3TlHrGtyCglrpIsNJKaDWJ7EFUEV/UZQxlMXGzM3In3mHt0QGuUuGC7SOzhpz
 4FQSMZ1xMVtQp/zjvr38KHEfxels7b0VFWs1E/c7jdDtayBLgmsZf1gM/tVZ88sNH34UPnSUox
 7cYLnzk/+EJ97BZoNwMjZrlqMV+HutVpK70tkvRFgWW/yJf4CWEHxF7b6otiGgAXzOnnV1yH3c
 C3M=
X-SBRS: 2.7
X-MesageID: 5801808
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5801808"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:44 +0100
Message-ID: <20190919171656.899649-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 24/35] libxl: Remove
 libxl__qmp_run_command_flexarray
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

VGhlcmUgYXJlIG5vIG1vcmUgdXNlcnMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAg
MyAtLS0KIHRvb2xzL2xpYnhsL2xpYnhsX3FtcC5jICAgICAgfCAxNiAtLS0tLS0tLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmggYi90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCmluZGV4
IDZjMDliOTNmOTFmMS4uNTcxMzAxYTVkNWQ4IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTE5ODAs
OSArMTk4MCw2IEBAIHR5cGVkZWYgc3RydWN0IGxpYnhsX19xbXBfaGFuZGxlciBsaWJ4bF9fcW1w
X2hhbmRsZXI7CiAgKi8KIF9oaWRkZW4gbGlieGxfX3FtcF9oYW5kbGVyICpsaWJ4bF9fcW1wX2lu
aXRpYWxpemUobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQpOwotX2hpZGRlbiBpbnQgbGlieGxfX3Ft
cF9ydW5fY29tbWFuZF9mbGV4YXJyYXkobGlieGxfX2djICpnYywgaW50IGRvbWlkLAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY21kLAot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5X3Qg
KmFycmF5KTsKIF9oaWRkZW4gaW50IGxpYnhsX19xbXBfcGNpX2FkZChsaWJ4bF9fZ2MgKmdjLCBp
bnQgZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KTsKIF9oaWRkZW4gaW50IGxpYnhsX19xbXBf
cGNpX2RlbChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggMGQ2YWVkY2M3
ZDNjLi5jNzhlZjQ2MzdkMGEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCisr
KyBiL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jCkBAIC04MzMsMjIgKzgzMyw2IEBAIHN0YXRpYyBp
bnQgcW1wX3J1bl9jb21tYW5kKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwKICAgICByZXR1cm4g
cmM7CiB9CiAKLWludCBsaWJ4bF9fcW1wX3J1bl9jb21tYW5kX2ZsZXhhcnJheShsaWJ4bF9fZ2Mg
KmdjLCBpbnQgZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3QgY2hhciAqY21kLCBmbGV4YXJyYXlfdCAqYXJyYXkpCi17Ci0gICAgbGlieGxfX2pzb25fb2Jq
ZWN0ICphcmdzID0gTlVMTDsKLSAgICBpbnQgaTsKLSAgICB2b2lkICpuYW1lLCAqdmFsdWU7Ci0K
LSAgICBmb3IgKGkgPSAwOyBpIDwgYXJyYXktPmNvdW50OyBpICs9IDIpIHsKLSAgICAgICAgZmxl
eGFycmF5X2dldChhcnJheSwgaSwgJm5hbWUpOwotICAgICAgICBmbGV4YXJyYXlfZ2V0KGFycmF5
LCBpICsgMSwgJnZhbHVlKTsKLSAgICAgICAgbGlieGxfX3FtcF9wYXJhbV9hZGRfc3RyaW5nKGdj
LCAmYXJncywgKGNoYXIgKiluYW1lLCAoY2hhciAqKXZhbHVlKTsKLSAgICB9Ci0KLSAgICByZXR1
cm4gcW1wX3J1bl9jb21tYW5kKGdjLCBkb21pZCwgY21kLCBhcmdzLCBOVUxMLCBOVUxMKTsKLX0K
LQogaW50IGxpYnhsX19xbXBfcGNpX2FkZChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsIGxpYnhs
X2RldmljZV9wY2kgKnBjaWRldikKIHsKICAgICBsaWJ4bF9fcW1wX2hhbmRsZXIgKnFtcCA9IE5V
TEw7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
