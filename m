Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9114A2E
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:49:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd10-0007A0-LF; Mon, 06 May 2019 12:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1fRM=TG=amazon.com=prvs=022b7936d=elnikety@srs-us1.protection.inumbo.net>)
 id 1hNd0z-00079v-8p
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:46:41 +0000
X-Inumbo-ID: fa158b12-6ffc-11e9-add5-53dc52203767
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa158b12-6ffc-11e9-add5-53dc52203767;
 Mon, 06 May 2019 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557146794; x=1588682794;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dSLHyPzAMbnbdtyI/v3Kdo/lD2dWh3pn9p4uGEuUl0s=;
 b=jc6QVni4pQ848gC+6ry+Waa7beq+ebY2dt5BIDaFT+qyXfhvndA5wV0R
 HDSvWw4+0efnaIDRd86VLAXhjgyUMa3ItgHikKpB4BjwbToEt8qt8QCji
 PEmVvJ7vETGjlJa4U596m10QYkmfFA8G4dM2ipLTNRgIcsnpGJbWYMcSH M=;
X-IronPort-AV: E=Sophos;i="5.60,437,1549929600"; d="scan'208";a="764923419"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 06 May 2019 12:46:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x46CkQfT062600
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 6 May 2019 12:46:29 GMT
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 6 May 2019 12:46:28 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 6 May 2019 12:46:27 +0000
Received: from dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (10.15.5.186)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 6 May 2019 12:46:27 +0000
Received: by dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id DB5284634E; Mon,  6 May 2019 12:46:26 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 6 May 2019 12:46:24 +0000
Message-ID: <20190506124624.54454-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] mm: option to _always_ scrub freed domheap pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2l2ZSB0aGUgYWRtaW5pc3RyYXRvciBmdXJ0aGVyIGNvbnRyb2wgb24gd2hlbiB0byBzY3J1YiBk
b21oZWFwIHBhZ2VzIGJ5IGFkZGluZwphbiBvcHRpb24gdG8gYWx3YXlzIHNjcnViLiBUaGlzIGlz
IGEgc2FmZXR5IGZlYXR1cmUgdGhhdCwgd2hlbiBlbmFibGVkLApwcmV2ZW50cyBhIChidWdneSkg
ZG9tYWluIGZyb20gbGVha2luZyBzZWNyZXRzIGlmIGl0IGFjY2lkZW50YWxseSBmcmVlcyBhIHBh
Z2UKd2l0aG91dCBwcm9wZXIgc2NydWJiaW5nLgoKU2lnbmVkLW9mZi1ieTogRXNsYW0gRWxuaWtl
dHkgPGVsbmlrZXR5QGFtYXpvbi5jb20+Ci0tLQogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUu
cGFuZG9jIHwgIDggKysrKysrKysKIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICAgICAgICAgICB8
IDExICsrKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9j
IGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCmluZGV4IDdkY2IyMjkzMmEuLjVh
OTI5NDljNWEgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwor
KysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKQEAgLTI3MCw2ICsyNzAsMTQg
QEAgYW5kIG5vdCBydW5uaW5nIHNvZnRpcnFzLiBSZWR1Y2UgdGhpcyBpZiBzb2Z0aXJxcyBhcmUg
bm90IGJlaW5nIHJ1biBmcmVxdWVudGx5CiBlbm91Z2guIFNldHRpbmcgdGhpcyB0byBhIGhpZ2gg
dmFsdWUgbWF5IGNhdXNlIGJvb3QgZmFpbHVyZSwgcGFydGljdWxhcmx5IGlmCiB0aGUgTk1JIHdh
dGNoZG9nIGlzIGFsc28gZW5hYmxlZC4KIAorIyMjIHNjcnViX2RvbWhlYXAKKz4gYD0gPGJvb2xl
YW4+YAorCis+IERlZmF1bHQ6IGBmYWxzZWAKKworU2NydWIgZG9tYWlucycgZnJlZWQgcGFnZXMu
IFRoaXMgaXMgYSBzYWZldHkgbmV0IGFnYWluc3QgYSAoYnVnZ3kpIGRvbWFpbgorYWNjaWRlbnRh
bGx5IGxlYWtpbmcgc2VjcmV0cyBieSByZWxlYXNpbmcgcGFnZXMgd2l0aG91dCBwcm9wZXIgc2Fu
aXRpemF0aW9uLgorCiAjIyMgY2xvY2tzb3VyY2UgKHg4NikKID4gYD0gcGl0IHwgaHBldCB8IGFj
cGkgfCB0c2NgCiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMKaW5kZXggYmU0NDE1ODAzMy4uNjc4YTAwYWM5YiAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
QEAgLTIxNCw2ICsyMTQsMTIgQEAgY3VzdG9tX3BhcmFtKCJib290c2NydWIiLCBwYXJzZV9ib290
c2NydWJfcGFyYW0pOwogc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0ZGF0YSBvcHRfYm9vdHNj
cnViX2NodW5rID0gTUIoMTI4KTsKIHNpemVfcGFyYW0oImJvb3RzY3J1Yl9jaHVuayIsIG9wdF9i
b290c2NydWJfY2h1bmspOwogCisvKgorICogc2NydWJfZG9taGVhcCAtPiBEb21oZWFwIHBhZ2Vz
IGFyZSBzY3J1YmJlZCB3aGVuIGZyZWVkCisgKi8KK3N0YXRpYyBib29sX3Qgb3B0X3NjcnViX2Rv
bWhlYXAgPSAwOworYm9vbGVhbl9wYXJhbSgic2NydWJfZG9taGVhcCIsIG9wdF9zY3J1Yl9kb21o
ZWFwKTsKKwogI2lmZGVmIENPTkZJR19TQ1JVQl9ERUJVRwogc3RhdGljIGJvb2wgX19yZWFkX21v
c3RseSBzY3J1Yl9kZWJ1ZzsKICNlbHNlCkBAIC0yMzc4LDkgKzIzODQsMTAgQEAgdm9pZCBmcmVl
X2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGludCBvcmRlcikK
ICAgICAgICAgICAgIC8qCiAgICAgICAgICAgICAgKiBOb3JtYWxseSB3ZSBleHBlY3QgYSBkb21h
aW4gdG8gY2xlYXIgcGFnZXMgYmVmb3JlIGZyZWVpbmcgdGhlbSwKICAgICAgICAgICAgICAqIGlm
IGl0IGNhcmVzIGFib3V0IHRoZSBzZWNyZWN5IG9mIHRoZWlyIGNvbnRlbnRzLiBIb3dldmVyLCBh
ZnRlcgotICAgICAgICAgICAgICogYSBkb21haW4gaGFzIGRpZWQgd2UgYXNzdW1lIHJlc3BvbnNp
YmlsaXR5IGZvciBlcmFzdXJlLgorICAgICAgICAgICAgICogYSBkb21haW4gaGFzIGRpZWQgd2Ug
YXNzdW1lIHJlc3BvbnNpYmlsaXR5IGZvciBlcmFzdXJlLiBXZSBkbworICAgICAgICAgICAgICog
c2NydWIgcmVnYXJkbGVzcyBpZiBvcHRpb24gc2NydWJfZG9taGVhcCBpcyBzZXQuCiAgICAgICAg
ICAgICAgKi8KLSAgICAgICAgICAgIHNjcnViID0gZC0+aXNfZHlpbmcgfHwgc2NydWJfZGVidWc7
CisgICAgICAgICAgICBzY3J1YiA9IGQtPmlzX2R5aW5nIHx8IHNjcnViX2RlYnVnIHx8IG9wdF9z
Y3J1Yl9kb21oZWFwOwogICAgICAgICB9CiAgICAgICAgIGVsc2UKICAgICAgICAgewotLSAKMi4x
NS4zLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
