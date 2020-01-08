Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4478D134624
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:26:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDBG-0004O2-Tt; Wed, 08 Jan 2020 15:23:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipDBF-0004Nn-4H
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:23:33 +0000
X-Inumbo-ID: d441646a-322a-11ea-b82c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d441646a-322a-11ea-b82c-12813bfff9fa;
 Wed, 08 Jan 2020 15:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66C1DB1E2;
 Wed,  8 Jan 2020 15:23:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 16:23:19 +0100
Message-Id: <20200108152328.27194-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/9] xen: scheduler cleanups
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
ICAgICAgICAgICAgICAgICAgfCAgIDcgKwogeGVuL2NvbW1vbi97c2NoZWRfYXJpbmM2NTMuYyA9
PiBzY2hlZC9hcmluYzY1My5jfSAgfCAgMTUgKy0KIHhlbi9jb21tb24ve2NvbXBhdC9zY2hlZHVs
ZS5jID0+IHNjaGVkL2NvbXBhdC5jfSAgIHwgICAyICstCiB4ZW4vY29tbW9uL3tzY2hlZHVsZS5j
ID0+IHNjaGVkL2NvcmUuY30gICAgICAgICAgICB8IDI0NiArKysrKysrKysrKysrKysrKystLS0K
IHhlbi9jb21tb24veyA9PiBzY2hlZH0vY3B1cG9vbC5jICAgICAgICAgICAgICAgICAgIHwgIDIz
ICstCiB4ZW4vY29tbW9uL3tzY2hlZF9jcmVkaXQuYyA9PiBzY2hlZC9jcmVkaXQuY30gICAgICB8
ICA2NSArKystLS0KIHhlbi9jb21tb24ve3NjaGVkX2NyZWRpdDIuYyA9PiBzY2hlZC9jcmVkaXQy
LmN9ICAgIHwgIDg1ICsrKy0tLS0KIHhlbi9jb21tb24ve3NjaGVkX251bGwuYyA9PiBzY2hlZC9u
dWxsLmN9ICAgICAgICAgIHwgMTA1ICsrKysrKy0tLQogLi4uL3hlbi9zY2hlZC1pZi5oID0+IGNv
bW1vbi9zY2hlZC9wcml2YXRlLmh9ICAgICAgfCAgMTggKy0KIHhlbi9jb21tb24ve3NjaGVkX3J0
LmMgPT4gc2NoZWQvcnQuY30gICAgICAgICAgICAgIHwgMTA5ICsrKysrLS0tLQogeGVuL2luY2x1
ZGUveGVuL2RvbWFpbi5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogeGVuL2lu
Y2x1ZGUveGVuL3JjdXBkYXRlLmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgLQogeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzkgKyst
LQogMjQgZmlsZXMgY2hhbmdlZCwgNTY4IGluc2VydGlvbnMoKyksIDU0NSBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL0tjb25maWcKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vY29tbW9uL3NjaGVkL01ha2VmaWxlCiByZW5hbWUgeGVuL2NvbW1vbi97c2No
ZWRfYXJpbmM2NTMuYyA9PiBzY2hlZC9hcmluYzY1My5jfSAoOTklKQogcmVuYW1lIHhlbi9jb21t
b24ve2NvbXBhdC9zY2hlZHVsZS5jID0+IHNjaGVkL2NvbXBhdC5jfSAoOTclKQogcmVuYW1lIHhl
bi9jb21tb24ve3NjaGVkdWxlLmMgPT4gc2NoZWQvY29yZS5jfSAoOTIlKQogcmVuYW1lIHhlbi9j
b21tb24veyA9PiBzY2hlZH0vY3B1cG9vbC5jICg5NyUpCiByZW5hbWUgeGVuL2NvbW1vbi97c2No
ZWRfY3JlZGl0LmMgPT4gc2NoZWQvY3JlZGl0LmN9ICg5NyUpCiByZW5hbWUgeGVuL2NvbW1vbi97
c2NoZWRfY3JlZGl0Mi5jID0+IHNjaGVkL2NyZWRpdDIuY30gKDk4JSkKIHJlbmFtZSB4ZW4vY29t
bW9uL3tzY2hlZF9udWxsLmMgPT4gc2NoZWQvbnVsbC5jfSAoOTIlKQogcmVuYW1lIHhlbi97aW5j
bHVkZS94ZW4vc2NoZWQtaWYuaCA9PiBjb21tb24vc2NoZWQvcHJpdmF0ZS5ofSAoOTYlKQogcmVu
YW1lIHhlbi9jb21tb24ve3NjaGVkX3J0LmMgPT4gc2NoZWQvcnQuY30gKDk0JSkKCi0tIAoyLjE2
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
