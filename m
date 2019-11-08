Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4856FF43C6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 10:46:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT0mu-0008PM-Vb; Fri, 08 Nov 2019 09:42:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ezUr=ZA=xen.org=prvs=208f1ee2a=paul@srs-us1.protection.inumbo.net>)
 id 1iT0mu-0008PD-4S
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 09:42:40 +0000
X-Inumbo-ID: 19a45626-020c-11ea-a1d4-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19a45626-020c-11ea-a1d4-12813bfff9fa;
 Fri, 08 Nov 2019 09:42:39 +0000 (UTC)
IronPort-SDR: c2+iSJP095cRiIFGgpcEtwz2UYD462FrtmXZzGTQAU8QTxUpJpxDMk10uKq7pRicSyzwzkMNsZ
 aQzuZf+LQVSw==
X-IronPort-AV: E=Sophos;i="5.68,281,1569283200"; 
   d="scan'208";a="5159278"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 08 Nov 2019 09:42:39 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 4982C222A05; Fri,  8 Nov 2019 09:42:38 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 09:42:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 8 Nov 2019 09:42:36 +0000
Received: from u55d8f79c258451.ant.amazon.com (10.125.106.130) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 8 Nov 2019 09:42:35 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 8 Nov 2019 09:42:33 +0000
Message-ID: <1573206153-22090-1-git-send-email-paul@xen.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3] tools/hotpug: only attempt to call 'ip
 route' if there is valid command
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKVGhlIHZpZi1yb3V0ZSBz
Y3JpcHQgc2hvdWxkIG9ubHkgY2FsbCAnaXAgcm91dGUnIHdoZW4gJ2lwY21kJyBoYXMgYmVlbgpz
ZXQsIG90aGVyd2lzZSBpdCB3aWxsIGZhaWwgZHVlIHRvIGFuIGluY29ycmVjdCBjb21tYW5kIHN0
cmluZy4KClRoaXMgcGF0Y2ggYWxzbyBhZGRzIHJvdXRlcyBmb3IgJ3RhcCcgKGkuZS4gZW11bGF0
ZWQpIGRldmljZXMgYXMgd2VsbCBhcwondmlmJyAoaS5lLiBQVikgZGV2aWNlcy4gRW1waXJpY2Fs
bHkgb2ZmbGluZS9vbmxpbmUgY29tbWFuZHMgcmVsYXRlIHRvCid2aWYnIGRldmljZXMsIGFuZCBh
ZGQvcmVtb3ZlIGNvbW1hbmRzIHJlbGF0ZSB0byAndGFwJyBkZXZpY2VzLiBIb3dldmVyLAp0aGlz
IHBhdGNoIHRyZWF0cyB0aGVtIGVxdWFsbHkgYW5kIHVzZXMgJHt0eXBlX2lmfSB0byBkaXN0aW5n
dWlzaC4gQnkKYWRkaW5nIGNhc2VzIGZvciBhZGQvcmVtb3ZlIHRoZSBjb21tYW5kIGxpc3QgYmVj
b21lcyBleGhhdXN0aXZlIGFuZCBoZW5jZQonaXBjbWQnIGlzIGd1YXJhbnRlZWQgdG8gYmUgc2V0
LgoKUm91dGVzIGZvciAndGFwJyBhbmQgJ3ZpZicgZGV2aWNlcyBhcmUgZGlzdGluZ3Vpc2hlZCBi
eSBhIHJvdXRlIG1ldHJpYy4KRW11bGF0ZWQgZGV2aWNlcyBhcmUgdXNlZCBieSBIVk0gZ3Vlc3Rz
IHVudGlsIHRoZXkgYXJlIHVucGx1Z2dlZCwgYXQgd2hpY2gKcG9pbnQgdGhlIFBWIGRldmljZSBi
ZWNvbWVzIGFjdGl2ZS4gVGh1cyAndGFwJyBkZXZpY2VzIHNob3VsZCBnZXQgYSBoaWdoZXIKcHJp
b3JpdHkgKGkuZS4gbG93ZXIgbnVtYmVyZWQpIG1ldHJpYyB0aGFuICd2aWYnIGRldmljZXMuCgpU
aGVyZSBpcyBhbHNvIG9uZSBzbWFsbCB3aGl0ZXNwYWNlIGZpeC4KClNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgp2MzoKIC0g
Rml4IFdlaSdzIGVtYWlsIGFkZHJlc3MKIC0gUmVtb3ZlZCB0ZXN0IG9mICR7aXBjbWR9Cgp2MjoK
IC0gQWRkZWQgcm91dGVzIGZvciAndGFwJyBkZXZpY2VzCiAtIFdoaXRlc3BhY2UgZml4Ci0tLQog
dG9vbHMvaG90cGx1Zy9MaW51eC92aWYtcm91dGUgfCAzMCArKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQogbW9kZSBjaGFuZ2UgMTAwNjQ0ID0+IDEwMDc1NSB0b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1y
b3V0ZQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlIGIvdG9vbHMv
aG90cGx1Zy9MaW51eC92aWYtcm91dGUKb2xkIG1vZGUgMTAwNjQ0Cm5ldyBtb2RlIDEwMDc1NQpp
bmRleCBjMTQ5ZmZjLi4wNTE5OWJmCi0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRl
CisrKyBiL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlCkBAIC0yMiwxMiArMjIsMTYgQEAg
ZGlyPSQoZGlybmFtZSAiJDAiKQogbWFpbl9pcD0kKGRvbTBfaXApCiAKIGNhc2UgIiR7Y29tbWFu
ZH0iIGluCisgICAgYWRkKQorICAgICAgICA7JgogICAgIG9ubGluZSkKICAgICAgICAgaWZjb25m
aWcgJHtkZXZ9ICR7bWFpbl9pcH0gbmV0bWFzayAyNTUuMjU1LjI1NS4yNTUgdXAKICAgICAgICAg
ZWNobyAxID4vcHJvYy9zeXMvbmV0L2lwdjQvY29uZi8ke2Rldn0vcHJveHlfYXJwCiAgICAgICAg
IGlwY21kPSdhZGQnCiAgICAgICAgIGNtZHByZWZpeD0nJwogICAgICAgICA7OworICAgIHJlbW92
ZSkKKyAgICAgICAgOyYKICAgICBvZmZsaW5lKQogICAgICAgICBkb193aXRob3V0X2Vycm9yIGlm
ZG93biAke2Rldn0KICAgICAgICAgaXBjbWQ9J2RlbCcKQEAgLTM1LDEzICszOSwyMyBAQCBjYXNl
ICIke2NvbW1hbmR9IiBpbgogICAgICAgICA7OwogZXNhYwogCi1pZiBbICIke2lwfSIgXSA7IHRo
ZW4KLSAgICAjIElmIHdlJ3ZlIGJlZW4gZ2l2ZW4gYSBsaXN0IG9mIElQIGFkZHJlc3NlcywgdGhl
biBhZGQgcm91dGVzIGZyb20gZG9tMCB0bwotICAgICMgdGhlIGd1ZXN0IHVzaW5nIHRob3NlIGFk
ZHJlc3Nlcy4KLSAgICBmb3IgYWRkciBpbiAke2lwfSA7IGRvCi0gICAgICAke2NtZHByZWZpeH0g
aXAgcm91dGUgJHtpcGNtZH0gJHthZGRyfSBkZXYgJHtkZXZ9IHNyYyAke21haW5faXB9Ci0gICAg
ZG9uZQotZmkKK2Nhc2UgIiR7dHlwZV9pZn0iIGluCisgICAgdGFwKQorCW1ldHJpYz0xCisJOzsK
KyAgICB2aWYpCisJbWV0cmljPTIKKwk7OworICAgICopCisJZmF0YWwgIlVucmVjb2duaXNlZCBp
bnRlcmZhY2UgdHlwZSAke3R5cGVfaWZ9IgorCTs7Citlc2FjCisKKyMgSWYgd2UndmUgYmVlbiBn
aXZlbiBhIGxpc3Qgb2YgSVAgYWRkcmVzc2VzLCB0aGVuIGFkZCByb3V0ZXMgZnJvbSBkb20wIHRv
CisjIHRoZSBndWVzdCB1c2luZyB0aG9zZSBhZGRyZXNzZXMuCitmb3IgYWRkciBpbiAke2lwfSA7
IGRvCisgICAgJHtjbWRwcmVmaXh9IGlwIHJvdXRlICR7aXBjbWR9ICR7YWRkcn0gZGV2ICR7ZGV2
fSBzcmMgJHttYWluX2lwfSBtZXRyaWMgJHttZXRyaWN9Citkb25lCiAKIGhhbmRsZV9pcHRhYmxl
CiAKQEAgLTUwLDUgKzY0LDUgQEAgY2FsbF9ob29rcyB2aWYgcG9zdAogbG9nIGRlYnVnICJTdWNj
ZXNzZnVsIHZpZi1yb3V0ZSAke2NvbW1hbmR9IGZvciAke2Rldn0uIgogaWYgWyAiJHtjb21tYW5k
fSIgPSAib25saW5lIiBdCiB0aGVuCi0gIHN1Y2Nlc3MKKyAgICBzdWNjZXNzCiBmaQotLSAKMi43
LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
