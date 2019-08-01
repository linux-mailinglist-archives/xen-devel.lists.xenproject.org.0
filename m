Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492077D91B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 12:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht85c-000147-93; Thu, 01 Aug 2019 10:13:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6jP+=V5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ht85a-00013m-Qg
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:13:38 +0000
X-Inumbo-ID: 06a5c306-b445-11e9-a3f9-1f3b6ccdab71
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06a5c306-b445-11e9-a3f9-1f3b6ccdab71;
 Thu, 01 Aug 2019 10:13:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CE8AB11C;
 Thu,  1 Aug 2019 10:13:36 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 12:13:29 +0200
Message-Id: <20190801101333.9821-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/4] xen: debugtrace cleanup and per-cpu
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
bmcgZGVidWdnaW5nLApwbHVzIHNvbWUgY2xlYW51cC4KCkNoYW5nZXMgaW4gVjI6Ci0gYWRkZWQg
bmV3IHBhdGNoIDEgKHByZXBhcmluZyB0aGUgbW92ZSBvZiBkZWJ1Z3RyYWNlIGNvZGluZykKLSBw
YXRjaCA0ICh2MSBwYXRjaCAzKTogYXZvaWQgbGVha2luZyBidWZmZXIKCkp1ZXJnZW4gR3Jvc3Mg
KDQpOgogIHhlbjogdXNlIGNvbW1vbiBvdXRwdXQgZnVuY3Rpb24gaW4gZGVidWd0cmFjZQogIHhl
bjogbW92ZSBkZWJ1Z3RyYWNlIGNvZGluZyB0byBjb21tb24vZGVidWd0cmFjZS5jCiAgeGVuOiBy
ZWZhY3RvciBkZWJ1Z3RyYWNlIGRhdGEKICB4ZW46IGFkZCBwZXItY3B1IGJ1ZmZlciBvcHRpb24g
dG8gZGVidWd0cmFjZQoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8ICAgNyAr
LQogeGVuL2NvbW1vbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9jb21tb24v
ZGVidWd0cmFjZS5jICAgICAgICAgICB8IDI2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMgICAgICAgIHwgMTgyICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vY29uc29sZS5oICAgICAgICAg
fCAgIDMgKwogNSBmaWxlcyBjaGFuZ2VkLCAyNzUgaW5zZXJ0aW9ucygrKSwgMTgwIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9jb21tb24vZGVidWd0cmFjZS5jCgotLSAKMi4x
Ni40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
