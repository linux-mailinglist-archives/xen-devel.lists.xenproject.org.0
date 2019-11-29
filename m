Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C710D54A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 12:58:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaesb-0001bT-R6; Fri, 29 Nov 2019 11:56:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaesa-0001bO-BZ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 11:56:08 +0000
X-Inumbo-ID: 39d19850-129f-11ea-a3e3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 39d19850-129f-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 11:56:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 521DBACC4;
 Fri, 29 Nov 2019 11:56:06 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191129113131.1954-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d0a90f6-3def-a970-6dca-8d1f3eb66c1c@suse.com>
Date: Fri, 29 Nov 2019 12:56:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129113131.1954-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen-blkback: allow module to be cleanly
 unloaded
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMjozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL2RyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL3hlbmJ1cy5jCj4gQEAgLTE3Myw2ICsxNzMsOCBAQCBzdGF0aWMgc3RydWN0IHhlbl9ibGtp
ZiAqeGVuX2Jsa2lmX2FsbG9jKGRvbWlkX3QgZG9taWQpCj4gIAlpbml0X2NvbXBsZXRpb24oJmJs
a2lmLT5kcmFpbl9jb21wbGV0ZSk7Cj4gIAlJTklUX1dPUksoJmJsa2lmLT5mcmVlX3dvcmssIHhl
bl9ibGtpZl9kZWZlcnJlZF9mcmVlKTsKPiAgCj4gKwlfX21vZHVsZV9nZXQoVEhJU19NT0RVTEUp
Owo+ICsKPiAgCXJldHVybiBibGtpZjsKPiAgfQo+ICAKPiBAQCAtMzIwLDYgKzMyMiw4IEBAIHN0
YXRpYyB2b2lkIHhlbl9ibGtpZl9mcmVlKHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmKQo+ICAKPiAg
CS8qIE1ha2Ugc3VyZSBldmVyeXRoaW5nIGlzIGRyYWluZWQgYmVmb3JlIHNodXR0aW5nIGRvd24g
Ki8KPiAgCWttZW1fY2FjaGVfZnJlZSh4ZW5fYmxraWZfY2FjaGVwLCBibGtpZik7Cj4gKwo+ICsJ
bW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4gIH0KCkkgcmVhbGl6ZSB0aGVyZSBhcmUgdmFyaW91
cyBleGFtcGxlIG9mIHRoaXMgaW4gdGhlIHRyZWUsIGJ1dAppc24ndCB0aGlzIGEgZmxhd2VkIGFw
cHJvYWNoPyBfX21vZHVsZV9nZXQoKSAobm9yIGV2ZW4KdHJ5X21vZHVsZV9nZXQoKSkgd2lsbCBw
cmV2ZW50IGFuIHVubG9hZCBhdHRlbXB0IGFoZWFkIG9mIGl0CmdldHRpbmcgaW52b2tlZCwgd2hp
bGUgZXhlY3V0aW9uIGlzIGFscmVhZHkgaW4gdGhpcyBtb2R1bGUncwoudGV4dCBzZWN0aW9uLiBJ
IHRoaW5rIHRoZSB4ZW5idXMgZHJpdmVyIHNob3VsZCBkbyB0aGlzCmJlZm9yZSBjYWxsaW5nIC0+
cHJvYmUoKSwgaW4gY2FzZSBvZiBpdHMgZmFpbHVyZSwgYW5kIGFmdGVyCmEgc3VjY2Vzc2Z1bCBj
YWxsIHRvIC0+cmVtb3ZlKCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
