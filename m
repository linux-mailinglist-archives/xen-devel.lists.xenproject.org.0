Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E6F353E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 18:00:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSl7B-0007ng-Pv; Thu, 07 Nov 2019 16:58:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Vjs=Y7=xen.org=prvs=2076b1721=paul@srs-us1.protection.inumbo.net>)
 id 1iSl7A-0007nb-QD
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 16:58:32 +0000
X-Inumbo-ID: d4644b0a-017f-11ea-a1ca-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4644b0a-017f-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 16:58:32 +0000 (UTC)
IronPort-SDR: I7uB3tDteLS/Q3I/5I7ytLetmQ5r+HzfAq12xHdJtwfaoB1aC5H/3hrRw4qwcuCCmRf5YmwKdT
 ilocNNNJC+tg==
X-IronPort-AV: E=Sophos;i="5.68,278,1569283200"; 
   d="scan'208";a="2694206"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 07 Nov 2019 16:58:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2930AA27F8; Thu,  7 Nov 2019 16:58:24 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 7 Nov 2019 16:58:23 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 7 Nov 2019 16:58:22 +0000
Received: from u55d8f79c258451.ant.amazon.com (10.125.106.130) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 7 Nov 2019 16:58:20 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 7 Nov 2019 16:58:14 +0000
Message-ID: <1573145894-13305-1-git-send-email-paul@xen.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] tools/hotpug: only attempt to call 'ip
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
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKVGhlIHZpZi1yb3V0ZSBz
Y3JpcHQgc2hvdWxkIG9ubHkgY2FsbCAnaXAgcm91dGUnIHdoZW4gJ2lwY21kJyBoYXMgYmVlbgpz
ZXQsIG90aGVyd2lzZSBpdCB3aWxsIGZhaWwgZHVlIHRvIGFuIGluY29ycmVjdCBjb21tYW5kIHN0
cmluZy4KClRoaXMgcGF0Y2ggYWxzbyBhZGRzIHJvdXRlcyBmb3IgJ3RhcCcgKGkuZS4gZW11bGF0
ZWQpIGRldmljZXMgYXMgd2VsbCBhcwondmlmJyAoaS5lLiBQVikgZGV2aWNlcyBieSBtYWtpbmcg
dXNlIG9mIHRoZSByb3V0ZSBtZXRyaWMuIEVtdWxhdGVkCmRldmljZXMgYXJlIHVzZWQgYnkgSFZN
IGd1ZXN0cyB1bnRpbCB0aGV5IGFyZSB1bnBsdWdnZWQsIGF0IHdoaWNoIHBvaW50IHRoZQpQViBk
ZXZpY2UgYmVjb21lcyBhY3RpdmUuIFRodXMgJ3RhcCcgZGV2aWNlcyBzaG91bGQgZ2V0IGEgaGln
aGVyIHByaW9yaXR5CihpLmUuIGxvd2VyIG51bWJlcmVkKSBtZXRyaWMgdGhhbiAndmlmJyBkZXZp
Y2VzLgoKVGhlcmUgaXMgYWxzbyBvbmUgc21hbGwgd2hpdGVzcGFjZSBmaXguCgpOT1RFOiBFbXBp
cmljYWxseSBvZmZsaW5lL29ubGluZSBjb21tYW5kcyByZWxhdGUgdG8gJ3ZpZicgZGV2aWNlcywg
YW5kCiAgICAgIGFkZC9yZW1vdmUgY29tbWFuZHMgcmVsYXRlIHRvICd0YXAnIGRldmljZXMuIEhv
d2V2ZXIsIHRoaXMgcGF0Y2gKICAgICAgdHJlYXRzIHRoZW0gZXF1YWxseSBhbmQgdXNlcyAke3R5
cGVfaWZ9IHRvIGRpc3Rpbmd1aXNoLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgotLS0KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9ob3Rw
bHVnL0xpbnV4L3ZpZi1yb3V0ZSB8IDIyICsrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogbW9kZSBjaGFuZ2UgMTAw
NjQ0ID0+IDEwMDc1NSB0b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZQoKZGlmZiAtLWdpdCBh
L3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlIGIvdG9vbHMvaG90cGx1Zy9MaW51eC92aWYt
cm91dGUKb2xkIG1vZGUgMTAwNjQ0Cm5ldyBtb2RlIDEwMDc1NQppbmRleCBjMTQ5ZmZjLi5lNzFh
Y2FlCi0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlCisrKyBiL3Rvb2xzL2hvdHBs
dWcvTGludXgvdmlmLXJvdXRlCkBAIC0yMiwxMiArMjIsMTYgQEAgZGlyPSQoZGlybmFtZSAiJDAi
KQogbWFpbl9pcD0kKGRvbTBfaXApCiAKIGNhc2UgIiR7Y29tbWFuZH0iIGluCisgICAgYWRkKQor
ICAgICAgICA7JgogICAgIG9ubGluZSkKICAgICAgICAgaWZjb25maWcgJHtkZXZ9ICR7bWFpbl9p
cH0gbmV0bWFzayAyNTUuMjU1LjI1NS4yNTUgdXAKICAgICAgICAgZWNobyAxID4vcHJvYy9zeXMv
bmV0L2lwdjQvY29uZi8ke2Rldn0vcHJveHlfYXJwCiAgICAgICAgIGlwY21kPSdhZGQnCiAgICAg
ICAgIGNtZHByZWZpeD0nJwogICAgICAgICA7OworICAgIHJlbW92ZSkKKyAgICAgICAgOyYKICAg
ICBvZmZsaW5lKQogICAgICAgICBkb193aXRob3V0X2Vycm9yIGlmZG93biAke2Rldn0KICAgICAg
ICAgaXBjbWQ9J2RlbCcKQEAgLTM1LDExICszOSwyMyBAQCBjYXNlICIke2NvbW1hbmR9IiBpbgog
ICAgICAgICA7OwogZXNhYwogCi1pZiBbICIke2lwfSIgXSA7IHRoZW4KK2Nhc2UgIiR7dHlwZV9p
Zn0iIGluCisgICAgdGFwKQorCW1ldHJpYz0xCisJOzsKKyAgICB2aWYpCisJbWV0cmljPTIKKwk7
OworICAgICopCisJZmF0YWwgIlVucmVjb2duaXNlZCBpbnRlcmZhY2UgdHlwZSAke3R5cGVfaWZ9
IgorCTs7Citlc2FjCisKK2lmIFsgIiR7aXBjbWR9IiBdIDsgdGhlbgogICAgICMgSWYgd2UndmUg
YmVlbiBnaXZlbiBhIGxpc3Qgb2YgSVAgYWRkcmVzc2VzLCB0aGVuIGFkZCByb3V0ZXMgZnJvbSBk
b20wIHRvCiAgICAgIyB0aGUgZ3Vlc3QgdXNpbmcgdGhvc2UgYWRkcmVzc2VzLgogICAgIGZvciBh
ZGRyIGluICR7aXB9IDsgZG8KLSAgICAgICR7Y21kcHJlZml4fSBpcCByb3V0ZSAke2lwY21kfSAk
e2FkZHJ9IGRldiAke2Rldn0gc3JjICR7bWFpbl9pcH0KKyAgICAgICR7Y21kcHJlZml4fSBpcCBy
b3V0ZSAke2lwY21kfSAke2FkZHJ9IGRldiAke2Rldn0gc3JjICR7bWFpbl9pcH0gbWV0cmljICR7
bWV0cmljfQogICAgIGRvbmUKIGZpCiAKQEAgLTUwLDUgKzY2LDUgQEAgY2FsbF9ob29rcyB2aWYg
cG9zdAogbG9nIGRlYnVnICJTdWNjZXNzZnVsIHZpZi1yb3V0ZSAke2NvbW1hbmR9IGZvciAke2Rl
dn0uIgogaWYgWyAiJHtjb21tYW5kfSIgPSAib25saW5lIiBdCiB0aGVuCi0gIHN1Y2Nlc3MKKyAg
ICBzdWNjZXNzCiBmaQotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
