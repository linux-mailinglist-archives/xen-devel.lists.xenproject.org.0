Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0CABDCA9
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:26:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990823.1374748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNv8-0006NI-Ub; Tue, 20 May 2025 14:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990823.1374748; Tue, 20 May 2025 14:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNv8-0006Lo-Ry; Tue, 20 May 2025 14:26:18 +0000
Received: by outflank-mailman (input) for mailman id 990823;
 Tue, 20 May 2025 14:26:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDZd=YE=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uHNv6-0006Li-Qt
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:26:16 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 627acc60-3586-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:26:14 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6f8d8fb211eso17735276d6.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:26:14 -0700 (PDT)
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
X-Inumbo-ID: 627acc60-3586-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747751174; x=1748355974; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1JKAUHFWSui+XeHMlb9MsfSB+pHocjJanzL0Be9ELI=;
        b=cIUySEeax604yUGBYAsZ6owPvtqJg2SZKVgT/W+UBYsPUzQcJvlmRIPufRrKDkJUyD
         AmUoBukP/cRnzdoSBZ6BIoBljTuoTYMrWCSMAgH5zIppOkkmIO7dJXcLCsyiw53fJ5d3
         9FgwHawJK5x2B5tRR8Upv6k2UTQGn/GoQ8Wpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751174; x=1748355974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1JKAUHFWSui+XeHMlb9MsfSB+pHocjJanzL0Be9ELI=;
        b=EYANbAE27eyCCSq7jcB4zuHdU4cBSw05ZuolBTATMR0isTD9DXk1oh5ceCZF/juq25
         zD8VmQO+bncQXWDAJOO1B87oVtyjHALbkm3XXtVWG45LkPDF4S3sxm1rBxNgh4ASuaOy
         JSW7peq+Wydj6HFKxUuWpLwAdU58VGmddQqj6stqUqM0wZgNBB06zFRKwdl0xnkSjYfz
         wuRs1mlxTTipun+En0rhwRdM116rd7eiuX0sXRqC8Y5TT5JqJ2bozaSc5MLveeL1q53y
         Cbq+sQ2TtWUBiDdfK7ipq48iAxA5hJgbUS1sBkHUahI4jhUqs88btwZvPEsmC7/h8fjV
         PIDw==
X-Forwarded-Encrypted: i=1; AJvYcCU2aWoxrC+jP3uTyY7+HFe6z2MKCgVod+TdepnoN3WSPXHOozQOGEfDtTlKE12/Ftcl8L5FcTIIOuI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAg+Ni2+vpzBeBX+tGVs0+MLYxTJAvVQgfpmnTwa6ypC/SNeol
	m+UY/HtAsGDAJJUkxg3uuPE+rV57ox3eD9Z6H5OhOb7bb//hMSYGgb7UwEBxqw18SjjRKwHDIiH
	Zee8tfgb5ArQ4/bB9Rb7RSUtwd8PRXIoyneMCgVoxjXHi2E/hUqa2mg==
X-Gm-Gg: ASbGnctMlJfFXCqCOtJr77fnNdzX/yiXjxyRFalTzYG2S0fzaCLK1q9ICMMYNWEArRJ
	NYj333JvupHmy3QWuE/otKAYP8nLrWwjrv5n3e1iZ5w2DxQ1E0u10TFC9rwP0A16xpGqKgh0ew1
	rLqXi+hfTwwUw3HVVa+fSqZtvvFmlNQrlOM02PvV/cTg==
X-Google-Smtp-Source: AGHT+IHxdcPHNWoe4q2z8+xv8KZ4aqsSyV2BXEKTkgjfkUkIUX7h6k04VwkTy8y6Eh7hi4imUnE7cthxPYyId5MeuJo=
X-Received: by 2002:a05:6808:608e:b0:3fe:b1fd:527f with SMTP id
 5614622812f47-404d8616f1emr8733829b6e.1.1747751161606; Tue, 20 May 2025
 07:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-3-ross.lagerwall@citrix.com> <3128bda3-d655-43ae-81a7-df61928a27aa@suse.com>
