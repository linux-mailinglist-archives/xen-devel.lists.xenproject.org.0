Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F5A05487
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866895.1278267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQUY-0002ys-JK; Wed, 08 Jan 2025 07:28:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866895.1278267; Wed, 08 Jan 2025 07:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQUY-0002xP-Gc; Wed, 08 Jan 2025 07:28:38 +0000
Received: by outflank-mailman (input) for mailman id 866895;
 Wed, 08 Jan 2025 07:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVQUX-0002xJ-Eq
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:28:37 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bafbd34-cd92-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 08:28:35 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso5587167f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 23:28:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c833899sm52167875f8f.42.2025.01.07.23.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 23:28:34 -0800 (PST)
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
X-Inumbo-ID: 2bafbd34-cd92-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736321315; x=1736926115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=43jjLX5Vg3QOL3r2QQgGfUrWU2sYwHjmuLJnWEgKluE=;
        b=Ygpm/jrsztbFEkIrLosBMYdi+hb6WChFycpO88EKxWjhTNisxVavO5W1vzTeEzy+ED
         V7CmmAJvYSbuzlRNkZg2iZCROZKOpN9ahJREDySh1uEktR1VOBUwQGWYMMWRMIQ4k4Kw
         qQneyaS7dSEH2ZWJ6RTNeQrCm2yMUKuUEt6KiC4xvNx8IB+saHsxR0wwtfCNpUdwu1h3
         111eKvOo1t9MUYVCfcnpUhVLjT3/ESs2Q9njirSCitjoS268L2OSqbBVMsyVrA5Uflvt
         VfEnMAeRTZSbDFbnxnQsQlc0LvWFKbCgRRKed5oLn546Hf93s4IZ8eMl84QhEub+VWGb
         u+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736321315; x=1736926115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43jjLX5Vg3QOL3r2QQgGfUrWU2sYwHjmuLJnWEgKluE=;
        b=OvQmakauvdcoT+S6fUGsvtyZ4pDSvmulX0PTxl7dqWQ08kVvqQRQxFZY68TwyJ81m/
         aSch+Ci8Itdiy/F0m8plMUhPS30er6U3xnvQwFTpcZ3jb6zooAUvj/c1UnFziblxHbI3
         q30mKHNNjsrpM2uZpDS6i0RVtGxlsMCPcFsxmxzpnVYUQrgZHi3vqrI6s3Cqb1np12qj
         t35O9B1a8QTHfEa0LOKjuvwrhvdT7W1haCI9eLwDK3hhYqH/AlUkaSiaI+MLn+yFm6cX
         8L9bxEA06LnVZzcCnr+DlJGLkoV5uWT3eykyNhRVgTBqw23wUFlDsSQQCiXLYraKAvKj
         KE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX97TNOlIVmJOlbzpOarYkimZboJJdO2Ic1u2LjOSXDPQ3rQsG/MkoOyM10LtXKSbuLtas+KY2pLnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd8Ok346kctjhjw4NO7Td/T1gnbphIPvC6NTtDrOtwftujwrH7
	02oCc1Y0ebHncgyzIvCharl8kGZxgXfZ49MI6pd7MKGoMHgOn0p54ltAATB2MQ==
X-Gm-Gg: ASbGncuAf7NHrhTE9kxUfY/FrLPr2FywpdOKhZukZ0Ef6PR9KUpk7IMLd8kzFnZd5pr
	SqXR3XQA1re9oLCqMl/NfRUHJTgK5Tdb6VsgHQpRz4u32MeIIhDGOWmMK5x6y5QZ5aIB/ixRhNd
	bYor+rmMjlRv+Am/4NBSYz9KfdZicefDARQNvi/e351DbIqT4nzMkviw9ZxienUfxTmsOD77dbo
	UF0jXpgIckgjUDPSh2Dgmo8uez7h6d+/HTwIXDFNOmWf2kegYYjdy3u2qhShWcDQM1AmgaC5Zta
	lfr5cS959h3A8YBlShEz2Kn0FWtWAJ4T5YWULwMnHA==
