Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B2CF442E
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195484.1513419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcm2o-00065h-SF; Mon, 05 Jan 2026 14:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195484.1513419; Mon, 05 Jan 2026 14:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcm2o-00063d-PQ; Mon, 05 Jan 2026 14:58:54 +0000
Received: by outflank-mailman (input) for mailman id 1195484;
 Mon, 05 Jan 2026 14:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcm2n-0005rw-F7
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 14:58:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb727b4-ea47-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 15:58:52 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so9052395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 06:58:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa477bsm101221912f8f.36.2026.01.05.06.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:58:51 -0800 (PST)
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
X-Inumbo-ID: 0cb727b4-ea47-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767625132; x=1768229932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WqetD6V/IMpK5hubDRuG4yjp9MxO0CO+FnQXl4IocwY=;
        b=ePCAW/Fw6ejMsQYS1AaWZJdUe2fzC9hdUwLygUjDVV5zzFNc9NmmSH8/PxpixD4v2U
         hKenkkZyGWzfUICJ0QLlSsT1K5WDKwo3VneruUDrwzTHuNCyKRn+GKt5f9PF6jHNUTPU
         +FzaLnxSUHScPHnZnJqUT+V4WqjKgdN4FCyIMy7+zDWCerOO3msKT7zYI0xXMVNvLOmr
         SuqLSGdrgtmPi12oAk4GiAMmUJxl0p3MpDyjoNFD9gIY9hPlx48KUUDPBM88gfd3ztW3
         xvnzMgBkHTr7F84rY+Oc5XJDkZJJJYTvmpPPIZzIzViXtlwOdhKaiGkDPPmTtIYTuED6
         BbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625132; x=1768229932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqetD6V/IMpK5hubDRuG4yjp9MxO0CO+FnQXl4IocwY=;
        b=fGvRd06vSbf5azrFnLA9DxImZuQjak8ObWUA8eDC93kR7bM1h+NCxoSGwNMoqkwcSn
         k7fDr3UHGG+VPpZ3bhI8IGBtugtU5H7vmkQAlkGpBP7BkMwYtqTcQsLq1Kr40FMw93b7
         tQcAAzuWhKuCZB0Nrg8ECOrYYGwSqoq5zWDph1CQfdZYKnC7Zxu4YehTE6xGb58RS/hF
         ckAmpdvadTpHRX52MdtSSZfsI7QRPijLJtXStKKXvySEFaBp6q4FGAPc92iIY1nwi8es
         2Qc0qTojKEjwbSldl0UzYzBlGcnXsVFrClpOkS0DAIDsdjsMDurkwWv3fC0y1EhI8xth
         URww==
X-Forwarded-Encrypted: i=1; AJvYcCX9ISYIBAAUAGWZMWQMf5gaqHUrKLN5fdR8mXxXP/mo05vMPluPcy3UaB+q1NbUCKl2QBh8IgKbzsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQeRZMPNI33V7mGtaUR+i5+gN63HvWptw1dtHqJ51V3+ENLwiB
	7rZTGvNRARU1wdykEFghQPtKTQCSlJxtN3wEaGQCgMmT4V15kvU38n5J8crQj6jyIA==
X-Gm-Gg: AY/fxX4tclW/JEXbraz13JeJyVSYxlJmf+3TSkrHPJRIICO99+g31TZVNVAxYLz5LVW
	kLiLybVzwJ7Xy8a4IWWJpkZfS/X8af3i2AjUJt7gPloS7QEnzQnjeGKk5uJPIm+omWkLI6c1xMI
	QJe8D1UHpWno16KvEDLnT4G+Snaq0krzrRfQ/V5tmU4Z2ZuNXqbTR5E16ng/98MpPuVYWwNIzWj
	6Srnk+4Ykg8i5/vVYb9X5dvP0EX9LJqeZhT8CpigVBQlzQh9IN2tFzQH1Dix1cv35ceyuMvZtAx
	Mn1eDB0eMVk1nj6rGs/9CkQN9TbVupvVhisO8ErEqPPVC8sSdqzFVT6qLoaeZWvEaTIw8h8OGyo
	KS3M8VmJwDFg/5n3qf3L9k6iwVUXugk2MVU5fR4RmITlookzwmwVdN9CHzsWKyBPgr5WD+oxkzq
	83yMNjbFcfXTMAtXi2x7xb1YYH1OaYzdSgVR/ZHgg6QUAdq4/d2XzF8mt79klebm6v9Fu/grJ49
	C8=
