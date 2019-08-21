Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A2974B7
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lrv-0000s7-Hf; Wed, 21 Aug 2019 08:21:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lrt-0000ot-CM
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 08:21:21 +0000
X-Inumbo-ID: a7a0a1ca-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7a0a1ca-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375680; x=1597911680;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=sF6kIf5DkCz8gKVAOBESnJmWKCHRu5ZKKFUVFcQqWGE=;
 b=taqzJz5FANpF4A5u1EsFSxJkpvMM+lIk7KK5k+PH3j0C4WBJG4oEg3gK
 TDwxZmQZ7eBXZ5yfSF9oXrDbP4CVux1wseo9+nk+hWkbPkBoJ1dCBMIBr
 li7MN4MzpWbpE9OJ3SHw9qfQ+CdV17aJ2/99Q6J+3B3GC0kv2ZPxbZ3Qv o=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968492"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:21:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 904ABA20B3; Wed, 21 Aug 2019 08:21:19 +0000 (UTC)
Received: from EX13D03EUC004.ant.amazon.com (10.43.164.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:04 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:03 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:02 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 08:20:36 +0000
Message-ID: <20190821082056.91090-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 00/20] livepatch-build-tools: new features and
 fixes
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

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMgdG8gdGhlIGxpdmVwYXRjaCBmdW5j
dGlvbmFsaXR5IGFzCmJyaWVmbHkgZGlzY3Vzc2VkIGR1cmluZyBYZW4gRGV2ZWxvcGVyIFN1bW1p
dCAyMDE5OiBbYV0gYW5kIFtiXS4KSXQgYWxzbyBwcm92aWRlcyBhIGZldyBmaXhlcyBhbmQgc29t
ZSBzbWFsbCBpbXByb3ZlbWVudHMuCgpJTVBST1ZFTUVOVFM6CgoxLiBJZ25vcmUgYnVpbGQgc3lz
dGVtIG9iamVjdCBmaWxlczogWzJdCgoyLiBBbGxvdyB1c2luZyBzeW1saW5rIG5hbWVzIGZvciBo
b3RwYXRjaCBtb2R1bGVzOiBbM10KCiAgU29tZSBidWlsZCBzeXN0ZW1zIG1heSB3YW50IHRvIHVz
ZSBzeW1saW5rcycgbmFtZXMgZm9yIHJlc3VsdGluZwogIGhvdHBhdGNoIG1vZHVsZXMuCiAgIAoz
LiBJbmNsdWRlIGZvciBwcm9jZXNzaW5nIGFsbCBuZXdseSBjcmVhdGVkIG9iamVjdCBmaWxlcywg
cmVzdWx0aW5nCiAgIGZyb20gYnVpbGRpbmcgYW4gYXBwbGllZCBwYXRjaDogWzRdCgogIFRoaXMg
YWxsb3dzIHRvIGFkZCBuZXcgY29kZSBmcm9tIHdpdGhpbiBhZGRpdGlvbmFsLCBwYXRjaC1wcm92
aWRlZAogIGZpbGVzLiBJdCdzIHZlcnkgdXNlZnVsIGZvciBpbmxpbmUgYXNtIGhvdHBhdGNoaW5n
IGFzIHdlbGwgYXMgZm9yCiAgaW50cm9kdWNpbmcgbmV3IGZ1bmN0aW9uYWxpdHkuCgo0LiBBZGQg
aGVscGVyIGZ1bmN0aW9ucyB0byB1bmlmeSBoYW5kbGluZyBvZiB0aGUgY29tbW9uIHNlY3Rpb25z
OgogICBbNV0sIFs2XSwgWzddLCBbOV0KCjUuIERldGVjdCBhbmQgcHVyZ2UgdW5kZWZpbmVkIHN5
bWJvbHMgZnJvbSByZXN1bHRpbmcgb2JqZWN0IGZpbGVzOgogICBbMTJdLCBbMTNdCgogIFRoaXMg
cHJldmVudHMgdGhlIHVuZGVmaW5lZCBzeW1ib2xzIHNuZWFrIGludG8gdGhlIHJlc3VsdGluZyBt
b2R1bGVzLgogIEl0J3MgZXNwZWNpYWxseSB1c2VmdWwgd2hlbiBidWlsZGluZyBzdGFja2VkIGhv
dHBhdGNoIG1vZHVsZXMsIHdoZXJlCiAgZWFjaCBjb25zZWN1dGl2ZSBtb2R1bGUgaXMgYmFzZWQg
b24gYSBwcmV2aW91cyBvbmUuCgo2LiBTdHJpcCByZWR1bmRhbnQgb3IgdHJhbnNpZW50IHN5bWJv
bHMgZnJvbSByZXN1bHRpbmcgb2JqZWN0IGZpbGVzOgogICBbMTldLCBbMjBdCgogIFRoaXMgY2hh
bmdlIGxpbWl0cyB0aGUgc2l6ZSBvZiByZXN1bHRpbmcgbW9kdWxlcyBieSBkcm9wcGluZyB1bm5l
ZWRlZAogIGJpdHMuCgpGSVhFUzoKCjEuIE1ha2UgbGl2ZXBhdGNoLWdjYyB3b3JrIHdpdGggdmFy
aW91cyBnY2MgY29tbWFuZCBuYW1lOiBbMV0KMi4gRGV0ZWN0IHNwZWNpYWwgc2VjdGlvbnMnIGVu
dHJ5IHNpemVzIGF1dG9tYXRpY2FsbHkgYnkKICAgYW5hbHl6aW5nIHhlbi1zeW1zOiBbOF0KCiAg
SW5zdGVhZCBvZiBoYXJkLWNvZGluZyBncm91cCBlbnRyeSBzaXplcywgZGV0ZWN0IHRoZW0gdGhl
IHNhbWUgd2F5CiAgbGludXgga2VybmVsJ3Mga3BhdGNoIGRvZXMuCiAgVGhpcyBmaXhlcyBidWls
ZGluZyBob3RwYXRjaCBtb2R1bGVzIGZvciByZWNlbnQgWGVuLCB3aGVyZSBvbmUgb2YKICB0aGUg
c3BlY2lhbCBzZWN0aW9uJ3MgZW50cnkgc2l6ZXMgY2hhbmdlZC4KCjMuIEZpbHRlciBvdXQgcmVk
dW5kYW50IHN0cmluZ3MgZnJvbSAucm9kYXRhIHNlY3Rpb25zOiBbMTBdCgogIFRoaXMgY2hhbmdl
IGxpbWl0cyB0aGUgc2l6ZSBvZiByZXN1bHRpbmcgbW9kdWxlcyBieSBkcm9wcGluZyB1bm5lZWRl
ZAogIGJpdHMuCgpGRUFUVVJFUzoKCkZvciBkZXRhaWxzIHNlZSBjb3ZlciBsZXR0ZXIgb2YgeGVu
IHNlcmllczogW2NdCgoxLiBpbmRlcGVuZGVudCBtb2R1bGVzIChwYXRjaGVzOiBbMTRdKQoyLiBw
cmUtIGFuZCBwb3N0LSBhcHBseXxyZXZlcnQgYWN0aW9ucyBob29rcyAocGF0Y2hlczogWzE1XSkK
My4gYXBwbHl8cmV2ZXJ0IGFjdGlvbnMgcmVwbGFjZW1lbnQgaG9va3MgKHBhdGNoZXM6IFsxMV0s
IFsxNl0sIFsxN10pCjQuIGlubGluZSBhc20gaG90cGF0Y2hpbmcgZXhwZWN0YXRpb25zIChwYXRj
aGVzOiBbMThdKQoKClthXSBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9EZXNpZ25f
U2Vzc2lvbnNfMjAxOSNMaXZlUGF0Y2hfaW1wcm92ZW1lbnRzX2FuZF9mZWF0dXJlcwpbYl0gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3
L21zZzAwODQ2Lmh0bWwKCltjXSBbUEFUQ0ggMDAvMTRdIGxpdmVwYXRjaDogbmV3IGZlYXR1cmVz
IGFuZCBmaXhlcwoKUGF3ZWwgV2llY3pvcmtpZXdpY3ogKDIwKToKICBbMV0gbGl2ZXBhdGNoLWdj
YzogQWxsb3cgdG9vbGNoYWluIGNvbW1hbmQgd2l0aCB2ZXJzaW9ucwogIFsyXSBsaXZlcGF0Y2gt
Z2NjOiBJZ25vcmUgYnVpbHRfaW4ubyBhbmQgcHJlbGluay5vIG9iamVjdCBmaWxlcwogIFszXSBs
aXZlcGF0Y2gtYnVpbGQ6IERvIG5vdCBmb2xsb3cgZXZlcnkgc3ltbGluayBmb3IgcGF0Y2ggZmls
ZQogIFs0XSBsaXZlcGF0Y2gtYnVpbGQ6IEhhbmRsZSBuZXdseSBjcmVhdGVkIG9iamVjdCBmaWxl
cwogIFs1XSBjb21tb246IEFkZCBpc19zdGFuZGFyZF9zZWN0aW9uKCkgaGVscGVyIGZ1bmN0aW9u
CiAgWzZdIGNvbW1vbjogQWRkIGlzX3JlZmVyZW5jZWRfc2VjdGlvbigpIGhlbHBlciBmdW5jdGlv
bgogIFs3XSBjcmVhdGUtZGlmZi1vYmplY3Q6IEFkZCBpc19zcGVjaWFsX3NlY3Rpb24oKSBoZWxw
ZXIgZnVuY3Rpb24KICBbOF0gbGl2ZXBhdGNoLWJ1aWxkOiBkZXRlY3Qgc3BlY2lhbCBzZWN0aW9u
IGdyb3VwIHNpemVzCiAgWzldIGNyZWF0ZS1kaWZmLW9iamVjdDogQWRkIG5ldyBlbnRyaWVzIHRv
IHNwZWNpYWwgc2VjdGlvbnMgYXJyYXkKICBbMTBdIGNyZWF0ZS1kaWZmLW9iamVjdDogRG8gbm90
IGluY2x1ZGUgYWxsIC5yb2RhdGEgc2VjdGlvbnMKICBbMTFdIGNyZWF0ZS1kaWZmLW9iamVjdDog
RG8gbm90IGNyZWF0ZSBlbXB0eSAubGl2ZXBhdGNoLmZ1bmNzIHNlY3Rpb24KICBbMTJdIGNyZWF0
ZS1kaWZmLW9iamVjdDogRXh0ZW5kIHBhdGNoYWJpbGl0eSB2ZXJpZmljYXRpb246IFNUTl9VTkRF
RgogIFsxM10gY3JlYXRlLWRpZmYtb2JqZWN0OiBTdHJpcCBhbGwgdW5kZWZpbmVkIGVudGlyZXMg
b2Yga25vd24gc2l6ZQogIFsxNF0gbGl2ZXBhdGNoLWJ1aWxkOiBFbWJlZCBoeXBlcnZpc29yIGJ1
aWxkIGlkIGludG8gZXZlcnkgaG90cGF0Y2gKICBbMTVdIGNyZWF0ZS1kaWZmLW9iamVjdDogSGFu
ZGxlIGV4dHJhIHByZS18cG9zdC0gaG9va3MKICBbMTZdIGNyZWF0ZS1kaWZmLW9iamVjdDogSGFu
ZGxlIG9wdGlvbmFsIGFwcGx5fHJldmVydCBob29rcwogIFsxN10gY3JlYXRlLWRpZmYtb2JqZWN0
OiBBZGQgc3VwcG9ydCBmb3IgYXBwbGllZC9yZXZlcnRlZCBtYXJrZXIKICBbMThdIGNyZWF0ZS1k
aWZmLW9iamVjdDogQWRkIHN1cHBvcnQgZm9yIGV4cGVjdGF0aW9ucwogIFsxOV0gbGl2ZXBhdGNo
LWJ1aWxkOiBTdHJpcCB0cmFuc2llbnQgb3IgdW5uZWVkZWQgc3ltYm9scwogIFsyMF0gbGl2ZXBh
dGNoLWJ1aWxkOiBTdHJpcCBhbGwgbWV0YWRhdGEgc3ltYm9scyBmcm9tIGhvdHBhdGNoIG1vZHVs
ZXMKCiBjb21tb24uYyAgICAgICAgICAgICB8ICAzNSArKysrLQogY29tbW9uLmggICAgICAgICAg
ICAgfCAgMTYgKy0KIGNyZWF0ZS1kaWZmLW9iamVjdC5jIHwgNDI1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogbGl2ZXBhdGNoLWJ1aWxkICAgICAg
fCAxMjQgKysrKysrKysrKysrKystCiBsaXZlcGF0Y2gtZ2NjICAgICAgICB8ICAgNSArLQogNSBm
aWxlcyBjaGFuZ2VkLCA1NjQgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgotLSAKMi4x
Ni41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3Ry
LiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2Vy
LCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJn
IHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
