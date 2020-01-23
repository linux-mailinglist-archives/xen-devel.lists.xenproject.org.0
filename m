Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E011467DE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 13:24:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iubUi-0006w0-Ax; Thu, 23 Jan 2020 12:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iubUg-0006vv-Mv
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 12:21:54 +0000
X-Inumbo-ID: f107bfca-3dda-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f107bfca-3dda-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 12:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579782115; x=1611318115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V0n1akPnLa4zwUEc/0FwiFyc/EJzxmw83GAigcbCa5U=;
 b=cTkYpCgR8+RuChsaz01LfOp5CH0UiYTDDzrzbA1rEq/fqRzkB8hEsFJZ
 Co09uwpUDRJQuFJRwFEFPeitPM+ZWJFOHO6L4QdB2O/SyvPLSNvBfn/uv
 Y/rq2cAZMuuht9+oEotz2CvcFUMAPLvUYaUBQew4OnAcauaAqgTtqJ0EG g=;
IronPort-SDR: gJ5HBM3Tga/uhGiS3kzo7fZV8rKQBXpzLga+14ommLY2H0fnNfiRi5SfjvOGwPHT8wIjydWNG/
 mhTVaJ26msSg==
X-IronPort-AV: E=Sophos;i="5.70,353,1574121600"; d="scan'208";a="13841131"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Jan 2020 12:21:54 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id C4014A2AD3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 12:21:52 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 12:21:52 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 12:21:51 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 23 Jan 2020 12:21:50 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 12:21:37 +0000
Message-ID: <20200123122141.1419-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/3] purge free_shared_domheap_page()
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
bXgvdm14LmMgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogeGVu
L2FyY2gveDg2L21tLmMgICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tCiB4ZW4vY29tbW9u
L2RvbWFpbi5jICAgICAgICAgICAgICAgIHwgIDggKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4
Ni9odm0vaHZtLmggICAgICB8ICAxICsKIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNz
LmggfCAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgICAgICB8ICAyIC0tCiA5
IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQoKLS0gCjIu
MjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
