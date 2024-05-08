Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803328C0276
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 19:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718894.1121454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4kew-0004W8-F7; Wed, 08 May 2024 17:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718894.1121454; Wed, 08 May 2024 17:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4kew-0004UB-CU; Wed, 08 May 2024 17:00:50 +0000
Received: by outflank-mailman (input) for mailman id 718894;
 Wed, 08 May 2024 17:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+6iU=ML=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s4kev-0004U0-57
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 17:00:49 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8105a80d-0d5c-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 19:00:43 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715187640156347.1766965633724;
 Wed, 8 May 2024 10:00:40 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-de5b1e6beceso5334871276.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 10:00:39 -0700 (PDT)
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
X-Inumbo-ID: 8105a80d-0d5c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1715187641; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JJGEgOvmp/V135Bbi8Ctl3jdbCT9mwe/IWYozm7/m76LxYlHHTn7DCPn2S02bzgxDSOeFxt95i+kaigmT6pbzZ7OYko9TnvFwy1JNr7Yxa6EIYYGA/mxOehWVY61xVBih7lSrvfcpsylY9bssMpcfXwkoTE8G+NtH0pN4T+9fEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715187641; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cqneTxxJSgPb2TrrC49/XhkSYxbRRGvFCNeMAOfl6Z8=; 
	b=AVG402j2/SqquE6ssJ/7iYGtxIr0/vsQjuAMc4iWK79mEyWVGSki10hzNAbbxqWuQnq2g8cSSLK18LXeIlucnrdOH+G2DCwLqRKi3gCOk2sbBkP3RzJ8nQFpHOrqpBsH/o+wBE8bJrInZ5u/IOhcmj+h51PhGFHNVKJntVCNFAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715187641;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cqneTxxJSgPb2TrrC49/XhkSYxbRRGvFCNeMAOfl6Z8=;
	b=AnKWH6PLykmpQwYCrM715pak2TWS716OgtIrzQHjFLVDhslNh26whXV8lbPS2fJP
	ejqkAHW6TR9bEX6DL33SNT8BjwD3HvCFBN0kNxZdYf5KQdSzOEsvlXKDvAu8wXUhExR
	a8/k+I+YcAZa6bpUyUWGO0Cw0oER4SEwC3BjQsYo=
X-Forwarded-Encrypted: i=1; AJvYcCXIgMfizpphrZ3eOldrS0V/mRnztxC9trpQKUbey5XFptPMBoylyLIcwWExwAyMmu133uqoaFd7l5tf3wvFdPTX3FXx8peiNGNg9ST74DI=
X-Gm-Message-State: AOJu0YzLi2dijekx98rIZWt4kcDVfIAP/8S3f+WEut7Nu3D0vQcvUTgW
	pQqPGTirQ7qeSqymWVfzpDIggsUBtH6sxFG8zl+ardX98xnicJyK4dnPAXX62RXE2ShhGc6oQ5i
	mTqwZ5LMr229KGG5rDOAQYW8Wk1M=
X-Google-Smtp-Source: AGHT+IGjkls0BYju8+WLsWDaNNdKjanTL6KRySc5nmdZf0byC7AJXq7BWcgPrn+qVMXdzDaS/O7KYGLZ4lozpxpOR2g=
X-Received: by 2002:a5b:a88:0:b0:dc6:ddfc:1736 with SMTP id
 3f1490d57ef6-debb9cfcd05mr3432789276.17.1715187639062; Wed, 08 May 2024
 10:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <a3d4e07433932624266ac9b675daf0b70734696d.1714405386.git.alessandro.zucchelli@bugseng.com>
 <08eb5444-2bf0-48c0-9fcb-d8e4b801e8fa@suse.com> <834460aca34e6167a3c4620616c145b8@bugseng.com>
 <47033435-c621-40f6-b5a9-a385f323f382@xen.org> <5b84019c4e0111b3cc5e369b999fbfab@bugseng.com>
 <CABfawhkKAKAYhTrbRNyJcOaf=rQChy9eM=aVYQM9xv1ScO-UNg@mail.gmail.com> <c1566cf8-91ce-4ba6-9f42-cedad744151a@xen.org>
In-Reply-To: <c1566cf8-91ce-4ba6-9f42-cedad744151a@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 May 2024 13:00:02 -0400
X-Gmail-Original-Message-ID: <CABfawhkrxjS=KwSRbdxtUmxBvrf3+TiU-vJ7oWaMqLyHCxhU1Q@mail.gmail.com>
Message-ID: <CABfawhkrxjS=KwSRbdxtUmxBvrf3+TiU-vJ7oWaMqLyHCxhU1Q@mail.gmail.com>
Subject: Re: [XEN PATCH] xen/mem_access: address violations of MISRA C: 2012
 Rule 8.4
To: Julien Grall <julien@xen.org>
Cc: alessandro.zucchelli@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
	consulting@bugseng.com, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org, 
	sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
	volodymyr_babchuk@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 12:26=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Tamas,
