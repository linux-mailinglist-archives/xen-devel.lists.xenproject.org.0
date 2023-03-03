Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62086A9C41
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 17:51:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506121.779151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY8cn-0007ao-VU; Fri, 03 Mar 2023 16:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506121.779151; Fri, 03 Mar 2023 16:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY8cn-0007Yd-Sk; Fri, 03 Mar 2023 16:51:17 +0000
Received: by outflank-mailman (input) for mailman id 506121;
 Fri, 03 Mar 2023 16:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pyx=63=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pY8cl-0007Jf-RQ
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 16:51:15 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a4618ef-b9e3-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 17:51:12 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id v16so2967290wrn.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 08:51:11 -0800 (PST)
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
X-Inumbo-ID: 9a4618ef-b9e3-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677862271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN/rbUQiGJ/V5omFdDMO5rmWNNQ/FfJOctwI5vinchA=;
        b=xGpYCkihlhqEJGsFNm5jVSb2UIDYZQdeoe19mzN41w/zWt5hXsID/dl3nn5H0i5wlO
         pJfaM1JPore0nzHXZ/uNpTlivS5rUwrRnluoBzdEvLyScqSBgjEyTN+ne7X5T5QWbfZm
         8+Y6UQJO4Pud8sGtZqswTuNj905arEd1ZJp4V7qbhUbAGVa0JMvKxVV69HqENJgwQSWz
         UgX0l7hmsPo7ZeOHKwgfHJVJo+kB7L0kayj93luQtxxU0UvtNupmMkxyttmYNYk/5m2d
         TWsRCENCBvEMbxgDF0LWVlZXC6+MGWAcoqmHPqD63A3xDdgdyKvPQtn3uu9QDszy5gJE
         iGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677862271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jN/rbUQiGJ/V5omFdDMO5rmWNNQ/FfJOctwI5vinchA=;
        b=nFSp4znPirRI5a//TvdWY65aTG8IERpEIXEAQFZByJ2cDsthQfVpXAnxZWZbTCL94E
         lfVnv4Py9/iDS14ZaA/wp4pCWdRYi9D4dgfqct/aztjY4tUoyKSiSo9EOmoWHDEueLyC
         QoT38D0le0+XbbzLk/AYF9lwUJe4Uau85DqYDcGwoqn7LkhvAvRPzxN/ZRJwMmWEyYOR
         R1LpXtZCbMlOqGUgKtFtQA8AJfRE7OpKIJzpDqorQ4fRPED64m27TRXtu0OgcY0wvZv/
         KERk9xEWm8t9egu7h/4JnFCWO+VFIh9zXGeCScOeSuTPer4p98CBbkEGRmBFhYJgYmxl
         f1KA==
X-Gm-Message-State: AO0yUKVksnLYcnDx6W19OSDdizVxw7fbB0uKbl6G63NAtIljKPPDkJ1e
	k6/M6ikzTe9VgrfRHadrOnF+dlykoULF6wEWoJRY7w==
X-Google-Smtp-Source: AK7set/tiWGDt41NdN+7Ijpgfepmv9MPULH+mdDL6ySRJH9T/5tO6V9Rb5FWU+RFBDV2SZzeKSvm023gZosDBf2s2IE=
X-Received: by 2002:a5d:6485:0:b0:2c5:4adc:6e52 with SMTP id
 o5-20020a5d6485000000b002c54adc6e52mr1468968wri.3.1677862270974; Fri, 03 Mar
 2023 08:51:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ad85591c42f4db3c3001ae4b5572c1096c159593.1677079672.git.jens.wiklander@linaro.org>
 <C57A3E71-138B-40EB-8B0C-13603EB145AF@arm.com>
