Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A97145825
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:47:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHFf-0000Xs-2J; Wed, 22 Jan 2020 14:45:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuHFe-0000Xe-1c
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:45:02 +0000
X-Inumbo-ID: c464c702-3d25-11ea-bc65-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c464c702-3d25-11ea-bc65-12813bfff9fa;
 Wed, 22 Jan 2020 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579704302; x=1611240302;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=989W5ywbbhDgDaOidbtY9X0lg29qiVLCF4vo4EmDHLU=;
 b=jrfTU/oiZ8l0ZBlJ0Tb+pUokG88Y3FeMwVbNtoNzmProc9LXBo5IAhku
 3jDnd1pQjJ+X3eIIT/B7GqKzeK/1BifQkbQ4upIWXCKC/v+mrDk3lH5R+
 MPo72gRjj9dIqqDnjmZeJNSnyIZuliEJb6uLH0bBOjaDze08uEpKA83UQ I=;
IronPort-SDR: YrD71l6OGVJYhmW/k03fZyRh+x8xd1sVaMMiAc0Mppf+4iVIoi6SxbQLDxfd5WCRkG/U2AEC8V
 oyjC4FcZwchw==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="20373682"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 22 Jan 2020 14:44:51 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id F4205286730
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 14:44:49 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 14:44:49 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 14:44:48 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 14:44:47 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 14:44:39 +0000
Message-ID: <20200122144446.919-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/7] xl/libxl: domid allocation/preservation
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
Cc: Paul Durrant <pdurrant@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgd2FzIHByZXZpb3VzbHkgbmFtZWQgInhsL2xpYnhsOiBhbGxvdyBjcmVhdGlv
biBvZiBkb21haW5zIHdpdGgKYSBzcGVjaWZpZWQgZG9taWQiLgoKUGF1bCBEdXJyYW50ICg3KToK
ICBsaWJ4bDogYWRkIGRlZmluaXRpb24gb2YgSU5WQUxJRF9ET01JRCB0byB0aGUgQVBJCiAgbGli
eGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdAogIGxpYnhsOiBnZW5lcmFsaXNl
IGxpYnhsX19kb21haW5fdXNlcmRhdGFfbG9jaygpCiAgbGlieGw6IGFkZCBpbmZyYXN0cnVjdHVy
ZSB0byB0cmFjayBhbmQgcXVlcnkgJ3JlY2VudCcgZG9taWRzCiAgbGlieGw6IGFsbG93IGNyZWF0
aW9uIG9mIGRvbWFpbnMgd2l0aCBhIHNwZWNpZmllZCBvciByYW5kb20gZG9taWQKICB4bC5jb25m
OiBpbnRyb2R1Y2UgJ2RvbWlkX3BvbGljeScKICB4bDogYWxsb3cgZG9taWQgdG8gYmUgcHJlc2Vy
dmVkIG9uIHNhdmUvcmVzdG9yZSBvciBtaWdyYXRlCgogZG9jcy9tYW4veGwuMS5wb2QuaW4gICAg
ICAgICAgfCAgMTQgKysrKwogZG9jcy9tYW4veGwuY29uZi41LnBvZCAgICAgICAgfCAgMTAgKysr
CiB0b29scy9leGFtcGxlcy94bC5jb25mICAgICAgICB8ICAgNCArCiB0b29scy9oZWxwZXJzL3hl
bi1pbml0LWRvbTAuYyB8ICAzMCArKysrKysrCiB0b29scy9saWJ4bC9saWJ4bC5oICAgICAgICAg
ICB8ICAxNSArKystCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICB8IDEwNSArKysrKysr
KysrKysrKysrKystLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RldmljZS5jICAgIHwgICA0ICst
CiB0b29scy9saWJ4bC9saWJ4bF9kaXNrLmMgICAgICB8ICAxMiArLS0KIHRvb2xzL2xpYnhsL2xp
YnhsX2RtLmMgICAgICAgIHwgICAyICstCiB0b29scy9saWJ4bC9saWJ4bF9kb20uYyAgICAgICB8
ICAxMiArLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jICAgIHwgMTQ5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmMgIHwg
IDY3ICsrKysrKysrKy0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCAgfCAgMzAg
KysrKystLQogdG9vbHMvbGlieGwvbGlieGxfbWVtLmMgICAgICAgfCAgIDggKy0KIHRvb2xzL2xp
YnhsL2xpYnhsX3BjaS5jICAgICAgIHwgICA0ICstCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5p
ZGwgICB8ICAgMSArCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyAgICAgICB8ICAgOCArLQogdG9v
bHMveGwveGwuYyAgICAgICAgICAgICAgICAgfCAgMTAgKysrCiB0b29scy94bC94bC5oICAgICAg
ICAgICAgICAgICB8ICAgMiArCiB0b29scy94bC94bF9jbWR0YWJsZS5jICAgICAgICB8ICAgNiAr
LQogdG9vbHMveGwveGxfbWlncmF0ZS5jICAgICAgICAgfCAgMTUgKystLQogdG9vbHMveGwveGxf
c2F2ZXJlc3RvcmUuYyAgICAgfCAgMTkgKysrLS0KIHRvb2xzL3hsL3hsX3V0aWxzLmggICAgICAg
ICAgIHwgICAyIC0KIHRvb2xzL3hsL3hsX3ZtY29udHJvbC5jICAgICAgIHwgICAzICsKIHhlbi9p
bmNsdWRlL3B1YmxpYy94ZW4uaCAgICAgIHwgICAzICsKIDI1IGZpbGVzIGNoYW5nZWQsIDQzMiBp
bnNlcnRpb25zKCspLCAxMDMgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
