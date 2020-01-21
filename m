Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF06143C77
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:03:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itsCl-0006MV-0b; Tue, 21 Jan 2020 12:00:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zZg3=3K=amazon.co.uk=prvs=282bd3163=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itsCj-0006MQ-Bh
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:00:21 +0000
X-Inumbo-ID: 9667e946-3c45-11ea-ba7e-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9667e946-3c45-11ea-ba7e-12813bfff9fa;
 Tue, 21 Jan 2020 12:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579608017; x=1611144017;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sr9p/pYAatO1SHjDPuwT+v8ynAexlKARKPgPYoPvyHk=;
 b=Y2pN4k8DT8cXZPFcKh41lsA9DDKUMz5QzJdQmCym0IIfhN5D0OueGndu
 XZg2K2Jun8BTN1r8bkHv4ZZ9xr9LjJ3syZNselK2I+7XFGyA/WO1ODvU2
 9eosAG8/4NP9/l3NXJlJ7WFWFlfF6YFFfE1R5TuB5LHro5PnlNhOzqlen o=;
IronPort-SDR: 6HbjY2E0VcQsvKXQV37nuK9SucMwFydHKeYCOypFQcqwSm8KfuhrLEM76JZ5jkuPX04fHnNnm8
 3xhqI1uWfAyQ==
X-IronPort-AV: E=Sophos;i="5.70,345,1574121600"; d="scan'208";a="12564357"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Jan 2020 12:00:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id AB512A241C
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 12:00:14 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 21 Jan 2020 12:00:14 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 Jan 2020 12:00:12 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 21 Jan 2020 12:00:11 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 12:00:06 +0000
Message-ID: <20200121120009.1767-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 0/3] purge free_shared_domheap_page()
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
TFRfUEhZU19CQVNFCgogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgICAgICB8ICAyICsr
CiB4ZW4vYXJjaC94ODYvaHZtL210cnIuYyAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4
Ni9odm0vc3ZtL3N2bS5jICAgICAgICAgfCAgNSArKysrCiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYyAgICAgICAgIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB4ZW4vYXJj
aC94ODYvbW0uYyAgICAgICAgICAgICAgICAgIHwgMTAgLS0tLS0tLS0KIHhlbi9jb21tb24vcGFn
ZV9hbGxvYy5jICAgICAgICAgICAgfCAgMyArKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2
bS5oICAgICAgfCAgMSArCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5oIHwgIDIg
Ky0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgICAgICAgICAgfCAgMiAtLQogOSBmaWxlcyBj
aGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCi0tIAoyLjIwLjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
