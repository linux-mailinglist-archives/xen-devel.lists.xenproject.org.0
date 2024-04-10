Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A758089FB4E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703368.1099000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruZev-0003sQ-4J; Wed, 10 Apr 2024 15:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703368.1099000; Wed, 10 Apr 2024 15:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruZev-0003qZ-1l; Wed, 10 Apr 2024 15:14:45 +0000
Received: by outflank-mailman (input) for mailman id 703368;
 Wed, 10 Apr 2024 15:14:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FY1=LP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruZet-0003oZ-4F
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:14:43 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e2e7ba5-f74d-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 17:14:41 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41551639550so47352215e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 08:14:41 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 n6-20020a5d6606000000b0033e745b8bcfsm13911362wru.88.2024.04.10.08.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 08:14:40 -0700 (PDT)
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
X-Inumbo-ID: 0e2e7ba5-f74d-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712762081; x=1713366881; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Udh8ZMDVEpECGFfFBU6EwaiH5r4l1ii9BHFyxiYdzRg=;
        b=U2lefbNBXNatST4WmOTs1IFVOcHmGIRj9zJmvjIQn73AvyMNX7Sn5/xV2kvy5IgW6n
         IKJxIZewwXZwBmVGhgv1OS3/C7vcXvz5eCCcgVUrSi5YdxqXLMWbjRhJqcF3rTzhuxpP
         HxJzTA2cE3dCMnQp7q1cN6jNsT3axEt4N78mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762081; x=1713366881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Udh8ZMDVEpECGFfFBU6EwaiH5r4l1ii9BHFyxiYdzRg=;
        b=sh3XX/773eK8ep/n6rVOBrzNc0jJ9sRho0eJZXhr6FsNHdCEvUkGB89F/2pZfS2b/+
         urdSD+oZ8WKen6GDfh4Ud2T+J5jsnzSJS7CDtYShwDLparKG35ec3zBsMD0eLEZG50Wm
         w/NEjXiujZHPuUx8YcYpusGoQgIg6+qEaguoiuiGciVcKB6qqp3tKiCXFGTvIPYT1nsb
         JUHNffPJsmS+F8BvQOhuymXO8hTr9TOwE9KIzI7AHAj8mG5kSSxD/CTnq9cdLXPui9P/
         a68DLkBMAwZniUMBnBhVgTZH28wM4X3BiKmKxiVnkm3sFn8bycXSsMe9qtZsp70+FBmb
         sGfg==
X-Gm-Message-State: AOJu0YwcTTS2lyCwh0y0B9GCcSKpoDbN26MhfZgwU1EyCoqGvQpE4S96
	qqv0PQnPddMYRoWZdvYh4UZXiktEl2vsfIMZgH1XA831iRVuQkPjZXOXR2UEUvQ=
X-Google-Smtp-Source: AGHT+IEFFk1rpRMkCPZMJxvqvktLYBdF8shanxlUvfeFqpY2ycN+Q5t7Pb9XPz41K0WHk9DNquCBEg==
X-Received: by 2002:a05:6000:1561:b0:345:bbf8:5568 with SMTP id 1-20020a056000156100b00345bbf85568mr3202098wrz.7.1712762081179;
        Wed, 10 Apr 2024 08:14:41 -0700 (PDT)
Date: Wed, 10 Apr 2024 17:14:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [PATCH v2 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
Message-ID: <Zhas4MQdL3hQ6Uww@macbook>
References: <20231026205539.3261811-1-andrew.cooper3@citrix.com>
 <20231026205539.3261811-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026205539.3261811-3-andrew.cooper3@citrix.com>

On Thu, Oct 26, 2023 at 09:55:39PM +0100, Andrew Cooper wrote:
> We eventually want to be able to build a stripped down Xen for a single
> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
> available to randconfig), and adjust the microcode logic.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Stefano Stabellini <stefano.stabellini@amd.com>
> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> I've intentionally ignored the other vendors for now.  They can be put into
> Kconfig by whomever figures out the actual dependencies between their init
> routines.
> 
> v2:
>  * Tweak text
> ---
>  xen/arch/x86/Kconfig                 |  2 ++
>  xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
>  xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
>  xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
>  4 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 xen/arch/x86/Kconfig.cpu
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index eac77573bd75..d9eacdd7e0fa 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
>  
>  menu "Architecture Features"
>  
> +source "arch/x86/Kconfig.cpu"

Since we are not targeting at the CPU only, would this be better named
as Kconfig.vendor?  Or Kconfig.platform?  (I'm OK if you prefer to
leave as .cpu, just suggesting more neutral names.

> +
>  source "arch/Kconfig"
>  
>  config PV
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> new file mode 100644
> index 000000000000..3c5d88fdfd16
> --- /dev/null
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -0,0 +1,22 @@
> +menu "Supported CPU vendors"
> +	visible if EXPERT
> +
> +config AMD
> +	bool "AMD"
> +        default y
> +        help
> +          Detection, tunings and quirks for AMD platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on AMD platforms.
> +
> +config INTEL
> +	bool "Intel"
> +        default y
> +        help
> +          Detection, tunings and quirks for Intel platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Intel platforms.

There seems to be a weird mix between hard tabs and spaces above.
Naming is OK for me.

> +
> +endmenu
> diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
> index aae235245b06..30d600544f45 100644
> --- a/xen/arch/x86/cpu/microcode/Makefile
> +++ b/xen/arch/x86/cpu/microcode/Makefile
> @@ -1,3 +1,3 @@
> -obj-y += amd.o
> +obj-$(CONFIG_AMD) += amd.o
>  obj-y += core.o
> -obj-y += intel.o
> +obj-$(CONFIG_INTEL) += intel.o
> diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
> index b58611e908aa..da556fe5060a 100644
> --- a/xen/arch/x86/cpu/microcode/private.h
> +++ b/xen/arch/x86/cpu/microcode/private.h
> @@ -70,7 +70,16 @@ struct microcode_ops {
>   * support available) and (not) ops->apply_microcode (i.e. read only).
>   * Otherwise, all hooks must be filled in.
>   */
> +#ifdef CONFIG_AMD
>  void ucode_probe_amd(struct microcode_ops *ops);
> +#else
> +static inline void ucode_probe_amd(struct microcode_ops *ops) {}
> +#endif
> +
> +#ifdef CONFIG_INTEL
>  void ucode_probe_intel(struct microcode_ops *ops);
> +#else
> +static inline void ucode_probe_intel(struct microcode_ops *ops) {}

This is stale now, and will need some updating to match what's in
private.h.

Thanks, Roger.

