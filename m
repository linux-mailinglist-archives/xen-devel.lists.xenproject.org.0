Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E8167BEC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 12:24:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j56N1-00056H-MD; Fri, 21 Feb 2020 11:21:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9FNp=4J=amazon.co.uk=prvs=313f46acb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j56Mz-00055s-Nq
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 11:21:21 +0000
X-Inumbo-ID: 493e19aa-549c-11ea-aa99-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 493e19aa-549c-11ea-aa99-bc764e2007e4;
 Fri, 21 Feb 2020 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582284081; x=1613820081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GB4XwziE0lqzSohlKaFns9MyRRAZWesKJLI6Qeng2ds=;
 b=sNfadk8N27ld6QL1HJNJX52GuNaE06ZzwbpEWLLagZCDmV4sDZUAOfv8
 ajxfS/gke3gVpWBvADmgpjhEuBPPPsrSz8diFwZSBZM/EHc7ezTLEYqQ9
 ruUdVOcK/CGCuX69Zv3mh2hVs4KdF4S5WmqA2RErXclGBmCW0KrTjI1Jn 8=;
IronPort-SDR: kCIYRKRwxnU/8UNxJMRwnDMpan+xXqe3DoBMzExl37lqZ/rDnUjeCcaRmoI+LTefa0+0Aof6mB
 4taxp/OhtB7w==
X-IronPort-AV: E=Sophos;i="5.70,468,1574121600"; d="scan'208";a="18290060"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 21 Feb 2020 11:21:20 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id E74D3A289D; Fri, 21 Feb 2020 11:21:16 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 21 Feb 2020 11:21:03 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 21 Feb 2020 11:21:02 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 21 Feb 2020 11:21:00 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Feb 2020 11:20:46 +0000
Message-ID: <20200221112049.3077-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221112049.3077-1-pdurrant@amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v7 3/6] public/xen.h: add a definition for a
 'valid domid' mask
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

QSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwgbW9kaWZ5IGxpYnhsIHRvIGFsbG93IHNlbGVjdGlvbiBv
ZiBhIHJhbmRvbSBkb21pZAp2YWx1ZSB3aGVuIGNyZWF0aW5nIGRvbWFpbnMuIFZhbGlkIHZhbHVl
cyBhcmUgbGltaXRlZCB0byBhIHdpZHRoIG9mIDE1IGJpdHMsCnNvIGFkZCBhbiBhcHByb3ByaWF0
ZSBtYXNrIGRlZmluaXRpb24gdG8gdGhlIHB1YmxpYyBoZWFkZXIuCgpOT1RFOiBJdCBpcyByZWFz
b25hYmxlIGZvciB0aGlzIG1hc2sgZGVmaW5pdGlvbiB0byBiZSBpbiBhIFhlbiBwdWJsaWMgaGVh
ZGVyCiAgICAgIHJhdGhlciB0aGFuIGluLCBzYXksIGEgbGlieGVuY3RybCBoZWFkZXIgc2luY2Ug
aXQgcmVsYXRlcyB0byB0aGUKICAgICAgdmFsaWRpdHkgb2YgYSB2YWx1ZSBwYXNzZWQgdG8gWEVO
X0RPTUNUTF9jcmVhdGVkb21haW4uIFRoaXMgbmV3CiAgICAgIGRlZmluaXRpb24gaXMgcGxhY2Vk
IGluIHhlbi5oIHJhdGhlciB0aGFuIGRvbWN0bC5oIG9ubHkgdG8gY28tbG9jYXRlCiAgICAgIGl0
IHdpdGggb3RoZXIgZG9taWQtcmVsYXRlZCBkZWZpdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+ClJldmlld2VkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFk
LndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgp2NjoKIC0gTmV3IGluIHY2IChzcGxp
dCBvdXQgZnJvbSBhbm90aGVyIHBhdGNoKQotLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCB8
IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvcHVibGljL3hlbi5oIGIveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCmluZGV4IGQy
MTk4ZGZmYWQuLjc1YjE2MTlkMGQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4u
aAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKQEAgLTYxNCw2ICs2MTQsOSBAQCBERUZJ
TkVfWEVOX0dVRVNUX0hBTkRMRShtbXVleHRfb3BfdCk7CiAvKiBJZGxlIGRvbWFpbi4gKi8KICNk
ZWZpbmUgRE9NSURfSURMRSAgICAgICAgICAgeGVuX21rX3VpbnQoMHg3RkZGKQogCisvKiBNYXNr
IGZvciB2YWxpZCBkb21haW4gaWQgdmFsdWVzICovCisjZGVmaW5lIERPTUlEX01BU0sgICAgICAg
ICAgIHhlbl9ta191aW50KDB4N0ZGRikKKwogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAogdHlwZWRl
ZiB1aW50MTZfdCBkb21pZF90OwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
