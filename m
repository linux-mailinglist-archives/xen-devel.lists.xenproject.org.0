Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC20D9B2D5F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 11:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826376.1240598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NKs-0001IX-Ar; Mon, 28 Oct 2024 10:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826376.1240598; Mon, 28 Oct 2024 10:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5NKs-0001Fu-7m; Mon, 28 Oct 2024 10:50:58 +0000
Received: by outflank-mailman (input) for mailman id 826376;
 Mon, 28 Oct 2024 10:50:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5NKq-0001Fj-V8
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 10:50:56 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 811b69cc-951a-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 11:50:54 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539f2b95775so4717330e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 03:50:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f029651sm365739266b.60.2024.10.28.03.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 03:50:53 -0700 (PDT)
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
X-Inumbo-ID: 811b69cc-951a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730112653; x=1730717453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ytHLxOUBQj7jo0oLw5RmhEIuDi3qpemw2Zv/CHplmKA=;
        b=S4+SBvmKaO5mQw7mvDYO+g2BMKT7zg971XY+UtiJDmM8VIugwzMNaJgIkzOBcCKmQM
         IE4GL5RIiv3mawj8mwmdDuzCuadsQxGTur/cxu8CUD0HNWTGm9Iu2VxgipvGw3HXuzXY
         GuNFoLBJVywrNkIKbY07Z9CWivaQO8wxsjS3GTkgxcIYg3h98z7T9uaBE/DBVlJKkJpL
         inzTyRJ3tkd55jitfyYXDLyDMichu2MF2+FYeNIBChjqmnc1id45Cphxp4+9eQNAaWXl
         zPcFkpQWO46u8WLzTixm1Ad/ocjypi/PMzkA0YHmqMxF0xznO5C1xIUtL9k6qBaLnmMf
         r6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112653; x=1730717453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytHLxOUBQj7jo0oLw5RmhEIuDi3qpemw2Zv/CHplmKA=;
        b=v40VvTDYBM3/AabH+3lD/7+pNPsisBIVXVcOQ/QJFlWLJ71gW4Z6kmUQp+jpRjIFxD
         I+yVXEnezl3dfWZfxF87qq6n7yrbjddT6Thevn66fsrIZiwRXL6VlxnHPb4sH632MrEZ
         0SJRwjZM/+ecp5Ila/lWSPEO18UcdA3skVGo1s+YhqcH8eYlpAtFlHXbpam+SRst1aCt
         UQQ9pqbmnIVoVUWPEcb42nwTVq/RE+o/uww9FrH6lyFfU0B9gJlMStLvv/FVmu8Umv+v
         gjXD0g0+YxHf0zfasMKajFNGzpWtllOotgAvipEhBzJ3ZUhILz/L2aAQ4ZE4F9/JX9yX
         jclg==
X-Forwarded-Encrypted: i=1; AJvYcCXMXMOIGJK6ASS5kaTe2xqADMRYByvC4IiVTPW8v9kJqmSYId7AjR0VS81gS82t2US83avndwn26Fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQyvRCVtL8PqZO7YAEq3QvY/xqwRniFVPnCJD6ZhPAlj7oOfzK
	fzAU4yuct2qZRhCgmi3HI4cmJz5g+ImhIaY8XopwTjEqn0Ag1jU6iBRIm4sSPg==
X-Google-Smtp-Source: AGHT+IH6H480UToRT5skdU7b9KFYxiGIAXioLXer99WzFv7f1NTumW6txNein21IzhJbsTRD/umh0w==
X-Received: by 2002:a05:6512:b82:b0:53b:154c:f75d with SMTP id 2adb3069b0e04-53b348dc826mr5731088e87.31.1730112653383;
        Mon, 28 Oct 2024 03:50:53 -0700 (PDT)
Message-ID: <311e38eb-4d4a-44a1-9ae1-db40a79c9698@suse.com>
Date: Mon, 28 Oct 2024 11:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
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
In-Reply-To: <20241023131005.32144-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2024 15:10, Juergen Gross wrote:
> Add a new domctl sub-function to get data of a domain having changed
> state (this is needed by Xenstore).
> 
> The returned state just contains the domid, the domain unique id,
> and some flags (existing, shutdown, dying).
> 
> In order to enable Xenstore stubdom being built for multiple Xen
> versions, make this domctl stable.  For stable domctls the
> interface_version is specific to the respective domctl op and it is an
> in/out parameter: On input the caller is specifying the desired version
> of the op, while on output the hypervisor will return the used version
> (this will be at max the caller supplied version, but might be lower in
> case the hypervisor doesn't support this version).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V1:
> - use a domctl subop for the new interface (Jan Beulich)

Just as a preliminary reply: With Andrew's stabilization plans I'm not
sure this, in particular including ...

> @@ -1236,7 +1237,37 @@ struct xen_domctl_dt_overlay {
>  };
>  #endif
>  
> +/*
> + * XEN_DOMCTL_get_domain_state (stable interface)
> + *
> + * Get state information of a domain.
> + *
> + * In case domain is DOMID_INVALID, return information about a domain having
> + * changed state and reset the state change indicator for that domain. This
> + * function is usable only by a domain having registered the VIRQ_DOM_EXC
> + * event (normally Xenstore).
> + *
> + * Supported interface versions: 0x00000000
> + */
> +#define XEN_DOMCTL_GETDOMSTATE_VERS_MAX    0
> +struct xen_domctl_get_domain_state {
> +    domid_t domid;
> +    uint16_t state;
> +#define XEN_DOMCTL_GETDOMSTATE_STATE_EXIST     0x0001  /* Domain is existing. */
> +#define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
> +#define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
> +    uint32_t pad1;           /* Returned as 0. */
> +    uint64_t unique_id;      /* Unique domain identifier. */
> +    uint64_t pad2[6];        /* Returned as 0. */
> +};
> +
>  struct xen_domctl {
> +/*
> + * Stable domctl ops:
> + * interface_version is per cmd, hypervisor can support multiple versions
> + * and will return used version (at max caller supplied value) in
> + * interface_version on return.
> + */

... this (ab)use of the interface version, is the way to go. I think
we want a brand new hypercall, with stability just like most other
hypercalls have it. Backwards-incompatible interface changes then
simply aren't allowed (as in: require a new sub-op instead).

Jan

