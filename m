Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFEEB3971
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:34:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9pES-0003CE-3l; Mon, 16 Sep 2019 11:31:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9pEP-00039A-3q
 for xen-devel@lists.xen.org; Mon, 16 Sep 2019 11:31:45 +0000
X-Inumbo-ID: 8dce3f12-d875-11e9-b299-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dce3f12-d875-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568633501; x=1600169501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=h/EcPi67Ay019LWMfejEBMe1LxzOgE+GmoRJDs9Vapk=;
 b=Bv2RtKrvj1Txnlpoab2hjs7y/dvNuXKsu9GujKahVAqHaBcHcVlfNngz
 sXabX9GqqxyV9xD/V4AmRPrvWvZHGESfAL2QbIQepei+TnX4f8V5iHaOo
 fr6JuP9lGoeMrCV24XBjQitgYExf9SQ6U0TKtGtjACjqUWWp+OJjTWTJd g=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="421366317"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-af6a10df.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 16 Sep 2019 11:31:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-af6a10df.us-east-1.amazon.com (Postfix) with ESMTPS
 id EE796A22BF; Mon, 16 Sep 2019 11:31:36 +0000 (UTC)
Received: from EX13D03EUC001.ant.amazon.com (10.43.164.245) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:31:23 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D03EUC001.ant.amazon.com (10.43.164.245) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 04:31:22 -0700
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:31:19 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 11:30:52 +0000
Message-ID: <20190916113056.16592-4-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190916113056.16592-1-wipawel@amazon.de>
References: <20190916113056.16592-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 3/7] create-diff-object: Handle optional
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
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
