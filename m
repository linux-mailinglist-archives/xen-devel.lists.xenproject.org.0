Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ3qHUO0zGlWVwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 07:59:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C9C375016
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 07:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269659.1558583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7oan-0000H0-Ch; Wed, 01 Apr 2026 05:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269659.1558583; Wed, 01 Apr 2026 05:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7oan-0000E7-6t; Wed, 01 Apr 2026 05:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1269659;
 Wed, 01 Apr 2026 05:58:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7oak-0000E1-T5
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 05:58:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7oak-00AZ8R-8p
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 07:58:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb3dd-2eae-0a2a0a5409dd-0a2a450a8f5a-48
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:58:14 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb3f5-1772-0a2a450a0019-d1558031a8f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 07:58:13 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso5224535e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 22:58:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887adc52b2sm35212055e9.12.2026.03.31.22.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 22:58:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1775023093; x=1775627893; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cKMT8KyzZ1Mt9osAqCAjw+gKQXf80yubGZVZ0kKFnWo=;
        b=OEApTtg7Uni/BnVUZzcnKCg5RR0hRvEsIVyK8MZXDf4gVqbNtXmMEF8CX3vVYk3tt3
         +TbJehgElfA5hjRyW0pe9vQyizk7ojpCsPDHmvevAPtoxL3/1327FomJfF8/0M3EPFz2
         DPQOBIwcLYjg2e2E2YXFTHH1SmKpzrLAbmSGzeoyYhbeO9D6fsbMyn1ureWwWFRxrDjq
         Xo3Q6v/BogXnOqg5RFCIlpG55RK0TbS8EbdJPLvH7oUBfxTj5SNGiRkEGmb2fIniTeD8
         62Vs4pIWx9okyyjE7aZEj8Wyakn4a13Ccm9KLPPebAyO+NQc55dPPUTrBZxbM662HniH
         nCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023093; x=1775627893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKMT8KyzZ1Mt9osAqCAjw+gKQXf80yubGZVZ0kKFnWo=;
        b=IN+aetq+vV5cfoytHno0a7p+TkXhKMCP0uUZgJ5uTdvBoNFpEXM9RWYrLxdDAI2OoI
         S+ILeVydU38SV5gHcK+6cKxk4MJdmwSczmaqifOqmtVEz56j+RhaBA8qwyeETt8/I3NL
         /041wNuJpVKR3QZ7EZ2XZBV6l+Eluo5pXgzRvEXxyzJvmGBrMCBk4MJEJSjJCTj0Tkmq
         mJHFZLK6UA+B0938TkGXl5VteFH0lPdGRpiaF3IThtIp9lid0IeMJ0YnQJFOtJLq342R
         BnfnMDADvGLRfFMb4zfmeIpWRNl7vPoJUGzqlvlR+UJDq8xJoE1ALjEq3dNGLghykZW7
         Nrng==
X-Forwarded-Encrypted: i=1; AJvYcCWd1tUVoHUo01wQDrP/X96na4iKkKSrHBp92M83ZWbB9kqwnbGzEdKG8AiYaBa6fpvCBs1+r/634yc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1vqszRs+DYC8ai3TsLYaZ2Sei9ThB/KwvFf/w4OPqeMhJcp3H
	KRkpH7sbGUTEsKl1flj865ycUAGhdP4ckwD1Wv8F5kn5Au6xsQMQI+IIhQ911S/KaA==
X-Gm-Gg: ATEYQzzVVPRxIV3BvF3IZhh/0gM4M2A2DtfnaHQjhT9atbT4hwe4ONqYkL/5npUVpCR
	we3tregbQjNmUCcM1r8nKPmblKdpgIdFjJjegqQittDUxaYovo1gIrvqv64PKgktWGQH3266eGB
	VILgixe4kaXJ0Verg8Qgog49ISJwJJF04aiyWeSXqt3SHLNe1zDAT0ZNIHAIb+LPdtQJ/v16IZT
	KWDAr0WMsj56dTqM1Gkqr1HgLvZDYjfK7a2NpYLe/4bSnb7e/xunfDSoAIPaLZkAbvJjbgdtGwC
	8InLE2WMbUQ0q5pavUu6h6g+uoP7zeoIQvoJBkGzL/uT1pm3gVpDjNwLL0bnZs2ExNkieC+o82g
	c3FJ23yUDCeBsLzau/GXY38H3WkQovZ0xDWb5BSxd55rWg9zmBk168svmG/pwJjH/8A92e5AGPd
	wXMd41Chfv1R6GjheNMG8e1yovMNi9rTIgUp15RjGtmXYDb+ixPz7TwKK527KqkpdO17/UYQSxR
	JDzYwCUwFNsVsHusnHOyC18XA==
