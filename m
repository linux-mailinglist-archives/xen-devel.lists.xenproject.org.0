Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44810F81A0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2019 21:57:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUGiY-0000yf-7f; Mon, 11 Nov 2019 20:55:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WBpA=ZD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUGiW-0000ya-P8
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 20:55:20 +0000
X-Inumbo-ID: 914cf33c-04c5-11ea-a219-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 914cf33c-04c5-11ea-a219-12813bfff9fa;
 Mon, 11 Nov 2019 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573505719;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=X7N8N5j3TbS0A03KtmkM+8wnCK8YcLEFlb0XqGT7JS0=;
 b=O4h8Zkj8LaE6iK344wXBeK2pZDg2fSbKh0cW03uFMxSUM1FupXm720ws
 dGeezS1zTtAe0u/rOZqjXjc+UFP8YuPWTsrQHVce3CvurKzBaVmqKo4K9
 Sa5/PKSm0a4kwrqLJ9rT+WsyqdS9ITGVwW3h49DnnysoefklwT9b72C7e Q=;
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
IronPort-SDR: HYiBlN1acpkIYYPk+hQulzDR2si6wL+vLynDb1l0xwjGv2bxjXMmkC4U8l76zYuXEUcWiq1CVq
 3c54gYhWZijx+QGYcVE8VEy2CYls7dAPYhNO5CGyhrbnnObd8w00JFh+6/BMIOQqTJIaBiEYLd
 S5VlnSwcLSGwU7QQsXJ+Wq0fP0713gKuy+FsQJ6Q8PdCT4V9B2kHnNEcLLtWqI2uk3Ukda67RQ
 Y92kp9AE6p+FfhfhOtdliH+njBeWChyUDcj7wrTbVcT8kQBUxtEe7JskkCie094Z7tPlEn9oed
 hgY=
X-SBRS: 2.7
X-MesageID: 8268646
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,293,1569297600"; 
   d="scan'208";a="8268646"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 11 Nov 2019 20:55:14 +0000
Message-ID: <20191111205514.2779-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] AMD/IOMMU: Fix passthrough following c/s
 d7cfeb7c13e
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jennifer Herbert <jennifer.herbert@citrix.com>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IkFNRC9JT01NVTogZG9uJ3QgYmxpbmRseSBhbGxvY2F0ZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHRh
YmxlcyIgaW50cm9kdWNlcyBhCmNhbGwgYXQgcnVudGltZSBmcm9tIGFtZF9pb21tdV9hZGRfZGV2
aWNlKCkgdG8gYW1kX2lvbW11X3NldF9pbnRyZW1hcF90YWJsZSgpCndoaWNoIGlzIHN0aWxsIG1h
cmtlZCBhcyBfX2luaXQuCgpPbiBvbmUgQU1EIFJvbWUgbWFjaGluZSB3ZSBoYXZlLCB0aGlzIHJl
c3VsdHMgaW4gYSBjcmFzaCB0aGUgbW9tZW50IHdlIHRyeSB0bwp1c2UgYW4gU1ItSU9WIFZGIGlu
IGEgVk0uCgpSZXBvcnRlZC1ieTogSmVubmlmZXIgSGVyYmVydCA8amVubmlmZXIuaGVyYmVydEBj
aXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkZvciA0LjEzLiAgVGhpcyBpcyBhIHJlZ3Jl
c3Npb24gdnMgNC4xMgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAu
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYwppbmRleCAyODU5ZDgyNTdlLi5m
M2ZjZmI5ZTBmIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
bWFwLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5jCkBAIC0x
MTIsNyArMTEyLDcgQEAgdm9pZCBhbWRfaW9tbXVfc2V0X3Jvb3RfcGFnZV90YWJsZShzdHJ1Y3Qg
YW1kX2lvbW11X2R0ZSAqZHRlLAogICAgIGR0ZS0+diA9IHZhbGlkOwogfQogCi12b2lkIF9faW5p
dCBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKAordm9pZCBhbWRfaW9tbXVfc2V0X2ludHJl
bWFwX3RhYmxlKAogICAgIHN0cnVjdCBhbWRfaW9tbXVfZHRlICpkdGUsIGNvbnN0IHZvaWQgKnB0
ciwKICAgICBjb25zdCBzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgYm9vbCB2YWxpZCkKIHsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
