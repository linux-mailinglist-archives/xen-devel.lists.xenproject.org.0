Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C7A40077
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 21:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894595.1303311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZMP-0006wH-8m; Fri, 21 Feb 2025 20:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894595.1303311; Fri, 21 Feb 2025 20:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlZMP-0006uB-5j; Fri, 21 Feb 2025 20:10:57 +0000
Received: by outflank-mailman (input) for mailman id 894595;
 Fri, 21 Feb 2025 20:10:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TFm=VM=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tlZMO-0006u0-0d
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 20:10:56 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f464915b-f08f-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 21:10:54 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso16354555e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 12:10:54 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030b2c8sm27288135e9.25.2025.02.21.12.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 12:10:53 -0800 (PST)
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
X-Inumbo-ID: f464915b-f08f-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740168654; x=1740773454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+/xroZ04c6IBTc3KK0k0oGHEGo/2zVmblhre1A047jQ=;
        b=Tq/EyEHFDVSaw/Dd6/23B4HSc4H1XnqKvBbH6h2IQIKTl1YIwBJA9mFn8QdIY8kUbQ
         mOa7KtGaGdpNVRhiIgOiG4I9CfPQinqbhPIUuEzleOdnPy+UifiDoUiWUrPhDVn+d+AA
         bvSP3eeA0JPIygwzaqMTWu+kBnVCfUK4BZpRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168654; x=1740773454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/xroZ04c6IBTc3KK0k0oGHEGo/2zVmblhre1A047jQ=;
        b=WOq/OoRIboJ8FI3apKBBeEciqjoMRQYdJq1yC+jaWBW0kRtB64+/1DoH9zzWxNRczH
         mAhBfBU2PZN/E0KQW7qdXcmPXn1my/RpV6RSZIgYekvLCKpkp72/0Z1jjEe9MOX0rIB9
         6+wbGIN6Sim1o7yIajcHZZQ/uq4q6SrfWPAAFrkoBAcSXcOMcREjgzRg1U7dOj41fm/L
         u79YAY4lYQal0gcS0k/D56dcjphrLz3qsOX2g9DCa1wC7Y4IAMO+FTWI5gXJDbu268J7
         Qn2Qt050+2IawBkc6rqkMdVmNBYilkYv/99BBPIqpQ/P3twD2qSSSyjXuNW6mcfg/61S
         W8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWksLe6oJaLEHU0pMCd7SWzPqmnauCXl0PUtp2raHqWOCKGbUtAN481WcGFApUXA0Y5jHCmRFZtQIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPInPxdu93G/nGi+K2xCjpogUEx2zkH0CalGXiC31om3j5bEjc
	04Mjagi2An5ugiYWW2t4LBb7ixEP2l0/fUZFT3cj8usYnpm08pqn8eMEQ4sfniyialblt1CwLwJ
	9
X-Gm-Gg: ASbGncte4Y8n6RQ9Jx6WjBnyQuY2VNWVymRvG/qTvaNbS1hscBuEVAQzAv3d5hDVuPT
	eSt3J/n7M60wtsCy6LrgA8kHH7HLuLoRNwXqJ0bF/2EeRGSrVEqRmxK/r3tz8oZGVvMN4WY0q1q
	/RaG+JNwfE82ZVHzqiiXeEj04y51P9PKrNdk54/ek/BOB8IF5Bnc24AKuDFlI88I5xmU+i/Rp5B
	ueRKtx50lbFllsQki7ibd4rwjhkDCFAMFrvgYJ4FxcIZaU+R4G+p2Wu1rsLyLB0jG4Rgp47n7uN
	PTOtI1YPrvnAfznDcKtVBMshlCGRvFjt07POqJ2OuR16xJPPM8fyWvxerqUb53eEAQ==
X-Google-Smtp-Source: AGHT+IH+unkF2giBrB/sPOpbOgT8FeadxItWc/E+Z1yAkhU1VIAnFMFp5Jb8t9LmCLMTR+knKXk7gA==
X-Received: by 2002:a05:600c:5125:b0:439:9951:1220 with SMTP id 5b1f17b1804b1-439ae1f1415mr40341705e9.13.1740168654176;
        Fri, 21 Feb 2025 12:10:54 -0800 (PST)
Message-ID: <9cb2f3e5-5523-4b02-b8df-9975dab7c015@citrix.com>
Date: Fri, 21 Feb 2025 20:10:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/ppc: Fix opal.c's misaligned DT reads to avoid
 tripping UBSAN
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1740168326.git.sanastasio@raptorengineering.com>
 <f0b1f299d793c4302ee1b4c6a9c99057f924d4f4.1740168326.git.sanastasio@raptorengineering.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f0b1f299d793c4302ee1b4c6a9c99057f924d4f4.1740168326.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 8:08 pm, Shawn Anastasio wrote:
> Fix two misaligned reads from the FDT in the opal setup code to avoid
> tripping UBSAN failures. Without this change, UBSAN-enabled builds on
> PPC will fail on boot before the serial console is even initialized.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/ppc/opal.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/ppc/opal.c b/xen/arch/ppc/opal.c
> index 1183b7d5ef..3d0e4daf27 100644
> --- a/xen/arch/ppc/opal.c
> +++ b/xen/arch/ppc/opal.c
> @@ -34,8 +34,9 @@ static void opal_putchar(char c)
>  void __init boot_opal_init(const void *fdt)
>  {
>      int opal_node;
> -    const __be64 *opal_base;
> -    const __be64 *opal_entry;
> +    const __be64 *opal_base_p;
> +    const __be64 *opal_entry_p;
> +    __be64 opal_base, opal_entry;
>  
>      if ( fdt_check_header(fdt) < 0 )
>      {
> @@ -54,17 +55,20 @@ void __init boot_opal_init(const void *fdt)
>          die();
>      }
>  
> -    opal_base = fdt_getprop(fdt, opal_node, "opal-base-address", NULL);
> -    opal_entry = fdt_getprop(fdt, opal_node, "opal-entry-address", NULL);
> -    if ( !opal_base || !opal_entry )
> +    opal_base_p = fdt_getprop(fdt, opal_node, "opal-base-address", NULL);
> +    opal_entry_p = fdt_getprop(fdt, opal_node, "opal-entry-address", NULL);
> +    if ( !opal_base_p || !opal_entry_p )
>      {
>          early_printk("Failed to get opal-base-address/opal-entry-address "
>                       "property from DT!\n");
>          die();
>      }
>  
> -    opal.base = be64_to_cpu(*opal_base);
> -    opal.entry = be64_to_cpu(*opal_entry);
> +    memcpy(&opal_base, opal_base_p, sizeof(opal_base));
> +    memcpy(&opal_entry, opal_entry_p, sizeof(opal_entry));
> +
> +    opal.base = be64_to_cpu(opal_base);
> +    opal.entry = be64_to_cpu(opal_entry);

Thanks for getting to the bottom of this.

However, you can use get_unaligned_*() and friends which is probably a
bit nicer, and doesn't involve the extra local variables.

~Andrew

