Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C626A6B6C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 12:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503983.776442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXKMB-0005YO-P0; Wed, 01 Mar 2023 11:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503983.776442; Wed, 01 Mar 2023 11:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXKMB-0005Vn-Jd; Wed, 01 Mar 2023 11:10:47 +0000
Received: by outflank-mailman (input) for mailman id 503983;
 Wed, 01 Mar 2023 11:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXKM9-0005Vh-Pn
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 11:10:45 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b583da0a-b821-11ed-96a2-2f268f93b82a;
 Wed, 01 Mar 2023 12:10:43 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso5955190wmo.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 03:10:43 -0800 (PST)
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
X-Inumbo-ID: b583da0a-b821-11ed-96a2-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=43NEp65FCnbsH5C57qUnVodu9n1bAZUZnX5yQ0z5Xns=;
        b=hvGk7h2e/GtZGKCwHP26u/Sm5NO7mGvQXCDnszCmgWrdlmQSNe5GMfLD5RPmD8cj5R
         1htAgI6H7FoOS6cSJSDTUgz2BArevWYtVlt1mlTyvSDLeCCvAagVMua3njQBXBMpPNe9
         dbwx/RkuCxzcIHJjZs4JFo098WIlf0OoxpMlSnFeHzMhKJsiqxbtgmY+RpMHSNBo/UBl
         VVXoze65EdSEgJV0OxSTPIPkti3Bu21SPmQ14yrnwZMrDDOz5KOO9JotQpDrHntF4B4x
         dwM9fLcUDhbGT6mYxvEqCEN+FVWskYWZP2M1DykH73GM3UykcLxtEeQ42UTFcCvbYOvI
         dqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43NEp65FCnbsH5C57qUnVodu9n1bAZUZnX5yQ0z5Xns=;
        b=6Hmv2kZMcDnza+JYjhMFOT6jP0CB28pPBQZlPWMq4+d7Qfn7xmuLVHrNS6aov5jrb0
         d+OtMBtXVNnZzuxPl4K8+YC3S3dPZny2Q55aGsDnqMKqUXzM6E20HQvyGbtE9Ukw2sEE
         VMJ60ymWGZG0U5Mgj4b7SizvtIavBiK8oDwbTsoaWU2sUhX+LmtfCB4ad0Jgsue08JGS
         JN2k+x1GKp7UZL9jPiD5TPTwCvVZ2/WVe/upttc5KOfMhIrtVfdSiILlldlDwzEGCJJC
         ulqLfzp42OfhyPGLEyyZ66+3l8feUw+vy2srNE+TjIy/jwiIAVJT7tehwfh1QhlDbmlK
         rGQQ==
X-Gm-Message-State: AO0yUKXwBBPUnK4/rO2AM/s3Ne6BFImIMNF9d7jjEaoqHHVU554c+Tfd
	PH+t7EjARljaLiP6S4+UgQT+4dA6UJb2SocADuD6sQ==
X-Google-Smtp-Source: AK7set/7iT/VVwjVkMD+IBdCYc8ovjsKODxntFNeOuCrFd8KmwO+WiMbt5pkrNkVWjczzjXWXtqF/j6T54M8CYFQTYE=
X-Received: by 2002:a05:600c:4446:b0:3df:97de:8bab with SMTP id
 v6-20020a05600c444600b003df97de8babmr1666749wmn.4.1677669042870; Wed, 01 Mar
 2023 03:10:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <c553f850d76f4c31f5ce464f39bcb010722b9f99.1677079672.git.jens.wiklander@linaro.org>
 <CD0E4A9B-4E07-42AB-A40B-41A9FD98C1F2@arm.com> <CAHUa44EcoXdpyBOkUNZvN0=cCNjNsiZXfgER8EvsK1+f0P_tPA@mail.gmail.com>
 <09363EA7-700B-4EA1-A7FB-6A5321D9E4D9@arm.com>
