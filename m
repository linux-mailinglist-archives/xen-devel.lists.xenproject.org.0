Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD0AFC803
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 12:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036337.1408596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5Im-0006QI-Vz; Tue, 08 Jul 2025 10:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036337.1408596; Tue, 08 Jul 2025 10:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ5Im-0006NW-T2; Tue, 08 Jul 2025 10:11:52 +0000
Received: by outflank-mailman (input) for mailman id 1036337;
 Tue, 08 Jul 2025 10:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K9GB=ZV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uZ5Il-0006NQ-8L
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 10:11:51 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4165d6a-5be3-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 12:11:46 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so3328832f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 03:11:46 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-454cd3dcf35sm17589575e9.36.2025.07.08.03.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:11:45 -0700 (PDT)
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
X-Inumbo-ID: f4165d6a-5be3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751969505; x=1752574305; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGneS9Ew0MzM6DWP+0SIO3RnKozwE6omAIgBNrTc3NY=;
        b=DK2Y3bwNKyfCeJnh2OllJO308YgrkcYy8VeqdPIvjob1qal67faQect43jS0DZihK0
         DBcy5Xp4GWRz+sd6LQduiVVAmHz2hl7K0XaJO9/YUlF3Sc34rhNjk4NOwm7k82ITHo43
         ZhAhze7I89cVS+DL0EAm0xa+EHP3Q/bM5avCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969505; x=1752574305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGneS9Ew0MzM6DWP+0SIO3RnKozwE6omAIgBNrTc3NY=;
        b=Z5VXen+Ypffy6f6ROlrQtTkDjhwnGjZfNcd3lv2ze3hjbJjYBbRgddYx9SOVuw8YGE
         VPQ4F9+GmBx7q+4+b9LSkv9LNh8Fc/cclj6lwrOqQ10+pJMDMSLQwiV+ExaaBSy/GjqY
         E18suKL4AyGi8AWTrAbys4ndw4iqY5wJpDNpvvMm/0JXHgr/Pz1m1oDT6SR/baD+WUlK
         TeBGKshGxsrq235DXC27g7uwpfRggWvKlznZ5i0vj1lEpd6fFt4Zkbx7rHfEu2MCm5Wz
         aMtI9FuGOcLm9spa1MPi6z5xB+LVatn31sqcvCLiNXip3ew+DpPAyDJOR4tu6/dW25Gv
         Yu8w==
X-Gm-Message-State: AOJu0Yy9FnVml1NX6GqyTtWE/uk50vMey3qNwxauZ4lyTfvq7swD5TPL
	fHvloKv+UXy89Hl26eFcJDeZqhRMcYtdxQ+WgjTxNXXGxNYGubmQpwhixGjsuzK7hzA=
X-Gm-Gg: ASbGncsLk6RXyXIJvnQGXoQHcCQN/bCe0jYJu4h3WGnndDKDYhf/GwIhCU+/kKRe7TL
	gLXgvkxQzDecgdKr0+MkrRGT36qN4O4dkmG8/mTc74y3EIiBccDazEWCK2VE58mzfjnDzc56506
	AXd9r2IV1a+qPWlV2lAGxXnQaXZO7MT60GjpJqjjv9xtgU++FS0ua31bIPjSvTZYowOBxX7JF9N
	xeuOHoUbEY7YiAg3+LRLjUPJPWhyefOBRTVuzPyIEbKD2CrjwygxzObHIvFupqmnIUv70/LB70Y
	W6t0G5oof3eaZPPF2MVHOhytr3a+6yrqLn4xwfgwhvIyrJSs69z2SC9/Clc9gbuJ6C0MvCAsRMk
	cMIRgYhI9UNb7BEc5QFStaXJ4SLQikg==
X-Google-Smtp-Source: AGHT+IF1FIpqPWg7Ui94pH3W99GlMyyNW5e8qKUllHh/WcaTE9lgl2iS2YSaQsGrNZA/RWPYIV4e4Q==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3b4964f4d29mr14585985f8f.12.1751969505327;
        Tue, 08 Jul 2025 03:11:45 -0700 (PDT)
Date: Tue, 8 Jul 2025 12:11:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
	alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com
Subject: Re: [PATCH 0/2] Xen real-time x86
Message-ID: <aGzu4A_nk3dAScxt@macbook.local>
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>

On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
> Hi all,
> 
> This short patch series improves Xen real-time execution on AMD x86
> processors.
> 
> The key to real-time performance is deterministic guest execution times
> and deterministic guest interrupt latency. In such configurations, the
> null scheduler is typically used, and there should be no IPIs or other
> sources of vCPU execution interruptions beyond the guest timer interrupt
> as configured by the guest, and any passthrough interrupts for
> passthrough devices.
> 
> This is because, upon receiving a critical interrupt, the guest (such as
> FreeRTOS or Zephyr) typically has a very short window of time to
> complete the required action. Being interrupted in the middle of this
> critical section could prevent the guest from completing the action
> within the allotted time, leading to malfunctions.

There's IMO still one pending issue after this series on x86, maybe
you have addressed this with some local patch.  Interrupt forwarding
from Xen into HVM/PVH guests uses a softirq to do the injection, which
means there's a non-deterministic window of latency between when the
interrupt is received by Xen, as to when it's injected to the guest,
because the softirq might not get processed right after being set as
pending (there might be other softirqs to process, or simply Xen might
be busy doing some other operation).

I think you want to look into adding a new command line option or
similar, that allows selecting whether guest IRQs are deferred to a
softirq for injection, or are injected as part of the processing done
in the IRQ handler itself.

Otherwise there will always be a non-deterministic amount of latency
on x86 w.r.t. HVM/PVH passthrough guest interrupts.  Haven't you seen
some weird/unexpected variance when doing this passthrough interrupt
latency measurements on x86?

Regards, Roger.

