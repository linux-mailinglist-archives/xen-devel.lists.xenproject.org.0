Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94DD124097
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 08:52:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihU56-0003fO-0P; Wed, 18 Dec 2019 07:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihU54-0003eu-8o
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 07:49:14 +0000
X-Inumbo-ID: dc75a39c-216a-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc75a39c-216a-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 07:49:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 134FCAB9D;
 Wed, 18 Dec 2019 07:49:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 08:48:50 +0100
Message-Id: <20191218074859.21665-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/9] xen: scheduler cleanups
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TW92ZSBhbGwgc2NoZWR1bGVyIHJlbGF0ZWQgaHlwZXJ2aXNvciBjb2RlIHRvIHhlbi9jb21tb24v
c2NoZWQvIGFuZApkbyBhIGxvdCBvZiBjbGVhbnVwcy4KCkp1ZXJnZW4gR3Jvc3MgKDkpOgogIHhl
bi9zY2hlZDogbW92ZSBzY2hlZHVsZXJzIGFuZCBjcHVwb29sIGNvZGluZyB0byBkZWRpY2F0ZWQg
ZGlyZWN0b3J5CiAgeGVuL3NjaGVkOiBtYWtlIHNjaGVkLWlmLmggcmVhbGx5IHNjaGVkdWxlciBw
cml2YXRlCiAgeGVuL3NjaGVkOiBjbGVhbnVwIHNjaGVkLmgKICB4ZW4vc2NoZWQ6IHJlbW92ZSBz
cGVjaWFsIGNhc2VzIGZvciBmcmVlIGNwdXMgaW4gc2NoZWR1bGVycwogIHhlbi9zY2hlZDogdXNl
IHNjcmF0Y2ggY3B1bWFzayBpbnN0ZWFkIG9mIGFsbG9jYXRpbmcgaXQgb24gdGhlIHN0YWNrCiAg
eGVuL3NjaGVkOiByZXBsYWNlIG51bGwgc2NoZWR1bGVyIHBlcmNwdS12YXJpYWJsZSB3aXRoIHBk
YXRhIGhvb2sKICB4ZW4vc2NoZWQ6IHN3aXRjaCBzY2hlZHVsaW5nIHRvIGJvb2wgd2hlcmUgYXBw
cm9wcmlhdGUKICB4ZW4vc2NoZWQ6IGVsaW1pbmF0ZSBzY2hlZF90aWNrX3N1c3BlbmQoKSBhbmQg
c2NoZWRfdGlja19yZXN1bWUoKQogIHhlbi9zY2hlZDogYWRkIGNvbnN0IHF1YWxpZmllciB3aGVy
ZSBhcHByb3ByaWF0ZQoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA4ICstCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L2FjcGkvY3B1X2lkbGUuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTUgKy0KIHhlbi9hcmNoL3g4Ni9jcHUvbXdhaXQtaWRsZS5j
ICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICstCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQogeGVuL2NvbW1vbi9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNjYgKy0tLS0tCiB4ZW4vY29tbW9uL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQogeGVuL2NvbW1v
bi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNzAgLS0tLS0tCiB4
ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzNSAr
LS0tLS0tLS0tLQogeGVuL2NvbW1vbi9yY3VwZGF0ZS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDcgKy0KIHhlbi9jb21tb24vc2NoZWQvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDY1ICsrKysrKwogeGVuL2NvbW1vbi9zY2hlZC9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgKwogLi4uL3tjb21wYXQvc2NoZWR1bGUuYyA9PiBzY2hl
ZC9jb21wYXRfc2NoZWR1bGUuY30gfCAgIDIgKy0KIHhlbi9jb21tb24veyA9PiBzY2hlZH0vY3B1
cG9vbC5jICAgICAgICAgICAgICAgICAgIHwgIDIzICstCiB4ZW4ve2luY2x1ZGUveGVuID0+IGNv
bW1vbi9zY2hlZH0vc2NoZWQtaWYuaCAgICAgICB8ICAxOCArLQogeGVuL2NvbW1vbi97ID0+IHNj
aGVkfS9zY2hlZF9hcmluYzY1My5jICAgICAgICAgICAgfCAgMTUgKy0KIHhlbi9jb21tb24veyA9
PiBzY2hlZH0vc2NoZWRfY3JlZGl0LmMgICAgICAgICAgICAgIHwgIDY1ICsrKy0tLQogeGVuL2Nv
bW1vbi97ID0+IHNjaGVkfS9zY2hlZF9jcmVkaXQyLmMgICAgICAgICAgICAgfCAgODUgKysrLS0t
LQogeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZF9udWxsLmMgICAgICAgICAgICAgICAgfCAx
MDUgKysrKysrLS0tCiB4ZW4vY29tbW9uL3sgPT4gc2NoZWR9L3NjaGVkX3J0LmMgICAgICAgICAg
ICAgICAgICB8IDEwNSArKysrKy0tLS0KIHhlbi9jb21tb24veyA9PiBzY2hlZH0vc2NoZWR1bGUu
YyAgICAgICAgICAgICAgICAgIHwgMjQ2ICsrKysrKysrKysrKysrKysrKy0tLQogeGVuL2luY2x1
ZGUveGVuL2RvbWFpbi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogeGVuL2lu
Y2x1ZGUveGVuL3JjdXBkYXRlLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgLQogeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzkgKyst
LQogMjQgZmlsZXMgY2hhbmdlZCwgNTY2IGluc2VydGlvbnMoKyksIDU0MyBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL0tjb25maWcKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL01ha2VmaWxlCiByZW5hbWUgeGVuL2NvbW1vbi97Y29t
cGF0L3NjaGVkdWxlLmMgPT4gc2NoZWQvY29tcGF0X3NjaGVkdWxlLmN9ICg5NyUpCiByZW5hbWUg
eGVuL2NvbW1vbi97ID0+IHNjaGVkfS9jcHVwb29sLmMgKDk3JSkKIHJlbmFtZSB4ZW4ve2luY2x1
ZGUveGVuID0+IGNvbW1vbi9zY2hlZH0vc2NoZWQtaWYuaCAoOTYlKQogcmVuYW1lIHhlbi9jb21t
b24veyA9PiBzY2hlZH0vc2NoZWRfYXJpbmM2NTMuYyAoOTklKQogcmVuYW1lIHhlbi9jb21tb24v
eyA9PiBzY2hlZH0vc2NoZWRfY3JlZGl0LmMgKDk3JSkKIHJlbmFtZSB4ZW4vY29tbW9uL3sgPT4g
c2NoZWR9L3NjaGVkX2NyZWRpdDIuYyAoOTglKQogcmVuYW1lIHhlbi9jb21tb24veyA9PiBzY2hl
ZH0vc2NoZWRfbnVsbC5jICg5MiUpCiByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hl
ZF9ydC5jICg5NCUpCiByZW5hbWUgeGVuL2NvbW1vbi97ID0+IHNjaGVkfS9zY2hlZHVsZS5jICg5
MiUpCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
