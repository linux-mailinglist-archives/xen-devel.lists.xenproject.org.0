Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 951F112A197
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 14:07:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijjrc-0005Lk-5x; Tue, 24 Dec 2019 13:04:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZIBU=2O=amazon.com=prvs=254c36092=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijjra-0005LL-QH
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 13:04:38 +0000
X-Inumbo-ID: f04e20aa-264d-11ea-97ba-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f04e20aa-264d-11ea-97ba-12813bfff9fa;
 Tue, 24 Dec 2019 13:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577192678; x=1608728678;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2mTiwoDQr94VFUioT/jv17cFHf63EnNl+UCH3VetEYU=;
 b=Op4yzOE9SPo8jeuKgEcfXwUNM+J7H6drfZA1mULylh8OOleOGVpgOsgm
 fkXLJjd4Xum9oSzARcZ7+c3jBhmklCbJcJTvudc4mPuWf3KyyhWebNbEz
 Lkz7zoZetRWzp3FozHOqAtg5iQ6EehYuCIgqEUJTEWjA8KBb0ccFxoiBJ 0=;
IronPort-SDR: d/xHKK/ibYqD7NZpJgEXmF63jfF11N4L4DBHfFREsO/a/uFfyQqLPyp1aBTRs6+/rhCiTrT3+A
 W5Ftt61vgZKg==
X-IronPort-AV: E=Sophos;i="5.69,351,1571702400"; 
   d="scan'208";a="6955854"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 24 Dec 2019 13:04:26 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id DDE32A1B58; Tue, 24 Dec 2019 13:04:22 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:22 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 24 Dec 2019 13:04:21 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 24 Dec 2019 13:04:17 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 13:04:10 +0000
Message-ID: <20191224130416.3570-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 0/6] xl/libxl: allow creation of domains with a
 specified domid
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICg2KToKICBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YgSU5WQUxJRF9ET01J
RCB0byB0aGUgQVBJCiAgbGlieGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdAog
IGRvbWN0bDogcmV0dXJuIEVFWElTVCBmcm9tIFhFTl9ET01DVExfY3JlYXRlZG9tYWluLi4uCiAg
ZG9tY3RsOiBzZXQgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gJ3JvdmVyJyBpZiB2YWxpZCBkb21p
ZCBpcwogICAgc3BlY2lmaWVkCiAgbGlieGw6IGFsbG93IGNyZWF0aW9uIG9mIGRvbWFpbnMgd2l0
aCBzcGVjaWZpZWQgb3IgcmFuZG9tIGRvbWlkCiAgeGw6IGFsbG93IHNwZWNpZmllZCBkb21haW4g
aWQgdG8gYmUgdXNlZCBmb3IgY3JlYXRlLCByZXN0b3JlIGFuZAogICAgbWlncmF0ZQoKIGRvY3Mv
bWFuL3hsLjEucG9kLmluICAgICAgICAgfCAzNCArKysrKysrKysrKy0tCiB0b29scy9saWJ4bC9s
aWJ4bC5oICAgICAgICAgIHwgMTYgKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAg
IHwgOTUgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tCiB0b29scy9saWJ4bC9s
aWJ4bF9kbS5jICAgICAgIHwgIDIgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgfCAg
MiArLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICA2ICstLQogdG9vbHMveGwveGwu
aCAgICAgICAgICAgICAgICB8ICAxICsKIHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICAgfCAy
MiArKysrKysrLS0KIHRvb2xzL3hsL3hsX21pZ3JhdGUuYyAgICAgICAgfCA0MiArKysrKysrKysr
KystLS0tCiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgIHwgMzMgKysrKysrKysrKysrKwog
dG9vbHMveGwveGxfcGFyc2UuaCAgICAgICAgICB8ICAyICsKIHRvb2xzL3hsL3hsX3NhdmVyZXN0
b3JlLmMgICAgfCAgOSArKystCiB0b29scy94bC94bF91dGlscy5oICAgICAgICAgIHwgIDIgLQog
dG9vbHMveGwveGxfdm1jb250cm9sLmMgICAgICB8IDIzICsrKysrKy0tLQogeGVuL2NvbW1vbi9k
b21jdGwuYyAgICAgICAgICB8ICA2ICstLQogMTUgZmlsZXMgY2hhbmdlZCwgMjMwIGluc2VydGlv
bnMoKyksIDY1IGRlbGV0aW9ucygtKQotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6
IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
