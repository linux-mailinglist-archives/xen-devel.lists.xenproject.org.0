Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34924974D1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Ls3-00017o-P4; Wed, 21 Aug 2019 08:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Ls1-00014G-8t
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:29 +0000
X-Inumbo-ID: acd2f148-c3ec-11e9-ac23-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id acd2f148-c3ec-11e9-ac23-bc764e2007e4;
 Wed, 21 Aug 2019 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375689; x=1597911689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZVbLv5KK6ydhNuAuuxIX8qaTZMZ+ZGlSBBIGMaogF3A=;
 b=U2D8W2wSP6PmvYhWRR+rJTDu7GockHQY7zjmrA8txA+KdFAcL5gH3QvS
 xBDrdpwrXoRTMN5wIiqhpivKeVT9g2u+4YFOnFpzkAOeFhwnKHUPEAchU
 GIOlLW7Ci8QGmplCth4xxJRoYOUuQJozi0UkyT7YR5hw+TFhPUvNK1Qp1 A=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="780419082"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 21 Aug 2019 08:21:28 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id ED134A2075; Wed, 21 Aug 2019 08:21:27 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:12 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:11 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:09 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:40 +0000
Message-ID: <20190821082056.91090-5-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 04/20] livepatch-build: Handle newly created
 object files
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

VXAgdG8gbm93IHRoZSBsaXZlcGF0Y2gtYnVpbGQgaWdub3JlcyBuZXdseSBjcmVhdGVkIG9iamVj
dCBmaWxlcy4KV2hlbiBwYXRjaCBhcHBsaWVzIG5ldyAuYyBmaWxlIGFuZCBhdWdtZW50cyBpdHMg
TWFrZWZpbGUgdG8gYnVpbGQgaXQKdGhlIHJlc3VsdGluZyBvYmplY3QgZmlsZSBpcyBub3QgdGFr
ZW4gaW50byBhY2NvdW50IGZvciBmaW5hbCBsaW5raW5nCnN0ZXAuCgpTdWNoIG5ld2x5IGNyZWF0
ZWQgb2JqZWN0IGZpbGVzIGNhbiBiZSBkZXRlY3RlZCBieSBjb21wYXJpbmcgcGF0Y2hlZC8KYW5k
IG9yaWdpbmFsLyBkaXJlY3RvcmllcyBhbmQgY29waWVkIG92ZXIgdG8gdGhlIG91dHB1dCBkaXJl
Y3RvcnkgZm9yCnRoZSBmaW5hbCBsaW5raW5nIHN0ZXAuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBX
aWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBBbmRyYS1Jcmlu
YSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9l
YmVsIDxkb2ViZWxAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5IDxubWFu
dGhleUBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndh
bGxAY2l0cml4LmNvbT4KLS0tCiBsaXZlcGF0Y2gtYnVpbGQgfCA2ICsrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1idWlsZCBiL2xp
dmVwYXRjaC1idWlsZAppbmRleCA3OTY4MzhjLi4zYzRiZjEzIDEwMDc1NQotLS0gYS9saXZlcGF0
Y2gtYnVpbGQKKysrIGIvbGl2ZXBhdGNoLWJ1aWxkCkBAIC0xNDYsNiArMTQ2LDEyIEBAIGZ1bmN0
aW9uIGNyZWF0ZV9wYXRjaCgpCiAgICAgICAgIGZpCiAgICAgZG9uZQogCisgICAgTkVXX0ZJTEVT
PSQoY29tbSAtMjMgPChjZCBwYXRjaGVkL3hlbiAmJiBmaW5kIC4gLXR5cGUgZiAtbmFtZSAnKi5v
JyB8IHNvcnQpIDwoY2Qgb3JpZ2luYWwveGVuICYmIGZpbmQgLiAtdHlwZSBmIC1uYW1lICcqLm8n
IHwgc29ydCkpCisgICAgZm9yIGkgaW4gJE5FV19GSUxFUzsgZG8KKyAgICAgICAgY3AgInBhdGNo
ZWQvJGkiICJvdXRwdXQvJGkiCisgICAgICAgIENIQU5HRUQ9MQorICAgIGRvbmUKKwogICAgIGlm
IFtbICRFUlJPUiAtbmUgMCBdXTsgdGhlbgogICAgICAgICBkaWUgIiRFUlJPUiBlcnJvcihzKSBl
bmNvdW50ZXJlZCIKICAgICBmaQotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2Vu
dGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1
ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJs
aW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
