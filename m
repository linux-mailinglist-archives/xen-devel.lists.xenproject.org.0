Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD0805337
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:42:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647680.1011183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAToc-0007O8-Sp; Tue, 05 Dec 2023 11:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647680.1011183; Tue, 05 Dec 2023 11:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAToc-0007LK-Q1; Tue, 05 Dec 2023 11:42:14 +0000
Received: by outflank-mailman (input) for mailman id 647680;
 Tue, 05 Dec 2023 11:42:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6bfq=HQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rATob-0007LE-SC
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:42:13 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5397dc23-9363-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 12:42:11 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-77f04969d2eso176812285a.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 03:42:11 -0800 (PST)
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
X-Inumbo-ID: 5397dc23-9363-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701776530; x=1702381330; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXxtA6ZxbQLZB9JWDZXA4b6fiXxGvPDU1q2MsDgqlac=;
        b=AC5SQC1zSbb3ibAgWEwuRiWTgmT389lZEbMQvoTJYruqpqrMFMqtWtMypaNKkuRN1d
         YmBcH+v/H7I5UuOZA4tiHZtbkVcO49syHwqzfdZ5QhLTcnim3FDMrn22MgHkRGcszFg8
         6M8TXnIYFI+7KVGj0+ichVjkgyYAAzoM72h50lWVS4+IYP1+MoGAwwzFUcjEIJdkmQpA
         HYsFoAh7x5MK0GJed9G82PvmG6fierGttwf+McbH95v+lVF+PVlzYvvIJWxKkkAXpNm3
         TfuMHGNa+VkvD1CBICxJsdNR2HlJU1fhT1OPrchz+Z8x0S4uJd13ZngPckU/3XREeXhT
         o0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776530; x=1702381330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXxtA6ZxbQLZB9JWDZXA4b6fiXxGvPDU1q2MsDgqlac=;
        b=WQRLMh7A0yj3B7oQfN2+tCepVh/Fj+bfrzq7nBUSfYxgG2mmkxgOK8MHrPGR9F2JVK
         smQUWbNkSDbmGFGxK5x5crMX0QQT71WBsP1+qkjk8QufK5IovCkCM1pGTgDUa5yQgZSx
         9NSyGmAUBaVgKgQ7BF7ipn7ZnYm4mzePUKy54M/tx5hHtpBDzgEeaSTP17zPjQ4UYXBp
         BYtDo7RfD0eUnDczsnEgNXZZrCGPCD81PpDJOJjdUPdtmXu43Ex4zzQrW+kSqr5QrXbS
         i76KNpjgQDrqarlZ96jtLGLhnsm9Q4k+IdmFT3JZ5ZiKe4LuhbYUcC9er9xQctsfm8rT
         bMGw==
X-Gm-Message-State: AOJu0YxIvyEEqW0WEUTg8YizB/v3zTYok3KyVntbqqqrDYs92eliG9MD
	vmMJBphdnFT9JXeyXAThbG2fAauDIkjfHHYxPhO5kxlVe2v6sBIZaNU=
X-Google-Smtp-Source: AGHT+IFh4KJJ/A0VaYCd5raQyYnOc9AhZUofYotIimGSUBCDT6Wcw1XUsmANbouhx21CNPsRnJ6BwQvwIvqCIg51Oy8=
X-Received: by 2002:ad4:4482:0:b0:67a:b592:458c with SMTP id
 m2-20020ad44482000000b0067ab592458cmr1132711qvt.9.1701776530378; Tue, 05 Dec
 2023 03:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20231204075552.3585875-1-jens.wiklander@linaro.org>
 <232c2496-77d6-4e37-a400-dbefd135ef3c@xen.org> <0B35D609-5378-4180-B79E-0CAE69D42165@arm.com>
