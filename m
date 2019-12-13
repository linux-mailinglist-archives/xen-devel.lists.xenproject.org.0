Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324D111E8E0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 18:05:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifoLT-0005si-KP; Fri, 13 Dec 2019 17:03:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kzvv=2D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ifoLR-0005sc-K8
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 17:03:13 +0000
X-Inumbo-ID: 6d2cd3d2-1dca-11ea-a1e1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d2cd3d2-1dca-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 17:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576256584;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=+hcsYEkQZwZ0L/ziQ7oEqESJ8Y8DeWSfeFkfEXrytlk=;
 b=aJa7XhraEy7q+4AQ7myAEA00+sO6tumPDBIpU2dj7FQK4AKCgJS6R19k
 xjTRAYFDEcpCRQ59A2s3kTGZRBsrFT00dbcD3PZDb2ejeajF9JMaBxAt/
 OA9ffwrW1Tt+egCihHPYsM5e3mjxKgnt7R73jBdu/gf2DFWu+QEpxoQBQ A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c23GsgONBKDVccqC9zg/C2Ub1lz+0KRApkAo4ZEZmXiGnmAYtnI8+yVdoo6TrVYqx9pN77b8hT
 tZhqQxt3mBsUijIBsVomPLnXqtyEIfvemhwYXuxZrCPP2xOcrrfoQp9cPA4tzLfl5RkeBngZja
 i1Co/+Cxce9HQwNu1UtqlpWDiwsrzRCrN2wOGg7hLS957l2yU0I7OhRl2n7L2PEeR3JXGxQhyZ
 hm7CQJaSP6GKjYpNsk4eFyHLh+mLbIHa/MwfjzPRrCh/DCbkcWc2a2Dr03QAXylntao8e/OBmm
 0Ug=
X-SBRS: 2.7
X-MesageID: 10223881
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10223881"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 17:03:00 +0000
Message-ID: <20191213170300.13544-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] docs/process/branching-checklist: Fix a broken
 rune
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y3ItZGFpbHktYnJhbmNoIG91Z2h0IHRvIGJlIGNhbGxlZCB2aWEgY3ItZm9yLWJyYW5jaGVzIHNv
IHRoYXQgd2UgdGFrZQp0aGUgbG9jay4gIE90aGVyd2lzZSBzdHJhbmdlIHRoaW5ncyBjYW4gb2Nj
dXIgaWYgY3JvbiBydW5zCmNyLWRhaWx5LWJyYW5jaCBpbiB0aGUgc2FtZSBkaXJlY3RvcnkgLSBp
biBwYXJ0aWN1bGFyLCBpdCB3aWxsIGJlCmxpa2VseSB0byB1cGRhdGUgdGhlIG9zc3Rlc3QgcmV2
aXNpb24sIGJyZWFraW5nIGV2ZXJ5dGhpbmcuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBkb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNo
ZWNrbGlzdC50eHQgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50
eHQgYi9kb2NzL3Byb2Nlc3MvYnJhbmNoaW5nLWNoZWNrbGlzdC50eHQKaW5kZXggMTBjMjAzODMx
OS4uMWRmYTFhMmVjNyAxMDA2NDQKLS0tIGEvZG9jcy9wcm9jZXNzL2JyYW5jaGluZy1jaGVja2xp
c3QudHh0CisrKyBiL2RvY3MvcHJvY2Vzcy9icmFuY2hpbmctY2hlY2tsaXN0LnR4dApAQCAtODks
NiArODksNiBAQCB3aWxsIHRha2UgYSB3aGlsZSB0byB0YWtlIGVmZmVjdDoKICAgc3NoIG9zc3Rl
c3QudGVzdC1sYWIKICAgY2QgYnJhbmNoZXMvZm9yLXhlbi0kdi10ZXN0aW5nLmdpdAogICBzY3Jl
ZW4gLVMgJHYKLSAgLi9jci1kYWlseS1icmFuY2ggLS1yZWFsIHhlbi0kdi10ZXN0aW5nCisgIEJS
QU5DSEVTPXhlbi0kdi10ZXN0aW5nIC4vY3ItZm9yLWJyYW5jaGVzIGJyYW5jaGVzIC13ICIuL2Ny
LWRhaWx5LWJyYW5jaCAtLXJlYWwiCiAKIFNlbmQgbWVzc2FnZSB0byBjb21taXR0ZXJzIGFuZCBS
TS4gIFVzZSBwcmV2aW91cyBtYWlsIGFzIGEgdGVtcGxhdGUuCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
