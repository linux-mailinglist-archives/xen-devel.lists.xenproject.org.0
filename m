Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E38C01A1
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 18:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718864.1121394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4jkG-0000it-Tq; Wed, 08 May 2024 16:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718864.1121394; Wed, 08 May 2024 16:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4jkG-0000hI-R5; Wed, 08 May 2024 16:02:16 +0000
Received: by outflank-mailman (input) for mailman id 718864;
 Wed, 08 May 2024 16:02:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+6iU=ML=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s4jkE-0000hC-NZ
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 16:02:14 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53fb880a-0d54-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 18:02:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715184127647979.96624377197;
 Wed, 8 May 2024 09:02:07 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-debaa161ae3so2150549276.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 09:02:07 -0700 (PDT)
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
X-Inumbo-ID: 53fb880a-0d54-11ef-909c-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1715184129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GGMICaZCndvaw4O66Vn7q/JTkjmsbDi27MxVeQWigqOMxp5+kXoQjnyyxnFUuzDWhVO4c21QPkDVd6OdXfOOSQv4EMvqul4/1rSxqBwNMouMxSZPBbVgyQxsNrTtdeDZAjCBjRuwX/8CgNPm8fiI22fJrDbuRoUlAud2b5/8G+w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715184129; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kdhTNtSLBgIcMB2+gf3nZE9Jc2bVl6O30it28R56h+I=; 
	b=Z6bYzMaV3KR6Km7gCg7bc4+HGm1xz9YVrovKoP3+J3rbh2gKIDMGy6dmmnJ0DZNXJN3UYHJ6gs9dOY452xRKsi/D3J8NvreB6ZPE7pjMNGXL4U8FGMpmOqgkZwNuwzZIvuZ+K2LS5uNcAMeMYgIR/D0uIqSnA6XpAkyEJzpPGBw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715184129;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kdhTNtSLBgIcMB2+gf3nZE9Jc2bVl6O30it28R56h+I=;
	b=TMaFu/T6rai3Kee4Qp3pF8lBl1RTKzadTw4sfta/eITbLiHoq3AjebdY896vSfZI
	2tD+TbDcN21e5ZFu34QOc2L+xixGnJ2bznayEJzIpLsUFREjUrBSyfT4HixSSgt/fb4
	Nx4cu7YebLoTl6ivd0NPbFWz3JQAfx+R+IaDPzv4=
X-Forwarded-Encrypted: i=1; AJvYcCX9PdzMhy4vAQrXawlBmCpOoP9D80W0AL7La0J6d0C0oqK5YwxlJs+4zyBtxJoi8R3QluCtf/3nYN6/h/8AIIh+kwUXj01iV80CDZ3PYCg=
X-Gm-Message-State: AOJu0YyIqgrLnj8mVEK8S1+4rdAdFSU9LW/BbNrD6eTZwi4/hcQnwF+8
	aOhzAl2/9Iq1PcStLYNIKl4jHHernrmUPsZSijbmSECAmNymUOwoKxd23UTqQZRdtljfWxMnnGS
	JsHMddMz1tE1aPb2Tl1LcdpCUEJg=
X-Google-Smtp-Source: AGHT+IF400K5awnmZh4PIQySVMEDEdn4BxZjvGUiTVh9+B7aEtMXBHrT/6RAVn5Xayjh7BIG0/tIxeT1NoDQ6F0lbOU=
X-Received: by 2002:a25:9786:0:b0:de5:53f3:7218 with SMTP id
 3f1490d57ef6-debb9d48616mr3752430276.38.1715184126603; Wed, 08 May 2024
 09:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <a3d4e07433932624266ac9b675daf0b70734696d.1714405386.git.alessandro.zucchelli@bugseng.com>
 <08eb5444-2bf0-48c0-9fcb-d8e4b801e8fa@suse.com> <834460aca34e6167a3c4620616c145b8@bugseng.com>
 <47033435-c621-40f6-b5a9-a385f323f382@xen.org> <5b84019c4e0111b3cc5e369b999fbfab@bugseng.com>
In-Reply-To: <5b84019c4e0111b3cc5e369b999fbfab@bugseng.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 8 May 2024 12:01:27 -0400
X-Gmail-Original-Message-ID: <CABfawhkKAKAYhTrbRNyJcOaf=rQChy9eM=aVYQM9xv1ScO-UNg@mail.gmail.com>
Message-ID: <CABfawhkKAKAYhTrbRNyJcOaf=rQChy9eM=aVYQM9xv1ScO-UNg@mail.gmail.com>
Subject: Re: [XEN PATCH] xen/mem_access: address violations of MISRA C: 2012
 Rule 8.4
