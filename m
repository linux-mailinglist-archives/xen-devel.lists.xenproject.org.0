Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A08747F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 10:45:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw0Ux-0001yt-1G; Fri, 09 Aug 2019 08:43:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=S3B8=WF=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1hw0Uv-0001yl-IJ
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 08:43:41 +0000
X-Inumbo-ID: c75dfd06-ba81-11e9-b3e0-cb6a478ca9f5
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c75dfd06-ba81-11e9-b3e0-cb6a478ca9f5;
 Fri, 09 Aug 2019 08:43:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 689A0AE49;
 Fri,  9 Aug 2019 08:43:35 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 89DB71E437E; Fri,  9 Aug 2019 10:43:34 +0200 (CEST)
Date: Fri, 9 Aug 2019 10:43:34 +0200
From: Jan Kara <jack@suse.cz>
To: "Weiny, Ira" <ira.weiny@intel.com>
Message-ID: <20190809084334.GB17568@quack2.suse.cz>
References: <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
 <20190807084649.GQ11812@dhcp22.suse.cz>
 <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
 <e648a7f3-6a1b-c9ea-1121-7ab69b6b173d@nvidia.com>
 <2807E5FD2F6FDA4886F6618EAC48510E79E79644@CRSMSX101.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E79E79644@CRSMSX101.amr.corp.intel.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1IDA4LTA4LTE5IDE2OjI1OjA0LCBXZWlueSwgSXJhIHdyb3RlOgo+ID4gSSB0aG91Z2h0
IEknZCBjYXVnaHQgdGhpbmdzIGVhcmx5IGVub3VnaCB0byBnZXQgYXdheSB3aXRoIHRoZQo+ID4g
cmVuYW1lIGFuZCBkZWxldGlvbiBvZiB0aGF0LiBZb3UgY291bGQgZWl0aGVyOgo+ID4gCj4gPiBh
KSBvcGVuIGNvZGUgYW4gaW1wbGVtZW50YXRpb24gb2YgdmFkZHJfcHV0X3BhZ2VzX2RpcnR5X2xv
Y2soKSB0aGF0Cj4gPiBkb2Vzbid0IGNhbGwgYW55IG9mIHRoZSAqcHV0X3VzZXJfcGFnZXNfZGly
dHkqKCkgdmFyaWFudHMsIG9yCj4gPiAKPiA+IGIpIGluY2x1ZGUgbXkgZmlyc3QgcGF0Y2ggKCIi
KSBhcmUgcGFydCBvZiB5b3VyIHNlcmllcywgb3IKPiA+IAo+ID4gYykgYmFzZSB0aGlzIG9uIEFu
ZHJld3MncyB0cmVlLCB3aGljaCBhbHJlYWR5IGhhcyBtZXJnZWQgaW4gbXkgZmlyc3QgcGF0Y2gu
Cj4gPiAKPiAKPiBZZXAgSSBjYW4gZG8gdGhpcy4gIEkgZGlkIG5vdCByZWFsaXplIHRoYXQgQW5k
cmV3IGhhZCBhY2NlcHRlZCBhbnkgb2YKPiB0aGlzIHdvcmsuICBJJ2xsIGNoZWNrIG91dCBoaXMg
dHJlZS4gIEJ1dCBJIGRvbid0IHRoaW5rIGhlIGlzIGdvaW5nIHRvCj4gYWNjZXB0IHRoaXMgc2Vy
aWVzIHRocm91Z2ggaGlzIHRyZWUuICBTbyB3aGF0IGlzIHRoZSBFVEEgb24gdGhhdCBsYW5kaW5n
Cj4gaW4gTGludXMnIHRyZWU/Cj4gCj4gVG8gdGhhdCBwb2ludCBJJ20gc3RpbGwgbm90IHN1cmUg
d2hvIHdvdWxkIHRha2UgYWxsIHRoaXMgYXMgSSBhbSBub3cKPiB0b3VjaGluZyBtbSwgcHJvY2Zz
LCByZG1hLCBleHQ0LCBhbmQgeGZzLgoKTU0gdHJlZSB3b3VsZCBiZSBvbmUgY2FuZGlkYXRlIGZv
ciByb3V0aW5nIGJ1dCB0aGVyZSBhcmUgb3RoZXIgb3B0aW9ucyB0aGF0CndvdWxkIG1ha2Ugc2Vu
c2UgYXMgd2VsbCAtIERhbidzIHRyZWUsIFZGUyB0cmVlLCBvciBldmVuIEkgY2FuIHBpY2t1cCB0
aGUKcGF0Y2hlcyB0byBteSB0cmVlIGlmIG5lZWRlZC4gQnV0IGxldCdzIHdvcnJ5IGFib3V0IHRo
ZSByb3V0aW5nIGFmdGVyIHdlCmhhdmUgd29ya2luZyBhbmQgcmV2aWV3ZWQgcGF0Y2hlcy4uLgoK
CQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFicywgQ1IK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
