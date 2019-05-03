Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91F13483
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 22:52:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMf8N-0006Vw-25; Fri, 03 May 2019 20:50:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lar+=TD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hMf8M-0006Vn-1F
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 20:50:18 +0000
X-Inumbo-ID: 0e26373e-6de5-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0e26373e-6de5-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 20:50:16 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B87E92087F;
 Fri,  3 May 2019 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556916616;
 bh=+84OtcGsSXxXUmW9bHPCL6uFaWyF6QgG3w3gqS5A+BA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ocluEOABpEoxn05t0+T6pzVqNyWTmMwmZZRWlNhLAGZsOEPb/wNI5sz4/R6gCdDkR
 j1fQcqF/Tx9mVhFxhRQ08YCus1qdwmqukIF3hiBr1JqIbmIH1VAIWUC506+z0jFC4G
 1Kv4ZkkybgJmtYFZqhsdn2v+t2MNKa06sblnQD18=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Fri,  3 May 2019 13:50:13 -0700
Message-Id: <1556916614-21512-2-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH 2/3] xen: actually skip the first MAX_ORDER bits
 in pfn_pdx_hole_setup
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org,
 JBeulich@suse.com, xen-devel@lists.xenproject.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cGZuX3BkeF9ob2xlX3NldHVwIGlzIG1lYW50IHRvIHNraXAgdGhlIGZpcnN0IE1BWF9PUkRFUiBi
aXRzLCBidXQKYWN0dWFsbHkgaXQgb25seSBza2lwcyB0aGUgZmlyc3QgTUFYX09SREVSLTEgYml0
cy4gVGhlIGlzc3VlIHdhcwpwcm9iYWJseSBpbnRyb2R1Y2VkIGJ5IGJkYjU0MzljM2YsIHdoZW4g
Y2hhbmdpbmcgdG8gbG9vcCB0byBzdGFydCBmcm9tCk1BWF9PUkRFUi0xIGFuIGFkanVzdG1lbnQg
YnkgMSB3YXMgbmVlZGVkIGluIHRoZSBjYWxsIHRvIGZpbmRfbmV4dF9iaXQoKQpidXQgbm90IGRv
bmUuCgpGaXggdGhlIGlzc3VlIGJ5IHBhc3NpbmcgaisxIGFuZCBpKzEgdG8gZmluZF9uZXh0X3pl
cm9fYml0IGFuZApmaW5kX25leHRfYml0LiBBbHNvIGFkZCBhIGNoZWNrIGZvciBpID49IEJJVFNf
UEVSX0xPTkcgYmVjYXVzZQpmaW5kX3ssbmV4dF99emVyb19iaXQoKSBvbiB4ODYgYXNzdW1lIHRo
ZWlyIGxhc3QgYXJndW1lbnQgdG8gYmUgbGVzcwp0aGFuIHRoZWlyIG1pZGRsZSBvbmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20KQ0M6IEpCZXVsaWNoQHN1c2UuY29tCkNDOiBHZW9yZ2UuRHVubGFwQGV1
LmNpdHJpeC5jb20KQ0M6IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20KQ0M6IGtvbnJhZC53aWxr
QG9yYWNsZS5jb20KQ0M6IHRpbUB4ZW4ub3JnCkNDOiB3ZWkubGl1MkBjaXRyaXguY29tCgotLS0K
IHhlbi9jb21tb24vcGR4LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BkeC5jIGIveGVu
L2NvbW1vbi9wZHguYwppbmRleCA1MGMyMWI2Li5iYjdlNDM3IDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL3BkeC5jCisrKyBiL3hlbi9jb21tb24vcGR4LmMKQEAgLTgzLDggKzgzLDEwIEBAIHZvaWQg
X19pbml0IHBmbl9wZHhfaG9sZV9zZXR1cCh1bnNpZ25lZCBsb25nIG1hc2spCiAgICAgICovCiAg
ICAgZm9yICggaiA9IE1BWF9PUkRFUi0xOyA7ICkKICAgICB7Ci0gICAgICAgIGkgPSBmaW5kX25l
eHRfemVyb19iaXQoJm1hc2ssIEJJVFNfUEVSX0xPTkcsIGopOwotICAgICAgICBqID0gZmluZF9u
ZXh0X2JpdCgmbWFzaywgQklUU19QRVJfTE9ORywgaSk7CisgICAgICAgIGkgPSBmaW5kX25leHRf
emVyb19iaXQoJm1hc2ssIEJJVFNfUEVSX0xPTkcsIGogKyAxKTsKKyAgICAgICAgaWYgKCBpID49
IEJJVFNfUEVSX0xPTkcgKQorICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIGogPSBmaW5kX25l
eHRfYml0KCZtYXNrLCBCSVRTX1BFUl9MT05HLCBpICsgMSk7CiAgICAgICAgIGlmICggaiA+PSBC
SVRTX1BFUl9MT05HICkKICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICBpZiAoIGogLSBpID4g
aG9sZV9zaGlmdCApCi0tIAoxLjkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