X-Google-Smtp-Source: AGHT+IGz6Emlozjr23+vwG+3LC9r0rxGWde1xnh1CzSOlduyPz5YYy2B6jxqiCnwMdYkv7OJQ4/IDg==
X-Received: by 2002:a05:6000:2c0f:b0:430:f3bd:720a with SMTP id ffacd0b85a97d-432aa434f4amr11330331f8f.27.1767625132066;
        Mon, 05 Jan 2026 06:58:52 -0800 (PST)
Message-ID: <1ab74598-52f8-4579-b281-bc4e482e2ed1@suse.com>
Date: Mon, 5 Jan 2026 15:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Extend eclair-*-allcode to enable as much as possible
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260105122436.555444-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260105122436.555444-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.01.2026 13:24, Andrew Cooper wrote:
> On x86, this is basically everything.
> 
> For ARM, CONFIG_MPU and CONFIG_MMU are mutually exclusive (with
> CONFIG_STATIC_MEMORY in the mix), as well as CONFIG_NEW_VGIC being mutually
> exclusive with the other VGIC infrastructure.
> 
> No functional change, but a lot of new Eclair reports (non-blocking).
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

What I would have wished to be clarified here is why allyesconfig isn't suitable
to use. After all that would address ...

> Maintaining these lists is going to be a nightmare.

... e.g. this concern.

Jan

>  I think we really do need
> to implement CONFIG_COMPILE_TEST
> ---
>  automation/gitlab-ci/analyze.yaml | 45 +++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
> index a472692fcb31..7a2c0bfa77d1 100644
> --- a/automation/gitlab-ci/analyze.yaml
> +++ b/automation/gitlab-ci/analyze.yaml
> @@ -44,6 +44,24 @@ eclair-x86_64-allcode:
>      LOGFILE: "eclair-x86_64.log"
>      VARIANT: "X86_64"
>      RULESET: "monitored"
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_ARGO=y
> +      CONFIG_DEBUG_LOCK_PROFILE=y
> +      CONFIG_DEBUG_TRACE=y
> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
> +      CONFIG_EXPERT=y
> +      CONFIG_HYPERV_GUEST=y
> +      CONFIG_LATE_HWDOM=y
> +      CONFIG_MEM_PAGING=y
> +      CONFIG_MEM_SHARING=y
> +      CONFIG_PERF_ARRAYS=y
> +      CONFIG_PERF_COUNTERS=y
> +      CONFIG_PV32=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_XENOPROF=y
> +      CONFIG_XEN_GUEST=y
> +      CONFIG_XHCI=y
> +      CONFIG_XSM=y
>    allow_failure: true
>  
>  eclair-x86_64-testing:
> @@ -104,6 +122,33 @@ eclair-ARM64-allcode:
>      LOGFILE: "eclair-ARM64.log"
>      VARIANT: "ARM64"
>      RULESET: "monitored"
> +    EXTRA_XEN_CONFIG: |
> +      CONFIG_ACPI=y
> +      CONFIG_ARGO=y
> +      CONFIG_ARM64_SVE=y
> +      CONFIG_ARM_SMMU_V3=y
> +      CONFIG_BOOT_TIME_CPUPOOLS=y
> +      CONFIG_DEBUG_LOCK_PROFILE=y
> +      CONFIG_DEBUG_TRACE=y
> +      CONFIG_DEVICE_TREE_DEBUG=y
> +      CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP=y
> +      CONFIG_EXPERT=y
> +      CONFIG_FFA=y
> +      CONFIG_FFA_VM_TO_VM=y
> +      CONFIG_GICV3_ESPI=y
> +      CONFIG_HAS_ITS=y
> +      CONFIG_IOREQ_SERVER=y
> +      CONFIG_IPMMU_VMSA=y
> +      CONFIG_LIVEPATCH=y
> +      CONFIG_LLC_COLORING=y
> +      CONFIG_OPTEE=y
> +      CONFIG_OVERLAY_DTB=y
> +      CONFIG_PCI_PASSTHROUGH=y
> +      CONFIG_PERF_ARRAYS=y
> +      CONFIG_PERF_COUNTERS=y
> +      CONFIG_STACK_PROTECTOR=y
> +      CONFIG_UNSUPPORTED=y
> +      CONFIG_VM_EVENT=y
>    allow_failure: true
>  
>  eclair-ARM64-testing:


