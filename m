Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE36974D6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:24:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lrz-0000zp-8U; Wed, 21 Aug 2019 08:21:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0Lrx-0000wh-8t
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:25 +0000
X-Inumbo-ID: a98f9478-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a98f9478-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375683; x=1597911683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=rTdq6bk4WUwGpssROk8t7Agg5oVsWJLKT4jR4h03AWY=;
 b=q38xutvSjms+IrOhJt5blYrpkRZ+o+bdSLeVL2fitgaG+CfHgC/B1k+R
 IK/aasYgeUtg6HSiWUbD9WX500DKfp5PraGTg+RxxIirsmyiDqj8qEHvR
 xkjR+cU8HvxQUy4YBm4d5YbqHny0uLBNbaaq3qd9UB34mS7Zq6TC/elcu s=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="695968500"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 21 Aug 2019 08:21:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id 34FB3A1EF6; Wed, 21 Aug 2019 08:21:22 +0000 (UTC)
Received: from EX13D03EUA003.ant.amazon.com (10.43.165.89) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:06 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA003.ant.amazon.com (10.43.165.89) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:21:05 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:21:04 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>
Date: Wed, 21 Aug 2019 08:20:37 +0000
Message-ID: <20190821082056.91090-2-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821082056.91090-1-wipawel@amazon.de>
References: <20190821082056.91090-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 01/20] livepatch-gcc: Allow toolchain command
 with versions
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIGJ1aWxkIHN5c3RlbSBtYXkgZW5mb3JjZSBwYXJ0aWN1bGFyIGdjYyB2ZXJzaW9uIChlLmcu
IGdjYzcyKS4KTWFrZSBzdXJlIHRoZSBsaXZlcGF0Y2gtZ2NjIHNjcmlwdCBhY2NlcHRzIGFsbCBp
bnB1dCB0b29sY2hhaW4gZ2NjCmNvbW1hbmRzIHdpdGggb3Igd2l0aG91dCB2ZXJzaW9uIHNwZWNp
ZmllZC4KClNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBNYXplaW4gPGFtYXplaW5AYW1hem9uLmRlPgpSZXZp
ZXdlZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFJv
c3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KIGxpdmVwYXRjaC1n
Y2MgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2xpdmVwYXRjaC1nY2MgYi9saXZlcGF0Y2gtZ2NjCmluZGV4IDYzNDE1
N2EuLjYxN2Y4NjUgMTAwNzU1Ci0tLSBhL2xpdmVwYXRjaC1nY2MKKysrIGIvbGl2ZXBhdGNoLWdj
YwpAQCAtMjUsNyArMjUsOCBAQCBzaGlmdAogZGVjbGFyZSAtYSBhcmdzPSgiJEAiKQoga2VlcD1u
bwogCi1pZiBbWyAiJFRPT0xDSEFJTkNNRCIgPSAiZ2NjIiBdXSA7IHRoZW4KK2RlY2xhcmUgLXIg
R0NDX1JFPSdnY2MuKicKK2lmIFtbICIkVE9PTENIQUlOQ01EIiA9fiAkR0NDX1JFIF1dIDsgdGhl
bgogICAgIHdoaWxlIFsgIiQjIiAtZ3QgMCBdOyBkbwogICAgICAgICBpZiBbICIkMSIgPSAiLW8i
IF07IHRoZW4KICAgICAgICAgICAgIG9iaj0kMgotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxv
cG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2Vz
Y2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdl
dHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpT
aXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
