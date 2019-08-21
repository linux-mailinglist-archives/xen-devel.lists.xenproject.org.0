Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7090974DC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lsr-0002j3-EF; Wed, 21 Aug 2019 08:22:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lsq-0002ho-9r
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:20 +0000
X-Inumbo-ID: bd554386-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd554386-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375717; x=1597911717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=h/EcPi67Ay019LWMfejEBMe1LxzOgE+GmoRJDs9Vapk=;
 b=kDwh6tHHst0pzimHmB9zfCrvNbZFuskKuZRSe3XMDVnx6lRk/Cjwy8ZN
 76JsgWEPa/YAn1LV8M+C62oMv8NzvGsxO9tNq8uiS2ZEtjtKpsQdCfDVg
 mwVdQaRR3zFiJ09nXqaSI2+P2g4SRVMCOjMGMVfOINMr+AaSRNh/i1TMy s=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="822132954"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Aug 2019 08:21:56 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 223D4A2691; Wed, 21 Aug 2019 08:21:56 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:34 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:33 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:32 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:52 +0000
Message-ID: <20190821082056.91090-17-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 16/20] create-diff-object: Handle optional
 apply|revert hooks
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
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
IGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKaW5kZXggNDRmNGU2Yi4uOTkxOGI2ZSAxMDA2NDQKLS0t
IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMKKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKQEAgLTEx
MTgsNiArMTExOCwxNCBAQCBzdGF0aWMgc3RydWN0IHNwZWNpYWxfc2VjdGlvbiBzcGVjaWFsX3Nl
Y3Rpb25zW10gPSB7CiAJCS5uYW1lCQk9ICIubGl2ZXBhdGNoLmhvb2tzLnBvc3RyZXZlcnQiLAog
CQkuZ3JvdXBfc2l6ZQk9IGxpdmVwYXRjaF9ob29rc19ncm91cF9zaXplLAogCX0sCisJeworCQku
bmFtZQkJPSAiLmxpdmVwYXRjaC5ob29rcy5hcHBseSIsCisJCS5ncm91cF9zaXplCT0gbGl2ZXBh
dGNoX2hvb2tzX2dyb3VwX3NpemUsCisJfSwKKwl7CisJCS5uYW1lCQk9ICIubGl2ZXBhdGNoLmhv
b2tzLnJldmVydCIsCisJCS5ncm91cF9zaXplCT0gbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUs
CisJfSwKIAl7fSwKIH07CiAKQEAgLTE0ODgsNiArMTQ5Niw3IEBAIHN0YXRpYyB2b2lkIGtwYXRj
aF9pbmNsdWRlX2RlYnVnX3NlY3Rpb25zKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmKQogCiAjZGVm
aW5lIElTX0FDVElPTl9IT09LX1NFQ1RJT04oc2VjdGlvbiwgYWN0aW9uKSAoeyBcCiAgICAgICAg
IElTX0hPT0tfU0VDVElPTihzZWN0aW9uLCAicHJlIiBhY3Rpb24pIHx8IFwKKyAgICAgICAgSVNf
SE9PS19TRUNUSU9OKHNlY3Rpb24sIGFjdGlvbikgfHwgXAogICAgICAgICBJU19IT09LX1NFQ1RJ
T04oc2VjdGlvbiwgInBvc3QiIGFjdGlvbik7IFwKIH0pCiAKQEAgLTE0OTcsNiArMTUwNiw3IEBA
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
