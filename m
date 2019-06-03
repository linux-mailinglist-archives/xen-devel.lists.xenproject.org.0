Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A183347C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:04:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpOQ-0001kZ-1f; Mon, 03 Jun 2019 16:01:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXpOO-0001kS-DW
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:01:00 +0000
X-Inumbo-ID: c6f7e9d9-8618-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c6f7e9d9-8618-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 16:00:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 10:00:58 -0600
Message-Id: <5CF544330200007800234BAB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 10:00:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] AMD/IOMMU: don't "add" IOMMUs
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgYW1kX2lvbW11X2FkZF9kZXZpY2UoKSB3b24ndCBiZSBjYWxsZWQgZm9yIElPTU1VcyBm
cm9tCnBjaV9hZGRfZGV2aWNlKCksIGFzIElPTU1VcyBoYXZlIGdvdCBtYXJrZWQgci9vLApfc2V0
dXBfaHdkb21fcGNpX2RldmljZXMoKSBjYWxscyB0aGVyZSBuZXZlcnRoZWxlc3MuIEF2b2lkIGlz
c3VpbmcgdGhlCmJvZ3VzIGRlYnVnZ2luZyBvbmx5ICJObyBpb21tdSBmb3IgLi4uOyBjYW5ub3Qg
YmUgaGFuZGVkIHRvIC4uLiIgbG9nCm1lc3NhZ2UgYXMgd2VsbCBhcyB0aGUgbm9uLWRlYnVnZ2lu
ZyAic2V0dXAgLi4uIGZvciAuLi4gZmFpbGVkICgtMTkpIgpvbmUuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9wY2lfYW1kX2lvbW11LmMKQEAgLTQyNCw2ICs0MjQsMTEgQEAgc3RhdGljIGludCBhbWRfaW9t
bXVfYWRkX2RldmljZSh1OCBkZXZmbgogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAgIGJk
ZiA9IFBDSV9CREYyKHBkZXYtPmJ1cywgcGRldi0+ZGV2Zm4pOworCisgICAgZm9yX2VhY2hfYW1k
X2lvbW11KGlvbW11KQorICAgICAgICBpZiAoIHBkZXYtPnNlZyA9PSBpb21tdS0+c2VnICYmIGJk
ZiA9PSBpb21tdS0+YmRmICkKKyAgICAgICAgICAgIHJldHVybiAwOworCiAgICAgaW9tbXUgPSBm
aW5kX2lvbW11X2Zvcl9kZXZpY2UocGRldi0+c2VnLCBiZGYpOwogICAgIGlmICggdW5saWtlbHko
IWlvbW11KSApCiAgICAgewoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
