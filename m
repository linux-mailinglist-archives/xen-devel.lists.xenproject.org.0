Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5DC1F3C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:38:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt37-0002jg-EU; Mon, 30 Sep 2019 10:37:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt34-0002gC-Vd
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:59 +0000
X-Inumbo-ID: 222ed1aa-e36e-11e9-bf31-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 222ed1aa-e36e-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839777; x=1601375777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=FyGQD07umeQncTekgcbfUfStTJLGKuOPm9SHgfgoJt4=;
 b=ZuPYWDVXaayhIF5KcSxxB5S0jblUSDIcYHCyCeYHoW1Xj2EhzzlZxXSK
 BeMWaE/I7bhkTemyy51I0ZOGyLFmIhR9bhZSOFwufwUV0Jk44yr0uWthV
 imECHPLQ90OkUxMJLWY8YyOqCVRdtegupdUZZXjZcUR4Y92BeHsmYUYPF 0=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="705521340"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Sep 2019 10:35:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 47D7EA2249; Mon, 30 Sep 2019 10:34:43 +0000 (UTC)
Received: from EX13D06UEE001.ant.amazon.com (10.43.62.79) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:14 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D06UEE001.ant.amazon.com (10.43.62.79) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:13 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:13 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:16 +0100
Message-ID: <ebc30b48403eacdc20d04125c442975b45d94bd6.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 24/55] x86_64/mm.c: remove code that serves
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIHwg
MiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jCmluZGV4IGMxZGFh
MDRjZjUuLjEwMzkzMjcyMGIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYwor
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
