Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA478619A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhSR-0003Xs-50; Thu, 08 Aug 2019 12:23:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BHrm=WE=amazon.de=prvs=1160688d3=wipawel@srs-us1.protection.inumbo.net>)
 id 1hvhSP-0003Xm-To
 for xen-devel@lists.xen.org; Thu, 08 Aug 2019 12:23:50 +0000
X-Inumbo-ID: 5dfd7508-b9d7-11e9-bf43-ab86a4908789
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5dfd7508-b9d7-11e9-bf43-ab86a4908789;
 Thu, 08 Aug 2019 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1565267026; x=1596803026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zfluy9OxooAdZWBZYasAC8ZsEchgo63lERiexEBAoHc=;
 b=wH/xm48zXCoEzWAIW9geqXm70iHaLXD6NFIEOR85xzsJvD0DrPRE2KpD
 ZICFLNiQLou9Uv77KqUaEMlx80oi/+KtI0vsyYTLnW/z2fEU5S53QHkAM
 uz4KSS2TyDiGkN25bUP4WtbuRhYff7aQhuBUBl2KcCjuoE+oTroE88n6Q M=;
X-IronPort-AV: E=Sophos;i="5.64,361,1559520000"; d="scan'208";a="817918258"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 08 Aug 2019 12:23:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6022D1A55E1; Thu,  8 Aug 2019 12:23:41 +0000 (UTC)
Received: from EX13D03EUA001.ant.amazon.com (10.43.165.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:23:40 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA001.ant.amazon.com (10.43.165.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 8 Aug 2019 12:23:40 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 8 Aug 2019 12:23:38 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Thu, 8 Aug 2019 12:23:34 +0000
Message-ID: <20190808122334.6671-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190416120716.26269-3-wipawel@amazon.de>
References: <20190416120716.26269-3-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [livepatch-build-tools part2 v2 3/6]
 create-diff-object: Add is_special_section() helper function function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: mpohlack@amazon.de, ross.lagerwall@citrix.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBmdW5jdGlvbiBkZXRlcm1pbmVzLCBiYXNlZCBvbiB0aGUgZ2l2ZW4gc2VjdGlvbiBuYW1l
LCBpZiB0aGUKc2VjdGlvbnMgYmVsb25ncyB0byB0aGUgc3BlY2lhbCBzZWN0aW9ucyBjYXRlZ29y
eS4KCkFkZCBtb3JlIHNwZWNpYWwgc2VjdGlvbnMgdG8gc3BlY2lhbF9zZWN0aW9uc1tdIGFsb25n
IHdpdGggYSBuZXcKdW5kZWZpbmVkX2dyb3VwX3NpemUoKSBoZWxwZXIgZnVuY3Rpb24gcmV0dXJu
aW5nIDAgKHVuZGVmaW5lZCkuCk5ldyBzcGVjaWFsIHNlY3Rpb25zIGFyZTogLmFsdGluc3RyX3Jl
cGxhY2VtZW50LgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxA
YW1hem9uLmRlPgpSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0Bh
bWF6b24uY29tPgpSZXZpZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4K
UmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgotLS0KdjI6
CiogQXBwbGllZCBzdWdnZXN0aW9ucyBmcm9tIFJvc3M6CiAgLSBjb25zdCBmb3IgdGhlIHBhcmFt
ZXRlcgogIC0gcmV1c2luZyBzcGVjaWFsX3NlY3Rpb25zIGFycmF5IHJhdGhlciB0aGFuIGR1cGxp
Y2F0aW5nIGl0CiAgICAqIG1vdmluZyB0aGUgZnVuY3Rpb24gZnJvbSBjb21tb24uYyB0byBjcmVh
dGUtZGlmZi1vYmplY3QuYwogICAgKiBzdHJpY3RseSBjaGVja2luZyBmb3IgZnVsbCBzZWN0aW9u
IG5hbWVzCi0tLQogY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAxMiArKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRpZmYtb2Jq
ZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwppbmRleCA0Njk5YmEwLi4wZGYzZmVhIDEwMDY0
NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYworKysgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwpA
QCAtMTA0NSw2ICsxMDQ1LDE4IEBAIHN0YXRpYyBzdHJ1Y3Qgc3BlY2lhbF9zZWN0aW9uIHNwZWNp
YWxfc2VjdGlvbnNbXSA9IHsKIAl7fSwKIH07CiAKK3N0YXRpYyBpbnQgaXNfc3BlY2lhbF9zZWN0
aW9uKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMpCit7CisJc3RydWN0IHNwZWNpYWxfc2VjdGlv
biAqc3BlY2lhbDsKKworCWZvciAoc3BlY2lhbCA9IHNwZWNpYWxfc2VjdGlvbnM7IHNwZWNpYWwt
Pm5hbWU7IHNwZWNpYWwrKykgeworCQlpZiAoIXN0cmNtcChzZWMtPm5hbWUsIHNwZWNpYWwtPm5h
bWUpKQorCQkJcmV0dXJuIHRydWU7CisJfQorCisJcmV0dXJuIGZhbHNlOworfQorCiBzdGF0aWMg
aW50IHNob3VsZF9rZWVwX3JlbGFfZ3JvdXAoc3RydWN0IHNlY3Rpb24gKnNlYywgaW50IHN0YXJ0
LCBpbnQgc2l6ZSkKIHsKIAlzdHJ1Y3QgcmVsYSAqcmVsYTsKLS0gCjIuMTYuNQoKCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVy
bGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmlj
aApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5
MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
