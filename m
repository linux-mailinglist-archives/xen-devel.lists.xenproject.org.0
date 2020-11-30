Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926632C83EF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 13:14:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41070.74177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kji3w-0005qs-8i; Mon, 30 Nov 2020 12:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41070.74177; Mon, 30 Nov 2020 12:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kji3w-0005qT-5i; Mon, 30 Nov 2020 12:13:48 +0000
Received: by outflank-mailman (input) for mailman id 41070;
 Mon, 30 Nov 2020 12:13:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kji3u-0005qO-AP
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 12:13:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kji3t-0003Zf-5T; Mon, 30 Nov 2020 12:13:45 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=edge-cache-235.e-lhr50.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kji3s-00010A-Oy; Mon, 30 Nov 2020 12:13:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=o9iTScdYJq7mKlr6B5dIRzWBzACVKFfWdXR7I9EiAmI=; b=37yj4hV7WoLKSnHWJII0VgkCNm
	pUaDaxNWmnEv+HvzwXZAFBYhSh4oOfzwP82xRwL5Yl3ZVVACdXL6WBIniepAzogThVaGjFUb0wIdh
	HMf99fDlQLGksZ+fSIN0rhr4JQ8Btj3uREM716LScF23Ch20q+QOBlFukscbK+0xNzA0=;
Message-ID: <23cd67ea1b96ba3f8801a3cf13549298597cb331.camel@xen.org>
Subject: Re: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 30 Nov 2020 12:13:40 +0000
In-Reply-To: <600d3ea4-f905-3aab-e110-da3bd0d4b38a@suse.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
	 <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
	 <41d9d8d4-d5cb-8350-c118-c9e1fe73b6d0@suse.com>
	 <a4f02c292a369cfd771790b1d164f139fec6bead.camel@xen.org>
	 <f25e278f-2d63-d806-4650-983df490556f@xen.org>
	 <d75fd45c-3f66-63c9-90c7-90dc10fc5763@suse.com>
	 <8bb9eb92-ede4-0fa4-d21f-c7976fe70acf@xen.org>
	 <622a8319-a439-72f2-c045-15e7611a22e7@suse.com>
	 <3db3081d-232a-cce1-cfce-c657be64a0dd@xen.org>
	 <600d3ea4-f905-3aab-e110-da3bd0d4b38a@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

Sorry for the late reply. Been busy with something else.

