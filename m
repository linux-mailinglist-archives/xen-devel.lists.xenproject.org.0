Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7209A71B0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 20:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823885.1237966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2whp-0000Mg-3E; Mon, 21 Oct 2024 18:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823885.1237966; Mon, 21 Oct 2024 18:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2whp-0000KT-0V; Mon, 21 Oct 2024 18:00:37 +0000
Received: by outflank-mailman (input) for mailman id 823885;
 Mon, 21 Oct 2024 18:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2whn-0000KN-PY
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 18:00:35 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e3e2efd-8fd6-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 20:00:34 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9aa8895facso48526666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 11:00:34 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ed80fsm235783666b.46.2024.10.21.11.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 11:00:32 -0700 (PDT)
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
X-Inumbo-ID: 5e3e2efd-8fd6-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729533633; x=1730138433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lhAUSEoXCuCRIGV3DTbLXgmsJN9hgsLll/uq1npoaYw=;
        b=VT/NMuDhAc5fQDYcJ7UVhlLAonUWQRMyBzJ8K+Lu4EjlglDSU09nmYoB3btfuUmdp6
         AvkboG+s3EMOZHGxOp3T//lr4UXRmire28JPDnlxCsYD7SajUY6bUVjCpNC1Rdm7/mAs
         +ijZPxEK5/fVWARN7Nhox80JXrXalLDr/EYOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729533633; x=1730138433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhAUSEoXCuCRIGV3DTbLXgmsJN9hgsLll/uq1npoaYw=;
        b=Nsi2Id7eOrIQUYxOj15Ij0hQ4w3MuiT/gLidy4o2/vbvZZureYMFUMl12rhZob8jgN
         48RCcjouM3WePSqzwrKeS3rEpBw0nFs3Bpk6+ntC1hib+U0Zbmjl2iNdhzOTThUQz8Xm
         iA+nJ4DRNr1C6G8Ff5bDriHgGATtKC54GMXdwKukSupPbJZ4tSWjm4oUX/31GNBGbhlo
         8GeQh2J7QrJel7StC/mDlARLyrw/m52mH5pXOpT8epdZlvROZ5ta+x1jO8KJ35lVLXOe
         sf2rt9RLrzhDndB79lbqs7NT+QXmKHA7Pcif0jhBt+7fa18WLtzW2Ts3N1Oj31dPPlx1
         O0CA==
X-Forwarded-Encrypted: i=1; AJvYcCUL2EEnGW5MGrEX9d6Mt6LrKYJn4hjBzpw3+E214HwdDbcE0CGYKDEXmekprRb9wgg5UW7vZWRwK5M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWd8XTSQ8PU/4ddTjkwGZY2yvG3b2abpvOqve+YKxD/XAIs/7f
	fA2PkrUbfQq93iPsTxDvIbqGiBHOwAc9L/uj3wbC4V9cTa/kvBBMG/VCjOsbPxs=
X-Google-Smtp-Source: AGHT+IEyvYfbGX/aHLK/vMiJzR14WOKq0MsTjaSjePusBiVnKX8OnyeG6rW63ZXnT3jhKL2lwjN0Mw==
X-Received: by 2002:a17:907:3f09:b0:a9a:8a4:e090 with SMTP id a640c23a62f3a-a9a69c8fcf9mr1224017766b.50.1729533633383;
        Mon, 21 Oct 2024 11:00:33 -0700 (PDT)
Message-ID: <7834aee9-db1d-4b1c-a71a-0434c5c590d1@citrix.com>
Date: Mon, 21 Oct 2024 19:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/38] x86/boot: convert mod refs to boot_module mod
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
 <20241021004613.18793-5-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241021004613.18793-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 1:45 am, Daniel P. Smith wrote:
> To allow a slow conversion of x86 over to struct boot_module, start with
> replacing all references to module_t mod, only in setup.c, to the mod element
> of struct boot_module. These serves twofold, first to allow the incremental
> transition from module_t fields to struct boot_module fields. The second is to
> allow the conversion of function definitions from taking module_t parameters to
> accepting struct boot_module as needed when a transitioned field will be
> accessed.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes since v6:
> - code style
> - switched to a local ref
>
> Changes since v5:
> - rewrote commit message
> - coding style changes
> - added comment for initial_images assignment
> ---
>  xen/arch/x86/setup.c | 62 +++++++++++++++++++++++++-------------------
>  1 file changed, 35 insertions(+), 27 deletions(-)
>
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 48809aa94451..b6d688f8fe5e 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1364,15 +1364,19 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>      set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>      kexec_reserve_area();
>  
> -    initial_images = mod;
> +    /*
> +     * The field bi->mods[0].mod points to the first element of the module_t
> +     * array.
> +     */
> +    initial_images = bi->mods[0].mod;

This looks actively-dodgy.  It might be correct, but its also not necessary.

bi->mods[] is populated and both initial_images_nrpages() and
discard_initial_images() have a local bi-> pointer which they already
consume nr_module from, so you really can drop initial_images here in
the series.

i.e. you want to pull patch 28 forward to ahead of of this one, and it
will reduce the churn through the series.

But mostly, it removes a transient-WTF construct from the series, making
it easier to review.

~Andrew

