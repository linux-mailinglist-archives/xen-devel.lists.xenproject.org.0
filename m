Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B457CE1D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 22:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsv3b-0002Q7-KK; Wed, 31 Jul 2019 20:18:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsv3a-0002Q2-VA
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 20:18:42 +0000
X-Inumbo-ID: 63c5fbb8-b3d0-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 63c5fbb8-b3d0-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 20:18:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8136344;
 Wed, 31 Jul 2019 13:18:41 -0700 (PDT)
Received: from [10.37.9.90] (unknown [10.37.9.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37CF03F694;
 Wed, 31 Jul 2019 13:18:41 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-23-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301240170.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a4717506-26bc-d822-88f3-521d82641ccf@arm.com>
Date: Wed, 31 Jul 2019 21:18:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301240170.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 22/35] xen/arm32: head: Rework UART
 initialization on boot CPU
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzAvMTkgODo0MCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMjIgSnVsIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQEAgLTQ5Nywx
MSArNDk3LDE1IEBAIEVOVFJZKHN3aXRjaF90dGJyKQo+PiAgIAo+PiAgICNpZmRlZiBDT05GSUdf
RUFSTFlfUFJJTlRLCj4+ICAgLyoKPj4gLSAqIEJyaW5nIHVwIHRoZSBVQVJULgo+PiAtICogcjEx
OiBFYXJseSBVQVJUIGJhc2UgYWRkcmVzcwo+PiAtICogQ2xvYmJlcnMgcjAtcjIKPj4gKyAqIElu
aXRpYWxpemUgdGhlIFVBUlQuIFNob3VsZCBvbmx5IGJlIGNhbGxlZCBvbiB0aGUgYm9vdCBDUFUu
Cj4+ICsgKgo+PiArICogT3VwdXQ6Cj4gICAgICAgIF4gdGhpcyBzaG91bGQgYmUgb3V0cHV0LCBh
bmQgaW4gdGhlIGFybTY0IHBhdGNoIHRvbyAoYWxyZWFkeSBjb21taXR0ZWQpCgpNb3N0IG9mIHRo
ZSBhcm0zMiBjb2RlIGlzIGEgY29weSBhbmQgcGFzdGUgZnJvbSBhcm02NCB3aXRoIGxpdHRsZSAK
YWRhcHRhdGlvbiEgSGVuY2UgdGhlIHNhbWUgdHlwbyA6KS4KCkkgaGF2ZSBmaXhlZCB0aGUgYXJt
MzIgcGFydCBkaXJlY3RseSBpbiB0aGlzIHBhdGNoIGFuZCBjcmVhdGUgYSBuZXcgb25lIApmb3Ig
Zml4aW5nIHRoZSBhcm02NCBwYXJ0LgoKCj4gCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KClRoYW5rIHlvdSEKCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
