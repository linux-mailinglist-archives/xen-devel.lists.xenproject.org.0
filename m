Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGeNNwa3wmlilAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:08:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A9318B97
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:08:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261048.1554185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54Il-0003PJ-BM; Tue, 24 Mar 2026 16:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261048.1554185; Tue, 24 Mar 2026 16:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54Il-0003Mb-8K; Tue, 24 Mar 2026 16:08:19 +0000
Received: by outflank-mailman (input) for mailman id 1261048;
 Tue, 24 Mar 2026 16:08:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54Ij-0003LG-II
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:08:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54Ii-0074YF-UP
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:08:16 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b6e8-5cb7-0a2a0a5109dd-0a2a4502c6a0-14
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:08:16 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b6f0-63bb-0a2a45020019-d1558034c960-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:08:16 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so39895565e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:08:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647120a1sm40908663f8f.30.2026.03.24.09.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:08:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1774368496; x=1774973296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=itiLAVm0CXXggdFmOqbTg3WGh2aF+9q6lX3jsj/sc9o=;
        b=ZDOvvOiGna2CZbbZuvxXiiI0vJxktOxGycPaMRV47cYE7K+ELbBsDHCwDg9ceOy7lf
         ubsKYke/hXD+axM/j2tq+ZjPZ/ow6c/cjRBZpezHqXEbIuFqOr77vP3C0AncOXFbmmh0
         VnQEVff7mKVP85Lpj/KwvivL92d7UAiIbbMa9izAg957lMPXKziOlQlYvlE4RZ1IYUtG
         qoRonGaPXv2zRNm+G/whBrLN+m4eSBZiMa2cHTEh/OXK9YwSymarpmtjwjOSXk9tTa/j
         FcY+bATIvbWJ4Asmh6+YS2Hk5kZXajzcTlQySEzc73EvlGzjUXO5fwBx9nBCbeMYnfhI
         jVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368496; x=1774973296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itiLAVm0CXXggdFmOqbTg3WGh2aF+9q6lX3jsj/sc9o=;
        b=bg+UzET5j2mFk4RJvbXXj+/KR5KH7TCP2oDjgo3eNM/3/NSc5XkF7k7kV0gMA7nP9o
         NMZsqzG628z6pkX6NEmeF+1XBgvieiHUdjjp4v3gi4M5bb9ayKMSpGOr+c0ZPUYgZmTT
         4ymS+GBPgPbmndM/w2F9NTB8UQxrpHskMJ3SO7HojoAiOP+1GMqz3glXmm3V23cwagRy
         BlzZNvnn5w56wzY5Crv5fD2UJANP67arGiBgx/vxUXFlc4il02xmclhgimTkyZ1yQrcK
         pwjOK4+6Dne3cZm+vZVCOeYbj7neZiLyhgG22SbhdQLlofUdgeNPHZ3aMVLT5gScqTJn
         UCLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX46iZZgBXYoQ+DkleDzevo3WY+vn4hDLdx/J6EU+lWoFLgY4767bz+XpWCek12esdIaRnCPTMiqwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZApVePV7Zh1tZMtl7iBWof9IbbVyx+6YGjNZKN1ZUyAYi9NBc
	kBlKD93GgvGqkVCKhqfFFCKxBo+Kf2Ff9dfuzmr0HlCnviFKutormXzWqX/WOjphnw==
X-Gm-Gg: ATEYQzxhqeEXUbqwDaiGfHrM58CWYZjbCgOeHNCChNeKwgId4lMaOljfQswYnbL1BCg
	ZNNph/tefFIwkwVsZhTuQnQxXpGWidE99r678yV03crbVsnZa6cMqc1BCEM2zSS4bhKotWfYQwf
	npodIQj6TZc3jEQbKModqyD0MjTo749z8vnDUu9R51o4rCSYA7QbP+sgtkcXnZAGJ5xBv5L2L+A
	QinYog2O3TO23MLWx3WRDQstPSdoynKi/Nlkfdi4I7yyi/L+9/zL/yAI3YuyIYX84IlWOTo6ob7
	neRCQNHy+WIfkefbQ4G2QqGjjfQnv164awHQ1/8jInby505OsQeWQdJJ2VtSXaiO1QJc5v1pnoa
	bL6ZxiIWZ4Bz0DwWD3867ZAW9DAWgTAwNeC/7Q+S4F4dQea1psHcUf570QypcM8l2iORuYxd0cB
	oKiE+e4yRDNQZxf2eeoQRYlRWKAfQoH1afqlGtg86y2RpIfU/NGlS3sllKZ87Y0FO1B7BdBcU/v
	8RN6rgDg0skwF2FaAZfhILREQ==
X-Received: by 2002:a05:600c:a4f:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-487160350d6mr4380975e9.22.1774368496016;
        Tue, 24 Mar 2026 09:08:16 -0700 (PDT)
Message-ID: <f2eb4829-c5f5-4cea-8189-a84aadfedef5@suse.com>
Date: Tue, 24 Mar 2026 17:08:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/vpmu: Allow PMU version 6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <151db665c8e9014f0b09d3fbaed3f60448298f0f.1773160025.git.teddy.astie@vates.tech>
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
In-Reply-To: <151db665c8e9014f0b09d3fbaed3f60448298f0f.1773160025.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774368496-BE686DB8-5C5E7A07/0/0
X-purgate-type: clean
X-purgate-size: 1461
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 507A9318B97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 17:44, Teddy Astie wrote:
> PMU version 6 (notably implemented in Intel Core Ultra) is backward compatible
> with older versions, as we're exposing version 2 to the guest, it is not
> expected not try using PMU version 6 features.
> 
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> I don't have the hardware to test vPMU on Intel Core Ultra, but I guess it's
> supposed to work, as it only introduces new features and doesn't disable
> existing ones.
> 
> That could want a changelog entry regarding vPMU support on Intel Core Ultra 
> and alike ?

Perhaps.

> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -819,7 +819,7 @@ static int cf_check core2_vpmu_initialise(struct vcpu *v)
>      static bool ds_warned;
>  
>      if ( v->domain->arch.cpuid->basic.pmu.version <= 1 ||
> -         v->domain->arch.cpuid->basic.pmu.version >= 6 )
> +         v->domain->arch.cpuid->basic.pmu.version >= 7 )
>          return -EINVAL;
>  
>      if ( (arch_pmc_cnt + fixed_pmc_cnt) == 0 )
> @@ -904,6 +904,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
>      case 3:
>      case 4:
>      case 5:
> +    case 6:

This is getting a little unwieldy imo - can we switch to "case 3 ... 6:"?

Jan

>          printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
>                 "Emulating version 2\n", version);
>          /* FALLTHROUGH */


