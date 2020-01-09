Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869F7135886
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 12:52:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipWIy-0000MT-MS; Thu, 09 Jan 2020 11:48:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kEnv=26=amazon.co.uk=prvs=2706230f4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipWIx-0000Lj-1d
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 11:48:47 +0000
X-Inumbo-ID: f864fda7-32d5-11ea-b9a8-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f864fda7-32d5-11ea-b9a8-12813bfff9fa;
 Thu, 09 Jan 2020 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578570518; x=1610106518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hkv+4MvZMn2cg2Lo+6T7WOCFpLqK03ixLGIUC6dBLj0=;
 b=O07lwd2dIbwK9bEJGDkZkhYd2orft3V6BDicwoduCTit5f8Zl9F7S6dD
 MDMcQ3hrcLxvN0jHKR702Gy59x3U2H0VIpuFBAWymwUOUIN+Tf0HhXZtA
 mdQGxPuR0miFpDkWQvl4yVkz3Jae3MXREFjgsxBjlkDhprM8+w9kyROSs I=;
IronPort-SDR: 8na5+yz4VVZJzGPT5LaJ5qP0AMVyZkhS4KTO9i5r19EMY7Mp8rqHCYidsXFrIHW7ByiZPqoKbL
 GRk6gwchaoYg==
X-IronPort-AV: E=Sophos;i="5.69,413,1571702400"; d="scan'208";a="17662301"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 09 Jan 2020 11:48:25 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4DA8FA2446; Thu,  9 Jan 2020 11:48:22 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 11:48:22 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 11:48:20 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 9 Jan 2020 11:48:19 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 9 Jan 2020 11:48:10 +0000
Message-ID: <20200109114816.2293-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/6] xl/libxl: domid allocation/preservation
 changes
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

VGhpcyBzZXJpZXMgd2FzIHByZXZpb3VzbHkgbmFtZWQgInhsL2xpYnhsOiBhbGxvdyBjcmVhdGlv
biBvZiBkb21haW5zIHdpdGgKYSBzcGVjaWZpZWQgZG9taWQiLgoKUGF1bCBEdXJyYW50ICg2KToK
ICBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YgSU5WQUxJRF9ET01JRCB0byB0aGUgQVBJCiAgbGli
eGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdAogIGxpYnhsOiBhZGQgaW5mcmFz
dHJ1Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZXRpcmVkJyBkb21pZHMKICBsaWJ4bDogYWxs
b3cgY3JlYXRpb24gb2YgZG9tYWlucyB3aXRoIGEgc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZAog
IHhsLmNvbmY6IGludHJvZHVjZSAnZG9taWRfcG9saWN5JwogIHhsOiBhbGxvdyBkb21pZCB0byBi
ZSBwcmVzZXJ2ZWQgb24gc2F2ZS9yZXN0b3JlIG9yIG1pZ3JhdGUKCiBkb2NzL21hbi94bC4xLnBv
ZC5pbiAgICAgICAgIHwgIDE0ICsrKysKIGRvY3MvbWFuL3hsLmNvbmYuNS5wb2QgICAgICAgfCAg
MTAgKysrCiB0b29scy9leGFtcGxlcy94bC5jb25mICAgICAgIHwgICA0ICsrCiB0b29scy9saWJ4
bC9saWJ4bC5oICAgICAgICAgIHwgIDEzICsrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
ICAgfCAgOTAgKysrKysrKysrKysrKysrKystLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5j
ICAgICAgIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyAgIHwgMTMyICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5jIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgIDE2ICsrKystCiB0
b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgIHwgICAxICsKIHRvb2xzL3hsL3hsLmMgICAgICAg
ICAgICAgICAgfCAgMTAgKysrCiB0b29scy94bC94bC5oICAgICAgICAgICAgICAgIHwgICAyICsK
IHRvb2xzL3hsL3hsX2NtZHRhYmxlLmMgICAgICAgfCAgIDYgKy0KIHRvb2xzL3hsL3hsX21pZ3Jh
dGUuYyAgICAgICAgfCAgMTUgKystLQogdG9vbHMveGwveGxfc2F2ZXJlc3RvcmUuYyAgICB8ICAx
OSArKystLQogdG9vbHMveGwveGxfdXRpbHMuaCAgICAgICAgICB8ICAgMiAtCiB0b29scy94bC94
bF92bWNvbnRyb2wuYyAgICAgIHwgICAzICsKIDE3IGZpbGVzIGNoYW5nZWQsIDI5NyBpbnNlcnRp
b25zKCspLCA0NCBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
