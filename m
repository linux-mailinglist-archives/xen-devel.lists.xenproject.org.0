Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0DA14C8AC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 11:19:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwkP9-0003nU-5f; Wed, 29 Jan 2020 10:17:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwkP7-0003mt-H3
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 10:17:01 +0000
X-Inumbo-ID: 7d380fdc-4280-11ea-a933-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d380fdc-4280-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580293021; x=1611829021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=evDAGUGw+zz54gSMl7Q0673Sft+/nZsV640lVr+GpD4=;
 b=OT0YssY68TU2Zg2klJINxdASeC7H1OHRIK3jBiUNjDcNLaWsdSZg2+tl
 T8yCaXJV1ocHmEj1wcxHY/kDfc/2mC8XzLGCScEveIfahoor8wpHbAYhV
 ohboGTEj9i8kFLBorm0+oO7Vd9P1YX2oAU1F0h/9sNpSyJBW8NjLbazPn s=;
IronPort-SDR: 07q+lMAS9ijgcHpNEHUSdq7LClwHb0+IlRl20axSnGjCI/NtnpbG+tBWOGK5xV0dL2RnH7bzxk
 T18CBQGg6Zqg==
X-IronPort-AV: E=Sophos;i="5.70,377,1574121600"; d="scan'208";a="14656024"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-22cc717f.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 29 Jan 2020 10:16:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-22cc717f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 52EA2A1CA4; Wed, 29 Jan 2020 10:16:58 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 10:16:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 10:16:56 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 10:16:54 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 10:16:41 +0000
Message-ID: <20200129101643.1394-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129101643.1394-1-pdurrant@amazon.com>
References: <20200129101643.1394-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 2/4] mm: modify domain_adjust_tot_pages() to
 better handle a zero adjustment
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZSBmdW5jdGlvbiB3aWxsIHBvaW50bGVzc2x5IGFjcXVpcmUgYW5kIHJlbGVh
c2UgdGhlIGdsb2JhbAonaGVhcF9sb2NrJyBpbiB0aGlzIGNhc2UuCgpOT1RFOiBObyBjYWxsZXIg
eWV0IGNhbGxzIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKCkgd2l0aCBhIHplcm8gJ3BhZ2VzJwog
ICAgICBhcmd1bWVudCwgYnV0IGEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIG1ha2UgdGhpcyBwb3Nz
aWJsZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4K
LS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDYzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCnY1Ogog
LSBTcGxpdCBvdXQgZnJvbSB0aGUgc3Vic2VxdWVudCAnbWFrZSBNRU1GX25vX3JlZmNvdW50IHBh
Z2VzIHNhZmUgdG8KICAgYXNzaWduJyBwYXRjaCBhcyByZXF1ZXN0ZWQgYnkgSmFuCi0tLQogeGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKaW5kZXggOTE5YTI3MDU4Ny4uMTM1ZTE1YmFlMCAxMDA2NDQKLS0tIGEveGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTQ2
MCw2ICs0NjAsOSBAQCB1bnNpZ25lZCBsb25nIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKHN0cnVj
dCBkb21haW4gKmQsIGxvbmcgcGFnZXMpCiB7CiAgICAgbG9uZyBkb21fYmVmb3JlLCBkb21fYWZ0
ZXIsIGRvbV9jbGFpbWVkLCBzeXNfYmVmb3JlLCBzeXNfYWZ0ZXI7CiAKKyAgICBpZiAoICFwYWdl
cyApCisgICAgICAgIGdvdG8gb3V0OworCiAgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZkLT5w
YWdlX2FsbG9jX2xvY2spKTsKICAgICBkLT50b3RfcGFnZXMgKz0gcGFnZXM7CiAKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
