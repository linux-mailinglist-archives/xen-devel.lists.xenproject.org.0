Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2124F406F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 07:36:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSxq9-0000Cz-L2; Fri, 08 Nov 2019 06:33:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KUUM=ZA=bombadil.srs.infradead.org=batv+829b58a2b74f0bf5023d+5920+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1iSxq8-0000Cs-Dz
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 06:33:48 +0000
X-Inumbo-ID: afcdb9a8-01f1-11ea-9631-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afcdb9a8-01f1-11ea-9631-bc764e2007e4;
 Fri, 08 Nov 2019 06:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sfdfvBL2vL+6/zKzcRD8BS56fyubhIZ+MnB63+Whqww=; b=FyyBMRXg7xjEFz//LRCdOwL18
 hKB/D3F1bPGKiHdQWF5m35XG4E3WD+6E0CxgvcikgS5iRvO035mZUNmAfQsrTxXbipkMtN7Csh82U
 TkXb00nbArvJ4o9o1oSsuBXDYKdWjjL+gFeJdHZim38W2w/ASDOrOw7R4zUEvGcf9P4Zly7OuHtXi
 R2b9mpCV+5doe05qxCME3B/ZrpaUGvMjyxA/fTYrGvV7sgs0phhNbJEtc/O73szxHJx/zSNnzUmhw
 WnNF01/JTBJLgMj7/spP8/IEmmGPsj93eGRwYEwNwsz/7/7UlAROrdUCayb+qrzFziI1mB1Ncy4fZ
 vWBdHpcGA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iSxpO-0004uP-RP; Fri, 08 Nov 2019 06:33:02 +0000
Date: Thu, 7 Nov 2019 22:33:02 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20191108063302.GA18778@infradead.org>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
 <35c2b322-004e-0e18-87e4-1920dc71bfd5@nvidia.com>
 <20191107200604.GB21728@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191107200604.GB21728@mellanox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [PATCH v2 02/15] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrea Arcangeli <aarcange@redhat.com>, David Zhou <David1.Zhou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6MDY6MDhQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gCj4gPiBlbnVtIG1tdV9yYW5nZV9ub3RpZmllcl9ldmVudCB7Cj4gPiAJTU1V
X05PVElGWV9SRUxFQVNFLAo+ID4gfTsKPiA+IAo+ID4gLi4uYXNzdW1pbmcgdGhhdCB3ZSBzdGF5
IHdpdGggIm1tdV9yYW5nZV9ub3RpZmllciIgYXMgYSBjb3JlIG5hbWUgZm9yIHRoaXMgCj4gPiB3
aG9sZSB0aGluZy4KPiA+IAo+ID4gQWxzbywgaXQgaXMgYmVzdCBtb3ZlZCBkb3duIHRvIGJlIG5l
eHQgdG8gdGhlIG5ldyBNTlIgc3RydWN0cywgc28gdGhhdCBhbGwgdGhlCj4gPiBNTlIgc3R1ZmYg
aXMgaW4gb25lIGdyb3VwLgo+IAo+IEkgYWdyZWUgd2l0aCBKZXJvbWUsIHRoaXMgZW51bSBpcyBw
YXJ0IG9mIHRoZSAnc3RydWN0Cj4gbW11X25vdGlmaWVyX3JhbmdlJyAoaWUgdGhlIGRlc2NyaXB0
aW9uIG9mIHRoZSBpbnZhbGlkYXRpb24pIGFuZCBpdAo+IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB0
aGF0IG9ubHkgdGhlc2UgbmV3IG5vdGlmaWVycyBjYW4gYmUgY2FsbGVkIHdpdGgKPiB0aGlzIHR5
cGUsIGl0IGlzIHN0aWxsIHBhcnQgb2YgdGhlIG1tdV9ub3RpZmllcl9yYW5nZS4KPiAKPiBUaGUg
Y29tbWVudCBhbHJlYWR5IHNheXMgaXQgb25seSBhcHBsaWVzIHRvIHRoZSBtbXVfcmFuZ2Vfbm90
aWZpZXIKPiBzY2hlbWUuLgoKSW4gZmFjdCB0aGUgZW51bSBpcyBlbnRpcmVseSB1bnVzZWQuICBX
ZSBtaWdodCBhcyB3ZWxsIGp1c3Qga2lsbCBpdCBvZmYKZW50aXJlbHkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
