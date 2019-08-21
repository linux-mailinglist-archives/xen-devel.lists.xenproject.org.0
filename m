Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F13974DA
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0LsZ-0002Bf-58; Wed, 21 Aug 2019 08:22:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LsX-00028G-1X
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:22:01 +0000
X-Inumbo-ID: bf96a946-c3ec-11e9-b95f-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf96a946-c3ec-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375720; x=1597911720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=QH2J0Nub2k8+laF1fjjLF3dOm5Yo7wtajyaXvAl27Zc=;
 b=k0XbpTvfDhKkDgjvOYbmZQs3hBAkXPuB9EuEeHcTxREofauSMAEhpACk
 McOODsLSmc6vV/T1lDGK0Ike3gs1dZN8HA8HR5b0kJb9oP4yephCPJHkZ
 t8CoqtojvaILn52jDOM7oPKImls2V8KRD1ZEymQSAsvfVfSuvm9/0HwCk k=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968635"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:22:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id E617FA1F41; Wed, 21 Aug 2019 08:21:59 +0000 (UTC)
Received: from EX13D05EUC004.ant.amazon.com (10.43.164.38) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:38 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUC004.ant.amazon.com (10.43.164.38) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:37 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:35 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:54 +0000
Message-ID: <20190821082056.91090-19-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 18/20] create-diff-object: Add support for
 expectations
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

