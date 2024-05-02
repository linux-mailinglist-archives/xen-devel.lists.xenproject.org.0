Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3988B9CA0
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:44:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715864.1117825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xfj-00056p-De; Thu, 02 May 2024 14:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715864.1117825; Thu, 02 May 2024 14:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xfj-00053c-9f; Thu, 02 May 2024 14:44:31 +0000
Received: by outflank-mailman (input) for mailman id 715864;
 Thu, 02 May 2024 14:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1QD4=MF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s2Xfh-00051X-RE
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:44:29 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1c7ad1-0892-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 16:44:28 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a5878caeb9eso1022449866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:44:28 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v21-20020aa7d9d5000000b005700ef75274sm605382eds.33.2024.05.02.07.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 07:44:27 -0700 (PDT)
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
X-Inumbo-ID: 7a1c7ad1-0892-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714661067; x=1715265867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RU/PusuG1kQtflZ+fLSuhghAx8tGgTkOn3ucNF+ThOc=;
        b=LHDzOwjxlmbjqtOkF5mqgmZFYi/qafNPXAVWXbjFhoXxRujii0UT8YKF96oHVtvIkx
         kElsOWwsNNOyZA2NA/jSca8VndGlktWpiWvu6vNc9pSFBOxei7So96jOq23Es0fyMTV8
         KKtYDiG00YVqnhIbO/9B7GwN642LcSUou69ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661067; x=1715265867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RU/PusuG1kQtflZ+fLSuhghAx8tGgTkOn3ucNF+ThOc=;
        b=dSCrM+hmv2ciVnqQ1CebqhtgOUjd840lDeggGwgdXySlhi6c7BH6CT7xwC8kAvF8qg
         a2In7BKJHNbUlPQd6w177oWxftpdAhMkQYJ973/+tqRmD8iy4sZA9gpbiV3uTu/giDi7
         An+TqXUCkNesRA37qVJxv/Fu6wQxhv2hVQCPEn8B6EjpYLNGWLBmoTiMJr4e3wxEdp7G
         pwnz9URVFRKWH6mqZcJ24crTr/GvcJBID+uX+rXdg5PraY1/dbPrDtx3X4UMUzabmooK
         m1kAJ+fSHl0G6UnVN8h9qDtI+Bx23D2wmXcvydDBdnRRzZ8msdWzGV+CTdgQz098TqEl
         lG9A==
X-Forwarded-Encrypted: i=1; AJvYcCX3ta9eR3cm6aEmn/ymYfG9yEzLwIIvvnWKuGKBXUreHyAHwwjDJmt3lCQlfVzsjVJG7EDe9PJb0EYPHDcw0+Ee9kpB/gJzZqHVbEfCu2M=
X-Gm-Message-State: AOJu0YykDc8tYSmZ1cBajt3olm33gzW6ZJvJUhtVa0bGVROZMMOjTixp
	35MJ5Mw2TABE3rvkQz92WSgHQYZv4WP6C11UXEUyLFSbnb5G20WvyRC980F1ELI=
X-Google-Smtp-Source: AGHT+IHEhohMfu8ocz/drT1r/eukOk/Rvb1fuTY0WloD6RQadTOZVk50YqLmtnP0NUBArYpZEF02Mw==
X-Received: by 2002:a50:9e48:0:b0:572:947d:559f with SMTP id z66-20020a509e48000000b00572947d559fmr4128352ede.3.1714661067380;
        Thu, 02 May 2024 07:44:27 -0700 (PDT)
Message-ID: <adcc0c16-6f02-454e-8a2c-ae00a6cbebd2@cloud.com>
Date: Thu, 2 May 2024 15:44:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] xen/x86: Derive topologically correct x2APIC IDs from
 the policy
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-6-alejandro.vallejo@cloud.com>
 <14891d02-e9e9-4650-b572-e6f071f1506c@suse.com>
 <e0963ddd-c3b7-44dd-a3b7-67811f3e9d7a@cloud.com>
 <52741b69-8bcb-492f-a8bc-f035b2747fe8@suse.com>
 <4a280eab-81f7-4a87-b531-3633311a4c4a@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <4a280eab-81f7-4a87-b531-3633311a4c4a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/05/2024 07:57, Jan Beulich wrote:
