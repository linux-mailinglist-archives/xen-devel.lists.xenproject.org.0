Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E18B9A5E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 14:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715772.1117664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2V6G-0004cC-AP; Thu, 02 May 2024 11:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715772.1117664; Thu, 02 May 2024 11:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2V6G-0004ZW-7D; Thu, 02 May 2024 11:59:44 +0000
Received: by outflank-mailman (input) for mailman id 715772;
 Thu, 02 May 2024 11:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qixW=MF=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1s2V6E-0004ZQ-TW
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 11:59:42 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73f8ca10-087b-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 13:59:40 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-23bd61fbd64so3197636fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 04:59:40 -0700 (PDT)
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
X-Inumbo-ID: 73f8ca10-087b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714651179; x=1715255979; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMoVTKWH18dJjINgtv7qyuGCrDSDOV+xIvp7psoPk/M=;
        b=bXcMUQK0NYIRDwJhCVgNnL21dHVgin89oKHKIH+/i6BKgaVix5BnfLvycBaxr3kMyq
         h9j8uAfanvJEpUdDn24kxeuwANTmOneuF4F/gCBpV5PmKWgcfbLLtgrLh3oX4bxMIc3P
         zBLrp4bCL6ZOEXbnlgfC0KMY8X1w5+ai7dKHw10nDWQO9oHJ/ZocoIITaAwMsIYocbRe
         ZFHQ8T9HNjXPv02wkf8vB7K69LvhsiZJU1aUXvm2CBdUEAV3j0CfLYJee1zPhrzHJ3hO
         EHvm1C0oniWHZvuzU6luo0OMsvf4BTUPDLmuinQihT6gcEY02AcgKvtrIJUEwKKke1yQ
         6OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714651179; x=1715255979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMoVTKWH18dJjINgtv7qyuGCrDSDOV+xIvp7psoPk/M=;
        b=CGLa89WnCTmWX191j6r9Rd52ZnAG2gEG+jKKqylkbH7zygQaMZwE3XnRN0Cns2xdkt
         FNrHtFg2E+b+NklLac1pEI8Z9DytRsoHGjYta4QkAZr19RY/s2lLRa6VowdcaXcFgsuQ
         7c2wWqusSdqPRCPa9EH06zC1aCkU55MN3sZbnsxlVqKWa8hePX7ESaapSi14Viv+Am/N
         Yldlp46Hv/QFcKbNL0WJvs7nXWHAAV2EPkDP2NOwTgm40SXSMtfPFWIcFm47a+J1QWZp
         uM2+74GvFHvaHCXBfRTpoVUkDf/OL41J4xM5TR+NRE76JzInsngg7UkP5/bD0d7BxfQq
         DToA==
X-Forwarded-Encrypted: i=1; AJvYcCUPp3ioBHpeEwVK94mt6skojAhESdupBvAbzp5E5l1alDGU9Xz1+ndmSdq2ivdZ1wpJeAFEMMc/GjGVxLqhIU6mpxU97DpFmBfoqwg8Ckk=
X-Gm-Message-State: AOJu0Ywwi5vEwAa7f1idEQY/Q+7JHZ11W06Dzphcg5f02LKEbYuZJYgU
	1+Um13zNAYiK5aaFb21UyWjXV7vz02uVReKjCpcfaUvjz5S5qQFZ7H7HgtLMmgL9F2MworBAHWt
	zBIZTMCPchKQOXjRoUtQwTXVtp18=
X-Google-Smtp-Source: AGHT+IEApEEvdHkGGz9ZaVXTp5QFSiyTY0QNOtZLM3nF8eKmcjdaUQ7iaLRv0kjVTgUn2cP9x+YIMZ7b/mdpPPQ9erM=
X-Received: by 2002:a05:6870:c0ce:b0:239:7008:b751 with SMTP id
 e14-20020a056870c0ce00b002397008b751mr6025496oad.34.1714651178792; Thu, 02
 May 2024 04:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714322424.git.w1benny@gmail.com> <a26bc4aeba89f7895c79df7e320adfc695b16d50.1714322424.git.w1benny@gmail.com>
 <4d9930d4-4379-4440-83b2-14ebffc7c03d@suse.com> <CAKBKdXgAgb=+Spr_nobWy_zuN-yXTUfAL+Q3MdLDCDVgshOS7Q@mail.gmail.com>
 <115a6513-559c-44d9-a828-10d1e4e5c401@suse.com>
