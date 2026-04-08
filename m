Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAItBk/x1WmL/gcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 08:10:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D93B7796
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 08:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275396.1561237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAM6E-0002Eh-MS; Wed, 08 Apr 2026 06:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275396.1561237; Wed, 08 Apr 2026 06:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAM6E-0002C5-IM; Wed, 08 Apr 2026 06:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1275396;
 Wed, 08 Apr 2026 06:09:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAM6D-0002Bz-F3
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 06:09:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAM64-008ghE-Og
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 08:09:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d5f0ef-2eae-0a2a0a5409dd-0a2a45059384-44
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 08:09:04 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d5f100-3760-0a2a45050019-d155dd2ecda7-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 08:09:04 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-43d01d6b50cso5463720f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 23:09:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f1a99sm58877902f8f.32.2026.04.07.23.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 23:09:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1775628544; x=1776233344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+l/nur9kTFw05WGEil2W809yrbj5PGrTmLYCWyUfZjk=;
        b=aPO3X2PUNl+Ifpx/JElyjtnlp5Qvab80nZUUXI2Wai9r5y6KhJPRZrlSxISEeuPN+B
         kfRgmT07iTo0mx3FGc8M80jCcvIWXMyZrqyIJpGCGGBL+Es8od67wLJZvcFsgHWjAayl
         ut/KMjB3FxwilZzybnLnaws4r4Dk5PrYv586cQ2IZsoPg87C/U7Ub2AsZ3Op1dtL7a1P
         YWoq/mIkAR1tLcNoAcDzVYDlObMF1qRjgKuqqDavda8jrYwbcKA8+0A+d6IMnpVAug27
         7VzyrlBd9pgrryCUUiwdxhitGOeb3Su/JE6sy6O8NcsQLjUzvx9HAeAGnHubvnhDQvxy
         NuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628544; x=1776233344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+l/nur9kTFw05WGEil2W809yrbj5PGrTmLYCWyUfZjk=;
        b=lM2x2epfAktuxVN025ilMHsCRH8TH5srRgdYNfqELmo0yGMUyePb6E2ZO0qoPtfInE
         6I6TLNT9e3IZUlTzRtBTpzfhu7/7maLOEitQroT8MouAP7Dn5QRQdM1Q8CxA0XKYHuVi
         70VIhFK3Jz6B4LBjBMxgrhedTO61eR2d9XU9+2gYKVfB2sJQ0+cwznttfsZyLu8+mwQr
         g6xsBco2AZODWmtS1eIwE56NCyhMX+FxgkPUrjda6yz8ycM1ZNYP7B4FAGA67VsY/Ju0
         7rreX7YGqkki36zXBv92/PTHIpsJTMHt5/6LpwlARVjJ/MdI9CSPlhBOjA2ECtyXrPcH
         yN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOFjkQfIdy84ov62TczbKjl8tWZ7Ay7d+nAPalAYdK9en/NItsGQ6tPIcme2Ls8oHL2PGSr+uuqqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynI4teyzeFnNip8o59vV11Lzs1biWnQXsEYai8xyKMWIoKb/LD
	yHFYIsmiKHy8X+0Zyg5sdwa+hNRpLKXWgi1PNjxAB9+WbjNjJTO8LDhnYgnlZ2IpXw==
X-Gm-Gg: AeBDiesr/YHlGIS2UXlTxgKykA8ZPQZzi/ZC80EcZ2EuP/OMOIoputsljMbnvkkLrNs
	0XIgCvfmZzlS+4MJQLZF2XuZiKyf8bSifdR2rh46pskoBKyj7uA+B1q5Js32vNI4u0EqT2b3A3V
	LvcE4+287UtLr+pU6EMoyty/KvvoiDUmbq8IN9VRUb3+rEwT8PwtGJ55eKPjdq2C0j2xdm+GFLl
	gyGZAZcQ4IVMHK9NcSi5d0KD3uQ1gI5GNiJq5rHaFC9WrkGTgzPdAG1QaZ1Smq+nEFeGC/BV+IJ
	W8GNk3e/ws6EBOS4Ftf785Ds5XmzDa/K2X0UNKqJa0NbTaQshJ4Jgrhk6AhWAMxwuo/U+YIxIMG
	xHzph8AO5NBeTPnlG14xx2sDI+itV8W97up8JI7Vmvacnkobg7u+crTFIcphrV2cQ4u23dlXQd8
	rdxlLG2XH/g4yLEs6ogDiPvTIhyGviJy/vCJNRoCX2wo3iGr2ZaNq3Lk/3kaGkCwxShYTQqfu3g
	Ehn03R3uq3oQaU=
