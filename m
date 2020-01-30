Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A5F14DD76
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:01:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBGX-0003or-Bu; Thu, 30 Jan 2020 14:57:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixBGV-0003of-G2
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 14:57:55 +0000
X-Inumbo-ID: e549b94a-4370-11ea-8a92-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e549b94a-4370-11ea-8a92-12813bfff9fa;
 Thu, 30 Jan 2020 14:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580396275; x=1611932275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BlKtK+n+9tQIbSyEQ6bplYASFGZDWQ/XQ5TRYENI3zY=;
 b=Dc6Fr0jtJSdorRl7IHxZF48/NKfsG+4AYgEpQlQyQf6Ei5puEFGi6Ljy
 IwDF1JZHkuDNWYqmeOIV1ou/OtpJGz+Dc24F/Njr0VBk0IDaI0dhITNGx
 YQtAcPA9b8X/gWTeTeLrXZ7oO4z9cz/FKq47+1ZhZvDxgkYzaFE2ZyqNQ I=;
IronPort-SDR: qVFvOw9hOQwzz7LNWLKzhhXsQo2E2sNqLNzrlB8HethfMTFymVpHpfqAz36WnI+qOLLiQ/oVoN
 BysV/LtDOugA==
X-IronPort-AV: E=Sophos;i="5.70,382,1574121600"; d="scan'208";a="14944483"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 30 Jan 2020 14:57:54 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id E1232A1E6D
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2020 14:57:53 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 14:57:53 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 14:57:51 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 30 Jan 2020 14:57:50 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 14:57:41 +0000
Message-ID: <20200130145745.1306-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v8 0/4] purge free_shared_domheap_page()
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
ZGVzdHJveSgpLi4uCiAgYWRkIGEgZG9tYWluX3RvdF9wYWdlcygpIGhlbHBlciBmdW5jdGlvbgog
IG1tOiBtYWtlIHBhZ2VzIGFsbG9jYXRlZCB3aXRoIE1FTUZfbm9fcmVmY291bnQgc2FmZSB0byBh
c3NpZ24KICB4ODYgLyB2bXg6IHVzZSBhIE1FTUZfbm9fcmVmY291bnQgZG9taGVhcCBwYWdlIGZv
cgogICAgQVBJQ19ERUZBVUxUX1BIWVNfQkFTRQoKIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAg
ICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgICAgICB8IDI1ICsrKysr
KysrLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgIHwgMTkgKysrLS0tLS0KIHhl
bi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMgICAgICAgfCAxMCArKy0tLQogeGVuL2FyY2gveDg2L21t
L3NoYWRvdy9jb21tb24uYyB8ICAyICstCiB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICAg
IHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9udW1hLmMgICAgICAgICAgICAgfCAgMiArLQogeGVuL2Fy
Y2gveDg2L3B2L2RvbTBfYnVpbGQuYyAgICB8IDI1ICsrKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYv
cHYvZG9tYWluLmMgICAgICAgIHwgIDIgKy0KIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAg
ICAgfCAgMiArLQogeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jICAgICAgICB8ICA0ICstCiB4ZW4v
Y29tbW9uL2tleWhhbmRsZXIuYyAgICAgICAgIHwgIDIgKy0KIHhlbi9jb21tb24vbWVtb3J5LmMg
ICAgICAgICAgICAgfCAgNCArLQogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgICAgICAgICB8IDc4
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLWFybS9t
bS5oICAgICAgICB8ICA1ICsrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgICB8ICA5
ICsrLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnkuaCAgICAgfCAgNCArLQogeGVuL2luY2x1
ZGUveGVuL3NjaGVkLmggICAgICAgICB8IDI3ICsrKysrKysrKy0tLQogMTggZmlsZXMgY2hhbmdl
ZCwgMTQzIGluc2VydGlvbnMoKyksIDgxIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
