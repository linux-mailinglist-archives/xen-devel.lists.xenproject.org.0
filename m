Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9CF135A8D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 14:51:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYBO-0003Hz-3B; Thu, 09 Jan 2020 13:49:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3305=26=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipYBM-0003Hs-Kf
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 13:49:04 +0000
X-Inumbo-ID: cb113bf7-32e6-11ea-b9d3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb113bf7-32e6-11ea-b9d3-12813bfff9fa;
 Thu, 09 Jan 2020 13:49:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 55C4FAD76;
 Thu,  9 Jan 2020 13:48:28 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 Jan 2020 14:48:23 +0100
Message-Id: <20200109134825.31482-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/2] xen: fix CONFIG_DEBUG_LOCKS
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q09ORklHX0RFQlVHX0xPQ0tTIGlzIHVzaW5nIEFTU0VSVCgpIGZvciBjYXRjaGluZyBpc3N1ZXMg
bWFraW5nIGl0CmRlcGVuZCBvbiBDT05GSUdfREVCVUcuCgpUaGlzIHNlcmllcyBmaXhlcyB0aGF0
IGJ5IHVzaW5nIEJVR19PTigpIGluc3RlYWQuIEluIG9yZGVyIG5vdCB0byBsb3NlCnRoZSByYXRo
ZXIgbmljZSBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24gd2hpY2ggY29uZGl0aW9uIHdhcyBoaXQgYWRk
IGEKY29uZmlnIG9wdGlvbiB0byBpbmNsdWRlIGEgbWVzc2FnZSBzaW1pbGFyIHRvIHRoZSBvbmUg
QVNTRVJUKCkgaXMKcHJpbnRpbmcgaW4gY2FzZSBvZiBCVUdfT00oKSB0cmlnZ2VyaW5nLgoKSnVl
cmdlbiBHcm9zcyAoMik6CiAgeGVuOiBhZGQgY29uZmlnIG9wdGlvbiB0byBpbmNsdWRlIGZhaWxp
bmcgY29uZGl0aW9uIGluIEJVR19PTigpCiAgICBtZXNzYWdlCiAgeGVuOiBtYWtlIENPTkZJR19E
RUJVR19MT0NLUyB1c2FibGUgd2l0aG91dCBDT05GSUdfREVCVUcKCiB4ZW4vS2NvbmZpZy5kZWJ1
ZyAgICAgICAgIHwgNiArKysrKysKIHhlbi9jb21tb24vc3BpbmxvY2suYyAgICAgfCAyICstCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2J1Zy5oIHwgNSArKystLQogeGVuL2luY2x1ZGUveGVuL2xpYi5o
ICAgICB8IDUgKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
