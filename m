Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36250812A32
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654317.1021092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDgwX-0007Zd-Ci; Thu, 14 Dec 2023 08:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654317.1021092; Thu, 14 Dec 2023 08:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDgwX-0007WI-9t; Thu, 14 Dec 2023 08:19:41 +0000
Received: by outflank-mailman (input) for mailman id 654317;
 Thu, 14 Dec 2023 08:19:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDgwV-0007Uu-SM
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:19:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8549a4ed-9a59-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 09:19:37 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a1e35c2807fso1030806166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 00:19:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 li14-20020a170907198e00b00a1f738318a5sm8458002ejc.155.2023.12.14.00.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 00:19:36 -0800 (PST)
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
X-Inumbo-ID: 8549a4ed-9a59-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702541977; x=1703146777; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrQ8YIE4d3/Tpmw4bfYbiJUfruiQo02dLt+ivl0HW0k=;
        b=Uc5Z3Mi6l7ZFDTiH7bKuHtk0A0kADUT1zSRuKKRiR/jUS9k+EXNbwOuN/7CCaVqOjZ
         F/l8kVHc1LTex3VCRop7CaY5GWKEcP3dSa3sXhIbgT6JZO8iqG5450nMUdtdDokMxXil
         Ri3cI0qEQokPr6N0pNHadrApIr5PHFRN2Fb+UM2uqmyo2wzOhk0ud8nAG6pUzFR/yV8b
         MITcaFJPOeSiM7DKps5gZtQUrof68amy2mCyTZ1p21z/H6cbHFtpV7hBVX02qDzZaPcb
         WGetqUUYu1w5nkwAgnk6jKZeo5kXC0TpF/roxB03XbDif8PtZMWnar55nuIVPsljjZti
         kgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702541977; x=1703146777;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrQ8YIE4d3/Tpmw4bfYbiJUfruiQo02dLt+ivl0HW0k=;
        b=hHY58eIJmfxChYfyW4ijM0tbKPZytjIoFfyGKeCIIqcVScnsyCIdmoly6bvSqlb+s1
         84o+OdiJXoNBo/Q17Jmz0mL+ErHZzhu31c/DitsOVxDN1qQspmsEMkJvm6+jWOKzH3B9
         K6oNailHoZ8L2U69jOhUhZV6lmZYzi90jKTqZTwVl2QcnvS3qWR+woqu3PiZR6YW1/da
         S2DplerPZDJBxelhp603AFqqy+MfZAXxJHnqxPSR6wlO70aMq0wJF2o+btgAst8FZGg5
         0Pa3I7ZwEfDSO++2syRW2tNG7oPgcM1Vx0DQQ6+ivtFUp2s/q89ajC//C0o0TwlTFY0U
         bNEA==
X-Gm-Message-State: AOJu0YyluTeWpWhLsRPMuMrqrP24YVxBoSqqJR6Qm/mTKhnuxBAuzPa4
	246hsQBNaHqT59shrIsJ7TPX
X-Google-Smtp-Source: AGHT+IHMXm21ZR/s64JD6ZQKqscq7Asau/DzT3mtW4nQ5PjZR7GclX1foS5GCls4aRCdC20nCL2lMA==
X-Received: by 2002:a17:906:5354:b0:a1c:aebe:6104 with SMTP id j20-20020a170906535400b00a1caebe6104mr4576636ejo.85.1702541977081;
        Thu, 14 Dec 2023 00:19:37 -0800 (PST)
Message-ID: <794b304e-d11c-420b-91e9-4d226f492d93@suse.com>
Date: Thu, 14 Dec 2023 09:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] livepatch-build-tools: fix misuse of script directory as
 work directory
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20231213135147.6749-1-roger.pau@citrix.com>
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
In-Reply-To: <20231213135147.6749-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2023 14:51, Roger Pau Monne wrote:
> --- a/livepatch-build
> +++ b/livepatch-build
> @@ -25,6 +25,7 @@
>  # script.
>  
>  SCRIPTDIR="$(readlink -f $(dirname $(type -p $0)))"
> +WORKDIR="$(readlink -f -- .)"

More for my own education than anything else: Isn't the (standard) pwd
utility intended to be the "canonical" way of getting at the current
directory? Its -P option (apparently what would be needed to match the
-f used above) is also a standard one afaict.

Jan

