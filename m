Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46EDB4A4D6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 10:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115888.1462335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvtUs-0001vU-Sb; Tue, 09 Sep 2025 08:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115888.1462335; Tue, 09 Sep 2025 08:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvtUs-0001u0-PT; Tue, 09 Sep 2025 08:14:38 +0000
Received: by outflank-mailman (input) for mailman id 1115888;
 Tue, 09 Sep 2025 08:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i4f=3U=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uvtUr-0001tt-PZ
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 08:14:37 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0622135a-8d55-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 10:14:36 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-337f6cdaf2cso39805151fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Sep 2025 01:14:36 -0700 (PDT)
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
X-Inumbo-ID: 0622135a-8d55-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757405676; x=1758010476; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSOcl2lQrpQOBUV/otn8F3Hh70moqQjNoxI4z5jDjVE=;
        b=HtYdzmK/3YgfwTH0e4Q3kD4Fkl/9/dE7z++25vJw+X9/7DqKzZnwMP2nOTeQC50oE8
         H5svL/vnSrpTNWBUYarWL64oHTRFdCxiIJwnH/x7Mo0Zo2JJBv1umuRJE1C/esHw/3S3
         tjJjmqT3+hDweggvtWvngtlFyW8SVtrOaNCV+yPj6ZW1brH+B9jZR05kYGc4BpNx2jX+
         /P1HBE5GQvU4w3AEni0QC1MTJiyT9F2/OxoFzZ0949C4KVFsW0FWAyax/mdJfI3VdjOg
         GGVRYvb/yAVF27M5z97m23Ob91aO7MGIX+V1mn/EzahuBQLUU1vB4IPRrINR8nGDErak
         f4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757405676; x=1758010476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSOcl2lQrpQOBUV/otn8F3Hh70moqQjNoxI4z5jDjVE=;
        b=V3Rvcka0C/lPut/IYoOX2opPJgvmPNMvHcT0v3JyY1uKYHcSv0eze8zACHbszeZ5Sr
         9YGQdlrXKy5Su8GS02foaLjJiYHACJe03RnUXewexadtYyi9aMOAYQkM1ePNxsMlrUyY
         Qhyp/ROCulNvfMVbbDOw3v24F++L326dN7c0wmW2q0qZ2JiDyXUecjBjAR7ZX/F7V2vp
         hHkX7In+G4ME8HBTvlmVxowjQO3Ygk/eDUQ5vsefFHEo/Y91nX6f4DelxelPM+x+b303
         +sinr+PLn2vRZH1Nyu2mKLrn01Q11G334gQyXLhAE/XDXW9n9un7N0tUuMQNETTkanJH
         UxCw==
X-Forwarded-Encrypted: i=1; AJvYcCUTBIDdN1lDEWlTct95YARjOX35eQnBoGNDijA7U/5kIOESIAVjOicmpwbWl+EguMwoiBR/BSLi1xM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbd8vO00L/SjBzjU7TYyaC0C9T3j+sm8L2fR8cdiAk4UJW9raW
	0Dr9VZhvjaABO/us1mDfF2dzo+dDx4/JJa0AnOkLhuXq90cStvdH1aqj8iwUF3t9n0H8/4ooGho
	0nJiE7WUQE3VtGCfRIXo2Im95IzKyzP8=
X-Gm-Gg: ASbGncv7ip7S9ZuWXoFv4eH8CXCaVIE021gHjdD5LOkwpaDDVQ3xSvohshUkaBY770U
	O4OZw5xdxh3Hpgamkw21vpydwZp9ORqfBKYdTv6uhMeW6sxZfCfg39tw+RdKOQcO3gNl5cMDm02
	iFn7XH9lSCLhO3XBTl5jZmiBgQ9Qvxsrq4Edd9kLWW8uOIKSO2q9sPysyL5lblK4Yf6RUGOTKIT
	kCY2Q==
X-Google-Smtp-Source: AGHT+IE9kEU0uZJRPdgQRQ4m7VOm6GOPEkr+AWRiE1dXUs1tKXb0MOL3pJNiprO1Y65NiMddtc3V54qxLdFIvNGjKb8=
X-Received: by 2002:a05:651c:50f:b0:32a:6e77:3e57 with SMTP id
 38308e7fff4ca-33b56ad9de6mr27060271fa.21.1757405675366; Tue, 09 Sep 2025
 01:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756763487.git.mykola_kvach@epam.com> <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
 <fb1709de-c288-4641-8419-fdd4a2fd8401@suse.com> <CAGeoDV_JwupoKWsiztgDSYbEgAHrRjgSHYZ+y=KCiJEoZ2eK_g@mail.gmail.com>
 <CAGeoDV8hPDXFfY2UWwhNFi7K0sJZoKvyKY=Lrs7cer7hn2xX4g@mail.gmail.com> <21f2f6e1-cbf7-4b36-bbba-bffc2dab3422@suse.com>
In-Reply-To: <21f2f6e1-cbf7-4b36-bbba-bffc2dab3422@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 9 Sep 2025 11:14:23 +0300
X-Gm-Features: Ac12FXy20zCFqXZDLJZTwC66AIFdRf8kpTF9hKINCh8ac-o-7VuSmQRi1NAIOpM
Message-ID: <CAGeoDV-U74A2ooAsZ5N00_rm8Xo=GNnGA6zBuvF=naQ45jhtyw@mail.gmail.com>
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

Thank you for the fast response.