In-Reply-To: <115a6513-559c-44d9-a828-10d1e4e5c401@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 2 May 2024 13:59:27 +0200
Message-ID: <CAKBKdXhE9hKiYZ=Kz34somE0U1HmoRCXpTREzMBEyiUTS4eNjg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] x86/hap: Increase the number of initial
 mempool_size to 1024 pages
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 8:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 30.04.2024 17:40, Petr Bene=C5=A1 wrote:
> > On Tue, Apr 30, 2024 at 4:47=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 28.04.2024 18:52, Petr Bene=C5=A1 wrote:
> >>> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >>>
> >>> This change anticipates scenarios where `max_altp2m` is set to its ma=
ximum
> >>> supported value (i.e., 512), ensuring sufficient memory is allocated =
upfront
> >>> to accommodate all altp2m tables without initialization failure.
> >>
> >> And guests with fewer or even no altp2m-s still need the same bump? Yo=
u
> >> know the number of altp2m-s upon domain creation, so why bump by any m=
ore
> >> than what's strictly needed for that?
> >
> > I have to admit I've considered computing the value which goes to
> > hap_set_allocation
> > by simply adding 256 + max_altp2m, but that felt so arbitrary - the
> > 256 value itself
> > feels arbitrary, as I haven't found any reasoning for it anywhere.
> >
> > I have also tried to make code changes to make the initial allocation
> > size configurable
> > via libxl (possibly reusing the shadow_memkb) - which seemed to me
> > like the "correct"
> > solution, but those changes were more complicated than I had
> > anticipated and I would
> > definitely not make it till the 4.19 deadline.
> >
> > Question is, what to do now? Should I change it to 256 + max_altp2m?
>
> Counter question: Is accounting for just the root page table really
> enough? Meaning to say: I'm not convinced that minimum would really
> be appropriate for altp2m use even before your changes. You growing
> the number of root page tables _always_ required just makes things
> worse even without considering how (many) altp2m-s are then going
> to be used. Such an issue, if I'm right with this, would imo want
> addressing up front, in a separate patch.

It is enough - at least based on my experiments. I'll try to explain it bel=
ow.

> >> Also isn't there at least one more place where the tool stack (libxl I
> >> think) would need changing, where Dom0 ballooning needs are calculated=
?
> >> And/or doesn't the pool size have a default calculation in the tool
> >> stack, too?
> >
> > I have found places in libxl where the mempool_size is calculated, but
> > that mempool
> > size is then set AFTER the domain is created via xc_set_paging_mempool_=
size.
> >
> > In my opinion it doesn't necessarily require change, since it's
> > expected by the user
> > to manually set it via shadow_memkb. The only current problem is (which=
 this
> > commit is trying to fix) that setting shadow_memkb doesn't help when
> > max_altp2m > (256 - 1 + vcpus + MAX_NESTEDP2M), since the initial mempo=
ol
> > size is hardcoded.
>
> Wait - are you saying the guest config value isn't respected in certain
> cases? That would be another thing wanting to be fixed separately, up
> front.

The xc_set_paging_mempool_size is still called within domain_create.
So the value of shadow_memkb is respected before any of the guest code
is run. My point was that shadow_memkb isn't respected here:

>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -468,7 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
>>>      if ( old_pages =3D=3D 0 )
>>>      {
>>>          paging_lock(d);
>>> -        rv =3D hap_set_allocation(d, 256, NULL);
>>> +        rv =3D hap_set_allocation(d, 1024, NULL);

This code (+ the root altp2ms allocation) is executed before the libxl
sends the shadow_memkb.

In another words, the sequence is following:

libxl:
------

do_domain_create
    initiate_domain_create
        libxl__domain_make
            xc_domain_create // MAX_ALTP2M is passed here
                             // and hap_enable is called

        dcs->bl.callback =3D domcreate_bootloader_done

domcreate_bootloader_done
    libxl__domain_build
        libxl__build_pre
            libxl__arch_domain_create
                libxl__domain_set_paging_mempool_size
                    xc_set_paging_mempool_size(shadow_mem)

xen (xc_domain_create cont.):
-----------------------------
domain_create
    arch_domain_create
        hvm_domain_initialise
            paging_enable
                hap_enable
                    // note that we shadow_mem (from config) hasn't been
                    // provided yet
                    hap_set_allocation(d, 1024, NULL);
                    p2m_alloc_table(p2m_get_hostp2m(d));
                    p2m_alloc_table(d->arch.nested_p2m[i..MAX_NESTEDP2M]);
                    p2m_alloc_table(d->arch.altp2m_p2m[i..MAX_ALTP2M]);

(I hope the email will preserve the spacing...)

Based on this, I would argue that shadow_memkb should be also part of
xc_domain_create/xen_domctl_createdomain. Which is why I've said in
previous email:

> > I have also tried to make code changes to make the initial allocation
> > size configurable
> > via libxl (possibly reusing the shadow_memkb) - which seemed to me
> > like the "correct"
> > solution, but those changes were more complicated than I had
> > anticipated and I would
> > definitely not make it till the 4.19 deadline.

P.

