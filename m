Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121484ADA6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 00:10:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdMGB-0006vu-CG; Tue, 18 Jun 2019 22:07:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PyOf=UR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdMG9-0006vm-UJ
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 22:07:21 +0000
X-Inumbo-ID: 71a30d28-9215-11e9-9242-bb75ed623c53
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71a30d28-9215-11e9-9242-bb75ed623c53;
 Tue, 18 Jun 2019 22:07:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7421A2082C;
 Tue, 18 Jun 2019 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560895640;
 bh=nHQBt2e21Sx6o4tmi82c3w6aOmSGaLbVOH4woqLdWy0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Ysic9a4YZBy9HyGlA0r7OU2XXM0blca4l9ifODw8e/7UMSJkzc9jZUUi8vStNGnjb
 /xJ57Q2BQ4rZJHN9QWlHQv+7WP4+xVT7etU1XWftaUHsSD7UN0j0YpXgVdq2GO0iq2
 vAZJHJyoehvqcLm91sVYBQ3rm/BVRu9kIaOQrIyM=
Date: Tue, 18 Jun 2019 15:07:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <bff15c1a-1eaf-4bde-c5dc-a5ada63b4d9f@arm.com>
Message-ID: <alpine.DEB.2.21.1906181415510.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-5-git-send-email-sstabellini@kernel.org>
 <bff15c1a-1eaf-4bde-c5dc-a5ada63b4d9f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 05/10] libxl/xl: add memory policy option
 to iomem
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 ian.jackson@eu.citrix.com, wei.liu2@citrix.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxOCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDMwLzA0LzIwMTkg
MjI6MDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gPiBpbmRl
eCA4OWZlODBmLi5hNmM1ZTMwIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKPiA+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCj4gPiBAQCAtNDE1LDYg
KzQxNSwyMSBAQCBzdGF0aWMgdm9pZCBpbml0X2NvbnNvbGVfaW5mbyhsaWJ4bF9fZ2MgKmdjLAo+
ID4gICAgICAgICAgT25seSAnY2hhbm5lbHMnIHdoZW4gbWFwcGVkIHRvIGNvbnNvbGVzIGhhdmUg
YSBzdHJpbmcgbmFtZS4gKi8KPiA+ICAgfQo+ID4gICArc3RhdGljIHVpbnQzMl90IGxpYnhsX19t
ZW1vcnlfcG9saWN5X3RvX3hjKGxpYnhsX21lbW9yeV9wb2xpY3kgYykKPiA+ICt7Cj4gPiArICAg
IHN3aXRjaCAoYykgewo+ID4gKyAgICBjYXNlIExJQlhMX01FTU9SWV9QT0xJQ1lfQVJNX01FTV9X
QjoKPiA+ICsgICAgICAgIHJldHVybiBNRU1PUllfUE9MSUNZX0FSTV9NRU1fV0I7Cj4gPiArICAg
IGNhc2UgTElCWExfTUVNT1JZX1BPTElDWV9BUk1fREVWX05HUkU6Cj4gPiArICAgICAgICByZXR1
cm4gTUVNT1JZX1BPTElDWV9BUk1fREVWX25HUkU7Cj4gPiArICAgIGNhc2UgTElCWExfTUVNT1JZ
X1BPTElDWV9YODZfVUM6Cj4gPiArICAgICAgICByZXR1cm4gTUVNT1JZX1BPTElDWV9YODZfVUM7
Cj4gPiArICAgIGNhc2UgTElCWExfTUVNT1JZX1BPTElDWV9ERUZBVUxUOgo+ID4gKyAgICBkZWZh
dWx0Ogo+IAo+IExvb2tpbmcgYXQgdGhpcyBhZ2FpbiwgZG9uJ3Qgd2Ugd2FudCB0byBiYWlsIG91
dCBpZiB0aGUgcG9saWN5IGlzIHVua25vd24/IE15Cj4gY29uY2VybiBoZXJlIGlzIHRoZSB1c2Vy
IG1heSBjb25maWd1cmUgd2l0aCBzb21ldGhpbmcgaXQgZGlkbid0IGV4cGVjdC4gVGhlCj4gcmlz
ayBpcyB0aGUgcHJvYmxlbSB3aWxsIGJlIGhhcmQgdG8gZGVidWcuCj4gCj4gSSBhbHNvIGJlbGll
dmUgdGhpcyBjb3VsZCBiZSBwYXJ0IG9mIGxpYnhsX3thcm0seDg2fS5jIGFsbG93aW5nIHVzIHRv
IGZpbHRlcgo+IG1pc3VzZSBlYXJseS4KClRoaXMgc291bmRzIGxpa2UgYSBnb29kIGlkZWEsIEkg
Y2FuIGRvIHRoYXQuIFRoZW4sIEkgY2FuIGFsc28gI2lmZGVmIHRoZQpoeXBlcmNhbGxzIGRlZmlu
ZXMsIGFsdGhvdWdoIGZvciBzb21lIHJlYXNvbiB0b2RheSBsaWJ4bCBkb2Vzbid0IGhhdmUKQ09O
RklHX1g4NiBvciBDT05GSUdfQVJNIHNldCBzbyBJIHdvdWxkIGFsc28gaGF2ZSB0byBkbyB0aGUg
Zm9sbG93aW5nIGluCnRoZSBsaWJ4bCBNYWtlZmlsZToKCmlmZXEgKCQoQ09ORklHX1g4NikseSkK
Q0ZMQUdTX0xJQlhMICs9IC1EQ09ORklHX1g4NgplbHNlCkNGTEFHU19MSUJYTCArPSAtRENPTkZJ
R19BUk0KZW5kaWYKCgo+IElhbiwgV2VpLCBhbnkgb3Bpbmlvbj8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
