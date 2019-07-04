Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27265FB10
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:39:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3mo-0003tU-Kn; Thu, 04 Jul 2019 15:36:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3mn-0003tP-6j
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 15:36:37 +0000
X-Inumbo-ID: 8197ac4e-9e71-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8197ac4e-9e71-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 15:36:35 +0000 (UTC)
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
IronPort-SDR: OoomVJH8dJBtCkqlNr34nlMSb0ETOMf1DB4fpTecWIoYdSZVEPED7EZAQtZCZNFjvZHnJipxTw
 au8z1DI4idSuypN+pDtdEIXI8Yn7Y+DuWnD8nh1ArLpVdDwxRMaEZ0L7KxLnQ1Zie3gKcEKqRt
 O4YqfTizwVI2+Ej0mk8aCHm9GLtqOmP1aTtfQKTjQ8MPpmbBb9zgoMkdLITUEwcK21U3/94yXg
 RILCkoeMcvFc1jQFTnIhHoT8miA4MUMYr1QLLFXhbDVg3wUX1i8Td/g/PXuhRHRuEGSxIMUWjT
 Oec=
X-SBRS: 2.7
X-MesageID: 2627246
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2627246"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 4 Jul 2019 16:36:05 +0100
Message-ID: <20190704153605.4140-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen: Fix ring.h header
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Markus Armbruster <armbru@redhat.com>, Paul
 Durrant <paul.durrant@citrix.com>
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
aXguY29tPgotLS0KCk5vdGVzOgogICAgQSBzaW1pbGFyIHBhdGNoIGhhdmUgYmVlbiBzZW50IHRv
IHRoZSBjYW5vbmljYWwgdmVyc2lvbjoKICAgIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMDM3MC5odG1sCgogaW5jbHVkZS9o
dy94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaCB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vcmlu
Zy5oIGIvaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaAppbmRleCAxYWRhY2YwOWY5
Li43MDQ5OTBhMmM5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vcmlu
Zy5oCisrKyBiL2luY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9yaW5nLmgKQEAgLTQyLDEyICs0
Miw2IEBACiAgKiBhbmQgZ3JhbnRfdGFibGUuaCBmcm9tIHRoZSBYZW4gcHVibGljIGhlYWRlcnMu
CiAgKi8KIAotI2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPCAweDAwMDMwMjA4Ci0jZGVm
aW5lIHhlbl9tYigpICBtYigpCi0jZGVmaW5lIHhlbl9ybWIoKSBybWIoKQotI2RlZmluZSB4ZW5f
d21iKCkgd21iKCkKLSNlbmRpZgotCiB0eXBlZGVmIHVuc2lnbmVkIGludCBSSU5HX0lEWDsKIAog
LyogUm91bmQgYSAzMi1iaXQgdW5zaWduZWQgY29uc3RhbnQgZG93biB0byB0aGUgbmVhcmVzdCBw
b3dlciBvZiB0d28uICovCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
