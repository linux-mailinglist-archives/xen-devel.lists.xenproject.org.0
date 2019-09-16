Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFDB4158
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 21:50:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9wxu-0006Oo-Id; Mon, 16 Sep 2019 19:47:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jHNx=XL=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1i9wxt-0006Oj-5f
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 19:47:13 +0000
X-Inumbo-ID: c63de40c-d8ba-11e9-b299-bc764e2007e4
Received: from shards.monkeyblade.net (unknown [2620:137:e000::1:9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c63de40c-d8ba-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 19:47:11 +0000 (UTC)
Received: from localhost (80-167-222-154-cable.dk.customer.tdc.net
 [80.167.222.154]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 70FB6153F26F6;
 Mon, 16 Sep 2019 12:47:09 -0700 (PDT)
Date: Mon, 16 Sep 2019 21:47:07 +0200 (CEST)
Message-Id: <20190916.214707.1312089672859838604.davem@davemloft.net>
To: dongli.zhang@oracle.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1568605619-22219-1-git-send-email-dongli.zhang@oracle.com>
References: <1568605619-22219-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 16 Sep 2019 12:47:11 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH 1/1] xen-netfront: do not assume
 sk_buff_head list is empty in error handling
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
Cc: jgross@suse.com, sstabellini@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRG9uZ2xpIFpoYW5nIDxkb25nbGkuemhhbmdAb3JhY2xlLmNvbT4KRGF0ZTogTW9uLCAx
NiBTZXAgMjAxOSAxMTo0Njo1OSArMDgwMAoKPiBXaGVuIHNrYl9zaGluZm8oc2tiKSBpcyBub3Qg
YWJsZSB0byBjYWNoZSBleHRyYSBmcmFnbWVudCAodGhhdCBpcywKPiBza2Jfc2hpbmZvKHNrYikt
Pm5yX2ZyYWdzID49IE1BWF9TS0JfRlJBR1MpLCB4ZW5uZXRfZmlsbF9mcmFncygpIGFzc3VtZXMK
PiB0aGUgc2tfYnVmZl9oZWFkIGxpc3QgaXMgYWxyZWFkeSBlbXB0eS4gQXMgYSByZXN1bHQsIGNv
bnMgaXMgaW5jcmVhc2VkIG9ubHkKPiBieSAxIGFuZCByZXR1cm5zIHRvIGVycm9yIGhhbmRsaW5n
IHBhdGggaW4geGVubmV0X3BvbGwoKS4KPiAKPiBIb3dldmVyLCBpZiB0aGUgc2tfYnVmZl9oZWFk
IGxpc3QgaXMgbm90IGVtcHR5LCBxdWV1ZS0+cngucnNwX2NvbnMgbWF5IGJlCj4gc2V0IGluY29y
cmVjdGx5LiBUaGF0IGlzLCBxdWV1ZS0+cngucnNwX2NvbnMgd291bGQgcG9pbnQgdG8gdGhlIHJ4
IHJpbmcKPiBidWZmZXIgZW50cmllcyB3aG9zZSBxdWV1ZS0+cnhfc2tic1tpXSBhbmQgcXVldWUt
PmdyYW50X3J4X3JlZltpXSBhcmUKPiBhbHJlYWR5IGNsZWFyZWQgdG8gTlVMTC4gVGhpcyBsZWFk
cyB0byBOVUxMIHBvaW50ZXIgYWNjZXNzIGluIHRoZSBuZXh0Cj4gaXRlcmF0aW9uIHRvIHByb2Nl
c3MgcnggcmluZyBidWZmZXIgZW50cmllcy4KPiAKPiBCZWxvdyBpcyBob3cgeGVubmV0X3BvbGwo
KSBkb2VzIGVycm9yIGhhbmRsaW5nLiBBbGwgcmVtYWluaW5nIGVudHJpZXMgaW4KPiB0bXBxIGFy
ZSBhY2NvdW50ZWQgdG8gcXVldWUtPnJ4LnJzcF9jb25zIHdpdGhvdXQgYXNzdW1pbmcgaG93IG1h
bnkKPiBvdXRzdGFuZGluZyBza2JzIGFyZSByZW1haW5lZCBpbiB0aGUgbGlzdC4KPiAKPiAgOTg1
IHN0YXRpYyBpbnQgeGVubmV0X3BvbGwoc3RydWN0IG5hcGlfc3RydWN0ICpuYXBpLCBpbnQgYnVk
Z2V0KQo+IC4uLiAuLi4KPiAxMDMyICAgICAgICAgICBpZiAodW5saWtlbHkoeGVubmV0X3NldF9z
a2JfZ3NvKHNrYiwgZ3NvKSkpIHsKPiAxMDMzICAgICAgICAgICAgICAgICAgIF9fc2tiX3F1ZXVl
X2hlYWQoJnRtcHEsIHNrYik7Cj4gMTAzNCAgICAgICAgICAgICAgICAgICBxdWV1ZS0+cngucnNw
X2NvbnMgKz0gc2tiX3F1ZXVlX2xlbigmdG1wcSk7Cj4gMTAzNSAgICAgICAgICAgICAgICAgICBn
b3RvIGVycjsKPiAxMDM2ICAgICAgICAgICB9Cj4gCj4gSXQgaXMgYmV0dGVyIHRvIGFsd2F5cyBo
YXZlIHRoZSBlcnJvciBoYW5kbGluZyBpbiB0aGUgc2FtZSB3YXkuCj4gCj4gRml4ZXM6IGFkNGYx
NWRjMmM3MCAoInhlbi9uZXRmcm9udDogZG9uJ3QgYnVnIGluIGNhc2Ugb2YgdG9vIG1hbnkgZnJh
Z3MiKQo+IFNpZ25lZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5j
b20+CgpBcHBsaWVkIGFuZCBxdWV1ZWQgdXAgZm9yIC1zdGFibGUuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
