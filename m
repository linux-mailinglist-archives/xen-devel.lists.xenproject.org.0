Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C40B4A8F3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 11:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116090.1462505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvv4w-0005cM-Kh; Tue, 09 Sep 2025 09:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116090.1462505; Tue, 09 Sep 2025 09:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvv4w-0005ad-FX; Tue, 09 Sep 2025 09:55:58 +0000
Received: by outflank-mailman (input) for mailman id 1116090;
 Tue, 09 Sep 2025 09:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i4f=3U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvv4v-0005M3-72
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 09:55:57 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d93ca41-8d63-11f0-9809-7dc792cee155;
 Tue, 09 Sep 2025 11:55:55 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-336badc713dso36166471fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 02:55:55 -0700 (PDT)
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
X-Inumbo-ID: 2d93ca41-8d63-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757411755; x=1758016555; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trXNkOUb+e4XWjKZ+g8FxQRzSN+vByLHBANdxnRnM8A=;
        b=M6yC8wxFLWo5YkWavOpzoA1vnYi6+88WqYt8oq01/H/iktJ8Q97lCrXFAF7yvLrgUG
         JCM4dKdE6jsj3uyrhrOtfY82Miwt7OK4kNBraVndY1545NmBw+lxFWvNYWxUDajsjbWG
         rXf2CSViDVFfEQvo53Qjk+V39X2LnRld2hEdROcy44lEGKC7jab18CcCMxvadWv+4Dc8
         rXXi/GFCDsSsulENT3PysXDCGIsK1b9zS5aouzKTS5J0/dgenvgJDiAbsh+MJzhtpsLn
         6v8EHXWWG3uiyw0SCD2bX/JRhEstKvuNOFhzCek2z9TWkbMYo4vDIaw/SfKIE0qJRYGC
         58jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411755; x=1758016555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trXNkOUb+e4XWjKZ+g8FxQRzSN+vByLHBANdxnRnM8A=;
        b=qxiT8olv7kIQx5deGvDLyx0WJSADRKJpmnVDFwTUochVK1Rbbvl5hJZb3Pwy1VqpBW
         IholnnINxG8t1B4EIsKd9gmNjwj+YZf2Mlc0/1G4NzLh+KjZ3hd/qy6DzB9A2qnlpCQr
         /z1mvu08ud3KNs289hpsop0GBeEls2GFjDh5UaBT3iu9eEMAyBdK/XSYFrs2Xmzw6HLl
         IKQdrWaz38ngKos2fRpIHBtZSrcWMaa0j9iVIW7D4OAPLMByMz33AhVPKS2wingBFqhU
         vTitJbJYCtn7+wyp/ZfQIP7JBBn+3WMczY1lcX7YlYd0cO9OhbUceWl/AZgK94JlrDfq
         zcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7u0rrNkFVimLjBKhyWjitYjVMe3lV2vgRh4H/V6Go39XAoFBG4JApHE179f8ldNiISexNxPO6mc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7pFUopji8B6UxDRp9lHfNzPzCisd+ibHmY9L7OsDppzbY6u0a
	U9Alvbo4a4nhgiHMwUhjb1azvpt50kIWq3jyFziPB9JNpyY48CDs9SjIOei9thf208EkWgJJgg4
	GA00HOAHeaH38b3Am2lfXsRUWcCegCLg=
X-Gm-Gg: ASbGnctGKKvdeEXxiTxv02xkfvnLFW1UkkIFrJ3TErLbHhlrjLG9C+TJuRnyDkew5jK
	08aTPIKzReMJJ+SFq7EpaQEsILfLPOB4qN/tcv9HbB9O1EZmszCM0qUtRttul4bnc4cX1DfARwm
	Vsf1eV7HI8K3nzTOMPKL0JHav2mhcGV4R4Ow3bP39Z0IBClg5v1xIW6lRhEJ5OLg+LaLUWZdh8a
	iccdw==
X-Google-Smtp-Source: AGHT+IHWN396RlsCN2AtLwcY/ltGIzaTsHCF4Kver2D1CeqvTtQwuaDSIyAv+1pNu+C9lik7gbkIUQtsQyDDMA5CKG4=
X-Received: by 2002:a05:651c:40c1:b0:336:e081:6696 with SMTP id
 38308e7fff4ca-33b553af561mr23768571fa.44.1757411754657; Tue, 09 Sep 2025
 02:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com> <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
 <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com>
 <21f2f6e1-cbf7-4b36-bbba-bffc2dab3422@suse.com> <CAGeoDV-U74A2ooAsZ5N00_rm8Xo=GNnGA6zBuvF=naQ45jhtyw@mail.gmail.com>
 <646f7070-83c7-45ce-a4c9-c59cd39a33c5@suse.com>
