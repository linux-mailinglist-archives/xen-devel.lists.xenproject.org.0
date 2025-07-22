Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA0EB0D4B4
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 10:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052173.1420756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8PT-0007KU-Dq; Tue, 22 Jul 2025 08:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052173.1420756; Tue, 22 Jul 2025 08:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue8PT-0007HM-AG; Tue, 22 Jul 2025 08:31:39 +0000
Received: by outflank-mailman (input) for mailman id 1052173;
 Tue, 22 Jul 2025 08:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ue8PR-0007Fc-Rl
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 08:31:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47fe6697-66d6-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 10:31:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3096421f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 01:31:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d23b5sm71550295ad.146.2025.07.22.01.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 01:31:35 -0700 (PDT)
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
X-Inumbo-ID: 47fe6697-66d6-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753173096; x=1753777896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XyFkrz3mLybfomzZL8D539G5ARSYq/XE/aDkt1zjtKk=;
        b=AmhqTnfVKnIlBWx7Cvw2tm/8SqsS98DA1MAHHpHTvmhaBMSmXk7JHrN5hOH+D/MTSd
         Q2fha+CspT6fkTO1B1MBiSpXvRMBevsJ61p3T08JXCg7+cP0ho/rIFM2exPbGZIBdPIL
         n55CDxA0DW8CPJDJS5lv8AYgoeX2pz41HhnoneeO//eVi5Rs63nKCXN/H5NcaBKxbqKx
         sKzyVLcDawenV7NL731XN2B0WX3TXLIEvfM0DfaHq/jnA1dHM9/E26tVdvMVjg4XfD43
         Hj2CiqlUM0UZuHJhiHkk+9uzwuBh4eP26bGsLA2U/++ky/vYeQYGjUAsB4I09W2uBgYj
         6CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753173096; x=1753777896;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyFkrz3mLybfomzZL8D539G5ARSYq/XE/aDkt1zjtKk=;
        b=G46cE3xkP9LhYUKISNDMchpgL/AxTs2YGwb6+0ivZicVN8peo7p8pZgD6TnKwOhTd8
         QtYQABo4Os/VWw/2pQ+K0dSgARAP46rJfajOm+tndrzaXp73gPlnUkVGJ33XJK2SQ61/
         /ohNMMQNMAIHkK1MVY0wswLfWTBJBWTxW1WVwUher7FgAQQh5lNItQG/e9PWrj3/zqz8
         LW5LhFLcOv9iBp2Z/XAaCHfYTXWwZuBS4r8S2/bSSSwUJnlyFOsDWE4rhVtHsbwaNaOj
         q9OxYJV9crni4Pf3KRvBS5v7rBdKmZZD1qIpDiBVekp2v0gTdl2XThfcHFj22OSmPBKC
         dAmg==
X-Forwarded-Encrypted: i=1; AJvYcCXpTwSgHMHrsAbCYDYdzv4CVPxqWczi/Usi/h3/ZyK0IaLYFP7Y4tbcnNefBYShQLGlqZjKfeb3jfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMFZsT97kFODn3xWCCAhsHGNw/J5TOtTLg4jq76j/wAYwkPYIU
	1T8tCfame5u++EZ95JLxc62RLGiba/A/Rqx8ruMDd9GoYU+1EhOp0qj3AM4EWDPTgQ==
X-Gm-Gg: ASbGncum+jzJe3HfH5ZXeu1jqCBGUXEr+m925W0lS9VkAj1IMZCOzUoh6U2l57f1h1I
	iu15OsWnUHU6pOjidQqPdNiWIT8j0eVLeqJzdd1T958C3Odus/qj24qOp8azRu56XmGSx1P4wqW
	y9QIN6Uh9H+UiKbUIjjdumkQ1WF8j3l0GgVT8V0zeb6uOYove+INh3CRtVvwGiQGOCha+amSSxq
	wzvICt8zOjshV/SlnWVc3bQCpuwwivo6lDQQcvGCHytyBRigzgG0AJgmcprCYlyGROKoMSc8fig
	uYe2GJU5IE3X03fB4XpgxUFNnUe+hbC8uw3RNYME06nm2/vaH3rQmHPykQXNIYiEwKYGZM2yDit
	pSwzf872gh7HtZO1urnfjejoa0H9f4Xb7OsNM73J9FDz1ceYgyYdtxPTQ3D8du261u6gtOd/GID
	baOiocUA+bz1c44LRV2Q==
X-Google-Smtp-Source: AGHT+IFxxgfL8RPzZ3+LopJI15YOiqy74+P5wZ9X7qLWJ7dSqT+d0YzkfaoQpmjvbuWauiX528udPw==
X-Received: by 2002:a05:6000:290f:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3b60e4d0841mr19887876f8f.20.1753173096046;
        Tue, 22 Jul 2025 01:31:36 -0700 (PDT)
Message-ID: <a97682a9-db5c-42f8-aa05-98ed2ce277e5@suse.com>
Date: Tue, 22 Jul 2025 10:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: Andrii Sultanov <sultanovandriy@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1752736989.git.andriy.sultanov@vates.tech>
 <464e6ef4bf46ea962f1b4438fbb5be4d302a0d3d.1752736989.git.andriy.sultanov@vates.tech>
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
In-Reply-To: <464e6ef4bf46ea962f1b4438fbb5be4d302a0d3d.1752736989.git.andriy.sultanov@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 09:31, Andrii Sultanov wrote:
> Following on from 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to
> take pci_sbdf_t"), make struct amd_iommu contain pci_sbdf_t directly
> instead of specifying seg+bdf separately and regenerating sbdf_t from them,
> which simplifies code.
> 
> Bloat-o-meter reports:
> add/remove: 0/0 grow/shrink: 4/13 up/down: 121/-377 (-256)
> Function                                     old     new   delta
> _einittext                                 22028   22092     +64
> amd_iommu_prepare                            853     897     +44
> __mon_lengths                               2928    2936      +8
> _invalidate_all_devices                      133     138      +5
> _hvm_dpci_msi_eoi                            157     155      -2
> build_info                                   752     744      -8
> amd_iommu_add_device                         856     844     -12
> amd_iommu_msi_enable                          33      20     -13
> update_intremap_entry_from_msi_msg           879     859     -20
> amd_iommu_msi_msg_update_ire                 472     448     -24
> send_iommu_command                           251     224     -27
> amd_iommu_get_supported_ivhd_type             86      54     -32
> amd_iommu_detect_one_acpi                    918     886     -32
> iterate_ivrs_mappings                        169     129     -40
> flush_command_buffer                         460     417     -43
> set_iommu_interrupt_handler                  421     377     -44
> enable_iommu                                1745    1665     -80
> 
> Resolves: https://gitlab.com/xen-project/xen/-/issues/198
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'd like to note though that "drivers:" is pretty unspecific a patch subject
prefix, when only a single component (driver) there is being altered.

Jan

