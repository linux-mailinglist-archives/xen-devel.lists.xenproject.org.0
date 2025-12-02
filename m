Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC06C9AB38
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 09:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176014.1500580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQLpm-0005Vf-QA; Tue, 02 Dec 2025 08:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176014.1500580; Tue, 02 Dec 2025 08:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQLpm-0005T3-M1; Tue, 02 Dec 2025 08:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1176014;
 Tue, 02 Dec 2025 08:34:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vQLpk-0005Sx-Us
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 08:34:05 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a52c8a9a-cf59-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 09:33:58 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b3c5defb2so3593031f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 00:33:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1c5c3c8csm36827831f8f.2.2025.12.02.00.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 00:33:57 -0800 (PST)
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
X-Inumbo-ID: a52c8a9a-cf59-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764664437; x=1765269237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/EhB9hLYvc7dZEaIAnd0w+tYNG4LjT+wNDZjil2WpQ=;
        b=IH4mc5BasNnhyKPE+1txLhOEGNlTdxn0hIRhYbCUvy7u1Yl4XRDvBpnbo1mw9VpMOe
         svbTqmR5t1sdbK/LDUE8ZLRg6plXpKyveA8PwU+sqDwGJgKwXiShhfrV+4BkQ0nMpG53
         8ek/IfJwacwQvwNwB4XQCjfo8EORE4NmuJ+0uu3mYu3TshNX61mRjnBP6qtQXl62CUzg
         xVZxP0neS7kRn9F13X3SeGwJ11NsvTZ4veW3CaK9FsAhswIQl3wa8pZ6QcZhPIlxnP9H
         9gryY+srgz0y+o0SYCRMowNJGoRTHQvHV+H6tXIDfotV/IlFdCMF1we/PWG0kXBymRvQ
         TxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664437; x=1765269237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/EhB9hLYvc7dZEaIAnd0w+tYNG4LjT+wNDZjil2WpQ=;
        b=Q78MRI7ohH2h/8FPRFLXss8LLW2B+V2KtLNRs+JFq+aue3jBhYvNttYCn0dkROguBG
         4/1LVT50mrcpn++TWjaF1ZeG7SPZQixNkq8MMuup8dH/+0/DNe6/T/MUOwdVTpu8WE6V
         2PTGsJfQHzogxBFtrHq4P/ygozIIXnqzvgUbNAuGtAuDLjHbrxq9LFpQwnylb/V+0RIP
         +gNxuUXwirNMSJoC8N3nl1a0jeHafR2UQJLtnPG8fLBILxou5oOzoPgEgy6DJPQP7a2E
         jTbuTUm/1m19CFBRj2u/Kpw+M0Q9qOiTWkVgiWLJ7kQPPWrh/DsuRDIjRPRwCb0dgcNq
         Tm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRyV/CNBQ1VKWu6CaCHzubUr1pxwPvPOnkjtGQG8vIzzxWJvspXTyEjDWk7ZHDAsNd/Sc4lpK5RVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTAoWpkXlPRNRmXt410qNqAh2N2hG9lTsF9+3zC/G8O6BHtCJH
	Li/Mu1ZaiOzNOMbt6o4ChiDiAroMhV4mcEoCrx1Za5cNYR77o3f1BZ34aLKiji431A==
X-Gm-Gg: ASbGnctnE6hSMvZv8xB44yzLNn1SAXOugXBI2vX5d2oyZNOXExp3l03UY7TfLsRqPJa
	KVRyHvLX7ibUAhONJ7HiEzfOGO90tOYK/FTQX9PVfNqaqBPsGCCOQUumakbbu39qMhznvj5JGjs
	5K5xNB90njg63sYHOTRCkRlIfhyS3YnW+gdBiO08oP9cHRBL4aQ3sNu1gyxVnJSnaWkr6NnlUso
	IdJ1+HlnWzLWM72YsUepJHv+VGaigrqwujLPSMPtrYeeUp2FNJzQyNvK8DOF6cZKoarzeUDzVpy
	ZIhsccNYjCitDB/UmxCgwnLmZRdAlHZH2XERpIXGg3UyvBeed6YUS9o4BnBJ3r/xbh/IshJtYJs
	tQLgs6dIit2KKBSzweARaEeijeBA8f9mOkRTyxNdMTeNwawBcMZ2hhhKLboU0OpMr6u7e0M06xE
	m1eTymzXST6IUrWOvYo6Cg2ne4uhfMVBzKuey2F+V3CKqWPWSlpI11qMVgrL7F1ex1StypoDmsZ
	L4=
