Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CBCAEE67
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:20:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7hue-0002Ol-5n; Tue, 10 Sep 2019 15:18:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7huc-0002OO-8x
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:18:34 +0000
X-Inumbo-ID: 3fe5c252-d3de-11e9-ac1f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fe5c252-d3de-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568128713;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=PdLFScxDIhTc+vZh/i0ruuu2uWhe2SbqTfhGqg/yEAc=;
 b=foKXnHNW/URlYifYROfKDy2TizW90dRH1WrB5GQBh0Mw/l6rzRKrVLyj
 DjTRr+XWMi43bRb7Awj19aQ+G1t/w/ajoAxbuZiEunnNuXLH6Ru9oWVDb
 8pIHacfJfxJ3Gkq+HoHIsvaAz8CEnnhtS/5b1r/MU0H2JUAF+Dy/4SLb7 k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zOcCYuMztLYtfaLw/ILhXWmDlyjhPnurirDz7PROFAegfTIRDf6ZQ5pQkfg/q6Fdmx4cZIi4hg
 C3pUnFyVNQs6oFAFYgOgiAHtFtMpfBUdnfRPnzfSJhdT+FiPg4cjuTh/Y0U5EFtRXqzMZjD0c6
 Dtdm8ya4Rcixf6MoR78kn3OCZ8lbckN/9nhgiR1YG7hjya4Yuaeu8r48uga826tunI2d+qqwZT
 6A0mdcbpnt2+g0yAG6/XHx5DkZ4Uy2igI/xIf2ixcr8lAfGNyJ0O5T6iMxM0ddEOhctu8kQY0Y
 Kww=
X-SBRS: 2.7
X-MesageID: 5380434
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5380434"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 16:17:58 +0100
Message-ID: <20190910151758.8447-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] tools/ocaml: abi check: #include on x86 only
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+ClNp
Z25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0K
IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIHwgMTMgKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9z
dHVicy5jCmluZGV4IGY4NmVjYzdiN2UuLjNlZmY2ZGQ4YzIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL29j
YW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jCisrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVu
Y3RybF9zdHVicy5jCkBAIC0xMzUsNyArMTM1LDIwIEBAIHN0YXRpYyB2YWx1ZSBjX2JpdG1hcF90
b19vY2FtbF9saXN0CiAJQ0FNTHBhcmFtMCgpOwogCUNBTUxsb2NhbDIobGlzdCwgdG1wKTsKIAor
I2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykKKy8qCisgKiBUaGlz
IGNoZWNrIGZpbGUgY29udGFpbnMgYSBtaXh0dXJlIG9mIHN0dWZmLCBiZWNhdXNlIGl0IGlzCisg
KiBnZW5lcmF0ZWQgZnJvbSB0aGUgd2hvbGUgb2YgdGhpcyB4ZW5jdHJsX3N0dWJzLmMgZmlsZSAo
d2l0aG91dAorICogcmVnYXJkIHRvIGFyY2ggaWZkZWZzKSBhbmQgdGhlIHdob2xlIG9mIHhlbmN0
cmwubWwgKHdoaWNoIGRvZXMgbm90CisgKiBoYXZlIGFueSBhcmNoIGlmZGVmZmVyeSkuICBDdXJy
ZW50bHksIHRoZXJlIGlzIG9ubHkgeDg2IGFuZAorICogYXJjaC1pbmRlcGVuZGVudCBzdHVmZiwg
YW5kIHRoZXJlIGlzIG5vIGZhY2lsaXR5IGluIHRoZSBhYmktY2hlY2sKKyAqIHNjcmlwdCBmb3Ig
YXJjaCBjb25kaXRpb25hbHMuICBTbyBmb3Igbm93IHdlIG1ha2UgdGhlIGNoZWNrcworICogZWZm
ZWN0aXZlIG9uIHg4NiBvbmx5OyB0aGlzIHdpbGwgc3VmZmljZSB0byBkZWZlbmQgZXZlbiBBUk0K
KyAqIGJlY2F1c2UgYnJlYWtpbmcgY2hhbmdlcyB0byBjb21tb24gY29kZSB3aWxsIGJyZWFrIHRo
ZSBidWlsZAorICogb24geDg2IGFuZCBub3QgbWFrZSBpdCB0byBtYXN0ZXIuICBUaGlzIGlzIGEg
Yml0IG9mIGEgYm9kZ2UuCisgKi8KICNpbmNsdWRlICJ4ZW5jdHJsX2FiaV9jaGVjay5oIgorI2Vu
ZGlmCiAKIAlsaXN0ID0gdG1wID0gVmFsX2VtcHR5bGlzdDsKIAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
