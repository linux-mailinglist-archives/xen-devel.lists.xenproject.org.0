Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8500AA6EA82
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 08:30:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926071.1328925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyjj-00082H-6H; Tue, 25 Mar 2025 07:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926071.1328925; Tue, 25 Mar 2025 07:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twyjj-00080i-3C; Tue, 25 Mar 2025 07:30:11 +0000
Received: by outflank-mailman (input) for mailman id 926071;
 Tue, 25 Mar 2025 07:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0qP=WM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1twyjg-00080c-Ut
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 07:30:08 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9b31bb5-094a-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 08:30:07 +0100 (CET)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-601c46a92d1so2959973eaf.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 00:30:07 -0700 (PDT)
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
X-Inumbo-ID: f9b31bb5-094a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742887806; x=1743492606; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L//Q+oqpIJ9qeYZhlPg+Vg7CD7DHOGCkewvzZk+nVTs=;
        b=sKkOcmcpDiZFj3p3/hVknAw3edfbrYqEbzAfRgNltTrS9RTWl5FV7s4VXGJUKvO+8c
         Pfu77FNwZug1c3TrNTleGjMSB2D5VObd01zBojJHbZfTc7adx9fE+7tJZygg5nF2SzX1
         c0/7R6MM7m3xnMhv9jkFQrC7MrbVxdVV/L39g/NpH+vrmV3giZytRXkLYAbILtcwA2yO
         nOubrC/dT6Pyd/vRQbiGYPra2f4VgBGMjqbTmuoGWUWHh6Hi/Vm00AD1M6BuvzgNVZls
         wmAmobAVJotXpP4TPpiBcBR7aaQJgcydnqCjYppICBfLrEyqDAvA8d4F9X+OAuCle0PS
         v92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887806; x=1743492606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L//Q+oqpIJ9qeYZhlPg+Vg7CD7DHOGCkewvzZk+nVTs=;
        b=stiM/PjcmEY5R0oOhRSOt3/HNjnh2r8pj1pgKD+V4XtbW9zQaCSxXAx5i5KLahULlG
         Krc66bh0sRk+2I8qXRuGLQpxBYqhy7zSCL1QhYA9ybEtHTvTjuM6OZVmNkiuijZMISLm
         ujjympx/pMPciwMsEekAdGkG6cMaUZirKRvWTQDaS8RdxmNqz21x6MBd76JksKT4wLsP
         MhAdcBMj93gLSyyJsIPPZ60X6jBugaJbfVwu6kv6A3sXIauau5RgvhWFjiIJp/FcpwHF
         ylE4wqDLoKxEisUXQJ01o1JDA5WJnrYMZlZ2MEnewOXvbIiIR7LoFDvH6o/KN3UOy8MU
         jxCw==
X-Gm-Message-State: AOJu0Yy2BopZsOkN1XrOUtvnwhTHMYoU9I4KIEM9+s7dYLNpezmFQiiQ
	LmgH5GU25KHwhzmP9ZeJiqpCsEI87wjQXw1HzJpGWOLipuYienhLz880W0qJc+fplFGt2J/cVzF
	/kaeoH1mR5Ej/MTCEDZqvmn8IAIsO1u5V1LIYAg==
X-Gm-Gg: ASbGnctdiFwZQ8K0ICL5RWbkEjKfAizld3P3/d+RHXPXLPh541b8W/TJFGqve6y3KhY
	Z1PYebHlh1c/6n0U6MWLpYNoJ3H0xWGPJvxWmo6sVPIfF1CPX7bUW5qM7YE8K9g3s7VoH7gs4dQ
	upibvO836txBJkpqXpCDb4mBJrcXI=
X-Google-Smtp-Source: AGHT+IGpCVc7EEEE0lx5GtjkPPuSez0TMwUDKhLXMMPaxVXPfHzATXU1zVV3v0/dvbg9kHKzJajUjsH+V4mo0UCauZk=
X-Received: by 2002:a05:6870:3e0c:b0:29e:27bd:69ef with SMTP id
 586e51a60fabf-2c7804ce2a0mr10905125fac.30.1742887806234; Tue, 25 Mar 2025
 00:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <8f0928b4e94b47d6fed201dcd8cfb1068573b297.1742824138.git.bertrand.marquis@arm.com>
 <A5ADD7FD-5FBD-4BE5-9428-A69719A2ACBE@arm.com>
