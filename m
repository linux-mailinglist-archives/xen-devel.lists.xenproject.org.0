Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2409DB80
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 04:04:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Qmt-0002yR-QM; Tue, 27 Aug 2019 02:00:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i2Qms-0002yM-5P
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 02:00:46 +0000
X-Inumbo-ID: 7b4c5df4-c86e-11e9-ae2b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b4c5df4-c86e-11e9-ae2b-12813bfff9fa;
 Tue, 27 Aug 2019 02:00:45 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91CAC206E0;
 Tue, 27 Aug 2019 02:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566871244;
 bh=MD3sr2OAksfs0NgAVZIyjzyTAVQ933/C4tnk/zWmHvo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KKAmz9jBCgs55lt1JUWBC6wEihVGwH2eJlWekUmiAHQlHNBSQ9hfI35tKDoisVQk6
 HdBs2Y5wtgaFrBcGW2ON8fxbhdkD/NliHsyJGMXn19bSPectvaDItTx5pd6wjJ55wT
 z4Yn1Rc/2GZC8jtdzkMH5LcPSQD5Mrc/P1BiAwfU=
Date: Mon, 26 Aug 2019 19:00:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908261859490.3428@sstabellini-ThinkPad-T480s>
References: <20190816130013.31154-1-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] swiotlb-xen cleanups
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
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSGkgWGVuIG1h
aW50YWluZXJzIGFuZCBmcmllbmRzLAo+IAo+IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIHNl
cmllcyB0aGF0IGNsZWFucyB1cCB0aGUgcGFydHMgb2Ygc3dpb3RsYi14ZW4KPiB0aGF0IGRlYWwg
d2l0aCBub24tY29oZXJlbnQgY2FjaGVzLgoKSGkgQ2hyaXN0b3BoLAoKSSBqdXN0IHdhbnRlZCB0
byBsZXQgeW91IGtub3cgdGhhdCB5b3VyIHNlcmllcyBpcyBvbiBteSByYWRhciwgYnV0IEkKaGF2
ZSBiZWVuIHN3YW1wZWQgdGhlIGxhc3QgZmV3IGRheXMuIEkgaG9wZSB0byBnZXQgdG8gaXQgYnkg
dGhlIGVuZCBvZgp0aGUgd2Vlay4KCkNoZWVycywKClN0ZWZhbm8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