X-Received: by 2002:a5d:5f85:0:b0:43c:f7f6:6016 with SMTP id ffacd0b85a97d-43d292daa51mr28705894f8f.32.1775628543943;
        Tue, 07 Apr 2026 23:09:03 -0700 (PDT)
Message-ID: <a46d6578-e622-48c5-ab0f-34a88dfd2bec@suse.com>
Date: Wed, 8 Apr 2026 08:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/10] x86/cpu-policy: re-arrange no-VMX logic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <dfa41e40-b50c-4564-829b-0cf147fe3ee5@suse.com>
 <48df7b1b-5d07-4eeb-8028-6a90c12a6e2a@citrix.com>
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
In-Reply-To: <48df7b1b-5d07-4eeb-8028-6a90c12a6e2a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775628544-32D2796F-E2271E38/0/0
X-purgate-type: clean
X-purgate-size: 3403
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 835D93B7796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 23:58, Andrew Cooper wrote:
> On 24/11/2025 2:59 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -812,19 +812,20 @@ static void __init calculate_hvm_max_pol
>>          if ( !cpu_has_vmx_xsaves )
>>              __clear_bit(X86_FEATURE_XSAVES, fs);
>>      }
>> +    else
>> +    {
>> +        /*
>> +         * Xen doesn't use PKS, so the guest support for it has opted to not use
>> +         * the VMCS load/save controls for efficiency reasons.  This depends on
>> +         * the exact vmentry/exit behaviour, so don't expose PKS in other
>> +         * situations until someone has cross-checked the behaviour for safety.
>> +         */
>> +        __clear_bit(X86_FEATURE_PKS, fs);
>> +    }
>>  
>>      if ( !cpu_has_vmx_msrlist )
>>          __clear_bit(X86_FEATURE_MSRLIST, fs);
>>  
>> -    /*
>> -     * Xen doesn't use PKS, so the guest support for it has opted to not use
>> -     * the VMCS load/save controls for efficiency reasons.  This depends on
>> -     * the exact vmentry/exit behaviour, so don't expose PKS in other
>> -     * situations until someone has cross-checked the behaviour for safety.
>> -     */
>> -    if ( !cpu_has_vmx )
>> -        __clear_bit(X86_FEATURE_PKS, fs);
>> -
>>      /* 
>>       * Make adjustments to possible (nested) virtualization features exposed
>>       * to the guest
>>
> 
> These clauses aren't logically doing the same thing.  So while the
> compiler can merge them, I don't think it's a good idea to do so at a
> source level.
> 
> The "if ( vmx ) " block we can just see the end of is for features which
> need to cross-check extra VMX capabilities.  Each of RDTSCP, INVPCID and
> XSAVES are #UD unless explicitly enabled.  MPX is the odd-one out,
> checking the load/save capabilities.
> 
> I suspect this list is incomplete.  These cross-checks shouldn't fail on
> real hardware, where the VMX capabilities should match the native
> features, but nested virt is rife with enumeration bugs here.
> 
> The second "if ( !vmx )" clause is different.  This is really "I wired
> up PKS based on how Intel works, and if AMD ever gains it it will
> definitely need context switching changes to work".  This is in lieu of
> having dedicated Intel/AMD annotations for features.

Right, and this is what I'm using the new "else" body for later in the
series.

> The MSRLIST addition from the prior patch is arguably misplaced, except
> it's trying to cover both of the aspects.

Why is it misplaced? Where else would you want it to go? The VMX aspect,
as you say, is included in cpu_has_vmx_msrlist, so it doesn't need
separate checking for VMX.

> AMD are making no obvious moves to add PKS, and I expect MSRLIST is even
> lower down their priority list.
> 
> Overall, we need checks here for every guest-visible feature which:
> * has VMCS/VMCB controls which are enumerated separately
> * needs new context switching considerations

Which in this series are USER-MSR and MSR-IMM. Hence this prereq change,
to simplify the additions there.

> Maybe the "if ( !vmx )" shouldn't really be written this way.  I'm open
> to suggestions, but making it an else block isn't a solution.

Well in this situation I guess it's you to make suggestions. I have made
mine by way of this submission.

Jan

