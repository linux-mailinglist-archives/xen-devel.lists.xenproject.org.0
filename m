Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2A318204E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 19:03:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC5dx-0006NB-8i; Wed, 11 Mar 2020 17:59:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kY5a=44=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jC5dw-0006N5-87
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 17:59:44 +0000
X-Inumbo-ID: 13987a5e-63c2-11ea-bec1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13987a5e-63c2-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 17:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583949579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K1D50I11UAhWK3G1yzmu7dJk//QmxCBmix8CvBhLtfE=;
 b=cuTHg5ITW5JPgg+uvj/Oin+ZUW/eELmi546ABkhUkb/us2EvHW9GmVXp
 N0OEN+4W8Z+eXjHIx55nvUwbTnP+hAqLWvKvkAm+DXpECthKZcnH7KiNc
 i8rfqwuOrGmxx3A4h49Im73uC9TKzEnrqupQwB+tLdFJ6Vc1MW5sCGW+i k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nawCy/aY+goI+Jg2HNDSO91xgolUNJBjtov5exldWZLdwIfZt7TlI6OqfenAVt4AD+m0FxZBmF
 eIcPO3QmPns6dnv+FiILmVBzcg4BJl2ktQa+xrHFj86e7UV2YX0eJwRO/seB+7F7KkWGmSrqu6
 Lo5QvD0yGBuhoKWi5bfIn9bqReRuKfTfktpaU+N8r2XUicXJM3fmLK4VpjTkgyP8iyb0yQXGuH
 57Bv4ekWe9rDpBRXDc2Cs8c28oDvsR72WvoyFClsvnC7kRbo5Zwizjc+uMcZ/AY4RiUf1WxT45
 UIo=
