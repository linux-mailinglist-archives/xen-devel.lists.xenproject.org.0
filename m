Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C43C87B954
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 09:32:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692976.1080758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgVr-0008Oo-C9; Thu, 14 Mar 2024 08:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692976.1080758; Thu, 14 Mar 2024 08:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgVr-0008M3-8V; Thu, 14 Mar 2024 08:32:31 +0000
Received: by outflank-mailman (input) for mailman id 692976;
 Thu, 14 Mar 2024 08:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkgVq-0008Lx-Bu
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 08:32:30 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64d26b68-e1dd-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 09:32:29 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5654f700705so953495a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 01:32:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vi2-20020a170907d40200b00a45c8b6e965sm474970ejc.3.2024.03.14.01.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 01:32:28 -0700 (PDT)
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
X-Inumbo-ID: 64d26b68-e1dd-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710405149; x=1711009949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAq5lHzW3IOwT/BTYiASAU2qB4P+zsotmrOl4INl2+Q=;
        b=MKp7E2uqKWtCFRLkHWx5m+C5iDaRWC2u2TwqdsYNSQ0nMGmIhqr3Xhm/A/9fpkNswj
         +HAes7apsoJPT/BHbHC+NVb5mp8mvMrZ9JL3keE080+j3oV1XxD51YM7vk7Q7lWFmmzE
         Q2qbQj+1vkcPTeXaer2p8fMWeUGsZPgN9rQkc4lKruPlUFzm8CCrrE2oiU4rtAu5Rsoz
         YGHty+AGbmp4ETl5XK53X7HFbM395/DGsLvf1w2aT3X3Ju/DQl7W6kP4JPKbGAFYvuDp
         0pvRIiz2WdsT5xEsZIOFia2/x2LQcom5Zq6zTvXeLpQ+6el/1AVXoPjX0Q9rvKkInCaa
         KodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710405149; x=1711009949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAq5lHzW3IOwT/BTYiASAU2qB4P+zsotmrOl4INl2+Q=;
        b=SRG67mEDlBzS3mB+4yALwMFqrjtoGjcuPwR0slzCFuI/SuTn4vycwTaDNN1LTLD7rl
         NsZsEckLYJ1MvthZVYzV3h59gIAP/BTYD2ZlmRPImdRnIu1tEFriAOw4HjUUx82XvNSd
         NDqZmk3Mi/b1djCOyfF7rxWxrCCBzzIpuh3qlMwi7KQ2dfKFiphlU7jVIO/C55AYfpjI
         bvFiC6lyDOwv8Enc7ECwtOXrk2YwqACZH9U3iswmzQ6E4e4Hp/ypcdjypys9Ke0tQDOE
         r/L9D02YYhMaaYMoijjo42rrGZhMpeFcB4Cfuu8FeTVGXOY32md5i3zO7IIZHHvc9RWH
         rd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8M72xjZrBaK2/uNAHuv3uMEBP+ggAhQZuFtKrO//l1Rh+pbZP6ZdyB/JNv+C4LVqkTIpXraUZeF6cvGkuVoAWRpvjssxLK/kMiUehGlw=
X-Gm-Message-State: AOJu0Yw+jJc4Zf30AWRSF7CasAbmQVdXoAKeFHm5bcUKPs6kmAGyy0O6
	LmQUj3xV/oK+O8H4n/7ayxJ/JoILpAbagT3+kLiV3i5koXHeRJn9v51aWb5KzA==
X-Google-Smtp-Source: AGHT+IHpzrOffIcWE2Wi3cSg242I/M5nZ1oNnuAYKUMyt9f48X1FwHGz2/DA09gA2fIpxQ/VyKuWKQ==
X-Received: by 2002:a17:907:2d21:b0:a43:bf25:989 with SMTP id gs33-20020a1709072d2100b00a43bf250989mr879258ejc.9.1710405148691;
        Thu, 14 Mar 2024 01:32:28 -0700 (PDT)
Message-ID: <6186b676-660c-4bfa-a825-18ff7f0d7f62@suse.com>
Date: Thu, 14 Mar 2024 09:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] amd/iommu: add fixed size to function parameter of
 array type
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <533a2d4f0c92d7fe92aa200b64434389de546f69.1710343652.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <533a2d4f0c92d7fe92aa200b64434389de546f69.1710343652.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:42, Nicola Vetrini wrote:
> The 'cmd' parameter of amd_iommu_send_guest_cmd is passed
> to a function that expects arrays of size 4, therefore
> specifying explicitly the size also in amd_iommu_send_guest_cmd
> allows not to accidentally pass a smaller array or assume that
> send_iommu_command handles array sizes >4 correctly.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> All current users pass an array of size 4, hence this patch is addressing
> a potential issue noticed by the analyzer in the context of Rule 17.5
> ("The function argument corresponding to a parameter declared to have an array
> type shall have an appropriate number of elements"), not an actual problem in
> the sources.

While true, I think we want to consider alternatives. First one being to rip
out this dead code (thus addressing other Misra concerns as well). Second,
if we meant to keep it, to properly do away with the (ab)use of u32[].

Finally, if to be taken in this least-effort shape, ...

> --- a/xen/drivers/passthrough/amd/iommu.h
> +++ b/xen/drivers/passthrough/amd/iommu.h
> @@ -346,7 +346,7 @@ void cf_check amd_iommu_crash_shutdown(void);
>  
>  /* guest iommu support */
>  #ifdef CONFIG_HVM
> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[]);
> +void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[4]);

... u32 here and ...

> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
> @@ -390,7 +390,7 @@ void amd_iommu_flush_all_caches(struct amd_iommu *iommu)
>      flush_command_buffer(iommu, 0);
>  }
>  
> -void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[])
> +void amd_iommu_send_guest_cmd(struct amd_iommu *iommu, u32 cmd[4])

... here would better be replaced by uint32_t at the same time, not the
least because that's what ...

>  {
>      send_iommu_command(iommu, cmd);

... this function already takes afaics.

Jan

