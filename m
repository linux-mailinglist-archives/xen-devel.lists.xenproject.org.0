Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8646E3575
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 16:24:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNdzL-0000eu-Vs; Thu, 24 Oct 2019 14:21:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehLN=YR=xen.org=prvs=1937cb5f4=paul@srs-us1.protection.inumbo.net>)
 id 1iNdzJ-0000eA-Te
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 14:21:17 +0000
X-Inumbo-ID: 8ad076ba-f669-11e9-94a3-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ad076ba-f669-11e9-94a3-12813bfff9fa;
 Thu, 24 Oct 2019 14:21:17 +0000 (UTC)
IronPort-SDR: 8lY5UTrKzgBnwzNUPr5njIOvc98Pba1LBCU9X/8Hn50q7X22pApuHe+1FfV63EAcO8TibXGDh+
 R1YD8YNio7PQ==
X-IronPort-AV: E=Sophos;i="5.68,224,1569283200"; 
   d="scan'208";a="232578"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 24 Oct 2019 14:21:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (Postfix) with ESMTPS
 id 874FEA2914; Thu, 24 Oct 2019 14:21:15 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 24 Oct 2019 14:21:14 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 24 Oct 2019 14:21:13 +0000
Received: from CBG-5CG9341D0C.cbg10.amazon.com (10.55.227.46) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 24 Oct 2019 14:21:11 +0000
From: <paul@xen.org>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 24 Oct 2019 15:21:03 +0100
Message-ID: <20191024142103.962-1-paul@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] tools/hotpug: only attempt to call 'ip route'
 if there is valid command
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKVGhlIHZpZi1yb3V0ZSBz
Y3JpcHQgc2hvdWxkIG9ubHkgY2FsbCAnaXAgcm91dGUnIHdoZW4gJ2lwY21kJyBoYXMgYmVlbgpz
ZXQsIG90aGVyd2lzZSBpdCB3aWxsIGZhaWwgZHVlIHRvIGFuIGluY29ycmVjdCBjb21tYW5kIHN0
cmluZy4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4K
LS0tCkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpUaGlzIGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGJyb2tl
biBmb3JldmVyLgotLS0KIHRvb2xzL2hvdHBsdWcvTGludXgvdmlmLXJvdXRlIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvaG90cGx1Zy9MaW51eC92aWYtcm91dGUgYi90b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1y
b3V0ZQppbmRleCBjMTQ5ZmZjYTczLi45ODg5M2Q5MGI2IDEwMDY0NAotLS0gYS90b29scy9ob3Rw
bHVnL0xpbnV4L3ZpZi1yb3V0ZQorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L3ZpZi1yb3V0ZQpA
QCAtMzUsNyArMzUsNyBAQCBjYXNlICIke2NvbW1hbmR9IiBpbgogICAgICAgICA7OwogZXNhYwog
Ci1pZiBbICIke2lwfSIgXSA7IHRoZW4KK2lmIFsgIiR7aXBjbWR9IiBdIDsgdGhlbgogICAgICMg
SWYgd2UndmUgYmVlbiBnaXZlbiBhIGxpc3Qgb2YgSVAgYWRkcmVzc2VzLCB0aGVuIGFkZCByb3V0
ZXMgZnJvbSBkb20wIHRvCiAgICAgIyB0aGUgZ3Vlc3QgdXNpbmcgdGhvc2UgYWRkcmVzc2VzLgog
ICAgIGZvciBhZGRyIGluICR7aXB9IDsgZG8KLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
