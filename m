Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3414A0210F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 09:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865543.1276776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUim8-0007Yv-Qx; Mon, 06 Jan 2025 08:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865543.1276776; Mon, 06 Jan 2025 08:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUim8-0007Wg-OM; Mon, 06 Jan 2025 08:47:52 +0000
Received: by outflank-mailman (input) for mailman id 865543;
 Mon, 06 Jan 2025 08:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUim6-0007Wa-KZ
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 08:47:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7d85adf-cc0a-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 09:47:48 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385dece873cso5170280f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 00:47:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e126sm46590530f8f.65.2025.01.06.00.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 00:47:47 -0800 (PST)
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
X-Inumbo-ID: e7d85adf-cc0a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736153268; x=1736758068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LUGroKBaUx3fvIycUYkuYkxWRhR2kZInh1iJCXyuhpI=;
        b=cku2H+yZZ/uCsVO6iyyGGu2K8GC9cvfMRtweD777Mv3bQWC/PMgqnAYC8HVdYZblwE
         hvDSSrbZyJOOyUMGITRLdTzMKtqqlfJSLh7sd7AQOiBB7+HXDulmUf6Dy49jYxvAXi7C
         JB9bD+WFmjTMvF5HRaPga24Zs7BAHCj05KpWO/kHAfB4PqXNnXP8KZ8UxoSFfgf2CfLK
         ZXpWpEQzP4D4HtGjlf5bkXH4kSi1r/coFII6SbRiL5PIWOjP1JyHU3w7JQp+7yxHZlwF
         wOIOABVGhpOScNeqNuIlxL5A/I0Ma6As1Qx5gzkXQLtcAhm+w5m37VjEoW1A3QVjZwWt
         mAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153268; x=1736758068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUGroKBaUx3fvIycUYkuYkxWRhR2kZInh1iJCXyuhpI=;
        b=ASaHkjZcRzSi2w3xn/lV1WpfjRWy5M7iPbh02Gv5HuhVCGiEIxOGQbrX/KPYwJJqlf
         2WkxxTTM5kUtiCIkFkTrEHkIkx9AdJGekODkfmwA4xTRf138wffurEx9qU2PmihJme9C
         f/yq5247zgB3fRQtMMzaG1Q0dxsRf4xNqz50SQX+ZHYjgQ4KGaLNDCOoKlIcD7wZ3CvN
         VJYetEORKxLPbSENhxCG/Wasb4Q8O5TA27pQllQTBCKvo0NlowWYOKv4ooE0orJdeOOL
         KjsOXWVxjED0YR7yMeLWqTIb1MWp3e3s/4WOZRhrWqSTGZlWQJ8QdC1IEvQmwMt0wQDN
         OK0A==
X-Forwarded-Encrypted: i=1; AJvYcCXL+T7272D7xs+dmxeMm8UGsOZP0mVY+tmN0+NvyMQes4aBVyjhprndiv//nC6eNzzMrB/bj76ev0A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd+Q8jaBvK9Xb8OXOiUJr2RYONvvjKCHGn3+pbgaWCS3YSPSii
	qWLfeheFQKCwS1w8a8T/4TD378zc4e3EEv+rUQmn4rWwdKzPQys/uags7YVuqg==
X-Gm-Gg: ASbGncuXBKkAxJrAU1fxgwU3NCo6XP1gXfYAE+SDJ6LyUKF55/GUw5qplMik/ugO7H8
	qdqs6e156qnmzyihiZQ/eSXb17gqgyiF3TgOeD25x8oNNrfS8wVZE1c8GuJFz7Swwkt9jD+Yt+x
	VNX0zwTjMexZKjzWN/In0WTZ3uXvHGdm4GFRZmYripo+sBWPUUOUezv0CH32pWmukOP8CxoItvg
	0CFz7MAyoUvU17bTOuzBaiII5zGsQX6pCO+jMTqfVDNuJLI+1SXbbH5l007qllfRPAlzjSJp6CP
	1PCwKcb0BY++yUgxi//f+10nHoQPMTt/LX57jZoeMQ==
X-Google-Smtp-Source: AGHT+IGKGRBfsPyXyVmDmchBix5jmtQnAiG4xE0y+lEW61nfYMWevzWLr0j4N8YtsOkP1ZSL29a95Q==
X-Received: by 2002:a05:6000:70a:b0:385:e0d6:fb48 with SMTP id ffacd0b85a97d-38a221f109amr48478778f8f.7.1736153267885;
        Mon, 06 Jan 2025 00:47:47 -0800 (PST)
Message-ID: <324509b4-a38e-4c83-9774-d7f560192c6d@suse.com>
Date: Mon, 6 Jan 2025 09:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: introduce kconfig options to disable
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241219092917.3006174-1-Sergiy_Kibrik@epam.com>
 <735f8d30-5f42-4fa6-acb0-f82b5b759183@suse.com>
 <alpine.DEB.2.22.394.2501021033440.16425@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501021033440.16425@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 19:33, Stefano Stabellini wrote:
> On Fri, 27 Dec 2024, Jan Beulich wrote:
>> On 19.12.2024 10:29, Sergiy Kibrik wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -516,4 +516,33 @@ config TRACEBUFFER
>>>  	  to be collected at run time for debugging or performance analysis.
>>>  	  Memory and execution overhead when not active is minimal.
>>>  
>>> +menu "Supported hypercall interfaces"
>>> +	visible if DOM0LESS_BOOT && EXPERT
>>> +
>>> +config SYSCTL
>>> +	bool "Enable sysctl hypercall"
>>> +	depends on !PV_SHIM_EXCLUSIVE
>>> +	default y
>>> +
>>> +config DOMCTL
>>> +	bool "Enable domctl hypercalls"
>>> +	depends on !PV_SHIM_EXCLUSIVE
>>> +	default y
>>> +
>>> +config HVM_OP
>>> +	bool "Enable HVM hypercalls"
>>> +	depends on HVM
>>> +	default y
>>> +
>>> +config PLATFORM_OP
>>> +	bool "Enable platform hypercalls"
>>> +	depends on !PV_SHIM_EXCLUSIVE
>>> +	default y
>>
>> Just to re-iterate an earlier comment: Andrew (imo validly) raised concern of
>> such negative dependencies. As said before, imo we'd better resolve that before
>> extending the issue (whether by the patch I once sent or something else is then
>> secondary).
> 
> How would you express the !PV_SHIM_EXCLUSIVE dependency without using
> negative dependencies?

By inverting the sense of the option (and renaming it), as (to a 1st approximation)
requested by Andrew long ago, and as proposed in [1], which I think I pointed
Sergiy at, and which continues to be lacking feedback.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html

