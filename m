Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5459162EC
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 13:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNyMV-00033F-Nk; Tue, 07 May 2019 11:34:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GFk4=TH=amazon.com=prvs=023fb95da=elnikety@srs-us1.protection.inumbo.net>)
 id 1hNyMT-00033A-Vj
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 11:34:18 +0000
X-Inumbo-ID: 0bb14b21-70bc-11e9-843c-bc764e045a96
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bb14b21-70bc-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557228856; x=1588764856;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=AsXdEHf9OsfLDTU2Wq2dl9o6XZrqQJVboWFSf4g7lNs=;
 b=TGqeUz2OtOvBvHRVaHn9kNc5JhWn5Un8/NUKL5Foe/rSzOOgDrmJu799
 sl6lk5bR1YRZBnWmChJdL4gtnbLuTbyOXYZFQDo653ZoYNgFmXXuwjznH
 QShSEEv1weOFApFvjtlTXOyTS/jsLtYkeWMDxYnoXACZxBxwdQW0oLRzv M=;
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="803287876"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 11:34:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x47BY9sO120716
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 May 2019 11:34:10 GMT
Received: from EX13D18EUA004.ant.amazon.com (10.43.165.164) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 11:34:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D18EUA004.ant.amazon.com (10.43.165.164) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 7 May 2019 11:34:08 +0000
Received: from dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (10.15.5.186)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 7 May 2019 11:34:07 +0000
Received: by dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 91FAA463CF; Tue,  7 May 2019 11:34:07 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 7 May 2019 11:34:05 +0000
Message-ID: <20190507113405.71851-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] mm: option to _always_ scrub freed domheap
 pages
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
 Beulich <jbeulich@suse.com>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2l2ZSB0aGUgYWRtaW5pc3RyYXRvciBmdXJ0aGVyIGNvbnRyb2wgb24gd2hlbiB0byBzY3J1YiBk
