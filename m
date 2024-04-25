Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0568B2D2D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 00:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712310.1112915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s07kr-0007Nw-MB; Thu, 25 Apr 2024 22:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712310.1112915; Thu, 25 Apr 2024 22:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s07kr-0007Ms-JW; Thu, 25 Apr 2024 22:39:49 +0000
Received: by outflank-mailman (input) for mailman id 712310;
 Thu, 25 Apr 2024 22:39:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s07kp-0007Mm-Np
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 22:39:47 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5805e05-0354-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 00:39:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 80EB0CE1B1A;
 Thu, 25 Apr 2024 22:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C65C113CC;
 Thu, 25 Apr 2024 22:39:36 +0000 (UTC)
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
X-Inumbo-ID: b5805e05-0354-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714084777;
	bh=oOYbhV44fGwEe1PsI9kEnLiWkX73TKVwrf0p15OdxT8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FHZWq08yTnd+xWCpIT8uH5RjXXxDFAns6lAfmCJZeHynaoRlYG9uNwrDHcubAdklq
	 AsgRLiaeeTCVHIXJ0CsfhoGeiomVXQ+YsFQ//ywNgHCQ+n4Qtd+5GDOSgM9GtOMquX
	 hphX+PTzoMSYf1bpWgsDQSLYNg/qWztnUhTKOytu3J/koocTvA/WO5T3FJ1iR/eA3M
	 aJWxzoUzFp4HasMUWhZHLoh/tXQrG05TiFiaOqoai8zG8Yxg1pPggFxOyleBWXMWz6
	 NnGkIQNn9xhzbsEopWIEHzuw06mL9szRQsXWi4DwLxkBmnziIkv8G7ML72VJ1iqu/t
	 7QD/Ut/1IE9GA==
Date: Thu, 25 Apr 2024 15:39:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] public: xen: Define missing guest handle for int32_t
In-Reply-To: <29afd327-a66c-4b4e-b076-ee6ecb70807e@xen.org>
Message-ID: <alpine.DEB.2.22.394.2404251538250.3940@ubuntu-linux-20-04-desktop>
References: <20240417121442.56178-1-michal.orzel@amd.com> <be95f6be-0404-4c43-926f-d011782a02db@xen.org> <alpine.DEB.2.22.394.2404171148060.2257106@ubuntu-linux-20-04-desktop> <29afd327-a66c-4b4e-b076-ee6ecb70807e@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1530701373-1714084777=:3940"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1530701373-1714084777=:3940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 22 Apr 2024, Julien Grall wrote:
> Hi Stefano,
> 
> On 17/04/2024 19:49, Stefano Stabellini wrote:
> > On Wed, 17 Apr 2024, Julien Grall wrote:
> > > Hi Michal,
> > > 
> > > On 17/04/2024 13:14, Michal Orzel wrote:
> > > > Commit afab29d0882f ("public: s/int/int32_t") replaced int with int32_t
> > > > in XEN_GUEST_HANDLE() in memory.h but there is no guest handle defined
> > > > for it. This results in a build failure. Example on Arm:
> > > > 
> > > > ./include/public/arch-arm.h:205:41: error: unknown type name
> > > > ‘__guest_handle_64_int32_t’
> > > >     205 | #define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ##
> > > > name
> > > >         |                                         ^~~~~~~~~~~~~~~~~~
> > > > ./include/public/arch-arm.h:206:41: note: in expansion of macro
> > > > ‘__XEN_GUEST_HANDLE’
> > > >     206 | #define XEN_GUEST_HANDLE(name)
> > > > __XEN_GUEST_HANDLE(name)
> > > >         |                                         ^~~~~~~~~~~~~~~~~~
> > > > ./include/public/memory.h:277:5: note: in expansion of macro
> > > > ‘XEN_GUEST_HANDLE’
> > > >     277 |     XEN_GUEST_HANDLE(int32_t) errs;
> > > > 
> > > > Fix it. Also, drop guest handle definition for int given no further use.
> > > > 
> > > > Fixes: afab29d0882f ("public: s/int/int32_t")
> > > > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > 
> > > So it turned out that I committed v1 from Stefano. I was meant to commit
> > > the
> > > patch at all, but I think I started with a dirty staging :(. Sorry for
> > > that.
> > > 
> > > I have reverted Stefano's commit for now so we can take the correct patch.
> > > 
> > > Now, from my understanding, Andrew suggested on Matrix that this solution
> > > may
> > > actually be a good way to handle GUEST_HANLDEs (they were removed in v2).
> > > Maybe this can be folded in Stefano's patch?
> > 
> > v1 together with Michal's fix is correct. Also v2 alone is correct, or
> > v2 with Michal's fix is also correct.
> 
> I am slightly confused, v2 + Michal's fix means that XEN_GUEST_HANDLE(int) is
> removed and we introduce XEN_GUEST_INT(int32_t) with no user. So wouldn't this

You are right I apologize. I looked at Michal's patch too quickly and
I thought it was just adding XEN_GUEST_INT(int32_t) without removing
anything.

In that case, if you are OK with it, please ack and commit v2 only.
--8323329-1530701373-1714084777=:3940--

