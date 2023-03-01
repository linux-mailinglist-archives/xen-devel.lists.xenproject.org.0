Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07596A6AAE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 11:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503963.776402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJWI-0004FC-0j; Wed, 01 Mar 2023 10:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503963.776402; Wed, 01 Mar 2023 10:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXJWH-0004Ch-Rj; Wed, 01 Mar 2023 10:17:09 +0000
Received: by outflank-mailman (input) for mailman id 503963;
 Wed, 01 Mar 2023 10:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXJWG-0004Cb-2D
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 10:17:08 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3789f1ee-b81a-11ed-96a1-2f268f93b82a;
 Wed, 01 Mar 2023 11:17:06 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso7996695wmb.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 02:17:06 -0800 (PST)
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
X-Inumbo-ID: 3789f1ee-b81a-11ed-96a1-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFwYGV1i2T8g4dvTbYYdRQBR4RMnoU3QukbnaID6ycE=;
        b=DdYX02G0YLJPU70zxglgeQl2A2Looq6gdLydky4c972HyKmPTfMOhSs5plGNtP13ga
         MfVNMmoQsoohfJP50yRZlKW43fCWsklVI1bFs24LMVrFeyCwEHl61exWCVj5sYIIxtG8
         9e9jVH19yEaXnCyaXuxs1t5STbmf80SO6SonzPurpNqDUubRHwp9x95QYS1mN9dAJQxc
         QIn1U/VM+qshs0Vsjp9TK6zI/OIZlv/d7mb/19tg2QsnxM/WrGsUDVKKRHXLOll2jnJJ
         Qx0k1ntCeSljKXu9K55MF7xNRevQS/Isb89tEhoAvOPUj9bABaCo92VzfBGqLCpmBcbk
         4mQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFwYGV1i2T8g4dvTbYYdRQBR4RMnoU3QukbnaID6ycE=;
        b=MPl+YGZaqp0FJgQmOyQ/s5iZNJd12z/LlT0uCKWVl+47LRnV+LzY7jA8FNy07NWqmi
         I8KqOHD3g0AggM1kB/fLks3/G4KZgAhKVoEhQ+f8bo30PTgYpX7UvpMr799i8lyQIIDB
         qZ5ErIK6iFMB4RYC/6b8DDFWyr9OhA1nhzLsac3Oy3gsK1dgyKda7KLjUSY+CXwdZfkD
         s/e9eP+R7epiZwa6Rkam/7LGTVDRDzqo+3fJwQArhHYUjdVMiVpZC3bMTpsb6QR2bTGL
         K9f3uEvmeCrg5jRgETLfYpctn5L9N1wIsm7qhKXnhOT+e/LJwxr1+QBYhk07XjZ35oqe
         MXgw==
X-Gm-Message-State: AO0yUKVYdgp1T4cfCiMBuWAWC32mrsSDLZkOKiMuleRGzI3T1D2cJ5xg
	Z0h0fLwMdvjvKQV9tTdxNmpWGVRjKgPObpMfKAs0LQ==
X-Google-Smtp-Source: AK7set9Ih5leR2XAoFPhJP9xFBZPI8OYUq2ku/3Nx/7x/brbRTLwqQu6N+THQuhrg25Z76pXsH8vZmMtHjoitI2pcYI=
X-Received: by 2002:a05:600c:474f:b0:3df:97c0:1b4 with SMTP id
 w15-20020a05600c474f00b003df97c001b4mr1641618wmo.4.1677665825289; Wed, 01 Mar
 2023 02:17:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <cfd9ae67bdf24bee796b418937dd1486018fd188.1677079672.git.jens.wiklander@linaro.org>
 <3DE2B127-8820-400A-86FC-3A38F40CADFD@arm.com>
