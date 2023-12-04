Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E00C803AF4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:56:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647201.1010034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACEV-0007Df-PU; Mon, 04 Dec 2023 16:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647201.1010034; Mon, 04 Dec 2023 16:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rACEV-0007BN-Mf; Mon, 04 Dec 2023 16:55:47 +0000
Received: by outflank-mailman (input) for mailman id 647201;
 Mon, 04 Dec 2023 16:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rACET-000780-PC
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:55:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f66df2bf-92c5-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 17:55:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso18631485e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 08:55:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003fefaf299b6sm15608248wmn.38.2023.12.04.08.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 08:55:42 -0800 (PST)
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
X-Inumbo-ID: f66df2bf-92c5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701708943; x=1702313743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgAteeg6LMJxGIGHWSA1PXYNRpVdIA3VRULDp+0+gDE=;
        b=YpU13M5vczURTFauLrW46+voAJrAqSLgXD3lHP1iesRKQyWIx1/ps9D7HIIkYQ+Jml
         1iG9/hHO5EpWw7zFc5FXe2+UCjhGPmTMAYRsF1pKQcqHTVqi5i08WLewsDbtHymSILu2
         FzHtkUlmQXMiEHHDdlWrI9XoOlB9p+w1o56dV3oCeMqSDQGSm1uM1AaWsAmvvjrtfQmb
         WN7wV4AwAX9ow+m3c3P1WdKWM5cOkB/AdtO6aNuJ2Tv9AHbnIcw3o88YUSYYH0V4eWmc
         vnVANqFXNdgLT+SuUbpTv8+r4pYCBFd6KOpRtMEdktyBRjjoy+C7zntKXQoLefZHyMAr
         SDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701708943; x=1702313743;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgAteeg6LMJxGIGHWSA1PXYNRpVdIA3VRULDp+0+gDE=;
        b=MfrmQi0GBlBD0619tLE2zyviSOt6VC+r4EAWqfdYqWeI3/3ppMhjbDggDMmnXQX5rN
         18OC/ExwwoqmBs/y5YL+5InbphvKJIulC6f5prpf4NuSB5zWFt84bRVWv8kSF/Kzyj9y
         5oThvVOWTNDXBPlYaFyYMVNIZGB2WcX+JGxKtdDcmvz/wes6C3iFOe5jHBcXjpKxDBPT
         ZJ3+iSY1vxZeMd9aGY8Pkq0jvmQMRZxWk3PJVA6lsdDDsfzMtP43/pBtqK1N+Npq1xmQ
         V4FFcTTKUuqNxJR5SyUlQvXMP0vjjmyDkFPe+xlrjDIKephnXVbTUxY57hBG4Rf6NfpB
         BgfA==
X-Gm-Message-State: AOJu0Yw8TWDoTBILy9O1vO0A0KfqM3mnJrfbK+GN+PnAXSa5vUlMxwie
	VJhuBnAF18drFEfhE6Zh8Jm8
X-Google-Smtp-Source: AGHT+IE2HUbNIQhnb+kR6yWdNdShkuaLva1gWtraEKxFG5xrbcNadAj4slZK14MRdgq/Pomtk7rVOQ==
X-Received: by 2002:a05:600c:2041:b0:40b:3056:7420 with SMTP id p1-20020a05600c204100b0040b30567420mr2862379wmg.39.1701708943241;
        Mon, 04 Dec 2023 08:55:43 -0800 (PST)
Message-ID: <34f5d241-54ad-40c6-abd2-46d2c65514af@suse.com>
Date: Mon, 4 Dec 2023 17:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/sched: fix adding offline cpu to cpupool
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 xen-devel@lists.xenproject.org
References: <20231204152321.16520-1-jgross@suse.com>
 <20231204152321.16520-2-jgross@suse.com>
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
In-Reply-To: <20231204152321.16520-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2023 16:23, Juergen Gross wrote:
> Trying to add an offline cpu to a cpupool can crash the hypervisor,
> as the probably non-existing percpu area of the cpu is accessed before
> the availability of the cpu is being tested. This can happen in case
> the cpupool's granularity is "core" or "socket".
> 
> Fix that by testing the cpu to be online.
> 
> Fixes: cb563d7665f2 ("xen/sched: support core scheduling for moving cpus to/from cpupools")
> Reported-by: René Winther Højgaard <renewin@proton.me>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



