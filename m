Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFqZFoEs1Wli1wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 18:10:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6113B1886
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 18:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275156.1561120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA90U-00064Z-OD; Tue, 07 Apr 2026 16:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275156.1561120; Tue, 07 Apr 2026 16:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA90U-00061l-LF; Tue, 07 Apr 2026 16:10:26 +0000
Received: by outflank-mailman (input) for mailman id 1275156;
 Tue, 07 Apr 2026 16:10:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA90T-00061f-7b
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 16:10:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA90Q-002irY-KR
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 18:10:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d52c56-5cb7-0a2a0a5109dd-0a2a4504c234-40
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 18:10:24 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d52c6f-bb33-0a2a45040019-d155dd32f1bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 18:10:23 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43cfb723698so4595299f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 09:10:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c54bdsm52396105f8f.16.2026.04.07.09.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 09:10:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1775578223; x=1776183023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=czWUKTTv0MMX+KvuawR0HjkQgAxvRnKoeBlTr8fkjFk=;
        b=Ib2550MfstsNG0mbZF2PE+QG0AdropMLDc6DBzph3bK1PfH1Uf/8hdvkhdLUovXSGk
         xBdgapBN8fGqlD8DWvGJ5PfY/p+Tdy1brhn00IUxgKOG51cTgi8jx9HB9ydGYbZ4xA7T
         6NyPMoNePUTjr5BsBhmZmzl0kqhEhL1t/9r3oiYcLOyQto6bVKnaZ0Aif/eUsU28f1aP
         wdRnTim7JA9hKaWb3e8/43/dPPjw7z+UnM1bJA68bNSBXtWxlwjbebZI5+qHtU2zVJNh
         HWTmmDhfFXQihtdXv2stexMpBh+bIHn3HEZyhTzKPTXcf/OmPAVpVJUzbFzrtCvpTpQE
         jVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578223; x=1776183023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czWUKTTv0MMX+KvuawR0HjkQgAxvRnKoeBlTr8fkjFk=;
        b=nE+pwfuo2mLkkicBOO8qwOIijUzY6oEs8TO5d8EnVY47uKAGTuu2kEuG9/tnnM+BUr
         +bX2oFsqlLz5tASYQQ9+aqdr/ripy7z83bjmiuXJYZfhsrPja+NnvAY2XDvCRFRD2/R9
         kHj1yl2rVObiH1mhCt0incFLZhlovU3cBIX0X+wCX6/yEpd0C/9PmiTNO+IZYwEtzG7H
         Z13QCmHm/wLWTQiWYXEkLe4s4O8Ab37D5SLRhK/mLi+9j7u8Bgka7z5DwXkEQ1AqU650
         siEg4Y5psOmtDizxI+l+wGvOaApDx34eA4sVySGpanrwDl/3Y7asXd9mikwYPWACoGsX
         AGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUdrVilFyse8lHnB8elVX0do5Xhq/ozpXe3w6YqcIXMscJ6t2zGEZSVMyCjmWAtio7C5Inf6dJAWo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRa0Rww/+ucxLw3Lzq2xlx/KLVNzbgw8zmieGaUjXlEFoOT8fm
	G8KU26hDUJwwbJvPQnftaZUfjdPjmRWX/6HP+qNyT7VBbNJ+y1KAfIgByqUY4CKj4w==
X-Gm-Gg: AeBDievaCTMan+00QD+ztv3kxnl3OQ5t2dV+CveDJCoWMCIF93XqSLXV6FNAMj7JZU6
	0o+xTZ1gxrcbeIa7omqeAla6GHiI6uneohIaM81KZW5R8Nhb64pSmG8m90RJAp0MMsWiRTX4DGa
	c2U+sn4/g5v3a/dsmioMLSCeeZDiz9x1j6zcD/82OLJoCFvlCS6wnaF00D0i38AZH0cOUkEGc6i
	Avkh+PLJ27frWu0DeHOXXGuDpxO5GBZRbDdySfUIEQf12FrGGzbqcuYIym3OUzN13qpvbq9bWnj
	IWo1XBOGuXzGhBBcv93pyOlm/cg/M5ErG7YsS724c/hxZJVJ2BsUAt9aPNiNYtR26MtPERU6KJ4
	M2n1CerGBnw4ndM4wBMYxT9adcK/7w4m4ydJIQpD11sxCyU54697/97vUw5Xd+m6LW15WCOyvY1
	/bjKULjJ4oj7nL32SxJD34RTwIjZW1tyRCA1gaYB8vhShUe+UTdK5O/WHxzMoxnha66c3SOIKbv
	1FeQn0nuBvikIY=
