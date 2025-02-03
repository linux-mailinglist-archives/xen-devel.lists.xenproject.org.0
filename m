Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C552A26128
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 18:19:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880958.1291061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf061-00084l-Re; Mon, 03 Feb 2025 17:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880958.1291061; Mon, 03 Feb 2025 17:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf061-00082V-Ow; Mon, 03 Feb 2025 17:18:53 +0000
Received: by outflank-mailman (input) for mailman id 880958;
 Mon, 03 Feb 2025 17:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/pT=U2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tf05z-00082O-Vh
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 17:18:51 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef32f682-e252-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 18:18:51 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216281bc30fso14052105ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 09:18:50 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72fe69ba4b8sm8870973b3a.93.2025.02.03.09.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 09:18:48 -0800 (PST)
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
X-Inumbo-ID: ef32f682-e252-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738603129; x=1739207929; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zr7/60gzAwCEQExS2EQao18SV2qLyIFFn+58i6Wx6g=;
        b=gvyaTTR5k0zJz3P9u1ZiDQbtlulGMyR9owGUcJEjlgM61Sjoqoy2gmYMk+mUV5MKAY
         f3lkMNhu1waLpAZlC9yrEqAS0litZ0ikyqIYL5qdru79QIOU0fwvJFYWVLa1aAQqQ0f3
         /If9bUOuhduhriG9NlUpyRzwncDxcr4a75Luw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603129; x=1739207929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zr7/60gzAwCEQExS2EQao18SV2qLyIFFn+58i6Wx6g=;
        b=KEh3tFYMficgIDw3IFQBa+nmhr3zAkVGwwNXyC4PqB+vKL+33lUkQH65xuyzjz7Ubd
         mFZHFIqrFuDvDXUdx7I3HkHkrDLz5YE0wj9UJPXuA0nPxuSu0w6MspcUvPUasJ3n4/KW
         1ps7/ufaquvAJUs/OKi19yBme9fifF0vefWHZtk9ze8JAvifJ5jYNX1+SUktv2im4ZXU
         ByzCs3s5HFHMpj7eJqI98+maktjFken+tacj1TSQ1pnOZbPAMd0MCEdz32Zo/alRPwCR
         n+QtZETU1YthmBQTVCI5t5q/hqd/fmKxQfz5TAWlnbiNVrWG77o0LPZyHn3GRmniIMuQ
         xF4g==
X-Gm-Message-State: AOJu0YwrwufdXoBtoe5OlDmuroyyQkHmean3/lPPi9JrVrqyGhqXq8zM
	cWfcDy6WTJxD3dMiutUAbDPdTUwMhTvpBDBuA071MZfAlBr1Z8DKGifjExcvTMw=
X-Gm-Gg: ASbGncvHjVACjkVZGx0klqgJHG5d8d3N+3wSCPWe3SKJk/uaFEh2dX6Gyx/FTMdNI5x
	PxYwcl3O8981btWMNDxr/FKsPmzw8333aajro4wOD+unVEn5f/9Cd8SNnyEnqNM9tOk8YgfSHcS
	JPkWuWaG4HrwEEN0Au8ZpSLQRQW1DW7ALB5G2qX94nRGjZTEF4n20RIQtuadPsyTCyraMQIq7yl
	YpwY4vEWvaF+6w+VW07ku3e8KXobMpjN/ioup87ZK+1Svz5QJYJIotA9Dj+SbogogS+CpyQ6hVb
	IPT4T8kdZyiEVlcAFfo7
X-Google-Smtp-Source: AGHT+IG7QQnPl8CjVltOM1v9p/Zqp3d6SkatQFD7LZ4NN3+b0xbrmL+2TqJOvSoXdfvzfEXV+H2g7Q==
X-Received: by 2002:a05:6a21:9991:b0:1dc:2a02:913b with SMTP id adf61e73a8af0-1ed7a4db0acmr35606515637.15.1738603129313;
        Mon, 03 Feb 2025 09:18:49 -0800 (PST)
Date: Mon, 3 Feb 2025 18:18:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 for-4.20? 6/6] PCI: drop pci_segments_init()
Message-ID: <Z6D6c69hJrxUdnJG@macbook.local>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3abd753b-b1f2-499a-8c02-6b6d64a78a17@suse.com>

On Mon, Feb 03, 2025 at 05:27:24PM +0100, Jan Beulich wrote:
> Have callers invoke pci_add_segment() directly instead. On x86 move the
> invocation back to acpi_mmcfg_init(), where it was prior to ????????????
> ("x86/PCI: init segments earlier").
> ---
> v2: New.
> 
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -88,7 +88,8 @@ static int __init pci_init(void)
>      if ( !pci_passthrough_enabled )
>          return 0;
>  
> -    pci_segments_init();
> +    if ( pci_add_segment(0) )
> +        panic("Could not initialize PCI segment 0\n");
>  
>      if ( acpi_disabled )
>          return dt_pci_init();
> --- a/xen/arch/x86/x86_64/mmconfig-shared.c
> +++ b/xen/arch/x86/x86_64/mmconfig-shared.c
> @@ -402,6 +402,9 @@ void __init acpi_mmcfg_init(void)
>  {
>      bool valid = true;
>  
> +    if ( pci_add_segment(0) )
> +        panic("Could not initialize PCI segment 0\n");

Do you still need the pci_add_segment() call here?

pci_add_device() will already add the segments as required, and
acpi_parse_mcfg() does also add the segments described in the MCFG.

Thanks, Roger.

