Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD75938E1C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761757.1171784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrLw-0005JK-9s; Mon, 22 Jul 2024 11:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761757.1171784; Mon, 22 Jul 2024 11:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrLw-0005HL-6T; Mon, 22 Jul 2024 11:37:16 +0000
Received: by outflank-mailman (input) for mailman id 761757;
 Mon, 22 Jul 2024 11:37:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVrLv-0005HF-CX
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:37:15 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd4cb903-481e-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:37:13 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5a156556fb4so3136876a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:37:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be6f8sm413590366b.76.2024.07.22.04.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:37:12 -0700 (PDT)
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
X-Inumbo-ID: bd4cb903-481e-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721648233; x=1722253033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=83Tf05iTvWz5wbdQmoByoXLmb8VWV7O3ZZf6bjethsI=;
        b=TI4dR0+EIrIqQbz/wPl4yaGOPxs7CnS7o+LSN90nH/xbSiiKHR+Z+bSas135gOh/eg
         cMBAl5fu8xVlqjSwPkOBVgr4XAPzYQs0aYMGU6TCsgaAmFqhIFexThFcwDK93s8tG54S
         39FT0vp/Pwvh/UW+oXZPNV6fsbsBjbeSdLqfM+7fNOoFwaIImiifaz0eze8fM4BcqH5z
         qJSTavjCVVMnKOhdDwh/dayimK6WlXj5aCCiGaF5YKvugyJwFBnn+TYZogJmYnhhBHN9
         /PKZUvKZ30l8wnaHpBuXQCdk+pRVtkEF6Ira1aK45vgbPrMc0XGGdpVyOa5l5I/2Qd+5
         KFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721648233; x=1722253033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83Tf05iTvWz5wbdQmoByoXLmb8VWV7O3ZZf6bjethsI=;
        b=mlMA/KfywR96ZPQHS5dFPgXz3oGtL3fWx0i2d2ejkZCTjmVStJkzbIpP4FWvgykl2l
         4a95rIFsj+DlUZJsymLfYvIJVMz2k1o39yXwCboh6lV/8AFuZ/GIRlQsDFpyXytUup2l
         5PL992RMUZcKf+DXFvJzRCMTQSMTufRcwo6desRoTNA9El61IeCaDd2cmODDIMJ7WLG3
         aMrf954BjQs1vJohk8OTf2LHCXjyTX9tKDXs22aUQUg912NtHgWRmbtiwlL2/ywOMAwy
         BkbCPdsi6AP6yt7wVBHUwqP0qx4iMDMrodvs1KPmUItkYMOV549xrXV2StEvoS/ZhIPn
         UfcA==
X-Forwarded-Encrypted: i=1; AJvYcCV0MhNtCJW2DMELwa2EQHwIf7fv6TNj8Q9itsvKTA8Z4gjhJmQwq9M+DVl7z4NDWxlC3wPL0etaKQ7QnRSrMyP9EkhNKkN2rQut9TdI8xw=
X-Gm-Message-State: AOJu0YzxTCbM6OpNS+FpOGNUQ9fmBL60qAQAMYSgEFmhgEgmPBOH+jjR
	H0DyZM7JLgNVBt+2cPK4zfbbq/gPaugYBq/h3fE5GViZuFl5nr7v9IL43NGA+w==
X-Google-Smtp-Source: AGHT+IEobDaKnCJ/okT4fo5nG8cUaZSQ2HcEYS2pCETVHUNp09fWbeqvR7GfBZPTFdjzHMUPedLnmw==
X-Received: by 2002:a17:906:7950:b0:a77:dd1c:626e with SMTP id a640c23a62f3a-a7a4c41c000mr463187166b.60.1721648232909;
        Mon, 22 Jul 2024 04:37:12 -0700 (PDT)
Message-ID: <12e2c7b2-6d0b-4427-ac30-257bfea2aeab@suse.com>
Date: Mon, 22 Jul 2024 13:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com>
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
In-Reply-To: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 16:21, Matthew Barnes wrote:
> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
> startup.
> 
> There are efforts to support a maximum of 128 vCPUs, which would involve
> bumping the OVMF constant from 64 to 128.
> 
> However, it would be more future-proof for OVMF to access the maximum
> number of vCPUs for a domain and set itself up appropriately at
> run-time.
> 
> GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191
> 
> For OVMF to access the maximum vCPU count, this patch has Xen expose
> the maximum vCPU ID via cpuid on the HVM hypervisor leaf in edx.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> ---
> Changes in v2:
> - Tweak value from "maximum vcpu count" to "maximum vcpu id"
> - Reword commit message to avoid "have to" wording
> - Fix vpcus -> vcpus typo
> ---

Yet still HVM-only?

Jan

