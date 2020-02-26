Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E351703D7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:11:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zFH-0006Qh-6n; Wed, 26 Feb 2020 16:09:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6zFF-0006QX-Sb
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:09:09 +0000
X-Inumbo-ID: 50fd4d40-58b2-11ea-9479-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50fd4d40-58b2-11ea-9479-12813bfff9fa;
 Wed, 26 Feb 2020 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582733348; x=1614269348;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h464mqtmwaA+DZNuFDOMX8pc3q8xXvS7rab+S1gw89I=;
 b=OZjvY4Lz0R8CEjJ/wpw2m1n2SHpS5hOFPtwRnFCOBcj37TnKq8gcPk8H
 DNzeWI8flZvU9yVvV6Tp36mEk5IhGMwh8NpqMkswN1wbfW2UdqWsRsdIU
 nJRSkKYGau1QGkVRZtFG+Dyw6pURaG3AxOr6l3Dx/WchpMfAKq9bL58v6 8=;
IronPort-SDR: LOVFwcJtS2dc9lBRTkbREqzu9iaIrKMgwBURe4p0v1g1ApHlnTyaH2uFHT5VHr1fniq4F8Sm+s
 jezHYpLC1EWQ==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="18981234"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Feb 2020 16:08:55 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4E5A7A2C4E
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 16:08:54 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 16:08:54 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 16:08:52 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 16:08:50 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 16:08:45 +0000
Message-ID: <20200226160848.1854-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 0/3] PV driver compatibility fixes
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

UGF1bCBEdXJyYW50ICgzKToKICBsaWJ4bDogY3JlYXRlIGRvbWFpbiAnZXJyb3InIG5vZGUgaW4g
eGVuc3RvcmUKICBsaWJ4bDogbWFrZSBjcmVhdGlvbiBvZiB4ZW5zdG9yZSBzdXNwZW5kIGV2ZW50
IGNoYW5uZWwgbm9kZSBvcHRpb25hbAogIGxpYnhsOiBtYWtlIHRoZSB0b3AgbGV2ZWwgJ2Rldmlj
ZScgbm9kZSBpbiB4ZW5zdG9yZSB3cml0YWJsZS4uLgoKIGRvY3MvbWFuL3hsLmNmZy41LnBvZC5p
biAgICAgICAgfCAgNyArKysrKysrCiBkb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jIHwg
IDUgKysrKysKIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgICAgfCAxMyArKysrKysrKysr
KystCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICAgIHwgMTcgKysrKysrKysrKysrKy0t
LS0KIHRvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbCAgICAgfCAgMSArCiB0b29scy94bC94bF9w
YXJzZS5jICAgICAgICAgICAgIHwgIDMgKysrCiA2IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
