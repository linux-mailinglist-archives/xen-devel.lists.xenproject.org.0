Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D818AD3FC
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 09:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7EDU-00053P-4h; Mon, 09 Sep 2019 07:36:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7EDS-00053E-Q7
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 07:36:02 +0000
X-Inumbo-ID: 77f84fa8-d2d4-11e9-ac08-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77f84fa8-d2d4-11e9-ac08-12813bfff9fa;
 Mon, 09 Sep 2019 07:36:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CD79ABF1;
 Mon,  9 Sep 2019 07:35:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 09:35:52 +0200
Message-Id: <20190909073557.16168-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v6 0/5] xen: debugtrace cleanup and per-cpu
 buffer support
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5vdGhlciBkZWJ1Z3RyYWNlIGVuaGFuY2VtZW50IEkgbmVlZGVkIGZvciBjb3JlIHNjaGVkdWxp
bmcgZGVidWdnaW5nLApwbHVzIHNvbWUgY2xlYW51cC4KCkNoYW5nZXMgaW4gVjY6Ci0gc29tZSBj
b21tZW50cyBieSBKYW4gYWRkcmVzc2VkCi0gYWRkZWQgcGF0Y2ggNQoKQ2hhbmdlcyBpbiBWNToK
LSBzZXZlcmFsIGNvbW1lbnRzIGJ5IEphbiBhZGRyZXNzZWQgKGNvZGU6IHBhdGNoZXMgMSBhbmQg
NCwgY29tbWl0CiAgbWVzc2FnZSBvZiBwYXRjaCAzKQoKQ2hhbmdlcyBpbiBWNDoKLSByZXBsYWNl
ZCBwYXRjaCAxIChvcmlnaW5hbCBvbmUgd2FzIGNvbW1pdHRlZCwgbmV3IG9uZSByZXF1ZXN0ZWQg
YnkKICBKYW4gQmV1bGljaCkKLSBzZXZlcmFsIGNvbW1lbnRzIGJ5IEphbiBhZGRyZXNzZWQKCkNo
YW5nZXMgaW4gVjM6Ci0gcmViYXNlIHRvIGN1cnJlbnQgc3RhZ2luZwoKQ2hhbmdlcyBpbiBWMjoK
LSBhZGRlZCBuZXcgcGF0Y2ggMSAocHJlcGFyaW5nIHRoZSBtb3ZlIG9mIGRlYnVndHJhY2UgY29k
aW5nKQotIHBhdGNoIDQgKHYxIHBhdGNoIDMpOiBhdm9pZCBsZWFraW5nIGJ1ZmZlcgoKSnVlcmdl
biBHcm9zcyAoNSk6CiAgeGVuOiBmaXggZGVidWd0cmFjZSBjbGVhcmluZwogIHhlbjogbW92ZSBk
ZWJ1Z3RyYWNlIGNvZGluZyB0byBjb21tb24vZGVidWd0cmFjZS5jCiAgeGVuOiByZWZhY3RvciBk
ZWJ1Z3RyYWNlIGRhdGEKICB4ZW46IGFkZCBwZXItY3B1IGJ1ZmZlciBvcHRpb24gdG8gZGVidWd0
cmFjZQogIHhlbjogYWRkIGRlYnVndHJhY2UgZW50cnkgd2hlbiBlbnRyeSBjb3VudCBpcyB3cmFw
cGluZwoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8ICAgNyArLQogeGVuL2Nv
bW1vbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9jb21tb24vZGVidWd0cmFj
ZS5jICAgICAgICAgICB8IDMwMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgICAgICAgIHwgMTc4ICstLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMzA5IGluc2VydGlvbnMoKyksIDE4MCBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL2RlYnVndHJhY2UuYwoKLS0gCjIu
MTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
