Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ABF8CAD58
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726864.1131262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NfE-0006Cj-M1; Tue, 21 May 2024 11:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726864.1131262; Tue, 21 May 2024 11:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NfE-0006AM-Il; Tue, 21 May 2024 11:28:16 +0000
Received: by outflank-mailman (input) for mailman id 726864;
 Tue, 21 May 2024 11:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9NfD-0006A9-4U
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 11:28:15 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35937591-1765-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 13:28:13 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so738931866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 04:28:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1787c6b1sm1600780466b.57.2024.05.21.04.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:28:12 -0700 (PDT)
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
X-Inumbo-ID: 35937591-1765-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716290893; x=1716895693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvNaK8MD3i0AfYF97GM7SS5tHhq3J9SrugfKg1Wn3dM=;
        b=a8Ihd99oBmjWTUsLa3Bq+JO1/rpA9JIWbMK5OA3/fmxFTYhUPpFcgZ1WOcLLOeDFD9
         PC8XJscmLmH1XX74N4oQ/FEW6PSKnoD3fkuuJCYMfIF7IJlhzAkHLd2mf017UUj7gOU6
         EsLelOBxWpv6FSct1ZfhznTVragXWZFqIEIOEml9VdWOzFne/aWiCjtklAU5NXZYCMt3
         ScvE+Sc6peF5XoBJyfQr+njDavIeSaiWarAA6hmXqC+UNnLqwUFJVW27ZJVNfyer+QJU
         Z+cVmHvfebBgXtJLNsqWlhP5pO2jkTk4sUygp6S+rdV8ZeDRQ/Vc+/U0Zbpb49HfW9mE
         wQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290893; x=1716895693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvNaK8MD3i0AfYF97GM7SS5tHhq3J9SrugfKg1Wn3dM=;
        b=dqnjXslmtMK3jCkitb3kXXmzvyvpk4WuqkTS8lgcuWF1Oz0gqVYw8t/b2ip7lHmpze
         E+NTiuhx7e5ufdcHr09Gju76ifJT1hEA75ys6N65Z2PmVrnSvCbpr3vQiWgI4fvWyrKp
         aHWKfgNpAIt+A4N41utUjCsfsp8dbLeGUrimp5yW1Cx2OmLcLyJykoV4WNW9VEPW9p6D
         UC29YsVkRVMfJnFGqMTWlkEAsCIp7o5QhtGtowjaw7eqhU/mBOs2DC5gEz2/LDtTWnKG
         dlWIVp5u1OPL7FWJOXnuCvSeJIe7AOGncVPSA8Msw8EYv1GPwFn/J8er/DvR7FHY9xYO
         k3SQ==
X-Gm-Message-State: AOJu0YypJv9XXvHaAxXc3maqMqF/nUqgakBuCiXwz5HTJN6RGK2qPw6V
	CoZu4OWgO1YqXThscJPKDyg3T+L+/U23xSCfg7PCZ9WZuApjOfeR817qAKj76g==
X-Google-Smtp-Source: AGHT+IGZtPQ06uGP7qQfEEIzoGQ7y6rDYNuaKr0uQs8NQVuiptnvunBDxKN2yiEI/3HBrBzeYQprcg==
X-Received: by 2002:a17:907:7d8e:b0:a60:c514:31d9 with SMTP id a640c23a62f3a-a60c514327bmr693315566b.6.1716290892690;
        Tue, 21 May 2024 04:28:12 -0700 (PDT)
Message-ID: <1dc3b47d-b1c5-4ca6-9dd5-097e5e873f9e@suse.com>
Date: Tue, 21 May 2024 13:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] x86_64/cpu_idle: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1715757982.git.nicola.vetrini@bugseng.com>
 <6c84f6f0bf93a00ab1acda2d39d31b1f3d5bf8aa.1715757982.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2405151619410.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151619410.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 01:19, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



