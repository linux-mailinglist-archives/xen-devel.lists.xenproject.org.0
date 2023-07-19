Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F717591C7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 11:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565699.884076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3eU-0008Qw-OX; Wed, 19 Jul 2023 09:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565699.884076; Wed, 19 Jul 2023 09:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM3eU-0008OS-Ls; Wed, 19 Jul 2023 09:39:22 +0000
Received: by outflank-mailman (input) for mailman id 565699;
 Wed, 19 Jul 2023 09:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8L3=DF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qM3eT-0008OK-1o
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 09:39:21 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2184fe1b-2618-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 11:39:18 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-635e107642fso2723216d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 02:39:18 -0700 (PDT)
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
X-Inumbo-ID: 2184fe1b-2618-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689759557; x=1690364357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJM/SKcUHpfyPcOx8o5Myl7kYtFtGW9aQGUS6b6Xx/s=;
        b=qRnj8zEij7rDyFyoZMMp7tC9ZzzWCqx/OVcpjRcF4ARCN47W2UHsihBCqUqeC1+43T
         pJElYRGaakm6EGT6zybZ1xH0Q4562Grm1rdsW3V89fPtE+lwAnPEcDH6WnarZ/Wt7s7e
         8p+ehqysD5MqbdjrGXJtw6hLfljsNYWCgHgsFnFhLjIFFBg3ydQgC9jVrXbrg4zONmDQ
         WfnEMhnYqFkNDluT5jp2FuYRT6KN3uhAuADREOa68sLT+NeahWaGhBs0GMWMS/Qj61Jr
         Ic+QcaDWvo/RmgPAlz1lTiTMbdk22zP56phMJonRLxpKEUnPG0Gncjo25o/8XpZ6M4rc
         wDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689759557; x=1690364357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJM/SKcUHpfyPcOx8o5Myl7kYtFtGW9aQGUS6b6Xx/s=;
        b=hNhKTOpKp/hTqiauDm0CZGlxib9WtBlFEBWgv+euCLqZHn6WaRdj/oDxVsrXUll6SN
         CdXQT8dpd37VidZ68hXJcw2Z2KlltVlenUdbAikj+NeDxtm5bV2qDxMQWk8IpMZyC35H
         CYj0WYHLnB+fycOlQHTZ8PngIhymZcOW3L8x1UD797lLrBFOzvCK4m4a7IXkRmd/jcXN
         qyhLXa+tT++eUUkLMkI0+iYu1DWSnnLDChtKXclgiNjc1OC+uhvGAJRbudQ0CS34BDrl
         LebktXoS2gpvs9iJL/1Rj+pOk6Sm2QqyjjnjH8cbH25PpaDinJnx7pfSZ5L/uRYl3zA/
         1v8A==
X-Gm-Message-State: ABy/qLYCa/zEK1l5aPcc4ZHDRz+sYcMYmQ7sOA9r5f96w3uRrXNRf26z
	eime86yzqH0HZGBe488Bk/3ruGkJY/TdFmwWNfVZiA==
X-Google-Smtp-Source: APBJJlEiKP9MObG7n1w9BoDI1g4amd5IhDf4mIy1HFw3Kp6HQkQMxKk6LEMOJAngfiE7K6i/R/uxx+p//+W7NZTtkSY=
X-Received: by 2002:ad4:5cc7:0:b0:636:695:c84c with SMTP id
 iu7-20020ad45cc7000000b006360695c84cmr2244627qvb.20.1689759557315; Wed, 19
 Jul 2023 02:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-13-jens.wiklander@linaro.org> <98D9585F-AE4B-4AC2-9D3B-BAF5590C0DD7@arm.com>
 <CAHUa44HXORpP-vezd849Sv0FzvKq9kqcEMh9f98DZnNFtzNFyg@mail.gmail.com> <413E8FFB-E49A-470C-813D-A84A3EFE0EF2@arm.com>
