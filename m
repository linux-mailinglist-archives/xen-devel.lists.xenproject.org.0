Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E034DABA2A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 16:04:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Enq-0006ah-2a; Fri, 06 Sep 2019 14:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kJod=XB=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1i6Eno-0006aW-MK
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 14:01:28 +0000
X-Inumbo-ID: d10d6e8f-d0ae-11e9-abf6-12813bfff9fa
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d10d6e8f-d0ae-11e9-abf6-12813bfff9fa;
 Fri, 06 Sep 2019 14:01:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C476768B05; Fri,  6 Sep 2019 16:01:23 +0200 (CEST)
Date: Fri, 6 Sep 2019 16:01:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20190906140123.GA9894@lst.de>
References: <20190905113408.3104-1-hch@lst.de>
 <20190905113408.3104-10-hch@lst.de>
 <e4f9b393-2631-57cd-f42f-3581e75ab9a3@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4f9b393-2631-57cd-f42f-3581e75ab9a3@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Xen-devel] [PATCH 09/11] swiotlb-xen: simplify cache
 maintainance
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
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, gross@suse.com,
 xen-devel@lists.xenproject.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDk6NTI6MTJBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IFdlIG5lZWQgbm9wIGRlZmluaXRpb25zIG9mIHRoZXNlIHR3byBmb3IgeDg2Lgo+
IAo+IEV2ZXJ5dGhpbmcgYnVpbGRzIG5vdyBidXQgdGhhdCdzIHByb2JhYmx5IGJlY2F1c2UgdGhl
IGNhbGxzIGFyZSB1bmRlcgo+ICdpZiAoIWRldl9pc19kbWFfY29oZXJlbnQoZGV2KSknIHdoaWNo
IGlzIGFsd2F5cyBmYWxzZSBzbyBjb21waWxlcgo+IG9wdGltaXplZCBpcyBvdXQuIEkgZG9uJ3Qg
dGhpbmsgd2Ugc2hvdWxkIHJlbHkgb24gdGhhdC4KClRoYXQgaXMgaG93IGEgbG90IG9mIHRoZSBr
ZXJuZWwgd29ya3MuICBQcm92aWRlIHByb3R5cGVzIG9ubHkgZm9yIGNvZGUKdGhhdCBpcyBzZW1h
bnRpY2FsbHkgY29tcGlsZWQsIGJ1dCBjYW4ndCBldmVyIGJlIGNhbGxlZCBkdWUgdG8KSVNfRU5B
QkxFRCgpIGNoZWNrcy4gIEl0IHRvb2sgbWUgYSB3aGlsZSB0byBnZXQgdXNlZCB0byBpdCwgYnV0
IGl0CmFjdHVhbGx5IGlzIHByZXR0eSBuaWNlIGFzIHRoZSBsaW5rZXIgZG9lcyB0aGUgd29yayBm
b3IgeW91IHRvIGNoZWNrCnRoYXQgaXQgcmVhbGx5IGlzIG5ldmVyIGNhbGxlZC4gIE11Y2ggYmV0
dGVyIHRoYW4gc2F5IGEgQlVJTERfQlVHX09OKCkuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
