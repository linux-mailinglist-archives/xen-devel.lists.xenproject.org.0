Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F620BD11B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:59:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCp36-0006i0-R5; Tue, 24 Sep 2019 17:56:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0Hj=XT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iCp35-0006hv-6D
 for xen-devel@lists.xen.org; Tue, 24 Sep 2019 17:56:27 +0000
X-Inumbo-ID: a0659c4e-def4-11e9-9625-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id a0659c4e-def4-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 17:56:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFE5F207FD;
 Tue, 24 Sep 2019 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569347785;
 bh=mWoDNvtBhN2IgY2e+1a0VE+tflqUdJrQrFmuRcrT+18=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=b/b7FjC134ijQ+n7Q+9/B90y7YFNdoEM2xaJd/RSJdiW/tYs/bQflAu4PqMkR2ofb
 6cE5oLQIB/fy7xmW/QuzFsbNt2Ds0LwYfU8MqyoH1zKfBnc9+WdeAc4Xb3zDPe5Hza
 +m7OCTNm9J+TDJZy41xK3fctZ88QjxadY1S6L8cM=
Date: Tue, 24 Sep 2019 10:56:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
Message-ID: <alpine.DEB.2.21.1909241056070.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-7-sstabellini@kernel.org>
 <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 7/8] xen/arm: introduce nr_spis
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gOC8yMS8xOSA0OjUzIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBXZSBk
b24ndCBoYXZlIGEgY2xlYXIgd2F5IHRvIGtub3cgaG93IG1hbnkgdmlydHVhbCBTUElzIHdlIG5l
ZWQgZm9yIHRoZQo+ID4gZG9tMC1sZXNzIGRvbWFpbnMuIEludHJvZHVjZSBhIG5ldyBvcHRpb24g
dW5kZXIgeGVuLGRvbWFpbiB0byBzcGVjaWZ5Cj4gPiB0aGUgbnVtYmVyIG9mIFNQSXMgdG8gYWxs
b2NhdGUgZm9yIGEgZG9tYWluLgo+ID4gCj4gPiBUaGUgcHJvcGVydHkgaXMgb3B0aW9uYWwuIFdo
ZW4gYWJzZW50LCB3ZSdsbCB1c2UgdGhlIHBoeXNpY2FsIG51bWJlciBvZgo+ID4gR0lDIGxpbmVz
IGZvciBkb20wLWxlc3MgZG9tYWlucywganVzdCBsaWtlIGZvciBkb20wLiBHaXZlbiB0aGF0Cj4g
PiBkb20wLWxlc3MgVk1zIGFyZSBtZWFudCBmb3Igc3RhdGljIHBhcnRpdGlvbmluZyBzY2VuYXJp
b3Mgd2hlcmUgdGhlCj4gPiBudW1iZXIgb2YgVk1zIGlzIHZlcnkgbG93LCBpbmNyZWFzZWQgbWVt
b3J5IG92ZXJoZWFkIHNob3VsZCBub3QgYmUgYQo+ID4gcHJvYmxlbSwgYW5kIGl0IGlzIHBvc3Np
YmxlIHRvIG1pbmltaXplIGl0IHVzaW5nICJucl9zcGlzIi4KPiA+IAo+ID4gUmVtb3ZlIHRoZSBv
bGQgc2V0dGluZyBvZiBucl9zcGlzIGJhc2VkIG9uIHRoZSBwcmVzZW5jZSBvZiB0aGUgdnBsMDEx
Lgo+IAo+IEkgYW0gYWZyYWlkIHRoaXMgc3RpbGwgZG9lcyBub3QgZXhwbGFpbiB0aGUgaW1wbGlj
YXRpb25zIG9mIHRoaXMgcGF0Y2ggdG8KPiBjdXJyZW50IHNldHVwICh3aXRoIGFuZCB3aXRob3V0
IFZQTDAxMSkuCj4gCj4gRm9yIGluc3RhbmNlLCB3aXRoIHlvdXIgY2hhbmdlLCBWUEwwMTEgbWF5
IG5vdCB3b3JrIGFueW1vcmUuIEltYWdpbmUgd2UgZGVjaWRlCj4gdG8gcHVzaCB0aGUgdnBsMDEx
IGludGVycnVwdCB0b3dhcmRzIHRoZSBlbmQgb2YgdGhlIEludGVycnVwdCBJRCBzcGFjZSAoaS5l
Lgo+IDEwMTkpLgo+IAo+IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0aGUgdXNlciB0byBoYXZlIHRv
IHNlbGVjdCBucl9zcGlzIGJ5IGhpbXNlbGYgZm9yIHRoaXMKPiBjYXNlLgo+IAo+IFJlZ2FyZGlu
ZyB0aGUgY2hhbmdlIHdpdGhvdXQgdnBsMDExLCB0aGlzIGlzIG5vdCBleHBsYWluZWQgd2h5IGFs
bCB0aGUgZG9tYWlucwo+IChldmVuIHRoZSBvbmUgd2l0aG91dCBTUElzIHJvdXRlZCkgd2lsbCBo
YXZlIFNQSXMgZXhwb3NlZC4gRm9yIGluc3RhbmNlLCBpZgo+IHlvdSB3ZXJlIHRvIGV4cG9zZSAy
NTYgaW50ZXJydXB0cyBmb3IgNCBkb21haW5zLCB0aGlzIHdpbGwgcm91Z2hseSB1c2UgODBLQiBv
Zgo+IG1lbW9yeS4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdoYXQgeW91IGhhZCBpbiBtaW5kIGFz
ICJsb3cgZm9vdHByaW50Ii4KIApXaGF0IGRvIHlvdSB0aGluayBvZiB0aGUgZm9sbG93aW5nOgoK
VGhlIGltcGxpY2F0aW9uIG9mIHRoaXMgY2hhbmdlIGlzIHRoYXQgd2l0aG91dCBucl9zcGlzIGRv
bTBsZXNzIGRvbWFpbnMKZ2V0IHRoZSBzYW1lIGFtb3VudCBvZiBTUEkgYWxsb2NhdGVkIGFzIGRv
bTAsIHJlZ2FyZGxlc3Mgb2YgaG93IG1hbnkKcGh5c2ljYWwgZGV2aWNlcyB0aGV5IGhhdmUgYXNz
aWduZWQsIGFuZCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhleSBoYXZlCmEgdmlydHVhbCBwbDAx
MSAod2hpY2ggYWxzbyBuZWVkcyBhbiBlbXVsYXRlZCBTUEkpLgoKV2hlbiBucl9zcGlzIGlzIHBy
ZXNlbnQsIHRoZSBkb21haW4gZ2V0cyBleGFjdGx5IG5yX3NwaXMgYWxsb2NhdGVkIFNQSXMuCklm
IHRoZSBudW1iZXIgaXMgdG9vIGxvdywgaXQgbWlnaHQgbm90IGJlIGVub3VnaCBmb3IgdGhlIGRl
dmljZXMKYXNzaWduZWQgaXQgdG8gaXQuIElmIHRoZSBudW1iZXIgaXMgbGVzcyB0aGFuIEdVRVNU
X1ZQTDAxMV9TUEksIHRoZQp2aXJ0dWFsIHBsMDExIHdvbid0IHdvcmsuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
