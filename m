Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8831F854B71
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 15:31:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680847.1059005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGI5-0006BE-1W; Wed, 14 Feb 2024 14:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680847.1059005; Wed, 14 Feb 2024 14:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGI4-00068P-V7; Wed, 14 Feb 2024 14:31:12 +0000
Received: by outflank-mailman (input) for mailman id 680847;
 Wed, 14 Feb 2024 14:31:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raGI3-00068J-IR
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 14:31:11 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1c9bd60-cb45-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 15:31:09 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so24605351fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 06:31:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dd18-20020a0560001e9200b0033b3d28ef1fsm12486651wrb.65.2024.02.14.06.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 06:31:08 -0800 (PST)
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
X-Inumbo-ID: b1c9bd60-cb45-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707921069; x=1708525869; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=34Uxz0mARJ0/GDBpjpC+NYRes3/sgTgBpejJlKX0Dfs=;
        b=RQaFTE3m9Jgb70pU0TEfX5guRwiOE2h15YYk8RzCRHr8w1Le2Xmsyxy0R+N9+tDULY
         X0t3x+ioiHGNks7eSYzAv0XSOCPZ7a/9X/UGQINadhk0otsHP8+6+6jV84EXpO18p9RU
         7unkP7+uU6YRJeckloNHnUO4uHtrGQzLuR1wtrE475RHVr3sYh6+v6TuaDYH4MY/zJc4
         HndLaCpFFWFjvu8yH+GeKoLZ5G9iu1bh2cpefnm9XXR91VqQluzjrwqt76JNXeGmsYUw
         ip8rQttagE1gnjfXkXXtgH6zq5qJxI7KRAumqXZwRKlMxmhdjDjp9lx3PqUwetovEOfl
         Vo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921069; x=1708525869;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34Uxz0mARJ0/GDBpjpC+NYRes3/sgTgBpejJlKX0Dfs=;
        b=AY4dd+G0gf89hWib0pHwsbAXF+SZxL1QtfapgeslFLWQiXscKMauKFDbM+/PwGpdc5
         jmpiUo1XQKRczt0N0Bt8Bf1zqsPlvkGW6xqCnuupYGvkq/cDEKx7Tq4royXAUU77iOe3
         pNOxuGCQRhAq6IuuiBV9wbrcwO1c8PacxBJFLxIfyKbt6Cw674XuOKi4KDw/MFz9dY6V
         LH8DJ/UPyBDS/V4L+sMB0mGzsvA277vUZsOSggtY4hypM403s7T5hdQ3ypAwA0v2r7kL
         sn6Mj4rY1wIShiPBU9AqvUrywBjylm75Jw8vjc70ZZoZr+BVSZTHhFQEG1BovYYFjVi/
         6wVA==
X-Forwarded-Encrypted: i=1; AJvYcCWmYR4GU9BKiMgFMgmCPJYErpG982ipzCCrsL2SDJWaiScsxt3wL9/1NxIfnczCitv+R+SHNI6Y/g1BSUhKdPsfChA0ZXXH4AlKOoBTJjw=
X-Gm-Message-State: AOJu0Yx1OCDbB10ybbdwOSOnlx96v40F/MgWxXck4yxzeFjgG0BGDe3g
	6Lgv9B54sRBav2rUzYecaSbGzUStQ4adr2KVLFkWO6sg/Q133bqJPUv5gBSwXQ==
X-Google-Smtp-Source: AGHT+IEkeU9GnF959IYjUG8fah4p9oMZwLWLxWxecKhuf+Gv8grjypqmmcLconweJCD9q4YJjz7JyA==
X-Received: by 2002:a2e:a601:0:b0:2d1:1cd3:7dfc with SMTP id v1-20020a2ea601000000b002d11cd37dfcmr1167736ljp.41.1707921068705;
        Wed, 14 Feb 2024 06:31:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaeW4XDJFW2NHtOECwidw1AWLu7uZp/unKchGSaF8uu1FKKeO5fcRnMvX/mpnz5AXS/rY9ZLRsP0otMDVTDkjY5VICSQzUKf482m+zX+ek1mUmCKJ0kUNX0d8PCQ/4teyGa/n8hvfzB+Q=
Message-ID: <898fe19c-1f6c-4efe-a4bd-ac83c61757a2@suse.com>
Date: Wed, 14 Feb 2024 15:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iommu/x86: use full addresses internally for the
 IVMD/RMRR range checks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240214103741.16189-1-roger.pau@citrix.com>
 <20240214103741.16189-4-roger.pau@citrix.com>
 <16de2e3e-7807-4754-852b-e486c1fde95c@suse.com> <ZczIm37J3WBQPYsx@macbook>
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
In-Reply-To: <ZczIm37J3WBQPYsx@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 15:05, Roger Pau Monné wrote:
> On Wed, Feb 14, 2024 at 02:29:35PM +0100, Jan Beulich wrote:
>> On 14.02.2024 11:37, Roger Pau Monne wrote:
>>> Adjust the code in the checker to use full addresses rather than frame numbers,
>>> as it's only page_get_ram_type() that requires an mfn parameter.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> In this very shape I'd like to leave this to Paul or Andrew: I'm not outright
>> opposed, but I think this either goes too far (most type-safety being lost
>> again), or not far enough (both callers convert addresses to MFNs, just for
>> them to be converted back here).
> 
> I don't have a strong opinion, given this would you like me to adjust
> 4/5 so it can applied without this patch?

That or we first wait what Paul/Andrew think.

Jan

