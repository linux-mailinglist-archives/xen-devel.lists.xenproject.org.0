Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1E84B421
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 13:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676858.1053171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXK8S-0006aD-Hq; Tue, 06 Feb 2024 12:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676858.1053171; Tue, 06 Feb 2024 12:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXK8S-0006Xu-FF; Tue, 06 Feb 2024 12:01:08 +0000
Received: by outflank-mailman (input) for mailman id 676858;
 Tue, 06 Feb 2024 12:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JoWx=JP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rXK8R-0006Xo-Nm
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 12:01:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67da6379-c4e7-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 13:01:06 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56025fcaebaso3369221a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 04:01:06 -0800 (PST)
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
X-Inumbo-ID: 67da6379-c4e7-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1707220865; x=1707825665; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pHEquF62EFhSDTVVJ/5iuMaY7D/+BBlsEZFu8/1icw=;
        b=3dUjN5+z4Dd1DgWs5QKjiL/8ZnDYPUxqrs2MdO4W5dhp3GNw6mrtzJDk3UKTwL8y2n
         AKvFMYImwUN0aaSB1RT3PZJcqLvxiSvSgTA5pYlPAo0qHhyQk7UpDNscEh28B4CF+V5W
         +zgkBaIPYUVDNckgsqvGjaIw83nc1POx2Rgy7MB2k/89bF0bhIxMVIyX6FBted6b8vXv
         0CAHEwM1dOGYjB2RxS+B7erz+OCyFUIKkksXx1IN2fHM0ln+cEKX6J7BI/khuD2Vpxxb
         z8jYEeeq7TUt4xJ3IXx1J+ZcGaFxMgggocRCpmajZ0o+hwpLibht8UDIDk7OS5uAfLLr
         fFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220865; x=1707825665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pHEquF62EFhSDTVVJ/5iuMaY7D/+BBlsEZFu8/1icw=;
        b=LNR2iecyet7EgLkWCSI624JYSW1y/A0CInXL9mss82LiWKy3zIH8OCdU/m4HIUals3
         KL5jziCaKFwcv6Lnzukas2Gh/JhH0P+PnaD1rwjVamI4zBmhB6WMphLFjNquc0NnisQH
         jJuVpJEc9QuVXugaeO7G7v5mvfuu7sbQosLcW4r8u9W77sBORmVN6q44ScE44hckwG/D
         sB/csQ5mfDwkJ/mYbswkouqVTRXvwYEJkitclNkxVksr9lRenyUiMXgqwN5eLTdnhVoG
         u+vFVnwEmRtN3QhtwCmjYoe1d3Vzdb+qSh/3NJkU4eD5x/+SCW+ZrGopTMGoyvIwcYEj
         zZSg==
X-Gm-Message-State: AOJu0YxZJG1ljw5AYF3zCIJKKmSR6xMI7U10/yzo7GWX4FDy9ufzmzRK
	EOv7Eaipch8EC+F6THrNeE+5HbPc7lLDRC9qJRxj+N3skwSA1n6JQYF7186JbJ+FnB8+OM3pZpg
	Be9n/f2cIY7ZX8JOHn2aSPMqlYbbaE9Z/OGXMtOi2qzz+tYJtjz7dfQ==
X-Google-Smtp-Source: AGHT+IFoPtx73AYtcrcJ+xwtDoyPIevOlSV3JZNIHMLTbaB6Am0yKpHJ2X/GcHhqGl5Tc69EHOi0qEfBMQvRpbei4v0=
X-Received: by 2002:a05:6402:1203:b0:560:64f4:cbd5 with SMTP id
 c3-20020a056402120300b0056064f4cbd5mr1521208edw.21.1707220865041; Tue, 06 Feb
 2024 04:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-6-carlo.nonato@minervasys.tech> <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
 <CAG+AhRX82h40t53LB2h91A6N0fCVafyaCGQn7Pwmn6GZ+RM+mQ@mail.gmail.com> <baec35bd-fb96-41de-b3de-2158b53ad08a@suse.com>
In-Reply-To: <baec35bd-fb96-41de-b3de-2158b53ad08a@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 6 Feb 2024 13:00:54 +0100
Message-ID: <CAG+AhRVFTBnAbmRQXN6FNdRd3_=P1FxNxmvL7-0xy0n5m37B0A@mail.gmail.com>
Subject: Re: [PATCH v6 05/15] xen: extend domctl interface for cache coloring
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 12:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.02.2024 12:46, Carlo Nonato wrote:
> > On Thu, Feb 1, 2024 at 2:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 29.01.2024 18:18, Carlo Nonato wrote:
> >>> @@ -229,6 +230,30 @@ int __init dom0_set_llc_colors(struct domain *d)
> >>>      return domain_check_colors(d);
> >>>  }
> >>>
> >>> +int domain_set_llc_colors_domctl(struct domain *d,
> >>> +                                 const struct xen_domctl_set_llc_col=
ors *config)
> >>
> >> What purpose has the "domctl" in the function name?
> >>
> >>> +{
> >>> +    unsigned int *colors;
> >>> +
> >>> +    if ( d->num_llc_colors )
> >>> +        return -EEXIST;
> >>> +
> >>> +    if ( !config->num_llc_colors )
> >>> +        return domain_set_default_colors(d);
> >>> +
> >>> +    colors =3D alloc_colors(config->num_llc_colors);
> >>> +    if ( !colors )
> >>> +        return -ENOMEM;
> >>
> >> Hmm, I see here you call the function without first having bounds chec=
ked
> >> the input. But in case of too big a value, -ENOMEM is inappropriate, s=
o
> >> such a check wants adding up front anyway.
> >>
> >>> +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc=
_colors) )
> >>> +        return -EFAULT;
> >>
> >> There again wants to be a check that the pointed to values are the sam=
e,
> >> or at least of the same size. Else you'd need to do element-wise copy.
> >
> > Sorry to bring this back again, but I've just noticed copy_from_guest()
> > already checks for type compatibility. For what regards the size I don'=
t think
> > I understood what to check. colors is defined to be of the same size of
> > config->llc_colors.
>
> Oh, you're right. But the other case was a memcpy(), wasn't it?

Yes, in that case your suggestion was needed.

Thanks again.

> Jan

