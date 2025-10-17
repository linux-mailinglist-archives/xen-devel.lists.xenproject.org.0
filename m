Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B6BEA6EE
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 18:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145301.1478374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mvu-0005gN-36; Fri, 17 Oct 2025 16:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145301.1478374; Fri, 17 Oct 2025 16:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mvu-0005eW-0D; Fri, 17 Oct 2025 16:03:58 +0000
Received: by outflank-mailman (input) for mailman id 1145301;
 Fri, 17 Oct 2025 16:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vay5=42=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v9mvs-0005eQ-IF
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 16:03:56 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e11f7cdb-ab72-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 18:03:54 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-636de696e18so4234968a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 09:03:54 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c48a928cesm80323a12.7.2025.10.17.09.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 09:03:52 -0700 (PDT)
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
X-Inumbo-ID: e11f7cdb-ab72-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760717033; x=1761321833; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WMx4gIKefNQ4+LGkHCJ40c8hRNmSFVKWi+i6foi0KM=;
        b=X/0mHfN6ZfNnEuJCdKG4nbIsZSuOfYnItvJCQ7Wf+EVnqd2/j3QGbIIpJ3/vD+xMQV
         GFAo70IBGOS5qRpuMpiZDMgcaa7WXskk2IovzP1u6FBqDVCIJKSZeMQMzWCpOgXoj8x9
         5uEMcI1ts+QPJCeq4IOiDx9Hy7u3OBxNkvFBtIESY14jjTZ91gwtbMcJAQi4Ml+e3FqJ
         oYHUXNzZIWD2n5eTRQVnXnI7/6+/QOsEMHkqlSL2O1LywEbiwvrwRuikGTTedXFTr3CJ
         IbnVXJFYtgZLeie9Kz0YCT7UDXCW2w76AIgRpqpB1lN4uPJAti9aWw61MKJHfizqZn/q
         Tg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717033; x=1761321833;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1WMx4gIKefNQ4+LGkHCJ40c8hRNmSFVKWi+i6foi0KM=;
        b=vw9AEcQc8pPNHJbIDlPAU+3GmYdqZnGxMjnn7NHsaSnttWMKx2L4LEPPBQjGS4eoxs
         xNTCAoPh5YkyQlGUesc//q7ZUhs+31r15wAISaQjoD+bv/czCzK7nfnH0dE27hwaY5tK
         TvRWotiZ7Q7UNHgG/CfhHAZDdq2fCZMiD9qOLYFdxDy0a90239G+G7Tu1nXjlZXWr2si
         Ens+j+9DmOwnhN5wLfP2ArSaVPm9D1RVCmBN8xcvGDGiNm0Ao0TrwwSiyMqEsXGY6kT0
         GKv7SAEG11a1PahtnVq9TynaESQZo+OwV0pxmnGTVMz6FFX9jfC40jAF8lYO63vIF65I
         jO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxpFFoaNCC0m5ftGxLCxCQU176/4sN5sfjvbmejEL5Ed4ZomUoZMIZX0OGYtxz69zffylgM0bEpxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0ms3eODYDtdz2AAvK5EpDr7vyxUqaobiHvs5jPRncYyg7RRhA
	8THebBzri5QqmTWdQCj76D2qCu09kYz0VmwfS1ZG8QcqrzHyjagS8gtK
X-Gm-Gg: ASbGncs0QimcU/ufP5Vd1AbTD1iOlhdnnq7jy04Kj4sHO3toZ9m4HYs8Ai0HyBnM3fh
	CL0RT8lUzqaJPf1S16rOWIP7NLZ3iibB0SRH/hsZLlt5Ex9KPEvLc8VRFOoasqaqkRuuUe7Amqm
	jmiBxldS5MqtxyRBKZHnG3ro6U+Ok3brKS30BlU9KZ0iUxk8j7GmBIZTVejP1+5bRmhoeOTD23q
	5+rYcGQGi+MJq3S2kDxmTyYqomMA9DNlCrRM5gaJ1kRFV0A9WRkw+l1DWXDhFzIg/bhVkjMVFmw
	frNqWRPa4LWZ7k0INhEY47Ce0jdk07cGgM1FjZF2p6+/l9XLluxCoYe9+ifSYn5azasCGUCZ+a/
	cyGDwc9ZBaSvsCVQPVzX49qDGIojnGXXPlBUvIe3VmhQ7AonTd5HMdhVt6Pbmxs+G6Q504DxEAw
	k0BhDJJYd5t9aJ4e5tMKLuBqsgXEuUgmtFUolr/DxmAOyzrJkO1OOptuoJ
