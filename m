Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2A7859E3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 15:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589286.921139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoNE-0000JV-Jw; Wed, 23 Aug 2023 13:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589286.921139; Wed, 23 Aug 2023 13:58:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoNE-0000Hs-H1; Wed, 23 Aug 2023 13:58:16 +0000
Received: by outflank-mailman (input) for mailman id 589286;
 Wed, 23 Aug 2023 13:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pnhk=EI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qYoNC-0000Hm-Ug
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 13:58:14 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1987b189-41bd-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 15:58:12 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso8648531e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Aug 2023 06:58:12 -0700 (PDT)
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
X-Inumbo-ID: 1987b189-41bd-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692799092; x=1693403892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w//bEIcqwvXyCBc+5NauKKk+KikT0DyA08jlIENWhE=;
        b=B6fG8tgNzEmjEceDK3VWAqF31XFMZQkAVejDlHF7KxPZVPnWswL3WpWlZ2EbcSUMVB
         nwxOvomRJm/xJbOjmkIn4q6Ibg5whBvCR/dohQv+HGj0deNPzp/MJ5IbCd7tGz7gInMa
         38QQBVL6lYvKp4TXWn138w3tAM5ttZXGReB6iGI5viatCEb0Tc+mpI8pcQ5FJKB3khrA
         5pEdC2byrVxsg0N7CkYeAw4MvR7nMfZl2sRAbq+wHfVPGP/RihvpIw55CzoHgfipcPou
         AijTpryNiSWRVcs/uBPif12qKvL8Mt7gbil9JBLKBYxyYqlsbTDWCbeEDvsiT6ivyfuJ
         hbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692799092; x=1693403892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5w//bEIcqwvXyCBc+5NauKKk+KikT0DyA08jlIENWhE=;
        b=Yw5pFMEXkSCcqc2+HlbW2/7DI+rGcwB/y2H7T0JCB1WFqlaVIH1mx2pBSg7pUkZ6Gh
         BcgZurnEwZRUCVSzt7MdXa5z6sh6xSH2yDqjTilaKWtQmgfwbmN+6jic72pA5IvmCO4Z
         T2mIcCBa2h931SCTX+vK4Tv34Ww2x9XZfDWVf3FayO9woRzBLR5cPZUfAamQrQEmccJN
         FJr/A+ERPXX2/weDKP+LgtTDIVv3rB5Ug8N427fj/YWiGO5MuQy0JbZxaTa9jcF6PQMJ
         3vJfIDj5xn6j8Ehyt0cyU1okEn/chKyr6betZiKO9ELIvCRXeuadoWuvuQBiJOI1/7SI
         cEmw==
X-Gm-Message-State: AOJu0Yw8sq522naA9R0yKTFbdm9IaoTxhyl/267XIrKptjF5HOintlmp
	Bx0lukPPQw8Gk6zy8lMhrxMUk16QELoKx7b0620=
X-Google-Smtp-Source: AGHT+IGYNtnihY/uzzx6e9kliQsXDQaaWj/otse7zMaoeS9ybzB6xv9dXA5CfLdjGUf8dHEtzKQecuygnG/y1PEwoPg=
X-Received: by 2002:a05:6512:ad5:b0:4f8:5604:4b50 with SMTP id
 n21-20020a0565120ad500b004f856044b50mr9982999lfu.64.1692799091968; Wed, 23
 Aug 2023 06:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <91bb3d4e-46e6-c210-2610-c4771996adfb@suse.com>