To: alessandro.zucchelli@bugseng.com
Cc: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
	bertrand.marquis@arm.com, michal.orzel@amd.com, volodymyr_babchuk@epam.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 10:02=E2=80=AFAM Alessandro Zucchelli
<alessandro.zucchelli@bugseng.com> wrote:
>
> On 2024-05-03 11:32, Julien Grall wrote:
> > Hi,
> >
> > On 03/05/2024 08:09, Alessandro Zucchelli wrote:
> >> On 2024-04-29 17:58, Jan Beulich wrote:
> >>> On 29.04.2024 17:45, Alessandro Zucchelli wrote:
> >>>> Change #ifdef CONFIG_MEM_ACCESS by OR-ing defined(CONFIG_ARM),
> >>>> allowing asm/mem_access.h to be included in all ARM build
> >>>> configurations.
> >>>> This is to address the violation of MISRA C: 2012 Rule 8.4 which
> >>>> states:
> >>>> "A compatible declaration shall be visible when an object or
> >>>> function
> >>>> with external linkage is defined". Functions p2m_mem_access_check
> >>>> and p2m_mem_access_check_and_get_page when CONFIG_MEM_ACCESS is not
> >>>> defined in ARM builds don't have visible declarations in the file
> >>>> containing their definitions.
> >>>>
> >>>> Signed-off-by: Alessandro Zucchelli
> >>>> <alessandro.zucchelli@bugseng.com>
> >>>> ---
> >>>>  xen/include/xen/mem_access.h | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/include/xen/mem_access.h
> >>>> b/xen/include/xen/mem_access.h
> >>>> index 87d93b31f6..ec0630677d 100644
> >>>> --- a/xen/include/xen/mem_access.h
> >>>> +++ b/xen/include/xen/mem_access.h
> >>>> @@ -33,7 +33,7 @@
> >>>>   */
> >>>>  struct vm_event_st;
> >>>>
> >>>> -#ifdef CONFIG_MEM_ACCESS
> >>>> +#if defined(CONFIG_MEM_ACCESS) || defined(CONFIG_ARM)
> >>>>  #include <asm/mem_access.h>
> >>>>  #endif
> >>>
> >>> This doesn't look quite right. If Arm supports mem-access, why would
> >>> it
> >>> not set MEM_ACCESS=3Dy? Whereas if it's only stubs that Arm supplies,
> >>> then
> >>> those would better move here, thus eliminating the need for a
> >>> per-arch
> >>> stub header (see what was e.g. done for numa.h). This way RISC-V and
> >>> PPC
> >>> (and whatever is to come) would then be taken care of as well.
> >>>
> >> ARM does support mem-access, so I don't think this is akin to the
> >> changes done to handle numa.h.
> >> ARM also allows users to set MEM_ACCESS=3Dn (e.g.
> >> xen/arch/arm/configs/tiny64_defconfig) and builds just fine; however,
> >> the implementation file mem_access.c is compiled unconditionally in
> >> ARM's makefile, hence why the violation was spotted.
> >> This is a bit unusual, so I was also hoping to get some feedback from
> >> mem-access maintainers as to why this discrepancy from x86 exists. I
> >> probably should have also included some ARM maintainers as well, so
> >> I'm going to loop them in now.
> >>
> >> An alternative option I think is to make the compilation of arm's
> >> mem_access.c conditional on CONFIG_MEM_ACCESS (as for x86/mm and
> >> common).
> >
> > I can't think of a reason to have mem_access.c unconditional compiled
> > in. So I think it should be conditional like on x86.
>
> Hi,
> attempting to build ARM with a configuration where MEM_ACCESS=3Dn and
> mem_access.c is conditioned on CONFIG_MEM_ACCESS results in a fail as
> there are other pieces of code that call some mem_access.c functions
> (p2m_mem_access_check_and_get_page, p2m_mem_access_check).
> In a Matrix chat Julien was suggesting adding stubs for the functions
> for this use case.

Perhaps just wrap the callers into #ifdef CONFIG_MEM_ACCESS blocks?

Tamas

