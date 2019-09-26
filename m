Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD7BF096
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:55:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRNy-0004Lq-Jt; Thu, 26 Sep 2019 10:52:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDRNx-0004Lg-Go
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:52:33 +0000
X-Inumbo-ID: be2ce34c-e04b-11e9-964f-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id be2ce34c-e04b-11e9-964f-12813bfff9fa;
 Thu, 26 Sep 2019 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569495152; x=1601031152;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aOyqTi0d69JCNfif2NtOaC2plsQ4WLBLTIpJst0+t5I=;
 b=HG+bNTtun3JXj/2vpaOlY1GaU0U0U4/kNlTS6oSvt7YoI2eLqjk6UvhM
 gfBCsbUFAMbjFmqanyw0fU3E7ihEmWyu6GptXx2DWBIRFtigsz+vEzV5M
 AhT2m6nwGSI7NSGZpuSoz1k8Q4Vts1C9/dMTv1AisrgQGfqhM95FmgBEZ 0=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="423760683"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Sep 2019 10:52:32 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8D22DA3643; Thu, 26 Sep 2019 10:52:29 +0000 (UTC)
Received: from EX13D18UWA004.ant.amazon.com (10.43.160.45) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 10:52:29 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D18UWA004.ant.amazon.com (10.43.160.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 10:52:28 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 10:52:27 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
 <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
 <9363b6d2-0b30-f0f3-06df-092aeac21274@arm.com>
From: <hongyax@amazon.com>
Message-ID: <01ac67bf-0b93-ae54-67d9-c1a4393403e2@amazon.com>
Date: Thu, 26 Sep 2019 11:52:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9363b6d2-0b30-f0f3-06df-092aeac21274@arm.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 68/84] page_alloc: actually do the
 mapping and unmapping on xenheap.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxMTo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IEkgZm9y
Z290IHRvIG1lbnRpb24gb25lIHRoaW5nLiBDYW4geW91IGV4cGxhaW4gd2h5IHlvdSBhcmUgdXNp
bmcgCj4gbWFwX3BhZ2VzX3RvX3hlbiBhbmQgbm90IGRlc3Ryb3lfeGVuX21hcHBpbmdzIGhlcmU/
Cj4gCj4gIEZyb20gbXkgdW5kZXJzdGFuZGluZywgdGhlIGZvcm1lciB3aWxsIG5vdCB0ZWFyZG93
biBpbnRlcm1lZGlhdGUgcGFnZXRhYmxlcy4gCj4gSWYgdGhpcyBpcyB3aGF0IHlvdSB3YW50IHRo
ZW4gcGxlYXNlIHdyaXRlIGl0IGRvd24gaW4gYSBjb21tZW50LiBOb3RlIHRoYXQgQXJtIAo+IGRv
ZXMgbm90IHN1cHBvcnQgX1BBR0VfTk9ORSBzbyBzb21ldGhpbmcgc2ltaWxhciB0byBpbXBsZW1l
bnRhdGlvbiBvZiB2dW5tYXAgCj4gd291bGQgYmUgbmVjZXNzYXJ5LgoKVGhhdCBpcyBleGFjdGx5
IG15IGludGVudGlvbi4gV2l0aG91dCBhbiBhbHdheXMtbWFwcGVkIGRpcmVjdCBtYXAsIG1hcHBp
bmdzIHRvIAp0aGUgRElSRUNUTUFQIHJlZ2lvbiBhcmUgY3JlYXRlZC9kZXN0cm95ZWQgYWxvbmdz
aWRlIHhlbmhlYXAgCmFsbG9jYXRpb25zL2RlYWxsb2NhdGlvbnMuIFBlcmZvcm1hbmNlLXdpc2Ug
aXQgcHJvYmFibHkgbWFrZXMgbGVzcyBzZW5zZSB0byAKYWN0dWFsbHkgdGVhciBkb3duIGFsbCBw
YWdldGFibGVzIGFuZCBsYXRlciBhbGxvY2F0ZSB0aGVtIGFnYWluLgoKSSBjYW4gYWRkIGEgY29t
bWVudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