In-Reply-To: <3DE2B127-8820-400A-86FC-3A38F40CADFD@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 11:16:54 +0100
Message-ID: <CAHUa44EjD7mSE0DZShoRh9PAPVPWXL0gXUpi69s-2ktaMMSa8A@mail.gmail.com>
Subject: Re: [XEN PATCH v7 12/20] xen/arm: ffa: send guest events to Secure Partitions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Tue, Feb 28, 2023 at 5:49 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > The FF-A specification defines framework messages sent as direct
> > requests when certain events occurs. For instance when a VM (guest) is
> > created or destroyed. Only SPs which have subscribed to these events
> > will receive them. An SP can subscribe to these messages in its
> > partition properties.
> >
> > Adds a check that the SP supports the needed FF-A features
> > FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
> >
> > The partition properties of each SP is retrieved with
> > FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
> > Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> > caller (us), so once we're done with the buffer it must be released
> > using FFA_RX_RELEASE before another call can be made.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 191 ++++++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 190 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 07dd5c36d54b..f1b014b6c7f4 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -140,6 +140,14 @@
> > #define FFA_MSG_SEND                    0x8400006EU
> > #define FFA_MSG_POLL                    0x8400006AU
> >
> > +/* Partition information descriptor */
> > +struct ffa_partition_info_1_1 {
> > +    uint16_t id;
> > +    uint16_t execution_context;
> > +    uint32_t partition_properties;
> > +    uint8_t uuid[16];
> > +};
> > +
> > struct ffa_ctx {
> >     uint32_t guest_vers;
> >     bool interrupted;
> > @@ -148,6 +156,12 @@ struct ffa_ctx {
> > /* Negotiated FF-A version to use with the SPMC */
> > static uint32_t ffa_version __ro_after_init;
> >
> > +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> > +static uint16_t *subscr_vm_created __read_mostly;
> > +static unsigned int subscr_vm_created_count __read_mostly;
>
> In the spec the number is returned in w2 so you should utse uint32_t here.

I don't understand. This value is increased for each SP which has the
property set in the Partition information descriptor.

>
> > +static uint16_t *subscr_vm_destroyed __read_mostly;
> > +static unsigned int subscr_vm_destroyed_count __read_mostly;
>
> Same here
>
> > +
> > /*
> >  * Our rx/tx buffers shared with the SPMC.
> >  *
> > @@ -237,6 +251,72 @@ static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> >     return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
> > }
> >
> > +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t w3,
> > +                                      uint32_t w4, uint32_t w5,
> > +                                      uint32_t *count)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_PARTITION_INFO_GET,
> > +        .a1 = w1,
> > +        .a2 = w2,
> > +        .a3 = w3,
> > +        .a4 = w4,
> > +        .a5 = w5,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +    uint32_t ret;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    ret = get_ffa_ret_code(&resp);
> > +    if ( !ret )
> > +        *count = resp.a2;
> > +
> > +    return ret;
> > +}
> > +
> > +static int32_t ffa_rx_release(void)
> > +{
> > +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> > +}
> > +
> > +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> > +                                      uint8_t msg)
>
> This function is actually only useable to send framework created/destroyed
> messages so the function name should be adapted to be less generic.
>
> ffa_send_vm_events ?
>
> unless you want to modify it later to send more framework messages ?

That was the plan, but that may never happen. I'll rename it to
ffa_send_vm_event() since we're only sending one event at a time.

>
> > +{
> > +    uint32_t exp_resp = FFA_MSG_FLAG_FRAMEWORK;
> > +    int32_t res;
> > +
> > +    if ( msg == FFA_MSG_SEND_VM_CREATED )
> > +        exp_resp |= FFA_MSG_RESP_VM_CREATED;
> > +    else if ( msg == FFA_MSG_SEND_VM_DESTROYED )
> > +        exp_resp |= FFA_MSG_RESP_VM_DESTROYED;
> > +    else
> > +        return FFA_RET_INVALID_PARAMETERS;
> > +
> > +    do {
> > +        const struct arm_smccc_1_2_regs arg = {
> > +            .a0 = FFA_MSG_SEND_DIRECT_REQ_32,
> > +            .a1 = sp_id,
> > +            .a2 = FFA_MSG_FLAG_FRAMEWORK | msg,
> > +            .a5 = vm_id,
> > +        };
> > +        struct arm_smccc_1_2_regs resp;
> > +
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +        if ( resp.a0 != FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 != exp_resp )
> > +        {
> > +            /*
> > +             * This is an invalid response, likely due to some error in the
> > +             * implementation of the ABI.
> > +             */
> > +            return FFA_RET_INVALID_PARAMETERS;
> > +        }
> > +        res = resp.a3;
> > +    } while ( res == FFA_RET_INTERRUPTED || res == FFA_RET_RETRY );
>
> We might end up in an infinite loop here or increase interrupt response time.
> In the general case we could return that code directly to the VM but here we
> are in the VM creation/destroy path so we cannot do that.
>
> Maybe in debug mode at least we should have a retry counter here for now
> with a print ?

OK, I'll add something.

>
> > +
> > +    return res;
> > +}
> > +
> > static uint16_t get_vm_id(const struct domain *d)
> > {
> >     /* +1 since 0 is reserved for the hypervisor in FF-A */
> > @@ -371,6 +451,10 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
> > static int ffa_domain_init(struct domain *d)
> > {
> >     struct ffa_ctx *ctx;
> > +    unsigned int n;
> > +    unsigned int m;
> > +    unsigned int c_pos;
> > +    int32_t res;
> >
> >      /*
> >       * We can't use that last possible domain ID or get_vm_id() would cause
> > @@ -383,24 +467,121 @@ static int ffa_domain_init(struct domain *d)
> >     if ( !ctx )
> >         return -ENOMEM;
> >
> > +    for ( n = 0; n < subscr_vm_created_count; n++ )
> > +    {
> > +        res = ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d),
> > +                                     FFA_MSG_SEND_VM_CREATED);
> > +        if ( res )
> > +        {
> > +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
> > +                   get_vm_id(d), subscr_vm_created[n], res);
>
> in this function, get_vm_id(d) will not change so i would suggest to store it in a local variable
> instead of calling get_vm_id each time.

OK

>
> > +            c_pos = n;
> > +            goto err;
> > +        }
> > +    }
> > +
> >     d->arch.tee = ctx;
> >
> >     return 0;
> > +
> > +err:
> > +    /* Undo any already sent vm created messaged */
> > +    for ( n = 0; n < c_pos; n++ )
> > +        for ( m = 0; m < subscr_vm_destroyed_count; m++ )
> > +            if ( subscr_vm_destroyed[m] == subscr_vm_created[n] )
> > +                ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
> > +                                       FFA_MSG_SEND_VM_DESTROYED);
> > +
> > +    return -ENOMEM;
>
> The VM creation is not failing due to missing memory here.
> We need to find a better error code.
> Maybe ENOTCONN ?
> I am open to ideas here :-)

