Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945C8051E4
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647554.1010802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATQb-0001X4-K5; Tue, 05 Dec 2023 11:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647554.1010802; Tue, 05 Dec 2023 11:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATQb-0001VS-HY; Tue, 05 Dec 2023 11:17:25 +0000
Received: by outflank-mailman (input) for mailman id 647554;
 Tue, 05 Dec 2023 11:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bfq=HQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rATQZ-0001Tt-7a
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:17:23 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbce7d42-935f-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:17:22 +0100 (CET)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-5d3644ca426so53429117b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 03:17:22 -0800 (PST)
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
X-Inumbo-ID: dbce7d42-935f-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701775041; x=1702379841; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJAAwKm8C7rTan31PK0X98ZE47bw/2K1Byo5zsVXN9I=;
        b=DyJDeIkRZwAT6+2609qK4HKFYxSTkUu6GxDBsxApHMhgk/64S2b9Vy6wS2qFIakdwR
         91cnh0g/ZOpuGhPrO9r+z6QWV2kSRsN4dfXI0gwAgs0VhhrrQ2MO1FOCUmKhST/PblDo
         /47mqv+Y6j6Vk8D3An58mcVl+AJwyq0H3B28Pw5lqRt6z4kiX4ptfp1CWQOcwCQa0epm
         5j6GDf4rsJ5bV8gpBFKLUdmMQOxzHaY4wFLk7J3AVYnBTTwLXVsuaHEYDh1/04jL/mLR
         ouOoT73G9yfccX5VN+pHxtPssbEldwXuN2NpSlMoPCDBSoIpajiOvtRPfobkmePakrZv
         BGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701775041; x=1702379841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJAAwKm8C7rTan31PK0X98ZE47bw/2K1Byo5zsVXN9I=;
        b=FpzziHDcQrDIowveTEmH/zIjAkul2wx/hbPUGNbjVRx3+vFbKYOs6QhgnJOb9uCw5l
         YaUkFL7zQnHS48R90SOXbaDjPKzU3qOCnVa56HLTmz61ioN/aNnYNFBkbsfU95uF6F2H
         mw8uLnaecGujR5ep+uIOO6JSscqHzJ7D5RJMkQPM9UZq61Wih9hEptB7B0Y68PruAWe1
         CZbYDKTok5JZhmfiuXVRBlzd/3s6bSuQ0QESejDrQw/1eg9fcn5Nnrb3F3dXXLLMpcoq
         SIWLmVxNQGUgdPkkN6okNu3zpHw2ale4xvAFfrGS0vETaa6F0W7ToVOmJspMyvyTIAIT
         hy2g==
X-Gm-Message-State: AOJu0Yy2I+0HeAJAAhyPkWB4LOq0ual+Q23O39Qm1lJt2i0GF9Y9z1E1
	dloxhD+V2ezkmk2IZZi523svoj7q554i7FFM4xaemA==
X-Google-Smtp-Source: AGHT+IEpEL5PFdN564HKW6/HyU/QBa9Mzf05gb6Ow/rEFDjzTO9pLpfKtiyBgGC5zSQOsq7KWrrDoW8K0yerDOvg3tE=
X-Received: by 2002:a0d:d1c1:0:b0:5c8:cc4d:2aca with SMTP id
 t184-20020a0dd1c1000000b005c8cc4d2acamr3769625ywd.31.1701775040923; Tue, 05
 Dec 2023 03:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20231204075552.3585875-1-jens.wiklander@linaro.org> <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org>
In-Reply-To: <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 5 Dec 2023 12:17:09 +0100
Message-ID: <CAHUa44Fqxc2Doy=e6KzHUbUEeASuqMUwqZEeEVL=2oUWQwA0cw@mail.gmail.com>
Subject: Re: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest destroy
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thanks for the feedback. I'm answering the straightforward issues here
and saving the rest for the emerging thread.

