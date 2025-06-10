Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19534AD399B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010954.1389212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzEv-0007ph-9E; Tue, 10 Jun 2025 13:42:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010954.1389212; Tue, 10 Jun 2025 13:42:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOzEv-0007nL-65; Tue, 10 Jun 2025 13:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1010954;
 Tue, 10 Jun 2025 13:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOzEt-0007n7-7V
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:42:07 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1b95d7c-4600-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:42:04 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3700262f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:42:04 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b59d0sm12472992f8f.38.2025.06.10.06.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 06:42:03 -0700 (PDT)
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
X-Inumbo-ID: b1b95d7c-4600-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749562924; x=1750167724; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fhDeyK19gibeZGsY9trGql/r1sfwOYt4mnYHfG14W+k=;
        b=CJNlo9BIeQTqMbGXHF3BHhzEZk4j/SP1u5vRa8ndLRoYe54A6uiL5uKug8yxTcH06j
         RJ+QHfCLB8Q8JHpZtXjKpL88NCWZJj/taY02NHuKM92qVtinE6RaHRV21N8QbVjXYw44
         LcrqDE23/6MKXrU2dbgRtFdUEd7rJcm8FbptOzCpg/mgsd90lzViThK8osCaZyu2fPOr
         vyd4QVLFvlQlBcNWE4X3w2IysU10eSWM9c9FNSxTkY1euqWXuQWUN3FxeWb/kkgRyYEg
         ZkbapltwNjs2ogW0laj3MCRREqIa8FkpfZ3CCXZ7Qj2/R4aubAXXMiMj2fbezX9Sd/66
         ixqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562924; x=1750167724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhDeyK19gibeZGsY9trGql/r1sfwOYt4mnYHfG14W+k=;
        b=N3ZU1lWpLNxo1zknGL0EM9fSmCjOtO/HpynUs4Rm7ciFDQ1PXdtSvcqdHHcMthYdSe
         HzSsdNJ4BnaKih2unU6tE45dS5nHTX7zgtYJWturC6Ft9I5Vfy/Lw344q6DckeYwhh6Z
         JUai9NrLygCgHYwzxiqgMG3/9fkbDN1+UtX5N+SM5HGvjq2y30ciPwN+Xhhxel9j/1KU
         V9PIXprhtKJw1WOLO2ihPyAQroyhm/Ji9yPCjlGh/ixQUqmLP93B1nbie98iVccZ2ghR
         BvlpysBFOeI0OaiVFOziNXBR8nFkQD84et4uwJyhlVyplBGHYU3WsVt96zHMmnipvf3j
         cOTA==
X-Forwarded-Encrypted: i=1; AJvYcCWePjgdNaSQkUdpkjHY5T7VA6SWf4Djc/L4TeYKYxwT6uycZB7BoJc0OMe7BO+yyS96PcdH7xblc1A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHvu1QWSzdMjqWZ5XmD0KEHpMmBVo0hzsbnfNhFMRCAfn8lhbp
	VcmFCkLkvKmOkIyhAi/HT7NPHabak+cwTu3GmgBF1eb/oTUkHZPSaQyG1DYv15lRtA==
X-Gm-Gg: ASbGnctTKdg9el7lDLT6KsW00213kzuV2nncSRKpIuTPEnfG/r20rH9c3d/ykDCfp8W
	2f/dR+zlFbvL7YqhqvWBM9kpXjnz+6ryf2piuaTHWYNOQaaoLCJk/ovRaLkTbVMjXkVjVGay2RI
	gkjmovIuNeCfZScGoWZMwYScnssTMXyLYwrgO/7e+e75V19ici+d3FmGGfSBbekwPsDS7wIhQwt
	u91GqaK7KGOZlbBeEUXhyZ2TgPeUo3lQ2ThhwoIK9xWvZA3kHlEMLPQTS41iNv3Wlq1yZqHLajq
	esNt2mK6gky2tLl/kLB7BecCphW02oY3YJmA2UnDeZB035FQf/5KE75xsOZMellSPbx+RHXDOeu
	biy9IipoVxv6PWTsFq6r5LtgxnyS+ksQ1lD4zVvIkuYPZ+aKqnfsoCDDjypwso7KaEMib02wcKc
	SX8EePe8Vm0krolTU8HdaJ
X-Google-Smtp-Source: AGHT+IGEpLzt4qYukVYjaURPxBZ+KCw+RaHKM9w3Z+4jnT/vUdTFviAbrYTNYJEk53mgBYk0zEgqcQ==
X-Received: by 2002:a05:6000:40c9:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a531786845mr14202400f8f.15.1749562924086;
        Tue, 10 Jun 2025 06:42:04 -0700 (PDT)
Message-ID: <a87aee88-5c12-4281-a171-d959fae831f3@suse.com>
Date: Tue, 10 Jun 2025 15:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/20] xen/sysctl: introduce CONFIG_PM_STATS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-13-Penny.Zheng@amd.com>
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
In-Reply-To: <20250528091708.390767-13-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2025 11:17, Penny Zheng wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -598,4 +598,12 @@ config PM_OP
>  	help
>  	  This option shall enable userspace performance management control
>  	  to do power/performance analyzing and tuning.
> +
> +config PM_STATS
> +	bool "Enable Performance Management Statistics"
> +	depends on ACPI && HAS_CPUFREQ && SYSCTL
> +	default y
> +	help
> +	  Enable collection of performance management statistics to aid in
> +	  analyzing and tuning power/performance characteristics of the system
>  endmenu

Same comments here as on the previous patch.

Jan