X-Google-Smtp-Source: AGHT+IFctqukZm4WmhDPvCbohL6MKhudNB8o2PDPOIoB8MFPD8mj2zd9t4NeFDEQNWjwTIFFHu1doA==
X-Received: by 2002:a05:6402:5204:b0:626:4774:2420 with SMTP id 4fb4d7f45d1cf-63c1f6b53bcmr4306934a12.20.1760717033273;
        Fri, 17 Oct 2025 09:03:53 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LBoZXSG0veUPafMPUeHO5ruA"
Message-ID: <514f41ba-e901-459c-b2e5-9db2e509c933@gmail.com>
Date: Fri, 17 Oct 2025 18:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 00/10] x86/HPET: broadcast IRQ and other
 improvements
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>

This is a multi-part message in MIME format.
--------------LBoZXSG0veUPafMPUeHO5ruA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/16/25 9:30 AM, Jan Beulich wrote:
> While 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt processing")
> helped quite a bit, nested interrupts could still occur. First and foremost
> as a result from IRQ migration (where we don't have any control over the
> vectors chosen). Hence besides reducing the number of IRQs that can be raised
> (first two patches) and possibly the number of invocations of
> handle_hpet_broadcast() from the IRQ handler (optional patch 4), the main
> goal here is to eliminate the potential for nested IRQs (patch 3). These
> patches are imo 4.21 candidates (with patch 4 being questionable altogether;
> see there).

I am not sure that patch 4 is very useful at the current stage.
The first three patches look useful enough for now, so:
  Releaase-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

> Patches 5 and onwards likely aren't important enough anymore at
> this point of the release cycle, even if those with a Fixes: tag would likely
> end up being backported later on.
>
> The one related thing I haven't been able to find a viable solution for is
> the elimination of the cpumask_t local variable in handle_hpet_broadcast().
> That'll get in the way of possible future increases of the NR_CPUS upper
> bound: Much like right now a single level of nesting is already too much,
> if the limit was doubled even a single IRQ would end up consuming too much
> stack space (together with cpumask_raise_softirq() also having such a
> variable). Yet further doubling would not allow any such stack variables
> anymore.
>
> 01: limit channel changes
> 02: disable unused channels
> 03: use single, global, low-priority vector for broadcast IRQ
> 04: ignore "stale" IRQs
> 05: avoid indirect call to event handler
> 06: make another channel flags update atomic
> 07: move legacy tick IRQ count adjustment
> 08: shrink IRQ-descriptor locked region in set_channel_irq_affinity()
> 09: reduce hpet_next_event() call sites
> 10: don't use hardcoded 0 for "long timeout"
>
> Jan
--------------LBoZXSG0veUPafMPUeHO5ruA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/16/25 9:30 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com">
      <pre wrap="" class="moz-quote-pre">While 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt processing")
helped quite a bit, nested interrupts could still occur. First and foremost
as a result from IRQ migration (where we don't have any control over the
vectors chosen). Hence besides reducing the number of IRQs that can be raised
(first two patches) and possibly the number of invocations of
handle_hpet_broadcast() from the IRQ handler (optional patch 4), the main
goal here is to eliminate the potential for nested IRQs (patch 3). These
patches are imo 4.21 candidates (with patch 4 being questionable altogether;
see there). </pre>
    </blockquote>
    <pre>I am not sure that patch 4 is very useful at the current stage.
The first three patches look useful enough for now, so:
 Releaase-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com">
      <pre wrap="" class="moz-quote-pre">Patches 5 and onwards likely aren't important enough anymore at
this point of the release cycle, even if those with a Fixes: tag would likely
end up being backported later on.

The one related thing I haven't been able to find a viable solution for is
the elimination of the cpumask_t local variable in handle_hpet_broadcast().
That'll get in the way of possible future increases of the NR_CPUS upper
bound: Much like right now a single level of nesting is already too much,
if the limit was doubled even a single IRQ would end up consuming too much
stack space (together with cpumask_raise_softirq() also having such a
variable). Yet further doubling would not allow any such stack variables
anymore.

01: limit channel changes
02: disable unused channels
03: use single, global, low-priority vector for broadcast IRQ
04: ignore "stale" IRQs
05: avoid indirect call to event handler
06: make another channel flags update atomic
07: move legacy tick IRQ count adjustment
08: shrink IRQ-descriptor locked region in set_channel_irq_affinity()
09: reduce hpet_next_event() call sites
10: don't use hardcoded 0 for "long timeout"

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------LBoZXSG0veUPafMPUeHO5ruA--

