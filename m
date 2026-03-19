Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNidB8YnvGkxtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:43:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883462CF035
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:43:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257409.1551811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GT9-0004SX-Te; Thu, 19 Mar 2026 16:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257409.1551811; Thu, 19 Mar 2026 16:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GT9-0004Pl-Qv; Thu, 19 Mar 2026 16:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1257409;
 Thu, 19 Mar 2026 16:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3GT8-0004Pf-5b
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:43:34 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3614698-23b2-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:43:31 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo856114f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 09:43:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b5189221dsm17058134f8f.23.2026.03.19.09.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 09:43:30 -0700 (PDT)
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
X-Inumbo-ID: c3614698-23b2-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773938611; x=1774543411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3uHR8jjoxbHTO8JtWICYeYxoB17BRr0XFFYHATGZQQc=;
        b=Bimru+gnQO16gCmdy2s+A8SdvCkZap/sTOeNHYHAujr9fxtyqisqZzJeqMyd9/2MpQ
         AMEXmBRrw/yvVuTxaZUxenRPrxFvl2W3ukSlpP90BykZ9ZqWmeELa8iAUwbjhsQruGvi
         fcPNn8WjozEIU8GJ3rUYSVBsQAoitC+e5gHAaxhR2vCmUL34pQk1lsIsTTOMyJlYXnVW
         ZttLD0akOmK0fDl6Kl8GJbjISdVcvW3yrM5SJAgiUO97lx9Cl7yCzKOmsMy5jtrQfQ3P
         gkX9FU6H/MRieEKMcNwbTF3+C2VCCG5aQNxynfTnug7KY/VvgfkbbUfawb7+4SSx1fb4
         pN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938611; x=1774543411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uHR8jjoxbHTO8JtWICYeYxoB17BRr0XFFYHATGZQQc=;
        b=o5Tb4NcTwW2Xebn50S37DbjiBbOyTvdEZhFUHvmO2rdqyVJNcK4eWGaVgivAHAyUyU
         be8+N+98hgtmcS1qie5+iya+RUbMOcCBg4lhGI6yyKOS5P5gQGMW+n+ZFmbrCpn5VeOG
         MeXwF1gTE7E7bheA/JBZdMm6Udq1CDFD32iEZUKIYeLGc+tS/MBre9jM71F3J2KZIqqw
         uJ93zOvRsb0oDlBbx47GzLB8IvqxhKhwjRcCq77Ea8pbbDgZ/+cvvn7qu3jlBNlXBtgH
         B/FF/PhbfJgTD4sEE2T68+BpCzd/QTXB3w3RkJOxHKVEwGq1x7nFrV4EVnn8VKYhXTYk
         39kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw9HgdCaIzctJ33dBLVSjzyMkBV/wL9hQTEwVTMp0OBlDJggJhEVr4sQkttWBj3cDjOypdDGHGPGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8Y051N9OGNmq5c52NF+ZpghFoHyQXG/KWxL/i/aSzMTGwzw1R
	7IQaj4uzlx+PkAAmNUVeXRrk3E1q1KfstpDf1J72DUI742lyK6VNFrCKXm/HnaOeqQ==
X-Gm-Gg: ATEYQzyaria5LHg1k0Hb8+ySJ5KOcsPltqj8pmjao14wvLTb+pI6solZ90StzrLNHpE
	Lq/+zbqxocjm/gFx/KPjixt23KoV1ZB18kgs6z7CRYC5yFiE6m3plZKs3YnrsSxBQJVxXDuNDqG
	W18egckEiD6dYiLjjA7Q391no3oDcEoAe3pudtqeQmOXxIZ3TAA9BDdiv0semeGRSF7kgwvE7Ts
	YQZlxeWHvGFf83QCdvsb6Vy3DIPpOXNi5WLaYN+pJ0BUJwg3txC8CwVDkvj60Jw3o5nPRljGfr7
	dz9JuBTH6IrdthdQEubyOSint+oiqkX4t1rrp1XKgeGZ8JGmnuTl/c2GE/FCP9G/h++nxSgNhU6
	lpnIkhBDvpl34SG+5XJQKEZTqFhkRD7cH8I2SYCWYtJjsfdjHjFKEbtkupDR8+B6lEPSGlZ5qbR
	TAkQ4x+YVLDq4l/104Ae9/vPcG3VJDsFUfxnUPy9id1MZbzz5QmLNPYtVvbQ/EeYCciYc+LPw/i
	WC1jKJsMXb4WTbuZ9wwHKpISA==
X-Received: by 2002:adf:e849:0:b0:43b:63e5:2526 with SMTP id ffacd0b85a97d-43b63e52536mr157385f8f.27.1773938610869;
        Thu, 19 Mar 2026 09:43:30 -0700 (PDT)
Message-ID: <c646fd85-f526-435d-897f-c1ad72e6d234@suse.com>
Date: Thu, 19 Mar 2026 17:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] x86/vmx: Remove lazy FPU support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
 <20260319132924.1469809-3-ross.lagerwall@citrix.com>
 <a67bbe7c-9c41-43e4-9d28-f5f221c96b95@citrix.com>
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
In-Reply-To: <a67bbe7c-9c41-43e4-9d28-f5f221c96b95@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 883462CF035
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 17:38, Andrew Cooper wrote:
> On 19/03/2026 1:29 pm, Ross Lagerwall wrote:
>> Remove lazy FPU support from the VMX code since fully_eager_fpu is now
>> always true.
>>
>> No functional change intended.
>>
>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
>> ---
>>  xen/arch/x86/hvm/vmx/vmcs.c             |  8 +--
>>  xen/arch/x86/hvm/vmx/vmx.c              | 70 +------------------------
>>  xen/arch/x86/hvm/vmx/vvmx.c             | 15 +-----
>>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 -
>>  4 files changed, 5 insertions(+), 90 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>> index c2e7f9aed39f..8e52ef4d497a 100644
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -1247,10 +1247,7 @@ static int construct_vmcs(struct vcpu *v)
>>      __vmwrite(HOST_TR_SELECTOR, TSS_SELECTOR);
>>  
>>      /* Host control registers. */
>> -    v->arch.hvm.vmx.host_cr0 = read_cr0() & ~X86_CR0_TS;
>> -    if ( !v->arch.fully_eager_fpu )
>> -        v->arch.hvm.vmx.host_cr0 |= X86_CR0_TS;
>> -    __vmwrite(HOST_CR0, v->arch.hvm.vmx.host_cr0);
>> +    __vmwrite(HOST_CR0, read_cr0());
> 
> (Not for this patch) but I'm pretty sure there's room to optimise this
> further.
> 
> CR0 should be constant, both here and in SVM.  Reading the active cr0 is
> an example of the anti-pattern we need to purge to make nested-virt work
> better.

In which case, is it a good idea to purge the host_cr0 field?

Jan

