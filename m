Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB288269
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9YY-0004DL-H2; Fri, 09 Aug 2019 18:24:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gc9A=WF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hw9YW-0004DG-LD
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 18:24:00 +0000
X-Inumbo-ID: dad53ff8-bad2-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dad53ff8-bad2-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 18:23:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1BED20C01;
 Fri,  9 Aug 2019 18:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565375038;
 bh=lYgJLwb1RDgrnUU4Eq+1/0nedffuctfqvPcgIw4CpuA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=GnSVH8ogMbztBZi02KqwMvAC8Lgd832LB45Iw7KOakcPuhY9i3KjIBWIAdT5f2XMi
 FWbvi5YE6gNbJ9QI+xlO099axgk5YxjSsxu3SuLWivrstSvIBh8hF6BB94DWnwb/iO
 IPdZDxP5Gbz1xhGGnhkn3tzYhKdj4f0g9t4+pm/4=
Date: Fri, 9 Aug 2019 11:23:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
In-Reply-To: <62e082b025d8483d8b577c283fce1873@dornerworks.com>
Message-ID: <alpine.DEB.2.21.1908091123020.7788@sstabellini-ThinkPad-T480s>
References: <20190809121440.5668-1-julien.grall@arm.com>
 <e9d6353c-fd4d-116e-2531-7db46abf2b23@suse.com>
 <62e082b025d8483d8b577c283fce1873@dornerworks.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: Keep away MFN 0 from the
 buddy allocator
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA5IEF1ZyAyMDE5LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6Cj4gT24gRnJpZGF5
LCBBdWd1c3QgOSwgMjAxOSA5OjM5IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOgo+ID5PbiAwOS4wOC4yMDE5IDE0OjE0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPj4g
Q29tYmluaW5nIG9mIGJ1ZGRpZXMgaGFwcGVucyBvbmx5IHN1Y2ggdGhhdCB0aGUgcmVzdWx0aW5n
IGxhcmdlciBidWRkeQo+ID4+IGlzIHN0aWxsIG9yZGVyLWFsaWduZWQuIFRvIGNyb3NzIGEgem9u
ZSBib3VuZGFyeSB3aGlsZSBtZXJnaW5nLCB0aGUKPiA+PiBpbXBsaWNhdGlvbiBpcyB0aGF0IGJv
dGggdGhlIGJ1ZGR5IFswLCAyXm4tMV0gYW5kIHRoZSBidWRkeQo+ID4+IFsyXm4sIDJeKG4rMSld
IGFyZSBmcmVlLgo+ID4KPiA+WzJebiwgMl4obisxKS0xXQo+ID4KPiA+WW91IG1heSB3YW50IHRv
IGFkZCB0aGF0IG1lcmdpbmcgYWNyb3NzIHpvbmUgYm91bmRhcmllcyBpcyB3aGF0IHdlCj4gPm5l
ZWQgdG8gcHJldmVudC4KPiA+Cj4gPj4gSWRlYWxseSB3ZSB3YW50IHRvIGZpeCB0aGUgYWxsb2Nh
dG9yLCBidXQgZm9yIG5vdyB3ZSBjYW4ganVzdCBwcmV2ZW50Cj4gPj4gYWRkaW5nIHRoZSBNRk4g
MCBpbiB0aGUgYWxsb2NhdG9yLgo+ID4+Cj4gPj4gT24geDg2LCB0aGUgTUZOIDAgaXMgYWxyZWFk
eSBrZXB0IGF3YXkgZnJvbSB0aGUgYnVkZHkgYWxsb2NhdG9yLiBTbyB0aGUKPiA+PiBidWcgY2Fu
IG9ubHkgaGFwcGVuIG9uIEFybSBwbGF0Zm9ybSB3aGVyZSB0aGUgZmlyc3QgbWVtb3J5IGJhbmsg
aXMKPiA+PiBzdGFydGluZyBhdCAwLgo+ID4+Cj4gPj4gQXMgdGhpcyBpcyBhIHNwZWNpZmljIHRv
IHRoZSBhbGxvY2F0b3IsIHRoZSBNRk4gMCBpcyByZW1vdmVkIGluIHRoZSBjb21tb24gY29kZQo+
ID4+IHRvIGNhdGVyIGFsbCB0aGUgYXJjaGl0ZWN0dXJlcyAoY3VycmVudCBhbmQgZnV0dXJlKS4K
PiA+Pgo+ID4+IFJlcG9ydGVkLWJ5OiBKZWZmIEt1YmFzY2lrIDxqZWZmLmt1YmFzY2lrQGRvcm5l
cndvcmtzLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgo+ID4KPiA+UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiAKPiBIZXJlIGlzIEplZmYncyBpbml0aWFsIHBhdGNoIGZvciB0aGUgaXNzdWUuCgpJ
IGNvbW1pdHRlZCBKdWxpZW4ncyBwYXRjaCBmb3Igbm93LCBidXQgaWYgd2UgbmVlZCB0byBtYWtl
IGFueSBjaGFuZ2VzCm9yIGRlY2lkZSBmb3IgYSBiZXR0ZXIgYWx0ZXJuYXRpdmUsIHdlIGNhbiBh
bHdheXMgcmV2ZXJ0IGl0LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
