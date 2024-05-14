Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF98C55F7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 14:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721466.1124895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rC9-0002mp-Jc; Tue, 14 May 2024 12:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721466.1124895; Tue, 14 May 2024 12:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rC9-0002kz-Gi; Tue, 14 May 2024 12:23:49 +0000
Received: by outflank-mailman (input) for mailman id 721466;
 Tue, 14 May 2024 12:23:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/uDt=MR=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1s6rC8-0002kt-SC
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 12:23:48 +0000
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch
 [45.157.188.14]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa71842-11ec-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 14:23:46 +0200 (CEST)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch
 [10.7.10.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VdwWP64pbzTXk;
 Tue, 14 May 2024 14:23:45 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4VdwWN5tzlzF2L; Tue, 14 May 2024 14:23:44 +0200 (CEST)
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
X-Inumbo-ID: cfa71842-11ec-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1715689425;
	bh=I0eZWdP4Q+KPu4Hx3s3mpwHuoQ0UvkeO9/nafOAr82w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUYIhJQSGxJF3jwUizanlmonUX7sygOvcV8noUaAFzN0V3a3iKwuGB8/GEum6Clxq
	 EcKo1qBH3Un5VS8jWoGkoTi3TiKlCjIcaIL1kB+8poVzqExKvp5IQ2ywDDPeKqlugY
	 OVZlyAPCKt5gtA5k6143lcqKUer3NgtqPGvwYp+A=
Date: Tue, 14 May 2024 14:23:42 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: Sean Christopherson <seanjc@google.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Kees Cook <keescook@chromium.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Alexander Graf <graf@amazon.com>, Angelina Vu <angelinavu@linux.microsoft.com>, 
	Anna Trikalinou <atrikalinou@microsoft.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Forrest Yuan Yu <yuanyu@google.com>, James Gowans <jgowans@amazon.com>, 
	James Morris <jamorris@linux.microsoft.com>, John Andersen <john.s.andersen@intel.com>, 
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>, Marian Rotariu <marian.c.rotariu@gmail.com>, 
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>, =?utf-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>, 
	Thara Gopinath <tgopinath@microsoft.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, =?utf-8?Q?=C8=98tefan_=C8=98icleru?= <ssicleru@bitdefender.com>, 
	dev@lists.cloudhypervisor.org, kvm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org, 
	x86@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v3 3/5] KVM: x86: Add notifications for Heki policy
 configuration and violation
Message-ID: <20240514.mai3Ahdoo2qu@digikod.net>
References: <20240503131910.307630-1-mic@digikod.net>
 <20240503131910.307630-4-mic@digikod.net>
 <ZjTuqV-AxQQRWwUW@google.com>
 <20240506.ohwe7eewu0oB@digikod.net>
 <ZjmFPZd5q_hEBdBz@google.com>
 <20240507.ieghomae0UoC@digikod.net>
 <ZjpTxt-Bxia3bRwB@google.com>
 <D15VQ97L5M8J.1TDNQE6KLW6JO@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D15VQ97L5M8J.1TDNQE6KLW6JO@amazon.com>
X-Infomaniak-Routing: alpha

On Fri, May 10, 2024 at 10:07:00AM +0000, Nicolas Saenz Julienne wrote:
> On Tue May 7, 2024 at 4:16 PM UTC, Sean Christopherson wrote:
> > > If yes, that would indeed require a *lot* of work for something we're not
> > > sure will be accepted later on.
> >
> > Yes and no.  The AWS folks are pursuing VSM support in KVM+QEMU, and SVSM support
> > is trending toward the paired VM+vCPU model.  IMO, it's entirely feasible to
> > design KVM support such that much of the development load can be shared between
> > the projects.  And having 2+ use cases for a feature (set) makes it _much_ more
> > likely that the feature(s) will be accepted.
> 
> Since Sean mentioned our VSM efforts, a small update. We were able to
> validate the concept of one KVM VM per VTL as discussed in LPC. Right
> now only for single CPU guests, but are in the late stages of bringing
> up MP support. The resulting KVM code is small, and most will be
> uncontroversial (I hope). If other obligations allow it, we plan on
> having something suitable for review in the coming months.

Looks good!

> 
> Our implementation aims to implement all the VSM spec necessary to run
> with Microsoft Credential Guard. But note that some aspects necessary
> for HVCI are not covered, especially the ones that depend on MBEC
> support, or some categories of secure intercepts.

We already implemented support for MBEC, so that should not be an issue.
We just need to find the best interface to configure it.

> 
> Development happens
> https://github.com/vianpl/{linux,qemu,kvm-unit-tests} and the vsm-next
> branch, but I'd advice against looking into it until we add some order
> to the rework. Regardless, feel free to get in touch.

Thanks for the update.

Could we schedule a PUCK meeting to synchronize and help each other?
What about June 12?

