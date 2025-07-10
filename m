Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A62AFFA4C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 09:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039095.1411095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZlIh-0007A3-NL; Thu, 10 Jul 2025 07:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039095.1411095; Thu, 10 Jul 2025 07:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZlIh-00078X-KX; Thu, 10 Jul 2025 07:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1039095;
 Thu, 10 Jul 2025 07:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYm/=ZX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uZlIg-00078R-5n
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 07:02:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da216581-5d5b-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 09:02:33 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so6523125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 00:02:33 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-454dd4669c3sm10016695e9.14.2025.07.10.00.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 00:02:32 -0700 (PDT)
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
X-Inumbo-ID: da216581-5d5b-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752130953; x=1752735753; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+z7M8aZgDGZ5EYdycjyxRPOYvWomS/RM+csuvGA/5A=;
        b=D9dDt5E+5yI5KkLrFO+n1/on7SAUfrAiTwKk568cOf6Zg5tcU8fTApV9mD9NJ9kiUI
         8imTXnEDsFJ44SUJwwukrVZYOw+QhRK+Xltc2K38/8B8N28r48zvb/Ssdx2GO9+CjniB
         pOijC82b3hjX0e89bS84qR2D2NkhYmb+v4Du4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752130953; x=1752735753;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+z7M8aZgDGZ5EYdycjyxRPOYvWomS/RM+csuvGA/5A=;
        b=jMV/tZ1XlPgSyHy9sVjJdkE2e7Xgx2zqbRpLwyJea1bbMOBhl0Pea0xfaN9TNtO/si
         cXRhe57MXof8ieB5P9DuzRmAZVN7yg5Og2l74tVnFW/7rJ6CAhx8zr//mYNd/BVUYaP4
         d6uexkcSKcWl9SA89UQyoaR6DKKaKHpN+ePxpPOk3GfG+dWTKxwJ7YT3GUOos7LVsJYG
         KHMFxmvoe/bkjxdXw3QhtiZzHZaTuy4510C1orknuDVlJ7jA/h9Blidxi+k3JkGEUFRj
         C7aACU8SuM6qNUwiCMKdIMeMt42m2Uf/giIyGUlctfWrREz/OF8+kQ0kx+XrW1wU1Hjr
         70fg==
X-Forwarded-Encrypted: i=1; AJvYcCWKSW2jNEo3wv56+Sofw+cM6kSJPcUatLKpr9bsMu/WvbJ5CdC4HB/3T79YWR4t3LUOrOWBOejzj3Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1Q1ULYyGHW6kncWMGfiTnzLx+RL9rh2oJmz7ZeMJVdbGB6h24
	4lOMFPJbec8jGaQOAiNWl0cWQS73wtj116hTpQpG0xGoI3Azr094D6yCPCb1a9043yU=
X-Gm-Gg: ASbGncvcFHePUQ1USsTqBnZj6Bpm8sPdTnDKEAHr8ImwacRpUWWBGiTOw1+qQTCO4jp
	r9vt4hasj5MnnBGec36NK0PH6ywpJb2Y2q2yaF69p0BvxjAPwksH99kb/7xgk2Z+a6h4VAV8ilP
	pGCiTheJlECYceJrdH9wejamaw5WImc4qvPo+VhUllfXcmkJv+VVmaP8smjGEPkIBEhk0uodkt0
	qtso6uOkCcjkCrWy+DaLQGwnbhH7JRaIHw53qbe1zqnhMumf/pKphcdg3W78b16MhK2lGvZSnEz
	2rT7FK2BNknzIj/ojwNmTYNVOMooyQGdDF6s0Onw/JCeEr7OBFPpH30LDde8McO9FzaT5uOT9wY
	f5MMjb70S3gSno0ZYJ+Ym5rWUeJZ16yQtW8tVt98f
X-Google-Smtp-Source: AGHT+IFqx6Do8y+33i6ukriI1GWsbDa+WGhl4gI72ZodzV/PokZ9Yw5G9iMxPP8Dfxw/4mMIUumAQg==
X-Received: by 2002:a05:600c:4450:b0:453:7713:539f with SMTP id 5b1f17b1804b1-454dd2e388amr10946305e9.26.1752130952669;
        Thu, 10 Jul 2025 00:02:32 -0700 (PDT)
Date: Thu, 10 Jul 2025 09:02:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
	alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com
