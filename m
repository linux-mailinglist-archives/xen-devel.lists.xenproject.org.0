Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E811BEEF0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:52:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPp-0008UV-WE; Thu, 26 Sep 2019 09:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDQPn-0008Qf-Ka
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:23 +0000
X-Inumbo-ID: 07d8e59e-e043-11e9-bf31-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 07d8e59e-e043-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569491412; x=1601027412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=asXLxl/75rRuYGnWov8wrMv8pQpcv+qWDkmA7y7z49A=;
 b=ZY/XPyj0r5fQVD0e+idXQCGZJj/kibu/zgBf/v51jSP++9j/C0Pa8+N9
 Zehp7q9L7sS+LVmRjJMoWjhr2RU/ZYNamkdkLSIW4NGzrL5uRTKgmUlqx
 mjTyztFIq9gbmSLLZwzJ6ho08zIszXtP5+VMS1+3JK4vVTsKaUMTedzr4 k=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836989007"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 09:49:10 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 89D91A04EB; Thu, 26 Sep 2019 09:48:57 +0000 (UTC)
Received: from EX13D32UWA001.ant.amazon.com (10.43.160.4) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:29 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32UWA001.ant.amazon.com (10.43.160.4) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 09:48:28 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 09:48:27 +0000
From: <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 26 Sep 2019 10:46:15 +0100
Message-ID: <b0e10b34d37a72c5b446fca732f225ec0ad2dc2c.1569489002.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569489002.git.hongyax@amazon.com>
References: <cover.1569489002.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [RFC PATCH 52/84] x86/pv: properly map and unmap page
 table in dom0_construct_pv
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
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQu
YyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNo
L3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggZDdkNDI1NjhmYi4uMzljYjY4ZjdkYSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvcHYv
ZG9tMF9idWlsZC5jCkBAIC02NzksNiArNjc5LDggQEAgaW50IF9faW5pdCBkb20wX2NvbnN0cnVj
dF9wdihzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgaWYgKCBpc19wdl8zMmJpdF9kb21haW4oZCkg
KQogICAgIHsKKyAgICAgICAgbDJfcGdlbnRyeV90ICpsMnQ7CisKICAgICAgICAgLyogRW5zdXJl
IHRoZSBmaXJzdCBmb3VyIEwzIGVudHJpZXMgYXJlIGFsbCBwb3B1bGF0ZWQuICovCiAgICAgICAg
IGZvciAoIGkgPSAwLCBsM3RhYiA9IGwzc3RhcnQ7IGkgPCA0OyArK2ksICsrbDN0YWIgKQogICAg
ICAgICB7CkBAIC02OTMsNyArNjk1LDkgQEAgaW50IF9faW5pdCBkb20wX2NvbnN0cnVjdF9wdihz
dHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgIGwzZV9nZXRfcGFnZSgqbDN0YWIpLT51
LmludXNlLnR5cGVfaW5mbyB8PSBQR1RfcGFlX3hlbl9sMjsKICAgICAgICAgfQogCi0gICAgICAg
IGluaXRfeGVuX3BhZV9sMl9zbG90cyhsM2VfdG9fbDJlKGwzc3RhcnRbM10pLCBkKTsKKyAgICAg
ICAgbDJ0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwzZV9nZXRfbWZuKGwzc3RhcnRbM10pKTsK
KyAgICAgICAgaW5pdF94ZW5fcGFlX2wyX3Nsb3RzKGwydCwgZCk7CisgICAgICAgIFVOTUFQX1hF
Tl9QQUdFVEFCTEVfTkVXKGwydCk7CiAgICAgfQogCiAgICAgLyogUGFnZXMgdGhhdCBhcmUgcGFy
dCBvZiBwYWdlIHRhYmxlcyBtdXN0IGJlIHJlYWQgb25seS4gKi8KLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
