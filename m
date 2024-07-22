Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC468938B77
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 10:45:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761541.1171507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVoeg-0003v6-PX; Mon, 22 Jul 2024 08:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761541.1171507; Mon, 22 Jul 2024 08:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVoeg-0003sH-MG; Mon, 22 Jul 2024 08:44:26 +0000
Received: by outflank-mailman (input) for mailman id 761541;
 Mon, 22 Jul 2024 08:44:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVoef-0003qP-AH
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 08:44:25 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982fe5f6-4806-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 10:44:23 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3685afd0c56so214319f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 01:44:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878695b35sm7838042f8f.65.2024.07.22.01.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:44:22 -0700 (PDT)
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
X-Inumbo-ID: 982fe5f6-4806-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721637863; x=1722242663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UFBoWcoE3evfRn0nNP6dRYYq9iO7MVB6qLa15fL9t7Q=;
        b=Uo2m62ixw4vnpMC9bpF1z2+0rWS8lC+IjySRd9O0JUU0/RcLEi4Q3bhGEVXHCyGHGh
         df2GkKiCzsZCthHJgUufsyOuATtPLbSIZub9xLlr90+L513BaruWcBRMk7uebVvhO59a
         S7N3l0EjfW/UCkfLnZOJjJVa55LiWzi6tbGrSnNUFGGa+YDt/Oo/e90rI9ZxKjiyztvC
         ct3DFoCH6u7NWqWlMbZAOjL7uaBbwAXisY/araxxg4aEleDmdHdeVylRu0WTETnBXu6F
         jHN9ysaKEJjRC0daBwxnrMl58XI/RNDX1te31gvPHjQpsuyHdAjtsew2wHLodj1SKwX8
         VlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721637863; x=1722242663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFBoWcoE3evfRn0nNP6dRYYq9iO7MVB6qLa15fL9t7Q=;
        b=PRuGAncBT7LGm9KDdg2ZzV8R8lPIzyda7+C8mfzvktEvzA15aYVH9dBzUJe+CfF++2
         fINUORN/y7jEEHndI7I8cawMU3ENOwKFZSJ5yAwRPNU8mdbLdlJiM+09nI6Z1U2GCzW1
         39mZmr7sQBEzsmXJWD8y21DOiRTl4BG7giOeiRE1r+xQ628neHTToBBMhDnhsFs/R6nW
         GBnIHGvbDG7IKYMtvINeHCVsRUih72gqfBymLE516J77+CcLFFqIMdRat1hFzdFqcYau
         h7KIxdtOMtC0ZCCny7sk/YLnznmUHHFpF7bJl5aljuPSdTmq/Vsk3H6R/eXgxxDt2dd/
         eVeA==
X-Forwarded-Encrypted: i=1; AJvYcCUCRKRN3Fq0IEDax/PrqRnj/eEOM2kre+GI//VpZAjoRHR3GKvAKdk+o5yx0k2WY+Kv1dPdB8A8zQBuh0ffew11G9lcVaruh8f03Ros9ok=
X-Gm-Message-State: AOJu0YykF0ZNMFoLrLvh6uXj5X0Aoe0rpVW42V1vSibkErMZqBNLHN5E
	yRByQhhZuiSAhecbkngdb25vY0snVSjVm3+HHWPqoDZ29zlYJ3OEWtIAkvdNUaA=
X-Google-Smtp-Source: AGHT+IH+jT7+d+FJfyFu0P7nCL8Pi7p0bwAMhnxDzQvjaGbBn/zuLdx9sWZdEZbSjxQe4ysjIEe1Xw==
X-Received: by 2002:a5d:4285:0:b0:367:84fe:cd79 with SMTP id ffacd0b85a97d-369bb2a169dmr3436826f8f.49.1721637862730;
        Mon, 22 Jul 2024 01:44:22 -0700 (PDT)
Message-ID: <bb5ff62e-8dc9-4d31-82d8-803bd8fa77a3@suse.com>
Date: Mon, 22 Jul 2024 10:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Mini-OS: add some macros for asm statements
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20240719155701.18856-1-jgross@suse.com>
 <0c76f87a-ca46-4511-9a6d-9ffc10815295@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <0c76f87a-ca46-4511-9a6d-9ffc10815295@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.07.24 09:15, Jan Beulich wrote:
> On 19.07.2024 17:57, Juergen Gross wrote:
>> --- a/arch/x86/sched.c
>> +++ b/arch/x86/sched.c
>> @@ -60,16 +60,10 @@ void dump_stack(struct thread *thread)
>>       unsigned long *bottom = (unsigned long *)(thread->stack + STACK_SIZE);
>>       unsigned long *pointer = (unsigned long *)thread->sp;
>>       int count;
>> -    if(thread == current)
>> -    {
>> -#ifdef __i386__
>> -        asm("movl %%esp,%0"
>> -            : "=r"(pointer));
>> -#else
>> -        asm("movq %%rsp,%0"
>> -            : "=r"(pointer));
>> -#endif
>> -    }
>> +
>> +    if ( thread == current )
>> +        asm("mov %%"ASM_SP",%0" : "=r"(pointer));
> 
> As you switch the if() to Xen style, why not also the asm()? Irrespective of
> which precise style is meant to be used, the last closing double quote likely
> also wants to be followed by a blank?

Yes, indeed.

> 
>> @@ -119,20 +113,12 @@ struct thread* arch_create_thread(char *name, void (*function)(void *),
>>   
>>   void run_idle_thread(void)
>>   {
>> -    /* Switch stacks and run the thread */
>> -#if defined(__i386__)
>> -    __asm__ __volatile__("mov %0,%%esp\n\t"
>> -                         "push %1\n\t"
>> -                         "ret"
>> -                         :"=m" (idle_thread->sp)
>> -                         :"m" (idle_thread->ip));
>> -#elif defined(__x86_64__)
>> -    __asm__ __volatile__("mov %0,%%rsp\n\t"
>> -                         "push %1\n\t"
>> -                         "ret"
>> -                         :"=m" (idle_thread->sp)
>> -                         :"m" (idle_thread->ip));
>> -#endif
>> +    /* Switch stacks and run the thread */
>> +    asm volatile ("mov %[sp], %%"ASM_SP"\n\t"
>> +                  "jmp *%[ip]\n\t"
>> +                  :
>> +                  : [sp] "m" (idle_thread->sp),
>> +                    [ip] "m" (idle_thread->ip));
>>   }
> 
> Here instead you look to be switching to Linux style. Was that intended?

No, not really. I took Andrew's suggestion verbatim.

> As an aside, I think the construct is slightly problematic: In principle
> the compiler could make a copy of idle_thread->ip on the stack. (It
> won't normally, for code efficiency reasons.) That would break with the
> earlier change of the stack pointer. Using an "r" constraint would
> perhaps be better there. Yet if so wanted, that would certainly be a
> separate change.
> 
> With the adjustments (or respective clarifications as to style intentions),
> which I'd be fine making while committing so long as you agree:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks. I agree with the suggested changes (to spell it out explicitly: I
meant to use Xen coding style, as this is the Mini-OS style, too).


Juergen

