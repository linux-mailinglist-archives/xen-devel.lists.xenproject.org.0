Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB097C1F11
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt1P-0007v8-RC; Mon, 30 Sep 2019 10:35:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt1N-0007sd-Rj
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:35:13 +0000
X-Inumbo-ID: f157ae26-e36d-11e9-bf31-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id f157ae26-e36d-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839695; x=1601375695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=y6QRWXt83sqWJchd2RmXZ6+Xv6qUuR82BN4GSwIp7XY=;
 b=HMyQ7zRnO4sX7HMdQDwpnXPQH+1646UlqjifucfV5FvbmHnX/S9Y/yP6
 YK2jsuzgmFT7bTDfFm0Tx/92p88Beh3bea6v3Zo1ydjZJ7QPU3QZxjOQ3
 1yuLT6g8EQPrEMwN5jYLwLJgb3sjXvcI/+HBOmFp4sizFZM3VBr/w7MlC 8=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="424630136"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 30 Sep 2019 10:34:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id BD8DEA1E1C; Mon, 30 Sep 2019 10:34:49 +0000 (UTC)
Received: from EX13D12UEE002.ant.amazon.com (10.43.62.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:21 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D12UEE002.ant.amazon.com (10.43.62.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:20 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:20 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:25 +0100
Message-ID: <a66c3813da139f3054f8975aae62508a2b17a413.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 33/55] x86/smpboot: add emacs block
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDEw
ICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXgg
NWIzYmUyNWY4YS4uNTViOTk2NDRhZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC0xMzc4LDMgKzEzNzgsMTMgQEAgdm9p
ZCBfX2luaXQgc21wX2ludHJfaW5pdCh2b2lkKQogICAgIHNldF9kaXJlY3RfYXBpY192ZWN0b3Io
SU5WQUxJREFURV9UTEJfVkVDVE9SLCBpbnZhbGlkYXRlX2ludGVycnVwdCk7CiAgICAgc2V0X2Rp
cmVjdF9hcGljX3ZlY3RvcihDQUxMX0ZVTkNUSU9OX1ZFQ1RPUiwgY2FsbF9mdW5jdGlvbl9pbnRl
cnJ1cHQpOwogfQorCisvKgorICogTG9jYWwgdmFyaWFibGVzOgorICogbW9kZTogQworICogYy1m
aWxlLXN0eWxlOiAiQlNEIgorICogYy1iYXNpYy1vZmZzZXQ6IDQKKyAqIHRhYi13aWR0aDogNAor
ICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