On Tue, Sep 9, 2025 at 9:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 09.09.2025 08:29, Mykola Kvach wrote:
> > On Wed, Sep 3, 2025 at 7:31=E2=80=AFAM Mykola Kvach <xakep.amatop@gmail=
.com> wrote:
> >> On Tue, Sep 2, 2025 at 5:33=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>> On 02.09.2025 00:10, Mykola Kvach wrote:
> >>>> --- a/xen/common/domain.c
> >>>> +++ b/xen/common/domain.c
> >>>> @@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reas=
on)
> >>>>          d->shutdown_code =3D reason;
> >>>>      reason =3D d->shutdown_code;
> >>>>
> >>>> +#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
> >>>> +    if ( reason !=3D SHUTDOWN_suspend && is_hardware_domain(d) )
> >>>> +#else
> >>>>      if ( is_hardware_domain(d) )
> >>>> +#endif
> >>>>          hwdom_shutdown(reason);
> >>>
> >>> I still don't follow why Arm-specific code needs to live here. If thi=
s
> >>> can't be properly abstracted, then at the very least I'd expect some
> >>> code comment here, or at the very, very least something in the descri=
ption.
> >>
> >> Looks like I missed your comment about this in the previous version of
> >> the patch series.
> >>
> >>>
> >>> From looking at hwdom_shutdown() I get the impression that it doesn't
> >>> expect to be called with SHUTDOWN_suspend, yet then the question is w=
hy we
> >>> make it into domain_shutdown() with that reason code.
> >>
> >> Thank you for the question, it is a good one.
> >>
> >> Thinking about it, with the current implementation (i.e. when the HW d=
omain
> >> requests system suspend), we don't really need to call domain_shutdown=
().
> >> It would be enough to pause the last running vCPU (the current one) ju=
st to
> >> make sure that we don't return control to the domain after exiting fro=
m the
> >> hvc trap on the PSCI SYSTEM_SUSPEND command. We also need to set
> >> shutting_down to ensure that any asynchronous code or timer callbacks
> >> behave properly during suspend (i.e. skip their normal actions).
> >
> > If we avoid calling domain_shutdown() for the hardware domain during
> > suspend, we would need to duplicate most of its logic except for the
> > hwdom_shutdown() call, which is not ideal.
>
> That is, you effectively take back what you said earlier (as to not needi=
ng
> to call domain_shutdown())?

Sure. Looking more closely, I see that for the vCPUs, for example, many fla=
gs
are checked. In the case of the control domain initializing shutdown, I nee=
d
to see the __domain_finalise_shutdown() call.

We currently don=E2=80=99t have any functionality inside arch_domain_shutdo=
wn()
for ARM, but it would be nice to have it in the future. Calling
domain_shutdown() for every domain makes the code more consistent.

The flow for all domains will be the same during suspend, at least within
Xen=E2=80=99s internal code.

>
> > To improve this, I suggest introducing a helper function:
> >
> >     static inline bool need_hwdom_shutdown(const struct domain *d, u8 r=
eason)
> >     {
> >         if ( IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && IS_ENABLED(CONFIG_ARM=
) )
> >             return is_hardware_domain(d) && reason !=3D SHUTDOWN_suspen=
d;
> >
> >         return is_hardware_domain(d);
> >     }
>
> If I see a call to a function of this name, I'd expect the "hardware
> domain" nature already having been checked. I.e. a call site would
> rather look like
>
>     if ( is_hardware_domain(d) && need_hwdom_shutdown(d, reason) )
>         ...;
>

For me, the name simply indicates whether we need to call
hwdom_shutdown() or not, and I expect it to perform the check for whether
the domain is a hardware domain inside the function itself.

> > Then, in domain_shutdown(), we can call need_hwdom_shutdown() instead
> > of directly checking is_hardware_domain(d). This keeps the logic
> > readable and avoids code duplication.
> >
> > What do you think about this approach?
>
> Well, there's still the CONFIG_ARM check in there that I would like to
> see gone. (As a nit, the use of u8 would also want to go away.)

We could combine your proposal from v5 of this patch series, i.e., using th=
e
HAS_HWDOM_SUSPEND extra config together with this helper function:

    static inline bool need_hwdom_shutdown(const struct domain *d)
    {
        bool is_hw_dom =3D is_hardware_domain(d);

        if ( !IS_ENABLED(CONFIG_HAS_HWDOM_SUSPEND) )
            return is_hw_dom && d->shutdown_code !=3D SHUTDOWN_suspend;

        return is_hw_dom;
    }

As for the second argument (reason), I can extract it directly from the
domain structure, as is done in the function above.

>
> Furthermore with continuing to (ab)use domain_shutdown() also for the
> suspend case (Dom0 isn't really shut down when suspending, aiui), you
> retain the widening of the issue with the bogus setting of
> d->is_shutting_down (and hence the need for later clearing the flag
> again) that I mentioned elsewhere. (Yes, I remain of the opinion that
> you don't need to sort that as a prereq to your work, yet at the same
> time I think the goal should be to at least not make a bad situation
> worse.)

From the perspective of ARM logic inside Xen, we perform the exact same
shutdown steps as for other domains, except that in the end we need to
call Xen suspend.

For a domain with a toolstack, it is possible to have a running Xen
watchdog service. For example, if we have systemd, it can be easily stopped
from the guest because we have hooks and can perform some actions before
suspend.

The same story applies to a Linux kernel driver: if it has PM ops installed
for the Xen watchdog driver, nothing bad happens.

However, in the case of using init.d, it isn=E2=80=99t easy to stop the Xen=
 WDT
automatically right before suspend. Therefore, Xen code has an extra check
(see domain_watchdog_timeout) where it checks the is_shutting_down flag
and does nothing if it is set.

The is_shutting_down flag is easily reset on Xen resume via a
domain_resume call, so I don=E2=80=99t see any problems with that.

>
> Jan

Best regards,
Mykola

