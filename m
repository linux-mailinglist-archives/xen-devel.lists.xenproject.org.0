Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835216FFBA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 14:15:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6wUS-0006Na-Dm; Wed, 26 Feb 2020 13:12:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6wUR-0006NU-DP
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 13:12:39 +0000
X-Inumbo-ID: a9966de2-5899-11ea-941d-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9966de2-5899-11ea-941d-12813bfff9fa;
 Wed, 26 Feb 2020 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582722759; x=1614258759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fBE0+1Pww5eSNMyydAINI5Bctpc982EIY3WpsCpCImQ=;
 b=GDMZAEtM5E7yQss7Q+jmfRVFbfkaEQo+pEc4A3wUAbLtWV+SDWS1H3VA
 GuBNmzSsDTGqUOgC812mP3Mpk/cTmhWQmqkRebw4eDp5bkw3glj/Werl6
 QjwyNoxERJRrLUYrhphKUdUmjIX9c77nBp4IVQhZJYD28+G3tOoKfprjh U=;
IronPort-SDR: 5JDSvjivX7Ic1qDbHr+VW8TC4JsURtPWD10B881vgNbZWBhs7OGXvNTnFX8t2GSb/KxVyzJWYi
 nio1Mgz0MlqQ==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="19752916"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Feb 2020 13:12:26 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id C1824A1E75; Wed, 26 Feb 2020 13:12:24 +0000 (UTC)
Received: from EX13D32EUB002.ant.amazon.com (10.43.166.114) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 13:12:24 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB002.ant.amazon.com (10.43.166.114) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 13:12:22 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 13:12:20 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 13:12:13 +0000
Message-ID: <20200226131213.15305-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] libxl: add initializers for libxl__domid_history
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

VGhpcyBwYXRjaCBmaXhlcyBDb3Zlcml0eSBpc3N1ZSBDSUQgMTQ1OTAwNiAoSW5zZWN1cmUgZGF0
YSBoYW5kbGluZwooSU5URUdFUl9PVkVSRkxPVykpLgoKVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUg
ZXJyb3IgcGF0aHMgZm9yIGxpYnhsX19tYXJrX2RvbWlkX3JlY2VudCgpIGFuZApsaWJ4bF9faXNf
ZG9taWRfcmVjZW50KCkgY2hlY2sgdGhlICdmJyBmaWVsZCBpbiBzdHJ1Y3QgbGlieGxfX2RvbWlk
X2hpc3RvcnkKd2hlbiBpdCBtYXkgbm90IGhhdmUgYmVlbiBpbml0aWFsaXplZC4KClNpZ25lZC1v
ZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29s
cy9saWJ4bC9saWJ4bF9kb21haW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9k
b21haW4uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCmluZGV4IDg5MzdhZWIyNjAuLjQx
ZDA4Mzk0ZjMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jCkBAIC0xMzkwLDcgKzEzOTAsNyBAQCBzdGF0aWMgaW50
IGxpYnhsX19yZWFkX3JlY2VudChsaWJ4bF9fZ2MgKmdjLAogc3RhdGljIGludCBsaWJ4bF9fbWFy
a19kb21pZF9yZWNlbnQobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQpCiB7CiAgICAgbGli
eGxfX2Zsb2NrICpsb2NrOwotICAgIHN0cnVjdCBsaWJ4bF9fZG9taWRfaGlzdG9yeSBjdHh0Owor
ICAgIHN0cnVjdCBsaWJ4bF9fZG9taWRfaGlzdG9yeSBjdHh0ID0ge307CiAgICAgY2hhciAqbmV3
OwogICAgIEZJTEUgKm5mID0gTlVMTDsKICAgICBpbnQgciwgcmM7CkBAIC0xNDYxLDcgKzE0NjEs
NyBAQCBvdXQ6CiAKIGludCBsaWJ4bF9faXNfZG9taWRfcmVjZW50KGxpYnhsX19nYyAqZ2MsIHVp
bnQzMl90IGRvbWlkLCBib29sICpyZWNlbnQpCiB7Ci0gICAgc3RydWN0IGxpYnhsX19kb21pZF9o
aXN0b3J5IGN0eHQ7CisgICAgc3RydWN0IGxpYnhsX19kb21pZF9oaXN0b3J5IGN0eHQgPSB7fTsK
ICAgICBpbnQgcmM7CiAKICAgICByYyA9IGxpYnhsX19vcGVuX2RvbWlkX2hpc3RvcnkoZ2MsICZj
dHh0KTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
