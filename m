Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF66A717C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 17:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504172.776747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPaD-0007HV-EP; Wed, 01 Mar 2023 16:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504172.776747; Wed, 01 Mar 2023 16:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXPaD-0007Em-B0; Wed, 01 Mar 2023 16:45:37 +0000
Received: by outflank-mailman (input) for mailman id 504172;
 Wed, 01 Mar 2023 16:45:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXPaB-0007Eg-BV
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 16:45:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c2067b2-b850-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 17:45:33 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so8243435wmc.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 08:45:34 -0800 (PST)
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
X-Inumbo-ID: 7c2067b2-b850-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MQAKXkGrb8E8NzL+w10fn1tljGDxzJj+8MRo/QNIceM=;
        b=aak7mtAh/IXes0UPMwxIc7YC4+sR6MFUa5Fm5CCDgQE6XRzf1CNi4sxQxEAF7OnHd5
         jICpWd1lb7YVc08QtStvGNd+uhRYksc80QKpskLhMujEc+Z5xZIbYMGrlE1X2eXVvtIM
         VCrekGv9jdENTpIhZdz60VYBD0GGhkt2IwjDbByAwI/c7txWJX76QUdLOj3v935LbnQ9
         xmxDqpes4a1jNwTtwYBTPrYNMb26j7loiEwgUyTL9hXGeVFQw3rq+bdfHjlJQSWbNUXi
         2lqmqZXB+mb67ZV0De081UwdoA7cd/GLeTgplmHlb9MipbXoOOPJmDCjDDa4HvdDRghT
         ZidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQAKXkGrb8E8NzL+w10fn1tljGDxzJj+8MRo/QNIceM=;
        b=XVR3xVchd/oA4W4ahBGFnft1o7pWP17aoB5sbJXgYoCwOINCGyr2tM+iwwugvqrgkg
         ZADQZsuep0rfwXcmQPANC84ycOH9xeB0SIBHfzBeHWhfeSc9g+H+rZkyca7H3cdjSs5T
         Hkv5BYa9O7JDEBj55EgpWmgn1vsSBBS9SEdLsfkvTvwcBF6y2QQSNUxok5jYUgKNzdIT
         PiRdKpcreFD943ts2ncpNN5i63rbqvgslfPvamkGRUgKCDCOuB1ZfKq0tHSz2Xh/bo5m
         HKXs7uUlwioXAJ2/1kaXTxni9Jm5tNrN5tV8Hbe43raCN8qXAP7uB9Dj2IWd1b/n/h7L
         pSgQ==
X-Gm-Message-State: AO0yUKUDJzNTwguN0yez7LV+Oc0WHG5MhaJaINQ9Lk2O3YpQ0bpI2SYt
	FO5twgM5GzB8Jz2+bmSgj4HCtUBRops8kGOWrtsUdA==
X-Google-Smtp-Source: AK7set+HcmjSn9wHn7ruFx7xlaQgLJXQJguUqCkeG8mzVkzUp+Ug/moGqn8SwcHCS+4QHbY57474gsf+Zx8GwzWJrIY=
X-Received: by 2002:a05:600c:444c:b0:3df:d8c9:caa7 with SMTP id
 v12-20020a05600c444c00b003dfd8c9caa7mr2022383wmn.4.1677689133387; Wed, 01 Mar
 2023 08:45:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
 <3DE2B127-8820-400A-86FC-3A38F40CADFD@arm.com> <CAHUa44EjD7mSE0DZShoRh9PAPVPWXL0gXUpi69s-2ktaMMSa8A@mail.gmail.com>
 <8D294745-AE0E-41B7-9B42-7C463AC77F93@arm.com>
