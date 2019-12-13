Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A76411E44E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:06:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkbX-0003j3-3N; Fri, 13 Dec 2019 13:03:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifkbV-0003id-I8
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:03:33 +0000
X-Inumbo-ID: f6d9177a-1da8-11ea-8ef8-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6d9177a-1da8-11ea-8ef8-12813bfff9fa;
 Fri, 13 Dec 2019 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576242212; x=1607778212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pXLbiQW3h6ArNxyatTC+5TwvfA8RAqWrCGd/qqWBmfk=;
 b=GIFLWJDGbFncLn/550kP/N6gDwUG6BOIubGssuhZf2qOI98ihUd3nZmm
 jqeebrOKJs8e30TMa3TR/Ej/KNSim8oGb+udEkDuJzh/X9RTekeS+jlmr
 cLuKZUTbfi2VX6ghc423Xd0EQmmWrY9jh7bGnYHHiLazhXg14JqqOn3OO o=;
IronPort-SDR: K2B1AS/kOJlev6nR+rMTZjXFcWTI4HUoOOnIF7mSo90Qm/tPLQWwziwavQjHSNpyzHh9/yiPuo
 B3Ggt227p/DA==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; d="scan'208";a="14715938"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 13 Dec 2019 13:03:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3120E2229C8; Fri, 13 Dec 2019 13:03:21 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:03:20 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 13:03:19 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 13 Dec 2019 13:03:18 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 13:03:16 +0000
Message-ID: <20191213130316.21085-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] public/io/netif.h: document a mechanism to
 advertise carrier state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGEgc3BlY2lmaWNhdGlvbiBmb3IgYSAnY2Fycmllcicgbm9kZSBpbiB4
ZW5zdG9yZSB0byBhbGxvdwphIGJhY2tlbmQgdG8gbm90aWZ5IGEgZnJvbnRlbmQgb2YgaXQncyB2
aXJ0dWFsIGNhcnJpZXIvbGluayBzdGF0ZS4gRS5nLgphIGJhY2tlbmQgdGhhdCBpcyB1bmFibGUg
dG8gZm9yd2FyZCBwYWNrZXRzIGZyb20gdGhlIGd1ZXN0IGJlY2F1c2UgaXQgaXMKbm90IGF0dGFj
aGVkIHRvIGEgYnJpZGdlIG1heSB3aXNoIHRvIGFkdmVydGlzZSAnbm8gY2FycmllcicuCgpOT1RF
OiBUaGlzIGlzIHB1cmVseSBhIGRvY3VtZW50YXRpb24gcGF0Y2guIE5vIGZ1bmN0aW9uYWwgY2hh
bmdlLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgot
LS0KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMv
aW8vbmV0aWYuaCB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oIGIveGVu
L2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgKaW5kZXggMjQ1NDQ0OGJhYS4uZTU4NzA1NWY2OCAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgKKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL2lvL25ldGlmLmgKQEAgLTE5MCw2ICsxOTAsMjAgQEAKICAqIG9yZGVyIGFzIHJl
cXVlc3RzLgogICovCiAKKy8qCisgKiBMaW5rIHN0YXRlCisgKiA9PT09PT09PT09CisgKgorICog
VGhlIGJhY2tlbmQgY2FuIGFkdmVydGlzZSBpdCBpcyBjdXJyZW50IGxpbmsgKGNhcnJpZXIpIHN0
YXRlIHRvIHRoZQorICogZnJvbnRlbmQgdXNpbmcgdGhlIC9sb2NhbC9kb21haW4vWC9iYWNrZW5k
Lzxkb21pZD4vPHZpZj4vY2FycmllciBub2RlLgorICogSWYgdGhpcyBub2RlIGlzIG5vdCBwcmVz
ZW50LCB0aGVuIHRoZSBmcm9udGVuZCBzaG91bGQgYXNzdW1lIHRoYXQgdGhlCisgKiBsaW5rIGlz
IHVwIChmb3IgY29tcGF0aWJpbGl0eSB3aXRoIGJhY2tlbmRzIHRoYXQgZG8gbm8gaW1wbGVtZW50
IHRoaXMKKyAqIGZlYXR1cmUpLiBJZiB0aGlzIG5vZGUgaXMgcHJlc2VudCwgdGhlbiBhIHZhbHVl
IG9mICIwIiBzaG91bGQgYmUKKyAqIGludGVycHJldGVkIGJ5IHRoZSBmcm9udGVuZCBhcyB0aGUg
bGluayBiZWluZyBkb3duIChubyBjYXJyaWVyKSBhbmQgYQorICogdmFsdWUgb2YgIjEiIHNob3Vs
ZCBiZSBpbnRlcnByZXRlZCBhcyB0aGUgbGluayBiZWluZyB1cCAoY2FycmllcgorICogcHJlc2Vu
dCkuCisgKi8KKwogLyoKICAqIEhhc2ggdHlwZXMKICAqID09PT09PT09PT0KLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