RXh0ZW5kIGxpdmVwYXRjaF9wYXRjaF9mdW5jIHRvIHN1cHBvcnQgYSBuZXcgZmllbGQ6IGV4cGVj
dC4gVGhpcyBuZXcKZmllbGQgZGVzY3JpYmVzIHRoZSBleHBlY3RlZCBkYXRhLCBpdHMgbGVuZ3Ro
IGFuZCB3aGV0aGVyIGV4cGVjdGF0aW9uCmlzIGVuYWJsZWQuIFRoZSBleHBlY3RhdGlvbidzIGRh
dGEgaXMgb2Ygb3BhcXVlIHBhZGRpbmcgc2l6ZS4KCkJ1bXAgdGhlIHBheWxvYWQgdmVyc2lvbiBm
b3IgaG90cGF0Y2hlcyBidWlsdCB3aXRoIGV4cGVjdGF0aW9ucy4KVGhlIGV4cGVjdGF0aW9ucyBh
cmUgc3VwcG9ydGVkIHN0YXJ0aW5nIGZyb20gdmVyc2lvbiAzIG9mIHRoZSBwYXlsb2FkLgoKQnkg
ZGVmYXVsdCB0aGUgZXhwZWN0YXRpb24gZmllbGQgaXMgemVyby1vdXQgYW5kIHRoZSBleHBlY3Rh
dGlvbiBpcwpkaXNhYmxlZCB1bmxlc3MgZXhwbGljaXRseSBzcGVjaWZpZWQgaW4gdGhlIHBhdGNo
LgoKU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRl
PgotLS0KIGNvbW1vbi5oICAgICAgICAgICAgIHwgMTEgKysrKysrKysrKy0KIGNyZWF0ZS1kaWZm
LW9iamVjdC5jIHwgIDMgKystCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29tbW9uLmggYi9jb21tb24uaAppbmRleCBkOGNk
ZTM1Li43YzZmYjczIDEwMDY0NAotLS0gYS9jb21tb24uaAorKysgYi9jb21tb24uaApAQCAtMTE1
LDYgKzExNSwxNCBAQCBzdHJ1Y3Qga3BhdGNoX2VsZiB7CiB9OwogCiAjZGVmaW5lIFBBVENIX0lO
U05fU0laRSA1CisjZGVmaW5lIE1BWF9SRVBMQUNFTUVOVF9TSVpFIDMxCitzdHJ1Y3QgbGl2ZXBh
dGNoX2V4cGVjdGF0aW9uIHsKKwl1aW50OF90IGVuYWJsZWQgOiAxOworCXVpbnQ4X3QgbGVuIDog
NTsKKwl1aW50OF90IHBhZCA6IDI7CisJdWludDhfdCBkYXRhW01BWF9SRVBMQUNFTUVOVF9TSVpF
XTsKK307Cit0eXBlZGVmIHN0cnVjdCBsaXZlcGF0Y2hfZXhwZWN0YXRpb24gbGl2ZXBhdGNoX2V4
cGVjdGF0aW9uX3Q7CiAKIHN0cnVjdCBsaXZlcGF0Y2hfcGF0Y2hfZnVuYyB7CiAJY2hhciAqbmFt
ZTsKQEAgLTEyMyw5ICsxMzEsMTAgQEAgc3RydWN0IGxpdmVwYXRjaF9wYXRjaF9mdW5jIHsKIAl1
aW50MzJfdCBuZXdfc2l6ZTsKIAl1aW50MzJfdCBvbGRfc2l6ZTsKIAl1aW50OF90IHZlcnNpb247
Ci0JdW5zaWduZWQgY2hhciBwYWRbMzFdOworCXVuc2lnbmVkIGNoYXIgcGFkW01BWF9SRVBMQUNF
TUVOVF9TSVpFXTsKIAl1aW50OF90IGFwcGxpZWQ7CiAJdWludDhfdCBfcGFkWzddOworCWxpdmVw
YXRjaF9leHBlY3RhdGlvbl90IGV4cGVjdDsKIH07CiAKIHN0cnVjdCBzcGVjaWFsX3NlY3Rpb24g
ewpkaWZmIC0tZ2l0IGEvY3JlYXRlLWRpZmYtb2JqZWN0LmMgYi9jcmVhdGUtZGlmZi1vYmplY3Qu
YwppbmRleCBkNTE4NTAzLi43NWRjOWI0IDEwMDY0NAotLS0gYS9jcmVhdGUtZGlmZi1vYmplY3Qu
YworKysgYi9jcmVhdGUtZGlmZi1vYmplY3QuYwpAQCAtMjAxNCwxMCArMjAxNCwxMSBAQCBzdGF0
aWMgdm9pZCBsaXZlcGF0Y2hfY3JlYXRlX3BhdGNoZXNfc2VjdGlvbnMoc3RydWN0IGtwYXRjaF9l
bGYgKmtlbGYsCiAJCQlmdW5jc1tpbmRleF0ub2xkX3NpemUgPSByZXN1bHQuc2l6ZTsKIAkJCWZ1
bmNzW2luZGV4XS5uZXdfYWRkciA9IDA7CiAJCQlmdW5jc1tpbmRleF0ubmV3X3NpemUgPSBzeW0t
PnN5bS5zdF9zaXplOwotCQkJZnVuY3NbaW5kZXhdLnZlcnNpb24gPSAyOworCQkJZnVuY3NbaW5k
ZXhdLnZlcnNpb24gPSAzOwogCQkJbWVtc2V0KGZ1bmNzW2luZGV4XS5wYWQsIDAsIHNpemVvZiBm
dW5jc1tpbmRleF0ucGFkKTsKIAkJCWZ1bmNzW2luZGV4XS5hcHBsaWVkID0gMDsKIAkJCW1lbXNl
dChmdW5jc1tpbmRleF0uX3BhZCwgMCwgc2l6ZW9mIGZ1bmNzW2luZGV4XS5fcGFkKTsKKwkJCW1l
bXNldCgmZnVuY3NbaW5kZXhdLmV4cGVjdCwgMCwgc2l6ZW9mIGZ1bmNzW2luZGV4XS5leHBlY3Qp
OwogCiAJCQkvKgogCQkJICogQWRkIGEgcmVsb2NhdGlvbiB0aGF0IHdpbGwgcG9wdWxhdGUKLS0g
CjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNl
bnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxh
ZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVu
YnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
