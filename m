Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C015C9C0BE3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 17:42:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832106.1247504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t95aa-0002RP-JN; Thu, 07 Nov 2024 16:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832106.1247504; Thu, 07 Nov 2024 16:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t95aa-0002PY-Ei; Thu, 07 Nov 2024 16:42:32 +0000
Received: by outflank-mailman (input) for mailman id 832106;
 Thu, 07 Nov 2024 16:42:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYad=SC=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t95aZ-0002PQ-BB
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 16:42:31 +0000
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 459b8ed5-9d27-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 17:42:27 +0100 (CET)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a6ababa9f7so4702945ab.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 08:42:27 -0800 (PST)
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
X-Inumbo-ID: 459b8ed5-9d27-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1pbDEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ1OWI4ZWQ1LTlkMjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTk3NzQ3LjY5NDgzMSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1730997746; x=1731602546; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jUHihYfxwlTtP7M3pJ6fmNDh05kQeq4rq21pt+cEv4=;
        b=nw/6wQIPYzdCov0nUdLIcjmDeVUWw4H0HKcKsp38DlDQKc4j37wRvblW/MGX6xGu//
         /tEOHgfCdrJKZroe1jGFA1DIEngH0HuOfgAbf8boD6Ib32VZ79oUPLeeQmPAP/SLME79
         khJqrghDCi66OCctNHYBUpIndxFxGPGdhOfxkvQfdB8yS1O58Nm9anzU1A9nmTZUBCvx
         H1fgkYvegX5/AoRgbfJhB+rLfEDBUjde8yBMgZZ74/ASFsL67dKREP2r9oq4PYML15V9
         bE9jIfzIplUEjzc2ELJsQ34UyYH2tOLLR4ryAFSIXp9PjlX06Sn7+NgBsYVfU87qA0s6
         b9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997746; x=1731602546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jUHihYfxwlTtP7M3pJ6fmNDh05kQeq4rq21pt+cEv4=;
        b=AV00v0NMjoFp4EaofH+mrGYJaxMtH9meINt4QKkw8HNKo/29ik9N1eg8dVgZT8Htnx
         n35nUj/R08p4PU1LwR3f3iBDJ0kPYC4kC3+kRXt+IOHINRg4dUgPhNpUvWtobOy9aif3
         m3zUpY8vT69bVBjlSi9pJQQAncS3lVrc2SCxDYDSRomFURLAK8rBHvZ4GzVcqDKSIbcs
         l8sMvNkpRoCwdRcEEC8wjH47UYX50A+TR/RH8Kg/muARvLPikzjSeKMj5MQ2jXrnFuJ9
         z0m5OUF0X7ui9g0wsYKYlMJE/i7TG1pDdYVWxLgv9EBhuHK0P1flv6B3atIqYXFo16Zi
         yPAA==
X-Forwarded-Encrypted: i=1; AJvYcCWSlheoIYrzrV/BYtl+BI46c2fYF1Gv/2waSpsFD3x4d83bPIoIQSkh/Pyh35DeFS2aPDOH83i+qkc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaAqJdMmipxS/h8ajsFpFXzqqsxY6IrpbNunefvuejKmLASQ+r
	2GMBlYkkUDeWQ0y1JwE7yaUg8tr7ebHD3Rgp2m1u291wDCUmtxTxPwLGv2xZOq/fCLy40jnytbp
	9FvBs0DWyDQOiVCSMBesII/Z4XXfstpfbh6UEFg==
X-Google-Smtp-Source: AGHT+IEMchko5a31Z3/Mu0BYr+fqb4nIDgfikuh3EsrzVH7RDCtZWoT0CQsPMh3TbGedXygO9myvT3kBqgva19lLoew=
X-Received: by 2002:a05:6e02:2142:b0:3a4:e452:c42c with SMTP id
 e9e14a558f8ab-3a4ed27c5f0mr500762385ab.6.1730997746350; Thu, 07 Nov 2024
 08:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-10-carlo.nonato@minervasys.tech> <f14094fb-1312-42aa-b903-06f140c485b5@suse.com>
In-Reply-To: <f14094fb-1312-42aa-b903-06f140c485b5@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 7 Nov 2024 17:42:15 +0100
Message-ID: <CAG+AhRV=xoDiQtP4WbkUwQO+87-Anwz7dMHQbYYdMfence3arA@mail.gmail.com>
Subject: Re: [PATCH v9 09/13] xen: add cache coloring allocator for domains
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Marco Solieri <marco.solieri@minervasys.tech>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan

On Tue, Nov 5, 2024 at 5:11=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 25.10.2024 11:50, Carlo Nonato wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -270,6 +270,20 @@ and not running softirqs. Reduce this if softirqs =
are not being run frequently
> >  enough. Setting this to a high value may cause boot failure, particula=
rly if
> >  the NMI watchdog is also enabled.
> >
> > +### buddy-alloc-size (arm64)
> > +> `=3D <size>`
> > +
> > +> Default: `64M`
> > +
> > +Amount of memory reserved for the buddy allocator when colored allocat=
or is
> > +active. This options is available only when LLC coloring support is en=
abled.
> > +The colored allocator is meant as an alternative to the buddy allocato=
r,
> > +because its allocation policy is by definition incompatible with the g=
eneric
> > +one. Since the Xen heap systems is not colored yet, we need to support=
 the
> > +coexistence of the two allocators for now. This parameter, which is op=
tional
> > +and for expert only, it's used to set the amount of memory reserved to=
 the
> > +buddy allocator.
>
> Like for the options in patch 1, here I think you also want to make expli=
cit
> the dependency on CONFIG_LLC_COLORING.

Yep.

> > @@ -1945,6 +1960,155 @@ static unsigned long avail_heap_pages(
> >      return free_pages;
> >  }
> >
> > +/*************************
> > + * COLORED SIDE-ALLOCATOR
> > + *
> > + * Pages are grouped by LLC color in lists which are globally referred=
 to as the
> > + * color heap. Lists are populated in end_boot_allocator().
> > + * After initialization there will be N lists where N is the number of
> > + * available colors on the platform.
> > + */
> > +static struct page_list_head *__ro_after_init _color_heap;
> > +#define color_heap(color) (&_color_heap[color])
> > +
> > +static unsigned long *__ro_after_init free_colored_pages;
> > +
> > +static unsigned long __initdata buddy_alloc_size =3D
> > +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
> > +size_param("buddy-alloc-size", buddy_alloc_size);
> > +
> > +/* Memory required for buddy allocator to work with colored one */
> > +#ifdef CONFIG_LLC_COLORING
> > +#define domain_num_llc_colors(d) (d)->num_llc_colors
> > +#define domain_llc_color(d, i)   (d)->llc_colors[i]
>
> I'm uncertain whether Misra would insist on an outer pair of parentheses =
for
> both of these.

Yes, rule 20.7.

> Jan

- Carlo

