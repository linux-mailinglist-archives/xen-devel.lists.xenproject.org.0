Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C52164090
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 10:41:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4LoG-00082i-4M; Wed, 19 Feb 2020 09:38:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0CPD=4H=amazon.co.uk=prvs=311145cb7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4LoE-00082Z-RI
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 09:38:22 +0000
X-Inumbo-ID: 8f621e7e-52fb-11ea-831b-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f621e7e-52fb-11ea-831b-12813bfff9fa;
 Wed, 19 Feb 2020 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582105099; x=1613641099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nwjvhvNDZ5TJrA9O6FDgxmDYYDx5Pg4lumR+mOa6LyU=;
 b=hYNxDXJ2t7Iqw8gaWhyLYUC0KwdKcMf1xUXzjHK79yUx6aTk8rWwcCzT
 EOtrNBYsE4i+iQMm1UovMSlvoFohSLaoYijjvbwxj0wES1aUUzMiQdn4l
 9HeOFZ4UBdXFRW5Mojd8178qaR9oUzcpZUCf/8BRUpI0kvmxBnq2W+tkn s=;
IronPort-SDR: mEscnOst+Q7ohGmJ9e2PJDS/UJ9OTgbXfqSFoNPZJmPk/vlG9ObxLy4p/R8DbkW5NmuD0JY6AV
 4W+Swcdtr6Ww==
X-IronPort-AV: E=Sophos;i="5.70,459,1574121600"; d="scan'208";a="17897396"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 19 Feb 2020 09:38:07 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7E815C0855; Wed, 19 Feb 2020 09:38:04 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 19 Feb 2020 09:38:04 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 19 Feb 2020 09:38:03 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 19 Feb 2020 09:38:01 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 09:37:50 +0000
Message-ID: <20200219093754.2924-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219093754.2924-1-pdurrant@amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 2/6] libxl: modify libxl__logv() to only log
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
YXpvbi5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+Cgp2NjoKIC0gTmV3IGluIHY2IChzcGxpdCBvdXQgZnJvbSBhbm90aGVy
IHBhdGNoKQotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYwpp
bmRleCBiYmQ0YzZjYmE5Li5kOTNhNzU1MzNmIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bF9pbnRlcm5hbC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMKQEAgLTIzNCw3
ICsyMzQsNyBAQCB2b2lkIGxpYnhsX19sb2d2KGxpYnhsX2N0eCAqY3R4LCB4ZW50b29sbG9nX2xl
dmVsIG1zZ2xldmVsLCBpbnQgZXJybm92YWwsCiAgICAgZmlsZWxpbmVbc2l6ZW9mKGZpbGVsaW5l
KS0xXSA9IDA7CiAKICAgICBkb21haW5bMF0gPSAwOwotICAgIGlmIChkb21pZCAhPSBJTlZBTElE
X0RPTUlEKQorICAgIGlmIChsaWJ4bF9kb21pZF92YWxpZF9ndWVzdChkb21pZCkpCiAgICAgICAg
IHNucHJpbnRmKGRvbWFpbiwgc2l6ZW9mKGRvbWFpbiksICJEb21haW4gJSJQUkl1MzIiOiIsIGRv
bWlkKTsKICB4OgogICAgIHh0bF9sb2coY3R4LT5sZywgbXNnbGV2ZWwsIGVycm5vdmFsLCAibGli
eGwiLAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
