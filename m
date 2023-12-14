Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5C9813D0A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 23:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654785.1022155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtoy-0003B7-Vk; Thu, 14 Dec 2023 22:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654785.1022155; Thu, 14 Dec 2023 22:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtoy-00038c-T8; Thu, 14 Dec 2023 22:04:44 +0000
Received: by outflank-mailman (input) for mailman id 654785;
 Thu, 14 Dec 2023 22:04:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtox-00038W-OY
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 22:04:43 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6fd692f-9acc-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 23:04:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 147C6CE2652;
 Thu, 14 Dec 2023 22:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9467C433C8;
 Thu, 14 Dec 2023 22:04:36 +0000 (UTC)
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
X-Inumbo-ID: c6fd692f-9acc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702591478;
	bh=IIXYAcHhB9hNg5Zo0YZQzIK6v2vnrn8wn7nrRKXOlIk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UPako9BNjPqVbWSVyv58pUag7mYioZhtslU+5KGRHmrjZmR1pb2uEzmGAqzvhLnDG
	 qhO481hCX5UmKFB9HPTss0SLYe1p4ZuqT/QCK/6J1pVslW1w8Fs2xNxDUfZgzHsDKE
	 rrkOPhb4mzDKsXplkfKCdbW0EjeehAPApbobqFDc0XETo1aM6RehwhXe7QxeStrLUm
	 eoDOq1b1xHZOd8hJ+zt0jk112CnMxis76pFxUexffwnOh3lnyXO3yzZQ6w5gM31VXL
	 17HhVsqWRCT09KTAr8NdJcBLFo9ryZgFGzppwnMv2FV81eQFCnwDtX4is0214oKi0l
	 VkWSXdcOM41DQ==
Date: Thu, 14 Dec 2023 14:04:35 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Simone Ballarin <simone.ballarin@bugseng.com>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 9/9] xen: add SAF deviation for safe cast removal.
In-Reply-To: <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312141355391.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com> <36e996b864853dba26a9c9fb9c9c674e92cc935e.1702555387.git.maria.celeste.cesario@bugseng.com> <b93417c7-1375-4bf4-ace2-d36bd63c8b0b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Jan Beulich wrote:
> On 14.12.2023 13:07, Simone Ballarin wrote:
> > --- a/docs/misra/safe.json
> > +++ b/docs/misra/safe.json
> > @@ -28,6 +28,14 @@
> >          },
> >          {
> >              "id": "SAF-3-safe",
> > +            "analyser": {
> > +                "eclair": "MC3R1.R11.8"
> > +            },
> > +            "name": "MC3R1.R11.8: removal of const qualifier to comply with function signature",
> > +            "text": "It is safe to cast away const qualifiers to comply with function signature if the function does not modify the pointee."
> 
> I'm not happy with this description, as it invites for all sorts of abuse.
> Yet I'm also puzzled that ...

We can improve the language but the concept would still be the same. For
instance:

A single function might or might not modify the pointee depending on
other function parameters (for instance a single function that could
either read or write depending on how it is called). It is safe to cast
away const qualifiers when passing a parameter to a function of this
type when the other parameters are triggering a read-only operation.


> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -3413,6 +3413,7 @@ static enum hvm_translation_result __hvm_copy(
> >  enum hvm_translation_result hvm_copy_to_guest_phys(
> >      paddr_t paddr, const void *buf, unsigned int size, struct vcpu *v)
> >  {
> > +    /* SAF-3-safe */
> >      return __hvm_copy((void *)buf /* HVMCOPY_to_guest doesn't modify */,
> >                        paddr, size, v,
> >                        HVMCOPY_to_guest | HVMCOPY_phys, 0, NULL);
> 
> ... this is the only place you then use it. Afaict some of Arm's copy_guest()
> callers ought to have a similar issue. If so, an enlarged patch should be
> discussed with a larger audience, to see how we collectively think we want to
> put this specific kind of deviation.

We have a similar problem, see xen/arch/arm/guestcopy.c
raw_copy_to_guest and raw_copy_from_guest.

I would use the SAF deviation there too.

In the case here, I think the comment "HVMCOPY_to_guest doesn't modify"
could be removed as it becomes redundant with SAF-3-safe, but I'll leave
it to you.

