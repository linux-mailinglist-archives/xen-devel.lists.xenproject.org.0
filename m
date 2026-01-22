Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLtmFGIEcmmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:05:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F8865B33
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 12:05:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210794.1522411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visUf-0002dP-St; Thu, 22 Jan 2026 11:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210794.1522411; Thu, 22 Jan 2026 11:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1visUf-0002bT-PE; Thu, 22 Jan 2026 11:04:53 +0000
Received: by outflank-mailman (input) for mailman id 1210794;
 Thu, 22 Jan 2026 11:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1visUf-0002bL-4t
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 11:04:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c1fcd18-f782-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 12:04:50 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso9776275e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 03:04:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm89321675e9.2.2026.01.22.03.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 03:04:49 -0800 (PST)
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
X-Inumbo-ID: 2c1fcd18-f782-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769079890; x=1769684690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y94U3Ze7VtP0cnM/GCfNajfKHqNRb/fpqW8q52vpjAs=;
        b=EVMgqtNEXi3SwD+hafSaCW9XQeMQnKnNs9v36jfNtv9yDcQssUy14P70Jrx10vWdeF
         mjwoElrlT+zUmPkOOlbJSgAMOlnBxnIBHWsW4q152tQFEzy7h5pCcm0cFIOa7zymaEkf
         ecPSMEagtX6FBxrUDcnsHAwOlfCRrZMrcGFZGD0+VbrhA/vtoXg9Ibg15wrSFwWk1Wm+
         tzTJ+GsyiBSGz+oFBv50hpM8c8U3iyVsyoi2ymEb01wotF7jGy/c2YFxD8SCdk5c2vMZ
         rjj7EsnXQKxrL7pldO3ng+lURzWmyxSAq1jlUKajj+82G+0R0BS1ufpsmz1gCgrxcgYr
         9/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769079890; x=1769684690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y94U3Ze7VtP0cnM/GCfNajfKHqNRb/fpqW8q52vpjAs=;
        b=CWDSKBplN9jlz/kutUlUuhvyErqvdP4IzJ60Lctte6+i+InmQQ6ku0mv01A+/OU9Am
         S4pDKlX2WvZMOJKVjQzUeRJ1H0v6WfQoy6bTd//jarzjVOq51Ifb1GwC6vzHDKOta6N1
         U9BtZLJd5WVq3Bja6/8GHGeK0+PzNcgRTHjaMLjBIrilFZNBJ3nDUC9FZ32jRPl4MLvN
         K0c7U1FzK+GaGVLLMZfwekiTnORZ6ZkuMcpkgacRiIU+4SURT3olRaecoK5o8FK/Tl2V
         SbrYlzxhdr2CXXivRFYOw77hjc0+W2Wi9QlOVejKPF0cHEuPoNLLxg3yQ2wAQy7E63BW
         4Jkw==
X-Forwarded-Encrypted: i=1; AJvYcCWbfqp6xqLgNCQWUU0Lon374f/YU79ZAMMvlBtrB90N+oX2HKPSflxt0HzeYAdElEwpRmPdL/wWe2o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw384e0PzCaws1cn+H+MrAJu25mfD+p26sCGcqnB1zrlZplBbr4
	yvR2JWkiICH39Aq3WFwOeyZXo3/M7ZYFdulD8IdJ34nLJI6mFAX8t6zNdUdBkbJHKQx21pWbX1h
	GV5U=
X-Gm-Gg: AZuq6aKQFVlD52v+096liPVAgklFq5SBdFF8cG04FDIzf0T9mHNqPDV7wfgsnUiODLt
	njt1aXADlsA+oKAI85gxTc+MKsBcIZKHeP2SzXP21hASEydN84w/kN0pHQ7s/gm8cD7YQI2y/YX
	CsUk917J7kUAaaAKAQLQRf2MxygeDxSvkI5OUW7VzP7Ga7d+7VTY4F+7ZZOBysaoNn8+kEB5c6F
	hXYdxvfgbyoM3nbtK9mkqlh2cyJQfX0pKqbzSYi0CQX5QD50Af4wzJg6Vwt0MbdTWki4jjwnK2y
	j45QppXKoqZ7/usPocA9ECP0/90m+IMb2vl+pZx2mo1RP3N+d53Kuctk3tPYOHfHXBRNHbJ97wj
	n3kqEFADxtdfu4ZOos1DlJqvSpws8YD/zmigfcExO2NK4WH3MJ3DJzaJ3gcQw7m93VvWNAeuugx
	aESiscAIwowKz+3tMfD+GXiVPKyrkSVbTJ6mnvIrCVdOvRLMdCIO6LtY1Uwe+AgID09kX456/x+
	Zk=
X-Received: by 2002:a05:600c:4e89:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-4801eb035ecmr286705645e9.22.1769079889939;
        Thu, 22 Jan 2026 03:04:49 -0800 (PST)
Message-ID: <7304f5e0-f55c-45c5-ae4c-3d3adc53a0b3@suse.com>
Date: Thu, 22 Jan 2026 12:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen: Allow lib-y targets to also be .init.o
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260121154757.44350-1-alejandro.garciavallejo@amd.com>
 <20260121154757.44350-2-alejandro.garciavallejo@amd.com>
 <526ef477-0730-4e22-a82f-4c598ad78e0a@suse.com>
 <b7475771-3ae3-426e-9255-d886ec0b2ba9@suse.com>
 <DFV2FIFSCOPM.3O550OQ2G1KB8@amd.com>
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
In-Reply-To: <DFV2FIFSCOPM.3O550OQ2G1KB8@amd.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,amd.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7F8865B33
X-Rspamd-Action: no action

On 22.01.2026 12:02, Alejandro Vallejo wrote:
> On Thu Jan 22, 2026 at 11:01 AM CET, Jan Beulich wrote:
>> On 22.01.2026 10:49, Jan Beulich wrote:
>>> On 21.01.2026 16:47, Alejandro Vallejo wrote:
>>>> There's some assumptions as to which targets may be init-only. But
>>>> there's little reason to preclude libraries from being init-only.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I can't tell (yet) what it is, but as per CI something's clearly wrong with this
>>> change. Both xilinx-smoke-dom0less-arm64-* and qemu-smoke-dom0*-debug* fail with
>>> it in place. qemu-smoke-dom0-arm64-gcc (no "debug") was fine, suggesting it may
>>> be an early assertion triggering.
>>
>> Or an early UBSAN failure. I think ...
>>
>>>> --- a/xen/Rules.mk
>>>> +++ b/xen/Rules.mk
>>>> @@ -130,9 +130,9 @@ endif
>>>>  
>>>>  targets += $(targets-for-builtin)
>>>>  
>>>> -$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>>>> +$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y) $(lib-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>>>>  
>>>> -non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>>>> +non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y) $(lib-y))
>>
>> ... this is the problem: You're _adding_ library files here which weren't there
>> before. Why $(lib-y) isn't here I don't really known, but as per the CI results
>> there must be a reason for this.
> 
> Apologies for the unintended breakage. I should've checked the baseline for
> arm before ruling out this patch being the cause (it did fire in my pipeline,
> but didn't consider how this could affect arm and attributed it to a spurious
> failure).
> 
> So we're neither doing UBSAN nor collecting coverage data from libs? Great. One
> more task to the pile, I guess. Seeing how...
> 
>  $(non-init-objects): _c_flags += $(cov-cflags-y)
>  [snip]
>  $(non-init-objects): _c_flags += $(UBSAN_FLAGS)
> 
> I'll try to clean this mess. :/

In the meantime, should I give your patch another try with that one change dropped?

Jan

