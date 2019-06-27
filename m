Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72B58573
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 17:22:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgWB7-00039C-U4; Thu, 27 Jun 2019 15:19:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgWB6-000397-Mb
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 15:19:12 +0000
X-Inumbo-ID: ea3960c2-98ee-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea3960c2-98ee-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 15:19:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 09:19:10 -0600
Message-Id: <5D14DE6A020000780023B97B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 09:19:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
In-Reply-To: <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2 01/10] AMD/IOMMU: restrict feature logging
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbW1vbiBjYXNlIGlzIGFsbCBJT01NVXMgaGF2aW5nIHRoZSBzYW1lIGZlYXR1cmVzLiBM
b2cgdGhlbSBvbmx5CmZvciB0aGUgZmlyc3QgSU9NTVUsIG9yIGZvciBhbnkgdGhhdCBoYXZlIGEg
ZGlmZmVyaW5nIGZlYXR1cmUgc2V0LgoKUmVxdWVzdGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Ci0tLQp2MjogTmV3LgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11X2RldGVjdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21t
dV9kZXRlY3QuYwpAQCAtNjIsNiArNjIsNyBAQCB2b2lkIF9faW5pdCBnZXRfaW9tbXVfZmVhdHVy
ZXMoc3RydWN0IGFtCiB7CiAgICAgdTMyIGxvdywgaGlnaDsKICAgICBpbnQgaSA9IDAgOworICAg
IGNvbnN0IHN0cnVjdCBhbWRfaW9tbXUgKmZpcnN0OwogICAgIHN0YXRpYyBjb25zdCBjaGFyICpf
X2luaXRkYXRhIGZlYXR1cmVfc3RyW10gPSB7CiAgICAgICAgICItIFByZWZldGNoIFBhZ2VzIENv
bW1hbmQiLCAKICAgICAgICAgIi0gUGVyaXBoZXJhbCBQYWdlIFNlcnZpY2UgUmVxdWVzdCIsIApA
QCAtODksNiArOTAsMTEgQEAgdm9pZCBfX2luaXQgZ2V0X2lvbW11X2ZlYXR1cmVzKHN0cnVjdCBh
bQogCiAgICAgaW9tbXUtPmZlYXR1cmVzID0gKCh1NjQpaGlnaCA8PCAzMikgfCBsb3c7CiAKKyAg
ICAvKiBEb24ndCBsb2cgdGhlIHNhbWUgc2V0IG9mIGZlYXR1cmVzIG92ZXIgYW5kIG92ZXIuICov
CisgICAgZmlyc3QgPSBsaXN0X2ZpcnN0X2VudHJ5KCZhbWRfaW9tbXVfaGVhZCwgc3RydWN0IGFt
ZF9pb21tdSwgbGlzdCk7CisgICAgaWYgKCBpb21tdSAhPSBmaXJzdCAmJiBpb21tdS0+ZmVhdHVy
ZXMgPT0gZmlyc3QtPmZlYXR1cmVzICkKKyAgICAgICAgcmV0dXJuOworCiAgICAgcHJpbnRrKCJB
TUQtVmk6IElPTU1VIEV4dGVuZGVkIEZlYXR1cmVzOlxuIik7CiAKICAgICB3aGlsZSAoIGZlYXR1
cmVfc3RyW2ldICkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
