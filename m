Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A22B146AD5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:06:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iud4r-0008L5-Bl; Thu, 23 Jan 2020 14:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iud4p-0008Ki-GL
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 14:03:19 +0000
X-Inumbo-ID: 17082d78-3de9-11ea-b833-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17082d78-3de9-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579788192; x=1611324192;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RgP24r/K/yN38EflrIhkdVXi/PGP53B4BieH47gSikk=;
 b=benSgM0ZlGfmH/GKhEj9lwxJ8E+oLzKkYioIfn1bCxuPk4sUXGLLQhwn
 1fmPkmGrZwDIU1UOxdEKvkydkO++cyAct6pFghpm1h76Mgaz3THcDXIX2
 x0nqyvvUcc1NFdJlbEegPb8l5qod2TsVaxqu43CCEhXP0rOrmSs3+QYPG E=;
IronPort-SDR: YFXP7BjH2NU3Fsi/x8o+a/uxc1dgeU78PJupEL2lAn4ZjBqtyna4qBr2r6bsq/lbb7BiA6521L
 QUupB4sDDTLw==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="12939908"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 23 Jan 2020 14:03:11 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 64C3AA15F2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 14:03:09 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 14:03:09 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 14:03:07 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 23 Jan 2020 14:03:06 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 14:03:02 +0000
Message-ID: <20200123140305.21050-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/3] purge free_shared_domheap_page()
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

UGF1bCBEdXJyYW50ICgzKToKICB4ODYgLyB2bXg6IG1ha2UgYXBpY19hY2Nlc3NfbWZuIHR5cGUt
c2FmZQogIHg4NiAvIGh2bTogYWRkIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIG1ldGhv
ZAogIHg4NiAvIHZteDogdXNlIGEgJ25vcm1hbCcgZG9taGVhcCBwYWdlIGZvciBBUElDX0RFRkFV
TFRfUEhZU19CQVNFCgogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICB8ICA3ICsr
KysrLQogeGVuL2FyY2gveDg2L2h2bS9tdHJyLmMgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJj
aC94ODYvaHZtL3N2bS9zdm0uYyAgICAgICAgIHwgIDUgLS0tLQogeGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogeGVu
L2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tCiB4ZW4vY29tbW9u
L2RvbWFpbi5jICAgICAgICAgICAgICAgIHwgIDggKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vaHZtLmggICAgICB8ICAxICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNz
LmggfCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgICAgICB8ICAyIC0tCiA5
IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