In-Reply-To: <413E8FFB-E49A-470C-813D-A84A3EFE0EF2@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Jul 2023 11:39:06 +0200
Message-ID: <CAHUa44HBQXRwQKfu1iHFx3W+dZZNKAZBypDDRr9ycz8OUDUwjw@mail.gmail.com>
Subject: Re: [XEN PATCH v10 12/24] xen/arm: ffa: send guest events to Secure Partitions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 19, 2023 at 11:19=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 19 Jul 2023, at 10:27, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Tue, Jul 18, 2023 at 12:05=E2=80=AFPM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >>>
> >>> The FF-A specification defines framework messages sent as direct
> >>> requests when certain events occurs. For instance when a VM (guest) i=
s
> >>> created or destroyed. Only SPs which have subscribed to these events
> >>> will receive them. An SP can subscribe to these messages in its
> >>> partition properties.
> >>>
> >>> Adds a check that the SP supports the needed FF-A features
> >>> FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
> >>>
> >>> The partition properties of each SP is retrieved with
> >>> FFA_PARTITION_INFO_GET which returns the information in our RX buffer=
.
> >>> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to th=
e
> >>> caller (us), so once we're done with the buffer it must be released
> >>> using FFA_RX_RELEASE before another call can be made.
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/ffa.c | 233 ++++++++++++++++++++++++++++++++++++++++=
-
> >>> 1 file changed, 231 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index f8ccaabc568d..d755363de686 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -160,14 +160,33 @@
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
> >>>    /* FF-A version used by the guest */
> >>>    uint32_t guest_vers;
> >>> +    /*
> >>> +     * Number of SPs that we have sent a VM created signal to, used =
in
> >>> +     * ffa_domain_teardown() to know which SPs need to be signalled.
> >>> +     */
> >>> +    uint16_t create_signal_count;
> >>> };
> >>>
> >>> /* Negotiated FF-A version to use with the SPMC */
> >>> static uint32_t __ro_after_init ffa_version;
> >>>
> >>> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> >>> +static uint16_t *subscr_vm_created __read_mostly;
> >>> +static uint16_t subscr_vm_created_count __read_mostly;
> >>> +static uint16_t *subscr_vm_destroyed __read_mostly;
> >>> +static uint16_t subscr_vm_destroyed_count __read_mostly;
> >>> +
> >>> /*
> >>> * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> >>> * number of pages used in each of these buffers.
> >>> @@ -251,6 +270,87 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, pad=
dr_t rx_addr,
> >>>    return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_cou=
nt, 0);
> >>> }
> >>>
> >>> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint=
32_t w3,
> >>> +                                      uint32_t w4, uint32_t w5,
> >>> +                                      uint32_t *count)
> >>> +{
> >>> +    const struct arm_smccc_1_2_regs arg =3D {
> >>> +        .a0 =3D FFA_PARTITION_INFO_GET,
> >>> +        .a1 =3D w1,
> >>> +        .a2 =3D w2,
> >>> +        .a3 =3D w3,
> >>> +        .a4 =3D w4,
> >>> +        .a5 =3D w5,
> >>> +    };
> >>> +    struct arm_smccc_1_2_regs resp;
> >>> +    uint32_t ret;
> >>> +
> >>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>> +
> >>> +    ret =3D get_ffa_ret_code(&resp);
> >>> +    if ( !ret )
> >>> +        *count =3D resp.a2;
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +
> >>> +static int32_t ffa_rx_release(void)
> >>> +{
> >>> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> >>> +}
> >>> +
> >>> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id=
,
> >>> +                                      uint8_t msg)
> >>> +{
> >>> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> >>> +    unsigned int retry_count =3D 0;
> >>> +    int32_t res;
> >>> +
> >>> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> >>> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> >>> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> >>> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> >>> +    else
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +    do {
> >>> +        const struct arm_smccc_1_2_regs arg =3D {
> >>> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> >>> +            .a1 =3D sp_id,
> >>> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> >>> +            .a5 =3D vm_id,
> >>> +        };
> >>> +        struct arm_smccc_1_2_regs resp;
> >>> +
> >>> +        arm_smccc_1_2_smc(&arg, &resp);
> >>> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=
=3D exp_resp )
> >>> +        {
> >>> +            /*
> >>> +             * This is an invalid response, likely due to some error=
 in the
> >>> +             * implementation of the ABI.
> >>> +             */
> >>> +            return FFA_RET_INVALID_PARAMETERS;
> >>> +        }
> >>> +        res =3D resp.a3;
> >>> +        if ( ++retry_count > 10 )
> >>> +        {
> >>> +            /*
> >>> +             * TODO
> >>> +             * FFA_RET_INTERRUPTED means that the SPMC has a pending
> >>> +             * non-secure interrupt, we need a way of delivering tha=
t
> >>> +             * non-secure interrupt.
> >>> +             * FFA_RET_RETRY is the SP telling us that it's temporar=
ily
> >>> +             * blocked from handling the direct request, we need a g=
eneric
> >>> +             * way to deal with this.
> >>> +             * For now in both cases, give up after a few retries.
> >>> +             */
> >>> +            return res;
> >>> +        }
> >>> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_R=
ETRY );
> >>> +
> >>> +    return res;
> >>> +}
> >>> +
> >>> static uint16_t get_vm_id(const struct domain *d)
> >>> {
> >>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
> >>> @@ -374,6 +474,8 @@ static bool ffa_handle_call(struct cpu_user_regs =
*regs)
> >>> static int ffa_domain_init(struct domain *d)
> >>> {
> >>>    struct ffa_ctx *ctx;
> >>> +    unsigned int n;
> >>> +    int32_t res;
> >>>
> >>>    if ( !ffa_version )
> >>>        return -ENODEV;
> >>> @@ -387,20 +489,68 @@ static int ffa_domain_init(struct domain *d)
> >>>    ctx =3D xzalloc(struct ffa_ctx);
> >>>    if ( !ctx )
> >>>        return -ENOMEM;
> >>> -
> >>
> >> This line removal does not seem to be intended.
> >
> > Right, I'll restore it.
> >
> >>
> >>>    d->arch.tee =3D ctx;
> >>>
> >>> +    for ( n =3D 0; n < subscr_vm_created_count; n++ )
> >>> +    {
> >>> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_=
id(d),
> >>> +                                     FFA_MSG_SEND_VM_CREATED);
> >>> +        if ( res )
> >>> +        {
> >>> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_=
id %u to  %u: res %d\n",
> >>> +                   get_vm_id(d), subscr_vm_created[n], res);
> >>> +            ctx->create_signal_count =3D n;
> >>> +            return -EIO;
> >>> +        }
> >>> +    }
> >>> +    ctx->create_signal_count =3D n;
> >>
> >> For clarity here, i would do:
> >> signal_count =3D subscr_vm_created_count
> >
> > OK, I'll update.
> >
> >>
> >>> +
> >>>    return 0;
> >>> }
> >>>
> >>> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start=
,
> >>> +                              uint16_t end, uint16_t vm_id)
> >>> +{
> >>> +    unsigned int n;
> >>> +
> >>> +    for (n =3D start; n < end; n++)
> >>
> >> Coding style, missing spaces
> >>
> >>> +    {
> >>> +        if (subscr[n] =3D=3D vm_id)
> >>
> >> Coding style, missing spaces
> >
> > I'm fixing the style issues.
> >
> >>
> >>> +            return true;
> >>> +    }
> >>> +
> >>> +    return false;
> >>> +}
> >>> +
> >>> /* This function is supposed to undo what ffa_domain_init() has done =
*/
> >>> static int ffa_domain_teardown(struct domain *d)
> >>> {
> >>>    struct ffa_ctx *ctx =3D d->arch.tee;
> >>> +    unsigned int n;
> >>> +    int32_t res;
> >>>
> >>>    if ( !ctx )
> >>>        return 0;
> >>>
> >>> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> >>> +    {
> >>> +        /*
> >>> +         * Skip SPs subscribed to the VM created event that never wa=
s
> >>> +         * notified of the VM creation due to an error during
> >>> +         * ffa_domain_init().
> >>> +         */
> >>> +        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal=
_count,
> >>> +                               subscr_vm_created_count, get_vm_id(d)=
) )
> >>> +            continue;
> >>
> >> I am not following the logic here and would need some explanations.
> >>
> >> A SP is subscribing to be informed of any VM creation, but here you ch=
eck
> >> the list against the VM ID that is destroyed.
> >>
> >> Also a SP could subscribe to be informed of VM destroyed but not VM cr=
eated.
> >>
> >> In my head the logic should be:
> >> if (signal_count < subscr_vm_created_count)
> >>        for each sp in subscr_vm_created
> >>                if is_in_list subscr_vm_destroyed sp
> >>                        send_destroyed
> >> else
> >>        for each subscr_vm_destroyed
> >>                send_destroyed
> >
> > The call to is_in_subscr_list() will only match SPs that have not yet
> > received an expected VM creation event. If all SPs subscribed to the
> > VM creation event have been notified, then is_in_subscr_list() will
> > match nothing. The idea is that if an SP has subscribed to both create
> > and destroy events then it might not expect a destroy event unless it
> > has already received a create event. However, SPs only subscribed to
> > destroy-events don't care if all create-events have been sent or not,
> > they should be notified unconditionally.
> >
> > Does it make sense to you?
>
> The logic makes sense but the code is checking subscriber[n] againt the V=
M ID
> being destroyed which does not make sense.

