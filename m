Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DAC11AB01
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 13:34:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if185-0002BA-R0; Wed, 11 Dec 2019 12:30:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1if184-0002B5-6n
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 12:30:08 +0000
X-Inumbo-ID: f548d548-1c11-11ea-8b27-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f548d548-1c11-11ea-8b27-12813bfff9fa;
 Wed, 11 Dec 2019 12:30:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BDB67AE50;
 Wed, 11 Dec 2019 12:30:04 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 SeongJae Park <sj38.park@gmail.com>
References: <20191211042428.5961-1-sjpark@amazon.de>
 <20191211042657.6037-1-sjpark@amazon.de> <20191211114651.GN980@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f626a29c-e307-38c8-b08d-471ad9b871e4@suse.com>
Date: Wed, 11 Dec 2019 13:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211114651.GN980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 1/3] xenbus/backend: Add memory pressure
 handler callback
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
Cc: axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTI6NDYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gV2VkLCBEZWMg
MTEsIDIwMTkgYXQgMDQ6MjY6NTdBTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3cm90ZToKPj4gKwo+
PiAgIAlyZXR1cm4gMDsKPj4gICB9Cj4+ICAgc3Vic3lzX2luaXRjYWxsKHhlbmJ1c19wcm9iZV9i
YWNrZW5kX2luaXQpOwo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVuYnVzLmggYi9pbmNs
dWRlL3hlbi94ZW5idXMuaAo+PiBpbmRleCA4NjljODE2ZDVmOGMuLjE5NjI2MDAxNzY2NiAxMDA2
NDQKPj4gLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVzLmgKPj4gKysrIGIvaW5jbHVkZS94ZW4veGVu
YnVzLmgKPj4gQEAgLTEwNCw2ICsxMDQsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RyaXZlciB7Cj4+ICAg
CXN0cnVjdCBkZXZpY2VfZHJpdmVyIGRyaXZlcjsKPj4gICAJaW50ICgqcmVhZF9vdGhlcmVuZF9k
ZXRhaWxzKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KTsKPj4gICAJaW50ICgqaXNfcmVhZHkp
KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwo+PiArCXZvaWQgKCpyZWNsYWltKShzdHJ1Y3Qg
eGVuYnVzX2RldmljZSAqZGV2KTsKPiAKPiByZWNsYWltX21lbW9yeSAoaWYgSnVlcmdlbiBhZ3Jl
ZXMpLgoKSSBkbyBhZ3JlZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
