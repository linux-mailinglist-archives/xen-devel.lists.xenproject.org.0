Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4D12312B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:10:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFOy-00069k-V4; Tue, 17 Dec 2019 16:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mCDn=2H=amazon.com=prvs=2471a56b0=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihFOx-00069X-As
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:08:47 +0000
X-Inumbo-ID: 811d5180-20e7-11ea-8f0d-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 811d5180-20e7-11ea-8f0d-12813bfff9fa;
 Tue, 17 Dec 2019 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576598927; x=1608134927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=7iSJLJ2cAmxa8ncDmqLUwW8DH/s+lSnJW62cph+wv5U=;
 b=ny7NtzzHnJSC7OcuXTf6EsyOFfIE4I38EzFitlx+lMYAOPFuYr1kDNKk
 BNADhdVQ0kP4AASfK0/dlRVNAdPrqdhFYVUfQWYFlf7o3/mcFWpHXeCcQ
 dUyqvXzP4MkEvKJm0S4Lg9u/ghyPfqf+FQFNsVRCac7muVWU+azkgdAv/ o=;
IronPort-SDR: H+7E2oqbzQDJhYHLZVbZ3mLGSBt5rsH/mxSWSNhny4Yz5F0CKlFL2triHMLfQosYHORtLD42Qy
 warUym0tFP+A==
X-IronPort-AV: E=Sophos;i="5.69,326,1571702400"; 
   d="scan'208";a="5642913"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 17 Dec 2019 16:08:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id 80819A22EE; Tue, 17 Dec 2019 16:08:45 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 16:08:45 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.179) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 16:08:39 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>, <axboe@kernel.dk>, <konrad.wilk@oracle.com>,
 <roger.pau@citrix.com>
Date: Tue, 17 Dec 2019 17:07:44 +0100
Message-ID: <20191217160748.693-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217160748.693-1-sjpark@amazon.com>
References: <20191217160748.693-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.161.179]
X-ClientProxiedBy: EX13d09UWC002.ant.amazon.com (10.43.162.102) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v11 2/6] xenbus/backend: Protect xenbus callback
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
cy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAxMCArKysrKysrKy0tCiBpbmNs
dWRlL3hlbi94ZW5idXMuaCAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiAzIGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1
c19wcm9iZS5jCmluZGV4IDViNDcxODg5ZDcyMy4uYjg2MzkzZjE3MmU2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c19wcm9iZS5jCkBAIC00NzIsNiArNDcyLDcgQEAgaW50IHhlbmJ1c19wcm9iZV9ub2Rl
KHN0cnVjdCB4ZW5fYnVzX3R5cGUgKmJ1cywKIAkJZ290byBmYWlsOwogCiAJZGV2X3NldF9uYW1l
KCZ4ZW5kZXYtPmRldiwgIiVzIiwgZGV2bmFtZSk7CisJc3Bpbl9sb2NrX2luaXQoJnhlbmRldi0+
cmVjbGFpbV9sb2NrKTsKIAogCS8qIFJlZ2lzdGVyIHdpdGggZ2VuZXJpYyBkZXZpY2UgZnJhbWV3
b3JrLiAqLwogCWVyciA9IGRldmljZV9yZWdpc3RlcigmeGVuZGV2LT5kZXYpOwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgYi9kcml2ZXJzL3hl
bi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwppbmRleCA3ZTc4ZWJlZjdjNTQuLjUxNmFh
NjRiOTk2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNr
ZW5kLmMKKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMKQEAg
LTI1MSwxMiArMjUxLDE4IEBAIHN0YXRpYyBpbnQgYmFja2VuZF9wcm9iZV9hbmRfd2F0Y2goc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwKIHN0YXRpYyBpbnQgYmFja2VuZF9yZWNsYWlt
X21lbW9yeShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEpCiB7CiAJY29uc3Qgc3RydWN0
IHhlbmJ1c19kcml2ZXIgKmRydjsKKwlzdHJ1Y3QgeGVuYnVzX2RldmljZSAqeGRldjsKKwl1bnNp
Z25lZCBsb25nIGZsYWdzOwogCiAJaWYgKCFkZXYtPmRyaXZlcikKIAkJcmV0dXJuIDA7CiAJZHJ2
ID0gdG9feGVuYnVzX2RyaXZlcihkZXYtPmRyaXZlcik7Ci0JaWYgKGRydiAmJiBkcnYtPnJlY2xh
aW1fbWVtb3J5KQotCQlkcnYtPnJlY2xhaW1fbWVtb3J5KHRvX3hlbmJ1c19kZXZpY2UoZGV2KSk7
CisJaWYgKGRydiAmJiBkcnYtPnJlY2xhaW1fbWVtb3J5KSB7CisJCXhkZXYgPSB0b194ZW5idXNf
ZGV2aWNlKGRldik7CisJCXNwaW5fdHJ5bG9ja19pcnFzYXZlKCZ4ZGV2LT5yZWNsYWltX2xvY2ss
IGZsYWdzKTsKKwkJZHJ2LT5yZWNsYWltX21lbW9yeSh4ZGV2KTsKKwkJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmeGRldi0+cmVjbGFpbV9sb2NrLCBmbGFncyk7CisJfQogCXJldHVybiAwOwogfQog
CmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1cy5o
CmluZGV4IGM4NjFjZmI2ZjcyMC4uZDk0NjgzMTMwNjFkIDEwMDY0NAotLS0gYS9pbmNsdWRlL3hl
bi94ZW5idXMuaAorKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaApAQCAtNzYsNiArNzYsOCBAQCBz
dHJ1Y3QgeGVuYnVzX2RldmljZSB7CiAJZW51bSB4ZW5idXNfc3RhdGUgc3RhdGU7CiAJc3RydWN0
IGNvbXBsZXRpb24gZG93bjsKIAlzdHJ1Y3Qgd29ya19zdHJ1Y3Qgd29yazsKKwkvKiAncmVjbGFp
bV9tZW1vcnknIGNhbGxiYWNrIGlzIGNhbGxlZCB3aGlsZSB0aGlzIGxvY2sgaXMgYWNxdWlyZWQg
Ki8KKwlzcGlubG9ja190IHJlY2xhaW1fbG9jazsKIH07CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0
IHhlbmJ1c19kZXZpY2UgKnRvX3hlbmJ1c19kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
