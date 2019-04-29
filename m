Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F08E79A
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8xP-0004XB-Ok; Mon, 29 Apr 2019 16:16:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiJS=S7=citrix.com=prvs=0159f91d2=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hL8xN-0004Wm-UI
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:16:41 +0000
X-Inumbo-ID: 2c449d07-6a9a-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c449d07-6a9a-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 16:16:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,410,1549929600"; d="scan'208";a="84670047"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 29 Apr 2019 17:16:30 +0100
Message-ID: <1556554590-25358-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
References: <1556554590-25358-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for 4.11 2/2] xen: Fix backport of "x86/tsx:
 Implement controls for RTM force-abort mode"
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBvc3RlZCB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBjL3MgM2M1NTUyOTUg
Ing4Ni92cG11OiBJbXByb3ZlCmRvY3VtZW50YXRpb24gYW5kIHBhcnNpbmcgZm9yIHZwbXU9IiAo
WGVuIDQuMTIgYW5kIGxhdGVyKSB0byBwcmV2ZW50CmB2cG11PXJ0bS1hYm9ydGAgaW1wbGl5aW5n
IGB2cG11PTFgLCB3aGljaCBpcyBvdXRzaWRlIG9mIHNlY3VyaXR5IHN1cHBvcnQuCgpTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KCiB4ZW4vYXJjaC94ODYvY3B1L3ZwbXUu
YyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9jcHUvdnBtdS5jIGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKaW5kZXgg
NjM5YWUwYy4uOWE0MmUwOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKKysr
IGIveGVuL2FyY2gveDg2L2NwdS92cG11LmMKQEAgLTkxLDYgKzkxLDEwIEBAIHN0YXRpYyBpbnQg
X19pbml0IHBhcnNlX3ZwbXVfcGFyYW1zKGNvbnN0IGNoYXIgKnMpCiAKICAgICAgICAgICAgIHMg
PSBzcyArIDE7CiAgICAgICAgIH0gd2hpbGUgKCAqc3MgKTsKKworICAgICAgICBpZiAoICF2cG11
X2ZlYXR1cmVzICkgLyogcnRtLWFib3J0IGRvZXNuJ3QgaW1wbHkgdnBtdT0xICovCisgICAgICAg
ICAgICBicmVhazsKKwogICAgICAgICAvKiBmYWxsIHRocm91Z2ggKi8KICAgICBjYXNlIDE6CiAg
ICAgICAgIC8qIERlZmF1bHQgVlBNVSBtb2RlICovCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
