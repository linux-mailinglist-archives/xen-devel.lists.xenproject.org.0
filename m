Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1A77EA6
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2019 10:44:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrejv-0008Vd-Gr; Sun, 28 Jul 2019 08:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hreju-0008VT-PP
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2019 08:41:10 +0000
X-Inumbo-ID: 6fb12f3c-b113-11e9-b5a5-c3e0ee6bcf18
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fb12f3c-b113-11e9-b5a5-c3e0ee6bcf18;
 Sun, 28 Jul 2019 08:41:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E488AE60;
 Sun, 28 Jul 2019 08:41:04 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 28 Jul 2019 10:40:57 +0200
Message-Id: <20190728084100.13071-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/3] xen: debugtrace cleanup and per-cpu buffer
 support
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
bmcgZGVidWdnaW5nLgoKSnVlcmdlbiBHcm9zcyAoMyk6CiAgeGVuOiBtb3ZlIGRlYnVndHJhY2Ug
Y29kaW5nIHRvIGNvbW1vbi9kZWJ1Z3RyYWNlLmMKICB4ZW46IHJlZmFjdG9yIGRlYnVndHJhY2Ug
ZGF0YQogIHhlbjogYWRkIHBlci1jcHUgYnVmZmVyIG9wdGlvbiB0byBkZWJ1Z3RyYWNlCgogZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwgICA3ICstCiB4ZW4vY29tbW9uL01ha2Vm
aWxlICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMgICAgICAg
ICAgIHwgMjYyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vZHJp
dmVycy9jaGFyL2NvbnNvbGUuYyAgICAgICAgfCAxNzYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogeGVuL2luY2x1ZGUveGVuL2NvbnNvbGUuaCAgICAgICAgIHwgICA0ICsKIDUgZmlsZXMgY2hh
bmdlZCwgMjczIGluc2VydGlvbnMoKyksIDE3NyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vY29tbW9uL2RlYnVndHJhY2UuYwoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
