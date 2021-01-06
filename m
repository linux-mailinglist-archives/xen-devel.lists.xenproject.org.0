Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D132EBC90
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 11:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62410.110504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6Fy-0006tz-Nx; Wed, 06 Jan 2021 10:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62410.110504; Wed, 06 Jan 2021 10:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx6Fy-0006tf-KI; Wed, 06 Jan 2021 10:41:34 +0000
Received: by outflank-mailman (input) for mailman id 62410;
 Wed, 06 Jan 2021 10:41:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QPu5=GJ=alien8.de=bp@srs-us1.protection.inumbo.net>)
 id 1kx6Fx-0006ta-SO
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 10:41:33 +0000
Received: from mail.skyhub.de (unknown [5.9.137.197])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af1c2a61-5df1-4c38-8060-39c55daef052;
 Wed, 06 Jan 2021 10:41:30 +0000 (UTC)
Received: from zn.tnic (p200300ec2f09690020b9eee96d74c6dd.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:6900:20b9:eee9:6d74:c6dd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3B2281EC03CF;
 Wed,  6 Jan 2021 11:41:29 +0100 (CET)
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
X-Inumbo-ID: af1c2a61-5df1-4c38-8060-39c55daef052
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1609929689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=8VPC62+5b70LR5BoIfUhJalZALufwBdXxDSD88DU1ho=;
	b=DOlO2eqS1eGgozQ270u8HfXWMbBiEg+36ptQO6tFDnEDqJFsXJfpGVACcO6dgZIuNu2jsu
	67UyoIonpFqgiQuB79yECtpLG4usl86HMxaM7H2a8lPEagKavDid5NnGPwRVPZqRqcuDY6
	+rB0JSQgcanZJYcpzw6Zbz0WpU7m4o0=
Date: Wed, 6 Jan 2021 11:41:26 +0100
From: Borislav Petkov <bp@alien8.de>
To: Michael Kelley <mikelley@microsoft.com>
Cc: Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	KY Srinivasan <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	vkuznets <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>
Subject: Re: [PATCH v3 06/15] x86/paravirt: switch time pvops functions to
 use static_call()
Message-ID: <20210106104126.GC5729@zn.tnic>
References: <20201217093133.1507-1-jgross@suse.com>
 <20201217093133.1507-7-jgross@suse.com>
 <MW2PR2101MB1052877B5376112F1BAF3D93D7C49@MW2PR2101MB1052.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW2PR2101MB1052877B5376112F1BAF3D93D7C49@MW2PR2101MB1052.namprd21.prod.outlook.com>

On Thu, Dec 17, 2020 at 05:31:50PM +0000, Michael Kelley wrote:
> These Hyper-V changes are problematic as we want to keep hyperv_timer.c
> architecture independent.  While only the code for x86/x64 is currently
> accepted upstream, code for ARM64 support is in progress.   So we need
> to use hv_setup_sched_clock() in hyperv_timer.c, and have the per-arch
> implementation in mshyperv.h.

Why, because ARM doesn't have static_call yet? I hear someone is working
on that...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

