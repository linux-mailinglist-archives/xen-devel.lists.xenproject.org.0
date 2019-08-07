Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084EC85326
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQtJ-0000C2-4U; Wed, 07 Aug 2019 18:42:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvQtG-0000Bo-RC
 for xen-devel@lists.xen.org; Wed, 07 Aug 2019 18:42:26 +0000
X-Inumbo-ID: 197935e6-b943-11e9-94bf-eb446897da22
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 197935e6-b943-11e9-94bf-eb446897da22;
 Wed, 07 Aug 2019 18:42:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF275222FC;
 Wed,  7 Aug 2019 18:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565203345;
 bh=bg7u5o1drBTEgEgJWBWmN30aLg4jOQHor6sNQPMJmgA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MEh33Kn3qypZrwa2W17WEVQgjOdexao9Ha7IZenICmiTvs0eEEG++T+903Qqv4jH3
 ajZrOL0Iq1aRA3eRu4HzW7C9LcovdGqgQHH3OQqKffd+AhL19zU1YTiWVi9YBJOaM8
 SlsxhuRHNQJg4lhR8O8uWMUztB2Er7ZevWMa1gLM=
Date: Wed, 7 Aug 2019 11:42:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <0c948ed9-5986-09c0-59ba-5d4e694c8ec4@arm.com>
Message-ID: <alpine.DEB.2.21.1908071137220.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-4-git-send-email-sstabellini@kernel.org>
 <8519371e-894b-88a3-ac71-b8367d93d9d3@arm.com>
 <alpine.DEB.2.10.1901031104000.800@sstabellini-ThinkPad-X260>
 <0c948ed9-5986-09c0-59ba-5d4e694c8ec4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/5] xen/arm: use the physical number of gic
 lines for boot domains
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNSBKYW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gMS8zLzE5IDc6MDcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIE1v
biwgMjQgRGVjIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4g
PiBPbiAxMi81LzE4IDU6MjggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBX
ZSBkb24ndCBoYXZlIGEgY2xlYXIgd2F5IHRvIGtub3cgaG93IG1hbnkgdmlydHVhbCBTUElzIHdl
IG5lZWQgZm9yIHRoZQo+ID4gPiA+IGJvb3QgZG9tYWlucy4gRm9yIHNpbXBsaWNpdHksIGFsbG9j
YXRlIGFzIG1hbnkgYXMgbmF0aXZlbHkgc3VwcG9ydGVkLAo+ID4gPiA+IGp1c3QgbGlrZSBmb3Ig
ZG9tMC4KPiA+ID4gCj4gPiA+IFRoaXMgd2lsbCBwb3RlbnRpYWxseSBhbGxvY2F0ZSBhIGxvdCBv
ZiB1bnVzZWQgaW50ZXJydXB0cyBhbmQgYSB3YXN0ZSBvZgo+ID4gPiBtZW1vcnkuIFNvIGlzIGl0
IHRoZSBjb3JyZWN0IHNvbHV0aW9uPwo+ID4gPiAKPiA+ID4gRm9yIGluc3RhbmNlLCB3ZSB3b3Vs
ZCByZXF1ZXN0IHRoZSB1c2VyIHRvIHByb3ZpZGUgdGhlIG51bWJlciBvZgo+ID4gPiBpbnRlcnJ1
cHRzLgo+ID4gCj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGhhcyB0byBoYXBwZW4gbXVjaCBlYXJs
aWVyIHRoYW4gd2hlbiB3ZSBwYXJzZSB1c2VyCj4gPiBzdXBwbGllZCBkZXZpY2UgdHJlZSBvcHRp
b25zLiBXZSBjb3VsZCBtYWtlIGl0IGFuIGh5cGVydmlzb3IgY29tbWFuZAo+ID4gbGluZSBwYXJh
bWV0ZXIgYnV0IGl0IHdvdWxkIGJlIG5hc3R5Lgo+IAo+IFdoeSBkb2VzIHRoaXMgdmFsdWUgbmVl
ZHMgdG8gYmUgaW4gdGhlIHN1cHBsaWVkIGRldmljZS10cmVlLiBDYW4ndCBpdCBiZSBwYXJ0Cj4g
b2YgdGhlIG5vZGUgaW4gdGhlIGhvc3QgRFQ/CgpZb3UgbWVhbiBhcyBhbiBvcHRpb24gdW5kZXIg
dGhlIHhlbixkb21haW4gbm9kZT8gWWVzLCBJIHRoaW5rIHRoYXQgd291bGQKYmUgcG9zc2libGUu
IExpa2U6CgogbnJfc3BpcyA9IDwweDY0PjsKCkFuZCBpZiBpdCBpcyBtaXNzaW5nIHdlIGRlZmF1
bHQgYmFjayB0byBnaWNfbnVtYmVyX2xpbmVzKCkgLSAzMi4gVGhhdApjb3VsZCBiZSBhIGdvb2Qg
aWRlYS4KCgo+ID4gR2l2ZW4gdGhhdCB0aGlzIGZlYXR1cmUgaXMgYWltZWQgYXQgcGFydGl0aW9u
aW5nIHNjZW5hcmlvcyB3aGVyZSB0aGUKPiA+IG51bWJlciBvZiBWTXMgaXMgbG93LCB0aGUgaW5j
cmVhc2VkIG1lbW9yeSBvdmVyaGVhZCBpcyBub3QgYSBiaWcgaXNzdWUuCj4gCj4gUGxlYXNlIHdy
aXRlIGl0IGRvd24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgogCkkgd2lsbAoKCj4gPiAoSWYgeW91
IHJlY2FsbCB3ZSBicmllZmx5IGRpc2N1c3NlZCB0aGlzIHRvcGljIGF0IHRoZSBsYXN0IExpbmFy
bwo+ID4gQ29ubmVjdCwgdGhpcyB3YXMgdGhlIGNvbmNsdXNpb24uKQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
