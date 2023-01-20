Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB867513E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 10:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481528.746480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInmX-0003Xc-B4; Fri, 20 Jan 2023 09:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481528.746480; Fri, 20 Jan 2023 09:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pInmX-0003Vu-7v; Fri, 20 Jan 2023 09:33:57 +0000
Received: by outflank-mailman (input) for mailman id 481528;
 Fri, 20 Jan 2023 09:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4CKk=5R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pInmV-0003Sv-Jv
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 09:33:55 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e85754b-98a5-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 10:33:54 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id g11so529517eda.12
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 01:33:54 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 r14-20020aa7cb8e000000b00499b6b50419sm13929914edt.11.2023.01.20.01.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:33:53 -0800 (PST)
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
X-Inumbo-ID: 8e85754b-98a5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2psdB3xKJ/oHlms8LHhw/3lbx6kKANne860IpKr65zE=;
        b=hXrAY0vSk9lOfCuEnZ8TYl+y4k1KZC3QoXsCWmfl0H0N423CwRS1HRAvH8tJIfZP3I
         EbLwIQtjfDH6K5d9iQo6BIwQS+5ITn/EjP62jKUxy6rgZ+UQkrTvYrCF7oujKGHteLOH
         jF9auGmnOl5hM+stSLWsKPnx3E2prK7Sdnq3lLCgYdzl+JYkBtCH57bIqUVpJKi3nNJU
         AWwqufHsqONSU5h76BNc8SnQM4xAB/XRmfkNozpHuMhBzIssir+9+HTNmAAuPq+0Fgw6
         lEecXv3tG1v4JuNa1TDrwNNpOycHe2JHvc6PMqkQ09C1py8OI+uAfCdEEZ0D1XJEdfh6
         vq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2psdB3xKJ/oHlms8LHhw/3lbx6kKANne860IpKr65zE=;
        b=41JYDibDCUCY7Jl3lHPJRtcCN7RU7yIlJNTXv2JfyFRQm2xo6SpmQZelwcir3jevOv
         RGsqNHEdS6uLgkqlVLq/ImPACfcEfCfTB7/Dj7IWXohtwtAbo+lnmQiYx4nnt+R1Kwro
         777FhLu5XdUijOpwmVK+A0zoRFQSmzZhy7Pkdi9HJE8lyGGDKFu8IT0mEzBhhpxDjbjA
         gwSy9jdMY7ConnA0PFoK5jadUn8YvsUbhKqau+qDJf/294WCpHUKJcaqqVb2GfeQqhDO
         MbwTuqMHybpec8h6puP5UAoLQEhRcGo37RVsOarOD6Rvv0bgMne2QJWede1gH1pxllWc
         q3jQ==
X-Gm-Message-State: AFqh2ko7jrsnUFzMxQsDspbfeWyKnrrvOo53QXUVTn22qHwxyIoDPuZ8
	3J9uuHzgYeh4Mkfw9mVCDPsIC0gpH1c=
X-Google-Smtp-Source: AMrXdXvhykUgeT9zoHb2RV+NyffkBM4EtE/aGI3KxoZ8lm3bsyhjpaSNGOX9KboMRbFO4ww3SLilDg==
X-Received: by 2002:a05:6402:cba:b0:49d:25f3:6b4e with SMTP id cn26-20020a0564020cba00b0049d25f36b4emr13933753edb.28.1674207234249;
        Fri, 20 Jan 2023 01:33:54 -0800 (PST)
