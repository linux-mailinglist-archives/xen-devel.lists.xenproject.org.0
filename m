Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBE873CF7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 18:10:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689410.1074345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhumD-0005de-Qq; Wed, 06 Mar 2024 17:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689410.1074345; Wed, 06 Mar 2024 17:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhumD-0005bu-N2; Wed, 06 Mar 2024 17:09:57 +0000
Received: by outflank-mailman (input) for mailman id 689410;
 Wed, 06 Mar 2024 17:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bciF=KM=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rhumC-0005bm-L8
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 17:09:56 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5994fac7-dbdc-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 18:09:54 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-29b73427790so784464a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 09:09:54 -0800 (PST)
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
X-Inumbo-ID: 5994fac7-dbdc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709744993; x=1710349793; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0U80Crry40Slv1QE3y4yJdbKCWDS4Dp/mIdju7FW9SY=;
        b=ip2KPp+6g4ihG90CNErqJ6YYnObk3y6aeay+kMb75dowhA42/iX/AudSVLyG1k1Fbs
         Ya730tk/IIEVCsdg35qG6Xuh7I7JtmCw74rFUL6Bm6m0+maWdkoeFZ8BgJdEnKMvgZ4B
         4q2X+AUaZYHh1dvtdMFud/ms9DrVj5xU+1txw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744993; x=1710349793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0U80Crry40Slv1QE3y4yJdbKCWDS4Dp/mIdju7FW9SY=;
        b=hzqLDbz1N9KpLymeoXMEEkO46tazwMWtbdJ5Ydm7GrK2ocV1i9KKjNScJ2bL0fFy/m
         5/6S+F8gVpCuTDWCXuM8wDyGJCpuUBuMGyNcH/J/Gg/DLNfSb1T0zRx4PxGaeOc4hZri
         gThhaneDnz/iozROuPhDbGSyP4aDpPjL2Jb0CQAjCocsANSJoDkA2Z8nIHcVZqn+jfyK
         /WKrukax73PGAFCAQripKi9hIwdbygO0qTCOi5cqaYro6NmbEUS815E1UHovotjAzPcJ
         62Nv8hlE9ppTS/Z0ETKOUqVBrEh/Ht3aT0w8prgiyEKbiBgYqwuq7GlEpiGfjfy02nzu
         mauA==
X-Forwarded-Encrypted: i=1; AJvYcCWoZOKp+UOURj4s0AEhgArZe7rrer0z5J3ULCdq0vJ1dZ/utLoW6pUdZMXWq/ItGvX2se0j/RjjZN8ExW0SDgxI8wJmJAavsTnc4wGwbSg=
X-Gm-Message-State: AOJu0YzUtoOti+Nt4PMmEO7Q4cBnKgC09IA9ll8xMAY1PAEZSM9veHZN
	6FYHRMPB+J4lIsK8aUDicLYuU41Fp0B1X863f1ZRlYfo9Rp3L/r/v//FJth1URiHpteWevTxy8i
	gknUExL1RMZSe+AYKRXAM0TRbDqbg9Jfi+7L1
X-Google-Smtp-Source: AGHT+IEkmpN7bv6DxA5SoOjFMDhoe9ugxZa6H1WJwPAUjdogQ4dceczaGLsE4BTAgctP6pwbPb8paqPW/U/Bs6BjYGg=
X-Received: by 2002:a17:90b:17c9:b0:29b:6c0b:9c34 with SMTP id
 me9-20020a17090b17c900b0029b6c0b9c34mr3955463pjb.19.1709744993060; Wed, 06
 Mar 2024 09:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-3-andrew.cooper3@citrix.com> <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
In-Reply-To: <87b82706-f538-4807-abaf-1e59cebd286b@suse.com>
From: Ross Lagerwall <ross.lagerwall@cloud.com>
Date: Wed, 6 Mar 2024 17:09:40 +0000
Message-ID: <CAG7k0EqWrPU0qocSJHyJAQca44LakQwZwAbiv5GRk-sQeaAYAg@mail.gmail.com>
Subject: Re: [PATCH 2/3] xen/virtual-region: Include rodata pointers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 2:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.03.2024 13:11, Andrew Cooper wrote:
> > --- a/xen/include/xen/virtual_region.h
> > +++ b/xen/include/xen/virtual_region.h
> > @@ -16,6 +16,9 @@ struct virtual_region
> >      const void *text_start;                /* .text virtual address st=
art. */
> >      const void *text_end;                  /* .text virtual address en=
d. */
> >
> > +    const void *rodata_start;              /* .rodata virtual address =
start (optional). */
> > +    const void *rodata_end;                /* .rodata virtual address =
end. */
> > +
> >      /* If this is NULL the default lookup mechanism is used. */
> >      symbols_lookup_t *symbols_lookup;
>
> While perhaps the least bad one can do without quite a bit more churn,
> I'm still irritated by a virtual region (singular) suddenly covering
> two ranges of VA space. At the very least I think the description should
> say a word of justification in this regard. An alternative, after all,
> could have been for livepatch code to register separate regions for
> rodata (if present in a patch).
>
> A follow-on question then would be why ordinary data isn't reflected in
> a virtual region. Aiui that's just because livepatch presently has no
> need for it.
>
> Underlying question to both: Is the virtual region concept indeed meant
> to be fully tied to livepatch and its needs?
>

Virtual regions were introduced for live patching but I don't think it
is completely tied to live patching. It was introduced so that any code
can participate in symbol lookup, bug frame and exception table entry
search, rather than special casing "if livepatch" in many places.

I agree that the virtual region concept is being abused here - it's just
being used as a convenient place to store rodata start/end and doesn't
really have much to do with the text start & end / bug frame / exception
table entry search that the virtual region is intended for.

Maybe Andrew can explain why he used this approach?

Ross

