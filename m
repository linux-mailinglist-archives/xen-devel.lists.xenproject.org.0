Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBE9ACF3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 12:18:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i16bi-0004LU-I1; Fri, 23 Aug 2019 10:15:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N7YS=WT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1i16bg-0004LH-Fb
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 10:15:44 +0000
X-Inumbo-ID: f6c72802-c58e-11e9-b95f-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6c72802-c58e-11e9-b95f-bc764e2007e4;
 Fri, 23 Aug 2019 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566555343;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DO7MoqGCq5qbArgpzvN9mrrcRAyCtPBqzcT7RIE96GA=;
 b=JLQchPz5y1Ran5JwpZqbC0ij+J7QMXEGx0X5nxfUY+gcuCSQmn9rfFAp
 DJBsLXB9f1KWM3x4jn7hCQXS0WK2gKZ71DTVDdhlO237HQz9YLsIvwzMi
 BHFjZx4frfdtMkal6T6q7aeid2PWvvIrDPkqJ9evXCfX1tcShNRTKxO5B Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v8P0wpMEi2lEQzdfPnrao0+KylUCNC2SltQiJLyCRaJB/kQ7xkxNq5rE7G/31lWGW305AnybbM
 Z5UA8PzCKcInMvhzQvCq6I693L/5BRmr6uUQkfU7J12Io7VrjpuX+pBu4HecD/kQmruj8CoO5n
 N8xmScIB/SPvU2oBRybd5L2ehHrMrj23Sw4RCq7l0ipbTryt4NPBu+sjDR63KZRpcv5RavYdc2
 UYVcwMtjayz7xla6MXFDDVkJzCAbnS8d/NmvVXmLPa3TaTmz72/FkSth1JtgDUY/OEJ1ecxlyu
 cOI=
