Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFDOGrsqlGl4AQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 09:45:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C212114A149
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 09:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234659.1537821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsGi5-0006HJ-HE; Tue, 17 Feb 2026 08:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234659.1537821; Tue, 17 Feb 2026 08:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsGi5-0006F9-DR; Tue, 17 Feb 2026 08:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1234659;
 Tue, 17 Feb 2026 08:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsGi4-0006F3-8L
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 08:45:32 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 034455c3-0bdd-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 09:45:29 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4837f27cf2dso21275245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Feb 2026 00:45:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483740be167sm296615005e9.15.2026.02.17.00.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 00:45:28 -0800 (PST)
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
X-Inumbo-ID: 034455c3-0bdd-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771317929; x=1771922729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9wECaYTWoQNx443NLaE5hVVgDwSTbYMvdz13+kYpyA=;
        b=ZpC5QebxRI8sUlZqMKCXpHI7IH7XQEAZTBekkmjbjkOv+KGS8BpnyQW+yxt18IJsc8
         DvD2pIR8ptVRutnCIt5diMl9p+2zeWqZABTuwkPSMXBE+r0dsmSnv+lJLY6B+Zqw4lJK
         Imkwqpp4xmUTbiox/KWN5v7e787SD6P89LX5MT1Qkev7V+4n6rzESPivD/mWg1Sw9vyO
         61OevQwWwEI9g272eR1wuTURcyC4fSfyOomVpqvC2I62QFHpktj61k3KCnbm07lOYp/x
         f5nYJqQnpVMnV6LQyJNAYqm5URP9gq9oOIJgXpxQeKL4tGz9bmhvf7+s1zgyJlL4O1BR
         w7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771317929; x=1771922729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9wECaYTWoQNx443NLaE5hVVgDwSTbYMvdz13+kYpyA=;
        b=DCduy5ec1YuZVX4opwjVVQnFo45svXkh8/VfbVR2iaeFYC/mHQ7QqgcQu5wKEZkX5l
         ZHYLZN5azcxYLNTnsNX8FtaHY+D+MxzZcFA9+Wd1erUSgzELmXiwglphjpVdB1hPyqxL
         NSRtpnVlBQAFkZvhqKNH/uCufgcNxY6Q1b1V/IfpceLJC8sw3Ps9an9uo24JX8xk2Up8
         ffi57qF/hz3OfpeDs25pXNdzqrw3GGL1Vd79hZNKyfwtu7fxJbsL5ZDj7hjkW73NwC5a
         Kja1u/ufzcRWgzKSW18uGLNrUJePlEQc6iD0nfoOjTSkvZch2sUVjr3XUZwDwBoTJHfN
         BXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3StrqTpaG0zd/vNd0O7mmPp+HDGNdL6+16iUasH2r63tymamm+/Oa9z1PtyKMDyk79qSL+d+U0jI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztCe9vKE0wPLN0Swt0kYMknp5bMENZpfr5cNxCngA7kAhItwLr
	bekMhsacGkc566bA4vR20dfFX4PUv9PU5lgoNXGUBxmdhvHQd3Jq/m7s90BzOPvT/Q==
X-Gm-Gg: AZuq6aKeTlPPlswXSAroIwCkErkeqVi3E/Aa12qGcbvL8gAC2tBpL2CVuR+ChpXb6sO
	v1vLJfP3eGrlJOmzp7nrkD2IURiks3TrHzQ5bK7qgH3R78Y9KXPUogcI+/YfrtPSAKdh8OgZK6q
	4qsjuRdwI+Ks0GqMOuFR0iVWm+7QdoxNbg4a0mv7AL0ebv5IMcHxyGs70Jef+uW0OpvtX8Dweqa
	vMOU8JtgJEsm5ibtRfIISH0HxBEsbDV3SH0P5dtTMUAPLCfpD6D44p+U57wwUHbVb8RGZEqezQX
	qIvVRDbWTBc59zZW0PckCxoTCgfpIkep1dV0wjQlolWU+M8+truwP+eR2E7CtuzOGvWYHUfagy9
	lXe9t03I+STTcOdFjWnKNn9vnoHmLYR/nY8hU7HO8VSgXDoB97jijWHQsym2kixuMkAM2kVhcw9
	4VdT5c0btlcv5yjNT2OcvtIizdQ6sY+WZGUaiFiz95uKpFxPUIs/JGRAnjZDGBxEbrKhCBKGvRX
	hTf/14gSZEt36M=