You're right, I'll update the patch.

> The subscriber list contains a list of SP ID, none of the entries will ma=
tch the VM
> ID being destroyed.
> What needs to be tested is if someone in the created subscribers that was=
 signaled
> already is in the destroy subscribers so that it needs to be signaled.

Yes, I have unfortunately only one SP in my setup.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> >
> >>
> >>
> >>> +
> >>> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_v=
m_id(d),
> >>> +                                     FFA_MSG_SEND_VM_DESTROYED);
> >>> +
> >>> +        if ( res )
> >>> +            printk(XENLOG_ERR "ffa: Failed to report destruction of =
vm_id %u to  %u: res %d\n",
> >>> +                   get_vm_id(d), subscr_vm_destroyed[n], res);
> >>> +    }
> >>> +
> >>>    XFREE(d->arch.tee);
> >>>
> >>>    return 0;
> >>> @@ -411,6 +561,81 @@ static int ffa_relinquish_resources(struct domai=
n *d)
> >>>    return 0;
> >>> }
> >>>
> >>> +static void uninit_subscribers(void)
> >>> +{
> >>> +        subscr_vm_created_count =3D 0;
> >>> +        subscr_vm_destroyed_count =3D 0;
> >>> +        XFREE(subscr_vm_created);
> >>> +        XFREE(subscr_vm_destroyed);
> >>> +}
> >>> +
> >>> +static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uin=
t16_t count)
> >>> +{
> >>> +    uint16_t n;
> >>> +    uint16_t c_pos;
> >>> +    uint16_t d_pos;
> >>> +
> >>> +    subscr_vm_created_count =3D 0;
> >>> +    subscr_vm_destroyed_count =3D 0;
> >>> +    for ( n =3D 0; n < count; n++ )
> >>> +    {
> >>> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATE=
D)
> >> Coding style: spaces
> >>
> >>> +            subscr_vm_created_count++;
> >>> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTRO=
YED)
> >> Coding style: spaces
> >
> > I'll fix the style issues.
> >
> > Thanks,
> > Jens
> >
> >>
> >> Cheers
> >> Bertrand
> >>
> >>> +            subscr_vm_destroyed_count++;
> >>> +    }
> >>> +
> >>> +    if ( subscr_vm_created_count )
> >>> +        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_crea=
ted_count);
> >>> +    if ( subscr_vm_destroyed_count )
> >>> +        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
> >>> +                                            subscr_vm_destroyed_coun=
t);
> >>> +    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> >>> +         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> >>> +    {
> >>> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription list=
s\n");
> >>> +        uninit_subscribers();
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> >>> +    {
> >>> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREAT=
ED )
> >>> +            subscr_vm_created[c_pos++] =3D fpi[n].id;
> >>> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTR=
OYED )
> >>> +            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
> >>> +    }
> >>> +
> >>> +    return true;
> >>> +}
> >>> +
> >>> +static bool init_sps(void)
> >>> +{
> >>> +    bool ret =3D false;
> >>> +    uint32_t count;
> >>> +    int e;
> >>> +
> >>> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count);
> >>> +    if ( e )
> >>> +    {
> >>> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e)=
;
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    if ( count >=3D UINT16_MAX )
> >>> +    {
> >>> +        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", cou=
nt);
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    ret =3D init_subscribers(ffa_rx, count);
> >>> +
> >>> +out:
> >>> +    ffa_rx_release();
> >>> +
> >>> +    return ret;
> >>> +}
> >>> +
> >>> static bool ffa_probe(void)
> >>> {
> >>>    uint32_t vers;
> >>> @@ -462,7 +687,8 @@ static bool ffa_probe(void)
> >>>     * TODO: Rework the code to allow domain to use a subset of the
> >>>     * features supported.
> >>>     */
> >>> -    if (
> >>> +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> >>> +         !check_mandatory_feature(FFA_RX_RELEASE) ||
> >>>         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> >>>         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> >>>         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >>> @@ -484,6 +710,9 @@ static bool ffa_probe(void)
> >>>    }
> >>>    ffa_version =3D vers;
> >>>
> >>> +    if ( !init_sps() )
> >>> +        goto err_free_ffa_tx;
> >>> +
> >>>    return true;
> >>>
> >>> err_free_ffa_tx:
> >>> --
> >>> 2.34.1
>
>

