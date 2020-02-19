Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D316408D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 10:40:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4LoL-00084J-G8; Wed, 19 Feb 2020 09:38:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0CPD=4H=amazon.co.uk=prvs=311145cb7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4LoJ-00083l-5g
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 09:38:27 +0000
X-Inumbo-ID: 940da3a8-52fb-11ea-bc8e-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 940da3a8-52fb-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582105107; x=1613641107;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=m/QxIK1wZXVPJ6XpKFdZd+Y46v6EXH7JHMW87CbQtns=;
 b=Aw3O5EGQ7hV5Gavi97LFdFzch76/f8YkUUyi3mawLx9/xiClu3iAeXeL
 09tLjpZ2Wg+OcVyrrLR04o6cp3RUtsFM9aLRyR2sP/lHxvqU8YTSho/tb
 fyIzatlLhFWA+tyCUy1PjuBtBvDDnML1uBmv+BlxyQIpcvKqL4D1bRJHf c=;
IronPort-SDR: 637HmOrap3EjSW39ms5FRFQZObHX0ObpCFVB/aBH70KLNCtHTcdJ48MJhqC6GopzFLKfEaXnmZ
 H8uuFUCNrtSQ==
X-IronPort-AV: E=Sophos;i="5.70,459,1574121600"; d="scan'208";a="26044079"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 19 Feb 2020 09:38:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 00C09A2F6F; Wed, 19 Feb 2020 09:38:20 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 19 Feb 2020 09:38:06 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 19 Feb 2020 09:38:05 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 19 Feb 2020 09:38:03 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Feb 2020 09:37:51 +0000
Message-ID: <20200219093754.2924-4-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219093754.2924-1-pdurrant@amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v6 3/6] public/xen.h: add a definition for a
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
ZSBtYXNrIGRlZmluaXRpb24gdG8gdGhlIHB1YmxpYyBoZWFkZXIuCgpTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxs
IDxqdWxpZW5AeGVuLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgp2NjoKIC0gTmV3IGluIHY2IChzcGxpdCBvdXQg
ZnJvbSBhbm90aGVyIHBhdGNoKQotLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaCB8IDMgKysr
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvcHVibGljL3hlbi5oIGIveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCmluZGV4IGQyMTk4ZGZm
YWQuLjc1YjE2MTlkMGQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAorKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKQEAgLTYxNCw2ICs2MTQsOSBAQCBERUZJTkVfWEVO
X0dVRVNUX0hBTkRMRShtbXVleHRfb3BfdCk7CiAvKiBJZGxlIGRvbWFpbi4gKi8KICNkZWZpbmUg
RE9NSURfSURMRSAgICAgICAgICAgeGVuX21rX3VpbnQoMHg3RkZGKQogCisvKiBNYXNrIGZvciB2
YWxpZCBkb21haW4gaWQgdmFsdWVzICovCisjZGVmaW5lIERPTUlEX01BU0sgICAgICAgICAgIHhl
bl9ta191aW50KDB4N0ZGRikKKwogI2lmbmRlZiBfX0FTU0VNQkxZX18KIAogdHlwZWRlZiB1aW50
MTZfdCBkb21pZF90OwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
