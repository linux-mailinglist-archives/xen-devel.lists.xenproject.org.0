Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL2SCk3PcWnSMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:18:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825DD6273F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 08:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210401.1522071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viowb-0006qs-EI; Thu, 22 Jan 2026 07:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210401.1522071; Thu, 22 Jan 2026 07:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viowb-0006nq-BV; Thu, 22 Jan 2026 07:17:29 +0000
Received: by outflank-mailman (input) for mailman id 1210401;
 Thu, 22 Jan 2026 07:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viowZ-0006nk-CK
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 07:17:27 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66d97088-f762-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 08:17:25 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so412354f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jan 2026 23:17:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926ffcsm41143730f8f.18.2026.01.21.23.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 23:17:24 -0800 (PST)
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
X-Inumbo-ID: 66d97088-f762-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769066245; x=1769671045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UHTJ6KXNWoh0hdGrTW1lhA6H3qMn440dQudni+jBuvg=;
        b=g7v6fbjWb+NpftWuToKdjJK3yfxcbMsBPUhyYL1QWyUqgeHBnROBi0xFNLJfSmyzmm
         Tu1qmDPVKrPoHHwr+Ju+4WSRGpP7QzoSdHDq+46Gi4x/d9P608imz5W4wbdJ79h9eRdh
         yxZ//vd8d/R3G3HujPPMnNJb3NEiapfAb81hP3Vg2JE1sXDZGdedZvTsEyIn9yGNaXPH
         6zFCzEDyad3c5fcUej2F1hnTtDgugi89tLubYUWWyFQg8E8MMh1LWZks+M4Xic6NDheA
         /GeEUr3Xb2PrR0rSnvygSoXKIpPq6AHXiM8kW/E3o3fm/2koc3mdyYzY1VxwdTdF8HIA
         NPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769066245; x=1769671045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHTJ6KXNWoh0hdGrTW1lhA6H3qMn440dQudni+jBuvg=;
        b=A/NfLVpwIRWUGBjKOspGCBYZrrcZd1f01euuuUEHnK/JRvePi9c9sORKs8h33azJRf
         4L7X2FzXEkzWmj/S/7DfWzEXzSiiIX5DpAh/CdY3yRitNKIN/R7BBSFaYzse2+zX88Ih
         feGnhHzZhIdJFo0hdZ8IQteO2LfyfDLoocc4YGDNQKYRezeW2W9dNUO83Pd5HDCjN3DM
         ybf0neeu7MIWLBbIRMBxhsEkqW55xA3Mdc2d2rN/DFNrEfUz6dAY4Gzu+BOVMNOPImHh
         q/XY6jXfQIxsF9tqE36ivSx2oEZ43mczzbl6pEV3z8ckLQq4JSdgp+lXFTU46tC6SyjS
         YuTQ==
X-Gm-Message-State: AOJu0YzgFP+uwwPOXzTOmGdynwu8jVi6bEkuNGT78uOkMGmyQEApGXsR
	PNCRhtPoom5Ojmyakj99I8xWE0fNkowoZP8/ppi4+BXpn5HuwfXpPBvuAX9AZZQeZA==
X-Gm-Gg: AZuq6aIsO4EMSDQusLVqbzLx8QtWhUwhsORhVmhuVCNCSTmLmQDqVERq1xz2UarJFYz
	RQsjgfkDqDNAJDbjcnYKFycgrp0ewXp8QqzZANQYEEX+TTeNE9U0OW97Jd6dV/SRsOfX//dgYSk
	TYPB+p+v8yCqN2eX4R0OfMJEJrcEHR3d4R0tGkI+hRL623gwxEmTlOao5WfTuuKPTzFMPeBnjwk
	exD8F8WsAgTmAoCDOBbD2hPRnH+kzC8orQfMlZYMegoMy03G+Gi2W/gIUbrMKV0jFaHtuhPre7F
	2PNYFuiczU1UeVnfW5WiRSlL11WGnxpcyC5A22gTYsYE+xEKBm0QyFNyqp8Zb39SywRL2yXjDmM
	j4TTlcV0xsOHP8lUjuxZlNIwPY9a1mKr1LTlIZznHWXC8NrmDHc8VIc9V0F4YmSHqLeUWxBaE9U
	/ynp1eiAEevkaIp1VGsTbz1HXne90MzO4hfX2tCGDoyWrK7pgOB9cfYUfX/otj+/jsqXyYEjxCH
	X4=
X-Received: by 2002:a05:6000:402a:b0:42f:b581:c69a with SMTP id ffacd0b85a97d-4358ff1c1f1mr13520631f8f.5.1769066244781;
        Wed, 21 Jan 2026 23:17:24 -0800 (PST)
Message-ID: <634471a1-1185-4644-aeea-7891e62bc1f0@suse.com>
Date: Thu, 22 Jan 2026 08:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 James Dingwall <james@dingwall.me.uk>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com> <aXC1sFjIRUEB7qOW@Mac.lan>
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com> <aXERjdPS3KlcD3C-@Mac.lan>
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
In-Reply-To: <aXERjdPS3KlcD3C-@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 825DD6273F
X-Rspamd-Action: no action

On 21.01.2026 18:49, Roger Pau Monné wrote:
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -724,7 +724,8 @@ static int __init balloon_add_regions(void)
>  static int __init balloon_init(void)
>  {
>  	struct task_struct *task;
> -	unsigned long current_pages;
> +	unsigned long current_pages = 0;

With this, ...

> @@ -732,8 +733,13 @@ static int __init balloon_init(void)
>  
>  	pr_info("Initialising balloon driver\n");
>  
> -	current_pages = xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
> -	                                : get_num_physpages();
> +	if (xen_initial_domain())
> +		current_pages = HYPERVISOR_memory_op(XENMEM_current_reservation,
> +		                                     &domid);
> +	if (current_pages <= 0)

... why <= ? Gives the impression you may mean to cover HYPERVISOR_memory_op()
returning an error, yet that'll require a signed long variable then.

Jan

> +		current_pages =
> +		    xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
> +	                            : get_num_physpages();
>  
>  	if (xen_released_pages >= current_pages) {
>  		WARN(1, "Released pages underflow current target");
> 