On Tue, 2020-08-18 at 18:16 +0200, Jan Beulich wrote:
> On 18.08.2020 15:08, Julien Grall wrote:
> > Hi Jan,
> > 
> > On 18/08/2020 12:30, Jan Beulich wrote:
> > > On 18.08.2020 12:13, Julien Grall wrote:
> > > > Hi Jan,
> > > > 
> > > > On 18/08/2020 09:49, Jan Beulich wrote:
> > > > > On 13.08.2020 19:22, Julien Grall wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On 13/08/2020 17:08, Hongyan Xia wrote:
> > > > > > > On Fri, 2020-08-07 at 16:05 +0200, Jan Beulich wrote:
> > > > > > > > On 27.07.2020 16:21, Hongyan Xia wrote:
> > > > > > > > > From: Wei Liu <wei.liu2@citrix.com>
> > > > > > > > > 
> > > > > > > > > Rewrite those functions to use the new APIs. Modify
> > > > > > > > > its callers to
> > > > > > > > > unmap
> > > > > > > > > the pointer returned. Since alloc_xen_pagetable_new()
> > > > > > > > > is almost
> > > > > > > > > never
> > > > > > > > > useful unless accompanied by page clearing and a
> > > > > > > > > mapping, introduce
> > > > > > > > > a
> > > > > > > > > helper alloc_map_clear_xen_pt() for this sequence.
> > > > > > > > > 
> > > > > > > > > Note that the change of virt_to_xen_l1e() also
> > > > > > > > > requires
> > > > > > > > > vmap_to_mfn() to
> > > > > > > > > unmap the page, which requires domain_page.h header
> > > > > > > > > in vmap.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> > > > > > > > > Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> > > > > > > > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > > > > > > > > 
> > > > > > > > > ---
> > > > > > > > > Changed in v8:
> > > > > > > > > - s/virtual address/linear address/.
> > > > > > > > > - BUG_ON() on NULL return in vmap_to_mfn().
> > > > > > > > 
> > > > > > > > The justification for this should be recorded in the
> > > > > > > > description. In
> > > > > > > 
> > > > > > > Will do.
> > > > > > > 
> > > > > > > > reply to v7 I did even suggest how to easily address
> > > > > > > > the issue you
> > > > > > > > did notice with large pages, as well as alternative
> > > > > > > > behavior for
> > > > > > > > vmap_to_mfn().
> > > > > > > 
> > > > > > > One thing about adding SMALL_PAGES is that vmap is common
> > > > > > > code and I am
> > > > > > > not sure if the Arm side is happy with it.
> > > > > > 
> > > > > > At the moment, Arm is only using small mapping but I plan
> > > > > > to change that soon because we have regions that can be
> > > > > > fairly big.
> > > > > > 
> > > > > > Regardless that, the issue with vmap_to_mfn() is rather x86
> > > > > > specific. So I don't particularly like the idea to expose
> > > > > > such trick in common code.
> > > > > > 
> > > > > > Even on x86, I think this is not the right approach. Such
> > > > > > band-aid will impact the performance as, assuming
> > > > > > superpages are used, it will take longer to map and add
> > > > > > pressure on the TLBs.
> > > > > > 
> > > > > > I am aware that superpages will be useful for LiveUpdate,
> > > > > > but is there any use cases in upstream?
> > > > > 
> > > > > Superpage use by vmalloc() is purely occasional: You'd have
> > > > > to vmalloc()
> > > > > 2Mb or more _and_ the page-wise allocation ought to return
> > > > > 512
> > > > > consecutive pages in the right order. Getting 512 consecutive
> > > > > pages is
> > > > > possible in practice, but with the page allocator allocating
> > > > > top-down it
> > > > > is very unlikely for them to be returned in increasing-sorted 
> > > > > order.
> > > > 
> > > > So your assumption here is vmap_to_mfn() can only be called on
> > > > vmalloc-ed() area. While this may be the case in Xen today, the
> > > > name clearly suggest it can be called on all vmap-ed region.
> > > 
> > > No, I don't make this assumption, and I did spell this out in an
> > > earlier
> > > reply to Hongyan: Parties using vmap() on a sufficiently large
> > > address
> > > range with consecutive MFNs simply have to be aware that they may
> > > not
> > > call vmap_to_mfn().
> > 
> > You make it sounds easy to be aware, however there are two
> > implementations of vmap_to_mfn() (one per arch). Even looking at
> > the x86 version, it is not obvious there is a restriction.
> 
> I didn't mean to make it sound like this - I agree it's not an
> obvious
> restriction.
> 
> > So I am a bit concerned of the "misuse" of the function. This could
> > possibly be documented. Although, I am not entirely happy to
> > restrict the use because of x86.
> 
> Unless the underlying issue gets fixed, we need _some_ form of bodge.
> I'm not really happy with the BUG_ON() as proposed by Hongyan. You're
> not really happy with my first proposed alternative, and you didn't
> comment on the 2nd one (still kept in context below). Not sure what
> to do: Throw dice?

Actually I did not propose the BUG_ON() fix. I was just in favor of it
when Jan presented it as a choice in v7.

The reason I am in favor of it is that even without it, the existing
x86 code already BUG_ON() when vmap has a superpage anyway, so it's not
like other alternatives behave any differently for superpages. I am
also not sure about returning INVALID_MFN because if virt_to_xen_l1e()
really returns NULL, then we are calling vmap_to_mfn() on a non-vmap
address (not even populated) which frankly deserves at least ASSERT().
So, I don't think BUG_ON() is a bad idea for now before vmap_to_mfn()
supports superpages.

Of course, we could use MAP_SMALL_PAGES to avoid the whole problem, but
Arm may not be happy. After a quick chat with Julien, how about having
ARCH_VMAP_FLAGS and only small pages for x86?

Hongyan


