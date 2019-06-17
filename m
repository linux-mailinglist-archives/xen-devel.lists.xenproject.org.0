Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4854148D00
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 20:53:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcwhh-0001Ez-IK; Mon, 17 Jun 2019 18:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcwhg-00016T-1B
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 18:50:04 +0000
X-Inumbo-ID: b74f75ae-9130-11e9-a77b-c73db4cd3180
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b74f75ae-9130-11e9-a77b-c73db4cd3180;
 Mon, 17 Jun 2019 18:50:03 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E0B62084D;
 Mon, 17 Jun 2019 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560797402;
 bh=SsZ00nN5g90PJ2qGkwDS8uP1VT2gVPVFXlJKvgzACdc=;
 h=Date:From:To:cc:Subject:From;
 b=eJr1n2/iLQ0unBLRsj0uGwf16iTZJLmP131Gn4XTi01NEGyMATKmUb32AR8qh5KqS
 Hdn6LBF9aHT2r0K8rp0I8AsVGWPSaMkzGjm6x9sBrv1/W6wYAbtHgOJ2cbyiwkFGHh
 o/MJhxWzR/1qLhszzkSGBBnhAF9VB1XtPJuCiUAg=
Date: Mon, 17 Jun 2019 11:50:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/2] fix mask calculation in pdx_init_mask
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
Cc: andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org,
 JBeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyBhbiB1cGRhdGUgb24gdjMgb2YgImZpeCBtYXNrIGNhbGN1bGF0aW9u
IGluIHBkeF9pbml0X21hc2siLCBwbHVzCmEgY2xlYW51cCBwYXRjaC4KCgpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDJhYzQ4ZmQ1MmQ4NDZhOGMzOTQ5MzczYWEwZDc3NmM2Y2I1
NDUyZGI6CgogIHg4Ni94MkFQSUM6IHRpZ2h0ZW4gY2hlY2sgaW4gY2x1c3RlciBtb2RlIElQSSBz
ZW5kaW5nICgyMDE5LTA2LTE3IDE3OjM4OjM1ICswMjAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUg
R2l0IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1o
dHRwL3Blb3BsZS9zc3RhYmVsbGluaS94ZW4tdW5zdGFibGUuZ2l0IAoKZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIGNmYmE2NTkwMmVjNWYxNWRmOGIzNWIzY2NmOGJjZGRhNjk1ZDU2NjU6
CgogIHhlbi9hcm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sgKDIwMTkt
MDYtMTcgMTE6NDY6MjAgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoMik6CiAg
ICAgIHhlbjogc3dpdGNoIHBkeF9pbml0X21hc2sgdG8gcmV0dXJuIHVpbnQ2NF90CiAgICAgIHhl
bi9hcm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sKCiB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyAgfCA5ICsrKysrKysrLQogeGVuL2FyY2gveDg2L3NyYXQuYyAgIHwgMiArLQog
eGVuL2NvbW1vbi9wZHguYyAgICAgIHwgOSArKysrKysrLS0KIHhlbi9pbmNsdWRlL3hlbi9wZHgu
aCB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
