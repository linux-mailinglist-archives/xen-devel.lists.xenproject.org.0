Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CA9060C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 18:45:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyfK9-0001xb-VO; Fri, 16 Aug 2019 16:43:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vuJE=WM=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1hyfK8-0001xT-F8
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 16:43:32 +0000
X-Inumbo-ID: fab5a708-c044-11e9-813a-bc764e2007e4
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fab5a708-c044-11e9-813a-bc764e2007e4;
 Fri, 16 Aug 2019 16:43:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B7255227A81; Fri, 16 Aug 2019 18:43:28 +0200 (CEST)
Date: Fri, 16 Aug 2019 18:43:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20190816164328.GB3629@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-4-hch@lst.de>
 <8585fb27-14e0-888c-6749-6862b4e16418@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8585fb27-14e0-888c-6749-6862b4e16418@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Xen-devel] [PATCH 03/11] xen/arm: pass one less argument to
 dma_cache_maint
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDI6Mzc6NThQTSArMDEwMCwgUm9iaW4gTXVycGh5IHdy
b3RlOgo+IE9uIDE2LzA4LzIwMTkgMTQ6MDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+PiBJ
bnN0ZWFkIG9mIHRha2luZyBhcGFydCB0aGUgZG1hIGFkZHJlc3MgaW4gYm90aCBjYWxsZXJzIGRv
IGl0IGluc2lkZQo+PiBkbWFfY2FjaGVfbWFpbnQgaXRzZWxmLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4gLS0tCj4+ICAgYXJjaC9hcm0veGVu
L21tLmMgfCAxMCArKysrKystLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIv
YXJjaC9hcm0veGVuL21tLmMKPj4gaW5kZXggOTA1NzRkODlkMGQ0Li5kOWRhMjRmZGEyZjcgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4+ICsrKyBiL2FyY2gvYXJtL3hlbi9tbS5j
Cj4+IEBAIC00MywxMyArNDMsMTUgQEAgc3RhdGljIGJvb2wgaHlwZXJjYWxsX2NmbHVzaCA9IGZh
bHNlOwo+PiAgICAgLyogZnVuY3Rpb25zIGNhbGxlZCBieSBTV0lPVExCICovCj4+ICAgLXN0YXRp
YyB2b2lkIGRtYV9jYWNoZV9tYWludChkbWFfYWRkcl90IGhhbmRsZSwgdW5zaWduZWQgbG9uZyBv
ZmZzZXQsCj4+IC0Jc2l6ZV90IHNpemUsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwgZW51
bSBkbWFfY2FjaGVfb3Agb3ApCj4+ICtzdGF0aWMgdm9pZCBkbWFfY2FjaGVfbWFpbnQoZG1hX2Fk
ZHJfdCBoYW5kbGUsIHNpemVfdCBzaXplLAo+PiArCQllbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBk
aXIsIGVudW0gZG1hX2NhY2hlX29wIG9wKQo+PiAgIHsKPj4gICAJc3RydWN0IGdudHRhYl9jYWNo
ZV9mbHVzaCBjZmx1c2g7Cj4+ICAgCXVuc2lnbmVkIGxvbmcgeGVuX3BmbjsKPj4gKwl1bnNpZ25l
ZCBsb25nIG9mZnNldCA9IGhhbmRsZSAmIH5QQUdFX01BU0s7Cj4+ICAgCXNpemVfdCBsZWZ0ID0g
c2l6ZTsKPj4gICArCW9mZnNldCAmPSBQQUdFX01BU0s7Cj4KPiBBaGVtLi4uIHByZXN1bWFibHkg
dGhhdCBzaG91bGQgYmUgaGFuZGxlLCBub3Qgb2Zmc2V0LgoKT29vcHMsIHllcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
