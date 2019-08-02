Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7997F724
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 14:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htWsb-0004yi-Cp; Fri, 02 Aug 2019 12:41:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+PDz=V6=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1htWsa-0004yW-1S
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 12:41:52 +0000
X-Inumbo-ID: e5250706-b522-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e5250706-b522-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 12:41:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20E6FAF94;
 Fri,  2 Aug 2019 12:41:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id F40A51E3F4D; Fri,  2 Aug 2019 14:41:46 +0200 (CEST)
Date: Fri, 2 Aug 2019 14:41:46 +0200
From: Jan Kara <jack@suse.cz>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20190802124146.GL25064@quack2.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802091244.GD6461@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 00/34] put_user_pages(): miscellaneous call
 sites
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 john.hubbard@gmail.com, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpIDAyLTA4LTE5IDExOjEyOjQ0LCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4gT24gVGh1IDAx
LTA4LTE5IDE5OjE5OjMxLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+IFsuLi5dCj4g
PiAyKSBDb252ZXJ0IGFsbCBvZiB0aGUgY2FsbCBzaXRlcyBmb3IgZ2V0X3VzZXJfcGFnZXMqKCks
IHRvCj4gPiBpbnZva2UgcHV0X3VzZXJfcGFnZSooKSwgaW5zdGVhZCBvZiBwdXRfcGFnZSgpLiBU
aGlzIGludm9sdmVzIGRvemVucyBvZgo+ID4gY2FsbCBzaXRlcywgYW5kIHdpbGwgdGFrZSBzb21l
IHRpbWUuCj4gCj4gSG93IGRvIHdlIG1ha2Ugc3VyZSB0aGlzIGlzIHRoZSBjYXNlIGFuZCBpdCB3
aWxsIHJlbWFpbiB0aGUgY2FzZSBpbiB0aGUKPiBmdXR1cmU/IFRoZXJlIG11c3QgYmUgc29tZSBh
dXRvbWFnaWMgdG8gZW5mb3JjZS9jaGVjayB0aGF0LiBJdCBpcyBzaW1wbHkKPiBub3QgbWFuYWdl
YWJsZSB0byBkbyBpdCBldmVyeSBub3cgYW5kIHRoZW4gYmVjYXVzZSB0aGVuIDMpIHdpbGwgc2lt
cGx5Cj4gYmUgbmV2ZXIgc2FmZS4KPiAKPiBIYXZlIHlvdSBjb25zaWRlcmVkIGNvY2NpbmVsZSBv
ciBzb21lIG90aGVyIHNjcmlwdGVkIHdheSB0byBkbyB0aGUKPiB0cmFuc2l0aW9uPyBJIGhhdmUg
bm8gaWRlYSBob3cgdG8gZGVhbCB3aXRoIGZ1dHVyZSBjaGFuZ2VzIHRoYXQgd291bGQKPiBicmVh
ayB0aGUgYmFsYW5jZSB0aG91Z2guCgpZZWFoLCB0aGF0J3Mgd2h5IEkndmUgYmVlbiBzdWdnZXN0
aW5nIGF0IExTRi9NTSB0aGF0IHdlIG1heSBuZWVkIHRvIGNyZWF0ZQphIGd1cCB3cmFwcGVyIC0g
c2F5IHZhZGRyX3Bpbl9wYWdlcygpIC0gYW5kIHRyYWNrIHdoaWNoIHNpdGVzIGRyb3BwaW5nCnJl
ZmVyZW5jZXMgZ290IGNvbnZlcnRlZCBieSB1c2luZyB0aGlzIHdyYXBwZXIgaW5zdGVhZCBvZiBn
dXAuIFRoZQpjb3VudGVycGFydCB3b3VsZCB0aGVuIGJlIG1vcmUgbG9naWNhbGx5IG5hbWVkIGFz
IHVucGluX3BhZ2UoKSBvciB3aGF0ZXZlcgppbnN0ZWFkIG9mIHB1dF91c2VyX3BhZ2UoKS4gIFN1
cmUgdGhpcyBpcyBub3QgY29tcGxldGVseSBmb29scHJvb2YgKHlvdSBjYW4KY3JlYXRlIG5ldyBj
YWxsc2l0ZSB1c2luZyB2YWRkcl9waW5fcGFnZXMoKSBhbmQgdGhlbiBqdXN0IGRyb3AgcmVmcyB1
c2luZwpwdXRfcGFnZSgpKSBidXQgSSBzdXBwb3NlIGl0IHdvdWxkIGJlIGEgaGlnaCBlbm91Z2gg
YmFycmllciBmb3IgbWlzc2VkCmNvbnZlcnNpb25zLi4uIFRob3VnaHRzPwoKCQkJCQkJCQlIb256
YQoKLS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