X-Received: by 2002:a05:600c:8b77:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488835bc362mr32141985e9.13.1775023093070;
        Tue, 31 Mar 2026 22:58:13 -0700 (PDT)
Message-ID: <cdacc6a8-cd49-4327-a98c-636545e8579b@suse.com>
Date: Wed, 1 Apr 2026 07:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
 <6df9470e-4969-48d1-bf0c-c6569a5e5577@suse.com>
 <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
 <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
 <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
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
In-Reply-To: <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775023093-BC882900-80AF429B/0/0
X-purgate-type: clean
X-purgate-size: 3959
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C7C9C375016
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 18:32, Oleksii Kurochko wrote:
> On 3/31/26 5:53 PM, Jan Beulich wrote:
>> On 31.03.2026 17:20, Oleksii Kurochko wrote:
>>> On 3/30/26 5:13 PM, Jan Beulich wrote:
>>>> On 23.03.2026 17:29, Oleksii Kurochko wrote:
>>>>> domain_use_host_layout() is not really architecture-specific, so move it
>>>>> from the Arm header to the common header xen/domain.h and provide a common
>>>>> implementation in xen/common/domain.c. domain_use_host_layout() potentially
>>>>> is needed for x86 [1].
>>>>
>>>> No matter that this may indeed be true, ...
>>>>
>>>>> Turn the macro into a function to avoid header dependency issues.
>>>>
>>>> ... this introduces unreachable code on x86, i.e. a Misra rule 2.1 violation.
>>>
>>> Do we have some deviation tag for such cases when the code temporary
>>> isn't used?
>>
>> I'm sorry, but it'll take me about as long as you to find out.
> 
> Sure, I will take a look. I just thought that maybe you have a solution 
> already just in your head.

Well, I do: Don't make this an out-of-line function.

>   I wonder
>> about "temporary" though: Do you have a clear understanding as to when
>> that will change?
> 
> No, I don't. As Stefano mentioned they will need this function one day. 
> Another option we could use ifndef x86 or ifdef DOM0_LESS and then when 
> someone will really need it on x86, this ifdef will be dropped. I don't 
> know if it is better solution.
> 
> It seems like the best one solution will still make a try to make 
> declare this function as macro.

Or an inline function. There's nothing ...

>>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>>    
>>>>>    #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>>    
>>>>> +bool domain_use_host_layout(struct domain *d)
>>>>> +{
>>>>> +    return is_domain_direct_mapped(d) ||
>>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>>> +}
>>>>
>>>> The placement of paging_mode_translate() doesn't match ...
>>>>
>>>>> --- a/xen/include/xen/domain.h
>>>>> +++ b/xen/include/xen/domain.h
>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>>    
>>>>> +/*
>>>>> + * Is the auto-translated domain using the host memory layout?
>>>>> + *
>>>>> + * domain_use_host_layout() is always False for PV guests.
>>>>
>>>> ... the description of the function.
>>>
>>> But why the placement should be different?
>>
>> If you focus on auto-translated, then imo paging_mode_translate()
>> better would guard everything.
> 
> Then it make sense to do in the following way:
>   bool domain_use_host_layout(struct domain *d)
>   {
> -    return is_domain_direct_mapped(d) ||
> -           (paging_mode_translate(d) && is_hardware_domain(d));
> +    return paging_mode_translate(d) &&
> +           (is_domain_direct_mapped(d) || is_hardware_domain(d));
>   }

... in here which clearly speaks against doing so. And yes, this is what I
was asking for (with the function parameter also suitably constified).

>>> So if domain_use_host_layout() is fully depends on
>>> paging_mode_translate(d) && is_hardware_domain(d) and for which
>>> paging_mode_translate() is false if it is PV guest.
>>> Thereby domain_use_host_layout() is false too.
>>>
>>>>
>>>> Further, the first sentence above suggests the caller has to check
>>>> paging_mode_translate() before calling, which as per the implementation
>>>> clearly isn't the intention.
>>>
>>> Sorry, I don't follow you here.
>>
>> By starting the comment with "Is the auto-translated domain using", you
>> imply the caller checked for that aspect already. At least the way I
>> read it.
> 
> My understanding was that it is an explanation what function is checking.

For that you'd want to omit "auto-translated" from the first sentence, imo.

Jan