That makes sense, I'll change it to ENOTCONN.

>
> > }
> >
> > /* This function is supposed to undo what ffa_domain_init() has done */
> > static int ffa_relinquish_resources(struct domain *d)
> > {
> >     struct ffa_ctx *ctx = d->arch.tee;
> > +    unsigned int n;
> > +    int32_t res;
> >
> >     if ( !ctx )
> >         return 0;
> >
> > +    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
> > +    {
> > +        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id(d),
> > +                                     FFA_MSG_SEND_VM_DESTROYED);
> > +
> > +        if ( res )
> > +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_id %u to  %u: res %d\n",
> > +                   get_vm_id(d), subscr_vm_destroyed[n], res);
> > +    }
> > +
> >     XFREE(d->arch.tee);
> >
> >     return 0;
> > }
> >
> > +static bool init_subscribers(void)
> > +{
> > +    struct ffa_partition_info_1_1 *fpi;
> > +    bool ret = false;
> > +    uint32_t count;
> > +    int e;
> > +    uint32_t n;
> > +    uint32_t c_pos;
> > +    uint32_t d_pos;
> > +
> > +    if ( ffa_version < FFA_VERSION_1_1 )
> > +        return true;
>
> Correct me if i am wrong but on 1.0 version we cannot retrieve the count but
> we could do the slow path and do a first loop on info_get until we get an error ?

Sending the events is not supported in 1.0 so there's nothing to
record in that case.

Thanks,
Jens

>
> > +
> > +    e = ffa_partition_info_get(0, 0, 0, 0, 0, &count);
> > +    if ( e )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> > +        goto out;
> > +    }
> > +
> > +    fpi = ffa_rx;
> > +    subscr_vm_created_count = 0;
> > +    subscr_vm_destroyed_count = 0;
> > +    for ( n = 0; n < count; n++ )
> > +    {
> > +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> > +            subscr_vm_created_count++;
> > +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> > +            subscr_vm_destroyed_count++;
> > +    }
> > +
> > +    if ( subscr_vm_created_count )
> > +        subscr_vm_created = xzalloc_array(uint16_t, subscr_vm_created_count);
> > +    if ( subscr_vm_destroyed_count )
> > +        subscr_vm_destroyed = xzalloc_array(uint16_t,
> > +                                            subscr_vm_destroyed_count);
> > +    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> > +         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n");
> > +        subscr_vm_created_count = 0;
> > +        subscr_vm_destroyed_count = 0;
> > +        XFREE(subscr_vm_created);
> > +        XFREE(subscr_vm_destroyed);
> > +        goto out;
> > +    }
> > +
> > +    for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
> > +    {
> > +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> > +            subscr_vm_created[c_pos++] = fpi[n].id;
> > +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
> > +            subscr_vm_destroyed[d_pos++] = fpi[n].id;
> > +    }
> > +
> > +    ret = true;
> > +out:
> > +    ffa_rx_release();
> > +
> > +    return ret;
> > +}
> > +
> > static bool ffa_probe(void)
> > {
> >     uint32_t vers;
> > @@ -447,7 +628,8 @@ static bool ffa_probe(void)
> >     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >            major_vers, minor_vers);
> >
> > -    if (
> > +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> > +         !check_mandatory_feature(FFA_RX_RELEASE) ||
> > #ifdef CONFIG_ARM_64
> >          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> > #endif
> > @@ -475,6 +657,9 @@ static bool ffa_probe(void)
> >     ffa_page_count = 1;
> >     ffa_version = vers;
> >
> > +    if ( !init_subscribers() )
> > +        goto err_free_ffa_tx;
> > +
> >     return true;
> >
> > err_free_ffa_tx:
> > @@ -485,6 +670,10 @@ err_free_ffa_rx:
> >     ffa_rx = NULL;
> >     ffa_page_count = 0;
> >     ffa_version = 0;
> > +    XFREE(subscr_vm_created);
> > +    subscr_vm_created_count = 0;
> > +    XFREE(subscr_vm_destroyed);
> > +    subscr_vm_destroyed_count = 0;
> >
> >     return false;
> > }
> > --
> > 2.34.1
> >
>
> Cheers
> Bertrand
>
>

