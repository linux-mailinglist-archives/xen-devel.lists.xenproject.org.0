Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ChXIKzuiWn4EQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:26:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6584110401
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 15:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225468.1531979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSDn-00085z-CC; Mon, 09 Feb 2026 14:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225468.1531979; Mon, 09 Feb 2026 14:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSDn-00084F-8T; Mon, 09 Feb 2026 14:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1225468;
 Mon, 09 Feb 2026 14:26:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpSDl-000843-ML
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 14:26:37 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 570ef9d5-05c3-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 15:26:36 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so3105426f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 06:26:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436297462a8sm25230877f8f.30.2026.02.09.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 06:26:35 -0800 (PST)
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
X-Inumbo-ID: 570ef9d5-05c3-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770647196; x=1771251996; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D7qzzO3aEWggHR41H2FO35b1jRA7tl46snHtmS7OYp4=;
        b=Gk4TbE8YCUk+Iq4eR2+eyqSksxD72vJW29kMVxNTnqaFEdNh8MQqqRwJ9Lo0CYcdtb
         osmkqVd5pHfC3pkip8fFDmJowkKl+4vu17sjbdFi/o1C0pYlTg+GTmxKo941Egr5lrXq
         6N/AzE0GLF59yzxwV3Rr8R1hN+kISZZVDDBtF0HodPSKGpHZ6q83/b5wrgqfB6i53REu
         2x2f0N71HnzeryAv0eVUZ7S+dSYn2O8e62z8PCG/CHQGhxiPW4HumKVtl8NjUoqrsq9a
         Jka9i8KySSkCBXkUAd52+5grhlbyKRTZ821varl6ZPF8vxP9+d/cwEM2gx2OjE3gHIn9
         xyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647196; x=1771251996;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7qzzO3aEWggHR41H2FO35b1jRA7tl46snHtmS7OYp4=;
        b=MX+f8w1FCNcVqoQ+HWTskzF6YTksKNdp8iI6v89H8RyMtu4kX26G7YjEs73STiSjF7
         /C34p0pFIJrpnj3OXgmsCoSeL8qI/+DLIQBufXsRP0s5Fp+j/umWv1GF8tQBHxeOzUB4
         Y3eyrURITSQjIjBwlO8lM4S9UAuu3lP077v0psvQx19pwUFwgDuSNalUdauZO9jiYec/
         6lk/DkZLHE2BYUU1gfPirwiGLapi47zwJkVGS4DW5tHsXavqCVrrslzzYlykmFwlEm9D
         CU8eAKSYe47zmCNwEC6Dtou6kHhgMLgUe+bhEIHQToltSgw25y/onvwCPL5laUID9R5N
         CHNA==
X-Forwarded-Encrypted: i=1; AJvYcCUANCPMBrKZY/gw+YGUCVuX3gyNT7WMZQS483T3mQlSQdF/D7radS01fv0P8o0w1f942/4fqhOXYMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAYfYf+64/w2CczFyDd4jSLVjWfHmu+mXOH36v2mU/+YEtunMC
	9cTsBjM1ucY9XQtmVAqk08Vde5mZ2ld4+ep5XBvaxzZCQSOlTnRPvGkvTKzNcIs0ow==
X-Gm-Gg: AZuq6aLqMM/MFUvFDgou0uCGddT0QF5dZCuRj5GFTgrjAeP3J0VvyJizq0DaMXyYrPU
	qlYIKx1Xkl+PJYCAt4OOCCMXApUsUJbIOmfMzGiSDddM6lHhb6WXPxLK6elxbCYfP/FaAwFLmkP
	ys1gKf573b8DWCuTMt6oO3joKd8FI7/AR+J4OTPysI2yp38iobtjjFOcXVVrFiO1GTzPfmzDA7r
	kL5uRHMb82tmlPwsxAyJmOokFlVHhMVbzPIpOLE8a8VYS1fLFNzwYJcmgQAISO2c0JC2XBka3WX
	F1F5ODs5iVB9DcjrTiiDibA+bxMeYUHfRGSLWnK6w6XOp0e8VW32bYtem2crA1T2ehv/ePf4UDL
	efb6kDCWXoi/bQq0ERxbg37D9m4eBRncdXusGcohvLXtiGH/bQuhOB0ZM3zCNdbarn1W/QNjEC9
	ood7iWZQ6qtHP/SsEFexIt02Z5Zn+nnSOjG97mtFZcswPbFqVlS+MnW/60GnZ9FfwUGIoI9MKA5
	aQ=
X-Received: by 2002:a05:6000:240e:b0:436:1517:aeca with SMTP id ffacd0b85a97d-43629341e78mr18713364f8f.15.1770647195744;
        Mon, 09 Feb 2026 06:26:35 -0800 (PST)
Message-ID: <6779b2e3-c324-481b-ae20-20a40fb1eac4@suse.com>
Date: Mon, 9 Feb 2026 15:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/kconfig: Reflow the SHADOW help message
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260209103339.6466-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260209103339.6466-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C6584110401
X-Rspamd-Action: no action

On 09.02.2026 11:33, Alejandro Vallejo wrote:
> Wasn't following the tab+2 spaces convention throughout the rest of the file.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Largely:
Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -148,20 +148,17 @@ config SHADOW_PAGING
>  	default !PV_SHIM_EXCLUSIVE
>  	depends on PV || HVM
>  	help
> +	  Shadow paging is a software alternative to hardware paging support
> +	  (Intel EPT, AMD NPT).
>  
> -          Shadow paging is a software alternative to hardware paging support
> -          (Intel EPT, AMD NPT).
> +	  It is required for:
> +	  * Running HVM guests on hardware lacking hardware paging support
> +	    (First-generation Intel VT-x or AMD SVM).
> +	  * Live migration of PV guests.
> +	  * L1TF sidechannel mitigation for PV guests.
>  
> -          It is required for:
> -            * Running HVM guests on hardware lacking hardware paging support
> -              (First-generation Intel VT-x or AMD SVM).
> -            * Live migration of PV guests.
> -            * L1TF sidechannel mitigation for PV guests.
> -
> -          Under a small number of specific workloads, shadow paging may be
> -          deliberately used as a performance optimisation.
> -
> -          If unsure, say Y.

I'm trying to establish (among the committers) whether we're indeed meaning
to drop this sentence from Kconfig help texts that we touch. If I wouldn't
get conclusive feedback, I'd likely put it back in.

Jan

> +	  Under a small number of specific workloads, shadow paging may be
> +	  deliberately used as a performance optimisation.
>  
>  config PAGING
>  	def_bool HVM || SHADOW_PAGING
> 
> base-commit: 1ee8b11c1106dca6b8fe0d54c0e79146bb6545f0


