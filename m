Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A325E173862
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:31:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fh5-0006Y9-LO; Fri, 28 Feb 2020 13:28:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7fh4-0006XP-3l
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:28:42 +0000
X-Inumbo-ID: 3c671fb4-5a2e-11ea-993b-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c671fb4-5a2e-11ea-993b-12813bfff9fa;
 Fri, 28 Feb 2020 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582896522; x=1614432522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VwUop21K3G8ExpStnABalvSNIyzshZ8JYuHGn+3MCPA=;
 b=GiEKiV9LJcgU83WxE9c7OkeB05AXQeUoGDnMV4bb7XfXirhagzlVRnJP
 I/A1jY82Ei83O59sc66RGOEaDpvWopQd8RzpBQMqBj0ijgobTeGDyRAYw
 f67MbqW0D2degiDkwvkiuJV4kEIB2OIG1g035r1UtdIyaf4AG+L2Q5/br 4=;
IronPort-SDR: +rW9OhTk3zour0JUluQuwudaGWZqiw0GGl7kPZrM7OJaAfjaUKDIwentlCitfqdaTnJIdzn7fJ
 OwRz/JkVlulQ==
X-IronPort-AV: E=Sophos;i="5.70,496,1574121600"; d="scan'208";a="19026438"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 28 Feb 2020 13:28:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1A48AA2C09; Fri, 28 Feb 2020 13:28:28 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 13:28:16 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 13:28:14 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 28 Feb 2020 13:28:13 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:27:47 +0000
Message-ID: <20200228132749.2929-5-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228132749.2929-1-pdurrant@amazon.com>
References: <20200228132749.2929-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 4/6] x86 / ioreq: use a MEMF_no_refcount
 allocation for server pages...
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

Li4uIG5vdyB0aGF0IGl0IGlzIHNhZmUgdG8gYXNzaWduIHRoZW0uCgpUaGlzIGF2b2lkcyByZWx5
aW5nIG9uIGxpYnhsIChvciB3aGF0ZXZlciB0b29sc3RhY2sgaXMgaW4gdXNlKSBzZXR0aW5nCm1h
eF9wYWdlcyB1cCB3aXRoIHN1ZmZpY2llbnQgJ3Nsb3AnIHRvIGFsbG93IGFsbCBuZWNlc3Nhcnkg
aW9yZXEgc2VydmVyCnBhZ2VzIHRvIGJlIGFsbG9jYXRlZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2
MjoKIC0gTmV3IGluIHYyCi0tLQogeGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCmluZGV4
IGY4YTVjODE1NDYuLjY0OGVmOTEzN2YgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW9y
ZXEuYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMKQEAgLTM3NSw3ICszNzUsNyBAQCBz
dGF0aWMgaW50IGh2bV9hbGxvY19pb3JlcV9tZm4oc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMs
IGJvb2wgYnVmKQogICAgICAgICByZXR1cm4gMDsKICAgICB9CiAKLSAgICBwYWdlID0gYWxsb2Nf
ZG9taGVhcF9wYWdlKHMtPnRhcmdldCwgMCk7CisgICAgcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFn
ZShzLT50YXJnZXQsIE1FTUZfbm9fcmVmY291bnQpOwogCiAgICAgaWYgKCAhcGFnZSApCiAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