In-Reply-To: <C57A3E71-138B-40EB-8B0C-13603EB145AF@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 3 Mar 2023 17:51:00 +0100
Message-ID: <CAHUa44F=T8XB2OJYLA0Y9vUc2xY0dxa4VQTNmkQ3pmqLVwsG_g@mail.gmail.com>
Subject: Re: [XEN PATCH v7 16/20] xen/arm: ffa: add defines for sharing memory
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Mar 3, 2023 at 2:38=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds defines needed for sharing using the function FFA_MEM_SHARE and
> > friends.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 57 ++++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 57 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 3571817c0bcd..bfd378f7fcd7 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -22,6 +22,14 @@
> > #include <asm/tee/ffa.h>
> > #include <asm/regs.h>
> >
> > +/*
> > + * References:
> > + * FF-A-1.0-REL: FF-A specification version 1.0 available at
> > + *               https://developer.arm.com/documentation/den0077/a
> > + * FF-A-1.1-REL0: FF-A specification version 1.1 available at
> > + *                https://developer.arm.com/documentation/den0077/e
> > + */
>
> This could actually be directly in the file header.

OK, I'll move it.

>
> > +
> > /* Error codes */
> > #define FFA_RET_OK                      0
> > #define FFA_RET_NOT_SUPPORTED           -1
> > @@ -66,6 +74,55 @@
> >  */
> > #define FFA_PAGE_SIZE                   SZ_4K
> >
> > +/*
> > + * Limit for shared buffer size. Please note that this define limits
> > + * number of pages. But user buffer can be not aligned to a page
> > + * boundary. So it is possible that user would not be able to share
> > + * exactly FFA_MAX_SHM_BUFFER_PG * FFA_PAGE_SIZE bytes.
> > + *
> > + * FF-A doesn't have any direct requirments on GlobalPlatform or vice
> > + * versa, but an implementation can very well use FF-A in order to pro=
vide
> > + * a GlobalPlatform interface on top.
> > + *
> > + * Global Platform specification for TEE requires that any TEE
> > + * implementation should allow to share buffers with size of at least
> > + * 512KB. Due to align issue mentioned above, we need to increase this
> > + * value with one.
>
> Could you give a bit more details here: what spec version, where in the s=
pec ?
>
> I did download one version of it and at a first glance could not find thi=
s value.

https://globalplatform.org/specs-library/tee-client-api-specification/
TEE Client API Specification version 1.0c, page 24, Table 4-1: API
Configuration Constants, look for TEEC_CONFIG_SHAREDMEM_MAX_SIZE. I'll
add a reference.

>
> > + */
> > +#define FFA_MAX_SHM_PAGE_COUNT          (SZ_512K / FFA_PAGE_SIZE + 1)
> > +
> > +/*
> > + * Limits the number of shared buffers that guest can have at once. Th=
is
> > + * is to prevent case, when guests tricks XEN into exhausting its own
> > + * memory by allocating many small buffers. This value has been chosen
> > + * arbitrary.
> > + */
> > +#define FFA_MAX_SHM_COUNT               32
>
> For those 2 limits, I am a bit wondering which should be defined in the c=
ode or maybe
> configurable in kconfig or through xen command line or per guest.

Per guest sounds like an interesting option when these values aren't
good enough.

>
> I do not think we can answer that now but if one of these limits is reach=
ed we should
> have a clear error message so that we could easily say what to modify and=
 decide
> if/how to solve it.

I'll add prints in the later patches.

>
>
> > +
> > +/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> > +#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> > +#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> > +
> > +/*
> > + * The bits for FFA_NORMAL_MEM_REG_ATTR FFA_MEM_ACC_RW below are
> > + * defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> > + */
> > + /* Memory attributes: Normal memory, Write-Back cacheable, Inner shar=
eable */
> > +#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> > +/* Memory access permissions: Read-write */
> > +#define FFA_MEM_ACC_RW                  0x2U
>
> RW bits are defined in table 10.15 at page 168 if i am not mistaking

Thanks, I'll update it.

>
> > +
> > +/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> > +/* Clear memory before mapping in receiver */
> > +#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> > +/* Relayer may time slice this operation */
> > +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> > +/* Clear memory after receiver relinquishes it */
> > +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> > +/* Share memory transaction */
> > +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> > +
> > +
> Please only add one empty line here.

OK, I'll fix.

>
> I checked the definitions and they are all coherent with the spec.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > /* Framework direct request/response */
> > #define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> > #define FFA_MSG_TYPE_MASK               0xFFU;
> > --
> > 2.34.1
> >
>