X-Received: by 2002:a5d:5f42:0:b0:43d:1dfe:45b7 with SMTP id ffacd0b85a97d-43d292e2b48mr25013268f8f.46.1775578223393;
        Tue, 07 Apr 2026 09:10:23 -0700 (PDT)
Message-ID: <1c9ca75b-e118-45bf-832b-e6586b8ff5c2@suse.com>
Date: Tue, 7 Apr 2026 18:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/emul: Remove fallback path from SWAPGS
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260407142351.73049-1-andrew.cooper3@citrix.com>
 <e9056cab-09a8-4874-bcb6-5b39091722cc@vates.tech>
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
In-Reply-To: <e9056cab-09a8-4874-bcb6-5b39091722cc@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1775578224-B253B51B-161D86F4/0/0
X-purgate-type: clean
X-purgate-size: 2526
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sreg.base:url];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: AF6113B1886
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 18:00, Teddy Astie wrote:
> Le 07/04/2026 à 16:27, Andrew Cooper a écrit :
>> --- a/xen/arch/x86/x86_emulate/0f01.c
>> +++ b/xen/arch/x86/x86_emulate/0f01.c
>> @@ -189,22 +189,24 @@ int x86emul_0f01(struct x86_emulate_state *s,
>>           generate_exception_if(!mode_ring0(), X86_EXC_GP, 0);
>>           fail_if(!ops->read_segment || !ops->read_msr ||
>>                   !ops->write_segment || !ops->write_msr);
> 
> Do we still need checks for ops->{read,write}_segment if we're not using 
> them anymore ?
> 
>> -        if ( (rc = ops->read_segment(x86_seg_gs, &sreg,
>> -                                     ctxt)) != X86EMUL_OKAY ||
>> -             (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
>> +        if ( (rc = ops->read_msr(MSR_GS_BASE, &sreg.base,
>>                                    ctxt)) != X86EMUL_OKAY ||
>> -             (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
>> -                                  ctxt, false)) != X86EMUL_OKAY )
>> +             (rc = ops->read_msr(MSR_SHADOW_GS_BASE, &msr_val,
>> +                                 ctxt)) != X86EMUL_OKAY )
>>               goto done;
>> -        sreg.base = msr_val;
>> -        if ( (rc = ops->write_segment(x86_seg_gs, &sreg,
>> -                                      ctxt)) != X86EMUL_OKAY )
>> +        if ( (rc = ops->write_msr(MSR_SHADOW_GS_BASE, sreg.base,
>> +                                  ctxt, false)) != X86EMUL_OKAY ||
>> +             (rc = ops->write_msr(MSR_GS_BASE, msr_val,
>> +                                  ctxt, false)) != X86EMUL_OKAY )
>>           {
>> -            /* Best effort unwind (i.e. no real error checking). */
>> -            if ( ops->write_msr(MSR_SHADOW_GS_BASE, msr_val,
>> -                                ctxt, false) == X86EMUL_EXCEPTION )
>> -                x86_emul_reset_event(ctxt);
>> -            goto done;
>> +            /*
>> +             * In real hardware, access to the registers cannot fail.  It is
>> +             * an error in Xen if the writes fail given that both MSRs have
>> +             * equivalent checks.
>> +             */
>> +            ASSERT_UNREACHABLE();
>> +            x86_emul_reset_event(ctxt);
>> +            generate_exception(X86_EXC_DF, 0);
>>           }
>>           break;
>>   
> 
> The rest looks good to me (with or without ops->{read,write}_segment 
> fail_if() change).
As the patch was already committed, would you mind sending an incremental
patch?

Jan

