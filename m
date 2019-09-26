Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F196BEED7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQNv-0004WG-Rl; Thu, 26 Sep 2019 09:48:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQNt-0004TY-NQ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:48:25 +0000
X-Inumbo-ID: c6a914e1-e042-11e9-964c-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by localhost (Halon) with ESMTPS
 id c6a914e1-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491301; x=1601027301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=L46FocjdSdsTHOhvGjL/s9F2JXilCIgVAbX2/WEoSrg=;
 b=l6S6ciKAvs5Ty7NFdV99AfDHOCQpGAfqtz6N+62dflFO6ArxlFtof5kj
 RTHAZGDq68jvmmbazitUtaDCnFpAXmF9lDdvpxOWGRIrlD4apeU88CPCa
 5n5WoGf97yDxYlTItMoavg0A1o+vf9rR6CjJYpjvshPe04MNRNOAvgi/o s=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="787535109"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Sep 2019 09:48:21 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id A5441A26C6; Thu, 26 Sep 2019 09:48:19 +0000 (UTC)
Received: from EX13D27UWA003.ant.amazon.com (10.43.160.56) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:55 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D27UWA003.ant.amazon.com (10.43.160.56) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:47:55 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:47:53 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:45:57 +0100
Message-ID: <fe4956cbc94305220558e14e679ec283757b8ecc.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 34/84] x86/smpboot: add emacs block
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8IDEw
ICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXgg
OTExNDE2YzFlMS4uYjA4NjA2MzQ4NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC0xMzgwLDMgKzEzODAsMTMgQEAgdm9p
ZCBfX2luaXQgc21wX2ludHJfaW5pdCh2b2lkKQogICAgIHNldF9kaXJlY3RfYXBpY192ZWN0b3Io
SU5WQUxJREFURV9UTEJfVkVDVE9SLCBpbnZhbGlkYXRlX2ludGVycnVwdCk7CiAgICAgc2V0X2Rp
cmVjdF9hcGljX3ZlY3RvcihDQUxMX0ZVTkNUSU9OX1ZFQ1RPUiwgY2FsbF9mdW5jdGlvbl9pbnRl
cnJ1cHQpOwogfQorCisvKgorICogTG9jYWwgdmFyaWFibGVzOgorICogbW9kZTogQworICogYy1m
aWxlLXN0eWxlOiAiQlNEIgorICogYy1iYXNpYy1vZmZzZXQ6IDQKKyAqIHRhYi13aWR0aDogNAor
ICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
