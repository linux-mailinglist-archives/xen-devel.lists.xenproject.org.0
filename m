Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD018057F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:52:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBj0R-0008QK-H3; Tue, 10 Mar 2020 17:49:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YNok=43=xen.org=prvs=33108a8dd=paul@srs-us1.protection.inumbo.net>)
 id 1jBj0P-0008QF-N8
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:49:25 +0000
X-Inumbo-ID: 7ad70d96-62f7-11ea-b34e-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ad70d96-62f7-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 17:49:25 +0000 (UTC)
IronPort-SDR: CBsV8xoJxO0V8MDOo++6yjaqLg961m4WuameZstQgA22IrrAwVgFmE1xbDwZgdWJ8aLJg+CgDX
 jSrG/5n4Pdrg==
X-IronPort-AV: E=Sophos;i="5.70,537,1574121600"; d="scan'208";a="31778839"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 10 Mar 2020 17:49:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0AA6DA2152; Tue, 10 Mar 2020 17:49:22 +0000 (UTC)
Received: from EX13D32EUB001.ant.amazon.com (10.43.166.125) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 10 Mar 2020 17:49:22 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB001.ant.amazon.com (10.43.166.125) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 10 Mar 2020 17:49:21 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 10 Mar 2020 17:49:19 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 10 Mar 2020 17:49:12 +0000
Message-ID: <20200310174917.1514-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 0/5] remove one more shared xenheap page:
 shared_info
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul
 Durrant <pdurrant@amazon.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Tamas K
 Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpQYXVsIER1cnJhbnQgKDUpOgogIGRv
bWFpbjogaW50cm9kdWNlIGFsbG9jL2ZyZWVfc2hhcmVkX2luZm8oKSBoZWxwZXJzLi4uCiAgbW06
IGtlZXAgUEdDX2V4dHJhIHBhZ2VzIG9uIGEgc2VwYXJhdGUgbGlzdAogIHg4NiAvIGlvcmVxOiB1
c2UgYSBNRU1GX25vX3JlZmNvdW50IGFsbG9jYXRpb24gZm9yIHNlcnZlciBwYWdlcy4uLgogIG1t
OiBhZGQgJ2lzX3NwZWNpYWxfcGFnZScgaW5saW5lIGZ1bmN0aW9uLi4uCiAgZG9tYWluOiB1c2Ug
UEdDX2V4dHJhIGRvbWhlYXAgcGFnZSBmb3Igc2hhcmVkX2luZm8KCiB4ZW4vYXJjaC9hcm0vZG9t
YWluLmMgICAgICAgICAgIHwgMTAgKysrLS0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAg
ICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgIHwgMjIgKysrKysr
KysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgIHwgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L21tLmMgICAg
ICAgICAgICAgICB8IDExICsrKystLS0tCiB4ZW4vYXJjaC94ODYvbW0vYWx0cDJtLmMgICAgICAg
IHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgfCAgMyArLS0KIHhlbi9h
cmNoL3g4Ni9tbS9wMm0tcG9kLmMgICAgICAgfCAxMCArKysrLS0tCiB4ZW4vYXJjaC94ODYvbW0v
c2hhZG93L2NvbW1vbi5jIHwgMTMgKysrKystLS0tCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L211
bHRpLmMgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgICAgfCAgMiArLQog
eGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvdGJv
b3QuYyAgICAgICAgICAgIHwgIDQgKy0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgICAg
IHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vY29tbW9uL2RvbWN0
bC5jICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jICAgICAg
fCAgMyArKysKIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jICAgICAgICAgfCAgMiArLQogeGVuL2Nv
bW1vbi90aW1lLmMgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrKysrLS0KIHhlbi9pbmNsdWRl
L2FzbS14ODYvbW0uaCAgICAgICAgfCAgNiArKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFy
ZWQuaCAgICB8IDE1ICsrKysrKy0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggICAgICAg
IHwgIDMgKysrCiB4ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICAgICAgICAgIHwgMTAgKysrKy0tLQog
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICB8IDE3ICsrKysrKysrKysrLQogeGVuL2lu
Y2x1ZGUveGVuL3NoYXJlZC5oICAgICAgICB8ICAyICstCiAyNSBmaWxlcyBjaGFuZ2VkLCAxNTQg
aW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
Y2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpD
YzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KQ2M6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KQ2M6ICJSb2dlciBQ
YXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
