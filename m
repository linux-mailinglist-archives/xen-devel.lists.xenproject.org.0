Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016F7669311
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:35:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476962.739433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGSY-0001fQ-TS; Fri, 13 Jan 2023 09:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476962.739433; Fri, 13 Jan 2023 09:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGSY-0001d6-Ql; Fri, 13 Jan 2023 09:34:50 +0000
Received: by outflank-mailman (input) for mailman id 476962;
 Fri, 13 Jan 2023 09:34:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3K7w=5K=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pGGSW-0001d0-Q7
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:34:48 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 852c210c-9325-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 10:34:47 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id fy8so50835968ejc.13
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jan 2023 01:34:47 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.138.tellas.gr. [109.242.138.67])
 by smtp.gmail.com with ESMTPSA id
 ov38-20020a170906fc2600b0084d4733c428sm5870772ejb.88.2023.01.13.01.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 01:34:46 -0800 (PST)
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
X-Inumbo-ID: 852c210c-9325-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+agMQNymtgBfMwDGibkZkEB7lupOmqeMBhkfaRI7Ro4=;
        b=e1QOtJbRjfxEFvoY4KnO0q5mrF5qA8udxXmHK2i8t9M4dOP0LQX7VK9l9xdcOf0fD+
         skKyYdLFKuBzEcYJ4nwliNX+YIGT+LmbBaKlYu5whuxlUdjLT5tegqpuNJfvjtTG7hPx
         XnO+2FzRnLrwCVksWo58A47lFAQPjYXCi1JCOX4GmWioztMFFa38Px0R1XS6pEccGURu
         86PlEDwotJc+lZi8Wm8GpafiWb0GaSPHCV435FPE/k0mdQIF2raCo12KZgEB9x2gsF+i
         xZLYrdB9C2bThrBg4O+LbvLjE7Z46MBeMfypcDVfO74hCGE02r2oim1o5AdBNNQ5JaIK
         P0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+agMQNymtgBfMwDGibkZkEB7lupOmqeMBhkfaRI7Ro4=;
        b=pp0r0zQpW/fuJx3sDdrln0oBQDtue3g+evXMxH6qM/LZTCMfpRurc+BT4yd7cZvO4v
         D58lRaNuNp+Kp3rKVz7ghBAK+9doZ7yZcwbbGoEAoD/7bEkt79eTh+7OjfYEnpE6JkQ/
         AOjeFGtIIzEB4rBPybgB5marrGt+HVEm4IgPLQCfVLbR6KSksc7RZrPjUJxfykbAmlg7
         ASXNedozR7Gv6RwNOF/QvpPJ8qN99yQa+hCcbHCiNsOJQCB/7OeBTkB6c/WOqEeHuKGd
         bDIM1Y0J+Zal8xBjseV3V6K09GVfX9S6YkZ4isxSToy7Y7ONDsP6SYNvl08uLWkPEfTl
         Ykqg==
X-Gm-Message-State: AFqh2krX6nom1NMqjywaWoTLuDLVK7vydmtsCzh5jKePkjCTUqqw5hVx
	65jauFMuWoDrqoF1IAHmt+A=
X-Google-Smtp-Source: AMrXdXuOjo1cGolaL56+vHwOmKnnQ9tDwGxUhDqTHAdUMJEPNBcM18KjiJpXT20G0tmUFgXtdPF9BQ==
X-Received: by 2002:a17:907:a705:b0:7bd:ece7:ae66 with SMTP id vw5-20020a170907a70500b007bdece7ae66mr74161558ejc.34.1673602487151;
        Fri, 13 Jan 2023 01:34:47 -0800 (PST)
Message-ID: <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
Date: Fri, 13 Jan 2023 11:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/13/23 10:47, Jan Beulich wrote:
> First of all the variable is meaningful only when an IOMMU is in use for
> a guest. Qualify the check accordingly, like done elsewhere. Furthermore
> the controlling command line option is supposed to take effect on VT-d
> only. Since command line parsing happens before we know whether we're
> going to use VT-d, force the variable back to set when instead running
> with AMD IOMMU(s).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
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
> 
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -571,7 +571,7 @@ _sh_propagate(struct vcpu *v,
>                               gfn_to_paddr(target_gfn),
>                               mfn_to_maddr(target_mfn),
>                               X86_MT_UC);
> -                else if ( iommu_snoop )
> +                else if ( is_iommu_enabled(d) && iommu_snoop )
>                       sflags |= pat_type_2_pte_flags(X86_MT_WB);
>                   else
>                       sflags |= get_pat_flags(v,
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>       if ( !acpi_disabled )
>       {
>           ret = acpi_dmar_init();
> +
> +#ifndef iommu_snoop
> +        /* A command line override for snoop control affects VT-d only. */
> +        if ( ret )
> +            iommu_snoop = true;
> +#endif
> +

Why here iommu_snoop is forced when iommu is not enabled?
This change is confusing because later on, in iommu_setup, iommu_snoop 
will be set to false in the case of !iommu_enabled.

>           if ( ret == -ENODEV )
>               ret = acpi_ivrs_init();
>       }
> 

-- 
Xenia

