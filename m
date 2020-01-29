Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8E714C8AE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:19:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkP2-0003mI-H5; Wed, 29 Jan 2020 10:16:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwkP0-0003mD-Gn
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:16:54 +0000
X-Inumbo-ID: 790749a0-4280-11ea-b211-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 790749a0-4280-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580293015; x=1611829015;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R/XUkWE3EeinMyBHsUs7ucKcmVVhG2yOhe+kj7Np/tU=;
 b=JP+yrbnilfIJdkWjXzLlvoWAe3sg6oWCMPPv3FvenKub073q2S2flPDv
 tHqNQ93lcmS6K/TDbvgZufMY3wEAWb/L+7uBObWpGCRVCx/gu9wYdUiUf
 jsPyVe6G5YwC1+RL0vjyWWJ4u5rNHqRzwgh8NCYr/0xOAPrxWR8RQheyj o=;
IronPort-SDR: fTQEVAPIiux6QzaRHrSUPA4q1qWQ0pMfUKkTb/+jiRQfTYUOde1pyVH6r2UpVTpHkbey/RXrDa
 6Jq4vO9hiefg==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="15268371"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 29 Jan 2020 10:16:53 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 58577A24CC
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 10:16:52 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 10:16:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 10:16:50 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 10:16:49 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 10:16:39 +0000
Message-ID: <20200129101643.1394-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 0/4] purge free_shared_domheap_page()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICg0KToKICB4ODYgLyB2bXg6IG1vdmUgdGVhcmRvd24gZnJvbSBkb21haW5f
ZGVzdHJveSgpLi4uCiAgbW06IG1vZGlmeSBkb21haW5fYWRqdXN0X3RvdF9wYWdlcygpIHRvIGJl
dHRlciBoYW5kbGUgYSB6ZXJvCiAgICBhZGp1c3RtZW50CiAgbW06IG1ha2UgTUVNRl9ub19yZWZj
b3VudCBwYWdlcyBzYWZlIHRvIGFzc2lnbgogIHg4NiAvIHZteDogdXNlIGEgTUVNRl9ub19yZWZj
b3VudCBkb21oZWFwIHBhZ2UgZm9yCiAgICBBUElDX0RFRkFVTFRfUEhZU19CQVNFCgogeGVuL2Fy
Y2gveDg2L2h2bS92bXgvdm14LmMgfCAyNSArKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4v
YXJjaC94ODYvbW0uYyAgICAgICAgICB8IDEwIC0tLS0tLS0tLS0KIHhlbi9jb21tb24vcGFnZV9h
bGxvYy5jICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL2FzbS1hcm0vbW0uaCAgIHwgIDUgKysrKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
bW0uaCAgIHwgIDkgKysrKystLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyks
IDMyIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
