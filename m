Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A01703D8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:11:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zFV-0006Up-QR; Wed, 26 Feb 2020 16:09:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6zFU-0006UW-Ph
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:09:24 +0000
X-Inumbo-ID: 5739e9de-58b2-11ea-9479-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5739e9de-58b2-11ea-9479-12813bfff9fa;
 Wed, 26 Feb 2020 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582733358; x=1614269358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rm4ct81g1GB+rc7AStY5Fd8oH2j8SbWwG/K7pPUEH+Q=;
 b=pf+tLn00wSh3RtKzDhe0CYVcWNpqG4fg9wo2D6IcIWBmomG3eLVVY5IT
 Y86KWKP49h6jPOrWFz/S608sQLsZ7Lz4uhNyfpDSfi5e2UKjDRK//vdz6
 hA2+1OoPHZQEDlES5KiB9blS9xiB48WA7eJzBglVt3JM8wy0bmttdXdU5 o=;
IronPort-SDR: WzEiQDEoe1yLtwgLgvMPpTIIEXnCASpcAR9zH7gxu3yVUXQI49yo084nFzSL8WpeeIpFU6pHPI
 r7550Q455xug==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="18688112"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Feb 2020 16:09:05 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-a7fdc47a.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5CB9DC63B8; Wed, 26 Feb 2020 16:09:04 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 16:09:03 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 16:09:02 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 16:09:00 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 16:08:48 +0000
Message-ID: <20200226160848.1854-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226160848.1854-1-pdurrant@amazon.com>
References: <20200226160848.1854-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 3/3] libxl: make the top level 'device' node in
 xenstore writable...
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIGJ5IHRoZSBndWVzdC4KClNpbmNlIHRoaXMgbm9kZSBpcyBjcmVhdGVkIGxhcmdlbHkgdG8g
aG9zdCB0aGUgZnJvbnRlbmQgYXJlYXMgZm9yIFBWCmRldmljZXMsIGFsbCBvZiB3aGljaCBhcmUg
ZnVsbHkgZ3Vlc3Qtd3JpdGFibGUsIHRoZXJlIHNlZW1zIGxpdHRsZSBwb2ludAppbiBtYWtpbmcg
dGhlIHRvcCBsZXZlbCBub2RlIHJlYWQtb25seS4gT3RoZXIgdG9vbHN0YWNrcywgc3VjaCBhcyB4
ZW5kLApkaWQgbWFrZSB0aGUgbm9kZSB3cml0YWJsZSBieSB0aGUgZ3Vlc3QgYW5kIHNvbWUgUFYg
ZHJpdmVycyBbMV0gcmVsaWVkCnVwb24gdGhpcyB0byBzdGFzaCBpbmZvcm1hdGlvbi4KClsxXSBo
dHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL2RvY3VtZW50YXRpb24vZW4tdXMvcmVkX2hhdF9lbnRl
cnByaXNlX2xpbnV4LzUvaHRtbC9wYXJhLXZpcnR1YWxpemVkX3dpbmRvd3NfZHJpdmVyc19ndWlk
ZS9zZWN0LXBhcmEtdmlydHVhbGl6ZWRfd2luZG93c19kcml2ZXJzX2d1aWRlLWluc3RhbGxpbmdf
YW5kX2NvbmZpZ3VyaW5nX3RoZV9wYXJhX3ZpcnR1YWxpemVkX2RyaXZlcnMtaW5zdGFsbGluZ190
aGVfcGFyYV92aXJ0dWFsaXplZF9kcml2ZXJzCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xp
YnhsX2NyZWF0ZS5jCmluZGV4IDcxMTllOTU0MTIuLmJjOGU1MjU4MjEgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
CkBAIC03NTIsNyArNzUyLDcgQEAgcmV0cnlfdHJhbnNhY3Rpb246CiAgICAgICAgICAgICAgICAg
ICAgIHJvcGVybSwgQVJSQVlfU0laRShyb3Blcm0pKTsKICAgICBsaWJ4bF9feHNfbWtub2QoZ2Ms
IHQsCiAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvZGV2aWNlIiwgZG9tX3BhdGgp
LAotICAgICAgICAgICAgICAgICAgICByb3Blcm0sIEFSUkFZX1NJWkUocm9wZXJtKSk7CisgICAg
ICAgICAgICAgICAgICAgIHJ3cGVybSwgQVJSQVlfU0laRShyd3Blcm0pKTsKICAgICBsaWJ4bF9f
eHNfbWtub2QoZ2MsIHQsCiAgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvY29udHJv
bCIsIGRvbV9wYXRoKSwKICAgICAgICAgICAgICAgICAgICAgcm9wZXJtLCBBUlJBWV9TSVpFKHJv
cGVybSkpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
