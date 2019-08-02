Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD37EE65
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 10:08:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htSaC-0001EV-D9; Fri, 02 Aug 2019 08:06:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DBR3=V6=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1htSaB-0001EQ-Cr
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 08:06:35 +0000
X-Inumbo-ID: 6bae65ff-b4fc-11e9-8980-bc764e045a96
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6bae65ff-b4fc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQGkgX+xjP5mcvxvnZUNTJDjzsROZ8JGq6RAdmO4uPA=; b=Kn7zyiwFYY1w4GG19f5Z+fxXG
 rpdCjyayz/9gviyRYspgLpeSBWC2GfVoCY+63/ODQnmLa1Ss8JkqUpftu3V0chMAiw/KlU2kDYgEh
 oR5YKgy/zWb5/EAWdvNxCcTyybQ/h6IZloFk2u58KpdWjALZ6VxSlYgO9NyD6ORVH0k4+/SJs5gc5
 s9u9DnNkq+UczyxB+jcY/9wLHc7m1xooYunausG0HwlgSx5YAgAGjYk+/D776D8302Y3gySch17HH
 NqaNqFjlPIzia2+bWk3vao3mV6/a02u4eJ9MN9jE/yE1oy7yiEOCMpBpQIwm2mrZk60vD3Q8D3Ve6
 97+ImnTKw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1htSZZ-0007h0-0W; Fri, 02 Aug 2019 08:05:57 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8B3D42029F4CB; Fri,  2 Aug 2019 10:05:54 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:05:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: john.hubbard@gmail.com
Message-ID: <20190802080554.GD2332@hirez.programming.kicks-ass.net>
References: <20190802021653.4882-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802021653.4882-1-jhubbard@nvidia.com>
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

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDc6MTY6MTlQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKCj4gVGhpcyBpcyBwYXJ0IGEgdHJlZS13aWRlIGNvbnZlcnNpb24sIGFz
IGRlc2NyaWJlZCBpbiBjb21taXQgZmMxZDhlN2NjYTJkCj4gKCJtbTogaW50cm9kdWNlIHB1dF91
c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuIFRoYXQgY29tbWl0Cj4gaGFzIGFu
IGV4dGVuc2l2ZSBkZXNjcmlwdGlvbiBvZiB0aGUgcHJvYmxlbSBhbmQgdGhlIHBsYW5uZWQgc3Rl
cHMgdG8KPiBzb2x2ZSBpdCwgYnV0IHRoZSBoaWdobGl0ZXMgYXJlOgoKVGhhdCBpcyBvbmUgaG9y
cmlkbHkgbWFuZ2xlZCBDaGFuZ2Vsb2cgdGhlcmUgOi0vIEl0IGxvb2tzIGxpa2UgaXQncwpwYXJ0
aWFsbHkgZHVwbGljYXRlZC4KCkFueXdheTsgbm8gb2JqZWN0aW9ucyB0byBhbnkgb2YgdGhhdCwg
YnV0IEkganVzdCB3YW50ZWQgdG8gbWVudGlvbiB0aGF0CnRoZXJlIGFyZSBvdGhlciBwcm9ibGVt
cyB3aXRoIGxvbmcgdGVybSBwaW5uaW5nIHRoYXQgaGF2ZW4ndCBiZWVuCm1lbnRpb25lZCwgbm90
YWJseSB0aGV5IGluaGliaXQgY29tcGFjdGlvbi4KCkEgbG9uZyB0aW1lIGFnbyBJIHByb3Bvc2Vk
IGFuIGludGVyZmFjZSB0byBtYXJrIHBhZ2VzIGFzIHBpbm5lZCwgc3VjaAp0aGF0IHdlIGNvdWxk
IHJ1biBjb21wYWN0aW9uIGJlZm9yZSB3ZSBhY3R1YWxseSBkaWQgdGhlIHBpbm5pbmcuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
