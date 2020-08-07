Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DF23F498
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 23:51:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4AGg-0004nO-RX; Fri, 07 Aug 2020 21:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k4AGf-0004n5-3R
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 21:51:13 +0000
X-Inumbo-ID: 7fae22d1-4225-4835-b1c8-1287742aeb5b
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fae22d1-4225-4835-b1c8-1287742aeb5b;
 Fri, 07 Aug 2020 21:51:12 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43BA32177B;
 Fri,  7 Aug 2020 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596837071;
 bh=BS4dpglETiiSLoYi4FTffbo0X4N/96tbX+74HErGi20=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=k4cfZ2rm8/F/isH3OXkB2W9ohWhkTMVtgic98icawn1kFHg/k8MxO9iloO49A5Ehk
 vk1NIUVa/YQs/yIp3YhBdehR5c9BMUDnRr4IGgPfm39Ylw6BVCWFtMrAsEHYuxzb3p
 g1IPttt9MKU4GTSpbqmYn+e3JG5k1Uckbat5N3hc=
Date: Fri, 7 Aug 2020 14:51:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 00/14] kernel-doc: public/arch-arm.h
In-Reply-To: <7923d0f4-a446-c852-5423-0fe65ef27a41@suse.com>
Message-ID: <alpine.DEB.2.21.2008071210140.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
 <7923d0f4-a446-c852-5423-0fe65ef27a41@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 7 Aug 2020, Jan Beulich wrote:
> On 07.08.2020 01:49, Stefano Stabellini wrote:
> > # THE KERNEL-DOC KEYWORDS USED
> > 
> > I used the "struct" keyword for structures, i.e.:
> > 
> > /**
> >  * struct foobar
> >  */
> > 
> > "struct" makes kernel-doc go and look at the following struct in the
> > code, parses struct members comments, and generate a doc optimized to
> > describe a struct. Note that in these cases the struct needs to follow
> > immediately the comment. Thus, I had to move an #define between the
> > comment and the struct in a few places.
> > 
> > Also note that kernel-doc supports nested structs but due to a quirk,
> > comments for nested struct members cannot be on a single line. They have
> > to be:
> > 
> >   struct foo {
> >       struct {
> >           /**
> >            * @u.bar: foobar
> >            */
> >           bar;
> >       } u;
> >   }
> 
> Urgh.
> 
> > Otherwise for normal struct the single line comment works fine:
> > 
> >   struct foo {
> >       /** @bar: foobar */
> >       bar;
> >   }
> > 
> > 
> > I used the "DOC" keyword otherwise. "DOC" is freeform, not particularly
> > tied to anything following (functions, enums, etc.) I kept a black line
> > between "DOC" and the following comment if multiline and no blank line
> > if it is single line.
> > 
> >   /**
> >    * DOC: doc1
> >    * single line comment
> >    */
> > 
> >    /**
> >     * DOC: doc2
> >     *
> >     * this is
> >     * multiline
> >     */
> 
> I think before the first piece of this goes in (or together with it
> going in), ./CODING_STYLE wants to be updated to reflect this. It is
> particularly relevant imo to mention the quirk above and hence the
> necessary exception (even better of course would be to get the quirk
> out of kernel-doc).
 
Yes, I can add a patch to change ./CODING_STYLE. I think we should
encourage people to use the kernel-doc syntax at least for public
headers. I can document the use of the "struct" and "DOC" keywords, and
also the quirk with nested structs.

Note that instead the black line after DOC is completely optional from
a kernel-doc perspective, I did it for style, but I can add that to
./CODING_STYLE too.

