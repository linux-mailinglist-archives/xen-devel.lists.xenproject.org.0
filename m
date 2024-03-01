Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E086DC9F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687544.1071146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxom-0005T2-IL; Fri, 01 Mar 2024 08:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687544.1071146; Fri, 01 Mar 2024 08:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfxom-0005Qh-Fl; Fri, 01 Mar 2024 08:00:32 +0000
Received: by outflank-mailman (input) for mailman id 687544;
 Fri, 01 Mar 2024 08:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgAT=KH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfxol-0005QY-HE
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:00:31 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c54e944e-d7a1-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 09:00:29 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so2937219a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 00:00:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056402100600b0056536eed484sm1333175edu.35.2024.03.01.00.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 00:00:28 -0800 (PST)
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
X-Inumbo-ID: c54e944e-d7a1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709280029; x=1709884829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TgP3Bhg8MMx/SPRD+mpmnqumdjzFozPtIfe1ED0gCMU=;
        b=aJm8vcSDo31jko9qP8sKR52kDMLc2eJvurdGDGJfgPGGCzTsU8auQ8sMWOb8eITOUf
         qA1nElt3o7uDfWtA8q/1TcS9ezLeSC9/AIU0nZh2RKhDBOrh9eoMPlib/bKnxV5zYfve
         L9O0N6fBx+3empMN/4zku0v12qO3NOOcpxS3y5ktbrQKhSAehEpWNrtxdGGUVfXGU0T6
         SNiZwflW42KizDjaF3MUNADvM1rd0+XOLnk7ZJ8ug0NtyuAFDRxLrrw06bBLoiBshVid
         B0ocB0Dd4eevx/0Vx21SsrDjpvnqXOcWHGZd4MlyrOOS6rOVjpccxMfB0ZgStb+g/uoT
         RuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709280029; x=1709884829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgP3Bhg8MMx/SPRD+mpmnqumdjzFozPtIfe1ED0gCMU=;
        b=uclrvQeKNt3F0fgWSskiyVWjiokdKOLdpCPy19i28zS++Hb16eLbfJZD2jgTWxzERX
         4YQkZ0ldVioT4xKAj/vLLMOvz934ArPzc44F6LoqVwcThct9HqZm2tJZU1QzhnBF1u5X
         ONI00TTQ5WUBT0bPRBBBipXMg05sfA6gTD+TyRUMAFg0IQXZlWfscqkKrHULs0C3C+pP
         p0pS23mqFh8mt1xNyYbqKjyLUW/EshuLvlgJduB5eJjdVXlE8f0tdAK9TOAofwZiVZWv
         7JjaI4keyQ+qmLQWr85fkFcLPaY9NdkPv4svZonZgNDAqvVou2cYgqaRfY/fdCk5Myw9
         SxQw==
X-Gm-Message-State: AOJu0YyobpkwbtPpHqBPaaoHA41AQegVVqz+n9oIVI7PIww/N8Z+Je3Z
	UFzTN7oinpXk/6z/69/hpn+lOKT2ktiuzVKNldZnKDFG3aZ53E2+/rxyO/zB6w==
X-Google-Smtp-Source: AGHT+IHoOuykpgluUCNlE3V/XHH5yIETsXFGtpYR0+G6yWhmGlXHMKeCB9Ly8OuKrvCvArVKoCi4RQ==
X-Received: by 2002:a05:6402:31ae:b0:566:1725:1c86 with SMTP id dj14-20020a05640231ae00b0056617251c86mr635537edb.12.1709280029112;
        Fri, 01 Mar 2024 00:00:29 -0800 (PST)
Message-ID: <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
Date: Fri, 1 Mar 2024 09:00:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 23:57, Stefano Stabellini wrote:
> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
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

You did see the discussion on earlier patches, though? I don't think
any of the parentheses here are needed or wanted.

Jan

