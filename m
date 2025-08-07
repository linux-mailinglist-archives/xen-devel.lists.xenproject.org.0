Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79744B1D447
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 10:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072624.1435631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvyP-0006BU-Ck; Thu, 07 Aug 2025 08:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072624.1435631; Thu, 07 Aug 2025 08:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujvyP-00069l-A6; Thu, 07 Aug 2025 08:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1072624;
 Thu, 07 Aug 2025 08:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ujvyN-00069f-Ix
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 08:27:39 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60b2cf19-7368-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 10:27:38 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-32f1df58f21so6895341fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 01:27:38 -0700 (PDT)
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
X-Inumbo-ID: 60b2cf19-7368-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754555258; x=1755160058; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtv+JxdkS+63tTGNkrdTuMT64L+UXlB58/fwidzlR+c=;
        b=nUN7R5vqgmMh3STNIKmGG+j6Arca135fHLNHSjXjoXSKr8kzMrP+70z7/AbNGWEpqS
         Lf36o5j4El/Rg2qLSOipFLs/6j/oGQKVPrSbbPvNSfrQecaCCMWxC2PU4J5x+QEJeT3z
         h2XmyWR3G0HkDCr4UE/I6E67MJPudD6mQl3kIacf22ZKtzCa06i2IkNkMvqmzGUynj8K
         t6KR6amSJI4qwiwpWLLbWRFiHBRVpjLN8h0skug6pQX1IPjoCNmHqTfvCe7d/j6YXTqZ
         60qmA8kml4QLOTC8uGLTi+GqdFRq9YGti15Yu9udPRPSKJm9M4W5XJjBDI2Vre8EByzO
         45aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754555258; x=1755160058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtv+JxdkS+63tTGNkrdTuMT64L+UXlB58/fwidzlR+c=;
        b=bSQudfYVgcJ/rT5+Gqpcm17sWaoq8091axgGdJiFT2HGuOSB8lC9SfmghMR8pOS17r
         e9Jhz4AnJnHNMnXjUFOmSNR2f4bLqzMS1M92dqpPFZvl/qcc1B35wPA4BCJYrT9w/tcD
         9tDvVmm9BFAkg8Hmc0vZ+qcNZZjHVYclEFw04md7f5VRKbOI8PSMn20cZyR+k42/Nj/f
         ueeWugYsiMDGeaWflOUokmvJa6RvLI4/vTJzyxxjfkQKgfKCdErp21Bwzxjlf8pR+tdy
         knNv+jrgmcbF0/2d4aYfHv/jp+fAPvnUedn3+l5yhdUjN69eGp3Xsf2S7OZcLsObCezT
         vLTw==
X-Forwarded-Encrypted: i=1; AJvYcCU9rZ6Lb23Sh+zCY9memGNfBkLiiwgbpYvFsdxrYfPjxrAd8TSjBwA8qA7fVDO6EFUZMg8njsUl6Ak=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygqfwbq+SWPnGbzhfF8iJoMrfaCZX/kVs13L1+b+Q/eHvD/9hs
	OmxlOwQU6bqns5jQlAutEYYKiW4cddWU30bJu1IH9kLV4Gpl3Qo15MVOph0o7jdV9t51GI+ex/H
	GZpeGtaH1awlY2Mcdcn2LfJ8TV1BMuLQ/zv6r
X-Gm-Gg: ASbGnctJDczC1hnjisbzXoKmRilz38hOMInQUr9AfeTz9hhaixgmVyFwGk1s00oM41O
	7//qihqhjJhON0AZXHtagcYZ7GQ0H/8VtXRKJ8ol00wKNU91wnB0acWRdgKPhtEbBqDnR8zkuxP
	zA/Jjqs1QLteQXYjunnkbd0JmQTPEFjB6+2mwVKrg/PHj0tnxKSmnRgKIOF0SKmlZthnG9U8Eoi
	lFBRw==
