Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6909B9E988
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:35:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bb2-0004MS-Fq; Tue, 27 Aug 2019 13:33:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8wY6=WX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i2bb1-0004MI-Ab
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:33:15 +0000
X-Inumbo-ID: 3734c2c6-c8cf-11e9-ae35-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3734c2c6-c8cf-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566912792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Evh/5LyKfZIwz6MpzK7DNYlQ6kRXiowbyoltKQb/7FM=;
 b=ZQx+LRS+BxukOWl0mGPY5uRtxxyiCZF0WuTrxUcL2HInOz4qskCkqD5W
 3VhXg1DegKi1tYlmNzPTeOetv/udR6JhbW8a63QQlBWqSUyGZsycWLMLh
 tN3VT/dloqogE9qlyM801duQlKAdHNFE0PlFyMHzXRE+jmvXZE/Oqd0gc g=;
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
IronPort-SDR: 7kfNZTu9scceGpJZthsMQ9YewLEBz1yUgwFlRBbfBFUikoMNgoesa8K7VsE5hwSkZRtr/RAAFx
 dHka7gqfcjMpE7J1qMp2O0YQ3oZNa/j5IWVVJNA5lDITUguAd2ONoKCSsTL6OxNWquMu9phLH9
 i3xv0CZ+KK1v7Ve2o0Ldb03FF7gUirljMBnJv2CmZbSgObT+D1WFbK9nBvnCDZJJGfFp4C7MyC
 vHJzCWtLf+x7+qZo66SglD8ipqq4zi6xFIMzPiAvFrJg/SIwHkk2yebV4ve3zflAwbIdv45+j+
 5Ok=
X-SBRS: 2.7
X-MesageID: 4987742
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,437,1559534400"; 
   d="scan'208";a="4987742"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 27 Aug 2019 14:32:56 +0100
Message-ID: <20190827133259.32084-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827133259.32084-1-anthony.perard@citrix.com>
References: <20190827133259.32084-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 1/4] xen: Fix ring.h header
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHhlbl9bcnddP21iKCkgbWFjcm9zIGRlZmluZWQgaW4gcmluZy5oIGNhbid0IGJlIHVzZWQg
YW5kIHRoZSBmYWN0CnRoYXQgdGhlcmUgYXJlIGdhdGVkIGJlaGluZCBfX1hFTl9JTlRFUkZBQ0Vf
VkVSU0lPTl9fIG1lYW5zIHRoYXQgaXQKbmVlZHMgdG8gYmUgZGVmaW5lZCBzb21ld2hlcmUuIFFF
TVUgZG9lc24ndCBpbXBsZW1lbnQgaW50ZXJmYWNlcyB3aXRoCnRoZSBYZW4gaHlwZXJ2aXNvciBz
byBkZWZpbmluZyBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIGlzIHBvaW50bGVzcy4KVGhpcyBs
ZWFkcyB0bzoKICAgIGluY2x1ZGUvaHcveGVuL2lvL3JpbmcuaDo0Nzo1OiBlcnJvcjogIl9fWEVO
X0lOVEVSRkFDRV9WRVJTSU9OX18iCiAgICAgICAgaXMgbm90IGRlZmluZWQsIGV2YWx1YXRlcyB0
byAwIFstV2Vycm9yPXVuZGVmXQoKQ2xlYW51cCByaW5nLmguIFRoZSB4ZW5fKm1iKCkgbWFjcm9z
IGFyZSBhbHJlYWR5IGRlZmluZWQgaW4geGVuY3RybC5oCndoaWNoIGlzIGluY2x1ZGVkIGluIHhl
bl9jb21tb24uaC4KClJlcG9ydGVkLWJ5OiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhh
dC5jb20+ClNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgpSZXZpZXdlZC1ieTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29t
PgpNZXNzYWdlLUlkOiA8MjAxOTA3MDQxNTM2MDUuNDE0MC0xLWFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+ClthcGVyYXJkOiBBZGRpbmcgdGhlIGNvbW1lbnQgcHJvcG9zZWQgdXBzdHJlYW1dClNp
Z25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgot
LS0KIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9yaW5nLmggfCAxMyArKysrKysrLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9yaW5nLmggYi9pbmNsdWRlL2h3L3hl
bi9pbnRlcmZhY2UvaW8vcmluZy5oCmluZGV4IDFhZGFjZjA5ZjkuLjVkMDQ4YjMzNWMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9yaW5nLmgKKysrIGIvaW5jbHVkZS9o
dy94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaApAQCAtMzMsNiArMzMsMTMgQEAKICAqIC0gc3RhbmRh
cmQgaW50ZWdlcnMgdHlwZXMgKHVpbnQ4X3QsIHVpbnQxNl90LCBldGMpCiAgKiBUaGV5IGFyZSBw
cm92aWRlZCBieSBzdGRpbnQuaCBvZiB0aGUgc3RhbmRhcmQgaGVhZGVycy4KICAqCisgKiBCZWZv
cmUgdXNpbmcgdGhlIGRpZmZlcmVudCBtYWNyb3MsIHlvdSBuZWVkIHRvIHByb3ZpZGUgdGhlIGZv
bGxvd2luZworICogbWFjcm9zOgorICogLSB4ZW5fbWIoKSAgYSBtZW1vcnkgYmFycmllcgorICog
LSB4ZW5fcm1iKCkgYSByZWFkIG1lbW9yeSBiYXJyaWVyCisgKiAtIHhlbl93bWIoKSBhIHdyaXRl
IG1lbW9yeSBiYXJyaWVyCisgKiBFeGFtcGxlIG9mIHRob3NlIGNhbiBiZSBmb3VuZCBpbiB4ZW5j
dHJsLmguCisgKgogICogSW4gYWRkaXRpb24sIGlmIHlvdSBpbnRlbmQgdG8gdXNlIHRoZSBGTEVY
IG1hY3JvcywgeW91IGFsc28gbmVlZCB0bwogICogcHJvdmlkZSB0aGUgZm9sbG93aW5nLCBiZWZv
cmUgaW52b2tpbmcgdGhlIEZMRVggbWFjcm9zOgogICogLSBzaXplX3QKQEAgLTQyLDEyICs0OSw2
IEBACiAgKiBhbmQgZ3JhbnRfdGFibGUuaCBmcm9tIHRoZSBYZW4gcHVibGljIGhlYWRlcnMuCiAg
Ki8KIAotI2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPCAweDAwMDMwMjA4Ci0jZGVmaW5l
IHhlbl9tYigpICBtYigpCi0jZGVmaW5lIHhlbl9ybWIoKSBybWIoKQotI2RlZmluZSB4ZW5fd21i
KCkgd21iKCkKLSNlbmRpZgotCiB0eXBlZGVmIHVuc2lnbmVkIGludCBSSU5HX0lEWDsKIAogLyog
Um91bmQgYSAzMi1iaXQgdW5zaWduZWQgY29uc3RhbnQgZG93biB0byB0aGUgbmVhcmVzdCBwb3dl
ciBvZiB0d28uICovCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