Subject: Re: [PATCH 0/2] Xen real-time x86
Message-ID: <aG9lh5FI8tKMJkco@macbook.local>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <aGzu4A_nk3dAScxt@macbook.local>
 <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
 <alpine.DEB.2.22.394.2507081000490.605088@ubuntu-linux-20-04-desktop>
 <b81d7bf6-6254-4001-89f3-3ec06e03e21a@suse.com>
 <alpine.DEB.2.22.394.2507091736520.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2507091736520.605088@ubuntu-linux-20-04-desktop>

On Wed, Jul 09, 2025 at 05:44:33PM -0700, Stefano Stabellini wrote:
> On Wed, 9 Jul 2025, Jan Beulich wrote:
> > On 08.07.2025 19:11, Stefano Stabellini wrote:
> > > On Tue, 8 Jul 2025, Jan Beulich wrote:
> > >> On 08.07.2025 12:11, Roger Pau Monné wrote:
> > >>> On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
> > >>>> Hi all,
> > >>>>
> > >>>> This short patch series improves Xen real-time execution on AMD x86
> > >>>> processors.
> > >>>>
> > >>>> The key to real-time performance is deterministic guest execution times
> > >>>> and deterministic guest interrupt latency. In such configurations, the
> > >>>> null scheduler is typically used, and there should be no IPIs or other
> > >>>> sources of vCPU execution interruptions beyond the guest timer interrupt
> > >>>> as configured by the guest, and any passthrough interrupts for
> > >>>> passthrough devices.
> > >>>>
> > >>>> This is because, upon receiving a critical interrupt, the guest (such as
> > >>>> FreeRTOS or Zephyr) typically has a very short window of time to
> > >>>> complete the required action. Being interrupted in the middle of this
> > >>>> critical section could prevent the guest from completing the action
> > >>>> within the allotted time, leading to malfunctions.
> > >>>
> > >>> There's IMO still one pending issue after this series on x86, maybe
> > >>> you have addressed this with some local patch.
> > >>
> > >> Not just one, I think. We use IPIs for other purposes as well. The way
> > >> I read the text above, all of them are a (potential) problem.
> > > 
> > > Yes, all of them are potentially a problem. If you know of any other
> > > IPI, please let me know and I'll try to remove them.
> > 
> > INVALIDATE_TLB_VECTOR, EVENT_CHECK_VECTOR, and CALL_FUNCTION_VECTOR, maybe
> > also others in that group of vectors (see irq-vectors.h).
> 
> Thanks Jan, I'll look into those.
> 
> 
> > > One of my goals
> > > posting this series was to raise awareness on this issue and attempting
> > > to fix it with your help. It is not just IPIs, also Xen timers and other
> > > things that could cause the guest to trap into Xen without the guest
> > > knowledge. Typically IPIs are the worst offenders in my experience.
> > > 
> > > On ARM, I have done several experiments where, after the system is
> > > configured correctly, I can see that if the RTOS does nothing, there are
> > > no traps in Xen on the RTOS vCPU/pCPU for seconds.
> > 
> > Being quiescent when the system is idle is only part of the overall
> > requirement, though?
> 
> Actually being quiescent when the system is idle is not a requirement.
> 
> The only requirements are:
> 1) quick interrupt injection into the RTOS
> 2) the RTOS must be undisturbed while executing the critical region
> 
> 1) mostly means that the physical interrupt should be delivered to the
> same pCPU running the RTOS vCPU. Otherwise the extra IPI causes unwanted
> delays.

This should already be the case, in the Xen model interrupts follow
vCPUs, so if you use pinning the vCPU should always be running
on the pCPU that's the target of the physical interrupt.

> 2) means that the RTOS must be undisturbed when executing the critical
> section, which is typically right after receiving the interrupt and only
> last for less than 1ms. In practice, it means the RTOS should absolutely
> not be descheduled and there should be no (unnecessary) traps into Xen
> while the RTOS is executing the critical section. It is expected that
> the RTOS will run the critical section with interrupts disabled.

What about other external interrupts?  While the guest runs the
critical interrupt handling section with interrupts disabled, an
external interrupt from a device targeting the pCPU could cause a
vmexit.  I'm not aware of a nice way to solve this however, as for
PVH/HVM Xen doesn't know when the guest has finished interrupt
processing (iret).  Maybe this is not an issue in practice if you
isolate interrupts to different vCPUs (you might have to do this
already to ensure deterministic latency).

Roger.

