Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6DBAEA00
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:07:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7etD-0007ga-9H; Tue, 10 Sep 2019 12:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7etB-0007fm-G4
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:04:53 +0000
X-Inumbo-ID: 31652ca8-d3c3-11e9-ac1c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31652ca8-d3c3-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=h/fM562KSuL0JIc6nYTX1M5txhX97wvqWpsaR1Idrg0=;
 b=gP+xzRSHAfMhl94LvD2l0H6tWMVPdgYfQ1odhFsd5nE1xFiK6RTsqrJe
 mm6qhjZwNmt8MxZz4WIOCVhZv1Cwpvr+ZA0pg1kX54I2cBys8xFLWHA2p
 f7KLlTQH+DWaK3kOTj5ZwivQlCyUgq7JlySLyeudA8Q+qGhSYy5B6Zc/k 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zPN9RxdZYH9A8036UAd1ZldJJXJjq9gMiXm12pO1lYzBKMVTOaT1VXwL+Q35QLy0D0vw9UVJLe
 ZlzGiWSyvFzZEpSMrf14kQcTN3uhWtIgINUZxjlv6xGvdbUiurtBB2fLyKwC0GILYrbfLCvs6m
 x2UQ/oNAb9uiZGALvNdIVQlt5XEuJW7HpVLAUFg1Rsf/7GwqQOGW8e0h79vfbOzggvAiXt+27Z
 12KBBxIJVM2W+Y2NwCq1ODXGFkAQXnCvDiz2CKQUfqZGEb1XG6g3I7uqgwuJM+1H9q3EC7WU+g
 2Yk=
X-SBRS: 2.7
X-MesageID: 5603664
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5603664"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:03 +0100
Message-ID: <20190910120207.10358-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 08/12] tools/ocaml: abi-check: Cope with
 multiple conversions of same type
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogdG9vbHMvb2NhbWwvbGlicy94Yy9hYmktY2hlY2sgfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy9hYmkt
Y2hlY2sgYi90b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjawppbmRleCA5NDUwNjc2NDI5Li5h
YmNkNmNlNmYxIDEwMDc1NQotLS0gYS90b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjaworKysg
Yi90b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjawpAQCAtMjcsNiArMjcsOCBAQCBvdXIgJGVp
OwogIyBmb2xsb3dlZCBieSBhbm90YXRpb25zIG9mIHRoZSBmb2xsb3dpbmcgZm9ybToKICMgICAv
KiAhIE9UeXBlIE9QcmVmaXggTWFuZ2xlICovCiAjICAgLyogISBDUHJlZml4IENGaW5hbCBDRmlu
YWxIb3cgKi8KKyMgb3IsIGZvciBzdWJzZXF1ZW50IGludm9jYXRpb25zIGZvciB0aGUgc2FtZSBP
VHlwZSwganVzdAorIyAgIC8qICEgT1R5cGUgKi8KICMKICMgVGhlIGZ1bmN0aW9uIGRlZmluaXRp
b25zIHVzZSAvKiAhICovIHdoaWNoIHNpbXBseSBza2lwcyB0aGF0IGluc3RhbmNlLgogd2hpbGUg
KDxDX0ZJTEU+KSB7CkBAIC00Miw2ICs0NCw5IEBAIHdoaWxlICg8Q19GSUxFPikgewogICAgICAg
ICBteSBAdmFscyA9IHNwbGl0IC9ccysvLCAkMTsKICAgICAgICAgaWYgKCRjbGluZSA9PSAxICYm
ICFAdmFscykgewogICAgICAgICAgICAgJGNsaW5lID0gLTE7CisgICAgICAgIH0gZWxzaWYgKCRj
bGluZSA9PSAxICYmIEB2YWxzID09IDEpIHsKKyAgICAgICAgICAgIG15ICgkb3R5cGUpID0gQHZh
bHM7CisgICAgICAgICAgICBkaWUgInJlZmVyZW5jZSB0byB1bmRlZmluZWQgT1R5cGUgJG90eXBl
IiB1bmxlc3MgJGVudW1zeyRvdHlwZX07CiAgICAgICAgIH0gZWxzaWYgKCRjbGluZSA9PSAxICYm
IEB2YWxzID09IDMpIHsKICAgICAgICAgICAgICRlaS0+eyRffSA9IHNoaWZ0IEB2YWxzIGZvcmVh
Y2ggcXcoT1R5cGUgT1ByZWZpeCBNYW5nbGUpOwogICAgICAgICB9IGVsc2lmICgkY2xpbmUgPT0g
MiAmJiBAdmFscyA9PSAzKSB7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
