Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B46A69D6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503910.776312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXInZ-0002GL-2R; Wed, 01 Mar 2023 09:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503910.776312; Wed, 01 Mar 2023 09:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXInY-0002ES-Vo; Wed, 01 Mar 2023 09:30:56 +0000
Received: by outflank-mailman (input) for mailman id 503910;
 Wed, 01 Mar 2023 09:30:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXInX-0002EM-Ei
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:30:55 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c22eba53-b813-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 10:30:52 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id l25so12521786wrb.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 01:30:52 -0800 (PST)
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
X-Inumbo-ID: c22eba53-b813-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8r/f07RABkisgujNFgCoRIoOPQ3YTfUBQ/yKs3L3hsQ=;
        b=hkjKaFJYKZWgrJME/aFu1i0/4Qb9rGREdy1z9Pdmdv2V1vdNJoHOHcUwtQTLouf7Dd
         Pu+cqQILNgEynmC2Jqh9J4AdhUKoDbGtueFAZ7jjmXchPeiMDCjGQ/zOw0kZdb4QJGkx
         e/Ud13VAy3Pd4ZOd8oskmJhEwdIYA7+sX+gGCJtZLhG2OyPqXSyufmQ6B6polYqyOccC
         qN01bdeBLe3/50IRum0ZsGFV5/EwqVY45hnrnO81ltcAOYvxmYQGqJyNgcSRmypLAf6/
         emQZNr5u5ZXLfYofZXtz6VDd7KDRF9XBlPoVydhavf0iUGCeFwTRsBubpAMnhW81cliq
         QouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8r/f07RABkisgujNFgCoRIoOPQ3YTfUBQ/yKs3L3hsQ=;
        b=NZNXNplXroQJGtzikxWPBHOXd32rLyA7a8NeSYPmpwr9CoDtFb/IcIiUtxDRUYzRGw
         LVexIDJwMi78IY+2DYcXCcZllDeMUgAWzQxiMa94gwFgt7DSA0umQf/uV5XermShjgt5
         dz2L/o6bVGECuIbmuzq1oNnMTfVbvTZglUOhDvaAHI3tZXfh2OeoSjmz4PwZofTD6O7b
         mjjzFddL0sw3aN5rj5SR7QjppbbIjbKJq/BwhzsSkFywkRha/LuyG03mvUfkfvptdGjb
         d1sfNccIQ+z0hRN9c6fvRNb5Uu4MWw0MXO7lfMVpM9Way+3eedoHy6D/7EthFIkR97ae
         YcNg==
X-Gm-Message-State: AO0yUKVri6DBfyQhR4+28mS5hwtgxkL4x6OAFeToWOqRxM5h87qRnVu7
	bn3rRWI4KtUMnUBkQg0ZoolKx/J9l/IKlWmO+xptcg==
X-Google-Smtp-Source: AK7set8vowi2sU1O0gs/UtUw4QzjZTuTCbSradmoJ9bpdSfYoz2NTemsRAVwETylBZWdKVi9ptejpGe+jBmlXI9A1To=
X-Received: by 2002:adf:e948:0:b0:2c7:150c:a0f4 with SMTP id
 m8-20020adfe948000000b002c7150ca0f4mr988238wrn.3.1677663051520; Wed, 01 Mar
 2023 01:30:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <c553f850d76f4c31f5ce464f39bcb010722b9f99.1677079672.git.jens.wiklander@linaro.org>
 <CD0E4A9B-4E07-42AB-A40B-41A9FD98C1F2@arm.com>
In-Reply-To: <CD0E4A9B-4E07-42AB-A40B-41A9FD98C1F2@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 10:30:40 +0100
Message-ID: <CAHUa44EcoXdpyBOkUNZvN0=cCNjNsiZXfgER8EvsK1+f0P_tPA@mail.gmail.com>
Subject: Re: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Tue, Feb 28, 2023 at 1:57 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > When initializing the FF-A mediator map the RX and TX buffers shared with
> > the SPMC.
> >
> > These buffer are later used to to transmit data that cannot be passed in
> > registers only.
> >
> > Adds a check that the SP supports the needed FF-A features
> > FFA_RXTX_MAP_64 / FFA_RXTX_MAP_32 and FFA_RXTX_UNMAP. In 64-bit mode we
> > must use FFA_RXTX_MAP_64 since registers are used to transmit the
> > physical addresses of the RX/TX buffers.
>
> Right now, FFA on 32bit would only work correctly if LPAE is not used and only addresses
> under 4G are used by Xen and by guests as addresses are transferred through a single register.
>
> I think that we need for now to only enable FFA support on 64bit as the limitations we
> would need to enforce on 32bit are complex and the use case for FFA on 32bit platforms
> is not that obvious now.