In-Reply-To: <8D294745-AE0E-41B7-9B42-7C463AC77F93@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 17:45:22 +0100
Message-ID: <CAHUa44E45G7jh+LgFdF8EZ7E68MCjmXUyNK=z3QrW+Rx_hAwAA@mail.gmail.com>
Subject: Re: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure Partitions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Mar 1, 2023 at 1:58 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 1 Mar 2023, at 11:16, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Hi Bertrand,
> >
> > On Tue, Feb 28, 2023 at 5:49 PM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >>>
> >>> The FF-A specification defines framework messages sent as direct
> >>> requests when certain events occurs. For instance when a VM (guest) is
> >>> created or destroyed. Only SPs which have subscribed to these events
> >>> will receive them. An SP can subscribe to these messages in its
> >>> partition properties.
> >>>
> >>> Adds a check that the SP supports the needed FF-A features
> >>> FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
> >>>
> >>> The partition properties of each SP is retrieved with
> >>> FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
> >>> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> >>> caller (us), so once we're done with the buffer it must be released
> >>> using FFA_RX_RELEASE before another call can be made.
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/ffa.c | 191 ++++++++++++++++++++++++++++++++++++++++-
> >>> 1 file changed, 190 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index 07dd5c36d54b..f1b014b6c7f4 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -140,6 +140,14 @@
> >>> #define FFA_MSG_SEND                    0x8400006EU
> >>> #define FFA_MSG_POLL                    0x8400006AU
> >>>
> >>> +/* Partition information descriptor */
> >>> +struct ffa_partition_info_1_1 {
> >>> +    uint16_t id;
> >>> +    uint16_t execution_context;
> >>> +    uint32_t partition_properties;
> >>> +    uint8_t uuid[16];
> >>> +};
> >>> +
> >>> struct ffa_ctx {
> >>>    uint32_t guest_vers;
> >>>    bool interrupted;
> >>> @@ -148,6 +156,12 @@ struct ffa_ctx {
> >>> /* Negotiated FF-A version to use with the SPMC */
> >>> static uint32_t ffa_version __ro_after_init;
> >>>
> >>> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> >>> +static uint16_t *subscr_vm_created __read_mostly;
> >>> +static unsigned int subscr_vm_created_count __read_mostly;
> >>
> >> In the spec the number is returned in w2 so you should utse uint32_t here.
> >
> > I don't understand. This value is increased for each SP which has the
> > property set in the Partition information descriptor.
>
> Using generic types should be prevented when possible.

I'm usually of the opposite opinion, fixed width integers should only
be used when there's a good reason to do so. However, if this is the
Xen philosophy I can replace all those unsigned int with uint32_t if
that's preferable.

> Here this is a subset of the number of partition which is uint32_t (wX reg) so
> i think this would be the logical type for this.

The maximum number is actually UINT16_MAX so an observant reader might
wonder why the uint32_t type was used here.

>
> >
> >>
> >>> +static uint16_t *subscr_vm_destroyed __read_mostly;
> >>> +static unsigned int subscr_vm_destroyed_count __read_mostly;
> >>
> >> Same here
> >>
> >>> +
> >>> /*
> >>> * Our rx/tx buffers shared with the SPMC.
> >>> *
> >>> @@ -237,6 +251,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> >>>    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
> >>> }
> >>>
> >>> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> >>> +                                      uint32_t w4, uint32_t w5,
> >>> +                                      uint32_t *count)
> >>> +{
> >>> +    const struct arm_smccc_1_2_regs arg = {
> >>> +        .a0 = FFA_PARTITION_INFO_GET,
> >>> +        .a1 = w1,
> >>> +        .a2 = w2,
> >>> +        .a3 = w3,
> >>> +        .a4 = w4,
> >>> +        .a5 = w5,
> >>> +    };
> >>> +    struct arm_smccc_1_2_regs resp;
> >>> +    uint32_t ret;
> >>> +
> >>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>> +
> >>> +    ret = get_ffa_ret_code(&resp);
> >>> +    if ( !ret )
> >>> +        *count = resp.a2;
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +
> >>> +static int32_t ffa_rx_release(void)
> >>> +{
> >>> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> >>> +}
> >>> +
> >>> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> >>> +                                      uint8_t msg)
> >>
> >> This function is actually only useable to send framework created/destroyed
> >> messages so the function name should be adapted to be less generic.
> >>
> >> ffa_send_vm_events ?
> >>
> >> unless you want to modify it later to send more framework messages ?
> >
> > That was the plan, but that may never happen. I'll rename it to
> > ffa_send_vm_event() since we're only sending one event at a time.
> >
> >>
> >>> +{
> >>> +    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
> >>> +    int32_t res;
> >>> +
> >>> +    if ( msg == FFA_MSG_SEND_VM_CREATED )
> >>> +        exp_resp |= FFA_MSG_RESP_VM_CREATED;
> >>> +    else if ( msg == FFA_MSG_SEND_VM_DESTROYED )
> >>> +        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
> >>> +    else
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +    do {
> >>> +        const struct arm_smccc_1_2_regs arg = {
> >>> +            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
> >>> +            .a1 = sp_id,
> >>> +            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
> >>> +            .a5 = vm_id,
> >>> +        };
> >>> +        struct arm_smccc_1_2_regs resp;
> >>> +
> >>> +        arm_smccc_1_2_smc(&arg, &resp);
> >>> +        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
> >>> +        {
> >>> +            /*
> >>> +             * This is an invalid response, likely due to some error in the
> >>> +             * implementation of the ABI.
> >>> +             */
> >>> +            return FFA_RET_INVALID_PARAMETERS;
> >>> +        }
> >>> +        res = resp.a3;
> >>> +    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
> >>
> >> We might end up in an infinite loop here or increase interrupt response time.
> >> In the general case we could return that code directly to the VM but here we
> >> are in the VM creation/destroy path so we cannot do that.
> >>
> >> Maybe in debug mode at least we should have a retry counter here for now
> >> with a print ?
> >
> > OK, I'll add something.
> >
> >>
> >>> +
> >>> +    return res;
> >>> +}
> >>> +
> >>> static uint16_t get_vm_id(const struct domain *d)
> >>> {
> >>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
> >>> @@ -371,6 +451,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
> >>> static int ffa_domain_init(struct domain *d)
> >>> {
> >>>    struct ffa_ctx *ctx;
> >>> +    unsigned int n;
> >>> +    unsigned int m;
> >>> +    unsigned int c_pos;
> >>> +    int32_t res;
> >>>
> >>>     /*
> >>>      * We can't use that last possible domain ID or get_vm_id() would cause
> >>> @@ -383,24 +467,121 @@ static int ffa_domain_init(struct domain *d)
> >>>    if ( !ctx )
> >>>        return -ENOMEM;
> >>>
> >>> +    for ( n = 0; n < subscr_vm_created_count; n++ )
> >>> +    {
> >>> +        res = ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d),
> >>> +                                     FFA_MSG_SEND_VM_CREATED);
> >>> +        if ( res )
> >>> +        {
> >>> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
> >>> +                   get_vm_id(d), subscr_vm_created[n], res);
> >>
> >> in this function, get_vm_id(d) will not change so i would suggest to store it in a local variable
> >> instead of calling get_vm_id each time.
> >
> > OK
> >
> >>
> >>> +            c_pos = n;
> >>> +            goto err;
> >>> +        }
> >>> +    }
> >>> +
> >>>    d->arch.tee = ctx;
> >>>
> >>>    return 0;
> >>> +
> >>> +err:
> >>> +    /* Undo any already sent vm created messaged */
> >>> +    for ( n = 0; n < c_pos; n++ )
> >>> +        for ( m = 0; m < subscr_vm_destroyed_count; m++ )
> >>> +            if ( subscr_vm_destroyed[m] == subscr_vm_created[n] )
> >>> +                ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
> >>> +                                       FFA_MSG_SEND_VM_DESTROYED);
> >>> +
> >>> +    return -ENOMEM;
> >>
> >> The VM creation is not failing due to missing memory here.
> >> We need to find a better error code.
> >> Maybe ENOTCONN ?
> >> I am open to ideas here :-)
> >
> > That makes sense, I'll change it to ENOTCONN.
> >
> >>
> >>> }
> >>>
> >>> /* This function is supposed to undo what ffa_domain_init() has done */
> >>> static int ffa_relinquish_resources(struct domain *d)
> >>> {
> >>>    struct ffa_ctx *ctx = d->arch.tee;
> >>> +    unsigned int n;
> >>> +    int32_t res;
> >>>
> >>>    if ( !ctx )
> >>>        return 0;
> >>>
> >>> +    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
> >>> +    {
> >>> +        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
> >>> +                                     FFA_MSG_SEND_VM_DESTROYED);
> >>> +
> >>> +        if ( res )
> >>> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
> >>> +                   get_vm_id(d), subscr_vm_destroyed[n], res);
> >>> +    }
> >>> +
> >>>    XFREE(d->arch.tee);
> >>>
> >>>    return 0;
> >>> }
> >>>
> >>> +static bool init_subscribers(void)
> >>> +{
> >>> +    struct ffa_partition_info_1_1 *fpi;
> >>> +    bool ret = false;
> >>> +    uint32_t count;
> >>> +    int e;
> >>> +    uint32_t n;
> >>> +    uint32_t c_pos;
> >>> +    uint32_t d_pos;
> >>> +
> >>> +    if ( ffa_version < FFA_VERSION_1_1 )
> >>> +        return true;
> >>
> >> Correct me if i am wrong but on 1.0 version we cannot retrieve the count but
> >> we could do the slow path and do a first loop on info_get until we get an error ?
> >
> > Sending the events is not supported in 1.0 so there's nothing to
> > record in that case.
>
> Please add a comment here to say that subscribers are only supported after 1.1
> and also mention it in the commit message.

OK.

Thanks,
Jens