X-Google-Smtp-Source: AGHT+IG+IbdfVINptInq4poY6ujn4uJ5IuM9Fcx1ZQ5CGxMPr8T48fh+AYOMUkBi5PAmJKvZaGlTWQ==
X-Received: by 2002:a05:6000:2410:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42cc1d199cdmr42516628f8f.40.1764664437523;
        Tue, 02 Dec 2025 00:33:57 -0800 (PST)
Message-ID: <76873588-cb85-447a-a59f-392b05327cdb@suse.com>
Date: Tue, 2 Dec 2025 09:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Unilaterally inject #UD for unknown VMExits
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251128174735.1238055-1-andrew.cooper3@citrix.com>
 <796dccdb-0cc4-4904-b776-d651ebb012c2@suse.com>
 <331118cc-9c2d-49dc-aa5c-b6cd0d4e6021@citrix.com>
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
In-Reply-To: <331118cc-9c2d-49dc-aa5c-b6cd0d4e6021@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.12.2025 17:36, Andrew Cooper wrote:
> On 01/12/2025 9:02 am, Jan Beulich wrote:
>> On 28.11.2025 18:47, Andrew Cooper wrote:
>>> While we do this for unknown user mode exits, crashing for supervisor mode
>>> exits is unhelpful.  Intel in particular expect the unknown case to be #UD
>>> because they do introduce new instructions with new VMEXIT_* codes without
>>> other enablement controls.  e.g. MSRLIST, USER_MSR, MSR_IMM, but AMD have
>>> RDPRU and SKINIT as examples too.
>> USER-MSR has MSR_USER_MSR_CTL, so doesn't fully fit here? (It's still not us
>> to directly control exposure of the insns, but an OS would need to use the
>> MSR to do so, and hence we need to properly handle writes to that MSR for
>> the respective exits to become possible.)
> 
> Oh yes, and the #GP from failing the MSR_USER_MSR_CTL check take
> priority over the intercept.
> 
>> MSRLIST has a dedicated exec control, so whether the exits can occur is
>> under our control.
> 
> Ah ok.
> 
> 
>> RDPRU and SKINIT have dedicated intercepts, without use of which the
>> respective exit can't occur aiui.
> 
> Correct, but note how we intercept them unconditionally?
> 
> MONITOR, MWAIT and SKINIT are for Xen's safety, because otherwise the
> instructions would execute normally in guest context.
> 
> RDPRU is to block access to the perf counters, because a guest has no
> legitimate use for them.
> 
> There are no enablement controls for these instructions.  They're always
> guest-available (on capable hardware) if not intercepted.

For our purposes, the intercept is the enable (i.e. we disable their use
by injecting #UD if the intercept triggers). IOW I think those are
slightly different in any event, in not really being "unknown". I don't
mind their mentioning, but I think the distinction wants to at least be
expressed somehow.

>>> @@ -3083,8 +3067,13 @@ void asmlinkage svm_vmexit_handler(void)
>>>          gprintk(XENLOG_ERR, "Unexpected vmexit: reason %#"PRIx64", "
>>>                  "exitinfo1 %#"PRIx64", exitinfo2 %#"PRIx64"\n",
>>>                  exit_reason, vmcb->exitinfo1, vmcb->exitinfo2);
>>> -    crash_or_fault:
>>> -        svm_crash_or_fault(v);
>>> +        fallthrough;
>>> +    case VMEXIT_MONITOR:
>>> +    case VMEXIT_MWAIT:
>>> +    case VMEXIT_SKINIT:
>>> +    case VMEXIT_RDPRU:
>>> +    inject_ud:
>>> +        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
>>>          break;
>>>      }
>>>  
>> Should this be brought more in line with respective VMX code (kept) below,
>> in never bypassing the gprintk() by any of the case labels? Basically
>> meaning that the case labels you move could simply be dropped for the time
>> being (or else, like the INVCPID one visible in context below, would want
>> re-inserting a few lines earlier).
> 
> As said, they're all reachable by guests on capable hardware.
> 
> I could add a /* Not implemented for guests */ if that would make it
> clearer?

Yes, ideally with "yet" also added - recall I've been sitting on an RDPRU
emulator patch, awaiting you to fulfill your promise of sorting the CPUID
side of things there.

> But, we don't want the printk().  We know the labels are reachable, and
> #UD is the right action.

Hmm, yes, with what you have said further up I think I agree. Yet then my
question goes the other way around: Do we want the log message for the
(at least) two known exits in VMX, which are grouped with the default:
label? IOW I'm still puzzled by the asymmetry between SVM and VMX in this
regard.

Jan

