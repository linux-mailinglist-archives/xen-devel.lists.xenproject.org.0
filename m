Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A6E358CC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 10:41:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYRQT-0001J3-0P; Wed, 05 Jun 2019 08:37:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hlgX=UE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hYRQS-0001Iy-Cn
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 08:37:40 +0000
X-Inumbo-ID: 2cb84711-876d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2cb84711-876d-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 08:37:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B76D4AB87;
 Wed,  5 Jun 2019 08:37:37 +0000 (UTC)
To: Christoph Hellwig <hch@infradead.org>
References: <20190529090407.1225-1-jgross@suse.com>
 <20190529090407.1225-4-jgross@suse.com>
 <20190530090409.GB30428@infradead.org>
 <eebb0275-9418-717f-97d7-5e55917f46fd@oracle.com>
 <2fbfc6a7-572c-1ce2-3323-802f9a77500e@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0fcd8b61-7714-2278-e552-f0b72d9c5d1a@suse.com>
Date: Wed, 5 Jun 2019 10:37:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2fbfc6a7-572c-1ce2-3323-802f9a77500e@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDUuMTkgMTM6MzgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMzAvMDUvMjAxOSAx
NDo0NiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiA1LzMwLzE5IDU6MDQgQU0sIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4gUGxlYXNlIGRvbid0IGFkZCB5b3VyIHByaXZhdGUgZmxh
ZyB0byBwYWdlLWZsYWdzLmguICBUaGUgd2hvbGUgcG9pbnQgb2YKPj4+IHRoZSBwcml2YXRlIGZs
YWcgaXMgdGhhdCB5b3UgY2FuIHVzZSBpdCBpbiBhbnkgd2F5IHlvdSB3YW50IHdpdGhvdQo+Pj4g
dG91Y2hpbmcgdGhlIGNvbW1vbiBjb2RlLgo+Pgo+Pgo+PiBUaGVyZSBpcyBhbHJlYWR5IGEgYnVu
Y2ggb2YgYWxpYXNlcyBmb3IgdmFyaW91cyBzdWItY29tcG9uZW50cwo+PiAoaW5jbHVkaW5nIFhl
bikgaW4gcGFnZS1mbGFncy5oIGZvciBwcml2YXRlIGZsYWdzLCB3aGljaCBpcyB3aHkgSQo+PiBz
dWdnZXN0ZWQgd2UgZG8gdGhlIHNhbWUgZm9yIHRoZSBuZXcgdXNlIGNhc2UuIEFkZGluZyB0aGlz
IG5ldyBhbGlhcwo+PiB3aWxsIGtlZXAgZmxhZyB1c2FnZSBjb25zaXN0ZW50Lgo+IAo+IFdoYXQg
YWJvdXQgbWUgYWRkaW5nIGFub3RoZXIgcGF0Y2ggbW92aW5nIHRob3NlIFhlbiBwcml2YXRlIGFs
aWFzZXMKPiBpbnRvIGFyY2gveDg2L2luY2x1ZGUvYXNtL3hlbi9wYWdlLmggPwoKVGhpcyBpcyBi
ZWNvbWluZyBkaWZmaWN1bHQuCgpJJ2QgbmVlZCB0byByZW1vdmUgdGhlICIjdW5kZWYgUEZfTk9f
Q09NUE9VTkQiIGZyb20gcGFnZS1mbGFncy5oIG9yIHRvCiNpbmNsdWRlIGEgKG5ldykgeGVuL3Bh
Z2UtZmxhZ3MuaCBmcm9tIHBhZ2UtZmxhZ3MuaCBhZnRlciBhbGwgdGhlCmRlZmluZXMgYXJlIHJl
YWR5LiBJcyB0aGF0IHJlYWxseSB3b3J0aCB0aGUgZWZmb3J0IGdpdmVuIHRoYXQgb3RoZXIKY29t
cG9uZW50cyAoZS5nLiBmaWxlIHN5c3RlbXMpIGFyZSBkb2luZyB0aGUgc2FtZT8KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