Message-ID: <4173a547-e4ca-c7f5-58f0-34419b4c1484@gmail.com>
Date: Fri, 20 Jan 2023 11:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] x86/shadow: make iommu_snoop usage consistent with
 HAP's
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <8d41b8ca-decb-e175-c77a-1c8f91fd2046@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <8d41b8ca-decb-e175-c77a-1c8f91fd2046@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/20/23 10:44, Jan Beulich wrote:
> First of all the variable is meaningful only when an IOMMU is in use for
> a guest. Qualify the check accordingly, like done elsewhere. Furthermore
> the controlling command line option is supposed to take effect on VT-d
> only. Since command line parsing happens before we know whether we're
> going to use VT-d, force the variable back to set when instead running
> with AMD IOMMU(s).
> 
> Since it may end up misleading, also remove the clearing of the flag in
> iommu_setup() and vtd_setup()'s error path. The variable simply is
> meaningless with IOMMU(s) disabled, so there's no point touching it
> there.
> 
> Finally also correct a relevant nearby comment.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

> ---
> I was first considering to add the extra check to the outermost
> enclosing if(), but I guess that would break the (questionable) case of
> assigning MMIO ranges directly by address. The way it's done now also
> better fits the existing checks, in particular the ones in p2m-ept.c.
> 
> Note that the #ifndef is put there in anticipation of iommu_snoop
> becoming a #define when !IOMMU_INTEL (see
> https://lists.xen.org/archives/html/xen-devel/2023-01/msg00103.html
> and replies).
> 
> In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
> certainly suggests very bad things could happen if it returned false
> (i.e. in the implicit "else" case). The assumption looks to be that no
> bad "target_mfn" can make it there. But overall things might end up
> looking more sane (and being cheaper) when simply using "mmio_mfn"
> instead.
> ---
> v2: Change title. Extend comment in acpi_iommu_init(). Purge clearing
>      of the variable from iommu_setup() and vtd_setup()'s error path.
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -556,8 +556,8 @@ _sh_propagate(struct vcpu *v,
>   
>           ASSERT(!(sflags & PAGE_CACHE_ATTRS));
>   
> -        /* compute the PAT index for shadow page entry when VT-d is enabled
> -         * and device assigned.
> +        /*
> +         * Compute the PAT index for shadow page entry when IOMMU is enabled.
>            * 1) direct MMIO: compute the PAT index with gMTRR=UC and gPAT.
>            * 2) if enables snoop control, compute the PAT index as WB.
>            * 3) if disables snoop control, compute the PAT index with
> @@ -577,7 +577,7 @@ _sh_propagate(struct vcpu *v,
>                               gfn_to_paddr(target_gfn),
>                               mfn_to_maddr(target_mfn),
>                               X86_MT_UC);
> -                else if ( iommu_snoop )
> +                else if ( is_iommu_enabled(d) && iommu_snoop )
>                       sflags |= pat_type_2_pte_flags(X86_MT_WB);
>                   else
>                       sflags |= get_pat_flags(v,
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -587,9 +587,6 @@ int __init iommu_setup(void)
>       printk("I/O virtualisation %sabled\n", iommu_enabled ? "en" : "dis");
>       if ( !iommu_enabled )
>       {
> -#ifndef iommu_snoop
> -        iommu_snoop = false;
> -#endif
>           iommu_hwdom_passthrough = false;
>           iommu_hwdom_strict = false;
>       }
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2746,9 +2746,6 @@ static int __init cf_check vtd_setup(voi
>   
>    error:
>       iommu_enabled = 0;
> -#ifndef iommu_snoop
> -    iommu_snoop = false;
> -#endif
>       iommu_hwdom_passthrough = false;
>       iommu_qinval = 0;
>       iommu_intremap = iommu_intremap_off;
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -56,6 +56,17 @@ void __init acpi_iommu_init(void)
>       if ( !acpi_disabled )
>       {
>           ret = acpi_dmar_init();
> +
> +#ifndef iommu_snoop
> +        /*
> +         * As long as there's no per-domain snoop control, and as long as on
> +         * AMD we uniformly force coherent accesses, a possible command line
> +         * override should affect VT-d only.
> +         */
> +        if ( ret )
> +            iommu_snoop = true;
> +#endif
> +
>           if ( ret == -ENODEV )
>               ret = acpi_ivrs_init();
>       }

-- 
Xenia

