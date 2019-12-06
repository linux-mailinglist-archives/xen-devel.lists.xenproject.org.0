Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49FA115308
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 15:22:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idEQo-0007z4-0r; Fri, 06 Dec 2019 14:18:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJ2M=Z4=amazon.de=prvs=2369f9c3a=snu@srs-us1.protection.inumbo.net>)
 id 1idDyn-0005YT-NA
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 13:49:09 +0000
X-Inumbo-ID: 2c1b27af-182f-11ea-8256-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c1b27af-182f-11ea-8256-12813bfff9fa;
 Fri, 06 Dec 2019 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575640149; x=1607176149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yg/H4rYLdpjMh9EeUO9p3gNSwplJDxuqHR+8symDg3A=;
 b=LTEJgQ5tm4ht+lT8CsKEFqzJS0qYquI4zxI/w20qqP3SpfM3NV5wRvbh
 P/A1iDAI6KS00Jsa+VlZP6jQHfehrb1VBeKUKjh+Y+C8Tj3yHcvcxiY1o
 xsgUI9A+U41WJuh0f2QA6wzD8htECy+JNlj5NGq8zsyMyTEtYII4ET3a8 c=;
IronPort-SDR: FjhXB9JqAJI6AnLIvtS0fINmoBUIYUcB+9FSmhw7O7H4zkwx4pPwr7ol9WV7YDYF8GNVE7iwSL
 9QljUSXCPItg==
X-IronPort-AV: E=Sophos;i="5.69,284,1571702400"; d="scan'208";a="13388569"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 06 Dec 2019 13:48:57 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6334EA2BE3; Fri,  6 Dec 2019 13:48:56 +0000 (UTC)
Received: from EX13D07EUB004.ant.amazon.com (10.43.166.234) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 13:48:55 +0000
Received: from u86a60e9fba0b55.ant.amazon.com (10.43.162.16) by
 EX13D07EUB004.ant.amazon.com (10.43.166.234) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 13:48:51 +0000
From: Stefan Nuernberger <snu@amazon.com>
To: <linux-kernel@vger.kernel.org>
Date: Fri, 6 Dec 2019 14:48:04 +0100
Message-ID: <20191206134804.4537-1-snu@amazon.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [10.43.162.16]
X-ClientProxiedBy: EX13D04UWB004.ant.amazon.com (10.43.161.103) To
 EX13D07EUB004.ant.amazon.com (10.43.166.234)
Precedence: Bulk
X-Mailman-Approved-At: Fri, 06 Dec 2019 14:18:04 +0000
Subject: [Xen-devel] [PATCH] xen/pciback: Prevent NULL pointer dereference
 in quirks_show
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Stefan Nuernberger <snu@amazon.com>,
 Conny Seidel <consei@amazon.de>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Uwe Dannowski <uwed@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogVXdlIERhbm5vd3NraSA8dXdlZEBhbWF6b24uZGU+CgpSZWFkaW5nIC9zeXMvYnVzL3Bj
aS9kcml2ZXJzL3BjaWJhY2svcXVpcmtzIHdoaWxlIHVuYmluZGluZyBjYW4gcmVzdWx0CmluIGRl
cmVmZXJlbmNpbmcgYSBOVUxMIHBvaW50ZXIuIEluc3RlYWQsIHNraXAgcHJpbnRpbmcgaW5mb3Jt
YXRpb24KYWJvdXQgdGhlIGRhbmdsaW5nIHF1aXJrLgoKUmVwb3J0ZWQtYnk6IENvbm55IFNlaWRl
bCA8Y29uc2VpQGFtYXpvbi5kZT4KU2lnbmVkLW9mZi1ieTogVXdlIERhbm5vd3NraSA8dXdlZEBh
bWF6b24uZGU+ClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBOdWVybmJlcmdlciA8c251QGFtYXpvbi5j
b20+CgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCi0tLQogZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYyB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hl
bi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0
dWIuYwppbmRleCAwOTc0MTBhN2NkYjcuLmRhNzI1ZTQ3NDI5NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYworKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFj
ay9wY2lfc3R1Yi5jCkBAIC0xMzQ2LDYgKzEzNDYsOCBAQCBzdGF0aWMgc3NpemVfdCBxdWlya3Nf
c2hvdyhzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2LCBjaGFyICpidWYpCiAJCQkJICAgcXVpcmst
PmRldmlkLnN1YmRldmljZSk7CiAKIAkJZGV2X2RhdGEgPSBwY2lfZ2V0X2RydmRhdGEocXVpcmst
PnBkZXYpOworCQlpZiAoIWRldl9kYXRhKQorCQkJY29udGludWU7CiAKIAkJbGlzdF9mb3JfZWFj
aF9lbnRyeShjZmdfZW50cnksICZkZXZfZGF0YS0+Y29uZmlnX2ZpZWxkcywgbGlzdCkgewogCQkJ
ZmllbGQgPSBjZmdfZW50cnktPmZpZWxkOwotLSAKMi4yMy4wCgoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
