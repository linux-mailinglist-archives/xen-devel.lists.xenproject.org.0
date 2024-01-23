Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F68388B3
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 09:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670289.1042939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSByj-0004XR-WF; Tue, 23 Jan 2024 08:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670289.1042939; Tue, 23 Jan 2024 08:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSByj-0004UC-TD; Tue, 23 Jan 2024 08:17:53 +0000
Received: by outflank-mailman (input) for mailman id 670289;
 Tue, 23 Jan 2024 08:17:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSByh-0004Sp-TC
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 08:17:51 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e52c9e30-b9c7-11ee-9b0f-b553b5be7939;
 Tue, 23 Jan 2024 09:17:49 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55c6bc3dd54so1714350a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 00:17:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q9-20020a056e02106900b00361a24b9e06sm3354482ilj.18.2024.01.23.00.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 00:17:48 -0800 (PST)
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
X-Inumbo-ID: e52c9e30-b9c7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705997869; x=1706602669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2+/Lfn09rqLE813xJe+1NFkr7IfISjem2apRMUbjBY=;
        b=c7rkkkDg9Lx5Ap/Ubi0S/mKjKgwkIWcUA4TVHmugzOckkrlDfFNJjHD/5GD8LhNdRP
         YYOp/JQ8erCYpWy7uA7rjfFPnPayGyQZiGZzP4XoKqyD5GOPn8EIw3wNU9n83OUQtClC
         UY31K2ZxaoJjHrymH0ulNCUMkBxN0XdmPtpdtYlrSgctK/3dnCqG8Z5WjQkH86cLev8K
         7BV/bQtwRk+uXoJrWuZBL0vB0Y/OwZ/fZvg22a6CsKhm9cNSoXnh07eme/MRE7zezOym
         +A8Nzi8srtTw3rhDeuLfWoOinVPegN0lVxLwvKVrIUhI2Q+flW64slMf5KLu7kYZ6eaj
         AnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705997869; x=1706602669;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2+/Lfn09rqLE813xJe+1NFkr7IfISjem2apRMUbjBY=;
        b=vHWeYw1dMWQMYG7Du3TrCQ4Bn2NZDOudQXZ7kDzyF9sRJX0hBI/M/0s1eWGwbypqRS
         PZkG545OP2SuMxBa7Ov0DnRAxS91O6LtbVP7Huom7r3qmjE9yZJ9jXkeE/FDYEXFXv8T
         WThTBfH059g7XdXz5U7dMmDwTWCIwcZHEdEvyDO8ewf3E7Lk2e1qeEH4wvPlF5O/bWR/
         YjFwmqTWsQyfphjHTtiELoM1Ph0ORlET7QmMI372/HG8IOoExjNYSmAbJ4O2G1zs9/te
         2MboEQ6nS2mKyD7dpbLx1uPV+bYT8VNg4rYNoexYNTz3yN39pE1I+vTcD6DlCN8/eSpy
         bRIw==
X-Gm-Message-State: AOJu0YzTbIJXdbrQF7SYZBIBwVCDldpV3Yx8xN/OjP9MkZUS3YeZi9d9
	QwjwVFgaNeCv08x+a2Bt7nHmhMTY5EnyJdYb0MbMhSZtO6YjkVwOfL6cAnN+rQ==
X-Google-Smtp-Source: AGHT+IFW5jZUWFtGp2eZjJkj8U4wyXLYcuxUvUvB+Mo4aiFemn6v3FkoIHZebXaDu0Gb4NiV7y/m7w==
X-Received: by 2002:a17:907:778c:b0:a2f:6053:2ab7 with SMTP id ky12-20020a170907778c00b00a2f60532ab7mr6879072ejc.11.1705997869255;
        Tue, 23 Jan 2024 00:17:49 -0800 (PST)
Message-ID: <0a02a53c-9163-428d-a5d9-6cf2234d7b9c@suse.com>
Date: Tue, 23 Jan 2024 09:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmstat: Limit hypercalls under HWP
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
References: <20240122190934.52080-1-jandryuk@gmail.com>
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
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <20240122190934.52080-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 20:09, Jason Andryuk wrote:
> When HWP is active, the cpufreq P-state information is not updated.  In
> that case, return -ENODEV instead of bogus, incomplete info.  The xenpm
> command already supports skipping results when -ENODEV is returned, so
> it is re-used when -EOPNOTSUPP might be more accurate.
> 
> Similarly, set_cpufreq_para() is not applicable when HWP is active.
> Many of the options already checked the governor and were inaccessible,
> but SCALING_MIN/MAX_FREQ was still accessible (though it would do
> nothing).  Add an ealier HWP check to handle all cases.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> `xenpm get-cpufreq-states` now doesn't return any output.  It also exits
> successfully since xenpm doesn't check the returns there.

This isn't very nice. Is there nothing sensible that can be output
instead in the HWP case? If not, I think it would help if
inapplicability of the command would be indicated by at least one line
of output. Or might it make sense to at least fall back to
get-cpufreq-average in that case?

>  Other
> commands will fail:
> xenpm set-scaling-maxfreq 11 1100000
> failed to set scaling max freq (95 - Operation not supported)

This is fine imo.

Jan

