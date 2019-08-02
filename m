Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDEB7FDFC
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwj-0006CJ-Fu; Fri, 02 Aug 2019 15:58:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwg-000681-NY
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:18 +0000
X-Inumbo-ID: 577fb2b2-b53e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 577fb2b2-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:17 +0000 (UTC)
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
IronPort-SDR: /dKiIlC9o2Aom6t1j2477ZEZxP3y3UnU3ECXNVXeJ5wvCPxGdntEA7G814F4ozESYvZZRBhs3e
 ZvTQeM/nZjdhpiULCcoXky/UA8xfEQ5XGnCgV3w9VtmLFSqDAPLRrT7OdYgBeJ1dxaeeFeo4uq
 Sxfcaod4zcA/n79Y0p7a4oIwQTwGb4shv4Ui+Z684DrONwyzvcVAHCF17aptghGNcn0RlbDn8N
 bHVLDqX6FCp3YrQw8w+KA0LeTrprQ/8Xe1LUQGOVx/Ixip5WrZztMnOJfW7hNsThUW7dIHYOLW
 mFU=
X-SBRS: 2.7
X-MesageID: 3787839
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3787839"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:49 +0100
Message-ID: <20190802153606.32061-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 18/35] libxl: Add device_{config,
 type} to libxl__ao_device
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

VGhlc2UgdHdvIGZpZWxkcyBoZWxwIHRvIGdpdmUgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
ZGV2aWNlIGJlZW4KaG90cGx1Zy9ob3R1bnBsdWcgdG8gY2FsbGJhY2tzLgoKVGhlcmUgaXMgYWxy
ZWFkeSBgZGV2JyBvZiB0eXBlIGBsaWJ4bF9fZGV2aWNlJywgYnV0IGl0IGlzIG1vc3RseQp1c2Vm
dWwgd2hlbiB0aGUgYmFja2VuZC9mcm9udGVuZCBpcyB4ZW5zdG9yZS4gU29tZSBkZXZpY2UgKGxp
a2UKYHVzYmRldicpIGRvbid0IGhhdmUgZGV2aWQsIHNvIGBkZXYnIGNhbid0IGJlIHVzZWQuCgpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
LS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgNiArKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRl
cm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBjYzkzMThmMzNhLi44
ZGVhNDRiMjIxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTI2MjMsNiArMjYyMywxMiBAQCBzdHJ1
Y3QgbGlieGxfX2FvX2RldmljZSB7CiAgICAgLyogZm9yIGFzeW5jaHJvbm91cyBleGVjdXRpb24g
b2Ygc3luY2hyb25vdXMtb25seSBzeXNjYWxscyBldGMuICovCiAgICAgbGlieGxfX2V2X2NoaWxk
IGNoaWxkOwogICAgIGxpYnhsX19ldl9xbXAgcW1wOworICAgIC8qICdkZXZpY2VfY29uZmlnJyBj
YW4gYmUgdXNlZCB0byB0byBwYXNzIHRvIGNhbGxiYWNrcyBhIHBvaW50ZXIgb2Ygb25lCisgICAg
ICogb2YgdGhlIHR5cGUgJ2xpYnhsX2RldmljZV8kdHlwZScgY29ycmVzcG9uZGluZyB0byB0aGUg
ZGV2aWNlIGJlZW4KKyAgICAgKiBob3RwbHVnLiAnZGV2aWNlX3R5cGUnIHNob3VsZCBoYXZlIHRo
ZSBjb3JyZXNwb25kaW5nCisgICAgICogJ2xpYnhsX18kdHlwZV9kZXZ0eXBlJy4gKi8KKyAgICB2
b2lkICpkZXZpY2VfY29uZmlnOworICAgIGNvbnN0IGxpYnhsX19kZXZpY2VfdHlwZSAqZGV2aWNl
X3R5cGU7CiB9OwogCiAvKgotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
