Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DE4E68A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 12:57:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heHBw-0006Pc-Bw; Fri, 21 Jun 2019 10:54:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Su6Z=UU=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1heHBu-0006PT-Nz
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 10:54:46 +0000
X-Inumbo-ID: fa673131-9412-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fa673131-9412-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 10:54:44 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WhdzG/TUsfpYvx+RGdfe58xsG7P3wSW2FAIpod07Gf6Oqsy82JXLu/ehZr4Pg5SDvgzdYxFZ84
 wo0PqkjNAVlOye8Ko874MUjI1968VKfQwjhh2Bu1tRn6sOKseK0ZzCZbt4s2PRGvSNWtraCbbl
 ALlo6DIiyktaoqp4KQDzCOeZPy+CAZ/KUZwga8VnUe/S3zskmL0/WrZ1K3yHvUMaldIsrU1cs6
 p81FJgqub7cIWB/wmmbYbkn0fttuqNCpAtcaRg9KjG++y7TvFMDBGd236uq9se2NCg3OWKMaeu
 jRU=
X-SBRS: 2.7
X-MesageID: 2052041
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2052041"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 21 Jun 2019 11:54:39 +0100
Message-ID: <20190621105441.3025-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 0/2] Fix build of Xen support + cleanup
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpDaGFuZ2VzIGluIHYzOgotIHR3byBwYXRjaGVzIHF1ZXVlZCBmb3IgYSBwdWxsIHJlcXVl
c3RzWzFdOgogICAgeGVuOiBEcm9wIGluY2x1ZGVzIG9mIHhlbi9odm0vcGFyYW1zLmgKICAgIHhl
bjogQXZvaWQgVkxBCi0gdGhlIHR3byBvdGhlcnMgcGF0Y2hzIGhhcyBjaGFuZ2VkLCB0byBrZWVw
IHRoZSBoZWFkZXJzIGlkZW50aWNhbCAobmVhcmx5OwogIGF0IGxlYXN0IHRoZSBoZWFkZXIgZ3Vh
cmQgaXNuJ3QgY2hhbmdlZCBhbnltb3JlKQoKRml4IHRoZSBidWlsZCBpbiBvc3N0ZXN0IGFuZCBz
b21lIGNsZWFudXAKCkZvciByZWZlcmVuY2U6CgpSZWNlbnQgZmxpZ2h0IGZhaWx1cmU6Cmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNi9t
c2cwMTAyMi5odG1sCgpCaXNlY3QgcmVzdWx0OgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDYvbXNnMDEwMjkuaHRtbAoKWzFdIFF1ZXVl
IGhlcmU6CiAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcWVtdS11cHN0cmVhbS11
bnN0YWJsZS5naXQKICBicmFuY2g6IHhlbi5uZXh0CgpUaGFua3MuCgpBbnRob255IFBFUkFSRCAo
Mik6CiAgUmV2ZXJ0IHhlbi9pby9yaW5nLmggb2YgIkNsZWFuIHVwIGEgZmV3IGhlYWRlciBndWFy
ZCBzeW1ib2xzIgogIHhlbjogSW1wb3J0IG90aGVyIHhlbi9pby8qLmgKCiBody85cGZzL3hlbi05
cGZzLmggICAgICAgICAgICAgICAgICAgICAgIHwgICAgNCArLQogaHcvYmxvY2sveGVuX2Jsa2lm
LmggICAgICAgICAgICAgICAgICAgICB8ICAgIDUgKy0KIGh3L2NoYXIveGVuX2NvbnNvbGUuYyAg
ICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBody9kaXNwbGF5L3hlbmZiLmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgNyArLQogaHcvbmV0L3hlbl9uaWMuYyAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDIgKy0KIGh3L3VzYi94ZW4tdXNiLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICAzICstCiBody94ZW4veGVuLWxlZ2FjeS1iYWNrZW5kLmMgICAgICAgICAgICAgIHwg
ICAgMiAtCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvZ3JhbnRfdGFibGUuaCAgIHwgICAzNiAr
CiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vYmxraWYuaCAgICAgIHwgIDcxMiArKysrKysr
KysrKysrKysKIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9jb25zb2xlLmggICAgfCAgIDQ2
ICsKIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9mYmlmLmggICAgICAgfCAgMTU2ICsrKysK
IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9rYmRpZi5oICAgICAgfCAgNTY2ICsrKysrKysr
KysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL25ldGlmLmggICAgICB8IDEwMTAgKysr
KysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3Byb3RvY29s
cy5oICB8ICAgNDIgKwogaW5jbHVkZS9ody94ZW4veyA9PiBpbnRlcmZhY2V9L2lvL3JpbmcuaCB8
ICAgIDYgKy0KIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby91c2JpZi5oICAgICAgfCAgMjU0
ICsrKysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3hlbmJ1cy5oICAgICB8ICAgNzAg
KysKIGluY2x1ZGUvaHcveGVuL3hlbl9jb21tb24uaCAgICAgICAgICAgICAgfCAgICAyICstCiAx
OCBmaWxlcyBjaGFuZ2VkLCAyOTA2IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9ncmFudF90YWJsZS5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2Jsa2lmLmgKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vY29uc29sZS5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2ZiaWYuaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9rYmRpZi5oCiBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL25ldGlmLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vcHJvdG9jb2xzLmgKIHJl
bmFtZSBpbmNsdWRlL2h3L3hlbi97ID0+IGludGVyZmFjZX0vaW8vcmluZy5oICg5OSUpCiBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3VzYmlmLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8veGVuYnVzLmgKCi0tIApB
bnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