In-Reply-To: <3128bda3-d655-43ae-81a7-df61928a27aa@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 20 May 2025 15:25:50 +0100
X-Gm-Features: AX0GCFvg4rTTBAIA7B3ytMnrxKNunW0_T3HZFPlokMbxJtPceQ5t4AHHfkuq4tk
Message-ID: <CAG7k0Ep0PdNOO0YTkaPa-uBsuQ8Jw6DFTZGLipUs1HbPoCRkgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] public/sysctl: Clarify usage of pm_{px,cx}_stat
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 3:43=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 12.05.2025 16:46, Ross Lagerwall wrote:
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -215,23 +215,51 @@ typedef struct pm_px_val pm_px_val_t;
> >  DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
> >
> >  struct pm_px_stat {
> > -    uint8_t total;        /* total Px states */
> > -    uint8_t usable;       /* usable Px states */
> > -    uint8_t last;         /* last Px state */
> > -    uint8_t cur;          /* current Px state */
> > -    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
> > +    /*
> > +     * IN: Number of elements in pt, number of rows/columns in trans_p=
t
> > +     *     (PMSTAT_get_pxstat)
> > +     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
> > +     */
> > +    uint8_t total;
>
> The part for this field ought to go in patch 1, as already indicated ther=
e.
>
> > +    uint8_t usable;       /* OUT: usable Px states (PMSTAT_get_pxstat)=
 */
> > +    uint8_t last;         /* OUT: last Px state (PMSTAT_get_pxstat) */
> > +    uint8_t cur;          /* OUT: current Px state (PMSTAT_get_pxstat)=
 */
> > +    /*
> > +     * OUT: Px transition table. This should have total * total elemen=
ts.
> > +     *      This will not be copied if it is smaller than the hypervis=
or's
> > +     *      Px transition table. (PMSTAT_get_pxstat)
> > +     */
> > +    XEN_GUEST_HANDLE_64(uint64) trans_pt;
> > +    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
> >      XEN_GUEST_HANDLE_64(pm_px_val_t) pt;
>
> As also indicated there, the same constraint as for trans_pt applies to t=
his
> output buffer, just that it's having only one dimension.
>
> >  };
> >
> >  struct pm_cx_stat {
> > -    uint32_t nr;    /* entry nr in triggers & residencies, including C=
0 */
> > -    uint32_t last;  /* last Cx state */
> > -    uint64_aligned_t idle_time;                 /* idle time from boot=
 */
> > -    XEN_GUEST_HANDLE_64(uint64) triggers;    /* Cx trigger counts */
> > -    XEN_GUEST_HANDLE_64(uint64) residencies; /* Cx residencies */
> > -    uint32_t nr_pc;                          /* entry nr in pc[] */
> > -    uint32_t nr_cc;                          /* entry nr in cc[] */
> >      /*
> > +     * IN:  Number of elements in triggers, residencies (PMSTAT_get_cx=
stat)
> > +     * OUT: entry nr in triggers & residencies, including C0
> > +     *      (PMSTAT_get_cxstat, PMSTAT_get_max_cx)
> > +     */
> > +    uint32_t nr;
> > +    uint32_t last;  /* OUT: last Cx state (PMSTAT_get_cxstat) */
> > +    /* OUT: idle time from boot (PMSTAT_get_cxstat)*/
> > +    uint64_aligned_t idle_time;
> > +    /* OUT: Cx trigger counts, nr elements (PMSTAT_get_cxstat) */
> > +    XEN_GUEST_HANDLE_64(uint64) triggers;
> > +    /* OUT: Cx residencies, nr elements (PMSTAT_get_cxstat) */
> > +    XEN_GUEST_HANDLE_64(uint64) residencies;
> > +    /*
> > +     * IN: entry nr in pc[] (PMSTAT_get_cxstat)
> > +     * OUT: Index of highest non-zero entry set in pc[] (PMSTAT_get_cx=
stat)
> > +     */
> > +    uint32_t nr_pc;
> > +    /*
> > +     * IN: entry nr in cc[] (PMSTAT_get_cxstat)
> > +     * OUT: Index of highest non-zero entry set in cc[] (PMSTAT_get_cx=
stat)
> > +     */
>
> For both of these, it's not "highest non-zero" but, according to ...
>
> > +    uint32_t nr_cc;
> > +    /*
> > +     * OUT: (PMSTAT_get_cxstat)
> >       * These two arrays may (and generally will) have unused slots; sl=
ots not
> >       * having a corresponding hardware register will not be written by=
 the
> >       * hypervisor. It is therefore up to the caller to put a suitable =
sentinel
>
> ... this comment, "highest written by hypervisor". They're also not "inde=
x of",
> but "one higher than the index of" (i.e. counts, not indexes).
>

Looking at this again, I don't think that matches what Xen does (nor
does my previous attempt). The code in question:

#define PUT_xC(what, n) do { \
        if ( stat->nr_##what >=3D n && \
             copy_to_guest_offset(stat->what, n - 1, &hw_res.what##n, 1) ) =
\
            return -EFAULT; \
        if ( hw_res.what##n ) \
            nr_##what =3D n; \
    } while ( 0 )

Xen will copy all the hardware registers that it knows about (regardless
of whether the hardware actually has them) and will return in nr_pc /
nr_cc the index + 1 of the highest non-zero entry it _would_ have
written if there is sufficient space.

I could describe it simply as "OUT: Required size of cc[]" ?

Thanks,
Ross

