Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1444122CF7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 14:35:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihCxx-0005tj-JC; Tue, 17 Dec 2019 13:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qn7z=2H=amazon.com=prvs=247c3a56a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihCxv-0005tW-Tk
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 13:32:43 +0000
X-Inumbo-ID: af4f1e64-20d1-11ea-88e7-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af4f1e64-20d1-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576589556; x=1608125556;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=onLQnvSBL3lNxDnDN4WMJbsPXtOY8gXICW/wG+jHVxA=;
 b=DX2Onx+CBbqICJy+A32L5ZbABHHgxizRgY8e+C5UC+HfABwvEONSK5S2
 7yGj71JaIINr6tkYcpBe3UixFAVLIxCWoQ8Z2DbPeUGRRjoJTrGUCJYb4
 pEcfCZoR5onBAdQTlWkakUUCboCei4+vHnLxecXMlotCkoS/w7FiLVwYi 4=;
IronPort-SDR: wLNC9ZIehASY3f9dI/UiaPPmHOoqvQqvhd83w4KLqwpCJJU/JxA54jXs6vLnq7tEwgK7u4xP8w
 vLdHImIkxGbg==
X-IronPort-AV: E=Sophos;i="5.69,325,1571702400"; d="scan'208";a="15379886"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 17 Dec 2019 13:32:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4C13FA16A1; Tue, 17 Dec 2019 13:32:24 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 13:32:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 13:32:22 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 17 Dec 2019 13:32:20 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 17 Dec 2019 13:32:15 +0000
Message-ID: <20191217133218.27085-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH net-next 0/3] xen-netback: clean-up
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

UGF1bCBEdXJyYW50ICgzKToKICB4ZW4tbmV0YmFjazogbW92ZSBuZXRiYWNrX3Byb2JlKCkgYW5k
IG5ldGJhY2tfcmVtb3ZlKCkgdG8gdGhlIGVuZC4uLgogIHhlbi1uZXRiYWNrOiBzd2l0Y2ggc3Rh
dGUgdG8gSW5pdFdhaXQgYXQgdGhlIGVuZCBvZiBuZXRiYWNrX3Byb2JlKCkuLi4KICB4ZW4tbmV0
YmFjazogcmVtb3ZlICdob3RwbHVnLXN0YXR1cycgb25jZSBpdCBoYXMgc2VydmVkIGl0cyBwdXJw
b3NlCgogZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMgfCAzNTAgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE3MSBpbnNlcnRpb25zKCspLCAx
NzkgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