In-Reply-To: <0B35D609-5378-4180-B79E-0CAE69D42165@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 5 Dec 2023 12:41:59 +0100
Message-ID: <CAHUa44GGU5WWBeOAF3S3+N8vkCNC3ZraGC_E9__EJhh0nAi2hA@mail.gmail.com>
Subject: Re: [RFC XEN PATCH] xen/arm: ffa: reclaim shared memory on guest destroy
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 5, 2023 at 9:14=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Julien,
>
> Thanks a lot for your review and comment, this is very helpful.
>
> > On 4 Dec 2023, at 20:24, Julien Grall <julien@xen.org> wrote:
> >
> > Hi Jens,
> >
> > On 04/12/2023 07:55, Jens Wiklander wrote:
> >> When an FF-A enabled guest is destroyed it may leave behind memory
> >> shared with SPs. This memory must be reclaimed before it's reused or a=
n
> >> SP may make changes to memory used by a new unrelated guest. So when t=
he
> >> domain is teared down add FF-A requests to reclaim all remaining share=
d
> >> memory.
> >> SPs in the secure world are notified using VM_DESTROYED that a guest h=
as
> >> been destroyed. An SP is supposed to relinquish all shared memory to a=
llow
> >> reclaiming the memory. The relinquish operation may need to be delayed=
 if
> >> the shared memory is for instance part of a DMA operation.
> >> If the FF-A memory reclaim request fails, return -ERESTART to retry
> >> again. This will effectively block the destruction of the guest until
> >> all memory has been reclaimed.
> >> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >> ---
> >> Hi,
> >> This patch is a bit crude, but gets the job done. In a well designed
> >> system this might even be good enough since the SP or the secure world
> >> will let the memory be reclaimed and we can move on. But, if for some
> >> reason reclaiming the memory is refused it must not be possible to reu=
se
> >> the memory.
> >
> > IIUC, we are trying to harden against a buggy SP. Is that correct?
>
> This is not hardening as this is a possible scenario with a correctly imp=
lemented SP.
> This is valid for the SP to not be able to relinquish the memory directly=
 so we have
> to take this possibility into account and retry.
>
> What is not expected if for the SP to never release the memory hence the =
possible
> "todo" at the end of the code where i think we might have to implement a =
counter
> to bound the possible number of loops but as always the question is how m=
any...
>
> In this case the only solution would be to park the memory as suggested a=
fter
> but we are not completely sure where hence the RFC.
>
> >
> >> These shared memory ranges are typically quite small compared to the
> >> total memory usage of a guest so it would be an improvement if only
> >> refused shared memory ranges where set aside from future reuse while t=
he
> >> guest was destroyed and other resources made available for reuse. This
> >> could be done by for instance assign the refused shared memory ranges
> >> to a dummy VM like DOMID_IO.
> >
> > I like the idea to use a dummy VM, but I don't think DOMID_IO is right.=
 Once teardown has completed, the domain will stay around until the last re=
ference on all pages are dropped. At this point, the amount of memory left-=
over is minimum (this is mostly bookeeping in Xen).
> >
> > From the userland PoV, the domain will still show-up in the list but to=
ols like "xl list" will show "(null)". They are called zombie domains.
> >
> > So I would consider to keep the same domain around. The advantage is yo=
u can call "xl destroy" again to retry the operation.
>
> In this scenario the "restart" implementation here is right but how could=
 we park the VM as "zombie" instead of busy looping in
