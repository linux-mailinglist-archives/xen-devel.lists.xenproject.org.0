Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D5A4C36C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 00:06:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdigj-0004jc-CS; Wed, 19 Jun 2019 22:04:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hdigh-0004jX-KW
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 22:04:15 +0000
X-Inumbo-ID: 2d05bb2e-92de-11e9-8fe1-d78c4d4a1226
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d05bb2e-92de-11e9-8fe1-d78c4d4a1226;
 Wed, 19 Jun 2019 22:04:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1FB482085A;
 Wed, 19 Jun 2019 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560981854;
 bh=2sRUf7/rgF5K+ZN8Jt9a+uytQc4kcLTwR+Uw5nXM+II=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=QuX7EpJfIKDm5IY4dJRUj37Vvgx9DaLnTEBxxkCwJB7aFxfA3EK0Gy3fTDjFpOMgN
 c8d/RBoXp0VIjTW/IDgNPmtZ9NhatxExL4Jf+Is/38ufMyTVHsf7I/UxtyBvDJV45q
 3yQPJ+8h4UBnhQopPazQ6Hs4Er78h0wwPCGbthCU=
Date: Wed, 19 Jun 2019 15:04:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <ff241dfa-fb0e-63d6-f345-f80afb6a6035@arm.com>
Message-ID: <alpine.DEB.2.21.1906191458230.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906191422170.2072@sstabellini-ThinkPad-T480s>
 <a29aa125-bb95-d178-0f74-0804d8ad6f91@arm.com>
 <alpine.DEB.2.21.1906191446280.2072@sstabellini-ThinkPad-T480s>
 <ff241dfa-fb0e-63d6-f345-f80afb6a6035@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1895638443-1560981769=:2072"
Content-ID: <alpine.DEB.2.21.1906191502560.2072@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [PATCH] xen/arm: fix build after 2e35cdf
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, JBeulich@suse.com, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1895638443-1560981769=:2072
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.1906191502561.2072@sstabellini-ThinkPad-T480s>

On Wed, 19 Jun 2019, Julien Grall wrote:
> On 6/19/19 10:47 PM, Stefano Stabellini wrote:
> > On Wed, 19 Jun 2019, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > Title: You should at least mention this is for op-tee.
> > > 
> > > Also, mostly likely the sha1 is too small and likely to match multiple
> > > commit
> > > in the future. So you want to specify the title of the commit.
> > > 
> > > On 6/19/19 10:24 PM, Stefano Stabellini wrote:
> > > > Optee breaks the build with:
> > > > 
> > > > optee.c: In function ‘translate_noncontig.isra.4’:
> > > > optee.c:743:38: error: ‘xen_data’ may be used uninitialized in this
> > > > function
> > > > [-Werror=maybe-uninitialized]
> > > >                xen_data->next_page_data = page_to_maddr(xen_pgs + 1);
> > > >                                         ^
> > > > optee.c:732:71: error: ‘guest_data’ may be used uninitialized in this
> > > > function [-Werror=maybe-uninitialized]
> > > >            page =
> > > > get_domain_ram_page(gaddr_to_gfn(guest_data->pages_list[idx]));
> > > >                                                                          ^
> > > > optee.c:750:21: error: ‘guest_pg’ may be used uninitialized in this
> > > > function
> > > > [-Werror=maybe-uninitialized]
> > > >                put_page(guest_pg);
> > > >                        ^
> > > > cc1: all warnings being treated as errors
> > > > 
> > > > Fix it by initializing xen_data, guest_data, guest_pg to NULL. Also set
> > > > xen_pgs to NULL for consistency.
> > > 
> > > Without more explanation I think this is an unwise choice. If GCC thinks
> > > it is
> > > going to be used unitialized, then mostly likely you silent an error that
> > > could end up to dereference NULL.
> > > 
> > > Also, setting xen_pgs for consistency will only defeat the compiler.
> > > Leading
> > > to dereferencing NULL and crash Xen...
> > > 
> > > For xen_pgs, this should definitely not be NULL. For the two others, you
> > > need
> > > to explain why this is fine (if this is just because the compiler can't
> > > find
> > > the reason, then you should add a comment in the code to explain it).
> > 
> > I was only trying to unblock the build. 
> 
> So? We don't silence a compiler warning just for unblocking the build without
> any proper investigation. Didn't you do that before adding the NULL?

No I didn't. But actually, I thought we did unbreak a build as quickly
as possible even without a full fix in the past. In fact, I seem to
recollect that we did that even without collecting all necessary acks.
Maybe my memory is failing me? But I would have sworn it happened a
couple of times in the last 12 months. Or maybe this case is different
because it doesn't break the build with the default kconfig? In any
case, let's agree on a policy and I am happy to follow it.
--8323329-1895638443-1560981769=:2072
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1895638443-1560981769=:2072--