In-Reply-To: <09363EA7-700B-4EA1-A7FB-6A5321D9E4D9@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 12:10:32 +0100
Message-ID: <CAHUa44Fa_ZjHvdjQRhc_+N_LKzJ1u9Kk1gz0CDYgA2d5pu2VcQ@mail.gmail.com>
Subject: Re: [XEN PATCH v7 11/20] xen/arm: ffa: map SPMC rx/tx buffers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Mar 1, 2023 at 10:56 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 1 Mar 2023, at 10:30, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Hi Bertrand,
> >
> > On Tue, Feb 28, 2023 at 1:57 PM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >>>
> >>> When initializing the FF-A mediator map the RX and TX buffers shared with
> >>> the SPMC.
> >>>
> >>> These buffer are later used to to transmit data that cannot be passed in
> >>> registers only.
> >>>
> >>> Adds a check that the SP supports the needed FF-A features
> >>> FFA_RXTX_MAP_64 / FFA_RXTX_MAP_32 and FFA_RXTX_UNMAP. In 64-bit mode we
> >>> must use FFA_RXTX_MAP_64 since registers are used to transmit the
> >>> physical addresses of the RX/TX buffers.
> >>
> >> Right now, FFA on 32bit would only work correctly if LPAE is not used and only addresses
> >> under 4G are used by Xen and by guests as addresses are transferred through a single register.
> >>
> >> I think that we need for now to only enable FFA support on 64bit as the limitations we
> >> would need to enforce on 32bit are complex and the use case for FFA on 32bit platforms
> >> is not that obvious now.
> >
> > OK, I'll drop the #ifdef CONFIG_ARM_64 and #ifdef CONFIG_ARM_32 and
> > instead depend on ARM_64 in Kconfig.
> > If we ever want to use this on ARM_32 we'll have to go through
> > everything anyway.
>
> Yes this is the best solution for now.
> And support.md patch is already saying already arm64.
>
> >
> >>
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/ffa.c | 57 +++++++++++++++++++++++++++++++++++++++++-
> >>> 1 file changed, 56 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index a5d8a12635b6..07dd5c36d54b 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -148,6 +148,15 @@ struct ffa_ctx {
> >>> /* Negotiated FF-A version to use with the SPMC */
> >>> static uint32_t ffa_version __ro_after_init;
> >>>
> >>> +/*
> >>> + * Our rx/tx buffers shared with the SPMC.
> >>> + *
> >>> + * ffa_page_count is the number of pages used in each of these buffers.
> >>> + */
> >>> +static void *ffa_rx __read_mostly;
> >>> +static void *ffa_tx __read_mostly;
> >>> +static unsigned int ffa_page_count __read_mostly;
> >>> +
> >>> static bool ffa_get_version(uint32_t *vers)
> >>> {
> >>>    const struct arm_smccc_1_2_regs arg = {
> >>> @@ -217,6 +226,17 @@ static bool check_mandatory_feature(uint32_t id)
> >>>    return !ret;
> >>> }
> >>>
> >>> +static int32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> >>> +                            uint32_t page_count)
> >>
> >> Using register_t type here is doing an implicit cast when called and on
> >> 32bit this might later remove part of the address.
> >> This function must take paddr_t as parameters.
> >
> > I'll change to paddr_t for rx/tx.
> >
> >>
> >>> +{
> >>> +    uint32_t fid = FFA_RXTX_MAP_32;
> >>> +
> >>> +    if ( IS_ENABLED(CONFIG_ARM_64) )
> >>> +        fid = FFA_RXTX_MAP_64;
> >>> +
> >>> +    return ffa_simple_call(fid, tx_addr, rx_addr, page_count, 0);
> >>
> >> simple call might not be suitable on 32bits due to the conversion.
> >> As said earlier, it would make more sense to disable FFA on 32bit and
> >> put some comments/build_bug_on in the code in places where there
> >> would be something to fix.
> >
> > I'm dropping the 32-bit support.
> >
> >>
> >>> +}
> >>> +
> >>> static uint16_t get_vm_id(const struct domain *d)
> >>> {
> >>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
> >>> @@ -384,6 +404,7 @@ static int ffa_relinquish_resources(struct domain *d)
> >>> static bool ffa_probe(void)
> >>> {
> >>>    uint32_t vers;
> >>> +    int e;
> >>>    unsigned int major_vers;
> >>>    unsigned int minor_vers;
> >>>
> >>> @@ -426,12 +447,46 @@ static bool ffa_probe(void)
> >>>    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >>>           major_vers, minor_vers);
> >>>
> >>> -    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >>> +    if (
> >>> +#ifdef CONFIG_ARM_64
> >>> +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> >>> +#endif
> >>> +#ifdef CONFIG_ARM_32
> >>> +         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> >>> +#endif
> >>> +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> >>> +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >>>        return false;
> >>>
> >>> +    ffa_rx = alloc_xenheap_pages(0, 0);
> >>> +    if ( !ffa_rx )
> >>> +        return false;
> >>> +
> >>> +    ffa_tx = alloc_xenheap_pages(0, 0);
> >>> +    if ( !ffa_tx )
> >>> +        goto err_free_ffa_rx;
> >>> +
> >>> +    e = ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> >>> +    if ( e )
> >>> +    {
> >>> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
> >>> +        goto err_free_ffa_tx;
> >>> +    }
> >>> +    ffa_page_count = 1;
> >>
> >> ffa_page_count is a constant here and is not used to do the allocation or
> >> passed as parameter to ffa_rxtx_map.
> >>
> >> Do you expect this value to be modified ? how ?
> >
> > I expect this value to match how many FFA_PAGE_SIZE pages have been
> > mapped for the RX/TX buffers. Currently, this is only 1 but will have
> > to be changed later if PAGE_SIZE in Xen or in the secure world is
> > larger than FFA_PAGE_SIZE. We may also later add support
> > configurations where RX/TX buffers aren't mapped.
>
> So it is a constant and the buffers are just mapped or not mapped.

Correct

>
> >
> >>
> >> Please set it first and use it for allocation and as parameter to rxtx_map so
> >> that a modification of the value would only have to be done in one place.
> >>
> >> Please use a define if this is a constant.
> >
> > How about adding a define FFA_MIN_RXTX_PAGE_COUNT and giving that to
> > ffa_rxtx_map() and later assigning it to ffa_page_count if the call
> > succeeds?
>
> Why MIN ?

I was trying to prepare a bit for the future with a minimum value that
would be rounded up to a larger granule as needed depending on
PAGE_SIZE in Xen and what might be discovered about the secure world.

>
> How about just using ffa_rx or ffa_tx being NULL or not to check if the buffers are
> mapped and remove the count.

Sure, I'll drop the _MIN_ part of the define then.

>
> >
> >>
> >> As it is a global variable, does the parameter to rxtx_map make sense ?
> >
> > Yes, ffa_rxtx_map() is a dumb wrapper so it should have all the needed
> > parameters for the SMC provided.
>
> Then passing FFA_MIN_RXTX_PAGE_COUNT should be enough.

OK.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >>
> >> Cheers
> >> Bertrand
> >>
> >>>    ffa_version = vers;
> >>>
> >>>    return true;
> >>> +
> >>> +err_free_ffa_tx:
> >>> +    free_xenheap_pages(ffa_tx, 0);
> >>> +    ffa_tx = NULL;
> >>> +err_free_ffa_rx:
> >>> +    free_xenheap_pages(ffa_rx, 0);
> >>> +    ffa_rx = NULL;
> >>> +    ffa_page_count = 0;
> >>> +    ffa_version = 0;
> >>> +
> >>> +    return false;
> >>> }
> >>>
> >>> static const struct tee_mediator_ops ffa_ops =
> >>> --
> >>> 2.34.1
>
>