b21oZWFwIHBhZ2VzIGJ5IGFkZGluZwphbiBvcHRpb24gdG8gYWx3YXlzIHNjcnViLiBUaGlzIGlz
IGEgc2FmZXR5IGZlYXR1cmUgdGhhdCwgd2hlbiBlbmFibGVkLApwcmV2ZW50cyBhIChidWdneSkg
ZG9tYWluIGZyb20gbGVha2luZyBzZWNyZXRzIGlmIGl0IGFjY2lkZW50YWxseSBmcmVlcyBhIHBh
Z2UKd2l0aG91dCBwcm9wZXIgc2NydWJiaW5nLgoKU2lnbmVkLW9mZi1ieTogRXNsYW0gRWxuaWtl
dHkgPGVsbmlrZXR5QGFtYXpvbi5jb20+CkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+Ci0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFJlbmFt
ZWQgcGFyYW1ldGVyIHRvIHNjcnViLWRvbWhlYXAsIGFuZCBub3cgYXQgdGhlIHJpZ2h0IHBsYWNl
CiAgICAgICAgLSBVc2VkICJib29sIF9fcmVhZF9tb3N0bHkiLCBubyB6ZXJvIGluaXQsIGFuZCBj
b3JyZWN0IGNvbW1lbnQgc3R5bGUKICAgICAgICAtIEFkZGVkIEdlb3JnZSdzIEEtYgotLS0KIGRv
Y3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8IDggKysrKysrKysKIHhlbi9jb21tb24v
cGFnZV9hbGxvYy5jICAgICAgICAgICB8IDkgKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hl
bi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9j
CmluZGV4IDZkYjgyZjMwMmUuLjc3MTMzM2ZjOGEgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy94ZW4t
Y29tbWFuZC1saW5lLnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5k
b2MKQEAgLTE3NzksNiArMTc3OSwxNCBAQCBzb2NrZXRzLCAmYy4gIFRoaXMgd2lsbCByZWR1Y2Ug
cGVyZm9ybWFuY2Ugc29tZXdoYXQsIHBhcnRpY3VsYXJseSBvbgogc3lzdGVtcyB3aXRoIGh5cGVy
dGhyZWFkaW5nIGVuYWJsZWQsIGJ1dCBzaG91bGQgcmVkdWNlIHBvd2VyIGJ5CiBlbmFibGluZyBt
b3JlIHNvY2tldHMgYW5kIGNvcmVzIHRvIGdvIGludG8gZGVlcGVyIHNsZWVwIHN0YXRlcy4KIAor
IyMjIHNjcnViLWRvbWhlYXAKKz4gYD0gPGJvb2xlYW4+YAorCis+IERlZmF1bHQ6IGBmYWxzZWAK
KworU2NydWIgZG9tYWlucycgZnJlZWQgcGFnZXMuIFRoaXMgaXMgYSBzYWZldHkgbmV0IGFnYWlu
c3QgYSAoYnVnZ3kpIGRvbWFpbgorYWNjaWRlbnRhbGx5IGxlYWtpbmcgc2VjcmV0cyBieSByZWxl
YXNpbmcgcGFnZXMgd2l0aG91dCBwcm9wZXIgc2FuaXRpemF0aW9uLgorCiAjIyMgc2VyaWFsX3R4
X2J1ZmZlcgogPiBgPSA8c2l6ZT5gCiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxv
Yy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKaW5kZXggYmU0NDE1ODAzMy4uOWMxMmQ3MWZj
MSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKQEAgLTIxNCw2ICsyMTQsMTAgQEAgY3VzdG9tX3BhcmFtKCJib290c2NydWIi
LCBwYXJzZV9ib290c2NydWJfcGFyYW0pOwogc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0ZGF0
YSBvcHRfYm9vdHNjcnViX2NodW5rID0gTUIoMTI4KTsKIHNpemVfcGFyYW0oImJvb3RzY3J1Yl9j
aHVuayIsIG9wdF9ib290c2NydWJfY2h1bmspOwogCisgLyogc2NydWItZG9taGVhcCAtPiBEb21o
ZWFwIHBhZ2VzIGFyZSBzY3J1YmJlZCB3aGVuIGZyZWVkICovCitzdGF0aWMgYm9vbCBfX3JlYWRf
bW9zdGx5IG9wdF9zY3J1Yl9kb21oZWFwOworYm9vbGVhbl9wYXJhbSgic2NydWItZG9taGVhcCIs
IG9wdF9zY3J1Yl9kb21oZWFwKTsKKwogI2lmZGVmIENPTkZJR19TQ1JVQl9ERUJVRwogc3RhdGlj
IGJvb2wgX19yZWFkX21vc3RseSBzY3J1Yl9kZWJ1ZzsKICNlbHNlCkBAIC0yMzc4LDkgKzIzODIs
MTAgQEAgdm9pZCBmcmVlX2RvbWhlYXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2ln
bmVkIGludCBvcmRlcikKICAgICAgICAgICAgIC8qCiAgICAgICAgICAgICAgKiBOb3JtYWxseSB3
ZSBleHBlY3QgYSBkb21haW4gdG8gY2xlYXIgcGFnZXMgYmVmb3JlIGZyZWVpbmcgdGhlbSwKICAg
ICAgICAgICAgICAqIGlmIGl0IGNhcmVzIGFib3V0IHRoZSBzZWNyZWN5IG9mIHRoZWlyIGNvbnRl
bnRzLiBIb3dldmVyLCBhZnRlcgotICAgICAgICAgICAgICogYSBkb21haW4gaGFzIGRpZWQgd2Ug
YXNzdW1lIHJlc3BvbnNpYmlsaXR5IGZvciBlcmFzdXJlLgorICAgICAgICAgICAgICogYSBkb21h
aW4gaGFzIGRpZWQgd2UgYXNzdW1lIHJlc3BvbnNpYmlsaXR5IGZvciBlcmFzdXJlLiBXZSBkbwor
ICAgICAgICAgICAgICogc2NydWIgcmVnYXJkbGVzcyBpZiBvcHRpb24gc2NydWJfZG9taGVhcCBp
cyBzZXQuCiAgICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIHNjcnViID0gZC0+aXNfZHlpbmcg
fHwgc2NydWJfZGVidWc7CisgICAgICAgICAgICBzY3J1YiA9IGQtPmlzX2R5aW5nIHx8IHNjcnVi
X2RlYnVnIHx8IG9wdF9zY3J1Yl9kb21oZWFwOwogICAgICAgICB9CiAgICAgICAgIGVsc2UKICAg
ICAgICAgewotLSAKMi4xNS4zLkFNWk4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