In-Reply-To: <91bb3d4e-46e6-c210-2610-c4771996adfb@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 23 Aug 2023 09:57:59 -0400
Message-ID: <CAKf6xpvZ4JBEmp0tL4vQgjbEo2uB-nYp8-_dUoQo26x+sfHtKg@mail.gmail.com>
Subject: Re: [PATCH] libxc: remove / adjust xc_get_cpufreq_para()'s BUILD_BUG_ON()s
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 9:47=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> The full structures cannot match in layout, as soon as a 32-bit tool
> stack build comes into play. But it also doesn't need to; the part of
> the layouts that needs to match is merely the union that we memcpy()
> from the sysctl structure to the xc one. Keep (in adjusted form) only
> the relevant ones.
>
> Since the whole block needs touching anyway, move it closer to the
> respective memcpy() and use a wrapper macro to limit verbosity.
>
> Fixes: 2381dfab083f ("xen/sysctl: Nest cpufreq scaling options")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/libs/ctrl/xc_pm.c
> +++ b/tools/libs/ctrl/xc_pm.c
> @@ -248,45 +248,6 @@ int xc_get_cpufreq_para(xc_interface *xc
>      sys_para->freq_num =3D user_para->freq_num;
>      sys_para->gov_num  =3D user_para->gov_num;
>
> -    /* Sanity check struct layout */
> -    BUILD_BUG_ON(sizeof(*user_para) !=3D sizeof(*sys_para));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), cpu_num) !=3D
> -                 offsetof(typeof(*sys_para),  cpu_num));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), freq_num) !=3D
> -                 offsetof(typeof(*sys_para),  freq_num));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), gov_num) !=3D
> -                 offsetof(typeof(*sys_para),  gov_num));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), affected_cpus) !=3D
> -                 offsetof(typeof(*sys_para),  affected_cpus));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_frequenc=
ies) !=3D
> -                 offsetof(typeof(*sys_para),  scaling_available_frequenc=
ies));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_governor=
s) !=3D
> -                 offsetof(typeof(*sys_para),  scaling_available_governor=
s));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_driver) !=3D
> -                 offsetof(typeof(*sys_para),  scaling_driver));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_cur_freq) !=3D
> -                 offsetof(typeof(*sys_para),  cpuinfo_cur_freq));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_max_freq) !=3D
> -                 offsetof(typeof(*sys_para),  cpuinfo_max_freq));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_min_freq) !=3D
> -                 offsetof(typeof(*sys_para),  cpuinfo_min_freq));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_cur_freq) !=3D
> -                 offsetof(typeof(*sys_para),  u.s.scaling_cur_freq));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_governor) !=3D
> -                 offsetof(typeof(*sys_para),  u.s.scaling_governor));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_max_freq) !=3D
> -                 offsetof(typeof(*sys_para),  u.s.scaling_max_freq));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_min_freq) !=3D
> -                 offsetof(typeof(*sys_para),  u.s.scaling_min_freq));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.userspace) !=3D
> -                 offsetof(typeof(*sys_para),  u.s.u.userspace));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.ondemand) !=3D
> -                 offsetof(typeof(*sys_para),  u.s.u.ondemand));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), u.cppc_para) !=3D
> -                 offsetof(typeof(*sys_para),  u.cppc_para));
> -    BUILD_BUG_ON(offsetof(typeof(*user_para), turbo_enabled) !=3D
> -                 offsetof(typeof(*sys_para),  turbo_enabled));
> -
>      ret =3D xc_sysctl(xch, &sysctl);
>      if ( ret )
>      {
> @@ -316,6 +277,22 @@ int xc_get_cpufreq_para(xc_interface *xc
>          BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=3D
>                      sizeof(((struct xen_get_cpufreq_para *)0)->u));

This check...

> +        /* Sanity check layout of the union subject to memcpy() below. *=
/
> +        BUILD_BUG_ON(sizeof(user_para->u) !=3D sizeof(sys_para->u));

And this check are the same?  Your newer one is nicer, so maybe drop the fi=
rst?

> +#define CHK_FIELD(fld) \
> +        BUILD_BUG_ON(offsetof(typeof(user_para->u), fld) !=3D \
> +                     offsetof(typeof(sys_para->u),  fld))
> +
> +        CHK_FIELD(s.scaling_cur_freq);
> +        CHK_FIELD(s.scaling_governor);
> +        CHK_FIELD(s.scaling_max_freq);
> +        CHK_FIELD(s.scaling_min_freq);
> +        CHK_FIELD(s.u.userspace);
> +        CHK_FIELD(s.u.ondemand);
> +        CHK_FIELD(cppc_para);
> +
> +#undef CHK_FIELD
> +
>          memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));
>      }
>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Sorry about the breakage. I started looking at this locally, but you beat m=
e.

Thanks,
Jason

