Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DA10A323
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:10:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZeKA-00013j-3s; Tue, 26 Nov 2019 17:08:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=92JX=ZS=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iZeK8-00013e-Os
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:08:24 +0000
X-Inumbo-ID: 5a850104-106f-11ea-a3a5-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a850104-106f-11ea-a3a5-12813bfff9fa;
 Tue, 26 Nov 2019 17:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574788104;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=kmubR2fmYJKIh04zW4i+clZ0PiCfZ0qo/+44Qw1S9AU=;
 b=MYXtsF7i0SyPTNcudPN06reKsEKOL2yIVhf/BYYDaZaNwFWGqgQx9tqK
 BBfLb14V/Q7XAABKnhkW/VvfUsazSFSg01FJYIkVmz5yntNNarKTT98wh
 ENfBf7J1AWBMI9mMhqVNoyuLIuWxskGc+kpmz0Ju/iYSMvgS5pV1PSqfU c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qJUO4F5ZHYHCsjsgY57h7CE9q+VsSBl5WhlrpPq1nuk8RHAsyLUQRIpT18pu2B40h35jkMetJq
 lHSzVlvQcIQJx33xhqRh2B/K2MLeyeDr0CnA5RkKJtA5rw4jxycpyLivdv7ImoLS9n6GuHjapm
 d55WI3z5tv3FVVhyq/YumevtgBPhNz6YQx46FSpI60aOwdvcaEBNC9IS/3+I5FHD3Q+L3pNPyW
 Mj4t36fYkBKz7zLEcKc0cWhDgps81RDzgVi/gHJEb/yKybWkM6ywLKGIR+0P4oyMff5ALeMftR
 xuU=
X-SBRS: 2.7
X-MesageID: 8858396
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,246,1571716800"; 
   d="scan'208";a="8858396"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 17:08:19 +0000
Message-ID: <1574788099-11821-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: jgross@suse.com, andrew.cooper3@citrix.com, jbeulich@suse.com, Igor
 Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SVYgYml0IHNob3VsZG4ndCBiZSBzZXQgaW4gRFRFIGlmIGludGVycnVwdCByZW1hcHBpbmcgaXMg
bm90CmVuYWJsZWQuIEl0J3MgYSByZWdyZXNzaW9uIGluIGJlaGF2aW9yIG9mICJpb21tdT1uby1p
bnRyZW1hcCIKb3B0aW9uIHdoaWNoIG90aGVyd2lzZSB3b3VsZCBrZWVwIGludGVycnVwdCByZXF1
ZXN0cyB1bnRyYW5zbGF0ZWQKZm9yIGFsbCBvZiB0aGUgZGV2aWNlcyBpbiB0aGUgc3lzdGVtIHJl
Z2FyZGxlc3Mgb2Ygd2V0aGVyIGl0J3MKZGVzY3JpYmVkIGFzIHZhbGlkIGluIElWUlMgb3Igbm90
LgoKU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5j
b20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCmluZGV4IDE2ZTg0ZDQuLjJiODFlMzggMTAw
NjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwpAQCAtMTI3OSw3ICsxMjc5
LDcgQEAgc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11X3NldHVwX2RldmljZV90YWJsZSgKICAg
ICAgICAgZm9yICggYmRmID0gMCwgc2l6ZSAvPSBzaXplb2YoKmR0KTsgYmRmIDwgc2l6ZTsgKyti
ZGYgKQogICAgICAgICAgICAgZHRbYmRmXSA9IChzdHJ1Y3QgYW1kX2lvbW11X2R0ZSl7CiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC52ID0gdHJ1ZSwKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgLml2ID0gdHJ1ZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgLml2ID0gaW9tbXVfaW50
cmVtYXAsCiAgICAgICAgICAgICAgICAgICAgICAgfTsKICAgICB9CiAKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
