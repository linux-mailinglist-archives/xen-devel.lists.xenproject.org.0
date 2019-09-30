Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1DCC1F4B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt2m-000238-AH; Mon, 30 Sep 2019 10:36:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Wfc7=XZ=amazon.com=prvs=169663feb=hongyax@srs-us1.protection.inumbo.net>)
 id 1iEt2j-0001yx-WC
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:36:38 +0000
X-Inumbo-ID: 2a81acda-e36e-11e9-96cd-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by localhost (Halon) with ESMTPS
 id 2a81acda-e36e-11e9-96cd-12813bfff9fa;
 Mon, 30 Sep 2019 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569839792; x=1601375792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=asXLxl/75rRuYGnWov8wrMv8pQpcv+qWDkmA7y7z49A=;
 b=qkoqpzn2RVe/DeSZmypi84x/SUA7b2p8XfjOBJFMpNb1hy1E9zEtcV7L
 sk56tmmqdxnTwIITd/P6agCj7e6Fk8T0UvV4qJrQyrySJ/gRwgrvRqnN+
 osurxdXL5aNKJ6DbVq3inuK/X+t42+fVKU5myiGbu/5V1WbSyII4ItimW 8=;
X-IronPort-AV: E=Sophos;i="5.64,565,1559520000"; d="scan'208";a="705521395"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 30 Sep 2019 10:35:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id D5788A2EC5; Mon, 30 Sep 2019 10:34:58 +0000 (UTC)
Received: from EX13D15UEE003.ant.amazon.com (10.43.62.19) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:38 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D15UEE003.ant.amazon.com (10.43.62.19) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 30 Sep 2019 10:34:37 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 30 Sep 2019 10:34:37 +0000
From: Hongyan Xia <hongyax@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 11:33:43 +0100
Message-ID: <0ecfa9b5e9410c2b1f4ebd3bb82f649e0ebde516.1569833766.git.hongyax@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 51/55] x86/pv: properly map and unmap page
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
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
