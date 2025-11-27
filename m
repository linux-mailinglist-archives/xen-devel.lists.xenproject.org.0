Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CB6C8EBA5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173982.1498964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOclg-0002gW-D1; Thu, 27 Nov 2025 14:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173982.1498964; Thu, 27 Nov 2025 14:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOclg-0002ei-9b; Thu, 27 Nov 2025 14:14:44 +0000
Received: by outflank-mailman (input) for mailman id 1173982;
 Thu, 27 Nov 2025 14:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOcle-0002ec-R2
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:14:42 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a1a936d-cb9b-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 15:14:41 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47755de027eso5501995e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 06:14:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791164d4f3sm34093895e9.13.2025.11.27.06.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:14:40 -0800 (PST)
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
X-Inumbo-ID: 6a1a936d-cb9b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764252880; x=1764857680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GLOTP/kdAuj3rBOEQKxYZeDzus8tKMIvzdj+eBBRAzY=;
        b=YXDtiOTJ+E0hLSj5D+UHfCWeqWs4TVdyLGCNeE/H2rixGMJRqmT/TEfKBpAlpbO3oz
         O6Xd9rM+7uIF/gfFCPlHxTg/9r/K+hmoo496GsYp+qACtZsvFRjwdyJmFOnqF8qbKA5d
         UPXlS4nN/QZshlsrYLSvzGkbyNMLlARrG2tc76uKpkL/AY5SClx112yt0irR/ulw9CF6
         EmHyDn1yVyV1dunT6MwEWXRwOR68OTXxtKXVEPUPG6IDoIWeK7Ow2klDxel83oQ6H9Q0
         1dGnyXMAm1RdZaoaBgIty+aFQ+1MgoPhQApQc8mJajVSYp/t8WmbQzovc9aIRLQou360
         +xEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252880; x=1764857680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLOTP/kdAuj3rBOEQKxYZeDzus8tKMIvzdj+eBBRAzY=;
        b=Ev8dTwj5Aw3H+P629Df+0ExiV9h6But/0SM3t3tWE3kEMExIcaVNmhzT1ST3HoNWlr
         JVkutdqFB96mN4kaZvli8yxQpIRASAjr/gTjfSoJe9fnKH/sVDA56YNnTp773SjR5kT9
         8LraFmWSW/0dAL8TMx5pcKo/zy+5D2MlTQZJimy2v6Mt/vXaXuXblaQZ8ngUd3uCQpyo
         pJqSGnZWPg+4LxveBzgBkGL+GoTFHVmZf825m4PQzPk2WKrfahZfKFUdjTVWhsQdhDvY
         tVSoj3kJUFBP+T1U9qkn14mTcC2N4o6picPcR0iUOJzD9ghS477fml+sDwKI9GQJ2RUk
         7adQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2uIskihh8XGPiXF34t35wTGGDkjLr8l/sA3x+SWjvD9lSmmkBnAzz+9Ewc6oOVdVxYJdgYA7stWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLvWnxfnAvwPTc3XIvYb2DtnP+f4P/EXIHMaPg+JEikWgffhnn
	5sa4kLafiw1QYI3fi6jhgueWBF75V8uKjpE3Q0wVlOov6kWv142omx3Ykc3qcN8Iyg==
X-Gm-Gg: ASbGncu/4+lpqLp7WFVgYeiG5jq8sQc0QNoW8PkoyYrKEJaujH/hszXm48y3ECWB1Hh
	hLEjuTAtDNqrkoQ1vF2DcxXG8hQlTpKMicUOhSrx3iyc96m5NCeD4jzP7fC47tMI4wfCcllj57f
	ggKrOIULBOwMvbJzIBBgvU8Gy8147F/NXwJ/KW2U8cm9k4mWG2gjl02V6qOThALAr54hhE/a1sn
	SRXXsa7OCm+KHQSovCN422HntiSbpSZ4fvldWllo7bLxXmF8G0wd7znJZekjAoBczJfvN3TLJ9F
	B+QBbrUuK4MkaUaiLKLv9UWEuuUsF64J49UnbyBPjQ3H6s2csiQqhYCReIp5rUi+IN1VtlPCetO
	chZVh33M7F6R7OICQr/7mwFO9E3xSRIs3y8mTUXV/m9BX9e+tV0vVasjaQmcXBS9Fwc/8ADXpsi
	TsJ/k3qEvUxDkX/IQt8c99q6jeKOg7IqOhji7Bq64atgRr6Y9zMNfu3a5VS1RcKfb+OqNJnR/tb
	cU=
X-Google-Smtp-Source: AGHT+IFvIftLLTbb0Her5v/Z80wTciEo9g3r6KmdYLCyFDr6emKSB5P3/TpKShjR0CdEghBUlyvarw==
X-Received: by 2002:a05:600c:154e:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-47904b24920mr108941275e9.27.1764252880426;
        Thu, 27 Nov 2025 06:14:40 -0800 (PST)
Message-ID: <40aa8d8c-5f19-437d-8c18-cd65ccafaca9@suse.com>
Date: Thu, 27 Nov 2025 15:14:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before using
 it
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
 <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
 <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
 <1ea5b7d2-6d73-4133-bf32-085559f6df41@suse.com>
 <DEJJ9NEIB99E.1U013WYUA7TZO@amd.com>
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
In-Reply-To: <DEJJ9NEIB99E.1U013WYUA7TZO@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 15:06, Alejandro Vallejo wrote:
> On Thu Nov 27, 2025 at 2:37 PM CET, Jan Beulich wrote:
>> On 27.11.2025 14:15, Alejandro Vallejo wrote:
>>> On Thu Nov 27, 2025 at 11:46 AM CET, Jan Beulich wrote:
>>>> First: Would one ever pass X86_VENDOR_UNKNOWN for "vendor"? The next patch,
>>>> for example, specifically doesn't.
>>>
>>> I don't think so. There's definitely not any existing case atm. Still, I think
>>> it's better to preserve the invariant that the follwing transformation:
>>>
>>>   from: cp->x86_vendor == X86_VENDOR_X
>>>     to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_X)
>>>
>>> holds for every vendor variant in the "everything compiled-in" case.
>>
>> Otoh the code could be simplified if you simply rejected the passing of
>> X86_VENDOR_UNKNOWN.
> 
> How would this rejection go? Something like this at the top?
> 
>   if ( vendor == X86_VENDOR_UNKNOWN )
>       BUG();
> 
> I'd rather have something that causes a compile-time error, but I'm not sure
> how to cause a compile time failure when a constant matches FOO.
> 
> Surely there must be a way...

Take a look at BUILD_ERROR(), which I think may fit here.

Jan

