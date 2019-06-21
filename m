Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55014EFFC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 22:26:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heQ4p-0005Ba-Fe; Fri, 21 Jun 2019 20:24:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hG5x=UU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1heQ4o-0005BV-8K
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 20:24:02 +0000
X-Inumbo-ID: 80ff31fa-9462-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80ff31fa-9462-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 20:24:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C78D32084E;
 Fri, 21 Jun 2019 20:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561148640;
 bh=vvtprR/M9dm87zUw89QgV4L8ao2KYsAukgqLo5vMSk0=;
 h=Date:From:To:cc:Subject:From;
 b=nZhWKkFTa3vOPpez9ivoaa8VG++/1LGG9qvoKGGZKmuUwRfY3d4w23H/3XSwCRBUZ
 cMrYwlAStLOpB5+sgtaABgi3cPlhWUGS6J37Ixpnmz094TgtT4LoYC08aWFbFlAzGV
 TNs1U9E1XkACr8rBjuRJ56H45xqkqXHbEZLgHlJY=
Date: Fri, 21 Jun 2019 13:23:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906211320580.25730@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/2] fix mask calculation in pdx_init_mask
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

SGkgYWxsLAoKVGhpcyBpcyBhbiB1cGRhdGUgb24gImZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBk
eF9pbml0X21hc2siLCBwbHVzIGEKY2xlYW51cCBwYXRjaC4KClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgZjNkOGVlZjkwOTE3NDdlNzBjNTA1MDk0ZjYzNTE0YjQzMzI5YTkyMjoK
CiAgeDg2L2xpbmtlcjogdXNlIERFQ0xfU0VDVElPTiB1bmlmb3JtbHkgKDIwMTktMDYtMjEgMTc6
NDE6MDUgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAg
aHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFiZWxsaW5p
L3hlbi11bnN0YWJsZS5naXQgCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZDcxM2Ux
NzZiYzA3MTVmYzc5OGVlOGZkYWU0YzAyZmM2NDgxY2Q1ODoKCiAgeGVuL2FybTogZml4IG1hc2sg
Y2FsY3VsYXRpb24gaW4gcGR4X2luaXRfbWFzayAoMjAxOS0wNi0yMSAxMzoyMDoyNSAtMDcwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KU3RlZmFubyBTdGFiZWxsaW5pICgyKToKICAgICAgeGVuOiBSZXBsYWNlIHU2NCB3
aXRoIHVpbnQ2NF90IGluIHBkeF9pbml0X21hc2soKSBhbmQgY2FsbGVycwogICAgICB4ZW4vYXJt
OiBmaXggbWFzayBjYWxjdWxhdGlvbiBpbiBwZHhfaW5pdF9tYXNrCgogeGVuL2FyY2gvYXJtL3Nl
dHVwLmMgIHwgOSArKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9zcmF0LmMgICB8IDIgKy0KIHhlbi9j
b21tb24vcGR4LmMgICAgICB8IDkgKysrKysrKy0tCiB4ZW4vaW5jbHVkZS94ZW4vcGR4LmggfCAy
ICstCiA0IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
