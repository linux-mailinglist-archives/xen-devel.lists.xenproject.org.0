Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7D6158011
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 17:47:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1CBm-0002SD-Tr; Mon, 10 Feb 2020 16:45:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eXyp=36=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1CBl-0002S8-2M
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 16:45:37 +0000
X-Inumbo-ID: c2ee34ae-4c24-11ea-ab50-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2ee34ae-4c24-11ea-ab50-bc764e2007e4;
 Mon, 10 Feb 2020 16:45:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A18EAB077;
 Mon, 10 Feb 2020 16:45:35 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 10 Feb 2020 17:45:33 +0100
Message-Id: <20200210164533.29549-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/sched: remove pointless ASSERT() in credit2
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEFTU0VSVCgpIGF0IHRoZSB0b3Agb2YgY3NjaGVkMl9jb250ZXh0X3NhdmVkKCkgaXMgY29t
cGxldGVseQpwb2ludGxlc3MsIGFzIHRoZSBCVUdfT04oKSBqdXN0IGluIGZyb250IG9mIGl0IGNh
dGNoZXMgdGhlIHNhbWUgcHJvYmxlbQphbHJlYWR5LgoKV2hpbGUgYXQgaXQgcmVtb3ZlIGEgYm9n
dXMgc3BhY2UgaW4gdGhlIEJVR19PTigpLgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWQvY3JlZGl0Mi5jIHwgNiArKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMgYi94ZW4vY29tbW9uL3NjaGVkL2Ny
ZWRpdDIuYwppbmRleCBiOTY1Y2QxYzdiLi43ODQ2N2I3NzJjIDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL3NjaGVkL2NyZWRpdDIuYworKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYwpAQCAt
MjE2NywxMCArMjE2Nyw4IEBAIGNzY2hlZDJfY29udGV4dF9zYXZlZChjb25zdCBzdHJ1Y3Qgc2No
ZWR1bGVyICpvcHMsIHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQogICAgIHNfdGltZV90IG5vdyA9
IE5PVygpOwogICAgIExJU1RfSEVBRCh3ZXJlX3BhcmtlZCk7CiAKLSAgICBCVUdfT04oICFpc19p
ZGxlX3VuaXQodW5pdCkgJiYKLSAgICAgICAgICAgIHN2Yy0+cnFkICE9IGMycnFkKG9wcywgc2No
ZWRfdW5pdF9tYXN0ZXIodW5pdCkpKTsKLSAgICBBU1NFUlQoaXNfaWRsZV91bml0KHVuaXQpIHx8
Ci0gICAgICAgICAgIHN2Yy0+cnFkID09IGMycnFkKG9wcywgc2NoZWRfdW5pdF9tYXN0ZXIodW5p
dCkpKTsKKyAgICBCVUdfT04oIWlzX2lkbGVfdW5pdCh1bml0KSAmJgorICAgICAgICAgICBzdmMt
PnJxZCAhPSBjMnJxZChvcHMsIHNjaGVkX3VuaXRfbWFzdGVyKHVuaXQpKSk7CiAKICAgICAvKiBU
aGlzIHVuaXQgaXMgbm93IGVsaWdpYmxlIHRvIGJlIHB1dCBvbiB0aGUgcnVucXVldWUgYWdhaW4g
Ki8KICAgICBfX2NsZWFyX2JpdChfX0NTRkxBR19zY2hlZHVsZWQsICZzdmMtPmZsYWdzKTsKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
