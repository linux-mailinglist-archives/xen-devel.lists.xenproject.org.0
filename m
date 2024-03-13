Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6D87A6D1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 12:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692340.1079373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkMUl-0001jk-Nc; Wed, 13 Mar 2024 11:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692340.1079373; Wed, 13 Mar 2024 11:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkMUl-0001gs-Jv; Wed, 13 Mar 2024 11:10:03 +0000
Received: by outflank-mailman (input) for mailman id 692340;
 Wed, 13 Mar 2024 11:10:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Eap=KT=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rkMUk-0001Qg-8R
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 11:10:02 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c1175e2-e12a-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 12:10:00 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a4429c556efso567259366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 04:10:00 -0700 (PDT)
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
X-Inumbo-ID: 3c1175e2-e12a-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710328200; x=1710933000; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCEfcPMbpAIZ2d04Rpa0MWk0/RT7zQUK5ESphtcAzUo=;
        b=N5rvwBU4uBfvAbJAe+ea6wSX+R5QCeb2lqP3f3mbS2kuv3OzyfuuV51oBT0VYz4dyp
         HZHER/i/TdsBOBvtODuNCdbHSV2wF+kYk0aKBiP4/0POIt0g9q575QU9ZSwARGtyclUU
         vQ7jjHj7+AZD/ahxqcPOJNQiZbpUKjsrpWQgm1d5YokoU/uTjRPFMbUrzyMEAiP3Ez+B
         x2PQ54WQytD8dXdR9W9efIuQqVfkmFRPjU+mCqgCzUEnT7y1E4dYRGCyHPtDGWU1GPls
         XqeFNEpfutpuvynBjvHk2vuSXKMR/khlUHJ20M1u3cbi/sNBiSCGvJAQ/vfaRq8MMTye
         hWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710328200; x=1710933000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCEfcPMbpAIZ2d04Rpa0MWk0/RT7zQUK5ESphtcAzUo=;
        b=q8eatQ6j/6w+BNOq4lW9LhJ6l76hCeRAi0synN2gCOOl6z+oyLqEuatvZ89ac4/r9R
         od1O/ih5B6bVHcFMFUg1enqlExXiuW6ppaWsHlb352dzm6wpxLOk8e0F5uKHGD0KO+zk
         T4TruYmC7lfqQgSiqufR+onoS4p/Pn8a3EpE82bVhnEw4D+hoWBhQ0r0jIznCuOTDcjG
         oEJ7BAG3Ugye9nV8OOQzY8gM1to6uwY14YewE+cDeVM8vUSb68yyl02za4l7h7hVwjou
         IIx3ypuG3U43FPCb4dYtqO19vM521/ItueB7VbLEv6xqlMe730D1+YHA/Y15xFvWG93T
         78YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBCNDlHEGgxE2XJVnGod0QVjSLhLeBNu9I71dx08yoma5GIKsHJ0Tth9uhPQ6pJo3/h6h/oRd+Yumfb5tYuA7pVMXrhquI7wmqJ+RLOyY=
X-Gm-Message-State: AOJu0YzQAI22jBKDTG4Yd8VM+sLHK/DgkIHqoPPpLK/ZzFUoFGbMs5kq
	kRhoyBy4GYjuW9QyHNV9dSRy/+U9rZF+tQEm1Pw4Ba7BfyxXu7v15/eLW2LqOs7vK/SE/y7W4RJ
	a7IeU94wXk8m5VX7dtqG/UCNLr8ePDhM/3sI3HQ==
X-Google-Smtp-Source: AGHT+IFP5/pzUK7eFJw0FxEzkbEWBgf7gHGrwHLZTpIVYGm8fiT8ODsS12VkxnilnRRqD7j42yy6k/oL49OGElQIb9M=
X-Received: by 2002:a17:906:ba82:b0:a46:1a14:3563 with SMTP id
 cu2-20020a170906ba8200b00a461a143563mr2500782ejd.50.1710328200323; Wed, 13
 Mar 2024 04:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240308015435.4044339-1-xin.wang2@amd.com> <20240308015435.4044339-5-xin.wang2@amd.com>
 <4821f30b-94a6-4a2a-8c46-81a9d1e288a4@amd.com> <db776326-6899-4122-9f1f-66dcc2853506@amd.com>
