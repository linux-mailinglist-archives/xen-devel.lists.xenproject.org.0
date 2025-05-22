Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74BAC1207
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 19:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994470.1377445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9ce-0001qs-NT; Thu, 22 May 2025 17:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994470.1377445; Thu, 22 May 2025 17:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI9ce-0001pC-Kf; Thu, 22 May 2025 17:22:24 +0000
Received: by outflank-mailman (input) for mailman id 994470;
 Thu, 22 May 2025 17:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckVG=YG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uI9cd-0001p6-V3
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 17:22:23 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51f6f543-3731-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 19:22:21 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5fbfdf7d353so10971495a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 10:22:21 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f2f06sm10767263a12.9.2025.05.22.10.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 10:22:20 -0700 (PDT)
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
X-Inumbo-ID: 51f6f543-3731-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747934541; x=1748539341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kUw65lHC+ZJ+XnQAHuP1UgZqy34vprisAwKn9Gylths=;
        b=i4Q2flVeLVl033FM2dQ+E6XnKzIJYN+2zgdpNRvuw4gysn6eXtVKS15Dbn+pj2Avbu
         TN5or3ZpFmVBwd45VKCzOgefxCqqodU8KuvDH0aJ2CHrii+ydA0s1W/KEHSsl1Xwjfb3
         Fv0Hb9LBCsSxDcJTTi/2tTA0OPi7UB39E/qmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934541; x=1748539341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUw65lHC+ZJ+XnQAHuP1UgZqy34vprisAwKn9Gylths=;
        b=Z7QAqFh0wOugkxkZEK2895q6ig5lpkzolHfbZCkp4rYhUnUFMW+M8Y0GnBpXOoY3K6
         nvRZDb1w+5BJbkGBElE/kKQWtoGmC9TIa1sbMXaEeFuv9epIWJXYGHPlOucDcE2CXIls
         eJZD8tI9aClpRhtrVT0LJByHQxNCiYQsSzHCBTK6Ji2ptO03HqpYIrnSW1PRLe0tXKcp
         3J16AG7kpktdSPxKEVac0Cwl+6zU+N7bHHJjuqSYvgbtNKBeSB5hBxbMX+mEKsyhK+sg
         2MkofQIk5PZ2ZlTjqrAD/5Di8niI3N1AWwuJ0nuuz+tSArbuHkX1C4lntQ/qjn7pi3p1
         ZIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz7uLI+k4JB4pgT/myz2erbQL2UwS0Dy0yaqu0OgOVzQXxxU/PIvUBaYu+dH+G2uQkkrc8lmXR5u0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM14qFY8P5En0Xy6HJulX4K4lg76Css+rO312FCy6B8pcPcM7n
	kTptQcfclK9n4hHme6uQTJE4sFco2/pQ6VKpOe0e8O+KE9EOgb10yTGtSj8aB+YfthrBniSoU4m
	gV3NN
X-Gm-Gg: ASbGncsKLWOZDtCjH2D6yKGkANzZyFdA2wnxHagRGEmq0UIaeULJa2nqh8sYnm1yt2x
	phs5L8dI1DAuyP9taPxJbi+fA/WmMm9+mw2pJYl8aEECXf+IZvHVCN3BqzdiPuWI7+xiVq0RKNF
	DmFE17nrxsaPc0MRr1Wwx5t82lgMqbGoSdDh9PfQlS2YTHjzHp837Z8ZhfcxBdz9O6Ee6PKIQ8M
	HTRC2E2EKghUa0x5fD6godjZXID+I7W8AzbrEf00zkc9JYu5wjLHVY5EQIo8WyuC/RXLqUvMNWf
	inD77LQc87o1r8DiBtHoD4d3OleyHS19ejAtKy8tQAooCj10LSkKQ1pfQfgUKH6QERYN1j9Iv5g
	4lwS1ucp1SUICKPOL5ss5Kz93Nmo=
X-Google-Smtp-Source: AGHT+IH/BxWRMvHirNraPte1nu2QKQImepKXlBdQsR0q+tI3IVBcxrhV1yY/3GNW+uRgD03xiFg9lQ==
X-Received: by 2002:a05:6402:50cf:b0:5fc:aa51:4d9b with SMTP id 4fb4d7f45d1cf-600901af4damr25335074a12.27.1747934541100;
        Thu, 22 May 2025 10:22:21 -0700 (PDT)
Message-ID: <71b4666e-0efa-4020-83bb-ecaa9ede7ca9@citrix.com>
Date: Thu, 22 May 2025 18:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/boot: print CPU and APIC ID in bring up
 failure
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-2-roger.pau@citrix.com>
 <0028ad37-95e7-4b6e-87b6-07cadcac64aa@suse.com>
 <8c1156a8-a626-4b62-9cc1-7790184b2b9b@citrix.com>
 <aC9V3-5SiBTBDsCE@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aC9V3-5SiBTBDsCE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 5:50 pm, Roger Pau Monné wrote:
> On Thu, May 22, 2025 at 03:39:57PM +0100, Andrew Cooper wrote:
>> On 22/05/2025 10:10 am, Jan Beulich wrote:
>>> On 22.05.2025 09:54, Roger Pau Monne wrote:
>>>> Print the CPU and APIC ID that fails to respond to the init sequence, or
>>>> that didn't manage to reach the "callin" state.  Expand a bit the printed
>>>> error messages.  Otherwise the "Not responding." message is not easy to
>>>> understand by users.
>>>>
>>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Changes since v1:
>>>>  - Also print APIC ID.
>>>> ---
>>>>  xen/arch/x86/smpboot.c | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>>>> index 0189d6c332a4..dbc2f2f1d411 100644
>>>> --- a/xen/arch/x86/smpboot.c
>>>> +++ b/xen/arch/x86/smpboot.c
>>>> @@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
>>>>              smp_mb();
>>>>              if ( bootsym(trampoline_cpu_started) == 0xA5 )
>>>>                  /* trampoline started but...? */
>>>> -                printk("Stuck ??\n");
>>>> +                printk("CPU%u/APICID%u: Didn't finish startup sequence\n",
>>>> +                       cpu, apicid);
>>>>              else
>>>>                  /* trampoline code not run */
>>>> -                printk("Not responding.\n");
>>>> +                printk("CPU%u/APICID%u: Not responding to startup\n",
>>>> +                       cpu, apicid);
>>>>          }
>>>>      }
>>>>  
>>> Elsewhere I think we print AIC IDs in hex; may be better to do so here, too.
>>> That may then want some text re-arrangement though, e.g.
>>>
>>> "CPU%u: APICID %#x not responding to startup\n"
>>>
>>> Thoughts?
>> Definitely hex.  Elsewhere APIC_ID always has an underscore.
> Maybe I'm confused, but I don't think Xen uses an underscore, it's
> always 'APIC ID' when printed.  I don't mind adding it here, I assume
> what you mean with elsewhere is other projects like Linux?

It's apic_id in plenty of smpboot.c, but fine - lets do it with a space.

We do need to reduce from $N ways of rendering this down to 1.

~Andrew