>
> On 08/05/2024 17:01, Tamas K Lengyel wrote:
> > On Wed, May 8, 2024 at 10:02=E2=80=AFAM Alessandro Zucchelli
> > <alessandro.zucchelli@bugseng.com> wrote:
> >>
> >> On 2024-05-03 11:32, Julien Grall wrote:
> >>> Hi,
> >>>
> >>> On 03/05/2024 08:09, Alessandro Zucchelli wrote:
> >>>> On 2024-04-29 17:58, Jan Beulich wrote:
> >>>>> On 29.04.2024 17:45, Alessandro Zucchelli wrote:
> >>>>>> Change #ifdef CONFIG_MEM_ACCESS by OR-ing defined(CONFIG_ARM),
> >>>>>> allowing asm/mem_access.h to be included in all ARM build
> >>>>>> configurations.
> >>>>>> This is to address the violation of MISRA C: 2012 Rule 8.4 which
> >>>>>> states:
> >>>>>> "A compatible declaration shall be visible when an object or
> >>>>>> function
> >>>>>> with external linkage is defined". Functions p2m_mem_access_check
> >>>>>> and p2m_mem_access_check_and_get_page when CONFIG_MEM_ACCESS is no=
t
> >>>>>> defined in ARM builds don't have visible declarations in the file
> >>>>>> containing their definitions.
> >>>>>>
> >>>>>> Signed-off-by: Alessandro Zucchelli
> >>>>>> <alessandro.zucchelli@bugseng.com>
> >>>>>> ---
> >>>>>>   xen/include/xen/mem_access.h | 2 +-
> >>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>
> >>>>>> diff --git a/xen/include/xen/mem_access.h
> >>>>>> b/xen/include/xen/mem_access.h
> >>>>>> index 87d93b31f6..ec0630677d 100644
> >>>>>> --- a/xen/include/xen/mem_access.h
> >>>>>> +++ b/xen/include/xen/mem_access.h
> >>>>>> @@ -33,7 +33,7 @@
> >>>>>>    */
> >>>>>>   struct vm_event_st;
> >>>>>>
> >>>>>> -#ifdef CONFIG_MEM_ACCESS
> >>>>>> +#if defined(CONFIG_MEM_ACCESS) || defined(CONFIG_ARM)
> >>>>>>   #include <asm/mem_access.h>
> >>>>>>   #endif
> >>>>>
> >>>>> This doesn't look quite right. If Arm supports mem-access, why woul=
d
> >>>>> it
> >>>>> not set MEM_ACCESS=3Dy? Whereas if it's only stubs that Arm supplie=
s,
> >>>>> then
> >>>>> those would better move here, thus eliminating the need for a
> >>>>> per-arch
> >>>>> stub header (see what was e.g. done for numa.h). This way RISC-V an=
d
> >>>>> PPC
> >>>>> (and whatever is to come) would then be taken care of as well.
> >>>>>
> >>>> ARM does support mem-access, so I don't think this is akin to the
> >>>> changes done to handle numa.h.
> >>>> ARM also allows users to set MEM_ACCESS=3Dn (e.g.
> >>>> xen/arch/arm/configs/tiny64_defconfig) and builds just fine; however=
,
> >>>> the implementation file mem_access.c is compiled unconditionally in
> >>>> ARM's makefile, hence why the violation was spotted.
> >>>> This is a bit unusual, so I was also hoping to get some feedback fro=
m
> >>>> mem-access maintainers as to why this discrepancy from x86 exists. I
> >>>> probably should have also included some ARM maintainers as well, so
> >>>> I'm going to loop them in now.
> >>>>
> >>>> An alternative option I think is to make the compilation of arm's
> >>>> mem_access.c conditional on CONFIG_MEM_ACCESS (as for x86/mm and
> >>>> common).
> >>>
> >>> I can't think of a reason to have mem_access.c unconditional compiled
> >>> in. So I think it should be conditional like on x86.
> >>
> >> Hi,
> >> attempting to build ARM with a configuration where MEM_ACCESS=3Dn and
> >> mem_access.c is conditioned on CONFIG_MEM_ACCESS results in a fail as
> >> there are other pieces of code that call some mem_access.c functions
> >> (p2m_mem_access_check_and_get_page, p2m_mem_access_check).
> >> In a Matrix chat Julien was suggesting adding stubs for the functions
> >> for this use case.
> >
> > Perhaps just wrap the callers into #ifdef CONFIG_MEM_ACCESS blocks?
>
> In Xen, we tend prefer stubs over #ifdef-ing code blocks. I would rather
> use this approach here too.

I was looking at arch/x86/hvm/hvm.c for examples on how MEM_PAGING and
MEM_SHARING calls are handled and those were ifdef'd. I have no
preference for one vs the other, both work.

Tamas

