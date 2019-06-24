Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C5151C2D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 22:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfVOm-0000iu-5s; Mon, 24 Jun 2019 20:17:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfVOk-0000ip-TH
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 20:17:06 +0000
X-Inumbo-ID: 08660f5c-96bd-11e9-bb33-e7cbfb01ff46
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08660f5c-96bd-11e9-bb33-e7cbfb01ff46;
 Mon, 24 Jun 2019 20:17:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0545F20645;
 Mon, 24 Jun 2019 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561407424;
 bh=FpGtBA8XG3pRS6ylb3QMsEHad7vUvTDMgkCRLTBmcjE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Pt4pW+DbgvEISYDqufaNpUga3Hfbi2dHh/VLD7WUTwApZoRWIS0oF3h+tKuM9XcLo
 L1vCq+P9cgHH/bPLUVnaoYVJLBmsRveJTTwyryWDgLX4o6NqoyCiS+nR0COni9FJja
 udSJ7t6XgJ3vmxwa3EVnXy+++YrRasBm0SDSxv08=
Date: Mon, 24 Jun 2019 13:17:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <Julien.Grall@arm.com>
In-Reply-To: <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
Message-ID: <alpine.DEB.2.21.1906241313480.2468@sstabellini-ThinkPad-T480s>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
 <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: chenbaodong <chenbaodong@mxnavi.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMjQvMDYvMjAxOSAxOToyNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24g
TW9uLCAyNCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4+IE9uIFRodSwg
MTMgSnVuIDIwMTksIGNoZW5iYW9kb25nIHdyb3RlOgo+ID4gTGV0IG1lIGFkZCB0aGF0IGlmIHlv
dSBwcmVmZXIgdG8gZG9jdW1lbnQgb25lIG9mIHRoZSBvdGhlciBpbnRlcmZhY2VzCj4gPiBsaXN0
ZWQgYWJvdmUgaW4gbXkgZW1haWwsIHlvdSBhcmUgd2VsY29tZSB0byBwaWNrIGFub3RoZXIgb25l
LiBGb3IKPiA+IGV4YW1wbGUsIHdlIGFyZSBhbHNvIG1pc3NpbmcgYSBkb2MgYWJvdXQgdGhlIERv
bVUgbWVtb3J5IG1hcCwgbGlzdGluZwo+ID4gYWxsIG1lbW9yeSByZWdpb25zIHdpdGggYWRkcmVz
c2VzIGFuZCBzaXplcywgYm90aCBNTUlPIGFuZCBub3JtYWwKPiA+IG1lbW9yeS4gRm9yIHRoYXQs
IG1vc3Qgb2YgdGhlIGluZm9ybWF0aW9uIGlzOgo+ID4gCj4gPiB4ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+ID4gCj4gPiBBIHdlbGwgd3JpdHRlbiBpbi1jb2RlIGNvbW1lbnQgaW4gYXJj
aC1hcm0uaCB3b3VsZCBiZSBPSywgb3IgYWxzbyBhCj4gPiBkb2N1bWVudCB1bmRlciBkb2NzL21p
c2MvYXJtLgo+IAo+IFBsZWFzZSBubyBkdXBsaWNhdGlvbiwgaXQgaXMgYWxyZWFkeSBxdWl0ZSBo
YXJkIHRvIG1haW50YWluIG9uZSBwbGFjZS4KPiBJbnN0ZWFkLCB3ZSBzaG91bGQgZG9jdW1lbnQg
YWxsIHRoZSBoZWFkZXJzIGluIGEgZG9jdW1lbnRlZCBmb3JtYXQgdGhhdCAKPiBjYW4gYmUgZXh0
cmFjdGVkIGF1dG9tYXRpY2FsbHkuCgpBcyB3ZSBoYXZlIG5vIHN1Y2ggdGhpbmcgdG9kYXkgKGFz
IGZhciBhcyBJIGFtIGF3YXJlKSwgcGxlYXNlIG1ha2UgYQpwcm9wb3NhbCB3aXRoIGEgYml0IG1v
cmUgZGV0YWlscywgb3RoZXJ3aXNlIEkgZG9uJ3QgdGhpbmsgQmFvZG9uZyB3aWxsCmJlIGFibGUg
dG8gdGFrZSB0aGUgbmV4dCBzdGVwLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
