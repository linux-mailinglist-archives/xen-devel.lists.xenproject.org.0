Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEhnHdAHD2qFEQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:25:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2CD5A5B6E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 15:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315217.1585063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3Ow-00007Y-18; Thu, 21 May 2026 13:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315217.1585063; Thu, 21 May 2026 13:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ3Ov-0008WE-UM; Thu, 21 May 2026 13:25:25 +0000
Received: by outflank-mailman (input) for mailman id 1315217;
 Thu, 21 May 2026 13:25:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wQ3Ou-0008W6-1I
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 13:25:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ3Ot-00362c-DU
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:25:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f07b9-2eae-0a2a0a5409dd-0a2a4505bba8-40
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:25:23 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f07c3-aaa8-0a2a45050019-d1558033a4b3-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 15:25:23 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48fde648a71so44163585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 06:25:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033cdcc01sm73668495e9.0.2026.05.21.06.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 06:25:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779369923; x=1779974723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1E/Bznlp+WNpMwj62zhBu6ZBHv3a8SyoZnd97uVJ/74=;
        b=RThbXKStUIBaN/JJfBpzVrDUn6+VKzHwCXJs4Gmfb+QAoYo0C/enQDqqwVeQHCAYFa
         E75fh3ZQ66uPM/ib8f7JpcJ5BdJe0cCz1V8niLcMX1inRzyJ0VkkcDMmMoYuAFeP5get
         G3cosH+y4gIE8PWFlfM3+Nyw6QqNNOQygDGYkTaMaul5H+m/So/zsQi/ATv1tZuVGLJr
         P+e5jaEpD2lEpCtrrgyyYj2r4p2YvY8AuxPiLKu1q8Zb291HjlCnjAtOqFU9aisFhK9I
         kf2lLHSMFRuP0u2n5k4/ir6f6xsq5OtnsDnxVuzSeDc1gdMiVElRwT2QR5elIHnSva0d
         FBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779369923; x=1779974723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E/Bznlp+WNpMwj62zhBu6ZBHv3a8SyoZnd97uVJ/74=;
        b=hRxttLTY/fwKJIE6ECbZ6LrFJ8Ddljhnbdr9ckKuOESOMbZic5GKw1+dpoTA2RjgHg
         zuEoXgX15DKCqYK9HHADsCxby7OR7aBPUSA36WKktBVKGZBt6QR4aAWgQGVhIpZS0E9d
         LoIM6yXeL6JlmWzI/pn5y5xk4MkCxr+o2o1t6LVh9fLT87AZl+nvxmtVatahpAC9mleu
         n1vEiaH073WqpM1DjJ+xtLySLkTW/agCVT4eAPv867v1pwu03Z3iSSHpJ5gACR8sNSFJ
         ydA0/wRoiakmJihZQruMTC3qK6S4YS6LMrEJ2TTfxeDNE/mwKPNgqrYEu7pC4OTKbKYZ
         yI0w==
X-Forwarded-Encrypted: i=1; AFNElJ9BbntDJ2S97lOxj0/b1/hFCHCXIddCr5phuPiQeTzPiFK7U2TNHzACBdqa3SB3Hs8WV5glE/6q/xY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBpMtDr2QITsry+bVcGTiebR9aHdmf6kJP9OJ4bcGtsEvLj+Bp
	4aqSbd8q1W22w1QMxyzqrVW73C9K2piLkuw2EwOMax22NB51ziSFMrpuq5mCRLxk/Q==
X-Gm-Gg: Acq92OFv4joNW14Htd0Ev7WI9v/rHewOtrgy3oH9oAvEE79GpS9pY+kUr8j0BT9tMSp
	4GacxxSdwgG38enHo3cRnoHnhqfN+MO/I65MahZzZ7P59snB5+7+iCZTz93NBrl/sds4I8lYWI7
	LiRMmx/U7rYOZhsnuDUzI1hjvkGXLPH0QvjIzhdAAlJhkgw/nlWYhAY70Eoaly01kOJw1DsJIe9
	/V56Az861OpJG+Ue4MHC1Oi6Ka9hQhHadC0+EYTAiGxKfq6XgqudVHH8zSe1HibIPuWCzlRFpzs
	m+XZ3wD0CFJEfDzhu/FjV275fD6fsfdupPrlU0Z183NkJKDRPAmrhrzdFaKhALXKP8HCXkHcBC+
	k+KyNv+v7ZJEAFQ83AKDgn8qt8JibJL5s4RJgBo4E3KaCjX8AcZoWcBUhI0ojs7DBZH4b6JQZuj
	D2dg01N5VQwTHPX2czQTVUGvSuPB/wQTzW1x+AYIAlTVDVRxvNayArhb8G4nL0CRTvZUrlU5/b0
	ZE5T70B6DEXy9A=
X-Received: by 2002:a05:600c:4849:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-4903608030amr20839555e9.8.1779369922791;
        Thu, 21 May 2026 06:25:22 -0700 (PDT)
Message-ID: <a94a55e0-b6c7-45ed-bc9f-76022f02b1fa@suse.com>
Date: Thu, 21 May 2026 15:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/26] xen/riscv: introduce init interrupt controller
 operations
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <286a8b99ad7c107fc46c346f7c075617740fa194.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <286a8b99ad7c107fc46c346f7c075617740fa194.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779369923-DBB60443-C94E8BB8/10/73395122804
X-purgate-type: spam
X-purgate-size: 2136
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DC2CD5A5B6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> Introduce intc_hw_init_ops structure to avoid risky mix of init
> function and non-init function.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - New patch.
> ---
>  xen/arch/riscv/aplic.c            |  7 +++++--
>  xen/arch/riscv/include/asm/intc.h | 10 +++++++---
>  xen/arch/riscv/intc.c             | 10 ++++++++--
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
> index 739e8dab3498..97dc0ef731f0 100644
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -306,12 +306,15 @@ static const hw_irq_controller aplic_xen_irq_type = {
>  
>  static const struct intc_hw_operations aplic_ops = {
>      .info                = &aplic_info,
> -    .init                = aplic_init,
>      .host_irq_type       = &aplic_xen_irq_type,
>      .handle_interrupt    = aplic_handle_interrupt,
>      .set_irq_type        = aplic_set_irq_type,
>  };
>  
> +static const struct intc_hw_init_ops __initdata aplic_init_ops = {
> +    .init                = aplic_init,
> +};

const wants to pair with __initconst. Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

However, I have another comment for consideration:

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -12,9 +12,13 @@
>  
>  static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
>  
> -void __init register_intc_ops(const struct intc_hw_operations *ops)
> +static const struct intc_hw_init_ops *__initdata intc_hw_init_ops;
> +
> +void __init register_intc_ops(const struct intc_hw_operations *ops,
> +                              const struct intc_hw_init_ops *init_ops)
>  {
>      intc_hw_ops = ops;
> +    intc_hw_init_ops = init_ops;
>  }

Again following what we do e.g. in x86'es IOMMU code, instead of passing
two pointers to the function, have struct intc_hw_init_ops have a
const struct intc_hw_operations * member which then can be used to
set intc_hw_ops here? Both will always come in pairs anyway.

Jan

