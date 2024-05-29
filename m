Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB798D3A40
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732152.1138013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKps-0004PR-Dt; Wed, 29 May 2024 15:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732152.1138013; Wed, 29 May 2024 15:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCKps-0004N6-Ay; Wed, 29 May 2024 15:03:28 +0000
Received: by outflank-mailman (input) for mailman id 732152;
 Wed, 29 May 2024 15:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCKpr-0004N0-9n
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:03:27 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99acefbf-1dcc-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 17:03:26 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52b6ccfdf28so565395e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:03:26 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a08abd8sm15023448f8f.32.2024.05.29.08.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:03:25 -0700 (PDT)
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
X-Inumbo-ID: 99acefbf-1dcc-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716995006; x=1717599806; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B15XUFlmFFShNmtqs74WHz9M7v0pbt+dJmTE0D0fce0=;
        b=arhX60sFD2HJ/L98aREawqjeD3S53Sm0KNQsD71RGn4Z9/U/hcGfaf49AynALIMFkd
         TVR+LQZ0DrG3n1AkHeh0qaNVOmGlqnnSVFwi9hjf/UmkxZx+D9KaxOgf5V8Cs7pApy1w
         3AaZVJ+rHiHOJefCHyucqy85OuZ4isW8Sf230=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716995006; x=1717599806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B15XUFlmFFShNmtqs74WHz9M7v0pbt+dJmTE0D0fce0=;
        b=gIDScNA5f+mj7G0/l1zPOH9VL1ErDGT/0pQF+6me0hUG49oltUdRe48woJulfwVSkl
         gSBDXBL4ORNBY4LEUYfEaecod+3ajJhZutwacGJWqM+xmK0xuekhR4NJ+s9UDdCxWB8+
         Yq5N1rCaNKNBxM5RSfSTdRFPLE/JfUTNRz2R6UuwqSlqrDbEPVTAa7pRJ7beJ7t/HEkn
         Pmy8MibISIBg+iOnoG8rNlZnlNSm5GWuUtD9CusrsMRHGDC5xxksbShAx+vsYXqtb1QJ
         Rx5BrJf51bR9sX6TCyaRr7UulnyrSJj+nYyEia+YWnl/SufX9A65TobIF08EL3cP+NGU
         w8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJFkxuRd1uDTViWHL5OanPJkViR8OYBY8GO3Gjx6bkEVHhvsPStbO+3slJvdDq2Y+iXFbI8pL/Js8a+urXfuqLkHTvaAwdgcSt3OF1lKQ=
X-Gm-Message-State: AOJu0YxLK0L30EFKTzgcZwnsaGRy4xgjLdjtNP3M86P358AdvhEfV6hc
	1PSKd0dIfKV4ruHvR70HdJde4AcleG1gETuNaSLvvvF84P7HXsBBrbO6ObMNRUE=
X-Google-Smtp-Source: AGHT+IED122ZGSEUteWAaWI2hzBfQzDzxqJyxuQHPvDWYjR041fJuao15xFdMQdk/W3sKWrUL3T06w==
X-Received: by 2002:a2e:9483:0:b0:2e6:f556:48a5 with SMTP id 38308e7fff4ca-2e95b08f95dmr106981761fa.19.1716995005455;
        Wed, 29 May 2024 08:03:25 -0700 (PDT)
Date: Wed, 29 May 2024 17:03:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.19 3/9] xen/cpu: ensure get_cpu_maps() returns
 false if CPU operations are underway
Message-ID: <ZldDvH8GhhQcu5NX@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-4-roger.pau@citrix.com>
 <597b0bf9-8949-41f3-a630-18937c219d8b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <597b0bf9-8949-41f3-a630-18937c219d8b@suse.com>

On Wed, May 29, 2024 at 03:35:04PM +0200, Jan Beulich wrote:
> On 29.05.2024 11:01, Roger Pau Monne wrote:
> > Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
> > a cpu_hotplug_{begin,done}() region the function will still return success,
> > because a CPU taking the rwlock in read mode after having taken it in write
> > mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
> > as it should always return false when called with a CPU hot{,un}plug operation
> > is in progress.
> 
> I'm not sure I can agree with this. The CPU doing said operation ought to be
> aware of what it is itself doing. And all other CPUs will get back false from
> get_cpu_maps().

Well, the CPU is aware in the context of cpu_{up,down}(), but not in
the interrupts that might be handled while that operation is in
progress, see below for a concrete example.

> >  Otherwise the logic in send_IPI_mask() for example is wrong,
> > as it could decide to use the shorthand even when a CPU operation is in
> > progress.
> 
> It's also not becoming clear what's wrong there: As long as a CPU isn't
> offline enough to not be in cpu_online_map anymore, it may well need to still
> be the target of IPIs, and targeting it with a shorthand then is still fine.

The issue is in the online path: there's a window where the CPU is
online (and the lapic active), but cpu_online_map hasn't been updated
yet.  A specific example would be time_calibration() being executed on
the CPU that is running cpu_up().  That could result in a shorthand
IPI being used, but the mask in r.cpu_calibration_map not containing
the CPU that's being brought up online because it's not yet added to
cpu_online_map.  Then the number of CPUs actually running
time_calibration_rendezvous_fn won't match the weight of the cpumask
in r.cpu_calibration_map.

> In any event this would again affect only the CPU leading the CPU operation,
> which should clearly know at which point(s) it is okay to send IPIs. Are we
> actually sending any IPIs from within CPU-online or CPU-offline paths?

Yes, I've seen the time rendezvous happening while in the middle of a
hotplug operation, and the CPU coordinating the rendezvous being the
one doing the CPU hotplug operation, so get_cpu_maps() returning true.

> Together with the earlier paragraph the critical window would be between the
> CPU being taken off of cpu_online_map and the CPU actually going "dead" (i.e.
> on x86: its LAPIC becoming unresponsive to other than INIT/SIPI). And even
> then the question would be what bad, if any, would happen to that CPU if an
> IPI was still targeted at it by way of using the shorthand. I'm pretty sure
> it runs with IRQs off at that time, so no ordinary IRQ could be delivered.
> 
> > Adjust the logic in get_cpu_maps() to return false when the CPUs lock is
> > already hold in write mode by the current CPU, as read_trylock() would
> > otherwise return true.
> > 
> > Fixes: 868a01021c6f ('rwlock: allow recursive read locking when already locked in write mode')
> 
> I'm puzzled by this as well: Prior to that and the change referenced by its
> Fixes: tag, recursive spin locks were used. For the purposes here that's the
> same as permitting read locking even when the write lock is already held by
> the local CPU.

I see, so the Fixes should be:

x86/smp: use APIC ALLBUT destination shorthand when possible

Instead, which is the commit that started using get_cpu_maps() in
send_IPI_mask().

Thanks, Roger.

