Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42611308E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:14:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYBT-0003c2-Iy; Wed, 04 Dec 2019 17:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQYo=Z2=amazon.com=prvs=234ed30ac=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icYBR-0003bQ-VH
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:11:25 +0000
X-Inumbo-ID: 1a7ecd74-16b9-11ea-9c09-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a7ecd74-16b9-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575479486; x=1607015486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=02jgDe5Z6CcIvWpKex0T++cSAEb6B3ceqkt8IF22gQo=;
 b=cDnEDGzhUKYRQ5vV/6ViBH3pn+xhFgiGHOeM0yrewAZ6RxJ6BGBdndRK
 Xx517ny4nBwskERZQt6Tu+x5hOEysF7oZFoMKsig0JXmK1/fyN97OBZqN
 QHJL+PzwP7w/3GCNYVjPu0w2r9yGsLnJQjaSKpHvpYK28SR//L7Ejkuxd Q=;
IronPort-SDR: dzOlFmCm8mRD5GmdyXds9fTbjhfrOKq2reZyBT4JETNAasP5dFzlGofnhowv9j0I1cKNEXthNM
 kIq/q8K39RNQ==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="7077287"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 04 Dec 2019 17:11:24 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id D822AA2131; Wed,  4 Dec 2019 17:11:23 +0000 (UTC)
Received: from EX13D23UWA004.ant.amazon.com (10.43.160.72) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:13 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D23UWA004.ant.amazon.com (10.43.160.72) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 17:11:13 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 17:11:12 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 4 Dec 2019 17:10:59 +0000
Message-ID: <8d396401c9cf40b8b593d2cf49b07f7bd5d422cf.1575477921.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 7/9] x86/mm: make sure there is one exit path
 for modify_xen_mappings
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCldlIHdpbGwgc29vbiBuZWVkIHRv
IGhhbmRsZSBkeW5hbWljYWxseSBtYXBwaW5nIC8gdW5tYXBwaW5nIHBhZ2UKdGFibGVzIGluIHRo
ZSBzYWlkIGZ1bmN0aW9uLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8
aG9uZ3l4aWFAYW1hem9uLmNvbT4KCi0tLQpDaGFuZ2VkIHNpbmNlIHYzOgotIHJlbW92ZSBhc3Nl
cnRzIG9uIHJjIHNpbmNlIGl0IG5ldmVyIGdldHMgY2hhbmdlZCB0byBhbnl0aGluZyBlbHNlLgot
LS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgMTIgKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZjUzMGRkMzkxYy4uNGM2NTljMjhkOCAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAg
LTU1ODQsNiArNTU4NCw3IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcg
cywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgbDFfcGdlbnRyeV90ICpw
bDFlOwogICAgIHVuc2lnbmVkIGludCAgaTsKICAgICB1bnNpZ25lZCBsb25nIHYgPSBzOworICAg
IGludCByYyA9IC1FTk9NRU07CiAKICAgICAvKiBTZXQgb2YgdmFsaWQgUFRFIGJpdHMgd2hpY2gg
bWF5IGJlIGFsdGVyZWQuICovCiAjZGVmaW5lIEZMQUdTX01BU0sgKF9QQUdFX05YfF9QQUdFX1JX
fF9QQUdFX1BSRVNFTlQpCkBAIC01NjI3LDcgKzU2MjgsOCBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBw
aW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQgaW50IG5mKQog
ICAgICAgICAgICAgLyogUEFHRTFHQjogc2hhdHRlciB0aGUgc3VwZXJwYWdlIGFuZCBmYWxsIHRo
cm91Z2guICovCiAgICAgICAgICAgICBsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAg
ICAgICAgICBpZiAoICFsMnQgKQotICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOworICAg
ICAgICAgICAgICAgIGdvdG8gb3V0OworCiAgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEwy
X1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQogICAgICAgICAgICAgICAgIGwyZV93cml0ZShsMnQg
KyBpLAogICAgICAgICAgICAgICAgICAgICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4o
KnBsM2UpICsKQEAgLTU2ODQsNyArNTY4Niw4IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVu
c2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpCiAgICAgICAg
ICAgICAgICAgLyogUFNFOiBzaGF0dGVyIHRoZSBzdXBlcnBhZ2UgYW5kIHRyeSBhZ2Fpbi4gKi8K
ICAgICAgICAgICAgICAgICBsMXQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7CiAgICAgICAgICAg
ICAgICAgaWYgKCAhbDF0ICkKLSAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cisg
ICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OworCiAgICAgICAgICAgICAgICAgZm9yICggaSA9
IDA7IGkgPCBMMV9QQUdFVEFCTEVfRU5UUklFUzsgaSsrICkKICAgICAgICAgICAgICAgICAgICAg
bDFlX3dyaXRlKCZsMXRbaV0sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsMWVfZnJv
bV9wZm4obDJlX2dldF9wZm4oKnBsMmUpICsgaSwKQEAgLTU4MTcsNyArNTgyMCwxMCBAQCBpbnQg
bW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5z
aWduZWQgaW50IG5mKQogICAgIGZsdXNoX2FyZWEoTlVMTCwgRkxVU0hfVExCX0dMT0JBTCk7CiAK
ICN1bmRlZiBGTEFHU19NQVNLCi0gICAgcmV0dXJuIDA7CisgICAgcmMgPSAwOworCisgb3V0Ogor
ICAgIHJldHVybiByYzsKIH0KIAogI3VuZGVmIGZsdXNoX2FyZWEKLS0gCjIuMTcuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
