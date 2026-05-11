Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFgEBgKjAWpKhAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:36:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7812650B045
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305911.1578022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN31-0006g9-Ek; Mon, 11 May 2026 09:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305911.1578022; Mon, 11 May 2026 09:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN31-0006dw-Ah; Mon, 11 May 2026 09:35:35 +0000
Received: by outflank-mailman (input) for mailman id 1305911;
 Mon, 11 May 2026 09:35:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMN30-0006dp-Ia
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:35:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMN2y-00ACPl-WE
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:35:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a2e3-2eae-0a2a0a5409dd-0a2a4508d342-16
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:35:32 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a2e4-63b5-0a2a45080019-d1558029e161-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:35:32 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso37066515e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 02:35:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549217b782sm21661807f8f.35.2026.05.11.02.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 02:35:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1778492132; x=1779096932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TpRIYyL45g/Ev+vsRJmEdxkEyRfmCX/rb/JlC6C5ZYI=;
        b=IZmShz84aR/xw4PVYObUx+cVbnaEXgdfiJGO9Qp/20gdg5pizNvv1QuVOaW4+rIsw1
         S+FLhkFqvnQC0wWOqjRa9TazcW4/99iywNPF0xY/DZCFGTx5WCqAYF7yqGHGENT2aY9/
         3UZig9IqdZVrp2RUtm2Q9lpAPL7AK3Yna/m3a/q2vch4nOa3+NEqt89Ji1sgjkKVqpPB
         tdFaRrMYiAnBrOjk6eqhWEUBHIS9zdXW+Bda5MWbZlUKjZZ4NeoIgTFl1VXhsqxZ2/rr
         xm7zfY7DzspoOU5f/xcl/3UeyIJ3m373CHoOE8Br9TGGUlxsiC2iGerO2O2HaPY/C8BW
         ANUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492132; x=1779096932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpRIYyL45g/Ev+vsRJmEdxkEyRfmCX/rb/JlC6C5ZYI=;
        b=Vw+KNBgqs7SOPFEIR2tLIR9ZEQ9ElMR4TFoGMTWo+MfdGQm4vZicYQfU2aEI6VMzbC
         C1QkIrwHELTym5Z851LBPtfMzeTsEPjTjY01v4aKcz3LDCLzVqg9g93qyCApG1Q6IPXx
         BpqDUApqJuHJhRQaTlTUZ4EKCh0xH9tr5OpnYUN1It8SSPEo1F9XoAyhb1a7cqIMZMfP
         3q81Ere6uOlSFSkerhTNX2p/I17Jor7bKfXEGAoIAuOD/QXHy9JZK6MRcXKHxbNTmLNu
         qIPb+mgItBNjjAirbO/RUCoxK53QhkyGOM8kpd/WfVKL3m+vUyLA0m+xwjlDi4Tz2xEZ
         id+w==
X-Forwarded-Encrypted: i=1; AFNElJ9KjKOBWjX4lsXosRQdH7PfVLznsxqxaDJQUya2R0hXGLpYhir4ls7h65I1br2hRn8lEpH4fgyxfik=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBYZBc+Q3utVwNboSBhLXdwCwgAokw3LmcHxq+kcvNp3Oy7Kwu
	OyYZsBIJgBQsy5bXIhob3/AEi26ko9oXDjGtr7Z5iQ7dqF81ArXIONNuN9KhiWcQMg==
X-Gm-Gg: Acq92OEAXX6cuNNY4MrxuwZ1FeVHj5kvIeXC1j3hDkiPG6W/2G+8mRkdQGcAMSdOdO5
	qPen9q90t5XTZhO9u5yubNZT+JkCNi9py3uAj5guv8l+/U7ja8/G2AhI6xQZNLhrS0vm2XrG8k2
	gCPNpv/FWAvnChm9Kl8SCW1bgLJE09SAWzeqbC9AjdhT7HIudf/r79q+5f0mxv5Zt0EgA3N/GqZ
	RwFgrRXCbAPqVOkCxlQlS3orwTX1mkBg+85Hzkc1KumzIdn9uSLeJgBFaEwTTSwC+k7k/hpHo88
	SrhFsDi3oORudS73Tog+pGzZbchH0DiYPUT+ofP5VGBgEFDkEUhoTlt8lUcYN5s8Z43NRFiZmcz
	h4JxVJrFh+ZidCPP4ggrrZs83JLEPFfseHTGFc4wcEGVSWZBKlXvK/PjrF4k9kBRoW1RUx+idSl
	GZJ+kfSDO8t7GnXH/nSVuOEXxsLzJ+WbLagUcr2I/wLMssDZ0dIAQGk7M9K8SMjWRH6xOE/nSv/
	LUTExyzPn3GAosTSrxC3jfRPw==
X-Received: by 2002:a05:6000:144f:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-4515ce1c951mr38106473f8f.21.1778492131951;
        Mon, 11 May 2026 02:35:31 -0700 (PDT)
Message-ID: <d18d7536-99a3-4680-af55-316e64b9e01b@suse.com>
Date: Mon, 11 May 2026 11:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <luca.fancellu@arm.com>, Harry Ramsey <harry.ramsey@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
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
In-Reply-To: <20260508143353.3512004-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1778492132-BED73DB1-3A8411D4/0/0
X-purgate-type: clean
X-purgate-size: 1316
X-Rspamd-Queue-Id: 7812650B045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08.05.2026 16:33, Luca Fancellu wrote:
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -330,6 +330,10 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>  
> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE    0
> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
> @@ -355,6 +359,8 @@ struct xen_arch_domainconfig {
>      uint32_t clock_frequency;
>      /* IN */
>      uint8_t arm_sci_type;
> +    /* IN */
> +    uint8_t v8r_el1_msa;
>  };

Can you please take the opportunity and insert (and check) explicit
padding, so that the next uint8_t field addition won't require ...

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -30,9 +30,9 @@
>   * fields) don't require a change of the version.
>   * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
>   *
> - * Last version bump: Xen 4.19
> + * Last version bump: Xen 4.22
>   */
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018

... such a bump?

Jan