In-Reply-To: <db776326-6899-4122-9f1f-66dcc2853506@amd.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 13 Mar 2024 12:09:49 +0100
Message-ID: <CAG+AhRWvNzzZTFsKYf7X6tCy4TnTE7LX8vNp7Mh1w0js2tOyBQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] xen/arm: Find unallocated spaces for magic pages
 of direct-mapped domU
To: Henry Wang <xin.wang2@amd.com>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Alec Kwapis <alec.kwapis@medtronic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Henry,

On Tue, Mar 12, 2024 at 4:25=E2=80=AFAM Henry Wang <xin.wang2@amd.com> wrot=
e:
>
> Hi Michal,
>
> On 3/11/2024 9:46 PM, Michal Orzel wrote:
> > Hi Henry,
> >
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-buil=
d.c
> > index 1e1c8d83ae..99447bfb0c 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -682,6 +682,49 @@ static int __init prepare_dtb_domU(struct domain *=
d, struct kernel_info *kinfo)
> >
> >       if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
> >       {
> > +        if ( is_domain_direct_mapped(d) )
> > +        {
> > This whole block is dependent on static memory feature that is compiled=
 out by default.
> > Shouldn't you move it to static-memory.c ?
>
> This makes sense. I will convert this block to a function then move to
> static-memory.c in v3.
>
> >> +            struct meminfo *avail_magic_regions =3D xzalloc(struct me=
minfo);
> > I can't see corresponding xfree(avail_magic_regions). It's not going to=
 be used after unused memory
> > regions are retrieved.
>
> Hmmm I realized I've made a mess here and below. I will do the proper
> error handling in v3.
>
> >> +            struct meminfo *rsrv_mem =3D &bootinfo.reserved_mem;
> >> +            struct mem_map_domain *mem_map =3D &d->arch.mem_map;
> >> +            uint64_t magic_region_start =3D INVALID_PADDR;
> > What's the purpose of this initialization? magic_region_start is going =
to be re-assigned before making use of this value.
>
> Personally for variables holding an address, I would like to init the
> local variable to a poison value before use. But you are right it does
> not make a difference here I think. I can drop the initialization if you
> prefer not having it, sure.
>
> >> +            uint64_t magic_region_size =3D GUEST_MAGIC_SIZE;
> > Why not paddr_t?
>
> Good catch, I mixed struct meminfo with the newly added struct. Will use
> paddr_t.
> >> +
> >> +            magic_region_start =3D avail_magic_regions->bank[0].start=
;
> >> +
> >> +            /*
> >> +             * Register the magic region as reserved mem to make sure=
 this
> >> +             * region will not be counted when allocating extended re=
gions.
> > Well, this is only true in case find_unallocated_memory() is used to re=
trieve free regions.
> > What if our direct mapped domU used partial dtb and IOMMU is in use? In=
 this case,
> > find_memory_holes() will be used and the behavior will be different.
> >
> > Also, I'm not sure if it is a good idea to call find_unused_memory twic=
e (with lots of steps inside)
> > just to retrieve 16MB (btw. add_ext_regions will only return 64MB+ regi=
ons) region for magic pages.
> > I'll let other maintainers share their opinion.
>
> I agree with your point. Let's wait a bit longer for more
> ideas/comments. If no other inputs, I think I will drop the
> "adding to reserved_mem" part of logic and record the found unused
> memory in kinfo, then use rangeset_remove_range() to remove this range
> in both
>
> find_unallocated_memory() and find_memory_holes().
>
> > Also, CCing Carlo since he was in a need of retrieving free memory regi=
ons as well for cache coloring with dom0.
>
> (+ Carlo)
> Any inputs from your side for this topic Carlo?

Nothing at the moment.

Thanks.

> Kind regards,
> Henry
> > ~Michal
>

