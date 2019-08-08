Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39D868B2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 20:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvn02-0006hv-Fc; Thu, 08 Aug 2019 18:18:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FDVG=WE=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1hvn01-0006hq-Gy
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 18:18:53 +0000
X-Inumbo-ID: f9266627-ba08-11e9-8980-bc764e045a96
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f9266627-ba08-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 18:18:51 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4c678b0000>; Thu, 08 Aug 2019 11:18:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 08 Aug 2019 11:18:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 08 Aug 2019 11:18:50 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Aug
 2019 18:18:49 +0000
To: "Weiny, Ira" <ira.weiny@intel.com>, Michal Hocko <mhocko@kernel.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802091244.GD6461@dhcp22.suse.cz>
 <20190802124146.GL25064@quack2.suse.cz>
 <20190802142443.GB5597@bombadil.infradead.org>
 <20190802145227.GQ25064@quack2.suse.cz>
 <076e7826-67a5-4829-aae2-2b90f302cebd@nvidia.com>
 <20190807083726.GA14658@quack2.suse.cz>
 <20190807084649.GQ11812@dhcp22.suse.cz>
 <20190808023637.GA1508@iweiny-DESK2.sc.intel.com>
 <e648a7f3-6a1b-c9ea-1121-7ab69b6b173d@nvidia.com>
 <2807E5FD2F6FDA4886F6618EAC48510E79E79644@CRSMSX101.amr.corp.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b1b33292-d929-f9ff-dd75-02828228f35e@nvidia.com>
Date: Thu, 8 Aug 2019 11:18:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E79E79644@CRSMSX101.amr.corp.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1565288332; bh=JXH0z+PATu5ChINAttu0xw8NI7VYrjVhdTogRmB3Q5s=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Ne1ScLdQ+tu5qOaISiLlk/MzD+D0tWGCUEcW8KATp/99KORz80qhTvSS0MA86k71v
 1gG74XZNfpVRbFXyQsXs+wV66Ly/i7Omeym8buU22OwtUh/B674iBCJPOoXFe5hxmV
 1e7OUBsDbdwXkl/h4Pjx1eOWT4qAVANZ24jESe93raeMkGLORABLpzcfJ+l/YUvFr/
 bUBCYBUk9JXLyxcXRRJ6Qo5DLPNTbuOY1/JVx8JLOWf78tx+O5w4P2ZxYGmo4q53CG
 aum+FjJWUhUsxhssDMyUyjXEHRPMBfcGtXYtpdJqmbhfodN4x0QDM6mw3fwyew2GF4
 p5OXETBP5SbRg==
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
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

T24gOC84LzE5IDk6MjUgQU0sIFdlaW55LCBJcmEgd3JvdGU6Cj4+Cj4+IE9uIDgvNy8xOSA3OjM2
IFBNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4+PiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAxMDo0Njo0
OUFNICswMjAwLCBNaWNoYWwgSG9ja28gd3JvdGU6Cj4+Pj4gT24gV2VkIDA3LTA4LTE5IDEwOjM3
OjI2LCBKYW4gS2FyYSB3cm90ZToKPj4+Pj4gT24gRnJpIDAyLTA4LTE5IDEyOjE0OjA5LCBKb2hu
IEh1YmJhcmQgd3JvdGU6Cj4+Pj4+PiBPbiA4LzIvMTkgNzo1MiBBTSwgSmFuIEthcmEgd3JvdGU6
Cj4+Pj4+Pj4gT24gRnJpIDAyLTA4LTE5IDA3OjI0OjQzLCBNYXR0aGV3IFdpbGNveCB3cm90ZToK
Pj4+Pj4+Pj4gT24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDI6NDE6NDZQTSArMDIwMCwgSmFuIEth
cmEgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiBGcmkgMDItMDgtMTkgMTE6MTI6NDQsIE1pY2hhbCBIb2Nr
byB3cm90ZToKPj4+Pj4+Pj4+PiBPbiBUaHUgMDEtMDgtMTkgMTk6MTk6MzEsIGpvaG4uaHViYmFy
ZEBnbWFpbC5jb20gd3JvdGU6Cj4+ICAgWy4uLl0KPiBZZXAgSSBjYW4gZG8gdGhpcy4gIEkgZGlk
IG5vdCByZWFsaXplIHRoYXQgQW5kcmV3IGhhZCBhY2NlcHRlZCBhbnkgb2YgdGhpcyB3b3JrLiAg
SSdsbCBjaGVjayBvdXQgaGlzIHRyZWUuICBCdXQgSSBkb24ndCB0aGluayBoZSBpcyBnb2luZyB0
byBhY2NlcHQgdGhpcyBzZXJpZXMgdGhyb3VnaCBoaXMgdHJlZS4gIFNvIHdoYXQgaXMgdGhlIEVU
QSBvbiB0aGF0IGxhbmRpbmcgaW4gTGludXMnIHRyZWU/Cj4gCgpJJ2QgZXhwZWN0IGl0IHRvIGdv
IGludG8gNS40LCBhY2NvcmRpbmcgdG8gbXkgdW5kZXJzdGFuZGluZyBvZiBob3cKdGhlIHJlbGVh
c2UgY3ljbGVzIGFyZSBhcnJhbmdlZC4KCgo+IFRvIHRoYXQgcG9pbnQgSSdtIHN0aWxsIG5vdCBz
dXJlIHdobyB3b3VsZCB0YWtlIGFsbCB0aGlzIGFzIEkgYW0gbm93IHRvdWNoaW5nIG1tLCBwcm9j
ZnMsIHJkbWEsIGV4dDQsIGFuZCB4ZnMuCj4gCj4gSSBqdXN0IHRob3VnaHQgSSB3b3VsZCBjaGlt
ZSBpbiB3aXRoIG15IHByb2dyZXNzIGJlY2F1c2UgSSdtIHRvIGEgcG9pbnQgd2hlcmUgdGhpbmdz
IGFyZSB3b3JraW5nIGFuZCBzbyBJIGNhbiBzdWJtaXQgdGhlIGNvZGUgYnV0IEknbSBub3Qgc3Vy
ZSB3aGF0IEkgY2FuL3Nob3VsZCBkZXBlbmQgb24gbGFuZGluZy4uLiAgQWxzbywgbm93IHRoYXQg
MGRheSBoYXMgcnVuIG92ZXJuaWdodCBpdCBoYXMgZm91bmQgaXNzdWVzIHdpdGggdGhpcyByZWJh
c2Ugc28gSSBuZWVkIHRvIGNsZWFuIHRob3NlIHVwLi4uICBQZXJoYXBzIEkgd2lsbCBiYXNlIG9u
IEFuZHJldydzIHRyZWUgcHJpb3IgdG8gZG9pbmcgdGhhdC4uLgoKSSdtIGNlcnRhaW5seSBub3Qg
dGhlIHJpZ2h0IHBlcnNvbiB0byBhbnN3ZXIsIGJ1dCBpbiBzcGl0ZSBvZiB0aGF0LCBJJ2QgdGhp
bmsKQW5kcmV3J3MgdHJlZSBpcyBhIHJlYXNvbmFibGUgcGxhY2UgZm9yIGl0LiBTb3J0IG9mLgoK
dGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
