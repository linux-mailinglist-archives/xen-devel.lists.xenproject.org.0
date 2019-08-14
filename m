Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AB8CEA2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 10:41:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxonU-0005G9-Ks; Wed, 14 Aug 2019 08:38:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+akc=WK=amazon.de=prvs=1223f87df=wipawel@srs-us1.protection.inumbo.net>)
 id 1hxonS-0005G4-Bk
 for xen-devel@lists.xen.org; Wed, 14 Aug 2019 08:38:18 +0000
X-Inumbo-ID: da2ce712-be6e-11e9-b99f-77212d4951d7
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da2ce712-be6e-11e9-b99f-77212d4951d7;
 Wed, 14 Aug 2019 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565771895; x=1597307895;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hgF5KtlUrzKZdER7dHnu2iWFp+5EfDQd214BaFuATeQ=;
 b=cVV5mOLnWH4nGcbFmtuYqhMqa7BjK1kcYbW416Q+HeQr+sIBbdEiPdpM
 QoOlEQX01Y+ZEjYkVsM1wOB6VUnzzeXZ/7gTMzvO0YmDozylnfGQ1dBq6
 3JGXW+EJsWRq9tFZRlAX0Np8tPdzLF4sv3/JaX6zuIP29KDlarbIq4LpJ 0=;
X-IronPort-AV: E=Sophos;i="5.64,384,1559520000"; d="scan'208";a="819722882"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 14 Aug 2019 08:38:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5E651A2342; Wed, 14 Aug 2019 08:38:09 +0000 (UTC)
Received: from EX13D03EUA004.ant.amazon.com (10.43.165.93) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 14 Aug 2019 08:38:08 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUA004.ant.amazon.com (10.43.165.93) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 14 Aug 2019 08:38:07 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 14 Aug 2019 08:38:05 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 14 Aug 2019 08:37:59 +0000
Message-ID: <20190814083759.88961-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-hooks-2 PATCH 1/4] create-diff-object:
 Handle optional apply|revert hooks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com, wipawel@amazon.de,
 konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5jbHVkZSBuZXcgc2VjdGlvbnMgY29udGFpbmluZyBvcHRpb25hbCBhcHBseSBhbmQgcmV2ZXJ0
IGFjdGlvbgpob29rcy4KClRoZSBmb2xsb3dpbmcgbmV3IHNlY3Rpb24gbmFtZXMgYXJlIHN1cHBv
cnRlZDoKICAtIC5saXZlcGF0Y2guaG9va3MuYXBwbHkKICAtIC5saXZlcGF0Y2guaG9va3MucmV2
ZXJ0CgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24u
ZGU+Ci0tLQogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVjdC5j
IGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKaW5kZXggMzQ5M2ZlMS4uMjYzYzdkMiAxMDA2NDQKLS0t
IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKQEAgLTEx
MTgsNiArMTExOCwxNCBAQCBzdGF0aWMgc3RydWN0IHNwZWNpYWxfc2VjdGlvbiBzcGVjaWFsX3Nl
Y3Rpb25zW10gPSB7CiAJCS5uYW1lCQk9ICIubGl2ZXBhdGNoLmhvb2tzLnBvc3RyZXZlcnQiLAog
CQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplLAogCX0sCisJeworCQku
bmFtZQkJPSAiLmxpdmVwYXRjaC5ob29rcy5hcHBseSIsCisJCS5ncm91cF9zaXplCT0gbGl2ZXBh
dGNoX2hvb2tzX2dyb3VwX3NpemUsCisJfSwKKwl7CisJCS5uYW1lCQk9ICIubGl2ZXBhdGNoLmhv
b2tzLnJldmVydCIsCisJCS5ncm91cF9zaXplCT0gbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUs
CisJfSwKIAl7fSwKIH07CiAKQEAgLTE0ODMsNiArMTQ5MSw3IEBAIHN0YXRpYyB2b2lkIGtwYXRj
aF9pbmNsdWRlX2RlYnVnX3NlY3Rpb25zKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQogCiAjZGVm
aW5lIElTX0FDVElPTl9IT09LX1NFQ1RJT04oc2VjdGlvbiwgYWN0aW9uKSAoeyBcCiAgICAgICAg
IElTX0hPT0tfU0VDVElPTihzZWN0aW9uLCAicHJlIiBhY3Rpb24pIHx8IFwKKyAgICAgICAgSVNf
SE9PS19TRUNUSU9OKHNlY3Rpb24sIGFjdGlvbikgfHwgXAogICAgICAgICBJU19IT09LX1NFQ1RJ
T04oc2VjdGlvbiwgInBvc3QiIGFjdGlvbik7IFwKIH0pCiAKQEAgLTE0OTIsNiArMTUwMSw3IEBA
IHN0YXRpYyB2b2lkIGtwYXRjaF9pbmNsdWRlX2RlYnVnX3NlY3Rpb25zKHN0cnVjdCBrcGF0Y2hf
ZWxmICprZWxmKQogCiAjZGVmaW5lIElTX0FDVElPTl9IT09LX1NZTV9OQU1FKHN5bWJvbCwgYWN0
aW9uKSAoeyBcCiAgICAgICAgIElTX0hPT0tfU1lNX05BTUUoc3ltYm9sLCAicHJlIiBhY3Rpb24p
IHx8IFwKKyAgICAgICAgSVNfSE9PS19TWU1fTkFNRShzeW1ib2wsIGFjdGlvbikgfHwgXAogICAg
ICAgICBJU19IT09LX1NZTV9OQU1FKHN5bWJvbCwgInBvc3QiIGFjdGlvbik7IFwKIH0pCiAKLS0g
CjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNl
bnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxh
ZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVu
YnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
