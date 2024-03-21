Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352A8855A6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 09:28:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696241.1086962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDls-0004pT-CZ; Thu, 21 Mar 2024 08:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696241.1086962; Thu, 21 Mar 2024 08:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnDls-0004nE-9s; Thu, 21 Mar 2024 08:27:32 +0000
Received: by outflank-mailman (input) for mailman id 696241;
 Thu, 21 Mar 2024 08:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnDlq-0004n8-Gk
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 08:27:30 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dacfcccb-e75c-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 09:27:29 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso627696a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 01:27:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a46647b6496sm8190088ejb.155.2024.03.21.01.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 01:27:28 -0700 (PDT)
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
X-Inumbo-ID: dacfcccb-e75c-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711009648; x=1711614448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yONgQlY29QaCZwciLdVKvhAm4X16I+Qq4iFHdblrY80=;
        b=Pwo94cWKeRY45y02mfBGFRbR6EB6aChfMjA0QuqOvUju6TpLpY1b2WrJ7espXm2iWg
         dI3WeqG1Hg5CdFLM+oWYJjiY3vRFuVS9eUj/XL+TNxExE8BbcfiYoTjCz31YsRH1rzFk
         xg/u22FruG04Iee17GbmHjrcgpr6q34IovqJQGBmbqXC4tlJqSc1VoxUU9gSVRqh5QZ/
         +GevXeouKSvNS5sugB+MKqn4DNEpHoO5aaS6TNgzYS1dlnKl/O5BfjbNbwbTfuCiWt0V
         NH9wTbxIM4QYSIuJOZtaK9fxc0tiz0oPVMon8s9KGl+HCxcwUtlI2/23wlvbsTlX/LPN
         tXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711009648; x=1711614448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yONgQlY29QaCZwciLdVKvhAm4X16I+Qq4iFHdblrY80=;
        b=ZbotpeM7xow+iT0K8O1WV0AQc+FsJjYsoMYFTNi5l7pjYvxIhBHqvmDZI833ekixfm
         ePUQI2a8q8YAYfJeNT767ghbJBgoR2s9sxz5R9qLaBCHELskslw/nM8kBRWg7Z2tS9LG
         Lh6oGL4bayDnZorVBqmyuUqUcM4M5Kzi6rxi/I1HSoqFwgfOHGS2wYPRJZBRDE06aRgg
         xxBn/PlYV8igAn9Rv6euoCEjLDAAz0OGYFtCZxvhtpgI+FDIr7jZBN6Oww3h4qwDX13k
         nNmjt/1g6MFHyagJ/vZJakXllrlqp5WCTRRANtZSPgVq/HzaRxYAHWac9b2i3w4Jsx4M
         NZfg==
X-Forwarded-Encrypted: i=1; AJvYcCV/OAKAEzhBF1SCV7pSI9SsD0spYIUrSobksbXOWLkF6JtyeCXTpYZnQZ0AfJSRBunz0bcNTWVPzIua3MXJriz+PQiy9WcgBKjtzKv+06c=
X-Gm-Message-State: AOJu0Yw2++Gcc3vaAbzdYH2FWjvCw/Aa08Ev2jXiYtGCEyxZ/Qt7FBhN
	gPn7sv0Am4+gXt9pl4C4VsWy8Y90wSwOFkfJQg+WsPuHk0xUkFZIrirKiKqMag==
X-Google-Smtp-Source: AGHT+IG3Avg0rzZ7esdT/n3cKxPKAr2f9cHH68qKCLyiJpNdezFRjV7uJEpuhKhbxfShRJ9I0/4DqQ==
X-Received: by 2002:a17:907:7e94:b0:a46:ad7c:ccc7 with SMTP id qb20-20020a1709077e9400b00a46ad7cccc7mr10734178ejc.59.1711009648501;
        Thu, 21 Mar 2024 01:27:28 -0700 (PDT)
Message-ID: <198bade8-c6fc-4ae0-b721-3a9e2bd8acbe@suse.com>
Date: Thu, 21 Mar 2024 09:27:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
 <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
 <alpine.DEB.2.22.394.2403151658530.853156@ubuntu-linux-20-04-desktop>
 <7ab73379-b057-4568-9869-141cef185752@suse.com>
 <alpine.DEB.2.22.394.2403181735410.853156@ubuntu-linux-20-04-desktop>
 <fadd30c9-440d-401d-bd05-7e1d965bbefe@suse.com>
 <alpine.DEB.2.22.394.2403190815220.853156@ubuntu-linux-20-04-desktop>
 <87234837-9fb3-40a9-849d-8b8574f2661c@suse.com>
 <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403201812380.1569010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 02:46, Stefano Stabellini wrote:
