Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D583A2D3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 08:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670725.1043684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSXba-0001Rw-JR; Wed, 24 Jan 2024 07:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670725.1043684; Wed, 24 Jan 2024 07:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSXba-0001QU-GA; Wed, 24 Jan 2024 07:23:26 +0000
Received: by outflank-mailman (input) for mailman id 670725;
 Wed, 24 Jan 2024 07:23:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bgOV=JC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSXbY-0001PK-AU
 for xen-devel@lists.xen.org; Wed, 24 Jan 2024 07:23:24 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72532c85-ba89-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 08:23:20 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a30e445602cso166118966b.0
 for <xen-devel@lists.xen.org>; Tue, 23 Jan 2024 23:23:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y4-20020a05663824c400b0046993034c91sm3862625jat.77.2024.01.23.23.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 23:23:18 -0800 (PST)
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
X-Inumbo-ID: 72532c85-ba89-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706080999; x=1706685799; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VSE4kQ/hPcHD6nbAQ9d8843Yfcvkq/XWY737A3Us3WI=;
        b=dval/+RGR8UNDrAhLtZRZUvageuHHUoqo/DzxpCETbgTdZd8x+OuHptNCGHO0copfP
         aTass94T4xf/vfdttQkxhhA6wzSHUsftugrVyHnlRY/XXEasncNk5xt50URfXJ3fgaSI
         MAV45dvR6GUSWH3ZTQ4SVjupV3YcZ4IvIHR5s5YivdUFZ8erEVhJFpbYNkHLukk51bxB
         GauCMopes4Cqy1zfdWYO8zP957jOqPAM30m6BPDntuiBpzdt1dqHZz/m7Up2zmtLtrJ3
         uJ1XDk+2mNw/c/i/jlLZMfjPks8K/g1MWAwSOsYP8liSWtq5Sw5omyJ8dyW0Cb5ld9Oh
         QkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706080999; x=1706685799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VSE4kQ/hPcHD6nbAQ9d8843Yfcvkq/XWY737A3Us3WI=;
        b=UcqalVVj9T5uShI+sathoR2dcNr3U7VV4Deo53lmoUc1GccsDIdSyno8UL82ydXTyW
         poi4Rr4BHnv+zMJM+CzBIpMN+XJLX/jeSaJ+2fTR4F1pUgcNXpdlCNX6pwUQ32ImwuxI
         KvXctRRSBay8N9H4N2Zhu0LsG9f+4o9nIaC74ucaVJPVcuYD/ipl2fZ/ZnriserYxWTl
         opVt7iBXhmDx82h8dK1MuE+BV4EuG0+pmU9AbzLedDb4roPew8jYbwVbZRhJP6SGGqNH
         OClbowCFqVS1iQMvpq/n0mauZZeLaDUnQ4V4YvqyaZcTTpH6DAY/VSyQ5ztAnZzuLrEw
         Rrlw==
X-Gm-Message-State: AOJu0YwZNXcKdpiXj/BLlI5wR3CMLIrbpKsNeIWVgLTJF7bQEuTnWKqP
	z92ewU/sPdfAAYIEvohOmJ2oov1BdTzvfVx1YQtVnYJkr+jBRLDzerDt5iWwOA==
X-Google-Smtp-Source: AGHT+IF4VP3QmJG+4fbChWciNa+ZL8MsSwLzBO19zc3oDhnHSVEN4wd37RARJGGdWWCcHxeSCMdtfg==
X-Received: by 2002:a17:906:5399:b0:a2e:7f37:8301 with SMTP id g25-20020a170906539900b00a2e7f378301mr793830ejo.27.1706080998926;
        Tue, 23 Jan 2024 23:23:18 -0800 (PST)
Message-ID: <e7d67831-d7b9-48fd-9478-f89e85ce0422@suse.com>
Date: Wed, 24 Jan 2024 08:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thoughts on current Xen EDAC/MCE situation
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org
References: <Za7Vr+Rb25y/+MSy@mattapan.m5p.com>
 <111f5551-70fa-4ded-a62a-e0aa967b3c29@suse.com>
 <ZbBDJGKqTU9rdpgD@mattapan.m5p.com>
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
In-Reply-To: <ZbBDJGKqTU9rdpgD@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.2024 23:52, Elliott Mitchell wrote:
> On Tue, Jan 23, 2024 at 11:44:03AM +0100, Jan Beulich wrote:
>> On 22.01.2024 21:53, Elliott Mitchell wrote:
>>
>>> I find the present handling of MCE in Xen an odd choice.  Having Xen do
>>> most of the handling of MCE events is a behavior matching a traditional
>>> stand-alone hypervisor.  Yet Xen was originally pushing any task not
>>> requiring hypervisor action onto Domain 0.
>>
>> Not exactly. Xen in particular deals with all of CPU and all of memory.
>> Dom0 may be unaware of the full amount of CPUs in the system, nor the
>> full memory map (without resorting to interfaces specifically making
>> that information available, but not to be used for Dom0 kernel's own
>> acting as a kernel).
> 
> Why would this be an issue?

Well, counter question: For all of ...

> I would expect the handling to be roughly:  NMI -> Xen; Xen schedules a
> Dom0 vCPU which is eligible to run on the pCPU onto the pCPU; Dom0
> examines registers/MSRs, Dom0 then issues a hypercall to Xen telling
> Xen how to resolve the issue (no action, fix memory contents, kill page).
> 
> Ideally there would be an idle Dom0 vCPU, but interrupting a busy vCPU
> would be viable.  It would even be reasonable to ignore affinity and
> grab any Dom0 vCPU.
> 
> Dom0 has 2 purposes for the address.  First, to pass it back to Xen.
> Second, to report it to a system administrator so they could restart the
> system with that address marked as bad.  Dom0 wouldn't care whether the
> address was directly accessible to it or not.
> 
> The proposed hypercall should report back what was effected by a UE
> event.  A given site might have a policy that if $some_domain is hit by a
> UE, everything is restarted.  Meanwhile Dom0 or Xen being the winner
> could deserve urgent action.

... this, did you first look at code and figure how what you suggest
could be seamlessly integrated? Part of your suggestion (if I got it
right) is, after all, to make maintenance on the Dom0 kernel side easy.
I expect such adjustments being not overly intrusive would also be an
acceptance criteria by the maintainers.

Second - since you specifically talk about UE: The more code is involved
in handling, the higher the chance of the #MC ending up fatal to the
system.

Third, as to Dom0's purposes of having the address: If all it is to use
it for is to pass it back to Xen, paths in the respective drivers will
necessarily be entirely different for the Xen vs the native cases.

Jan

