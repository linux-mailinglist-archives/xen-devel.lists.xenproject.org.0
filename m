Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54200A77FC4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 18:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934660.1336301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tze4a-0002RJ-A6; Tue, 01 Apr 2025 16:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934660.1336301; Tue, 01 Apr 2025 16:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tze4a-0002Q4-7E; Tue, 01 Apr 2025 16:02:44 +0000
Received: by outflank-mailman (input) for mailman id 934660;
 Tue, 01 Apr 2025 16:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tze4Z-0002Py-82
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 16:02:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd72b2e6-0f12-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 18:02:41 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso43409005e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 09:02:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e834a5sm207545625e9.13.2025.04.01.09.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 09:02:38 -0700 (PDT)
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
X-Inumbo-ID: bd72b2e6-0f12-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743523360; x=1744128160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1Rd1UfYIcfzPadMvtlKgSvC+u88t6PcyshAEvjoQHYQ=;
        b=Yq5OPQmJQcfq7wlNwBWmLIMBr1bT0Em13txZMGRMzDENKm1jgm/yWc2g6vqeKFxNIf
         h65ufOQFw1Cy/zW+O6COcS+JxWdVXN2GFRVlbk7/sxRb4C5PobNUASQRCEM9ArJ3v5zm
         SmNOE5afIYL4GAAO6amiLDENj15WcX/V0vcjwMa7RlCq61IyE//P9mL9IX5/wZetHyPA
         4nBAeRlLzJGTy1KVNyj1+BgWkIt2JSRkO322r7cjWbPstQZuoQQl1lGUZEcGFzVKrxEb
         g0jhIHBlwiwukWCMstYzWLBFyrBBvVEzxR5e/3fATQBZgYdCLLYQvDUb1eViEwMO9TR4
         mIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523360; x=1744128160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Rd1UfYIcfzPadMvtlKgSvC+u88t6PcyshAEvjoQHYQ=;
        b=gMgG3Dc3w0MmN1ZSO2viXe5oCQpZ3NbQRfQdHBzEzXHZALo1p3B1XyI6kpQ/O+ZzRb
         BCrYYdJo3fR37RZn89NtOd/SSFb3r/Yx6yNPI2/QGdBPNzJy0g+rIeGy7HXfbSyUwRmh
         xHO9q35vgTHQUgPjG+EgKW1AjK12mtlShO5l1TVk0MEusnu4YQOkQx/PgKibZCiTyzSw
         DkMCIdMeStJoJPg3S5sMBU8Q2AEwPs32+cuyre8PjuBqehy7bzasbTPAY3CCOTULg1ts
         nFV4i4vs3dGOENOqg3//b1MC85joUoOJcDofyyCptyYvJPvs41mrBTZ07l807D2ESqFv
         ywuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWATlp6GWiY4jO1cbXFxgPjhVdzbcO/hUQ/oK5ykT2B/m36MJQ726lXyLZjgJMM1YIis6gB2jLuNxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhoykKAUJeRGq3G80PUfuz8021KtsKCQ4Z9tcGaN+0I7jJzg5Y
	0eSSi9as8BkOXjxsC8w4YvHOJFJ/3ouGRIXcMQ3pX3i5W+1Q3yNU6Hyi3+6xgg==
X-Gm-Gg: ASbGncvdEvT2m+oEjFe66qkBQg7oPkRhZXaB4w8nU9hBuWJmNFooyrdZLB60fdp+Wkw
	8iPFnU3JYBQE9I/fOluFM6afpylx747Juod25KTCitauEAWNgYuxiCLCO++8DbYeFBB5sB+gFAM
	WTR4RNMXha8ysMNmnfP3/g+4v/JMUsqzL1vdlV7l4hkommSFoPPe3/BB1pjHZbQLef93kUzWovS
	k0WNT2DRwu6QZuIk7ASYGnTkmXMepc4CTt7YkKJjf8XHQan33qNDvZKZs/XTBMP0Wvw2/WClXf9
	uqGRdOGAIGnx/Fg3UckO2awdrxo8qBCqZKxo/OQVihnAu/16Kre6cKLWfBTvhQDwx5oXoWSxnH5
	nxjU5gkT1W6WzI51ey0khufhguEaDCA==
X-Google-Smtp-Source: AGHT+IFMqIf6XOdSzNNyMPn+t/KNTyFbUHBdss3pG+DS8HHYqEttGrEW4CBc3kbNTmfs9dVGxzyzKg==
X-Received: by 2002:a05:600c:190b:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-43ea7cc37d7mr35677805e9.24.1743523359072;
        Tue, 01 Apr 2025 09:02:39 -0700 (PDT)
Message-ID: <ff6afa1e-8fa8-4adf-998d-af2b10aaebea@suse.com>
Date: Tue, 1 Apr 2025 18:02:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] x86/efi: discard multiboot related entry code
 for PE binary
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-8-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250401130840.72119-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -63,6 +63,7 @@ SECTIONS
>    . = __image_base__;
>    /DISCARD/ : {
>      *(.text.header)
> +    *(.init.multiboot)
>    }
>  #endif
>  
> @@ -208,6 +209,7 @@ SECTIONS
>         _sinittext = .;
>         *(.init.text)
>         *(.text.startup)
> +       *(.init.multiboot)
>         _einittext = .;

Better keep stuff that was early in .init.text early, by putting
.init.multiboot first here? Then in principle:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, there are then-orphan contributions to .init.rodata (maybe also
to .init.data), which is at least a little odd. If they're to stay that
way at least for the moment, maybe at least mention the aspect as known
in the commit message?

Jan

