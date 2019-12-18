Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B8E1244F1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:46:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWnm-0004sc-7q; Wed, 18 Dec 2019 10:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihWnl-0004sN-1k
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:43:33 +0000
X-Inumbo-ID: 3c217646-2183-11ea-a914-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c217646-2183-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 10:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576665813; x=1608201813;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=+zW5Xl7nIWaH59KtKB8TMfJ8+qGCgB0IlDIGxqn2j8U=;
 b=Myon/dg+lOX3FcaNQKg2+CFD5bYbrwt3b0TuuF0Swuv5Vy0awswWU8Wh
 ptyFQwxboSBL/sskwuCE9lDPlWSY5jCTKXebB9/vtsYDlymcXaslsW7eL
 hbdwk1qi4oIikDC1nVDkT72Ao9bTEhjG5HbInlVOq/MiVhnBaVPW2/Q1p o=;
IronPort-SDR: c0niSukasfQpNaphYn8H13G8sbDU0LWgOwvWZjYo8JngTn00Yd9CGiWJT1PR7ouInXEAfk34MW
 C/20QdjnyhWA==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; 
   d="scan'208";a="5820940"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 18 Dec 2019 10:43:22 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0119EA1927; Wed, 18 Dec 2019 10:43:20 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 18 Dec 2019 10:43:20 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.100) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 10:43:15 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Wed, 18 Dec 2019 11:42:29 +0100
Message-ID: <20191218104232.9606-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218104232.9606-1-sjpark@amazon.com>
References: <20191218104232.9606-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D18UWA003.ant.amazon.com (10.43.160.238) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v12 2/5] xenbus/backend: Protect xenbus callback
 with lock
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, sjpark@amazon.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCidyZWNsYWltX21lbW9yeScg
Y2FsbGJhY2sgY2FuIHJhY2Ugd2l0aCBhIGRyaXZlciBjb2RlIGFzIHRoaXMgY2FsbGJhY2sKd2ls
bCBiZSBjYWxsZWQgZnJvbSBhbnkgbWVtb3J5IHByZXNzdXJlIGRldGVjdGVkIGNvbnRleHQuICBU
byBkZWFsIHdpdGgKdGhlIGNhc2UsIHRoaXMgY29tbWl0IGFkZHMgYSBzcGlubG9jayBpbiB0aGUg
J3hlbmJ1c19kZXZpY2UnLiAgV2hlbmV2ZXIKJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFjayBpcyBj
YWxsZWQsIHRoZSBsb2NrIG9mIHRoZSBkZXZpY2Ugd2hpY2ggcGFzc2VkCnRvIHRoZSBjYWxsYmFj
ayBhcyBpdHMgYXJndW1lbnQgaXMgbG9ja2VkLiAgVGh1cywgZHJpdmVycyByZWdpc3RlcmluZwp0
aGVpciAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIHNob3VsZCBwcm90ZWN0IHRoZSBkYXRhIHRo
YXQgbWlnaHQgcmFjZQp3aXRoIHRoZSBjYWxsYmFjayB3aXRoIHRoZSBsb2NrIGJ5IHRoZW1zZWx2
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgotLS0K
IGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgIHwgIDEgKwogZHJpdmVy
cy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAxMSArKysrKysrKystLQogaW5j
bHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogMyBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5i
dXNfcHJvYmUuYwppbmRleCA1YjQ3MTg4OWQ3MjMuLmI4NjM5M2YxNzJlNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfcHJvYmUuYwpAQCAtNDcyLDYgKzQ3Miw3IEBAIGludCB4ZW5idXNfcHJvYmVfbm9k
ZShzdHJ1Y3QgeGVuX2J1c190eXBlICpidXMsCiAJCWdvdG8gZmFpbDsKIAogCWRldl9zZXRfbmFt
ZSgmeGVuZGV2LT5kZXYsICIlcyIsIGRldm5hbWUpOworCXNwaW5fbG9ja19pbml0KCZ4ZW5kZXYt
PnJlY2xhaW1fbG9jayk7CiAKIAkvKiBSZWdpc3RlciB3aXRoIGdlbmVyaWMgZGV2aWNlIGZyYW1l
d29yay4gKi8KIAllcnIgPSBkZXZpY2VfcmVnaXN0ZXIoJnhlbmRldi0+ZGV2KTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIGIvZHJpdmVycy94
ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKaW5kZXggN2U3OGViZWY3YzU0Li5lODYy
Y2I5MzJjYzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFj
a2VuZC5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCkBA
IC0yNTEsMTIgKzI1MSwxOSBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0
cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCiBzdGF0aWMgaW50IGJhY2tlbmRfcmVjbGFp
bV9tZW1vcnkoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQogewogCWNvbnN0IHN0cnVj
dCB4ZW5idXNfZHJpdmVyICpkcnY7CisJc3RydWN0IHhlbmJ1c19kZXZpY2UgKnhkZXY7CisJdW5z
aWduZWQgbG9uZyBmbGFnczsKIAogCWlmICghZGV2LT5kcml2ZXIpCiAJCXJldHVybiAwOwogCWRy
diA9IHRvX3hlbmJ1c19kcml2ZXIoZGV2LT5kcml2ZXIpOwotCWlmIChkcnYgJiYgZHJ2LT5yZWNs
YWltX21lbW9yeSkKLQkJZHJ2LT5yZWNsYWltX21lbW9yeSh0b194ZW5idXNfZGV2aWNlKGRldikp
OworCWlmIChkcnYgJiYgZHJ2LT5yZWNsYWltX21lbW9yeSkgeworCQl4ZGV2ID0gdG9feGVuYnVz
X2RldmljZShkZXYpOworCQlpZiAoIXNwaW5fdHJ5bG9ja19pcnFzYXZlKCZ4ZGV2LT5yZWNsYWlt
X2xvY2ssIGZsYWdzKSkKKwkJCXJldHVybiAwOworCQlkcnYtPnJlY2xhaW1fbWVtb3J5KHhkZXYp
OworCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ4ZGV2LT5yZWNsYWltX2xvY2ssIGZsYWdzKTsK
Kwl9CiAJcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbmJ1cy5oIGIv
aW5jbHVkZS94ZW4veGVuYnVzLmgKaW5kZXggYzg2MWNmYjZmNzIwLi5kOTQ2ODMxMzA2MWQgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUveGVuL3hlbmJ1cy5oCisrKyBiL2luY2x1ZGUveGVuL3hlbmJ1cy5o
CkBAIC03Niw2ICs3Niw4IEBAIHN0cnVjdCB4ZW5idXNfZGV2aWNlIHsKIAllbnVtIHhlbmJ1c19z
dGF0ZSBzdGF0ZTsKIAlzdHJ1Y3QgY29tcGxldGlvbiBkb3duOwogCXN0cnVjdCB3b3JrX3N0cnVj
dCB3b3JrOworCS8qICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgaXMgY2FsbGVkIHdoaWxlIHRo
aXMgbG9jayBpcyBhY3F1aXJlZCAqLworCXNwaW5sb2NrX3QgcmVjbGFpbV9sb2NrOwogfTsKIAog
c3RhdGljIGlubGluZSBzdHJ1Y3QgeGVuYnVzX2RldmljZSAqdG9feGVuYnVzX2RldmljZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