> On Wed, 20 Mar 2024, Jan Beulich wrote:
>>> - the public interface is described in a C header so it makes sense for
>>>   the corresponding implementation to be in C
>>>
>>> - the C entry point is often both the entry point in C and also common
>>>   code
>>>
>>> - depending on the architecture, there is typically always some minimal
>>>   assembly entry code to prepare the environment before we can jump into
>>>   C-land; still one wouldn't consider those minimal and routine assembly
>>>   operations to be a meaningful hypercall entry point corresponding to
>>>   the C declaration in the public headers
>>>
>>> - as per MISRA and also general good practice, we need the declaration
>>>   in the public header files to match the definition in C
>>
>> Throughout, but especially with this last point, I feel there's confusion
>> (not sure on which side): There are no declarations of hypercall functions
>> in the public headers. Adding declarations there for the C entry points in
>> Xen would actually be wrong, as we don't provide such functions anywhere
>> (to consumers of the ABI).
> 
> I am copy/pasting text from sched.h:
> 
>  * The prototype for this hypercall is:
>  * ` long HYPERVISOR_sched_op(enum sched_op cmd, void *arg, ...)
>  *
>  * @cmd == SCHEDOP_??? (scheduler operation).
>  * @arg == Operation-specific extra argument(s), as described below.
>  * ...  == Additional Operation-specific extra arguments, described below.
>  *
> 
> from event_channel.h:
> 
>  * ` enum neg_errnoval
>  * ` HYPERVISOR_event_channel_op(enum event_channel_op cmd, void *args)
>  * `
>  * @cmd  == EVTCHNOP_* (event-channel operation).
>  * @args == struct evtchn_* Operation-specific extra arguments (NULL if none).
> 
> These are the hypercall declarations in public headers. Although they
> are comments, they are the only description of the ABI that we have (as
> far as I know). They are in C and use C types. 

From their use of enum alone they don't qualify as declarations. They're
imo merely meant to provide minimal guidelines.

>>>>>>> We have two options:
>>>>>>>
>>>>>>> 1) we go with this document, and we clarify that even if we specify
>>>>>>>   "unsigned int", we actually mean a 32-bit integer
>>>>>>>
>>>>>>> 2) we change all our public ABIs and C hypercall entry points to use
>>>>>>>    fixed-size types (e.g. s/unsigned int/uint32_t/g)
>>>>>>>
>>>>>>> 2) is preferred because it is clearer but it is more work. So I went
>>>>>>> with 1). I also thought you would like 1) more.
>>>>>>
>>>>>> For ABIs (i.e. structures) we ought to be making that change anyway.
>>>>>> Leaving basic types in there is latently buggy.
>>>>>
>>>>> I am glad we agree :-)
>>>>>
>>>>> It is just that I also consinder the C hypercall entry points as part of
>>>>> the ABI
>>>>>
>>>>>
>>>>>> I'm happy to see a document like this added, for the purpose described
>>>>>> above. But to me 1) and 2) and largely independent of one another.
>>>>>
>>>>> Good that you are also happy with a document like this.
>>>>>
>>>>> The remaining question is: what about the rest of the C functions in Xen
>>>>> that are certainly not part of an ABI?
>>>>
>>>> As per above - anything internal isn't part of the ABI, C entry points
>>>> for hypercall handlers included. All we need to ensure is that we consume
>>>> the data according to what the ABI sets forth.
>>>
>>> It doesn't look like we'll convince one another on this point. But let
>>> me try another way.
>>>
>>> In my view, having mismatched types between declaration and definition
>>> and having non-fixed-width types in C hypercall entry points is really
>>> bad for a number of reasons, among them:
>>> - correctness
>>> - risk of ABI breakage
>>> - mismatch of declaration and definition
>>
>> What mismatches are you talking about? There's nothing mismatched now,
>> and there cannot be any mismatch, because the consumers of the ABI don't
>> call Xen functions directly.
> 
> Let me make an example:
> 
> - public header saying enum event_channel_op cmd
> - <assembly>
> - do_event_channel_op(int cmd, ...)
> 
> Do you think this is all good?
> 
> There are two pretty serious problems here:
> - enum and int are not the same type

See above. The issue I have with this is use of plain "int". Technically
that's not a problem either, but aiui we're aiming to use "unsigned int"
when negative values aren't possible.

And note that it was in 2012 when "int" there was changed to "enum", in an
effort to document things better.

> - enum and int are not fixed-width

Which I don't view as a problem, thanks to the assembly sitting in between.

> Don't you think it should be:
> 
> - public header saying uint32_t cmd in a comment
> - <assembly>
> - do_something_op(uint32_t cmd, ...)

The public header should say whatever is best suited to not misguide
people writing actual prototypes for their functions. I wouldn't mind
uint32_t being stated there. That has no influence whatsoever on
do_<something>_op(), though.

> Or possibly unsigned long depending on the parameter.

You're contradicting yourself: You mean to advocate for fixed-width types,
yet then you suggest "unsigned long". Perhaps because you realized that
there's no single fixed-width type fitting "unsigned long" for all
architectures. xen_ulong_t would likely come closest, but would - aiui -
still not be suitable for Arm32 when used in hypercall (handler)
prototypes; it's suitable for use (again) only in structure definitions.

Jan

