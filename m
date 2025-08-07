Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9F7B1D224
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 07:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072519.1435571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujtU1-0007KQ-4Z; Thu, 07 Aug 2025 05:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072519.1435571; Thu, 07 Aug 2025 05:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujtU1-0007IO-1L; Thu, 07 Aug 2025 05:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1072519;
 Thu, 07 Aug 2025 05:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ujtTz-0007II-QK
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 05:48:07 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17850cbb-7352-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 07:48:06 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55b9375d703so614555e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 22:48:06 -0700 (PDT)
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
X-Inumbo-ID: 17850cbb-7352-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754545686; x=1755150486; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVXdFZfmuDZra32MRu+hPHN7NlwP4wjBrcHgFKdsv2Y=;
        b=iFV9SMiTet9u+cxQ+T4kQXhaEBkJ0ZwovXxGJ3qEcy/9Z37Dx+eB8hpuam+SgI3u2X
         zw08ME80jTyxDqx6APB951GDgKBSODhHDzLa6X90HOxm7wnAZ/RJqVHGIXRAXB+acPoD
         G0P0Gc5zRERupYXYGZj9NRgsAIyI70o+iMfLWggAnzXKoyfFYwj68EUwqHNwogRPfxeq
         Fvdf17v0O2ifuTrn9oOGQK/znzdf5T7aG5updh8+gL/4lKso5W2gS7Hx5ODDiucwCd6B
         lBxBCjeX2WSGaXR9HRAAy9sLMpO75vCbDitgsjUsc63I4Xb6c/mjeKDIL01qzC/s+YHL
         OQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754545686; x=1755150486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVXdFZfmuDZra32MRu+hPHN7NlwP4wjBrcHgFKdsv2Y=;
        b=LBlSdGEfmB7NzPcKBd+GvOKhRl3jg1zmX3OiK0HiTl3L0HGr4JWbU/ZZ31YYYkDqEy
         MMI5V5A+Bd1Xb600M/juF4//iKY0shRyPQmUcYgSPA62oWgwbaacPs+yLk83tSkTkMz7
         hHQj7t4OY7HS0bFee1sHljk/KIVFeWKf4Kna1PsKdtVRTwXmCMUxFU6uLsjq6J8JTmn+
         WJscg+wEvjMO8guce3LkpLy1DiYxEFFk1EnAULCie27EE5sxrkUzu9B9wEVy2nkwNgT8
         h8kNJsO7vbKvnwaRKwiZN6dsHfVkZunOTPAfdtbSExU1j27Iq+HjeZ7KNAPOl2izvNuV
         dJFA==
X-Forwarded-Encrypted: i=1; AJvYcCVIpGxmSwJHgz2IPpIPN3G9Pc0G7u+gvKeHBRvwTxrqUmvhWIeEWVWBXMKkHAJYUMaIMT5HdZTzq/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyflFe2J7BThejKgxs7yegyai4UX0kySnHk07p9MSRZ9ZOzjWt+
	5PZ1JC9XdNm3p9cdlZRcUASvwq+e10GcV0nkHLZwN3rfSJRdW0puomPOMO83GaRP17sYlgSY8DG
	wVG1jgeY2Ea5arSORKWBiaXqDk9liSm4=
X-Gm-Gg: ASbGncsxGWHgFO6TaWcfW0/o1ttR/REiP6LdAmie5l5vbhdZMxhg5EwgyuT01j2lWDW
	SIMJzSN55dJi4GIJeuPi+oyNVq0xLOhGcbzLC7JoCDFjHnPJVjuRGa3nnUMelo49oXyS7cQlZBQ
	uaM1188TOwd0PPDMBKN9tj2ZXNdNWWecUMh+ceaLQgXHIzULy+GH6DcheZRgYdl6KlCSt/aGXuQ
	zckFQ==
X-Google-Smtp-Source: AGHT+IEEcc2hckKDlNMTNFuBeqHpzZqO6mQJ1A4hozFgt5WnOaNGBu05ro1jV/R9rkqMghYQ2JbEO9tixri5D2aTI5E=
X-Received: by 2002:a05:6512:ac1:b0:553:2dce:3aad with SMTP id
 2adb3069b0e04-55caf35e419mr1798108e87.7.1754545685899; Wed, 06 Aug 2025
 22:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <034559c3324e137285065b12642cbf58b7ab5f58.1753727619.git.mykola_kvach@epam.com>
 <721201b5-323d-49ec-986c-f793627929dd@suse.com>
In-Reply-To: <721201b5-323d-49ec-986c-f793627929dd@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 7 Aug 2025 08:47:54 +0300
X-Gm-Features: Ac12FXyazATQ4rI2iETV3-AZbj97-fA10EX_nX8Wvf6cVl6UWLj6oqzKHrBwBRw
Message-ID: <CAGeoDV-HwPb6g46GxfEeir6BRf8WbqS0qCr5UobkKwVE6oxb=g@mail.gmail.com>
Subject: Re: [PATCH] xen/domctl: add domain_lock in XEN_DOMCTL_setvcpucontext
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Tue, Jul 29, 2025 at 10:56=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 28.07.2025 20:40, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Add domain_{lock,unlock} in the XEN_DOMCTL_setvcpucontext operation
> > for protecting arch_set_info_guest.
> >
> > This aligns with the locking pattern used by other operations that
> > modify vCPU state.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> I think this requires more of a description / justification. May I in
> particular turn your attention to this comment that we have in x86'es
> handling of HVM_PARAM_IDENT_PT (disregard the 1st sentence for the
> purpose here):
>
>         /*
>          * Update GUEST_CR3 in each VMCS to point at identity map.
>          * All foreign updates to guest state must synchronise on
>          * the domctl_lock.
>          */
>         rc =3D -ERESTART;
>         if ( !domctl_lock_acquire(d) )
>             break;
>
> IOW in particular I'd expect you to explain why holding the domctl
> lock isn't sufficient here, and hence what (theoretical?) race it is
> you're concerned about. That may in turn clarify whether a Fixes: tag
> would actually be appropriate here.

For example, on ARM systems, we bring up vCPUs via PSCI. At the same time,
from another domain, XEN_DOMCTL_setvcpucontext may be called. In the PSCI
path, access is protected by domain_lock, but domain_pause alone is not
sufficient to prevent races during modification of the vCPU context from
XEN_DOMCTL_setvcpucontext.

>
> Jan
>
> > --- a/xen/common/domctl.c
> > +++ b/xen/common/domctl.c
> > @@ -392,7 +392,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t)=
 u_domctl)
> >          if ( ret =3D=3D 0 )
> >          {
> >              domain_pause(d);
> > +            domain_lock(d);
> >              ret =3D arch_set_info_guest(v, c);
> > +            domain_unlock(d);
> >              domain_unpause(d);
> >
> >              if ( ret =3D=3D -ERESTART )
>

Best regards,
Mykola

