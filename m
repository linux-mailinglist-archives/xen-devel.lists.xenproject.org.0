Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD68AE9ED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:06:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7esU-0007Su-5V; Tue, 10 Sep 2019 12:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7esS-0007Sb-QG
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:04:08 +0000
X-Inumbo-ID: 16aa7b6f-d3c3-11e9-ac1c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16aa7b6f-d3c3-11e9-ac1c-12813bfff9fa;
 Tue, 10 Sep 2019 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568117047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bSRcze2/xAPYtafYw9UG0/rO0XL6ABwnUfMOl7e3MGA=;
 b=biNK/QN7FurJLx/6n7ESy7EVtuLxzu6LCEdMqlnGWVOstqQiVCGlXNIh
 pEGizsH9Wu3H91a+pUWyDY+MW5PoMvDlp0LUX1ZAiGgktHo4DkMV7RuB6
 leoWfwfRBfNn2I5N2DkgCTaKHLmUb1QGS1FSsGRnFjzJc2xqGKr14qXpk s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9iPnHVN4wMgqeXdmmPCzRbQ154ssZF+Uvni1AUAWa6/03qOKUXGDzgxFQG9lv2aP2t8Z88TkQ5
 IB9qu1so2t6y4JhZvpgnBIWFBFRdID/ajiUDrQAktuvxm8t0Z9iXy0M0b07CaFkAjfwpJXiIOy
 R997DiwmN97qK4gJXQr1BblWYqupzbc54p5PP1CTWnncboTMGnPodscE9reJVMtHMWL8AICD1M
 5aVA1It2cb+8ZnSodzpVeUI/ec+W5/Keu30q9ZBVUWRIKYIo9dmiknCHYehxqCGbk3OzvVxOMY
 3ow=
X-SBRS: 2.7
X-MesageID: 5370543
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5370543"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Sep 2019 13:02:00 +0100
Message-ID: <20190910120207.10358-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 05/12] tools/ocaml: abi-check: Add comments
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

UHJvdmlkZSBpbnRlcmZhY2UgZG9jdW1lbnRhdGlvbiBmb3IgdGhpcyBzY3JpcHQuCgpFeHBsYWlu
IHdoeSB3ZSBjaGVjayAubWwgbm90IC5tbGkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0b29scy9vY2FtbC9saWJzL3hjL2FiaS1j
aGVjayB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL2FiaS1jaGVjayBiL3Rvb2xzL29j
YW1sL2xpYnMveGMvYWJpLWNoZWNrCmluZGV4IGM5ODdjZDg0NTQuLmNjYzM1ZTc5ZTkgMTAwNzU1
Ci0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMvYWJpLWNoZWNrCisrKyBiL3Rvb2xzL29jYW1sL2xp
YnMveGMvYWJpLWNoZWNrCkBAIC01LDYgKzUsMTMgQEAgdXNlIERhdGE6OkR1bXBlcjsKIAogb3Vy
ICVlbnVtczsKIAorIyBVc2FnZTogYWJpLWNoZWNrIEMtZmlsZSBPY2FtbC1maWxlCisjIFdyaXRl
cyBvdXQgYSBCVUlMRF9CVUdfT04oKSBsaXN0IHRvIGJlIGluY2x1ZGVkIGJhY2sgaW50byBDLgor
IworIyBPY2FtbC1maWxlIHNob3VsZCBiZSB0aGUgLm1sIGZpbGUuICBUaGUgb2NhbWwgY29tcGls
ZXIgd2lsbCBjaGVjaworIyB0aGF0IGFueSBkZWNsYXJhdGlvbnMgaW4gYSAubWxpIGNvcnJlc3Bv
bmQuICBXZSBjaGVjayB0aGUgLm1sCisjIHJhdGhlciB0aGFuIHRoZSAubWxpIGluIGNhc2UgdGhl
cmUgYXJlIHByaXZhdGUgdHlwZXMgaW4gZnV0dXJlLgorCiBAQVJHViA9PSAyIG9yIGRpZTsKIG91
ciAoJGMsICRvKSA9IEBBUkdWOwogCkBAIC0xMyw2ICsyMCwxNCBAQCBvcGVuIFNURElOLCAiPCIs
ICRjIG9yIGRpZSAkITsKIG91ciAkY2xpbmUgPSAtMTsKIG91ciAkZWk7CiAKKyMgUGFyc2UgdGhl
IEMgZmlsZSBsb29raW5nIGZvciBjYWxscyB0bzoKKyMgICBjX2JpdG1hcF90b19vY2FtbF9saXN0
KCkKKyMKKyMgZm9sbG93ZWQgYnkgYW5vdGF0aW9ucyBvZiB0aGUgZm9sbG93aW5nIGZvcm06Cisj
ICAgLyogISBPVHlwZSBPUHJlZml4IE1hbmdsZSAqLworIyAgIC8qICEgQ1ByZWZpeCBDRmluYWwg
Q0ZpbmFsSG93ICovCisjCisjIFRoZSBmdW5jdGlvbiBkZWZpbml0aW9ucyB1c2UgLyogISAqLyB3
aGljaCBzaW1wbHkgc2tpcHMgdGhhdCBpbnN0YW5jZS4KIHdoaWxlICg8PikgewogICAgIGlmICgk
Y2xpbmUgPT0gLTEpIHsKICAgICAgICAgaWYgKG0vY19iaXRtYXBfdG9fb2NhbWxfbGlzdC8pIHsK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
