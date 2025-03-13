Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA1A5EE4E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911504.1317914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseC4-00046N-7A; Thu, 13 Mar 2025 08:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911504.1317914; Thu, 13 Mar 2025 08:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseC4-000446-4U; Thu, 13 Mar 2025 08:45:32 +0000
Received: by outflank-mailman (input) for mailman id 911504;
 Thu, 13 Mar 2025 08:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tseC3-0003Z8-K4
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:45:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8537ae60-ffe7-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:45:31 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so5415245e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:45:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75aa22sm45471295e9.19.2025.03.13.01.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:45:30 -0700 (PDT)
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
X-Inumbo-ID: 8537ae60-ffe7-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741855530; x=1742460330; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QdOzKmn2LLe0Y8qR+H9Wrv+TpivLXMHdPDyy5F1wqHo=;
        b=MG0HjBvB5as5CkoKtkFmGrj+fXX32lfpC126VQiyHgawVem/HQ5UTaRi+GlabKNQcO
         th3e73Qj1vLwk9hPMz1p0Fx6xDNgvYSHLT2lc+1LZ8QbZHR2sc+5ryLSQwxyktMeDOBa
         Cb7vQAtcZ7icchuMkg4xH4q7t8aRJRdoyly8y9u/vQMkL67D9KU4ow2B2nlADaTD38VI
         wKFziSbsQ0q/QPhN3FFP9eCEvT4L8SMey6RV91Nc0zkCCJQUiO5tdRB05D2X5Qf3Syo9
         YJBKGwYnK3DyPO7PFS7EZiuuSDaYqH+fI1s3BBpTi76AXOL5N9szsjyRv3A/UB7SJf2e
         T7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855530; x=1742460330;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdOzKmn2LLe0Y8qR+H9Wrv+TpivLXMHdPDyy5F1wqHo=;
        b=pUgf4ZsknBBN1VDHxxh1JUu0xIUCJ3TMpmG4rrMYBXiSXNatz93lJYh8ruku63bE/k
         OSf+9XioU8Hsdd4IFbBCjfWlKC48gVriB7Sq9S1UqxOtFw5IpJ+7AsiuXwln+cyOtg4D
         WnGuXpD9+JgMpuxBCf3jH5f9nyWRCNHr1iGV+3RtYVP/U7Kp61xXmwko7ozl3/m1F1eT
         /XuNA54L3uxxPBmePdHIgGjxfE1aXfe882c9rxAJsNGru6gE8fVXTnJe21p6TsNWxh/9
         H5UeWI5mSurLSZC3ZX9NoKpnwSsOGRdA8+GZ/KDPs0V4NpoDdR2cF95V8992zX3jiNdL
         FGDA==
X-Forwarded-Encrypted: i=1; AJvYcCX2OdbY24g9gDFW6JJ986U3iJaOSgrsZ/37MPQaWx30NO8xdcfWsWhcSBo3K5Lk5UMGdHj72PsnsP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyugf2n+7+V7Aw6GOZiSXu6c8CZxFJGsCfqf9pqqT4l8LtIsjg6
	vDDq1I7OGHoWZOkwqRgJVZcwpk3lzw58sPBCPDWy/3smPwyWhrynO0C58GqR6Q==
X-Gm-Gg: ASbGnctsBjniWK+3l3HBIaRaSV6QWz2uKwCPkOzvD+FUKg8418VeGfO7iBDemBy9sJI
	lBUfp0RmJP5ACIOiwB79+avR+eWsicMSVtm1rz8iOTC9odVIobfDgapZ91f24Qem76x0zM020Y9
	yb63PLDLkmihKS8A/luO29E2+gCtnzPGxryW5c9nedMc19rkJY0YqaMX5Y4/v5halQyJq2Mr+t6
	o3BeYJl16/XaDU+mQRB9EH8LdlOIfSj4/eWtnLc0znci+cRcvt5HQGyRVna7gfWptYJ8qiNyJ9X
	OoKTfIve92wVrnr9qNWgnj4G6AOhd8KT2x95LKDFh4dOtxWvGTOMaqYB9ZkjrfhCRTJ306gfdr9
	N8XBakW+kht2qOLxZelobJLXsCgT51g==
X-Google-Smtp-Source: AGHT+IFcvzFJOcWGFiERbcS1N995pcmZL/kftda9ZrU3I85Y+6o4/v3xMI0dlVvxdKbTphP9Q7QYsg==
X-Received: by 2002:a05:600c:524d:b0:43c:f470:75df with SMTP id 5b1f17b1804b1-43cf470797emr135957235e9.3.1741855530535;
        Thu, 13 Mar 2025 01:45:30 -0700 (PDT)
Message-ID: <9143899a-06b9-4deb-a365-dea385e2012a@suse.com>
Date: Thu, 13 Mar 2025 09:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/19] xen/sysctl: make CONFIG_PM_STATISTIC depend on
 CONFIG_SYSCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
 <20250312040632.2853485-10-Penny.Zheng@amd.com>
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
In-Reply-To: <20250312040632.2853485-10-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 05:06, Penny Zheng wrote:
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
>  xen/common/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index ffc6b9d4df..fbaca097ff 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -109,7 +109,7 @@ config NUMA
>  
>  config PM_STATISTIC
>          bool "Enable Performance Management Statistic Operations"
> -        depends on ACPI && HAS_CPUFREQ
> +        depends on ACPI && HAS_CPUFREQ && SYSCTL
>          default y
>  
>  config STATIC_MEMORY

Better fold into the previous patch?

Jan

