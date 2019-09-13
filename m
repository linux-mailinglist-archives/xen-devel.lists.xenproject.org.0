Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54FB22AE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 16:54:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8mug-0005RI-IX; Fri, 13 Sep 2019 14:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g+tJ=XI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i8muf-0005RD-HB
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 14:51:05 +0000
X-Inumbo-ID: e8c3f0ca-d635-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8c3f0ca-d635-11e9-b299-bc764e2007e4;
 Fri, 13 Sep 2019 14:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568386265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jwaPByNl+3cmYIWFTfO5OthOI0xIyl+/jErDyBAXvoQ=;
 b=bHzB/IvXqQkK9nTMUac6s1arStpsZlhIQl+8V+SuYyWG8TCzq7tUDSHC
 t9Y6vbHyjxbxq/7/QuUHIZght2uQvw1Z+bNvJcSXI+vLN46h8awKKdC59
 8OAFKeToyKgFI5lNI9npFYwN+PQ44npVFnxCJppdvzKzukxf2rI7LI2G2 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ThNnQbIDSW5YPKtu6HzYI4MuZrJD1QW4eEiPHXCmmGNZGFSKO3iba5itEjXIc2L7NJQ72Ljx3y
 LlcJNFSkFQIwMDWn1yDSB+nehHra5FC5IQrEG4lvzaUfVCaTTMz8jkP3BpE2fJCtAkx/KJtoQP
 wJg0DmF/pGvA47jB9pW+SgruDW2MBm/IojAgxiv8CUHo41J3Ltq7IGmsZx2XSHsdUrSAZiAkow
 NK7b07mFy3TfIK3cANrn0uG+HU8LVDw3YsBl9Hxr16WOESexh1E2RKL5OjR/VsofG/PAWJ8MzB
 fPc=
X-SBRS: 2.7
X-MesageID: 5595137
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,501,1559534400"; 
   d="scan'208";a="5595137"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Fri, 13 Sep 2019 15:50:49 +0100
