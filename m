Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D39B5F44
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 10:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827975.1242752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65Nk-00066N-0x; Wed, 30 Oct 2024 09:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827975.1242752; Wed, 30 Oct 2024 09:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65Nj-00063w-U8; Wed, 30 Oct 2024 09:52:51 +0000
Received: by outflank-mailman (input) for mailman id 827975;
 Wed, 30 Oct 2024 09:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9hZ=R2=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1t65Ni-00063K-LQ
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 09:52:50 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7a20741-96a4-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 10:52:47 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4316e9f4a40so62771275e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 02:52:47 -0700 (PDT)
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
X-Inumbo-ID: b7a20741-96a4-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmUiLCJoZWxvIjoibWFpbC13bTEteDMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI3YTIwNzQxLTk2YTQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjgxOTY3LjMyMjUzMywic2VuZGVyIjoianVsaWVuLmdyYWxsLm9zc0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730281967; x=1730886767; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7swSm+STLbVGrfCnzK0Ro2Lvvfr5C/rf6tORPnwGRk=;
        b=iMsOvq6bm3DnR05+sRfvxusk1a2HYdhN769/lizl8rVoz+0ohUnoMnHkEAGtFtyaG2
         eMRCjyegMkDXOn+Su8Asw2f3+rrjWX8hfpHyFG0bRk29L8igzuWTUHcF/3EVUY7ak9iz
         fpFoDRYZ36YOQHSON+9wvbyMy/CMTeBHnGKkNBG4dh5OUz93VxR/wZs4aOxhXb43lRIA
         AOkn4KUm3DN/Am3UEF2vYfNSFarcBrpvZF6qbQBu+no5OGDJeGY9Rl53uB5Fjq02rrwE
         FcHdl/OiouaiQMzhvtln8XY/ANND6oA/taRa6j1rix9HiK19AwxfNMAtDb10xhfES7Vc
         douw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281967; x=1730886767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7swSm+STLbVGrfCnzK0Ro2Lvvfr5C/rf6tORPnwGRk=;
        b=ToHH7IyMub1g1+kTKmlAQicIuxPYmnjL2ceTjwOHV27UFAx8MSd4zVfXMLaPv2AwFn
         pnvw4V+raQcCu8kDwbgpxDr4JQkbFArrk95RFHFeyXVxvNKq5HE7uqXdcyNkAI9Izww5
         ShzFFRDRIr1eUlK00JYWkPbYn/cpzrQWn+cBV7YBtXob9IMJUMUKIPkFb41kLRs6p0GM
         U9K8CzzUsaktMWkjhPdDEIcSOmMUSHsicIhzs3Q/hY/QuI19oaGgxylUfZ88WstCAhkQ
         kwUuQxrRk0HtiqHAbXKmVEVsKrnJwD4rognr1siu08aJ65ag8HXsrM/edaQW6Y3TXnYw
         fMqA==
X-Forwarded-Encrypted: i=1; AJvYcCVrPAgz3g5F3d3dWrB6WHwGYKdsWvLgzk2zdfBT+b0ZYBJ+FVlL+TKAYwl2TiuyJJo11LJsVgupvSY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt8URl4FsY8fix6FBDFJmeFVUEBZHSAyTBvE8W0XpL4PX52ya+
	cvKAOqJNtBRN/voKjew9VbQTylOTL5tXKmBOvw6k1jqZKzJXwYUAQv9gjgSNdnavX5twHd9oFJ1
	WmqB2uJVO7/VWURD7SM2RLNvb6P4=
X-Google-Smtp-Source: AGHT+IHmrwqQHDNqdrxmpsFxdM+4RYbmuPHYW7VA1tOdtxLFTK3I+598XhmwckqdJWp4wzu4eVf+bla0Xos7XaF3wYM=
X-Received: by 2002:a05:600c:4f87:b0:42c:b4f2:7c30 with SMTP id
 5b1f17b1804b1-4319ad1402emr103892805e9.23.1730281966661; Wed, 30 Oct 2024
 02:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com> <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
In-Reply-To: <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 30 Oct 2024 09:52:34 +0000
Message-ID: <CAJ=z9a1d2vzXh-fK5E2z-k4SOjE0cjJUGfFnaJiobvQpS+Y5Rw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection regions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Oct 2024 at 09:17, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>
> Hi Ayan,
>
> While I rebased the branch on top of your patches, I saw you=E2=80=99ve c=
hanged the number of regions
> mapped at boot time, can I ask why?

I have asked the change. If you look at the layout...

>
> Compared to https://patchwork.kernel.org/project/xen-devel/patch/20230626=
033443.2943270-25-Penny.Zheng@arm.com/:


... you have two sections with the same permissions:

xen_mpumap[1] : Xen read-only data
xen_mpumap[2] : Xen read-only after init data
xen_mpumap[3] : Xen read-write data

During boot, [2] and [3] will share the same permissions. After boot,
this will be [1] and [2]. Given the number of MPU regions is limited,
this is a bit of a waste.

We also don't want to have a hole in the middle of Xen sections. So
folding seemed to be a good idea.

>
> > +FUNC(enable_boot_cpu_mm)
> > +
> > +    /* Get the number of regions specified in MPUIR_EL2 */
> > +    mrs   x5, MPUIR_EL2
> > +
> > +    /* x0: region sel */
> > +    mov   x0, xzr
> > +    /* Xen text section. */
> > +    ldr   x1, =3D_stext
> > +    ldr   x2, =3D_etext
> > +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=3DREGION_TEX=
T_PRBAR
> > +
> > +    /* Xen read-only data section. */
> > +    ldr   x1, =3D_srodata
> > +    ldr   x2, =3D_erodata
> > +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=3DREGION_RO_=
PRBAR
> > +
> > +    /* Xen read-only after init and data section. (RW data) */
> > +    ldr   x1, =3D__ro_after_init_start
> > +    ldr   x2, =3D__init_begin
> > +    prepare_xen_region x0, x1, x2, x3, x4, x5
>
>          ^=E2=80=94 this, for example, will block Xen to call init_done(v=
oid) later, I understand this is earlyboot,
>                but I guess we don=E2=80=99t want to make subsequent chang=
es to this part when introducing the
>                patches to support start_xen()

Can you be a bit more descriptive... What will block?

>
> > +
> > +    /* Xen code section. */
> > +    ldr   x1, =3D__init_begin
> > +    ldr   x2, =3D__init_data_begin
> > +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=3DREGION_TEX=
T_PRBAR
> > +
> > +    /* Xen data and BSS section. */
> > +    ldr   x1, =3D__init_data_begin
> > +    ldr   x2, =3D__bss_end
> > +    prepare_xen_region x0, x1, x2, x3, x4, x5
> > +
> > +    ret
> > +
> > +END(enable_boot_cpu_mm)
>
> I suggest to keep exactly the regions as are in Penny=E2=80=99s patch.

See above. Without any details on the exact problem, it is difficult
to agree on your suggestion.

Cheers,

