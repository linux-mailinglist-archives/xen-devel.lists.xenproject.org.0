Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B442CDA10
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43775.78633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqRh-0002H3-F2; Thu, 03 Dec 2020 15:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43775.78633; Thu, 03 Dec 2020 15:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqRh-0002Gi-Bn; Thu, 03 Dec 2020 15:23:01 +0000
Received: by outflank-mailman (input) for mailman id 43775;
 Thu, 03 Dec 2020 15:23:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkqRf-0002Gd-Tw
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:22:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b0041b98-db9a-4a09-aee0-f9344932ae24;
 Thu, 03 Dec 2020 15:22:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBDDDABCE;
 Thu,  3 Dec 2020 15:22:57 +0000 (UTC)
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
X-Inumbo-ID: b0041b98-db9a-4a09-aee0-f9344932ae24
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607008978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nYaGsRymu8tOlNaFh/oHGL2VMwjaNycEaEBHauIUjjQ=;
	b=koVcS2usgAx3WC4U1saA6fqW0mfZTKYhmjskys5MBukd8Iyj0mAfOO8c8gPgz6Fa4OhWqK
	KHPrGRbT2ehZ4Cl9M6pGI+iY71PnPJaGCc1fwEn9Ob4O1XFqnBc+x+XJmycvpbKJsPR5di
	1h1n3WQBn8ztY6h/cajm2he2ENh69dA=
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Eslam Elnikety <elnikety@amazon.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
Date: Thu, 3 Dec 2020 16:22:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201203124159.3688-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.12.2020 13:41, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ...to control the visibility of the FIFO event channel operations
> (EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_priority) to
> the guest.
> 
> These operations were added to the public header in commit d2d50c2f308f
> ("evtchn: add FIFO-based event channel ABI") and the first implementation
> appeared in the two subsequent commits: edc8872aeb4a ("evtchn: implement
> EVTCHNOP_set_priority and add the set_priority hook") and 88910061ec61
> ("evtchn: add FIFO-based event channel hypercalls and port ops"). Prior to
> that, a guest issuing those operations would receive a return value of
> -ENOSYS (not implemented) from Xen. Guests aware of the FIFO operations but
> running on an older (pre-4.4) Xen would fall back to using the 2-level event
> channel interface upon seeing this return value.
> 
> Unfortunately the uncontrolable appearance of these new operations in Xen 4.4
> onwards has implications for hibernation of some Linux guests. During resume
> from hibernation, there are two kernels involved: the "boot" kernel and the
> "resume" kernel. The guest boot kernel may default to use FIFO operations and
> instruct Xen via EVTCHNOP_init_control to switch from 2-level to FIFO. On the
> other hand, the resume kernel keeps assuming 2-level, because it was hibernated
> on a version of Xen that did not support the FIFO operations.
> 
> To maintain compatibility it is necessary to make Xen behave as it did
> before the new operations were added and hence the code in this patch ensures
> that, if XEN_DOMCTL_CDF_evtchn_fifo is not set, the FIFO event channel
> operations will again result in -ENOSYS being returned to the guest.

I have to admit I'm now even more concerned of the control for such
going into Xen, the more with the now 2nd use in the subsequent patch.
The implication of this would seem to be that whenever we add new
hypercalls or sub-ops, a domain creation control would also need
adding determining whether that new sub-op is actually okay to use by
a guest. Or else I'd be keen to up front see criteria at least roughly
outlined by which it could be established whether such an override
control is needed.

I'm also not convinced such controls really want to be opt-in rather
than opt-out. While perhaps sensible as long as a feature is
experimental, not exposing stuff by default may mean slower adoption
of new (and hopefully better) functionality. I realize there's still
the option of having the tool stack default to enable, and just the
hypervisor defaulting to disable, but anyway.

> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -622,7 +622,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      unsigned int max_vcpus;
>  
>      /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=
> +    if ( (config->flags &
> +          ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_evtchn_fifo) !=
>           (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>      {
>          dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2478,7 +2478,8 @@ void __init create_domUs(void)
>          struct domain *d;
>          struct xen_domctl_createdomain d_cfg = {
>              .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
> -            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> +                     XEN_DOMCTL_CDF_evtchn_fifo,
>              .max_evtchn_port = -1,
>              .max_grant_frames = 64,
>              .max_maptrack_frames = 1024,
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -805,7 +805,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>      struct bootmodule *xen_bootmodule;
>      struct domain *dom0;
>      struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
> +                 XEN_DOMCTL_CDF_evtchn_fifo,
>          .max_evtchn_port = -1,
>          .max_grant_frames = gnttab_dom0_frames(),
>          .max_maptrack_frames = -1,
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -738,7 +738,8 @@ static struct domain *__init create_dom0(const module_t *image,
>                                           const char *loader)
>  {
>      struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
> +        .flags = XEN_DOMCTL_CDF_evtchn_fifo |
> +                 (IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0),
>          .max_evtchn_port = -1,
>          .max_grant_frames = -1,
>          .max_maptrack_frames = -1,
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -307,7 +307,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>           ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>             XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>             XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_evtchn_fifo) )
>      {
>          dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
>          return -EINVAL;

All of the hunks above point out a scalability issue if we were to
follow this route for even just a fair part of new sub-ops, and I
suppose you've noticed this with the next patch presumably touching
all the same places again.

Jan