X-Google-Smtp-Source: AGHT+IGs6jvboxHQ/slSvQWO3lZBVrWGLU+dRwyWUPKtMh7/2Nwqfv6wFEAqwCFTYzsAGtbNnwWjEw==
X-Received: by 2002:a5d:6da4:0:b0:385:de67:2269 with SMTP id ffacd0b85a97d-38a8730e04amr1188281f8f.36.1736321314886;
        Tue, 07 Jan 2025 23:28:34 -0800 (PST)
Message-ID: <a2fa92ff-a5fb-4adc-86aa-1481ebec92fe@suse.com>
Date: Wed, 8 Jan 2025 08:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Denis Mukhin <dmkhn@proton.me>, dmukhin@ford.com,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <d55bf6a6-5861-4b72-88b5-2aaa28ae0290@suse.com>
 <VJ9ivpkbNlqfKhBlb5dL6OuoPAXK9wqD4mhgO9Qt4f0qgmuow22qFv1C7L8DlbKYo7ytdKWeV1bLaYJvTAc2Yt7sEd06XREerWER5RPx4No=@proton.me>
 <8a5a5a0f-72b0-4336-b0d2-142254319242@suse.com>
 <alpine.DEB.2.22.394.2501061046060.133435@ubuntu-linux-20-04-desktop>
 <c39c0c6f-2fab-46e8-9563-c91fe890e87f@suse.com>
 <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501071533060.133435@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 00:40, Stefano Stabellini wrote:
> On Tue, 7 Jan 2025, Jan Beulich wrote:
>> On 06.01.2025 19:48, Stefano Stabellini wrote:
>>> On Mon, 6 Jan 2025, Jan Beulich wrote:
>>>> On 04.01.2025 05:15, Denis Mukhin wrote:
>>>>>
>>>>> On Tuesday, December 10th, 2024 at 11:28 PM, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>>>
>>>>>>
>>>>>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>>>>>
>>>>>>> From: Denis Mukhin dmukhin@ford.com
>>>>>>>
>>>>>>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
>>>>>>>
>>>>>>> The call is used in NS8250 emulator to identify the case when physical xen
>>>>>>> console focus is owned by the domain w/ NS8250 emulator, in which case,
>>>>>>> messages from guest OS are formatted w/o '(XEN)' prefix.
>>>>>>
>>>>>>
>>>>>> Such messages ought to be processed through guest_printk(), which wants a
>>>>>> domain pointer, not a domid_t anyway. Plus isn't that going to be
>>>>>> current->domain anyway at the callsite, eliminating the need for such a
>>>>>>
>>>>>> helper altogether?
>>>>>
>>>>> If the current domain is owning the physical console and printing, say, Linux
>>>>> login prompt, there's no need to add "(XEN)" for every printout; adding timestamps
>>>>> can be disabled from Xen command line.
>>>>
>>>> Surely there shouldn't be (XEN), but without (d<N>) it'll be ambiguous in a log
>>>> which domain a message came from. As long as only Dom0 messages are left un-
>>>> prefixed, that's likely fine. Yet as soon as multiple domains can issue such
>>>> messages (and have console "focus") I think the prefix needs to be there.
>>>
>>> It looks like we are aligned on the desired behavior,
>>
>> Hmm, no, I don't think we are. I don't ...
>>
>>> but for clarity,
>>> see https://marc.info/?l=xen-devel&m=173405161613716, also copy/pasted
>>> here:
>>>
>>> I think we should provide a consistent behavior across architectures.
>>> The current behavior with vpl011 and dom0less on ARM is the following:
>>>
>>> - no prefix for Dom0 output
>>> - DOM$NUM for DomUs when not in focus, otherwise no prefix
>>
>> ... view this model as a desirable one. It leaves room for ambiguity.
> 
> Adding a few more people in CC for feedback.
> 
> My priority is to keep the architectures aligned. It might be OK to
> change output format, but then let's do it uniformly on ARM as well.
> 
> Jan, please clarify what you think would be better than the above. Is it
> the following? I don't think I understood your preference.
> 
> - DOM$NUM for Dom0 and DomUs when not in focus, otherwise no prefix

No, I mean like we have it with guest_printk() today. (XEN) for Xen's
own messages, (d<N>) for ordinary domains' ones, and no prefix
exclusively for the hardware/control domain. What is best to do when
hardware and control domains are distinct I'm uncertain - I'd be
inclined to suggest that the hardware domain then stay the one without
any prefix.

Jan

