Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECC124CCE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 17:11:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihbtH-0004mY-4b; Wed, 18 Dec 2019 16:09:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihbtG-0004mT-55
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 16:09:34 +0000
X-Inumbo-ID: c6cd50c7-21b0-11ea-90bb-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6cd50c7-21b0-11ea-90bb-12813bfff9fa;
 Wed, 18 Dec 2019 16:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576685374; x=1608221374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9cG7S6gCd/akoUItnSjeFPXRoADzztwyvT/Hz80pN3k=;
 b=N/hNdTb6SpZ3MR7MjqlvZhPTq4C0kj+4S8mghiAq7QJKY6T4/pesrisN
 xLPzzWH0O4u5935MXL0q9g2rjcHz4NaET+qiZFPBzv19tCDoUf0Y0uFF4
 zc2U/ApTncYn9f4hdXvF6qUmqWUBLeljfsp0We6o8XGBBgff/J1V+hvs/ Q=;
IronPort-SDR: zRljJ65UuE9nc8aSuIw2ZR63VCjGPUmOyRiHSbHwX5y6SZBzB8f/J+WuQBvj9SmSMTVixl5Sqf
 t68QbIbtWGlQ==
X-IronPort-AV: E=Sophos;i="5.69,330,1571702400"; 
   d="scan'208";a="9128918"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 18 Dec 2019 16:09:33 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id C7BF0A1D1D; Wed, 18 Dec 2019 16:09:31 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 16:09:31 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 16:09:30 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 18 Dec 2019 16:09:28 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 16:09:25 +0000
Message-ID: <20191218160926.12538-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers that
 have been consumed...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uZm9yIHBhdGNoZXMgbm90ICh5ZXQpIHVwc3RyZWFtLgoKVGhpcyBwYXRjaCBpcyBzaW1wbHkg
cmVzZXJ2aW5nIHNhdmUgcmVjb3JkIG51bWJlciBzcGFjZSB0byBhdm9pZCB0aGUKcmlzayBvZiBj
bGFzaGVzIGJldHdlZW4gZXhpc3RlbnQgZG93bnN0cmVhbSBjaGFuZ2VzIG1hZGUgYnkgQW1hem9u
IGFuZApmdXR1cmUgdXBzdHJlYW0gY2hhbmdlcyB3aGljaCBtYXkgYmUgaW5jb21wYXRpYmxlLgoK
U2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgotLS0KQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2Vy
IFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJs
aWMvYXJjaC14ODYvaHZtL3NhdmUuaCB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9h
cmNoLXg4Ni9odm0vc2F2ZS5oIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2h2bS9zYXZl
LmgKaW5kZXggYjJhZDNmY2Q3NC4uOWM3Yjg2Njc4ZSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2FyY2gteDg2L2h2bS9zYXZlLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
eDg2L2h2bS9zYXZlLmgKQEAgLTYzOSwxMCArNjM5LDEyIEBAIHN0cnVjdCBodm1fbXNyIHsKIAog
I2RlZmluZSBDUFVfTVNSX0NPREUgIDIwCiAKKy8qIFJhbmdlIDIyIC0gNDAgcmVzZXJ2ZWQgZm9y
IEFtYXpvbiAqLworCiAvKgogICogTGFyZ2VzdCB0eXBlLWNvZGUgaW4gdXNlCiAgKi8KLSNkZWZp
bmUgSFZNX1NBVkVfQ09ERV9NQVggMjAKKyNkZWZpbmUgSFZNX1NBVkVfQ09ERV9NQVggNDAKIAog
I2VuZGlmIC8qIF9fWEVOX1BVQkxJQ19IVk1fU0FWRV9YODZfSF9fICovCiAKLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
