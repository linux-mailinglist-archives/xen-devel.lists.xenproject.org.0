Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C523664A3C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 17:58:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlEvf-0006z0-H6; Wed, 10 Jul 2019 15:54:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlEvd-0006yv-TZ
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 15:54:45 +0000
X-Inumbo-ID: 0807614e-a32b-11e9-8fb5-83d019088869
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0807614e-a32b-11e9-8fb5-83d019088869;
 Wed, 10 Jul 2019 15:54:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E77A2B;
 Wed, 10 Jul 2019 08:54:42 -0700 (PDT)
Received: from [10.119.48.95] (unknown [10.119.48.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 142B03F246;
 Wed, 10 Jul 2019 08:54:42 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-3-sstabellini@kernel.org>
 <024a54c3-29b6-92d2-0cf3-e74297282b31@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <12f22d4a-0a39-6878-1471-fd2fdbfd54f9@arm.com>
Date: Wed, 10 Jul 2019 16:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <024a54c3-29b6-92d2-0cf3-e74297282b31@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/6] xen/arm: keep track of
 reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzgvMTkgODowMiBQTSwgT2xla3NhbmRyIHdyb3RlOgo+IE9uIDIyLjA2LjE5IDAy
OjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gSSBoYXZlIHRlc3RlZCB0aGlzIHNlcmll
cyBhbmQgZ290IHRoZSBzYW1lIGJlaGF2aW9yIGFzIHdpdGggVjIgWzFdLgo+IAo+IFRoZSAibm9u
LXJlc2VydmVkLW1lbW9yeSIgbm9kZSBpbiBteSBkZXZpY2UtdHJlZSAKPiAoc3JhbUA0N0ZGRjAw
MC0+c2NwX3NobWVtQDApIGlzIHN0aWxsIGludGVycHJldGVkIGFzIGEgInJlc2VydmVkLW1lbW9y
eSIuCj4gSSB0aGluaywgdGhpcyB0YWtlcyBwbGFjZSBiZWNhdXNlIGN1cnJlbnQgaW1wbGVtZW50
YXRpb24gaXRlcmF0ZXMgb3ZlciAKPiBhbGwgZGV2aWNlIHRyZWUgbm9kZXMgc3RhcnRpbmcKPiBm
cm9tIHJlYWwgInJlc2VydmVkLW1lbW9yeSIgbm9kZSB1cCB0byB0aGUgZW5kIG9mIHRoZSBkZXZp
Y2UgdHJlZS4gQW5kIAo+IGlmIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSAibm9uLXJlc2VydmVkLW1l
bW9yeSIgbm9kZSAod2l0aCBhIHN1aXRhYmxlIAo+IGRlcHRoIGFuZCB2YWxpZCAicmVnIiBwcm9w
ZXJ0eSkKPiBsb2NhdGVkIGRvd24gdGhlIGRldmljZSB0cmVlLCBpdCB3aWxsIGJlIG1pc3Rha2Vu
bHkgaW5zZXJ0ZWQgdG8gCj4gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIChhcyBpbiBteSBjYXNlKS4K
ClRoZSBwcm9ibGVtIGlzIGJlY2F1c2Ugd2UgYXJlIHBhc3NpbmcgdGhlIGRlcHRoIG9mIHRoZSBw
YXJlbnQuIEJlY2F1c2UgCm9mIHRoYXQsIGl0IHdpbGwgbG9vayBmb3IgYW55dGhpbmcgYXQgdGhl
IHNhbWUgZGVwdGggKHNlZSB0aGUgY2hlY2sgCmRlcHRoID49IG1pbl9kZXB0aCBpbiBkZXZpY2Vf
dHJlZV9mb3JfZWFjaF9ub2RlKS4KClRoZSBjb3JyZWN0IHNvbHV0aW9uIGhlcmUsIHdvdWxkIGJl
IHRvIHVzZSB0aGUgZGVwdGggb2YgdGhlIGNoaWxkIChpLmUgCmRlcHRoICsgMSkgd2hlbiBjYWxs
aW5nIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUgaW4gCnByb2Nlc3NfcmVzZXJ2ZWRfbWVtb3J5
X25vZGUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