OK, I'll drop the #ifdef CONFIG_ARM_64 and #ifdef CONFIG_ARM_32 and
instead depend on ARM_64 in Kconfig.
If we ever want to use this on ARM_32 we'll have to go through
everything anyway.

>
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index a5d8a12635b6..07dd5c36d54b 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -148,6 +148,15 @@ struct ffa_ctx {
> > /* Negotiated FF-A version to use with the SPMC */
> > static uint32_t ffa_version __ro_after_init;
> >
> > +/*
> > + * Our rx/tx buffers shared with the SPMC.
> > + *
> > + * ffa_page_count is the number of pages used in each of these buffers.
> > + */
> > +static void *ffa_rx __read_mostly;
> > +static void *ffa_tx __read_mostly;
> > +static unsigned int ffa_page_count __read_mostly;
> > +
> > static bool ffa_get_version(uint32_t *vers)
> > {
> >     const struct arm_smccc_1_2_regs arg = {
> > @@ -217,6 +226,17 @@ static bool check_mandatory_feature(uint32_t id)
> >     return !ret;
> > }
> >
> > +static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> > +                            uint32_t page_count)
>
> Using register_t type here is doing an implicit cast when called and on
> 32bit this might later remove part of the address.
> This function must take paddr_t as parameters.

I'll change to paddr_t for rx/tx.

>
> > +{
> > +    uint32_t fid = FFA_RXTX_MAP_32;
> > +
> > +    if ( IS_ENABLED(CONFIG_ARM_64) )
> > +        fid = FFA_RXTX_MAP_64;
> > +
> > +    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
>
> simple call might not be suitable on 32bits due to the conversion.
> As said earlier, it would make more sense to disable FFA on 32bit and
> put some comments/build_bug_on in the code in places where there
> would be something to fix.

I'm dropping the 32-bit support.

>
> > +}
> > +
> > static uint16_t get_vm_id(const struct domain *d)
> > {
> >     /* +1 since 0 is reserved for the hypervisor in FF-A */
> > @@ -384,6 +404,7 @@ static int ffa_relinquish_resources(struct domain *d)
> > static bool ffa_probe(void)
> > {
> >     uint32_t vers;
> > +    int e;
> >     unsigned int major_vers;
> >     unsigned int minor_vers;
> >
> > @@ -426,12 +447,46 @@ static bool ffa_probe(void)
> >     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >            major_vers, minor_vers);
> >
> > -    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> > +    if (
> > +#ifdef CONFIG_ARM_64
> > +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> > +#endif
> > +#ifdef CONFIG_ARM_32
> > +         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> > +#endif
> > +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> > +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >         return false;
> >
> > +    ffa_rx = alloc_xenheap_pages(0, 0);
> > +    if ( !ffa_rx )
> > +        return false;
> > +
> > +    ffa_tx = alloc_xenheap_pages(0, 0);
> > +    if ( !ffa_tx )
> > +        goto err_free_ffa_rx;
> > +
> > +    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> > +    if ( e )
> > +    {
> > +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> > +        goto err_free_ffa_tx;
> > +    }
> > +    ffa_page_count = 1;
>
> ffa_page_count is a constant here and is not used to do the allocation or
> passed as parameter to ffa_rxtx_map.
>
> Do you expect this value to be modified ? how ?

I expect this value to match how many FFA_PAGE_SIZE pages have been
mapped for the RX/TX buffers. Currently, this is only 1 but will have
to be changed later if PAGE_SIZE in Xen or in the secure world is
larger than FFA_PAGE_SIZE. We may also later add support
configurations where RX/TX buffers aren't mapped.

>
> Please set it first and use it for allocation and as parameter to rxtx_map so
> that a modification of the value would only have to be done in one place.
>
> Please use a define if this is a constant.

How about adding a define FFA_MIN_RXTX_PAGE_COUNT and giving that to
ffa_rxtx_map() and later assigning it to ffa_page_count if the call
succeeds?

>
> As it is a global variable, does the parameter to rxtx_map make sense ?

Yes, ffa_rxtx_map() is a dumb wrapper so it should have all the needed
parameters for the SMC provided.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >     ffa_version = vers;
> >
> >     return true;
> > +
> > +err_free_ffa_tx:
> > +    free_xenheap_pages(ffa_tx, 0);
> > +    ffa_tx = NULL;
> > +err_free_ffa_rx:
> > +    free_xenheap_pages(ffa_rx, 0);
> > +    ffa_rx = NULL;
> > +    ffa_page_count = 0;
> > +    ffa_version = 0;
> > +
> > +    return false;
> > }
> >
> > static const struct tee_mediator_ops ffa_ops =
> > --
> > 2.34.1
> >
>

