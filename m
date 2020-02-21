Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9243167BEF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 12:24:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j56Ml-00053C-4D; Fri, 21 Feb 2020 11:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9FNp=4J=amazon.co.uk=prvs=313f46acb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j56Mj-00052z-Kk
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 11:21:05 +0000
X-Inumbo-ID: 3edcc0b3-549c-11ea-8629-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3edcc0b3-549c-11ea-8629-12813bfff9fa;
 Fri, 21 Feb 2020 11:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582284065; x=1613820065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZYCSbbtCg+dwnwQqUm2sxhA/+YhvOXxlLk0TeDcgRq4=;
 b=HvfQK4gqTWYEiiHX9jzCHJhHEudpz+IsSOvQhRAbdOgPrgs/DHvL2srK
 E/ECr+SffQwo15dZJrs5qaMUwJsbkl1tjwM9fRIsiisFGwjndf6UXwx2L
 4wYIeYCH2HCKXq1e1zD81XyFqoIBDPgflpL3XC3Ma3IUEyVT0B+u7uaKt g=;
IronPort-SDR: e9Zrit2d5MYFG1ciUxjMnP2Qjs5s4sI0MO+Cs6m2hT5VLl1z0j3Wk0F0ZKyrb0BispI9IOg/H3
 GXvfpKI/sssA==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="18290025"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Feb 2020 11:21:03 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 016C9A173E; Fri, 21 Feb 2020 11:21:01 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 11:21:01 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 11:21:00 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 21 Feb 2020 11:20:58 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Feb 2020 11:20:45 +0000
Message-ID: <20200221112049.3077-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221112049.3077-1-pdurrant@amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v7 2/6] libxl: modify libxl__logv() to only log
 valid domid values
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBjb2RlLXBhdGhzIHVzZSB2YWx1ZXMgb3RoZXIgdGhhbiBJTlZBTElEX0RPTUlEIHRvIGlu
ZGljYXRlIGFuIGludmFsaWQKZG9tYWluIGlkLiBTcGVjaWZpY2FsbHksIHhsIHdpbGwgcGFzcyBh
IHZhbHVlIG9mIDAgd2hlbiBjcmVhdGluZy9yZXN0b3JpbmcKYSBkb21haW4uIFRoZXJlZm9yZSBt
b2RpZnkgbGlieGxfX2xvZ3YoKSB0byB1c2UgbGlieGxfZG9taWRfdmFsaWRfZ3Vlc3QoKQphcyBh
IHZhbGlkaXR5IHRlc3QuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KLS0tCkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+Cgp2NjoKIC0gTmV3IGluIHY2IChzcGxpdCBvdXQgZnJvbSBh
bm90aGVyIHBhdGNoKQotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJu
YWwuYwppbmRleCBiYmQ0YzZjYmE5Li5kOTNhNzU1MzNmIDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9pbnRlcm5hbC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMKQEAg
LTIzNCw3ICsyMzQsNyBAQCB2b2lkIGxpYnhsX19sb2d2KGxpYnhsX2N0eCAqY3R4LCB4ZW50b29s
bG9nX2xldmVsIG1zZ2xldmVsLCBpbnQgZXJybm92YWwsCiAgICAgZmlsZWxpbmVbc2l6ZW9mKGZp
bGVsaW5lKS0xXSA9IDA7CiAKICAgICBkb21haW5bMF0gPSAwOwotICAgIGlmIChkb21pZCAhPSBJ
TlZBTElEX0RPTUlEKQorICAgIGlmIChsaWJ4bF9kb21pZF92YWxpZF9ndWVzdChkb21pZCkpCiAg
ICAgICAgIHNucHJpbnRmKGRvbWFpbiwgc2l6ZW9mKGRvbWFpbiksICJEb21haW4gJSJQUkl1MzIi
OiIsIGRvbWlkKTsKICB4OgogICAgIHh0bF9sb2coY3R4LT5sZywgbXNnbGV2ZWwsIGVycm5vdmFs
LCAibGlieGwiLAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