X-SBRS: 2.7
X-MesageID: 4814135
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4814135"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 23 Aug 2019 11:15:34 +0100
Message-ID: <20190823101534.465-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823101534.465-1-anthony.perard@citrix.com>
References: <20190823101534.465-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBRRU1VIHJlY2VpdmVzIGEgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgc3VnZ2VzdGluZyB0aGF0
IHRoZSAic3RhdGUiCm9mIHRoZSBmcm9udGVuZCBjaGFuZ2VkLCBpdCByZWNvcmRzIHRoaXMgaW4g
aXRzIG93biBzdGF0ZSBidXQgaXQgYWxzbwpyZS13cml0ZSB0aGUgdmFsdWUgYmFjayBpbnRvIHhl
bnN0b3JlIGV2ZW4gc28gdGhlcmUgd2VyZSBubyBjaGFuZ2UuClRoaXMgdHJpZ2dlcnMgYW4gdW5u
ZWNlc3NhcnkgeGVuc3RvcmUgd2F0Y2ggZXZlbnQgd2hpY2ggUUVNVSB3aWxsCnByb2Nlc3MgYWdh
aW4gKGFuZCBtYXliZSB0aGUgZnJvbnRlbmQgYXMgd2VsbCkuIEFsc28gUUVNVSBjb3VsZApwb3Rl
bnRpYWxseSB3cml0ZSBhbiBhbHJlYWR5IG9sZCB2YWx1ZS4KClNpZ25lZC1vZmYtYnk6IEFudGhv
bnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KCk5vdGVzOgogICAgdjI6
CiAgICAtIGZpeCBjb2Rpbmcgc3R5bGUKICAgIC0gb25seSBjaGFuZ2UgZnJvbnRlbmRfc2V0X3N0
YXRlKCkgYW5kIHVzZSAncHVibGlzaCcgaW5zdGVhZCBvZiAnZXhwb3J0Jy4KCiBody94ZW4veGVu
LWJ1cy5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcveGVuL3hlbi1idXMuYyBiL2h3L3hlbi94
ZW4tYnVzLmMKaW5kZXggNjJjMTI3YjkyNi4uYTA0NDc4YWQ0ZiAxMDA2NDQKLS0tIGEvaHcveGVu
L3hlbi1idXMuYworKysgYi9ody94ZW4veGVuLWJ1cy5jCkBAIC02OTgsNyArNjk4LDggQEAgaW50
IHhlbl9kZXZpY2VfZnJvbnRlbmRfc2NhbmYoWGVuRGV2aWNlICp4ZW5kZXYsIGNvbnN0IGNoYXIg
KmtleSwKIH0KIAogc3RhdGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVuZF9zZXRfc3RhdGUoWGVu
RGV2aWNlICp4ZW5kZXYsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBlbnVtIHhlbmJ1c19zdGF0ZSBzdGF0ZSkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGVudW0geGVuYnVzX3N0YXRlIHN0YXRlLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBwdWJsaXNoKQogewogICAgIGNvbnN0IGNoYXIg
KnR5cGUgPSBvYmplY3RfZ2V0X3R5cGVuYW1lKE9CSkVDVCh4ZW5kZXYpKTsKIApAQCAtNzEwLDcg
KzcxMSw5IEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZpY2VfZnJvbnRlbmRfc2V0X3N0YXRlKFhlbkRl
dmljZSAqeGVuZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeHNfc3Ry
c3RhdGUoc3RhdGUpKTsKIAogICAgIHhlbmRldi0+ZnJvbnRlbmRfc3RhdGUgPSBzdGF0ZTsKLSAg
ICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3ByaW50Zih4ZW5kZXYsICJzdGF0ZSIsICIldSIsIHN0YXRl
KTsKKyAgICBpZiAocHVibGlzaCkgeworICAgICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3ByaW50
Zih4ZW5kZXYsICJzdGF0ZSIsICIldSIsIHN0YXRlKTsKKyAgICB9CiB9CiAKIHN0YXRpYyB2b2lk
IHhlbl9kZXZpY2VfZnJvbnRlbmRfY2hhbmdlZCh2b2lkICpvcGFxdWUpCkBAIC03MjYsNyArNzI5
LDcgQEAgc3RhdGljIHZvaWQgeGVuX2RldmljZV9mcm9udGVuZF9jaGFuZ2VkKHZvaWQgKm9wYXF1
ZSkKICAgICAgICAgc3RhdGUgPSBYZW5idXNTdGF0ZVVua25vd247CiAgICAgfQogCi0gICAgeGVu
X2RldmljZV9mcm9udGVuZF9zZXRfc3RhdGUoeGVuZGV2LCBzdGF0ZSk7CisgICAgeGVuX2Rldmlj
ZV9mcm9udGVuZF9zZXRfc3RhdGUoeGVuZGV2LCBzdGF0ZSwgZmFsc2UpOwogCiAgICAgaWYgKHN0
YXRlID09IFhlbmJ1c1N0YXRlSW5pdGlhbGlzaW5nICYmCiAgICAgICAgIHhlbmRldi0+YmFja2Vu
ZF9zdGF0ZSA9PSBYZW5idXNTdGF0ZUNsb3NlZCAmJgpAQCAtMTE2OSw3ICsxMTcyLDcgQEAgc3Rh
dGljIHZvaWQgeGVuX2RldmljZV9yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJy
cCkKICAgICB4ZW5fZGV2aWNlX2Zyb250ZW5kX3ByaW50Zih4ZW5kZXYsICJiYWNrZW5kLWlkIiwg
IiV1IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5idXMtPmJhY2tlbmRfaWQp
OwogCi0gICAgeGVuX2RldmljZV9mcm9udGVuZF9zZXRfc3RhdGUoeGVuZGV2LCBYZW5idXNTdGF0
ZUluaXRpYWxpc2luZyk7CisgICAgeGVuX2RldmljZV9mcm9udGVuZF9zZXRfc3RhdGUoeGVuZGV2
LCBYZW5idXNTdGF0ZUluaXRpYWxpc2luZywgdHJ1ZSk7CiAKICAgICB4ZW5kZXYtPmV4aXQubm90
aWZ5ID0geGVuX2RldmljZV9leGl0OwogICAgIHFlbXVfYWRkX2V4aXRfbm90aWZpZXIoJnhlbmRl
di0+ZXhpdCk7Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
