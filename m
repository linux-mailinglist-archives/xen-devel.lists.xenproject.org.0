Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991D87CFFE9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:47:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619537.964773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWAb-0000wu-UW; Thu, 19 Oct 2023 16:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619537.964773; Thu, 19 Oct 2023 16:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWAb-0000u6-RS; Thu, 19 Oct 2023 16:46:49 +0000
Received: by outflank-mailman (input) for mailman id 619537;
 Thu, 19 Oct 2023 16:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgWq=GB=flex--seanjc.bounces.google.com=3dF0xZQYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@srs-se1.protection.inumbo.net>)
 id 1qtWAb-0000ss-3U
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:46:49 +0000
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [2607:f8b0:4864:20::1149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1683cab0-6e9f-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 18:46:45 +0200 (CEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59b5a586da6so8280087b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 09:46:45 -0700 (PDT)
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
X-Inumbo-ID: 1683cab0-6e9f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697734004; x=1698338804; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpEPzMpbmRE7S67/u7J3M2Dti06L1rP8ZIHmBIwQBxQ=;
        b=nwdtCFg0ww8n6IynajY8au14owPegI7j37qYqD9iRWnl/wvCmPOxe+rJyhnhjB3hg5
         VPbV2Iu4DEJUTZTkUYcASxFg5p6FjfLdi/Z9A4ERYsYHeIWULTYbH8ekgA+h+E4Cgg/l
         FZGCjwQXDzyoSZ4wbG405S//BUEXfRYvbjoZ2rx6GkwL0eZK2/KhueCdlplEoZQnzFAM
         D1YWl08g5Sc4f+/KX4wrYEWUvS92SbYxSUsgtm5iBkeuTa6BA0v55U9oFC2Y6RrfwVXE
         pMdrjJEH6Oa4QsrYBgmQZxl0GFM+qEmClXYBDQiQp2OBeg/Ii/d99FNFkRDZzF3hFX7g
         jMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697734004; x=1698338804;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpEPzMpbmRE7S67/u7J3M2Dti06L1rP8ZIHmBIwQBxQ=;
        b=H/L3/cug7Z6eqVEGGAnvsJjU1VYNdScvYfGjSXkLlOPz9CMmRBC8+tRzZXJ6HiahVW
         ue79UWUBe/RMQmZ9zfy2Peq531ptdFOpo8FSmTwApYShXAbr714G5E1o5GviDaTZtUPp
         2v3wjt30yX/LW7kfSI0F1ogMJDCo+QP1H4JGAvSB3qVVpS3/mPd3fpkmjlYg0KsneDvo
         zuisjbTliVnbzCnq1rfEMDr9dILnYUpAXaXq9QYrJYb964tU9NQvXZq4eGdM2W9nPMaZ
         2tmp1k2veswTWKLs1NBksf6YVL1Xv7tNL1EjBbDWwBTnSLS+lu4MjPCvbgbz/dEOU3Vo
         507Q==
X-Gm-Message-State: AOJu0YyZVnxF/e+j8d+RD8AaUyqu3me0sommMdiOXsh5vxs1Ed1kOMjm
	fOs+JnqA3R+g5T6MXUzB5mQAVX6VocA=
X-Google-Smtp-Source: AGHT+IEY4l1tLFRd4OKDMZ5BEmKfsOkdl3pCTB2Bb27l0R7GZ2kCcrsoaryqlPd22mnjSHSD4UHcORKmX0Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4fcb:0:b0:5a7:b4d5:5f27 with SMTP id
 d194-20020a814fcb000000b005a7b4d55f27mr63990ywb.5.1697734004668; Thu, 19 Oct
 2023 09:46:44 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:46:43 -0700
In-Reply-To: <2f1459d7c3e3e81cdca931e104c3ade71dfcfee5.camel@infradead.org>
Mime-Version: 1.0
References: <20231018221123.136403-1-dongli.zhang@oracle.com>
 <87ttqm6d3f.fsf@redhat.com> <ZTFOCqMCuSiH8VEt@google.com> <2f1459d7c3e3e81cdca931e104c3ade71dfcfee5.camel@infradead.org>
Message-ID: <ZTFdczzpORPBNpbx@google.com>
Subject: Re: [PATCH RFC 1/1] x86/paravirt: introduce param to disable pv sched_clock
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Dongli Zhang <dongli.zhang@oracle.com>, x86@kernel.org, 
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org, 
	pv-drivers@vmware.com, xen-devel@lists.xenproject.org, 
	linux-hyperv@vger.kernel.org, jgross@suse.com, akaher@vmware.com, 
	amakhalov@vmware.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, pbonzini@redhat.com, 
	wanpengli@tencent.com, peterz@infradead.org, joe.jin@oracle.com, 
	boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 19, 2023, David Woodhouse wrote:
> On Thu, 2023-10-19 at 08:40 -0700, Sean Christopherson wrote:
> > > If for some 'historical reasons' we can't revoke features we can always
> > > introduce a new PV feature bit saying that TSC is preferred.
> 
> Don't we already have one? It's the PVCLOCK_TSC_STABLE_BIT. Why would a
> guest ever use kvmclock if the PVCLOCK_TSC_STABLE_BIT is set?
>
> The *point* in the kvmclock is that the hypervisor can mess with the
> epoch/scaling to try to compensate for TSC brokenness as the host
> scales/sleeps/etc.
> 
> And the *problem* with the kvmclock is that it does just that, even
> when the host TSC hasn't done anything wrong and the kvmclock shouldn't
> have changed at all.
> 
> If the PVCLOCK_TSC_STABLE_BIT is set, a guest should just use the guest
> TSC directly without looking to the kvmclock for adjusting it.
> 
> No?

No :-)

PVCLOCK_TSC_STABLE_BIT doesn't provide the guarantees that are needed to use the
raw TSC directly.  It's close, but there is at least one situation where using TSC
directly even when the TSC is stable is bad idea: when hardware doesn't support TSC
scaling and the guest virtual TSC is running at a higher frequency than the hardware
TSC.  The guest doesn't have to worry about the TSC going backwards, but using the
TSC directly would cause the guest's time calculations to be inaccurate.

And PVCLOCK_TSC_STABLE_BIT is also much more dynamic as it's tied to a given
generation/sequence.  E.g. if KVM stops using its masterclock for whatever reason,
then kvm_guest_time_update() will effectively clear PVCLOCK_TSC_STABLE_BIT and the
guest-side __pvclock_clocksource_read() will be forced to do a bit of extra work
to ensure the clock is monotonically increasing.

