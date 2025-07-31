Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF04B16CD8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 09:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064947.1430250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNwG-0000T9-BN; Thu, 31 Jul 2025 07:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064947.1430250; Thu, 31 Jul 2025 07:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhNwG-0000Ri-8i; Thu, 31 Jul 2025 07:42:56 +0000
Received: by outflank-mailman (input) for mailman id 1064947;
 Thu, 31 Jul 2025 07:42:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhNwE-0000RJ-VJ
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 07:42:54 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6d7f47e-6de1-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 09:42:52 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b782cca9a0so469662f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 00:42:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfe539dsm866648b3a.122.2025.07.31.00.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 00:42:51 -0700 (PDT)
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
X-Inumbo-ID: f6d7f47e-6de1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753947772; x=1754552572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rrv4luhEHZ1AdBOvSSJzKVLAAP43gkGn1wZH/Lq7vaQ=;
        b=ehFkmPNzDnxXnag+VjCHZbfc5NjGAA2F8phzvFHhSGJqIPQwBa9IIel+XHPEc4p+Kg
         ZNYVs76CDsPAHCfuNYoFGkP2aQFtWMR5Yg0+kH5LgK/oTuPNphwuEgpDnAve70X8oOqC
         mGUrrA8q8nSvxcF+d01h/7B3W4LDO9O/rKLYBEk264d/kY7KsOefph89npHKQgcaHTif
         oYe5GVmMFIB925Mcw5DqN3rtXTDcobGhTQnpb0HYuwUNuPj0Ffpsx7DhHsfb0pBaUscy
         3duZOvJmhBIyW+escLTQtYw0QIvv10ANc1SSS4UWbk7R07ZN/WYJIN/r5i+ps3YUPdxX
         ldjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753947772; x=1754552572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rrv4luhEHZ1AdBOvSSJzKVLAAP43gkGn1wZH/Lq7vaQ=;
        b=ZGjUCAXPNu2mCdxC1jFCW0sWQD9lNILwBIbK69nxJOgaOYKFO0tDK2ki1yoSpJNATU
         /xPaCKfQP1IkOiNqEHPY3kWu9Di8O5tilzN4d4GvbRJ5jHryCBnoBqqKpmnyZQFZX9Lc
         mrTEaqzB9DnWvETOZCM0x4hXfqNwdqRt3MvD1Z8RjKK090aeu4SMlfR0NBSwGPkYzAP6
         8K3ZzOwOZXYjPHldIYl3743iRsmXMUGW73wNbgrGsvaWhpjb+hcdGZKyjyj2JGbujreA
         4PBqQbHDLc+uxg/6MHvWF8a0Vx+QdN+8S8NJZjtNNO2+Odoto9fWIrv07IRDLHgEWd0I
         ZNtA==
X-Forwarded-Encrypted: i=1; AJvYcCWu9tPxAk4X/AQNE/DTA3TmSeJCwL8q4k9b47dtcUioJ9CnqU8oqHanmijxjdWFKN9lhoexRFcUXXM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzmpKRsHT7zNUy6cH5uhIJMvd8lL4J09QIMcsPEXcOLt4cp1sKG
	hxKcm0+wI93X6iSxj6J9w+o1pj1RjIr7FEWdU7AQnTC7Mwix/IsNsi62DcnIYtnM6g==
X-Gm-Gg: ASbGncvXngtzD9rC+ct2yAoGRXgo9Lh4bXaA5td9Q527CJJoyOKouP57a3VvsxjIbtb
	6A4vpdGtiV0bnaTU3/0znsDk9dCrwv5YTTTGCsRptp/782xGCfv+aK53pJ2QHT6pHBJxCawytZQ
	mD17oqarGGoj0Q/2YKtQJctOF5q9y1QHfnAtYwEO2+x2wTtEH/wGLGICBk0zLlEc7qgs8cuWY0C
	AfE225bOjby7hPVu6CWkDllv5YqQBiA62+PnXHcFuTmrS4mixjz4a+J/Rmc3yd/3Mrwjg2CINfz
	SuykkufgF/6s7iJ0UFtRoz83dhlUoKq/seldNMrErG4aYbrxtq8ntU7zFEDbAZhREsuvANt4VjX
	eAvgSTpTuI1xvQ6Z9p0UyLuOXqJrckcdKdqSnXCT3mjg2My4QN+12xw2MNMv9oKwXCii9EUQKrU
	Q0t1huqX4=
X-Google-Smtp-Source: AGHT+IFazYc3veJwsK5eykVtAxZNJz0X5J8WTnjto6AZOhiqM/pfoK1cJSaoBuAOMSEg3idme08YCA==
X-Received: by 2002:a05:6000:288c:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3b794ffd043mr5028719f8f.33.1753947771933;
        Thu, 31 Jul 2025 00:42:51 -0700 (PDT)
Message-ID: <549a1bf2-f27e-423c-883f-6d50c576f00b@suse.com>
Date: Thu, 31 Jul 2025 09:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 1/2] xen/evtchn: enable build optimization for
 evtchn_move_pirqs()/send_guest_pirq()
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <f1605fd9-4e98-4ab3-8fa8-ed52b0f76b56@suse.com>
 <614706a4-8bb8-4c40-aec8-3031ec465ae8@epam.com>
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
In-Reply-To: <614706a4-8bb8-4c40-aec8-3031ec465ae8@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 15:46, Grygorii Strashko wrote:
> 
> 
> On 22.07.25 11:23, Jan Beulich wrote:
>> On 18.07.2025 12:11, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> On platforms without PIRQ support evtchn_move_pirqs()/send_guest_pirq()
>>> functions are unreachable (Misra rule 2.1).
>>>
>>> Move these function under CONFIG_HAS_PIRQ ifdefs to fix Misra rule 2.1
>>> violation and resolve call of evtchn_move_pirqs() from common /sched/core.c
>>> vcpu_move_irqs() code by moving evtchn_move_pirqs() into x86
>>> arch_move_irqs() callback (which is converted to define).
>>
>> The patch title isn't quite appropriate anymore with this description, I
>> think.
>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> preferably with ...
>>
>>> @@ -1707,6 +1709,7 @@ void evtchn_destroy_final(struct domain *d)
>>>   }
>>>   
>>>   
>>> +#ifdef CONFIG_HAS_PIRQ
>>>   void evtchn_move_pirqs(struct vcpu *v)
>>>   {
>>>       struct domain *d = v->domain;
>>
>> ... one of the two blank lines also dropped here, just like you do ...
>>
>>> @@ -1722,7 +1725,7 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>       }
>>>       read_unlock(&d->event_lock);
>>>   }
>>> -
>>> +#endif /* CONFIG_HAS_PIRQ */
>>
>> ... here. Happy to adjust while committing, 
> 
> Thank you.
> 
>> but please consider suggesting a replacement patch title.
> 
> Honestly, I, by myself, not sure about proper patch title :(
> My options would be:
> 
>   "xen/evtchn: evtchn_move_pirqs()/send_guest_pirq() fix MISRA Rule 2.1 violation"
> 
>   "xen/evtchn: opt out of common pIRQ code for arches without pIRQ support"
> 
>   "xen/evtchn: fully restrict concept of pIRQ for arches with pIRQ support only"

I would probably pick one of the latter two, but as said - an ack is still
missing here. FTAOD: It is on you to chase it.

Jan

