Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E353B148B53
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 16:34:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv0vd-0006oH-E2; Fri, 24 Jan 2020 15:31:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9iSm=3N=amazon.co.uk=prvs=28596b9bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iv0vc-0006o5-L0
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 15:31:24 +0000
X-Inumbo-ID: 91127c44-3ebe-11ea-8032-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91127c44-3ebe-11ea-8032-12813bfff9fa;
 Fri, 24 Jan 2020 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579879880; x=1611415880;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Q1wh9X9YgGPwS11YTJ3VU4Lw97EYajllSsuAVTLCjg=;
 b=a9Y7mK29DFs9DP72/JGOYJWOUPwvYl/dCaonwznulI0DzJwNqGJKyOsn
 CgZdAvAnr1JFt6AtS3jtEEya+RUIGQ/Gf45eLjpgEXfWD83u8TNIJMVn/
 1Wq3ar9bbs2jGd+YbQcHKmjTpEMMNhu+4H0ce3+poh7oosQxNL3ptZuj1 A=;
IronPort-SDR: 8g3ePaCWpYE2OZwmS/KLy9XD+fA5arQ7B8WZ+/7LgYjR2DFsazMLod77hPFqaOSgniu6O/523S
 sj31IqTsUHag==
X-IronPort-AV: E=Sophos;i="5.70,358,1574121600"; d="scan'208";a="20828990"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 24 Jan 2020 15:31:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1ED81A1800
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2020 15:31:08 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 24 Jan 2020 15:31:07 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 24 Jan 2020 15:31:06 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 24 Jan 2020 15:31:04 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 24 Jan 2020 15:30:56 +0000
Message-ID: <20200124153103.18321-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/7] purge free_shared_domheap_page()
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

VGhlIGxhc3QgcGF0Y2ggaXMgdW5yZWxhdGVkIGNsZWFudXAgZm9yIHNvbWV0aGluZyBJIGhhcHBl
bmVkIHRvIG5vdGljZSBhbG9uZyB0aGUgd2F5LiAKClBhdWwgRHVycmFudCAoNyk6CiAgeDg2IC8g
dm14OiBtYWtlIGFwaWNfYWNjZXNzX21mbiB0eXBlLXNhZmUKICB4ODYgLyBodm06IGFkZCBkb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSBtZXRob2QKICB4ODYgLyBodm06IG1ha2UgZG9tYWlu
X2Rlc3Ryb3koKSBtZXRob2Qgb3B0aW9uYWwKICB4ODYgLyB2bXg6IG1vdmUgdGVhcmRvd24gZnJv
bSBkb21haW5fZGVzdHJveSgpLi4uCiAgbW06IG1ha2UgTUVNRl9ub19yZWZjb3VudCBwYWdlcyBz
YWZlIHRvIGFzc2lnbgogIHg4NiAvIHZteDogdXNlIGEgTUVNRl9ub19yZWZjb3VudCBkb21oZWFw
IHBhZ2UgZm9yCiAgICBBUElDX0RFRkFVTFRfUEhZU19CQVNFCiAgbW06IHJlbW92ZSBkb25hdGVf
cGFnZSgpCgogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgICAgICAgICB8ICA2IC0tLS0KIHhl
bi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgICAgfCAgNyArKystCiB4ZW4vYXJjaC94ODYv
aHZtL210cnIuYyAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5j
ICAgICAgICAgfCAgNSAtLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAgfCAz
NyArKysrKysrKysrKysrKystLS0tLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAg
ICAgIHwgNTEgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL3BhZ2Vf
YWxsb2MuYyAgICAgICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKy0tLS0tLS0KIHhlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaCAgICAgICAgICAgfCAgNSArKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL2h2bS5oICAgICAgfCAgMSArCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1jcy5o
IHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvbW0uaCAgICAgICAgICAgfCAgOSArKystLS0K
IHhlbi9pbmNsdWRlL3hlbi9tbS5oICAgICAgICAgICAgICAgfCAgMiAtLQogMTIgZmlsZXMgY2hh
bmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgOTQgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
