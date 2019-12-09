Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567C116C89
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:51:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHWq-0000Zu-Ft; Mon, 09 Dec 2019 11:48:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GJJV=Z7=amazon.com=prvs=239d6c11c=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ieHWp-0000Ze-LG
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:48:39 +0000
X-Inumbo-ID: d594fdf4-1a79-11ea-87bf-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d594fdf4-1a79-11ea-87bf-12813bfff9fa;
 Mon, 09 Dec 2019 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575892117; x=1607428117;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=j+wF7bTo/l8UjtS6L5U+uXYMVRNysLbxs2hoFdAwEdk=;
 b=Ynu5Fr/5XIA/DSiG49AMAhlWjYWZYBJKgff6/ULsAl0Ry7A2dtlZzdN7
 5cULQaB6clcd7mVoKHCgE+fJYomxVT/2YshT/uCA3yZT65tYsG6wse7js
 PuO5tc8ONB8WhW0TJhsgjtYp0MJbGZ2fGRv6GfZMfU2/BqBmdYGP0LZYn s=;
IronPort-SDR: UHoTuEzEn7e0uayn47lda9Ugsr2YNIRaUCVYWlwKEftCPJ5RpbdHiKbqSrfZ65WCZYH/o2i1SG
 3vizqsGkuuHw==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; d="scan'208";a="13789273"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 09 Dec 2019 11:48:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 48EB4A1BF1; Mon,  9 Dec 2019 11:48:14 +0000 (UTC)
Received: from EX13D37EUB001.ant.amazon.com (10.43.166.31) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 11:48:13 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D37EUB001.ant.amazon.com (10.43.166.31) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 11:48:12 +0000
Received: from u60d575063b1f53.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 9 Dec 2019 11:48:11 +0000
From: Hongyan Xia <hongyxia@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 9 Dec 2019 11:48:08 +0000
Message-ID: <cover.1575891620.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/2] Refactor super page shattering
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jgrall@amazon.com,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bWFwX3BhZ2VzX3RvX3hlbiBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyB1c2UgYWxtb3N0IGV4YWN0
bHkgdGhlIHNhbWUKcGFnZSBzaGF0dGVyaW5nIGxvZ2ljLCBhbmQgdGhlIGNvZGUgaXMgbWluZ2xl
ZCB3aXRoIG90aGVyIFBURQptYW5pcHVsYXRpb25zIHNvIGl0IGlzIGxlc3Mgb2J2aW91cyB0aGF0
IHRoZSBpbnRlbnRpb24gaXMgcGFnZQpzaGF0dGVyaW5nLiBGYWN0b3Igb3V0IHRoZSBmdW5jdGlv
bnMgdG8gbWFrZSB0aGVtIHJldXNhYmxlIGFuZCB0byBtYWtlCnRoZSBpbnRlbnRpb24gbW9yZSBv
YnZpb3VzLgoKT2YgY291cnNlLCB0aGVyZSBpcyBub3QgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4g
dGhlIHNoYXR0ZXJpbmcgbG9naWMgb2YKZWFjaCBsZXZlbCwgc28gd2UgY291bGQgZnVydGhlciB0
dXJuIHRoZSBwZXItbGV2ZWwgZnVuY3Rpb25zIGludG8gYQpzaW5nbGUgbWFjcm8sIGFsdGhvdWdo
IHRoaXMgaXMgbm90IHRoYXQgc2ltcGxlIHNpbmNlIHdlIGhhdmUgcGVyLWxldmVsCmZ1bmN0aW9u
cyBhbmQgbWFjcm9zIGFsbCBvdmVyIHRoZSBwbGFjZSBhbmQgdGhlcmUgYXJlIHNsaWdodCBkaWZm
ZXJlbmNlcwpiZXR3ZWVuIGxldmVscy4gS2VlcCBpdCBwZXItbGV2ZWwgZm9yIG5vdy4KCnRyZWU6
Cmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9oeDI0Mi94ZW4uZ2l0IGlu
dF9yZXZpZXcKCi0tLQpDaGFuZ2VzIGluIHYyOgotIHJlYmFzZS4KLSBpbXByb3ZlIGFzbSBjb2Rl
LgotIGF2b2lkIHN0YWxlIHZhbHVlcyB3aGVuIHRha2luZyB0aGUgbG9jay4KLSBtb3ZlIGFsbG9j
YXRpb24gb2YgUFRFIHRhYmxlcyBpbnNpZGUgdGhlIHNoYXR0ZXIgZnVuY3Rpb24uCgpIb25neWFu
IFhpYSAoMik6CiAgeDg2L21tOiBmYWN0b3Igb3V0IHRoZSBjb2RlIGZvciBzaGF0dGVyaW5nIGFu
IGwzIFBURQogIHg4Ni9tbTogZmFjdG9yIG91dCB0aGUgY29kZSBmb3Igc2hhdHRlcmluZyBhbiBs
MiBQVEUKCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDE5MiArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOTYgaW5zZXJ0aW9ucygrKSwg
OTYgZGVsZXRpb25zKC0pCgotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