Message-ID: <20190913145100.303433-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 00/11] OvmfPkg/XenBusDxe: Fix ExitBootServices
 handler to avoid allocation
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTIxOTAK
ClBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgpodHRwczovL3hlbmJp
dHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9vdm1mLmdpdCBici54ZW5idXNkeGUt
Zml4LWV4aXRib290c2VydmljZXMtdjEKCkhpLAoKVGhpcyBwYXRjaCBzZXJpZXMgd29ya3MgdG93
YXJkIHJlbW92aW5nIHVzYWdlIG9mIE1lbW9yeSBBbGxvY2F0aW9uIFNlcnZpY2VzIGluClhlbkJ1
c0R4ZSB3aGVuIEV4aXRCb290U2VydmljZXMoKSBpcyBjYWxsZWQgYnkgdGhlIG5leHQgb3BlcmF0
aW5nIHN5c3RlbS4KClNpbmNlIHRoYXQgaW4gb3JkZXIgdG8gcmVzZXQgYSBiYWNrZW5kLCBjb21t
dW5pY2F0aW9uIG5lZWRzIHRvIGhhcHBlbmVkIHZpYQp4ZW5zdG9yZSwgdGhpcyBzZXJpZXMgZm9j
dXMgbW9zdGx5IG9uIGdldHRpbmcgcmlkIG9mIGFsbG9jYXRpb24gaW4gdGhlIHhlbnN0b3JlCmRy
aXZlci4gVGhlcmUgYXJlIHN0aWxsIHNvbWUgbGVmdCBidXQgdGhhdCdzIGluIGZ1bmN0aW9uIHRo
YXQgYXJlbid0IG5lZWRlZCBhZnRlcgpFQlMgaXMgY2FsbGVkLgoKSW4gc29tZSBwbGFjZXMgKGxp
a2UgWGVuU3RvcmVWU1ByaW50KSwgaW5zdGVhZCBvZiBhbGxvY2F0aW5nIGEgYnVmZmVyLCB0aGUK
YnVmZmVyICg0aykgaXMgb24gdGhlIHN0YWNrLgoKVGhhbmtzLAoKQW50aG9ueSBQRVJBUkQgKDEx
KToKICBPdm1mUGtnL1hlbkJ1c0R4ZTogRml4IG1pc3NpbmcgXG4gaW4gREVCVUcgbWVzc2FnZXMK
ICBPdm1mUGtnL1hlbkJ1c0R4ZTogSGF2ZSBYZW5TdG9yZUZpbmRXYXRjaCB0YWtlIGEgcG9pbnRl
cgogIE92bWZQa2cvWGVuQnVzRHhlOiBSZXdvcmsgd2F0Y2ggZXZlbnRzIHJlY2VwdGlvbgogIE92
bWZQa2cvWGVuQnVzRHhlOiBBdm9pZCBBbGxvY2F0ZSBpbiBYZW5TdG9yZVZTUHJpbnQKICBPdm1m
UGtnL1hlbkJ1c0R4ZTogQ29uc3RydWN0IHBhdGhzIHdpdGhvdXQgYWxsb2NhdGlvbgogIE92bWZQ
a2cvWGVuQnVzRHhlOiBSZXdvcmsgWGVuU3RvcmVQcm9jZXNzTWVzc2FnZSB0byBhdm9pZCBhbGxv
Y2F0aW5nCiAgICBtZW1vcnkKICBPdm1mUGtnL1hlbkJ1c0R4ZTogVXNlIG9uIHN0YWNrIGJ1ZmZl
ciBpbiBpbnRlcm5hbCBmdW5jdGlvbnMKICBPdm1mUGtnL1hlbkJ1czogQ2hhbmdlIFhFTkJVU19Q
Uk9UT0NPTCB0byBub3QgcmV0dXJuIGFsbG9jYXRlZCBtZW1vcnkKICBPdm1mUGtnL1hlbkJ1c0R4
ZTogRml4IE5vdGlmeUV4aXRCb290IHRvIGF2b2lkIE1lbW9yeSBBbGxvY2F0aW9uCiAgICBTZXJ2
aWNlcwogIE92bWZQa2cvWGVuUHZCbGtEeGU6IFVzZSBYZW5CdXNJby0+UmVnaXN0ZXJFeGl0Q2Fs
bGJhY2sKICBPdm1mUGtnL1hlbkJ1c0R4ZTogRml4IFhlblN0b3JlV2FpdEZvckV2ZW50IHVzZSBk
dXJpbmcgRUJTCgogT3ZtZlBrZy9JbmNsdWRlL1Byb3RvY29sL1hlbkJ1cy5oIHwgIDY3ICsrKy0K
IE92bWZQa2cvWGVuQnVzRHhlL0V2ZW50Q2hhbm5lbC5jICB8ICAgMyArLQogT3ZtZlBrZy9YZW5C
dXNEeGUvWGVuQnVzLmMgICAgICAgIHwgIDU4ICsrLQogT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVz
RHhlLmMgICAgIHwgIDI5ICstCiBPdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCAgICAgfCAg
IDMgKwogT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyAgICAgIHwgNTc3ICsrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLQogT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuaCAgICAgIHwg
IDQ0ICsrLQogT3ZtZlBrZy9YZW5QdkJsa0R4ZS9CbG9ja0Zyb250LmMgIHwgIDgyICsrKy0tCiBP
dm1mUGtnL1hlblB2QmxrRHhlL0Jsb2NrRnJvbnQuaCAgfCAgMTIgKy0KIE92bWZQa2cvWGVuUHZC
bGtEeGUvWGVuUHZCbGtEeGUuYyB8ICAgNCArLQogMTAgZmlsZXMgY2hhbmdlZCwgNDgzIGluc2Vy
dGlvbnMoKyksIDM5NiBkZWxldGlvbnMoLSkKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
