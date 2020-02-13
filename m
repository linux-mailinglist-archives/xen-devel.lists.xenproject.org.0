Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539315BD2E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:56:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2C7x-00033B-PL; Thu, 13 Feb 2020 10:53:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3q6q=4B=amazon.co.uk=prvs=305d558ea=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j2C7w-000333-Ru
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:53:48 +0000
X-Inumbo-ID: 1c65b5c7-4e4f-11ea-b882-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c65b5c7-4e4f-11ea-b882-12813bfff9fa;
 Thu, 13 Feb 2020 10:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1581591228; x=1613127228;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TMomwe4CgOTCMd3GBFuRiqu/d8zMyj9AHIqIwbDvZaE=;
 b=cmXVoPYRQeXedi3Ptl+diLwObvIkfhpm1ldQPSCjrT4nqBbcUH/aBGt1
 h6lYC3dMSO3u2oDFTiCyz5ZPmMvKJVur9ali6bkNMyc/yAc0AfrrhfdqC
 8uDBr5QJqw8UO4l/VIZX2yb4qhAEVH63Bau2+42LQGqi/xTwbB8xTXa4o E=;
IronPort-SDR: iri5bwby5+IXUI7h9gg8VlGHXTMgHAfzpQGWyAkQSpJ6W6Xrj/iEEHAogZVIsTlIm2nWOMxJ0k
 77d552qek6cw==
X-IronPort-AV: E=Sophos;i="5.70,436,1574121600"; d="scan'208";a="16927349"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Feb 2020 10:53:34 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 9A73EA28AA; Thu, 13 Feb 2020 10:53:30 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 13 Feb 2020 10:53:30 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 13 Feb 2020 10:53:29 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP Server id
 15.0.1236.3 via Frontend Transport; Thu, 13 Feb 2020 10:53:27 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 13 Feb 2020 10:53:23 +0000
Message-ID: <20200213105325.3022-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v5 0/2] docs: Migration design documents
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICgyKToKICBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBm
b3Igbm9uLWNvb3BlcmF0aXZlIGxpdmUgbWlncmF0aW9uCiAgZG9jcy9kZXNpZ25zOiBBZGQgYSBk
ZXNpZ24gZG9jdW1lbnQgZm9yIG1pZ3JhdGlvbiBvZiB4ZW5zdG9yZSBkYXRhCgogZG9jcy9kZXNp
Z25zL25vbi1jb29wZXJhdGl2ZS1taWdyYXRpb24ubWQgfCAyNzIgKysrKysrKysrKysrKysrKysr
KysrKwogZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZCAgICAgICAgfCAxMzYgKysr
KysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDA4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkb2NzL2Rlc2lnbnMvbm9uLWNvb3BlcmF0aXZlLW1pZ3JhdGlvbi5tZAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGRvY3MvZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQKLS0tCkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxr
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0gCjIuMjAuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
