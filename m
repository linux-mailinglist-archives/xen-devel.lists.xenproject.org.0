Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F7AF6FA2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031920.1405660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGnd-0000py-CH; Thu, 03 Jul 2025 10:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031920.1405660; Thu, 03 Jul 2025 10:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGnd-0000nf-8u; Thu, 03 Jul 2025 10:04:13 +0000
Received: by outflank-mailman (input) for mailman id 1031920;
 Thu, 03 Jul 2025 10:04:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXGnb-0000nX-W9
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:04:12 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1029c318-57f5-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 12:04:10 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a57ae5cb17so3575946f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:04:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af540b25dsm15900102b3a.25.2025.07.03.03.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:04:08 -0700 (PDT)
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
X-Inumbo-ID: 1029c318-57f5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751537049; x=1752141849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=klViF86nYsD+wW5D9guFL31ffmwZysmOxfJLry7IRe4=;
        b=PGdqFi6HKBd/nKep2sv2h9jxVQ8yqr89ZTba+4Cr+N3LG9VE7kRm/OhxnJnLkjpp3d
         mUdSSUevCg6dDy84RvHibGE5MrNhMlNxRlOJDNqydcyk4AUQ3mGi6OyldjsUkBQhJ9zl
         +0iW2kSywo7tEtkiaPkMGSGNdQYPpkPCxgQIrvnG9zDNLFKquXsNkI5fv6jSgmplt3Tu
         RX0Y8gPT3Z0IU3hipjRpfzzHSIVyOTLYa9dj7mr9MHERESOuK9POHk5zMS+qMGXqFbG9
         6H6NmsJuBpxRB9CaICDKKvRVq6CaWAmdh7dXu0uwSwNHiEM4vM9JCa5YTePnP29e+296
         nEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537049; x=1752141849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klViF86nYsD+wW5D9guFL31ffmwZysmOxfJLry7IRe4=;
        b=RiYvKsJiiEzV4nEKWyx7L8PFGasnNnA4txkmO2RrecYV+sPBhrOG54UTgnkKwivJsN
         7gd2fzpuJxVMVAmDOwvHmQqTD8Jxzb8NRROqrniILyiXr65/H+e29U4bxn4IDyrVP3i1
         x27prqpXYVz+AlbPBXlQ6pUWQATx2h0DvGmgFdwkcQA1iYI2F5QkVjQAZzQSX/5vXtfa
         n7hgvdzpt3PW2ZMIqPbzc2eRzMqHvuYgdi8HY6JV++VXDKdwwDHDVJhr6qRiprFPwCVn
         jpYFKxiqqowHtlAdfkF5SBdZzJ6Mu+Omi+uUUPii4NChU5xZ7r9AjQqyX0cDengHdcwH
         ljYw==
X-Forwarded-Encrypted: i=1; AJvYcCX7B8zKxmbeAmnpleeuHKCbOVqOMYb6ViPPz+y+SjTlxyVyyrYgxXqSOquPwNstn97/GJ5B/tv+Wpw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1ldI10KWaFMMzdrzhuas7yu5+JyXAhC/9xv9VZ3avr8etOFTo
	7T6ntNIkabsmgEgfAB+YTDNLfidBD183P63pBGhvSZmzVNiAECrkVh5GwNhPmMvzmg==
X-Gm-Gg: ASbGnctIg8rwCsHpSb1Mr82x6skKsI+RIJnTcHptR4rDCcMxjcVZCCwyqccFwLAhCU/
	aAkw7abJPFFHgd4J3Q0pP7RJKKZYoguOVm4zqrHtChkNnoBI0RTD1TsfwLBLTb4qHuE7ys+RGyu
	3qMB95fN4lkCLzdD5vl3kmaE7MhfaNy9/QDtmoiSV+owK2Y3Fu0liWXZwrGh2C4DyPLFPwxsMdS
	fW/0h6d+MgdfXoTq4vjM3mymEiPvdGmeo5XAzlMLJpJt/9nWhBeFlLAb4mZK7XUvRD0+dFjMzQX
	ANjtdf5j9MWdH5V8fzRo6eMmByvh/7AAGfIc7l8+Bbf8v+W3zlychFn75QvD+WAJR9pduFayN7x
	IffRIuXzIHE0O3tU4RJ2Xgfo4qjxsX+1dMa1ZVulEmO4Rbp0=
X-Google-Smtp-Source: AGHT+IFokes5jkrvd3qEQ5b5DNxOlk8XVVvpaT7F9lHE0VDa0COouadR/PgTBZTqiImrGoSDRyQoDA==
X-Received: by 2002:a05:6000:2d10:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3b32bae0da5mr1504637f8f.11.1751537049305;
        Thu, 03 Jul 2025 03:04:09 -0700 (PDT)
Message-ID: <e599c29f-03e4-40e7-99df-33b7f2143fbd@suse.com>
Date: Thu, 3 Jul 2025 12:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Arm: tidy page_get_owner_and_nr_reference()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d330757-ed73-42bc-8634-e8d445f69c4c@suse.com>
 <d6ac150c-b2c0-4d90-af1e-64f2df151e60@xen.org>
 <5e52900c-97fb-4895-bde5-33ccfb132986@suse.com>
 <079ead0e-e613-4c58-89f4-8a0df1294ba9@xen.org>
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
In-Reply-To: <079ead0e-e613-4c58-89f4-8a0df1294ba9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2025 10:52, Julien Grall wrote:
> On 02/07/2025 14:37, Jan Beulich wrote:
>> On 02.07.2025 15:18, Julien Grall wrote:
>>> On 02/07/2025 14:06, Jan Beulich wrote:
>>>> When the bumping by <nr> (instead of just 1) was introduced, a comment
>>>> was left untouched, and a bogus ASSERT_UNREACHABLE() was inserted. That
>>>> code path can in principle be taken (depending on configuration coming
>>>> from the outside), and we shouldn't assert anything we didn't check
>>>> elsewhere.
>>>
>>> I suggested to add the ASSERT_UNREACHABLE (see [1]). My take is the
>>> overflow is not something that should happen and it is good to be able
>>> to catch very clearly in debug build.
>>
>> But catching an anomalous entry in DT (which aiui the values come from,
>> even if perhaps indirectly) isn't going to depend on people using debug
>> builds. It depends on what DT blobs they use. And issues there shouldn't
>> be checked by assertions, as those blobs live outside of Xen.
> 
> I agree we probably want check upfront. But I still don't think we want 
> to remove this ASSERT_UNREACHABLE().
> 
> By the way, I am not asking you to add those checks.

Sure, I wouldn't even know where and what. I can re-send just the comment
change, but that would feel wrong as long as the ASSERT_UNREACHABLE() is
actually reachable.

Jan