X-Google-Smtp-Source: AGHT+IEon4C7yWCpWG9PQrdbkv5d1Lw6wXwNZeL7n+WwjjylefKdtiGDAkhJOrJ8GJUmSuwgHghvYwCwYJzgy723prU=
X-Received: by 2002:a05:651c:20da:10b0:331:eb47:69fc with SMTP id
 38308e7fff4ca-333814148c4mr11944131fa.29.1754555257696; Thu, 07 Aug 2025
 01:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <034559c3324e137285065b12642cbf58b7ab5f58.1753727619.git.mykola_kvach@epam.com>
 <721201b5-323d-49ec-986c-f793627929dd@suse.com> <CAGeoDV-HwPb6g46GxfEeir6BRf8WbqS0qCr5UobkKwVE6oxb=g@mail.gmail.com>
In-Reply-To: <CAGeoDV-HwPb6g46GxfEeir6BRf8WbqS0qCr5UobkKwVE6oxb=g@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 7 Aug 2025 11:27:26 +0300
X-Gm-Features: Ac12FXzU3HctvGXG69_K-Sx1eBQcvnV_gcS7tgsg3zN_ZhXgdFSy_aN0emtnsak
Message-ID: <CAGeoDV8LZ_JaK2TJFMJS+U04tuFnbFAmB-UAtYJROOui=cih7g@mail.gmail.com>
Subject: Re: [PATCH] xen/domctl: add domain_lock in XEN_DOMCTL_setvcpucontext
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 8:47=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail.com=
> wrote:
>
> Hi Jan,
>
> On Tue, Jul 29, 2025 at 10:56=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >
> > On 28.07.2025 20:40, Mykola Kvach wrote:
> > > From: Mykola Kvach <mykola_kvach@epam.com>
> > >
> > > Add domain_{lock,unlock} in the XEN_DOMCTL_setvcpucontext operation
> > > for protecting arch_set_info_guest.
> > >
> > > This aligns with the locking pattern used by other operations that
> > > modify vCPU state.
> > >
> > > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> >
> > I think this requires more of a description / justification. May I in
> > particular turn your attention to this comment that we have in x86'es
> > handling of HVM_PARAM_IDENT_PT (disregard the 1st sentence for the
> > purpose here):
> >
> >         /*
> >          * Update GUEST_CR3 in each VMCS to point at identity map.
> >          * All foreign updates to guest state must synchronise on
> >          * the domctl_lock.
> >          */
> >         rc =3D -ERESTART;
> >         if ( !domctl_lock_acquire(d) )
> >             break;
> >
> > IOW in particular I'd expect you to explain why holding the domctl
> > lock isn't sufficient here, and hence what (theoretical?) race it is
> > you're concerned about. That may in turn clarify whether a Fixes: tag
> > would actually be appropriate here.
>
> For example, on ARM systems, we bring up vCPUs via PSCI. At the same time=
,
> from another domain, XEN_DOMCTL_setvcpucontext may be called. In the PSCI
> path, access is protected by domain_lock, but domain_pause alone is not
> sufficient to prevent races during modification of the vCPU context from
> XEN_DOMCTL_setvcpucontext.

Sorry, we don't need any extra locking here, because domain_pause
performs vCPU blocking synchronously. It waits until the vCPU becomes
non-runnable, and only after that the context is updated.

So this patch isn't needed.

>
> >
> > Jan
> >
> > > --- a/xen/common/domctl.c
> > > +++ b/xen/common/domctl.c
> > > @@ -392,7 +392,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_=
t) u_domctl)
> > >          if ( ret =3D=3D 0 )
> > >          {
> > >              domain_pause(d);
> > > +            domain_lock(d);
> > >              ret =3D arch_set_info_guest(v, c);
> > > +            domain_unlock(d);
> > >              domain_unpause(d);
> > >
> > >              if ( ret =3D=3D -ERESTART )
> >
>
> Best regards,
> Mykola

