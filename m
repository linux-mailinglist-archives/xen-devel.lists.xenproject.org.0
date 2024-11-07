Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61959C0160
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831602.1246934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z7s-0003DE-Ne; Thu, 07 Nov 2024 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831602.1246934; Thu, 07 Nov 2024 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8z7s-0003AZ-KM; Thu, 07 Nov 2024 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 831602;
 Thu, 07 Nov 2024 09:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8z7r-0003AT-2K
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:48:27 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d907bb9-9ced-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:48:23 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so6643925e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:48:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6b2d13sm52499985e9.12.2024.11.07.01.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:48:22 -0800 (PST)
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
X-Inumbo-ID: 6d907bb9-9ced-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZkOTA3YmI5LTljZWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcyOTAzLjMyMzczNSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730972903; x=1731577703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=81rmPOQxArOZCHQm7NcbBFKQylZnuCOKFIDm83WY5vg=;
        b=VduM7s0N23lq3j+zZerv0JG3outXA4lQ9ii6KeSXCUjx5xhVGMWg+hYvK7mpZhXrEJ
         ZHB/8PF2bXIm/uxOoaeEklA0ow26SlBsf3/FvfFu066tp9ZhRHNij9x8obqn1PCCX0cy
         Z2mY/cssYz4skS6ADNEErfEHbRUxTPesy/G9kO5nTSqQArsu8DlfXViesmRIeGvyxEJD
         PVhzjbCgkh19CjuPsO+aH6z9guPN8b7d7UHc0v2UAUp5g20ZS8XQVzFe9GR3p4EKQazW
         UgdEbqBPzm293xESOE5QL2lFSDnt6eXLfhdMc3+XMq3GFTB8t+Dho42sC2hrfvhqvV7b
         nCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730972903; x=1731577703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81rmPOQxArOZCHQm7NcbBFKQylZnuCOKFIDm83WY5vg=;
        b=NjSqVFExuYMaNYQWxJe+7Up+Ved6pmcEPVr4rbLWwVddubQqcRvO/5f8SMDOsu7JbL
         qWDb4sQHK6X9abNZ4Y/bQjeHeMwWuzcfV/h51As81vMdWG36DvudIOAlnuLwwAkLOCBG
         6nkXfCjyUHFSWuPkV2EkO4I1PpJn/ir04/z0ruA+3YwlF/RvhtKPhR2bZjHy8OManA5o
         M/orA9sOavBgqx2HEI+1DAHAv4y9IledgPn52WHd+v371YX45zrwIVG8AFDxRTLzeOEs
         wEuMbb+KDKpLRDcgGpDAJ8+iySZzBXRqF8WQRJIz+Kvq0I3EaTgEjjZOeZ7/4b6qZdF7
         1fYQ==
X-Gm-Message-State: AOJu0YxF4iZ9CMyrabDANg6z31DbkIM7abF6tz3N+Yg2fIWuSAfeA1a0
	8fzdfLCiOVw87wQH2T8xVkWd0iXtSfcaD0If4Zt8nwGXYq96feeCg8I3BVs5Qg==
X-Google-Smtp-Source: AGHT+IHCpZIpiyeCMdqDwaVOqE0l9q1zrBq0bjajtck4m24gULwh/PvuzHrhwl/SsgF5tNaBr5mUqg==
X-Received: by 2002:a05:600c:19cd:b0:431:6153:a246 with SMTP id 5b1f17b1804b1-432b2fff579mr6035565e9.13.1730972902613;
        Thu, 07 Nov 2024 01:48:22 -0800 (PST)
Message-ID: <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com>
Date: Thu, 7 Nov 2024 10:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: livepatch-build-tools requires debug
 information
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241107084927.37748-1-roger.pau@citrix.com>
 <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com> <ZyyLAj6MZ3fvOFBC@macbook>
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
In-Reply-To: <ZyyLAj6MZ3fvOFBC@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 10:40, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 09:21:26AM +0000, Andrew Cooper wrote:
>> On 07/11/2024 8:49 am, Roger Pau Monne wrote:
>>> The tools infrastructure used to build livepatches for Xen
>>> (livepatch-build-tools) consumes some DWARF debug information present in
>>> xen-syms to generate a livepatch (see livepatch-build script usage of readelf
>>> -wi).
>>>
>>> The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
>>> on release builds, thus providing a default Kconfig selection that's not
>>> suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
>>> because it's missing the DWARF debug section.
>>>
>>> Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Oops, yes.
>>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Fixes tag ?
> 
> Was borderline on adding one, but wasn't sure since it's strictly
> livepatch-build-tools that requires the DWARF data, but custom made
> livepatches (like the examples in tests) do not require such
> information.

At which point: Is "select" really appropriate then? Wouldn't it be more
logical then to change DEBUG_INFO's default to take LIVEPATCH into account
(still permitting people to turn debug info off if they know they won't
need it)?

Jan

