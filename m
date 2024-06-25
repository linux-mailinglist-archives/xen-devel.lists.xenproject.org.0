Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D0916B5B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 17:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747893.1155418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7eG-0000iZ-6a; Tue, 25 Jun 2024 14:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747893.1155418; Tue, 25 Jun 2024 14:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM7eG-0000gT-40; Tue, 25 Jun 2024 14:59:56 +0000
Received: by outflank-mailman (input) for mailman id 747893;
 Tue, 25 Jun 2024 14:59:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM7eF-0000gN-D7
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 14:59:55 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94152ec7-3303-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 16:59:53 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so73608731fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 07:59:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb321720sm83223095ad.84.2024.06.25.07.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 07:59:52 -0700 (PDT)
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
X-Inumbo-ID: 94152ec7-3303-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719327593; x=1719932393; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RfqYYxPLuSCwW96Mc2hBqvO628PNFFvYqArRNxDYeiM=;
        b=DPhEV4o4+4ioMt9ZR4uVnjC5BnU2W9fzLRy98rowGJk+ZTm3FJ3ArH6X5G3vW+Tkmk
         nc8YhFlNBBygDtjMDvEQcKouoCBH/TkRWdi+2C/CZyB9Vh6CMccVoTTIkq/q5KMfMI4Z
         xRPcTcSV7WRzxyfdq+6IsVdUic0M2RiSK2Q/Xf5iIASxcfowzyXiCZm3Jvaf1NC2jhR9
         noSEojkGF+FQylKrucquxUID+/SVIhIC8TDMTrsOVI6xqMo7qhvUL50EYzpa1OKl7HCB
         +gNmfi2CFQeVq/Mufc+vDZlnQhPPSSPGHoAMbaO5y/KYZHmgHr6f39+psgkOvLDEQsYo
         BHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327593; x=1719932393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfqYYxPLuSCwW96Mc2hBqvO628PNFFvYqArRNxDYeiM=;
        b=aFQzSXoP3D7x9RKlDM46kJy6f+hvVEBlP2WnTY11XtEt/kMAvSB0zZYDaY1o+JN5Cq
         aKueBJ73fHejnqqJdMz9hq+IvqoJwgcZ5XjSGWz0rxnQm2whL5Mae2k/njRbI5eR7ukV
         3uOiAg8mW5rruZZ8l7Z7dJcGxwvYOtPJQQZnCHy5C8L8aSUWbd1S2V/n+ciL4l8zoWmY
         VOqN4XVdC5ABftgm/GZPBWK0ylK44C0mi2dfcHGAQaAaDDML0zVhD+KZmfZio1KI+kQj
         lbsBcvlT3idR8svMwfHN68DJW26NR1K5bMQ21xzXNBuRWhw+c7u0wpNx9lhngKqHjIVm
         q2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXBm/h9maUACESias4gsEeRKN39CdnitdQ7mLV4pc3XWZF1IAakdbqMcsWLMPv2ZIBaJha0O1X9KPyQwf6SyIq+jF78FJgB+1qeB3XWPE4=
X-Gm-Message-State: AOJu0YzFGfZ+ZgfgfovYtzAGQfvVJ0RPntpJWQJlr6OSkNMm+LdqTXgp
	fraGwJut855e8VLHBN1wa+qrOyOiEFcME9xZjFrmjOdJy992Hq7qzk5kCaOOCA==
X-Google-Smtp-Source: AGHT+IG9JgVsUAt6QKZbpn9WThMshBWGO8obO5P1jqfS05vX8HmOvvwRx0bIO/HrgCqM9f6I4LObBg==
X-Received: by 2002:a2e:7805:0:b0:2ec:5073:5814 with SMTP id 38308e7fff4ca-2ec5b2fd2f3mr63423751fa.8.1719327593006;
        Tue, 25 Jun 2024 07:59:53 -0700 (PDT)
Message-ID: <521767cb-ac08-48c5-bd91-b30c1d192331@suse.com>
Date: Tue, 25 Jun 2024 16:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] common/kernel: address violation of MISRA C Rule 13.6
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
 <54949b0561263b9f18da500255836d89ca8838ba.1719308599.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <54949b0561263b9f18da500255836d89ca8838ba.1719308599.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 12:14, Alessandro Zucchelli wrote:
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -660,14 +660,15 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>      case XENVER_guest_handle:
>      {
> +        struct domain *d = current->domain;

Can a (new) variable thus initialized please be consistently named currd?

>          xen_domain_handle_t hdl;
>  
>          if ( deny )
>              memset(&hdl, 0, ARRAY_SIZE(hdl));
>  
> -        BUILD_BUG_ON(ARRAY_SIZE(current->domain->handle) != ARRAY_SIZE(hdl));
> +        BUILD_BUG_ON(ARRAY_SIZE(d->handle) != ARRAY_SIZE(hdl));

Wasn't there the intention to exclude BUILD_BUG_ON() for specifically this
(and any other similar) rule?

Jan

> -        if ( copy_to_guest(arg, deny ? hdl : current->domain->handle,
> +        if ( copy_to_guest(arg, deny ? hdl : d->handle,
>                             ARRAY_SIZE(hdl) ) )
>              return -EFAULT;
>          return 0;


