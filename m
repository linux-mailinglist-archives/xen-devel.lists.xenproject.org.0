Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF091B3314
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 01:28:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jR2IQ-0004jp-F0; Tue, 21 Apr 2020 23:27:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO9m=6F=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jR2IP-0004jk-D8
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 23:27:17 +0000
X-Inumbo-ID: a32d9304-8427-11ea-91e3-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a32d9304-8427-11ea-91e3-12813bfff9fa;
 Tue, 21 Apr 2020 23:27:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6A87206D5;
 Tue, 21 Apr 2020 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587511636;
 bh=sfnZf1beH10HqpyFM6AUXnmvNTnUV7wg6qSQSlrtjrY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=b2LQdJgurLstaApReLHIjx5mlrgrkQtsU7trXwaXqF8/VNBSou+vMYPvCqbXOAp2M
 576f7eMK5jb+ukKCwZ4lBKXrVNYHAaSxGSCkgsSH3bkPkCSVvaJg0yvUNwQGTmeZ7v
 RDvtP9OHfQHzuWFO1f1ll/rNFevQzBWqKZXInixQ=
Date: Tue, 21 Apr 2020 16:27:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] pvcalls: Document explicitly the padding for all
 arches
In-Reply-To: <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
Message-ID: <alpine.DEB.2.21.2004211609410.24585@sstabellini-ThinkPad-T480s>
References: <20200419104948.31200-1-julien@xen.org>
 <e07dbb22-1300-ae87-4065-824938caec48@suse.com>
 <78288649-5930-9d01-bb8f-85e15406e4ef@xen.org>
 <6fc59120-664e-6a07-5196-57e1dbfb0dde@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1109758986-1587511151=:24585"
Content-ID: <alpine.DEB.2.21.2004211619370.24585@sstabellini-ThinkPad-T480s>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1109758986-1587511151=:24585
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2004211619371.24585@sstabellini-ThinkPad-T480s>

On Mon, 20 Apr 2020, Jan Beulich wrote:
> On 20.04.2020 15:34, Julien Grall wrote:
> > Hi Jan,
> > 
> > On 20/04/2020 09:04, Jan Beulich wrote:
> >> On 19.04.2020 12:49, Julien Grall wrote:
> >>> --- a/docs/misc/pvcalls.pandoc
> >>> +++ b/docs/misc/pvcalls.pandoc
> >>> @@ -246,9 +246,7 @@ The format is defined as follows:
> >>>                   uint32_t domain;
> >>>                   uint32_t type;
> >>>                   uint32_t protocol;
> >>> -                #ifdef CONFIG_X86_32
> >>>                   uint8_t pad[4];
> >>> -                #endif
> >>>               } socket;
> >>>               struct xen_pvcalls_connect {
> >>>                   uint64_t id;
> >>> @@ -257,16 +255,12 @@ The format is defined as follows:
> >>>                   uint32_t flags;
> >>>                   grant_ref_t ref;
> >>>                   uint32_t evtchn;
> >>> -                #ifdef CONFIG_X86_32
> >>>                   uint8_t pad[4];
> >>> -                #endif
> >>>               } connect;
> >>>               struct xen_pvcalls_release {
> >>>                   uint64_t id;
> >>>                   uint8_t reuse;
> >>> -                #ifdef CONFIG_X86_32
> >>>                   uint8_t pad[7];
> >>> -                #endif
> >>>               } release;
> >>>               struct xen_pvcalls_bind {
> >>>                   uint64_t id;
> >>> @@ -276,9 +270,7 @@ The format is defined as follows:
> >>>               struct xen_pvcalls_listen {
> >>>                   uint64_t id;
> >>>                   uint32_t backlog;
> >>> -                #ifdef CONFIG_X86_32
> >>>                   uint8_t pad[4];
> >>> -                #endif
> >>>               } listen;
> >>>               struct xen_pvcalls_accept {
> >>>                   uint64_t id;
> >>
> >> I wonder on what grounds these #ifdef-s had been there - they're
> >> plain wrong with the types used in the public header.
> >>
> >>> --- a/xen/include/public/io/pvcalls.h
> >>> +++ b/xen/include/public/io/pvcalls.h
> >>> @@ -65,6 +65,7 @@ struct xen_pvcalls_request {
> >>>               uint32_t domain;
> >>>               uint32_t type;
> >>>               uint32_t protocol;
> >>> +            uint8_t pad[4];
> >>>           } socket;
> >>>           struct xen_pvcalls_connect {
> >>>               uint64_t id;
> >>> @@ -73,10 +74,12 @@ struct xen_pvcalls_request {
> >>>               uint32_t flags;
> >>>               grant_ref_t ref;
> >>>               uint32_t evtchn;
> >>> +            uint8_t pad[4];
> >>>           } connect;
> >>>           struct xen_pvcalls_release {
> >>>               uint64_t id;
> >>>               uint8_t reuse;
> >>> +            uint8_t pad[7];
> >>>           } release;
> >>>           struct xen_pvcalls_bind {
> >>>               uint64_t id;
> >>> @@ -86,6 +89,7 @@ struct xen_pvcalls_request {
> >>>           struct xen_pvcalls_listen {
> >>>               uint64_t id;
> >>>               uint32_t backlog;
> >>> +            uint8_t pad[4];
> >>>           } listen;
> >>
> >> I'm afraid we can't change these in such a way - your additions
> >> change sizeof() for the respective sub-structures on 32-bit x86,
> >> and hence this is not a backwards compatible adjustment. 
> > 
> > This is a bit confusing, each structure contain a 64-bit field so
> > I would have thought it the structure would be 8-byte aligned (as
> > on 32-bit Arm). But looking at the spec, a uint64_t will only
> > aligned to 4-byte.
> > 
> > However, I am not sure why sizeof() matters here. I understand
> > the value would be different, but AFAICT, this is not used as part
> > of the protocol.
> 
> Two independent components of a consumer of our interface could
> have a function taking (pointer to) struct xen_pvcalls_connect.
> If one component gets re-built with the new definition and the
> other doesn't, they'll disagree on what range of memory needs
> to be accessible. The instantiating side (using the old header)
> may have ended up placing the struct immediately ahead of a
> page boundary. The consuming side (using the changed header)
> would then encounter a fault if it wanted to access the struct
> as a whole (assignment, memcpy()).

Even if it was possible to use the sub-structs defined in the header
that way, keep in mind that we also wrote:

        /* dummy member to force sizeof(struct xen_pvcalls_request)
         * to match across archs */
        struct xen_pvcalls_dummy {
            uint8_t dummy[56];
        } dummy;

And the spec also clarifies that the size of each specific request is
always 56 bytes. So I think that if we wanted, we could make the changes
Julien is suggesting without worrying about breaking anything.

Speaking of the patch, I think it would be good to have to make things
clearer.
--8323329-1109758986-1587511151=:24585--

