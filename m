Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF66E8C0527
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 21:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718934.1121495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4n7E-00012r-1j; Wed, 08 May 2024 19:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718934.1121495; Wed, 08 May 2024 19:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4n7D-0000zw-VB; Wed, 08 May 2024 19:38:11 +0000
Received: by outflank-mailman (input) for mailman id 718934;
 Wed, 08 May 2024 19:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6EkY=ML=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4n7D-0000zq-4g
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 19:38:11 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801a4ea4-0d72-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 21:38:09 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-51f71e4970bso64111e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 12:38:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac25a0e000000b0051e932297e2sm2628346lfn.297.2024.05.08.12.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 12:38:09 -0700 (PDT)
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
X-Inumbo-ID: 801a4ea4-0d72-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715197089; x=1715801889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqJvQsZ6lpxwkHhMuvOVW+fL3A34zOW2QxxsCIio7TM=;
        b=FbNhBJ79pXkP/Do85KIby1438DbjeEf/HMk/osqP9Wd8Kj8CUxdXUI9yk1G1Dz32l1
         1biCbCb0YKSeGGMzlzNdDT6MDDfe6rQUoCzqk6/cz18ZB/2Encb8/+u1ljtITBq9RjbK
         HYgqMi+mHEvT+54OENW7zwnchlTyH/ZsyBEKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715197089; x=1715801889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqJvQsZ6lpxwkHhMuvOVW+fL3A34zOW2QxxsCIio7TM=;
        b=fDGRTlz350eDVa+fRKml5fzLb3YHLWeCDakZxbj+C7qt2EEr2822RLX4u9MM2zeuXt
         4RWDO1lqA3btaATsdg3jWC/1NAuBT64A24DpUuN7Cjzgi/uh8RuRZYNhCqXw8yCWeoNv
         5bZTyg+ZZCeKbvuydeOWx6L0TMfkK1nJs3fgiKmdtczu1yKonI80MYbbrg+JHdcCtAkl
         YbsHpqEVnJ5NxeewSMVEEoUE43R0d1LhxHiyli96Nm++mp4Ar+IMNBNEJce1NiW0MVTa
         G0YSlB+zdUI1D21oWzv9x31ssczJBVMLimKEXLcibAZNzKj2O2mlOKyZ+0uuWcwtqSjK
         Hb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsijZUkoswpG0ATq+1g6JBBZcMZCuMMjscEz9Sd1zZuqiE8R+zONBBV83lsIQdSI8whpxnTha4yPluVpu9aywXAsPAD2hqBUBQQtRSTHs=
X-Gm-Message-State: AOJu0Yzw3HlD6awgNqON+HUoQpJr6zPl83j9iWKLazCiCxp66tvkfSPR
	4vnz25HlB0r5TmFg7WRjojtRSCwhxDgp+IDtJtkOlrVqwaWLrdC/mBLd3ARzUnE=
X-Google-Smtp-Source: AGHT+IH633bOTO1if1AIrdNr7B+rn7sl8WIprS74i2qagJs8y6TfsFW8imv2PT6q+vyzBLpJR7pKhA==
X-Received: by 2002:ac2:5388:0:b0:51a:e305:eb20 with SMTP id 2adb3069b0e04-5217c567012mr3047101e87.17.1715197089394;
        Wed, 08 May 2024 12:38:09 -0700 (PDT)
Message-ID: <d43a704a-fd2a-4778-9250-a69b483016b4@citrix.com>
Date: Wed, 8 May 2024 20:38:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2 2/3] xen/x86: enable altp2m at create domain
 domctl
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>
References: <20240508112323.38946-1-roger.pau@citrix.com>
 <20240508112323.38946-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240508112323.38946-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2024 12:23 pm, Roger Pau Monne wrote:
> Enabling it using an HVM param is fragile, and complicates the logic when
> deciding whether options that interact with altp2m can also be enabled.
>
> Leave the HVM param value for consumption by the guest, but prevent it from
> being set.  Enabling is now done using the misc_flags field in
> xen_arch_domainconfig.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.

Ha.  So this is actually work that Petr has been wanting to do.

Petr has a series hoping to make it into 4.19 (x86: Make MAX_ALTP2M
configurable), which just missed out on this side of things.

altp2m is not architecture specific at all, and there's even support for
ARM out on the mailing list.  Therefore, the altp2m mode wants to be
common, just like the new MAX_ALTP2M setting already is.

Both fields can reasonably share uint32_t, but could you work with Petr
to make both halfs of this land cleanly.


As to the HVMPARAM, I'd really quite like to delete it.  It was always a
bodge, and there's a full set of HVMOP_altp2m_* for a guest to use.

> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 20e83cf38bbd..dff790060605 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -708,13 +711,33 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          }
>      }
>  
> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> +    if ( config->arch.misc_flags & ~XEN_X86_MISC_FLAGS_ALL )
>      {
>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
>                  config->arch.misc_flags);
>          return -EINVAL;
>      }
>  
> +    if ( altp2m && (altp2m & (altp2m - 1)) )
> +    {
> +        dprintk(XENLOG_INFO, "Multiple altp2m options selected in flags: %#x\n",
> +                config->flags);
> +        return -EINVAL;

I think this would be clearer to follow by having a 2 bit field called
altp2m_mode and check for <= 2.

> +    }
> +
> +    if ( altp2m && nested_virt )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "Nested virt and altp2m are mutually incompatible\n");

There's nothing inherently incompatible.  I think it's more that noone
had any interest in trying to make it work in combination with nested p2ms.

I'd phrase it as "not supported", rather than incompatible.

> +        return -EINVAL;
> +    }
> +
> +    if ( altp2m && !hap )
> +    {
> +        dprintk(XENLOG_INFO, "altp2m requires HAP\n");
> +        return -EINVAL;
> +    }

altp2m ought to work fine with shadow.  It's only if you want VMFUNC/#VE
acceleration that you depend on EPT.

Again, I'd phrase this as "not supported".

~Andrew

