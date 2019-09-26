Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A039ABEED2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNj-0004Fy-U8; Thu, 26 Sep 2019 09:48:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNi-0004FJ-On
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:14 +0000
X-Inumbo-ID: c25651d2-e042-11e9-b588-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id c25651d2-e042-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491294; x=1601027294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=vtHVGWpmxN+XKXUpX4r1cfArkAPoliqMZ/3sDWi6CkU=;
 b=Ni+VbyLhhJkEkuCRJv+9OPqbNqPSiUdgpxnmacxwQVIy8yVnilFDNfzQ
 4gnR4uMJmLJST3dZyzb+VnQmAByayTsQFzGqx0e0PwMysr9mXavVxl7+H
 pBcTS5bOh7M9nII64xNm6iNZup0xgwK4is3uo5y5TiWD77EcSX7/4CDyD c=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535086"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:13 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id BF1FDA2D8F; Thu, 26 Sep 2019 09:48:11 +0000 (UTC)
Received: from EX13D31UWA001.ant.amazon.com (10.43.160.57) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:40 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D31UWA001.ant.amazon.com (10.43.160.57) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:40 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:38 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:48 +0100
Message-ID: <3217dbfb7b277abc7de77067f38a2948cd1532cc.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 25/84] x86_64/mm.c: remove code that serves
 no purpose in setup_m2p_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IDk0NWFl
MTIzYTYuLjliMzliMmZmY2IgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwor
KysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKQEAgLTQ4MCw4ICs0ODAsNiBAQCBzdGF0aWMg
aW50IHNldHVwX20ycF90YWJsZShzdHJ1Y3QgbWVtX2hvdGFkZF9pbmZvICppbmZvKQogICAgICAg
ICAgICAgbDJlX3dyaXRlKGwyX3JvX21wdCwgbDJlX2Zyb21fbWZuKG1mbiwKICAgICAgICAgICAg
ICAgICAgICAvKl9QQUdFX0dMT0JBTHwqL19QQUdFX1BTRXxfUEFHRV9VU0VSfF9QQUdFX1BSRVNF
TlQpKTsKICAgICAgICAgfQotICAgICAgICBpZiAoICEoKHVuc2lnbmVkIGxvbmcpbDJfcm9fbXB0
ICYgflBBR0VfTUFTSykgKQotICAgICAgICAgICAgbDJfcm9fbXB0ID0gTlVMTDsKICAgICAgICAg
aSArPSAoIDFVTCA8PCAoTDJfUEFHRVRBQkxFX1NISUZUIC0gMykpOwogICAgIH0KICN1bmRlZiBD
TlQKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
