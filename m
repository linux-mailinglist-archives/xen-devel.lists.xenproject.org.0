Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A86A3064F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 09:51:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885144.1294920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thlyV-0006pn-Cx; Tue, 11 Feb 2025 08:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885144.1294920; Tue, 11 Feb 2025 08:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thlyV-0006ne-AD; Tue, 11 Feb 2025 08:50:35 +0000
Received: by outflank-mailman (input) for mailman id 885144;
 Tue, 11 Feb 2025 08:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jP5V=VC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1thlyT-0006nY-TC
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 08:50:33 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e8dc558-e855-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 09:50:29 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d9837f201aso12210299a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 00:50:29 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de61657531sm5811854a12.52.2025.02.11.00.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 00:50:28 -0800 (PST)
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
X-Inumbo-ID: 3e8dc558-e855-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739263829; x=1739868629; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wqNUzCdc9QtU9G8322+wrH+hK3LuhUTXI0jZXL0dHI=;
        b=umNzrMZaQD6zKvOb7Jg3aQNJ1vy2WiqIOWGNEZZJBDwmWY3ykae0HQor++dR1nsoE4
         z10RhADvLsSQgW2CTjOwKIlcmmOG9X+HRvSI1hA4q8RwDVrK8yqmqyhFMjnJP/3kgLd1
         XakIyQL6KcrHGri8V9rILkZzRL/WvAW8jSACA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263829; x=1739868629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wqNUzCdc9QtU9G8322+wrH+hK3LuhUTXI0jZXL0dHI=;
        b=sNKkHlrz2P28LHi30YO5wYWa9RN+2L8gZl8slL1+P+AG1KLxAli2M3BO/CnRT0mBaP
         PkDZMY5DnVUKA7hryPaOOzARh++HW22m3c2Ov1yAv0Uov+tPBPDbS9tz0QjP/tZdlUaa
         1ExDJccesNmLsDzzgVFm1VBpFHaaEKsJCQgJRNqY7Htesf5Zvrq4K2H+Pn9upXeB4YVR
         SNRQnfJAxbq6bpmnk+B3IN10c/KqdVK6IgbgQXwD130xjv5MJmT4J1c4SYbLJCm+V5ph
         Gn1p/34MpBJKeLWuk2DmG0oB7iPPAeStk+vQllziwa3Q1pkXnLU+XjUZYs8egNroFxqD
         lLoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx+l5R7sLm8cvmScsc5C4Mu8KGWD2FVzcBpL37RJHPrhMK3y6lfd5vcMmDokR46Vl/9QYXQfacUmw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxn4JXxEjaGL2EeBukOyN4JkCrzBimp5ktNbaB5nocF5do/dVXE
	VIY1nSP6LzAVupU9X0ImWtb7mVRY/Wh20wclwrWFou+8gGu+zdhBgyqwU/D9X/4=
X-Gm-Gg: ASbGnctrASHvfTFwSgHk3WzCknuYu63KnYoXDe6DhszVl07WkJUY60a3KcmrNTR5cWs
	C/+kteDg4Nk+6tssYg4rld2EPtu8UZJBkQPPO8vEMv4yEgUdRSwg9ZXs08bwOvQWIIJABLQRakP
	h90a2iFngg7UzmMaY4oP2NwBsYoxWJ678vCVw0K4Smp9Mz7sLmQIUCjOn/jMe2+DPSSLXheU0Ux
	GrNithQSoB4xz0MSdt12Pul2/7Vg+y2Phc+OZrwvA6vyYj14YxGBu//WSiP9ZJT8wszjnwzyNyX
	mW/kZeBXw4/0tlfknKp+
X-Google-Smtp-Source: AGHT+IHbJHwLFwKcWOFSHl3Pw9/tFM2I8XIGu2EzST7Z2j5bJlomAWe23aWi5QWzvNZi6a+OC2o6lA==
X-Received: by 2002:a05:6402:254e:b0:5de:5857:1fef with SMTP id 4fb4d7f45d1cf-5de9b9dc42bmr2458110a12.13.1739263828630;
        Tue, 11 Feb 2025 00:50:28 -0800 (PST)
Date: Tue, 11 Feb 2025 09:50:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/5] xen/x86: prevent local APIC errors at shutdown
Message-ID: <Z6sPU2y7qHMjAZ30@macbook.local>
References: <20250206150615.52052-1-roger.pau@citrix.com>
 <c9b8ae2c-ed90-4256-8a61-19ed85b1a774@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c9b8ae2c-ed90-4256-8a61-19ed85b1a774@suse.com>

On Tue, Feb 11, 2025 at 07:39:12AM +0100, Jan Beulich wrote:
> On 06.02.2025 16:06, Roger Pau Monne wrote:
> > The following series aims to prevent local APIC errors from stalling the
> > shtudown process.  On XenServer testing we have seen reports of AMD
> > boxes sporadically getting stuck in a spam of:
> > 
> > APIC error on CPU0: 00(08), Receive accept error
> > 
> > Messages during shutdown, as a result of device interrupts targeting
> > CPUs that are offline (and have the local APIC disabled).
> 
> One more thought here: Have you/we perhaps discovered the reason why there
> was that 1ms delay at the end of fixup_irqs() that was badly commented,
> and that you removed in e2bb28d62158 ("x86/irq: forward pending interrupts
> to new destination in fixup_irqs()")? May be worth mentioning that by way
> of a Fixes: tag.

Hm, so you think the delay was added there as a way to ensure any
pending interrupts would get drained (ie: serviced) on the old target?

I'm maybe a bit confused, but I don't think the delay would help much
with preventing the local APIC errors?  Regardless of the wait, if the
interrupts target offline CPUs there's a chance receive accept errors
will be triggered on AMD.

Thanks, Roger.

