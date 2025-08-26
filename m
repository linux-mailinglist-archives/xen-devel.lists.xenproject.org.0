Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E8B3556B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 09:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093965.1449321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqo0W-000780-0N; Tue, 26 Aug 2025 07:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093965.1449321; Tue, 26 Aug 2025 07:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqo0V-00076Y-U0; Tue, 26 Aug 2025 07:22:15 +0000
Received: by outflank-mailman (input) for mailman id 1093965;
 Tue, 26 Aug 2025 07:22:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqo0U-00076R-Kl
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 07:22:14 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 621f910d-824d-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 09:22:12 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afe84202bc2so252225166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 00:22:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afeae4ca4bdsm58985366b.5.2025.08.26.00.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 00:22:11 -0700 (PDT)
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
X-Inumbo-ID: 621f910d-824d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756192931; x=1756797731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C+Eeg5T1lgi/IZJGN2U97jLj4V4n1crk0Ak7gDI/JlY=;
        b=KFH9TCz9gH61CgX5zvn7IGbdOdjlU0K2r3+tePzYqjcHc8lJzFLWIaoLFZjJoiN2gx
         8Cc0N6v1XkEZPbjujzzGb7BlJoB2n2PuY3m+Jp+pwsNn/VDwX84fC8tEac9rKeS18TPN
         bywyEouM3YV0z6wNsO4MzWo5A6crBCs/qMUEy6zI7Zu/0oQlvqyjjNGqRjWKNRedPNp1
         h4FvxG7B7TZRXRZBIIFYq4hxtjdXBCCvXfgE4Tgv0Z5aPJA6YMljOcHMskJzW8YGMNc+
         gI35EVZy6cKScA1Qq3bcSjDld4miTLzuq7uJIw7BfZ1Fdx56iB7yQ9at4JKY6H9EYFjm
         r15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756192931; x=1756797731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+Eeg5T1lgi/IZJGN2U97jLj4V4n1crk0Ak7gDI/JlY=;
        b=osd2fKyh72FC6lkDOXk12pT9WMrcdqOfq0ca4XeQa4EZT72wGgf0/LJ4n9+Rq6jllg
         JuSFeCben4TK66bO1orX6Fhbq8F8vDrkOBRL8kmUx9ZLiGc8Q7+Q977xgb01YMc8m01s
         Lwnxxve/QH5xTzUkhkkfCbnYPwNpZ1tUQw7HJzuD2qz2dSKak6E13xfyikjICVIbHuMq
         Jr9nYFISrgbChy21sMNL9CAnAgoKUy2533dRpnhYGtVjFIR65rtzMxT6xPphqSBWwgqf
         ynR2uKxyUZvNbFZJGXypWKnS/gAVBx7zoKvdAHl/4sVWd5wrDskM2JTbfnBxj0gc3JVa
         iAgA==
X-Gm-Message-State: AOJu0YwbwGxI3J2XZYHUMJIjDnhwyS9+HwS4Vvf04G7yD/6isaTKAIbd
	dGaU4/SBUB3pP/JwaKWhUGfFKQrdSnARxe/ngwTKai2bt05jvmy1ybZ9JTjq8PvJuA==
X-Gm-Gg: ASbGncv4r+emH9fBa9rR1C7FNJmVtEadvTxAvCZlxrsdjRQ/qE//f8EVlgGF+MIaXh9
	7lENrWKfKDuVK3WvvIpJaOpjreDpuLpJpsDuY2AL8VUlMEInSMnG8HL7+wt2eFahJUkSFTo4huS
	ngV+3lk+z4vi5KS6oWPBqdsPO2eHCARNSrf5Q01n9VSJq7Co1lF1SQlDN5yxDEyj4fmV0OyWURk
	KneO2oTMVxovGYe2zL7O+2GFxmeXlNSWIYXLwzExV6+sqpVtDCAFHZHLCiQWlwrJYwWqzxs9l2T
	sALY9L0g8wv6x7rJ0bHOUT3vyA4lq9ySWBZMXpv+EWYqG0OWjqdROjZaXALGUiUd6N5KzNhec1S
	NH2+7FbQnMzM2MCwLr3XboJphOU4gI9jZXSWpI1bL1WOAQGC4ygpELZUjxK37E63EwKlRxy5JXX
	rqOdztGlpooQnMV89nuw==
X-Google-Smtp-Source: AGHT+IFq1+7gcPtTI/IHi1JY64n9+doFUXl5uDLjIxRHGK9YksCbPbbha1xbHm9UUItiA/okK1Se8A==
X-Received: by 2002:a17:907:72d4:b0:af9:3019:6aef with SMTP id a640c23a62f3a-afe28feabb8mr1416475866b.10.1756192931337;
        Tue, 26 Aug 2025 00:22:11 -0700 (PDT)
Message-ID: <de9005bf-c858-4e7e-bea8-33e5ea2424fc@suse.com>
Date: Tue, 26 Aug 2025 09:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/events: Cleanup find_virq() return codes
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250826005517.41547-1-jason.andryuk@amd.com>
 <20250826005517.41547-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250826005517.41547-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2025 02:55, Jason Andryuk wrote:
> rc is overwritten by the evtchn_status hypercall in each iteration, so
> the return value will be whatever the last iteration is.

Which may even be a false "success". Especially for that it feels like ...

>  Change to an
> explicit -ENOENT for an un-found virq and return 0 on a successful
> match.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

... this also wants a Fixes: tag and perhaps a Cc: to stable@.

> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -1318,7 +1318,7 @@ static int find_virq(unsigned int virq, unsigned int cpu, evtchn_port_t *evtchn)
>  {
>  	struct evtchn_status status;
>  	evtchn_port_t port;
> -	int rc = -ENOENT;
> +	int rc;

Maybe best to also move this into the more narrow scope (loop body)?
Either way:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>  	memset(&status, 0, sizeof(status));

Having this outside of the loop is a little odd, too: It makes assumptions
on the behavior of the hypervisor (like not altering the structure upon
error). Yet likely not something to deal with right here.

Jan