In-Reply-To: <A5ADD7FD-5FBD-4BE5-9428-A69719A2ACBE@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 08:29:54 +0100
X-Gm-Features: AQ5f1Jryin2RXmYwYSfZSkuoq9q2OQLNNr6jx1ybBslKYbK2eanxM4trkJYQVYI
Message-ID: <CAHUa44Es0DyPU0mLXBZs7hHv_+XGDmR2yaigBf=5TnMQgSFxvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] xen/arm: ffa: Introduce VM to VM support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Mon, Mar 24, 2025 at 2:58=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi,
>
> > On 24 Mar 2025, at 14:53, Bertrand Marquis <Bertrand.Marquis@arm.com> w=
rote:
> >
> > Create a CONFIG_FFA_VM_TO_VM parameter to activate FFA communication
> > between VMs.
> > When activated list VMs in the system with FF-A support in part_info_ge=
t.
> >
> > When VM to VM is activated, Xen will be tainted as Insecure and a
> > message is displayed to the user during the boot as there is no
> > filtering of VMs in FF-A so any VM can communicate or see any other VM
> > in the system.
> >
> > WARNING: There is no filtering for now and all VMs are listed !!
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes in v4:
> > - properly handle SPMC version 1.0 header size case in partinfo_get
> > - switch to local counting variables instead of *pointer +=3D 1 form
> > - coding style issue with missing spaces in if ()
> > Changes in v3:
> > - break partinfo_get in several sub functions to make the implementatio=
n
> >  easier to understand and lock handling easier
> > - rework implementation to check size along the way and prevent previou=
s
> >  implementation limits which had to check that the number of VMs or SPs
> >  did not change
> > - taint Xen as INSECURE when VM to VM is enabled
> > Changes in v2:
> > - Switch ifdef to IS_ENABLED
> > - dom was not switched to d as requested by Jan because there is alread=
y
> >  a variable d pointing to the current domain and it must not be
> >  shadowed.
> > ---
> > xen/arch/arm/tee/Kconfig        |  11 ++
> > xen/arch/arm/tee/ffa.c          |  12 ++
> > xen/arch/arm/tee/ffa_partinfo.c | 274 +++++++++++++++++++++-----------
> > xen/arch/arm/tee/ffa_private.h  |  12 ++
> > 4 files changed, 218 insertions(+), 91 deletions(-)

With the comment you mention below fixed, please add:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> >
> > diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> > index c5b0f88d7522..88a4c4c99154 100644
> > --- a/xen/arch/arm/tee/Kconfig
> > +++ b/xen/arch/arm/tee/Kconfig
> > @@ -28,5 +28,16 @@ config FFA
> >
> >  [1] https://developer.arm.com/documentation/den0077/latest
> >
> > +config FFA_VM_TO_VM
> > +    bool "Enable FF-A between VMs (UNSUPPORTED)" if UNSUPPORTED
> > +    default n
> > +    depends on FFA
> > +    help
> > +      This option enables to use FF-A between VMs.
> > +      This is experimental and there is no access control so any
> > +      guest can communicate with any other guest.
> > +
> > +      If unsure, say N.
> > +
> > endmenu
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 3bbdd7168a6b..e41ab5f8ada6 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -464,6 +464,18 @@ static bool ffa_probe(void)
> >     printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> >            FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> >
> > +    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> > +    {
> > +        /*
> > +         * When FFA VM to VM is enabled, the current implementation do=
es not
> > +         * offer any way to limit which VM can communicate with which =
VM using
> > +         * FF-A.
> > +         * Signal this in the xen console and taint the system as inse=
cure.
> > +         * TODO: Introduce a solution to limit what a VM can do throug=
h FFA.
> > +         */
> > +        printk(XENLOG_ERR "ffa: VM to VM is enabled, system is insecur=
e !!\n");
> > +        add_taint(TAINT_MACHINE_INSECURE);
> > +    }
> >     /*
> >      * psci_init_smccc() updates this value with what's reported by EL-=
3
> >      * or secure world.
> > diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_par=
tinfo.c
> > index c0510ceb8338..406c57b95f77 100644
> > --- a/xen/arch/arm/tee/ffa_partinfo.c
> > +++ b/xen/arch/arm/tee/ffa_partinfo.c
> > @@ -63,9 +63,156 @@ static int32_t ffa_partition_info_get(uint32_t *uui=
d, uint32_t flags,
> >     return ret;
> > }
> >
> > -void ffa_handle_partition_info_get(struct cpu_user_regs *regs)
> > +static int32_t ffa_get_sp_count(uint32_t *uuid, uint32_t *sp_count)
> > +{
> > +    uint32_t src_size;
> > +
> > +    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_F=
LAG,
> > +                                  sp_count, &src_size);
> > +}
> > +
> > +static int32_t ffa_get_sp_partinfo(uint32_t *uuid, uint32_t *sp_count,
> > +                                   void *dst_buf, void *end_buf,
> > +                                   uint32_t dst_size)
> > {
> >     int32_t ret;
> > +    uint32_t src_size, real_sp_count;
> > +    void *src_buf =3D ffa_rx;
> > +    uint32_t count =3D 0;
> > +
> > +    /* Do we have a RX buffer with the SPMC */
> > +    if ( !ffa_rx )
> > +        return FFA_RET_DENIED;
> > +
> > +    /* We need to use the RX buffer to receive the list */
> > +    spin_lock(&ffa_rx_buffer_lock);
> > +
> > +    ret =3D ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size)=
;
> > +    if ( ret )
> > +        goto out;
> > +
> > +    /* We now own the RX buffer */
> > +
> > +    /* We only support a 1.1 firmware version */
>
> This comment should have been removed.
> I will fix it on next version of might be possible to do on commit
> if there are no further comments here.
>
> Cheers
> Bertrand
>