In-Reply-To: <646f7070-83c7-45ce-a4c9-c59cd39a33c5@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 9 Sep 2025 12:55:42 +0300
X-Gm-Features: Ac12FXw7f66_aXTP4qfTo6cSLYYfczfsBJ-PIzV1kM6Q8D2-UxdQ3s_h1HkskKg
Message-ID: <CAGeoDV_79CUDzG-=36c+NkWwbBH+pcKaw1QTdozuHMsnMORPiQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/13] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your detailed comments and suggestions =E2=80=94 much appreciate=
d.

On Tue, Sep 9, 2025 at 12:14=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.09.2025 10:14, Mykola Kvach wrote:
> > On Tue, Sep 9, 2025 at 9:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 09.09.2025 08:29, Mykola Kvach wrote:
> >>> Then, in domain_shutdown(), we can call need_hwdom_shutdown() instead
> >>> of directly checking is_hardware_domain(d). This keeps the logic
> >>> readable and avoids code duplication.
> >>>
> >>> What do you think about this approach?
> >>
> >> Well, there's still the CONFIG_ARM check in there that I would like to
> >> see gone. (As a nit, the use of u8 would also want to go away.)
> >
> > We could combine your proposal from v5 of this patch series, i.e., usin=
g the
> > HAS_HWDOM_SUSPEND extra config together with this helper function:
> >
> >     static inline bool need_hwdom_shutdown(const struct domain *d)
> >     {
> >         bool is_hw_dom =3D is_hardware_domain(d);
> >
> >         if ( !IS_ENABLED(CONFIG_HAS_HWDOM_SUSPEND) )
> >             return is_hw_dom && d->shutdown_code !=3D SHUTDOWN_suspend;
> >
> >         return is_hw_dom;
> >     }
>
> Maybe. Yet then the next thing striking me as odd is the redundant
> checking of is_hw_dom. Why not simply
>
> {
>     if ( !is_hardware_domain(d) )
>         return false;
>
>     return IS_ENABLED(CONFIG_HAS_HWDOM_SUSPEND) || d->shutdown_code !=3D =
SHUTDOWN_suspend;
> }
>
> Yet as said - my expectation is anyway that the is_hardware_domain() chec=
k
> would live in the caller.

Ack.

>
> > As for the second argument (reason), I can extract it directly from the
> > domain structure, as is done in the function above.
>
> Looks like a misunderstanding: I don't mind the function parameter. But
> the "u8" type shouldn't be used anymore in new code; that's uint8_t now.

Oh, got it.
I just used the same type as in domain_shutdown().

>
> >> Furthermore with continuing to (ab)use domain_shutdown() also for the
> >> suspend case (Dom0 isn't really shut down when suspending, aiui), you
> >> retain the widening of the issue with the bogus setting of
> >> d->is_shutting_down (and hence the need for later clearing the flag
> >> again) that I mentioned elsewhere. (Yes, I remain of the opinion that
> >> you don't need to sort that as a prereq to your work, yet at the same
> >> time I think the goal should be to at least not make a bad situation
> >> worse.)
> >
> > From the perspective of ARM logic inside Xen, we perform the exact same
> > shutdown steps as for other domains, except that in the end we need to
> > call Xen suspend.
>
> Which, as said, feels wrong. Domains to be revived after resume aren't
> really shut down, so imo they should never have ->is_shutting_down set.

I believe this is out of scope for this series;
actually, the same applies to shutdown_code.

>
> > For a domain with a toolstack, it is possible to have a running Xen
> > watchdog service. For example, if we have systemd, it can be easily sto=
pped
> > from the guest because we have hooks and can perform some actions befor=
e
> > suspend.
> >
> > The same story applies to a Linux kernel driver: if it has PM ops insta=
lled
> > for the Xen watchdog driver, nothing bad happens.
> >
> > However, in the case of using init.d, it isn=E2=80=99t easy to stop the=
 Xen WDT
> > automatically right before suspend. Therefore, Xen code has an extra ch=
eck
> > (see domain_watchdog_timeout) where it checks the is_shutting_down flag
> > and does nothing if it is set.
>
> I don't understand how these watchdog considerations come into play here.

I=E2=80=99m just trying to explain why we still need to set this flag
even for HW domain.

>
> > The is_shutting_down flag is easily reset on Xen resume via a
> > domain_resume call, so I don=E2=80=99t see any problems with that.
>
> You did read my earlier mail though, regarding concerns towards the clear=
ing
> of that flag once it was set? (You must have, since iirc you even asked [=
1]
> whether you're expected to address those issues up front.)

As far as I understand, this issue is relevant to x86, and I believe
it is out of scope for this series.

See my previous message here:
https://lists.xen.org/archives/html/xen-devel/2025-08/msg02127.html

I will prepare a separate patch series to address it.

>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2025-08/msg02057.html

Best regards,
Mykola

