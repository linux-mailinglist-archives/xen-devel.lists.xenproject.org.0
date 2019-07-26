Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F502766FC
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:12:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqzyM-0003xJ-2E; Fri, 26 Jul 2019 13:09:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqzyK-0003x9-6n
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:09:20 +0000
X-Inumbo-ID: 934945ba-afa6-11e9-adda-47f84e4dde73
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 934945ba-afa6-11e9-adda-47f84e4dde73;
 Fri, 26 Jul 2019 13:09:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67B6337;
 Fri, 26 Jul 2019 06:09:17 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 755343F694;
 Fri, 26 Jul 2019 06:09:17 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-4-julien.grall@arm.com> <87o91hht9c.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <89065edf-d75c-81dd-0249-a5554feeab51@arm.com>
Date: Fri, 26 Jul 2019 14:09:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87o91hht9c.fsf@epam.com>
Content-Language: en-US
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8wNy8yMDE5IDEzOjMxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBwc3JfbW9kZV9pc18zMmJpdCgpIHByb3RvdHlwZSBk
b2VzIG5vdCBtYXRjaCB0aGUgcmVzdCBvZiB0aGUgaGVscGVycyBmb3IKPj4gdGhlIHByb2Nlc3Mg
c3RhdGUuIExvb2tpbmcgYXQgdGhlIGNhbGxlcnMsIG1vc3Qgb2YgdGhlbSB3aWxsIGFjY2Vzcwo+
PiBzdHJ1Y3QgY3B1X3VzZXJfcmVncyBqdXN0IGZvciBjYWxsaW5nIHBzcl9tb2RlX2lzXzMyYml0
KCkuCj4+Cj4+IFRoZSBtYWNybyBpcyBub3cgcmV3b3JrZWQgdG8gdGFrZSBhIHN0cnVjdCBjcHVf
dXNlcl9yZWdzIGluIHBhcmFtZXRlci4KPj4gQXQgdGhlIHNhbWUgdGltZSB0YWtlIHRoZSBvcHBv
cnR1bml0eSB0byBzd2l0Y2ggdG8gYSBzdGF0aWMgaW5saW5lCj4+IGhlbHBlci4KPiBJJ20gYSBi
aXQgY29uY2VybmVkIGFib3V0IG5hbWluZyBub3cuIEFzIHBzcl9tb2RlX2lzXzMyYml0KCkgaXMg
bm93IGhhdmUKPiBubyBwc3IgcGFyYW1ldGVyLCBhbmQgQVJNIEFSTSB1c2VzIHRlcm0gInN0YXRl
IiBpbnN0ZWFkIG9mICJtb2RlIiwgbWF5YmUKPiBpdCBpcyB3b3J0aCB0byByZW5hbWUgdGhpcyBo
ZWxwZXIgdG8gc29tZXRoaW5nIGxpa2UgImlzXzMyYml0X3N0YXRlIj8KCkl0IHJlYWxseSBkZXBl
bmRzIGhvdyB5b3Ugc2VlIGl0LiBUaGUgYml0IGlzIHBhcnQgb2YgdGhlICJtb2RlIiBmaWVsZCwg
c28gCnRlY2huaWNhbGx5IHdlIGFyZSBjaGVja2luZyB3aGV0aGVyIHRoZSBtb2RlIGNvcnJlc3Bv
bmRzIHRvIGEgMzItYml0IG9uZSBvciBub3QuIApUaGlzIGlzIGFsc28gaW5saW5lIHdpdGggdGhl
IHJlc3Qgb2YgdGhlIGhlbHBlcnMgd2l0aGluIHRoaXMgaGVhZGVyLgoKSSB3b3VsZCBiZSB3aWxs
aW5nIHRvIGNvbnNpZGVyIHJlbmFtaW5nIHRoZSBoZWxwZXIgdG8gcmVnc19tb2RlX2lzXzMyYml0
KCkuCgpPbiBhIHNpZGUgbm90ZSwgTGludXggaXMgdXNpbmcgZXhhY3RseSB0aGUgc2FtZSB0ZXJt
IChzZWUgdmNwdV9tb2RlX2lzXzMyYml0KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
