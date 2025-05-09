Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E848CAB0CD1
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 10:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979834.1366332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDIsa-0005Am-Jn; Fri, 09 May 2025 08:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979834.1366332; Fri, 09 May 2025 08:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDIsa-00058U-Gp; Fri, 09 May 2025 08:14:48 +0000
Received: by outflank-mailman (input) for mailman id 979834;
 Fri, 09 May 2025 08:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMqf=XZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uDIsY-00058M-KM
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 08:14:46 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa05264e-2cad-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 10:14:44 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso13341605e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 01:14:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d685869csm21378855e9.26.2025.05.09.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:14:43 -0700 (PDT)
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
X-Inumbo-ID: aa05264e-2cad-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746778484; x=1747383284; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MJADe6r/awdzbcEHbrD3YiMYwf392PpKrvKEy6T5pJM=;
        b=SmoK6W0vvBV1Yh6YIc+/SWuFJTqjVMAKpy+CTZTGkKDPq/jVlwn+c9BVIXa7TSp8ik
         OrZ63O2QNSX0FI1XZPNJEzwNIJXmj72K7AxcQFF/3VWUAiH15ddPQbHu5r/Tox3aZjsQ
         gKRiAZS0hgNM2ZvC4ZcizuYOOb+uAn/0l8YoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746778484; x=1747383284;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJADe6r/awdzbcEHbrD3YiMYwf392PpKrvKEy6T5pJM=;
        b=vxuADkZ9fsK/ss8n2D0GFlF5OuSuIWRgVmZjnKh0NilmespjhLQstjwhO43td8KrHl
         EoQrn6O6wIyrQMXEOTn/IINghCs8rKDBcQkDMZU0xAPpLjDqWkpaBaFThjSBFeiRED22
         nRAcowMiXjrefr23FDh24x2O188ssEMmjVfn8tx4j+uvJ9F7TlgEFNmAQ2vJII4geZxq
         BGno+CpHHzfC4h6SB4HN6Zt6tQvdVrTCWAIl7bz45hb2flskj1DtUFtTJZbKI5TZSIRK
         91v8tfzFDichNZ0Xj9ZChngy78el3dTOiXLJX87l+VPPra58kovdn/BAniRNzZpncYxB
         fqmw==
X-Gm-Message-State: AOJu0YwJ/7ZHP0Pmt7RAFrdREr+PX5beX1IkqtpucFbEyCsKFAVFHI3j
	etP6rirGPErolUB3BJjWTpjQMhWrTDUaDv/onofU1V4Whwe5gcsQqupdgaqB8rs=
X-Gm-Gg: ASbGnctKJWjJRRC78sMZR6K36cmEm8nMeKcTrB/2HpEck01EjqmXJILZ/6ZuPmd96TZ
	nQ6GNQ9OFMyjhVcbF/KpDPcSZplls2yl4bmvNvVuH869Fg2azuK28gNE/nhOGp+hPekQ3zM+Oe+
	Gpkx18/XP1c0hCBZ2x59UV7tUtCykkiGChY61vcdqLMRGK9FQsKi4JBjnvPiv0prTozLmo6mzb7
	1E52rP/JyVL5JIRpwXOhYJqM+iI+dGtcYaxs5B5wiXheRHdAP1U4d5JXN4E9vWvc5DhvkOY9aRu
	PzSVoNL0cNRQipTPzO65sbmtai2aEUoASO5qCnYU2yllu5tMYOk=
X-Google-Smtp-Source: AGHT+IHeldYERH+o1TKXoKlhO6RqPy8emk/Eu9kghB7A5gJMWKKAW8OTvha65s1rZTM8rW/Jh5E9Ug==
X-Received: by 2002:a05:600c:8217:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-442d6ddebafmr14092475e9.28.1746778483708;
        Fri, 09 May 2025 01:14:43 -0700 (PDT)
Date: Fri, 9 May 2025 10:14:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/Kconfig: Improve help test for speculative options
Message-ID: <aB25cjNY2qh_im19@macbook.lan>
References: <20250508160336.2232152-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508160336.2232152-1-andrew.cooper3@citrix.com>

On Thu, May 08, 2025 at 05:03:36PM +0100, Andrew Cooper wrote:
> The text for CONFIG_INDIRECT_THUNK isn't really correct, and was already stale
> by the time speculative vulnerabilities hit the headlines in 2018.  It is
> specifically an out-of-line-ing mechansim, and repoline is one of several
> safety sequences used.
> 
> Some of this boilerplate has been copied into all other options, and isn't
> interesting for the target audience given that they're all in a "Speculative
> Hardning" menu.
> 
> Reword it to be more concise.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

You are the expert on those things :).

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> CONFIG_SPECULATIVE_HARDEN_BRANCH really ought to be named
> CONFIG_SPECULATIVE_HARDEN_CONDITIONAL, but this would be a (minor) functional
> change.

I don't have a strong opinion either way TBH.  Would you maybe like to
rename the menu visible text to "Speculative Conditional Branch Hardening"?

> ---
>  xen/common/Kconfig | 51 +++++++++-------------------------------------
>  1 file changed, 10 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 4bec78c6f267..03ef6d87abc0 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -162,29 +162,21 @@ config STATIC_MEMORY
>  menu "Speculative hardening"
>  
>  config INDIRECT_THUNK
> -	bool "Speculative Branch Target Injection Protection"
> +	bool "Out-of-line Indirect Call/Jumps"
>  	depends on CC_HAS_INDIRECT_THUNK
>  	default y
>  	help
> -	  Contemporary processors may use speculative execution as a
> -	  performance optimisation, but this can potentially be abused by an
> -	  attacker to leak data via speculative sidechannels.

It would be nice if this boilerplate text could be made the "help" of
the top level menu entry, but that's not possible with Kconfig.

Thanks, Roger.