On Mon, Dec 4, 2023 at 8:24=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
> Hi Jens,
>
> On 04/12/2023 07:55, Jens Wiklander wrote:
> > When an FF-A enabled guest is destroyed it may leave behind memory
> > shared with SPs. This memory must be reclaimed before it's reused or an
> > SP may make changes to memory used by a new unrelated guest. So when th=
e
> > domain is teared down add FF-A requests to reclaim all remaining shared
> > memory.
> >
> > SPs in the secure world are notified using VM_DESTROYED that a guest ha=
s
> > been destroyed. An SP is supposed to relinquish all shared memory to al=
low
> > reclaiming the memory. The relinquish operation may need to be delayed =
if
> > the shared memory is for instance part of a DMA operation.
> >
> > If the FF-A memory reclaim request fails, return -ERESTART to retry
> > again. This will effectively block the destruction of the guest until
> > all memory has been reclaimed.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > Hi,
> >
> > This patch is a bit crude, but gets the job done. In a well designed
> > system this might even be good enough since the SP or the secure world
> > will let the memory be reclaimed and we can move on. But, if for some
> > reason reclaiming the memory is refused it must not be possible to reus=
e
> > the memory.
>
> IIUC, we are trying to harden against a buggy SP. Is that correct?
>
> >
> > These shared memory ranges are typically quite small compared to the
> > total memory usage of a guest so it would be an improvement if only
> > refused shared memory ranges where set aside from future reuse while th=
e
> > guest was destroyed and other resources made available for reuse. This
> > could be done by for instance assign the refused shared memory ranges
> > to a dummy VM like DOMID_IO.
>
> I like the idea to use a dummy VM, but I don't think DOMID_IO is right.
> Once teardown has completed, the domain will stay around until the last
> reference on all pages are dropped. At this point, the amount of memory
> left-over is minimum (this is mostly bookeeping in Xen).
>
>  From the userland PoV, the domain will still show-up in the list but
> tools like "xl list" will show "(null)". They are called zombie domains.
>
> So I would consider to keep the same domain around. The advantage is you
> can call "xl destroy" again to retry the operation.
>
> >
> > Thanks,
> > Jens
> > ---
> >   xen/arch/arm/tee/ffa.c | 36 ++++++++++++++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 183528d13388..9c596462a8a2 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -1539,6 +1539,7 @@ static bool is_in_subscr_list(const uint16_t *sub=
scr, uint16_t start,
> >   static int ffa_domain_teardown(struct domain *d)
> >   {
> >       struct ffa_ctx *ctx =3D d->arch.tee;
> > +    struct ffa_shm_mem *shm, *tmp;
> >       unsigned int n;
> >       int32_t res;
> >
> > @@ -1564,10 +1565,45 @@ static int ffa_domain_teardown(struct domain *d=
)
> >               printk(XENLOG_ERR "ffa: Failed to report destruction of v=
m_id %u to  %u: res %d\n",
> >                      get_vm_id(d), subscr_vm_destroyed[n], res);
> >       }
> > +    /*
> > +     * If this function is called again due to -ERESTART below, make s=
ure
> > +     * not to send the FFA_MSG_SEND_VM_DESTROYED's.
> > +     */
> > +    subscr_vm_destroyed_count =3D 0;
>
> AFAICT, this variable is global. So wouldn't you effectively break other
> domain if let say the unmapping error is temporary?

You're right! I'll have to change this part a bit.

>
> >
> >       if ( ctx->rx )
> >           rxtx_unmap(ctx);
> >
> > +
> > +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> > +    {
> > +        register_t handle_hi;
> > +        register_t handle_lo;
> > +
> > +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> > +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
>
> Is this call expensive? If so, we may need to handle continuation here.
>
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_INFO, "ffa: Failed to reclaim handle %#lx : =
%d\n",
> > +                   shm->handle, res);
>
> I think you want to use XENLOG_G_INFO to use the guest ratelimit. Also,
> I would suggest to print the domain ID in the logs (see '%pd').

Thanks for the tip, I'll update accordingly here and at the other places.

>
>
> > +        }
> > +        else
> > +        {
> > +            printk(XENLOG_DEBUG, "ffa: Reclaimed handle %#lx\n", shm->=
handle);
>
> Same here. You want to use XENLOG_G_DEBUG and print the domain ID.
>
> > +            ctx->shm_count--;
> > +            list_del(&shm->list);
> > +        }
> > +    }
>
> NIT: New line here please for clarity.

OK

>
> > +    if ( !list_empty(&ctx->shm_list) )
> > +    {
> > +        printk(XENLOG_INFO, "ffa: Remaining unclaimed handles, retryin=
g\n");
>
> Same as the other printks.
>
> > +        /*
> > +         * TODO: add a timeout where we either panic or let the guest =
be
> > +         * fully destroyed.
> > +         */
> Timeout with proper handling would be a solution. I am not sure about
> panic-ing. Do you think the TEE would be in a bad state if we can't
> release memory?

No, that's not likely.

Thanks,
Jens

>
> > +        return -ERESTART;
> > +    }
> > +
> >       XFREE(d->arch.tee);
> >
> >       return 0;
>
> Cheers,
>
> --
> Julien Grall

