Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3938414A711
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:22:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6AZ-0007kH-Uv; Mon, 27 Jan 2020 15:19:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5TJ9=3Q=amazon.co.uk=prvs=288783767=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iw6AY-0007kC-0J
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:19:18 +0000
X-Inumbo-ID: 627a2cfc-4118-11ea-8561-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 627a2cfc-4118-11ea-8561-12813bfff9fa;
 Mon, 27 Jan 2020 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580138358; x=1611674358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MOhQDbXASYZVhYqAAJHvyv+pHEkUOIPVcwG9VrumpU4=;
 b=Sb/UOQEexC7M0GHGBB6fYQb6FvAIHGbLsjj0Nv/IGk/9cFSCP+f/HjIu
 wBNIbbEQtraUKSV1gPIX9qcPMAGR8PBq5VivD/8e2GOiCyriGrrqD9w3a
 +2TqT9Pi21FGmnMgxbUmDjj/7OnKJ/INeIEF+s/FH1E2obCzNMPiyawp6 Y=;
IronPort-SDR: xuWLrBPwqiX/fHsA+YOA35Dt53ZuLzS2Zg4MLzj9Ba+0oD44Jub5RkysNcGEBcNyzTCPhdq9lB
 222By44vFsEQ==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="14397635"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 27 Jan 2020 15:19:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1DFD3A2436; Mon, 27 Jan 2020 15:19:13 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 15:19:12 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 15:19:11 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 27 Jan 2020 15:19:09 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 15:19:07 +0000
Message-ID: <20200127151907.2877-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] docs: retrospectively add XS_DIRECTORY_PART to
 the xenstore protocol...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHNwZWNpZmljYXRpb24uCgpUaGlzIHdhcyBhZGRlZCBieSBjb21taXQgMGNhNjRlZDggInhl
bnN0b3JlOiBhZGQgc3VwcG9ydCBmb3IgcmVhZGluZwpkaXJlY3Rvcnkgd2l0aCBtYW55IGNoaWxk
cmVuIiBidXQgbm90IGFkZGVkIHRvIHRoZSBzcGVjaWZpY2F0aW9uIGF0IHRoYXQKcG9pbnQuIEEg
dmVyc2lvbiBvZiB4ZW5zdG9yZWQgc3VwcG9ydGluZyB0aGUgY29tbWFuZCB3YXMgZmlyc3QgcmVs
ZWFzZWQKaW4gWGVuIDQuOS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4KLS0tCkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiBkb2NzL21pc2Mv
eGVuc3RvcmUudHh0IHwgMTMgKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3Jl
LnR4dCBiL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQKaW5kZXggYWUxYjZhOGM2ZS4uYmY0MmU5ZWMz
NyAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dAorKysgYi9kb2NzL21pc2MveGVu
c3RvcmUudHh0CkBAIC0xMjUsOCArMTI1LDkgQEAgVmFsdWVzIGNvbW1vbmx5IGluY2x1ZGVkIGlu
IHBheWxvYWRzIGluY2x1ZGU6CiAKIAogCi1UaGUgZm9sbG93aW5nIGFyZSB0aGUgYWN0dWFsIHR5
cGUgdmFsdWVzLCBpbmNsdWRpbmcgdGhlIHJlcXVlc3QgYW5kCi1yZXBseSBwYXlsb2FkcyBhcyBh
cHBsaWNhYmxlOgorVGhlIGZvbGxvd2luZyBhcmUgdGhlIGFjdHVhbCB0eXBlIHZhbHVlcyBkZWZp
bmVkIGluIGlvL3hzX3dpcmUuaAorKG9taXR0aW5nIHRoZSBYU18gcHJlZml4KSwgaW5jbHVkaW5n
IHRoZSByZXF1ZXN0IGFuZCByZXBseSBwYXlsb2FkcworYXMgYXBwbGljYWJsZToKIAogCiAtLS0t
LS0tLS0tIERhdGFiYXNlIHJlYWQsIHdyaXRlIGFuZCBwZXJtaXNzaW9ucyBvcGVyYXRpb25zIC0t
LS0tLS0tLS0KQEAgLTE1Miw2ICsxNTMsMTQgQEAgRElSRUNUT1JZCQk8cGF0aD58CQkJPGNoaWxk
LWxlYWYtbmFtZT58KgogCWxlYWZuYW1lcy4gIFRoZSByZXN1bHRpbmcgY2hpbGRyZW4gYXJlIGVh
Y2ggbmFtZWQKIAk8cGF0aD4vPGNoaWxkLWxlYWYtbmFtZT4uCiAKK0RJUkVDVE9SWV9QQVJUCQk8
cGF0aD58PGluZGV4fD4JCTxjaGlsZC1sZWFmLW5hbWU+fCoKKwlQZXJmb3JtcyB0aGUgc2FtZSBm
dW5jdGlvbiBhcyBESVJFQ1RPUlksIGJ1dCByZXR1cm5zIGEKKwlzdWItbGlzdCBvZiBjaGlsZHJl
biBzdGFydGluZyBhdCA8aW5kZXg+IGluIHRoZSBvdmVyYWxsCisJY2hpbGQgbGlzdCBhbmQgbGVz
cyB0aGFuIG9yIGVxdWFsIHRvIFhFTlNUT1JFX1BBWUxPQURfTUFYCisJb2N0ZXRzIGluIGxlbmd0
aC4gSWYgPGluZGV4PiBpcyBiZXlvbmQgdGhlIGVuZCBvZiB0aGUKKwlvdmVyYWxsIGNoaWxkIGxp
c3QgdGhlbiB0aGUgcmV0dXJuZWQgc3ViLWxpc3Qgd2lsbCBiZQorCWVtcHR5LgorCiBHRVRfUEVS
TVMJIAk8cGF0aD58CQkJPHBlcm0tYXMtc3RyaW5nPnwrCiBTRVRfUEVSTVMJCTxwYXRoPnw8cGVy
bS1hcy1zdHJpbmc+fCs/CiAJPHBlcm0tYXMtc3RyaW5nPiBpcyBvbmUgb2YgdGhlIGZvbGxvd2lu
ZwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
