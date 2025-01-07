Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90338A04691
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 17:39:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866648.1277976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCbD-0000WM-4t; Tue, 07 Jan 2025 16:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866648.1277976; Tue, 07 Jan 2025 16:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVCbD-0000Ts-1y; Tue, 07 Jan 2025 16:38:35 +0000
Received: by outflank-mailman (input) for mailman id 866648;
 Tue, 07 Jan 2025 16:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVCbB-0000Tm-KL
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 16:38:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d453dc95-cd15-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 17:38:31 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so178518975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 08:38:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c848a47sm50209996f8f.62.2025.01.07.08.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 08:38:30 -0800 (PST)
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
X-Inumbo-ID: d453dc95-cd15-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736267911; x=1736872711; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0+9v+7uSF45XrI3/JeDvgSGJd6PS0H+ytMNhpT9kwo=;
        b=LqVU6u3vyPjWCKWSHUwxuVKiZXiK5VjlmT+7hp5CY1ZKXd92aKUKBdifi+3raFW5hc
         lX6xwYQVsD0JopNPcUu9RQr4Z0PK7Qk5hgIIyUPQw4qit24wfPMQe/jywYTQS5dF4Ngd
         Q4NtSu2ICL2QIlK41hm+LLBBhUSq125aniLI1Se+SyA6qrfnUAvtJ7AzAaNsC+xJbWOW
         aCe3Frj8QZcBzFnMEt5LwwjZkPLusb+4ArrxdBJ07Mzko6FkIqLIBCiXC6KNlEYHJU+t
         YOP/F6MlZCkPZ27yKXDNCn+jsDgWlQ70lpErfxe85LNxasljHwt6YMyJahd2UvRPzuCb
         OIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267911; x=1736872711;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0+9v+7uSF45XrI3/JeDvgSGJd6PS0H+ytMNhpT9kwo=;
        b=CoR89iPJ7kwHxjwTzOQiAOJgtE3ysO/3Q8BS2GO2uRft8/WT9/omJY3XX/at8IPsNa
         clRW+WLixvbBTE506So0xglgrgYRmQrm3kiCqXZt4Z7tvU6lvPqY5PEwwTCE3EsHiDhI
         C/VRdyTtdbJPScAyxKgqXAVhUwSkxzYHlDuN9MBzMcMcDhg1IudoOphFltfFp/gGgCA4
         gQwkcXjhZfDwFPQXeyYGirjh+D9TVtNY8zv0G3A20tVJEsvpibPKhyYo4roFJCcjnhqt
         sPqoM7G4672HfgBAadLcWC02gDxEPftzgtdQV2o30Z7LUfbAXtOKz5n/n6yIQI82YTfa
         qNvg==
X-Forwarded-Encrypted: i=1; AJvYcCUs6MfsRp6Dbzf52lLiiXG0sPCG7IoU57Q3gL4feEcccyccBmdlT/s8foW1DxUHlXaXgxsLQfxZ22E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtaZBoJ4QmAz9GO8ZxJE6QrsCbQwlc7wOjzoAN+hjIoJ0d56ay
	bo5VZ9XTSmFpmf5pU5iLnWRThjLpWdKI6TatDfWkQyCM6bmcPk40WPk3Zz5jzg==
X-Gm-Gg: ASbGncuhYybl4wVotL8uZKdwGRLDAXeu2WSQqko4wVYYYCO2T/Jzm6JhfoUt0qwscVx
	mMAMqCej06vczb2HsdUayCl9y9uPS6vw9BhR+jP7ryTaQBESnrACnue4EcgRc6KfEenMXWWCC1i
	V45lqaxw0BdBxQUsI0ZXXFzodHx9/SLcl9lGOiJHtg0O3nqETD0E6+MGv8VZQYXgiXmNXnhl5Vv
	/k4AHOlN0nbYii4LnjmSAPWbUWJgzcALAkN9feImp93Cp3OE5ZfJGXAYLcoe05yVM1Q+3eFrgh3
	lJgrgBLcOg0jL/7vc+IY6MuygGGj0SQ+pvFgZEbA5Q==
X-Google-Smtp-Source: AGHT+IFgk2qcgHGekUml+f3xaIyk2NncAnYL/Lj4TCidnqfXnNvr5fkIpF7JAnFgrhv8D44UmbfQtg==
X-Received: by 2002:a05:600c:3b13:b0:435:23c:e23e with SMTP id 5b1f17b1804b1-4366864409amr567285395e9.12.1736267910726;
        Tue, 07 Jan 2025 08:38:30 -0800 (PST)
Message-ID: <511c3207-20b8-4110-a5ef-55f8b428074d@suse.com>
Date: Tue, 7 Jan 2025 17:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/events: don't allow binding a global virq from
 any domain
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-3-jgross@suse.com>
 <577427ff-61e2-4fc9-8853-a7eec3f69bb6@suse.com>
 <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
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
In-Reply-To: <5261716e-a2f4-4423-bb8d-17e36bf34538@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2025 17:07, Jürgen Groß wrote:
> On 07.01.25 16:34, Jan Beulich wrote:
>> On 07.01.2025 11:17, Juergen Gross wrote:
>>> @@ -479,8 +486,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>       */
>>>       virq = array_index_nospec(virq, ARRAY_SIZE(v->virq_to_evtchn));
>>>   
>>> -    if ( virq_is_global(virq) && (vcpu != 0) )
>>> -        return -EINVAL;
>>> +    if ( virq_is_global(virq) )
>>> +    {
>>> +        if ( get_global_virq_handler(virq) != d )
>>> +            return -EBUSY;
>>
>> Hmm. While this eliminates the problem for the common, race free case,
>> the handler changing right after the check would still mean the bind
>> would succeed.
> 
> Are you fine with me adding a paragraph to the commit message saying
> that a future patch will handle this case?
> 
> This future patch is patch 4 of the series, which will need to be
> modified to check the handling domain inside the event_lock.

I think this would be okay, so long as patches 2...4 are then also all
committed together.

>> Plus this way you're breaking a case that afaict has been working so
>> far: The bind happening before the setting of the handler. With a lot
>> of unrelated if-s and when-s this could e.g. be of interest when
>> considering a re-startable Xenstore domain. The one to take over could
>> start first, obtain state from the original one while that's still
>> active, and be nominated the handler of the global vIRQ only in the
>> last moment.
> 
> This is a racy situation, too. If the old domain receives the virq after
> sending the state, this would need to be handled by transferring the virq
> information to the new domain, which can result in a never ending story.
> 
> This is the reason why the domain state bitmap is reset to contain all
> existing domains to be flagged as "changed", as otherwise a change might
> get lost.
> 
> I'd rather be able to handle today's use cases in a sane way than to try
> handling any weird future use cases which we don't know yet.
> 
> I think today's behavior is more or less insane and the new behavior is
> much easier to understand and more intuitive.

Hmm, I'd like to leave this then for input by other maintainers.

Jan