X-SBRS: 2.7
X-MesageID: 14131589
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14131589"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 11 Mar 2020 17:59:33 +0000
Message-ID: <20200311175933.1362235-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311175933.1362235-1-anthony.perard@citrix.com>
References: <20200311175933.1362235-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 2/2] tools: Use INSTALL_PYTHON_PROG
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbmV2ZXIgcHl0aG9uIHNjcmlwdHMgYXJlIGluc3RhbGwsIGhhdmUgdGhlIHNoZWJhbmcgYmUg
bW9kaWZpZWQgdG8gdXNlCndoYXRldmVyIFBZVEhPTl9QQVRIIGlzLiBUaGlzIGlzIHVzZWZ1bCBm
b3Igc3lzdGVtIHdoZXJlIHB5dGhvbiBpc24ndCBhdmFpbGFibGUsIG9yCndoZXJlIHRoZSBwYWNr
YWdlIGJ1aWxkIHRvb2xzIHByZXZlbnQgdW52ZXJzaW9uZWQgc2hlYmFuZy4KCklOU1RBTExfUFlU
SE9OX1BST0cgb25seSBsb29rcyBmb3IgIiMhL3Vzci9iaW4vZW52IHB5dGhvbiIuCgpTaWduZWQt
b2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0
b29scy9taXNjL3hlbmNvdl9zcGxpdCB8IDIgKy0KIHRvb2xzL3B5dGhvbi9NYWtlZmlsZSAgIHwg
NCArKy0tCiB0b29scy94ZW5tb24vTWFrZWZpbGUgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL21pc2Mv
eGVuY292X3NwbGl0IGIvdG9vbHMvbWlzYy94ZW5jb3Zfc3BsaXQKaW5kZXggMWYyMDUxOGI4NjM3
Li41NzcxZjZjZmMyODUgMTAwNzU1Ci0tLSBhL3Rvb2xzL21pc2MveGVuY292X3NwbGl0CisrKyBi
L3Rvb2xzL21pc2MveGVuY292X3NwbGl0CkBAIC0xLDQgKzEsNCBAQAotIyEvdXNyL2Jpbi9weXRo
b24KKyMhL3Vzci9iaW4vZW52IHB5dGhvbgogCiBpbXBvcnQgc3lzLCBvcywgb3MucGF0aCBhcyBw
YXRoLCBzdHJ1Y3QsIGVycm5vCiBmcm9tIG9wdHBhcnNlIGltcG9ydCBPcHRpb25QYXJzZXIKZGlm
ZiAtLWdpdCBhL3Rvb2xzL3B5dGhvbi9NYWtlZmlsZSBiL3Rvb2xzL3B5dGhvbi9NYWtlZmlsZQpp
bmRleCBlOTlmNzhhNTM3M2EuLjhkMjJjMDM2NzY1NyAxMDA2NDQKLS0tIGEvdG9vbHMvcHl0aG9u
L01ha2VmaWxlCisrKyBiL3Rvb2xzL3B5dGhvbi9NYWtlZmlsZQpAQCAtMjAsOCArMjAsOCBAQCBp
bnN0YWxsOgogCQlzZXR1cC5weSBpbnN0YWxsIC0tcmVjb3JkICQoSU5TVEFMTF9MT0cpICQoUFlU
SE9OX1BSRUZJWF9BUkcpIFwKIAkJLS1yb290PSIkKERFU1RESVIpIiAtLWZvcmNlCiAKLQkkKElO
U1RBTExfUFJPRykgc2NyaXB0cy9jb252ZXJ0LWxlZ2FjeS1zdHJlYW0gJChERVNURElSKSQoTElC
RVhFQ19CSU4pCi0JJChJTlNUQUxMX1BST0cpIHNjcmlwdHMvdmVyaWZ5LXN0cmVhbS12MiAkKERF
U1RESVIpJChMSUJFWEVDX0JJTikKKwkkKElOU1RBTExfUFlUSE9OX1BST0cpIHNjcmlwdHMvY29u
dmVydC1sZWdhY3ktc3RyZWFtICQoREVTVERJUikkKExJQkVYRUNfQklOKQorCSQoSU5TVEFMTF9Q
WVRIT05fUFJPRykgc2NyaXB0cy92ZXJpZnktc3RyZWFtLXYyICQoREVTVERJUikkKExJQkVYRUNf
QklOKQogCiAuUEhPTlk6IHVuaW5zdGFsbAogdW5pbnN0YWxsOgpkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVubW9uL01ha2VmaWxlIGIvdG9vbHMveGVubW9uL01ha2VmaWxlCmluZGV4IGUxNzEyMzA0ZDA3
ZC4uM2UxNTBiMDY1OTk4IDEwMDY0NAotLS0gYS90b29scy94ZW5tb24vTWFrZWZpbGUKKysrIGIv
dG9vbHMveGVubW9uL01ha2VmaWxlCkBAIC0zMiw3ICszMiw3IEBAIGluc3RhbGw6IGJ1aWxkCiAJ
JChJTlNUQUxMX0RJUikgJChERVNURElSKSQoc2JpbmRpcikKIAkkKElOU1RBTExfUFJPRykgeGVu
YmFrZWQgJChERVNURElSKSQoc2JpbmRpcikveGVuYmFrZWQKIAkkKElOU1RBTExfUFJPRykgeGVu
dHJhY2Vfc2V0bWFzayAgJChERVNURElSKSQoc2JpbmRpcikveGVudHJhY2Vfc2V0bWFzawotCSQo
SU5TVEFMTF9QUk9HKSB4ZW5tb24ucHkgICQoREVTVERJUikkKHNiaW5kaXIpL3hlbm1vbgorCSQo
SU5TVEFMTF9QWVRIT05fUFJPRykgeGVubW9uLnB5ICAkKERFU1RESVIpJChzYmluZGlyKS94ZW5t
b24KIAogLlBIT05ZOiB1bmluc3RhbGwKIHVuaW5zdGFsbDoKLS0gCkFudGhvbnkgUEVSQVJECgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
