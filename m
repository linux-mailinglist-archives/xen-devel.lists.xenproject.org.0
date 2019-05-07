Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270F16679
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:17:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1oJ-0007JP-Fd; Tue, 07 May 2019 15:15:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1oI-0007JC-66
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:14 +0000
X-Inumbo-ID: e97ee661-70da-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e97ee661-70da-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 15:15:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2723A15AD;
 Tue,  7 May 2019 08:15:13 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7EE63F5AF;
 Tue,  7 May 2019 08:15:11 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  7 May 2019 16:14:46 +0100
Message-Id: <20190507151458.29350-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507151458.29350-1-julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 02/14] xen/x86: Constify the parameter "d" in
 mfn_to_gfn
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
 Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHBhcmFtZXRlciAiZCIgaG9sZHMgdGhlIGRvbWFpbiBhbmQgaXMgbm90IG1vZGlmaWVkIGJ5
IHRoZSBmdW5jdGlvbi4KU28gY29uc3RpZnkgaXQuCgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gRml4IGZ1bmN0
aW9uIG5hbWUgaW4gdGhlIHRpdGxlCiAgICAgICAgLSBBZGQgSmFuJ3MgcmV2aWV3ZWQtYnkKLS0t
CiB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKaW5kZXggMjgwMWE4Y2NjYS4uYzNi
ZDEyMDIwZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAorKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L3AybS5oCkBAIC01MDYsNyArNTA2LDcgQEAgc3RhdGljIGlubGluZSBz
dHJ1Y3QgcGFnZV9pbmZvICpnZXRfcGFnZV9mcm9tX2dmbigKIH0KIAogLyogR2VuZXJhbCBjb252
ZXJzaW9uIGZ1bmN0aW9uIGZyb20gbWZuIHRvIGdmbiAqLwotc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIG1mbl90b19nZm4oc3RydWN0IGRvbWFpbiAqZCwgbWZuX3QgbWZuKQorc3RhdGljIGlu
bGluZSB1bnNpZ25lZCBsb25nIG1mbl90b19nZm4oY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgbWZu
X3QgbWZuKQogewogICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICkKICAgICAgICAg
cmV0dXJuIGdldF9ncGZuX2Zyb21fbWZuKG1mbl94KG1mbikpOwotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