> the "kill" loop of userland ?
>
> Also we need to release all the memory of the VM but the one shared with =
the SP.
>
> I will let Jens answer the more implementation questions here after and t=
ry to help on the more "system" ones.
>
> >
> >> Thanks,
> >> Jens
> >> ---
> >>  xen/arch/arm/tee/ffa.c | 36 ++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 36 insertions(+)
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 183528d13388..9c596462a8a2 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -1539,6 +1539,7 @@ static bool is_in_subscr_list(const uint16_t *su=
bscr, uint16_t start,
> >>  static int ffa_domain_teardown(struct domain *d)
> >>  {
> >>      struct ffa_ctx *ctx =3D d->arch.tee;
> >> +    struct ffa_shm_mem *shm, *tmp;
> >>      unsigned int n;
> >>      int32_t res;
> >>  @@ -1564,10 +1565,45 @@ static int ffa_domain_teardown(struct domain =
*d)
> >>              printk(XENLOG_ERR "ffa: Failed to report destruction of v=
m_id %u to  %u: res %d\n",
> >>                     get_vm_id(d), subscr_vm_destroyed[n], res);
> >>      }
> >> +    /*
> >> +     * If this function is called again due to -ERESTART below, make =
sure
> >> +     * not to send the FFA_MSG_SEND_VM_DESTROYED's.
> >> +     */
> >> +    subscr_vm_destroyed_count =3D 0;
> >
> > AFAICT, this variable is global. So wouldn't you effectively break othe=
r domain if let say the unmapping error is temporary?
> >
> >>        if ( ctx->rx )
> >>          rxtx_unmap(ctx);
> >>  +
> >> +    list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
> >> +    {
> >> +        register_t handle_hi;
> >> +        register_t handle_lo;
> >> +
> >> +        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> >> +        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> >
> > Is this call expensive? If so, we may need to handle continuation here.
>
> This call should not be expensive in the normal case as memory is reclaim=
able
> so there is no processing required in the SP and all is done in the SPMC =
which
> should basically just return a yes or no depending on a state for the han=
dle.

I agree, this should only be a thing between the hypervisor and the
SPMC in the secure world.

>
> So I think this is the best trade.
>
> @Jens: One thing to consider is that a Destroy might get a retry or busy =
answer and we
> will have to issue it again and this is not considered in the current imp=
lementation.

You're right, we'll need to keep track of which SPs we've been able to
send a VM_DESTROY message to.

>
> After discussing the subject internally we could in fact consider that if=
 an SP cannot release
> some memory shared with the VM destroyed, it should tell it by returning =
"retry" to the message.
> Here that could simplify things by doing a strategy where:
> - we retry on the VM_DESTROY message if required

We should keep a record of which SPs remain to be signaled with
VM_DESTROY. An SP may have other reasons to return an error so this
call can be retried later.

> - if some memory is not reclaimable we check if we could park it and make=
 the VM a zombie.
> What do you think ?

The zombie option sounds like a good fallback when automatic reclaim
(reasonable timeouts have expired etc) has failed.

Thanks,
Jens

>
>
> >
> >> +        if ( res )
> >> +        {
> >> +            printk(XENLOG_INFO, "ffa: Failed to reclaim handle %#lx :=
 %d\n",
> >> +                   shm->handle, res);
> >
> > I think you want to use XENLOG_G_INFO to use the guest ratelimit. Also,=
 I would suggest to print the domain ID in the logs (see '%pd').
> >
> >
> >> +        }
> >> +        else
> >> +        {
> >> +            printk(XENLOG_DEBUG, "ffa: Reclaimed handle %#lx\n", shm-=
>handle);
> >
> > Same here. You want to use XENLOG_G_DEBUG and print the domain ID.
> >
> >> +            ctx->shm_count--;
> >> +            list_del(&shm->list);
> >> +        }
> >> +    }
> >
> > NIT: New line here please for clarity.
> >
> >> +    if ( !list_empty(&ctx->shm_list) )
> >> +    {
> >> +        printk(XENLOG_INFO, "ffa: Remaining unclaimed handles, retryi=
ng\n");
> >
> > Same as the other printks.
> >
> >> +        /*
> >> +         * TODO: add a timeout where we either panic or let the guest=
 be
> >> +         * fully destroyed.
> >> +         */
> > Timeout with proper handling would be a solution. I am not sure about p=
anic-ing. Do you think the TEE would be in a bad state if we can't release =
memory?
> >
> >> +        return -ERESTART;
> >> +    }
> >> +
> >>      XFREE(d->arch.tee);
> >>        return 0;
> >
> > Cheers,
> >
>
> Cheers
> Bertrand
>
> > --
> > Julien Grall
>
>