> On 02.05.2024 08:55, Jan Beulich wrote:
>> On 01.05.2024 18:35, Alejandro Vallejo wrote:
>>> Hi,
>>>
>>> On 26/03/2024 16:41, Jan Beulich wrote:
>>>> On 09.01.2024 16:38, Alejandro Vallejo wrote:
>>>>> --- a/xen/lib/x86/policy.c
>>>>> +++ b/xen/lib/x86/policy.c
>>>>> @@ -2,15 +2,78 @@
>>>>>  
>>>>>  #include <xen/lib/x86/cpu-policy.h>
>>>>>  
>>>>> -uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t vcpu_id)
>>>>> +static uint32_t parts_per_higher_scoped_level(const struct cpu_policy *p, size_t lvl)
>>>>>  {
>>>>>      /*
>>>>> -     * TODO: Derive x2APIC ID from the topology information inside `p`
>>>>> -     *       rather than from vCPU ID. This bodge is a temporary measure
>>>>> -     *       until all infra is in place to retrieve or derive the initial
>>>>> -     *       x2APIC ID from migrated domains.
>>>>> +     * `nr_logical` reported by Intel is the number of THREADS contained in
>>>>> +     * the next topological scope. For example, assuming a system with 2
>>>>> +     * threads/core and 3 cores/module in a fully symmetric topology,
>>>>> +     * `nr_logical` at the core level will report 6. Because it's reporting
>>>>> +     * the number of threads in a module.
>>>>> +     *
>>>>> +     * On AMD/Hygon, nr_logical is already normalized by the higher scoped
>>>>> +     * level (cores/complex, etc) so we can return it as-is.
>>>>>       */
>>>>> -    return vcpu_id * 2;
>>>>> +    if ( p->x86_vendor != X86_VENDOR_INTEL || !lvl )
>>>>> +        return p->topo.subleaf[lvl].nr_logical;
>>>>
>>>> Is "!= Intel" really appropriate here? I'd rather see this being "AMD || Hygon".
>>>
>>> Sure, I don't particularly mind, but why? As far as we know only Intel
>>> has this interpretation for the part counts. I definitely haven't seen
>>> any non-Intel CPUID dump in which the part count is the total number of
>>> threads (Centaur/Zhaoxin are not multithreaded, and don't expose leaves
>>> 1f or e26, as far as I could see).
>>
>> Because of x86'es origin and perhaps other historical aspects, cloning
>> Intel behavior is far more likely.

That claim doesn't hold very well seeing how...

>> The fact that Hygon matches AMD is
>> simply because they took AMD's design wholesale.

... this statement contradicts it. We can't predict which new vendor (if
any) will be cloned/mimicked next, so that's not a very plausible reason
to prioritise a specific vendor in conditionals.

It remains to be seen what a Zhaoxin actually looks like, because I
couldn't get ahold of a complete cpuid dump.

> 
> Perhaps: See how many dead ends AMD have created, i.e. stuff they proudly
> introduced into the architecture, but then gave up again (presumably for
> diverging too far from Intel, and hence lacking long term acceptance):
> 3DNow!, LWP, and XOP just to name those that come to mind right away.
> 
> Jan

I can't say I agree on the cause; Regardless I'd rather not discuss the
relative merits of vendors with regards to backwards compatibility, as
that's besides the point. The point is whether there's a credible
technical reason to prefer this...

  if ( !(a & (B | C)) )
      foo();

... to this...

  if ( a == A )
      foo();

..., as is the case in patch6.

I argue there's not, and in fact legibility-wise the latter is very
clearly superior.

There's also a compelling reason to keep the check coherent on both
generators to avoid bad surprises down the line.

Cheers,
Alejandro


