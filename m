Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C57F029
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTcJ-0006Y4-2q; Fri, 02 Aug 2019 09:12:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C+H3=V6=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1htTcH-0006Xz-QY
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:12:49 +0000
X-Inumbo-ID: b25708fe-b505-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b25708fe-b505-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 09:12:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4990DAFE2;
 Fri,  2 Aug 2019 09:12:47 +0000 (UTC)
Date: Fri, 2 Aug 2019 11:12:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: john.hubbard@gmail.com
Message-ID: <20190802091244.GD6461@dhcp22.suse.cz>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
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
 linux-block@vger.kernel.org,
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

T24gVGh1IDAxLTA4LTE5IDE5OjE5OjMxLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgpb
Li4uXQo+IDIpIENvbnZlcnQgYWxsIG9mIHRoZSBjYWxsIHNpdGVzIGZvciBnZXRfdXNlcl9wYWdl
cyooKSwgdG8KPiBpbnZva2UgcHV0X3VzZXJfcGFnZSooKSwgaW5zdGVhZCBvZiBwdXRfcGFnZSgp
LiBUaGlzIGludm9sdmVzIGRvemVucyBvZgo+IGNhbGwgc2l0ZXMsIGFuZCB3aWxsIHRha2Ugc29t
ZSB0aW1lLgoKSG93IGRvIHdlIG1ha2Ugc3VyZSB0aGlzIGlzIHRoZSBjYXNlIGFuZCBpdCB3aWxs
IHJlbWFpbiB0aGUgY2FzZSBpbiB0aGUKZnV0dXJlPyBUaGVyZSBtdXN0IGJlIHNvbWUgYXV0b21h
Z2ljIHRvIGVuZm9yY2UvY2hlY2sgdGhhdC4gSXQgaXMgc2ltcGx5Cm5vdCBtYW5hZ2VhYmxlIHRv
IGRvIGl0IGV2ZXJ5IG5vdyBhbmQgdGhlbiBiZWNhdXNlIHRoZW4gMykgd2lsbCBzaW1wbHkKYmUg
bmV2ZXIgc2FmZS4KCkhhdmUgeW91IGNvbnNpZGVyZWQgY29jY2luZWxlIG9yIHNvbWUgb3RoZXIg
c2NyaXB0ZWQgd2F5IHRvIGRvIHRoZQp0cmFuc2l0aW9uPyBJIGhhdmUgbm8gaWRlYSBob3cgdG8g
ZGVhbCB3aXRoIGZ1dHVyZSBjaGFuZ2VzIHRoYXQgd291bGQKYnJlYWsgdGhlIGJhbGFuY2UgdGhv
dWdoLgotLSAKTWljaGFsIEhvY2tvClNVU0UgTGFicwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
