Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107879B9C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 23:55:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDZG-0007Uk-BP; Mon, 29 Jul 2019 21:52:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsDZF-0007Uf-4e
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 21:52:29 +0000
X-Inumbo-ID: 27fe1947-b24b-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27fe1947-b24b-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 21:52:27 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F9A72073F;
 Mon, 29 Jul 2019 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564437147;
 bh=yjigvxx86YybWMHsXoZuxfs6oQ3hGSRoi8X7IPY1XvU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ii8Pe7+Mt+dfsusRGZqDBfeDyTxTeOUI6HLEq5rAf7TvvSk+dLAuoU3MlQVN+OCGc
 C3KKRwz+N2JkXD+8ZMd7o/DSpNn0EOLL6vsyuvOZf6TXSPlh2VNHLkDlYx4EJEQL7i
 UjvXndKRBQujiIjQEDfUprehL4TdVN4r61Uo5kIE=
Date: Mon, 29 Jul 2019 14:52:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87ef2cj3gd.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1907291446320.1237@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-4-julien.grall@arm.com> <87o91hht9c.fsf@epam.com>
 <89065edf-d75c-81dd-0249-a5554feeab51@arm.com> <87ef2cj3gd.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/7] xen/arm: Rework psr_mode_is_32bit()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPiAKPiA+IEhpLAo+ID4KPiA+IE9uIDI2LzA3LzIwMTkgMTM6MzEsIFZvbG9k
eW15ciBCYWJjaHVrIHdyb3RlOgo+ID4+Cj4gPj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiA+Pgo+
ID4+PiBwc3JfbW9kZV9pc18zMmJpdCgpIHByb3RvdHlwZSBkb2VzIG5vdCBtYXRjaCB0aGUgcmVz
dCBvZiB0aGUgaGVscGVycyBmb3IKPiA+Pj4gdGhlIHByb2Nlc3Mgc3RhdGUuIExvb2tpbmcgYXQg
dGhlIGNhbGxlcnMsIG1vc3Qgb2YgdGhlbSB3aWxsIGFjY2Vzcwo+ID4+PiBzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyBqdXN0IGZvciBjYWxsaW5nIHBzcl9tb2RlX2lzXzMyYml0KCkuCj4gPj4+Cj4gPj4+
IFRoZSBtYWNybyBpcyBub3cgcmV3b3JrZWQgdG8gdGFrZSBhIHN0cnVjdCBjcHVfdXNlcl9yZWdz
IGluIHBhcmFtZXRlci4KPiA+Pj4gQXQgdGhlIHNhbWUgdGltZSB0YWtlIHRoZSBvcHBvcnR1bml0
eSB0byBzd2l0Y2ggdG8gYSBzdGF0aWMgaW5saW5lCj4gPj4+IGhlbHBlci4KPiA+PiBJJ20gYSBi
aXQgY29uY2VybmVkIGFib3V0IG5hbWluZyBub3cuIEFzIHBzcl9tb2RlX2lzXzMyYml0KCkgaXMg
bm93IGhhdmUKPiA+PiBubyBwc3IgcGFyYW1ldGVyLCBhbmQgQVJNIEFSTSB1c2VzIHRlcm0gInN0
YXRlIiBpbnN0ZWFkIG9mICJtb2RlIiwgbWF5YmUKPiA+PiBpdCBpcyB3b3J0aCB0byByZW5hbWUg
dGhpcyBoZWxwZXIgdG8gc29tZXRoaW5nIGxpa2UgImlzXzMyYml0X3N0YXRlIj8KPiA+Cj4gPiBJ
dCByZWFsbHkgZGVwZW5kcyBob3cgeW91IHNlZSBpdC4gVGhlIGJpdCBpcyBwYXJ0IG9mIHRoZSAi
bW9kZSIgZmllbGQsCj4gPiBzbyB0ZWNobmljYWxseSB3ZSBhcmUgY2hlY2tpbmcgd2hldGhlciB0
aGUgbW9kZSBjb3JyZXNwb25kcyB0byBhCj4gPiAzMi1iaXQgb25lIG9yIG5vdC4gVGhpcyBpcyBh
bHNvIGlubGluZSB3aXRoIHRoZSByZXN0IG9mIHRoZSBoZWxwZXJzCj4gPiB3aXRoaW4gdGhpcyBo
ZWFkZXIuCj4gPgo+ID4gSSB3b3VsZCBiZSB3aWxsaW5nIHRvIGNvbnNpZGVyIHJlbmFtaW5nIHRo
ZSBoZWxwZXIgdG8gcmVnc19tb2RlX2lzXzMyYml0KCkuCj4gSSdtIGZpbmUgd2l0aCB0aGlzIG5h
bWUuCgpUaGUgcGF0Y2ggaXMgZmluZSBieSBtZSwgYXMgaXMsIG9yIHdpdGggdGhlIG5hbWUgY2hh
bmdlZCB0bwpyZWdzX21vZGVfaXNfMzJiaXQuIChJIGRpZG4ndCBjb21taXQgaXQuKQoKRWl0aGVy
IHdheToKClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
