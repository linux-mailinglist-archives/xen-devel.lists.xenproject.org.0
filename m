Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7514CCAA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:41:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoUW-0005r7-DN; Wed, 29 Jan 2020 14:38:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xIWx=3S=amazon.co.uk=prvs=2906e62af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iwoUU-0005qo-BH
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:38:50 +0000
X-Inumbo-ID: 100ccaf4-42a5-11ea-8396-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 100ccaf4-42a5-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580308730; x=1611844730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+0j9VGZpo7pomx+fEDAabRHRZmzylb3yl1hZBMMYBOM=;
 b=pTuDUC6b2Y8n8JniJ0OBCVNuakOOiKP7FLxKyrTD+GgzenQKOsrLv2jg
 oWznGhqDcoEDe5Spq3a7KuTA76GnABFTAaGYFR1OtVI4sYRQmRA7hLPuV
 GBKt+zo7loU8/TkEM3SjkTLWYXuyFVjSoZkAq95Ik+RZLPrLlSukZmPIu A=;
IronPort-SDR: ZBTE9fA13hqIMXtHojxENadLU5qF+yGcwSRUKLL3QbkSJQg/5ghe3PCGGctd8evRZcNfdGdIEv
 05PliOd7SPcg==
X-IronPort-AV: E=Sophos;i="5.70,378,1574121600"; d="scan'208";a="13406334"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 29 Jan 2020 14:38:46 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 938CBA24B0; Wed, 29 Jan 2020 14:38:44 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 29 Jan 2020 14:38:44 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 29 Jan 2020 14:38:43 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 29 Jan 2020 14:38:40 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 14:38:29 +0000
Message-ID: <20200129143831.1369-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129143831.1369-1-pdurrant@amazon.com>
References: <20200129143831.1369-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 2/4] mm: modify domain_adjust_tot_pages() to
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
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KCnY2Ogog
LSBNb2RpZnkgbWVtb3J5X2V4Y2hhbmdlKCkKCnY1OgogLSBTcGxpdCBvdXQgZnJvbSB0aGUgc3Vi
c2VxdWVudCAnbWFrZSBNRU1GX25vX3JlZmNvdW50IHBhZ2VzIHNhZmUgdG8KICAgYXNzaWduJyBw
YXRjaCBhcyByZXF1ZXN0ZWQgYnkgSmFuCi0tLQogeGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgfCAz
ICstLQogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9t
ZW1vcnkuYyBiL3hlbi9jb21tb24vbWVtb3J5LmMKaW5kZXggYzdkMmJhYzQ1Mi4uYTRhNTM3NGQy
NiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYworKysgYi94ZW4vY29tbW9uL21lbW9y
eS5jCkBAIC03MjcsOCArNzI3LDcgQEAgc3RhdGljIGxvbmcgbWVtb3J5X2V4Y2hhbmdlKFhFTl9H
VUVTVF9IQU5ETEVfUEFSQU0oeGVuX21lbW9yeV9leGNoYW5nZV90KSBhcmcpCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChqICogKDFVTCA8PCBleGNoLm91dC5leHRlbnRfb3JkZXIpKSk7
CiAKICAgICAgICAgICAgICAgICBzcGluX2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Ci0gICAg
ICAgICAgICAgICAgZHJvcF9kb21fcmVmID0gKGRlY19jb3VudCAmJgotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAhZG9tYWluX2FkanVzdF90b3RfcGFnZXMoZCwgLWRlY19jb3VudCkp
OworICAgICAgICAgICAgICAgIGRyb3BfZG9tX3JlZiA9ICFkb21haW5fYWRqdXN0X3RvdF9wYWdl
cyhkLCAtZGVjX2NvdW50KTsKICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygmZC0+cGFnZV9h
bGxvY19sb2NrKTsKIAogICAgICAgICAgICAgICAgIGlmICggZHJvcF9kb21fcmVmICkKZGlmZiAt
LWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMK
aW5kZXggOTE5YTI3MDU4Ny4uMTM1ZTE1YmFlMCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMKKysrIGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKQEAgLTQ2MCw2ICs0NjAsOSBA
QCB1bnNpZ25lZCBsb25nIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKHN0cnVjdCBkb21haW4gKmQs
IGxvbmcgcGFnZXMpCiB7CiAgICAgbG9uZyBkb21fYmVmb3JlLCBkb21fYWZ0ZXIsIGRvbV9jbGFp
bWVkLCBzeXNfYmVmb3JlLCBzeXNfYWZ0ZXI7CiAKKyAgICBpZiAoICFwYWdlcyApCisgICAgICAg
IGdvdG8gb3V0OworCiAgICAgQVNTRVJUKHNwaW5faXNfbG9ja2VkKCZkLT5wYWdlX2FsbG9jX2xv
Y2spKTsKICAgICBkLT50b3RfcGFnZXMgKz0gcGFnZXM7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