X-Received: by 2002:a05:600c:468d:b0:47e:e20e:bbb4 with SMTP id 5b1f17b1804b1-4837108fcf1mr244936185e9.26.1771317929029;
        Tue, 17 Feb 2026 00:45:29 -0800 (PST)
Message-ID: <a6aa5767-3f8b-4a1a-a816-191d77ef9399@suse.com>
Date: Tue, 17 Feb 2026 09:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform: Consider PTM for exposing package-related
 MSR
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
References: <e7b1721097bd7abd975882f60b282cf7900db58d.1771254439.git.teddy.astie@vates.tech>
 <2764f432-85eb-44b9-aae9-f1bce410b4b9@suse.com>
 <4bcb7fbd-3180-4780-8432-2c62ce24ce99@vates.tech>
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
In-Reply-To: <4bcb7fbd-3180-4780-8432-2c62ce24ce99@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ngoc-tu.dinh@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: C212114A149
X-Rspamd-Action: no action

On 16.02.2026 23:22, Teddy Astie wrote:
> Le 16/02/2026 à 17:15, Jan Beulich a écrit :
>> On 16.02.2026 16:09, Teddy Astie wrote:
>>> --- a/xen/arch/x86/platform_hypercall.c
>>> +++ b/xen/arch/x86/platform_hypercall.c
>>> @@ -89,9 +89,12 @@ static bool msr_read_allowed(unsigned int msr)
>>>           return cpu_has_srbds_ctrl;
>>>   
>>>       case MSR_IA32_THERM_STATUS:
>>> +        return host_cpu_policy.basic.digital_temp_sensor;
>>
>> As per the SDM this doesn't look right either - it's CPUID.01H:EDX[22]
>> (acpi) instead. It is the field you're after in xenpm which is tied to
>> CPUID.06H:EAX[0] (digital_temp_sensor).
> 
> I'm not sure to follow exactly what you mean here.
> Which CPUID should we check ?

The one the SDM mandates CPUID.01H:EDX[22], or - as said for the other one -
a justification for using something else would need providing in a comment.

>>>       case MSR_TEMPERATURE_TARGET:
>>> +        return host_cpu_policy.basic.digital_temp_sensor ||
>>> +               host_cpu_policy.basic.package_therm_management;
>>
>> Where in the SDM did you find this connection? (Anything made up wants
>> commenting upon.)
> 
> To me, we are interested in the MSR_TEMPERATURE_TARGET only with dts or 
> ptm, and the only used probing method in practice is performing a safe 
> rdmsr (at least in Linux coretemp).

How does coretemp matter here? It using a safe rdmsr means it's not Xen-
enabled, i.e. doesn't use the platform-op that the code here is about.

> That may be worth adding a comment eventually.

Yes. However, here and above I wonder whether we'd be doing any good in
using a tighter check than mandated by the SDM. Another reader of the
MSR may appear (in xenpm or elsewhere), and it may be after another field.
Things may then be observed to work fine, until someone tries it on older
hardware.

>>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>>> @@ -132,7 +132,7 @@ struct cpu_policy
>>>                           :1,
>>>                           :1,
>>>                           :1,
>>> -                        :1,
>>> +                        package_therm_management:1,
>>
>> The SDM calls this PKG_THERM_MGMT; I think our naming would better match now
>> that we decided to have everything else here named according to the SDM.
> 
> I can't find PKG_THERM_MGMT in my SDM version; but overall I don't have 
> a strong opinion on naming and am fine with pkg_therm_mgmt.

See version 090 volume 1 section 21.3.

Jan

