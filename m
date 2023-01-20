Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B876758D9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481957.747212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItSd-0003Re-1J; Fri, 20 Jan 2023 15:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481957.747212; Fri, 20 Jan 2023 15:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItSc-0003PV-UL; Fri, 20 Jan 2023 15:37:46 +0000
Received: by outflank-mailman (input) for mailman id 481957;
 Fri, 20 Jan 2023 15:37:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=islB=5R=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pItSb-0003PP-Hi
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:37:45 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6072c019-98d8-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:37:42 +0100 (CET)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-ynSzOyI2M92Q8d7NniEQ-A-1; Fri, 20 Jan 2023 10:37:39 -0500
Received: by mail-ej1-f70.google.com with SMTP id
 sb39-20020a1709076da700b0086b1cfb06f0so4022535ejc.4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:37:39 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 eg49-20020a05640228b100b00488117821ffsm17591730edb.31.2023.01.20.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:37:35 -0800 (PST)
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
X-Inumbo-ID: 6072c019-98d8-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674229061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lf+VUNzHo6930QhHDjlYS5a/9FVCtfkspKq7OQ6oVEY=;
	b=a0rMRdsdO9Th5o8Sm5dJoRDcemvLrMD4n/r9GP+KMgd4Y4K+qno9oiSP4hYvxFnCSCqDsB
	FZp44/8/MwChd7jNkJ4fO7VCB1MTlb7/CGcPh5AfW140yisvHthoKPkaIBk4jWwuJKejZP
	EimqZ5tXl1GW0/o3s+wBa260mYXrFxE=
X-MC-Unique: ynSzOyI2M92Q8d7NniEQ-A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf+VUNzHo6930QhHDjlYS5a/9FVCtfkspKq7OQ6oVEY=;
        b=hP0PCkZZPmEoHiTsyIiMgYfYWjCXIjz9ReSvnSLOvWxBgQbid+/ohldBToXtlcRd5z
         qo54EdBACouV/FQ1sOQW1y8toR6ee6Ye7Mzf6M54wFqVSYwfSOx/O3f1Tmycdcr3nmEf
         Zm6T0t/79nhWYHN+JchjBtbpMgK4v8Lmt9JiRQIPVyQQHefz7+s3VpE02DriDAc6d97s
         yUYyF6mLgF0/dNgdORoHtyJHxNSRrH5pRp3nx+VYg0mL6Kf28s2qScL9+CBGxVwVt5mX
         N/taxZKuWNFrBVo3KlTQ94T1sekIoHE1ac1H+yO75l4dHw42pnr9FdsuII3PYNGua8kw
         3S4Q==
X-Gm-Message-State: AFqh2krOFQETGXvWSgj4CRoPS3jJ8seoW4aOq4xSW8A6KyogBoAwawHd
	0jefW1sKHoKUfuJYXvsHhYhMpYlYqkWeQWm9Cuxod1Fq0LYxHIWSxDd/mHj8t/cv9ZAcicdSYka
	AAmW2VjkwVEtgMjnBHz+2OX3hDDU=
X-Received: by 2002:a05:6402:413:b0:498:b9ea:1894 with SMTP id q19-20020a056402041300b00498b9ea1894mr14217260edv.15.1674229058192;
        Fri, 20 Jan 2023 07:37:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt9Neac975gd5nkcxdpVzeTBwC+wqA5CjhhwnQrnrtHBQwgyExGpn/wMyvV8tTW0X127YXwMw==
X-Received: by 2002:a05:6402:413:b0:498:b9ea:1894 with SMTP id q19-20020a056402041300b00498b9ea1894mr14217220edv.15.1674229057884;
        Fri, 20 Jan 2023 07:37:37 -0800 (PST)
Date: Fri, 20 Jan 2023 16:37:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 amakhalov@vmware.com, ganb@vmware.com, ankitja@vmware.com,
 bordoloih@vmware.com, keerthanak@vmware.com, blamoreaux@vmware.com,
 namit@vmware.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>, Lewis Caroll
 <lewis.carroll@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Juergen
 Gross <jgross@suse.com>, x86@kernel.org, VMware PV-Drivers Reviewers
 <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
Message-ID: <20230120163734.63e62444@imammedo.users.ipa.redhat.com>
In-Reply-To: <ecb9a22e-fd6e-67f0-d916-ad16033fc13c@csail.mit.edu>
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
	<20230116155526.05d37ff9@imammedo.users.ipa.redhat.com>
	<87bkmui5z4.ffs@tglx>
	<ecb9a22e-fd6e-67f0-d916-ad16033fc13c@csail.mit.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jan 2023 05:55:11 -0800
"Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:

> Hi Igor and Thomas,
> 
> Thank you for your review!
> 
> On 1/19/23 1:12 PM, Thomas Gleixner wrote:
> > On Mon, Jan 16 2023 at 15:55, Igor Mammedov wrote:  
> >> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:  
> >>> Fix this by preventing the use of mwait idle state in the vCPU offline
> >>> play_dead() path for any hypervisor, even if mwait support is
> >>> available.  
> >>
> >> if mwait is enabled, it's very likely guest to have cpuidle
> >> enabled and using the same mwait as well. So exiting early from
> >>  mwait_play_dead(), might just punt workflow down:
> >>   native_play_dead()
> >>         ...
> >>         mwait_play_dead();
> >>         if (cpuidle_play_dead())   <- possible mwait here                                              
> >>                 hlt_play_dead(); 
> >>
> >> and it will end up in mwait again and only if that fails
> >> it will go HLT route and maybe transition to VMM.  
> > 
> > Good point.
> >   
> >> Instead of workaround on guest side,
> >> shouldn't hypervisor force VMEXIT on being uplugged vCPU when it's
> >> actually hot-unplugging vCPU? (ex: QEMU kicks vCPU out from guest
> >> context when it is removing vCPU, among other things)  
> > 
> > For a pure guest side CPU unplug operation:
> > 
> >     guest$ echo 0 >/sys/devices/system/cpu/cpu$N/online
> > 
> > the hypervisor is not involved at all. The vCPU is not removed in that
> > case.
> >   
> 
> Agreed, and this is indeed the scenario I was targeting with this patch,
> as opposed to vCPU removal from the host side. I'll add this clarification
> to the commit message.

commit message explicitly said:
"which prevents the hypervisor from running other vCPUs or workloads on the
corresponding pCPU."

and that implies unplug on hypervisor side as well.
Why? That's because when hypervisor exposes mwait to guest, it has to reserve/pin
a pCPU for each of present vCPUs. And you can safely run other VMs/workloads
on that pCPU only after it's not possible for it to be reused by VM where
it was used originally.

Now consider following worst (and most likely) case without unplug
on hypervisor side:

 1. vm1mwait: pin pCPU2 to vCPU2
 2. vm1mwait: guest$ echo 0 >/sys/devices/system/cpu/cpu2/online
        -> HLT -> VMEXIT
 --
 3. vm2mwait: pin pCPU2 to vCPUx and start VM
 4. vm2mwait: guest OS onlines Vcpu and starts using it incl.
       going into idle=>mwait state
 --
 5. vm1mwait: it still thinks that vCPU is present it can rightfully do:
       guest$ echo 1 >/sys/devices/system/cpu/cpu2/online
 --              
 6.1 best case vm1mwait online fails after timeout
 6.2 worse case: vm2mwait does VMEXIT on vCPUx around time-frame when
     vm1mwait onlines vCPU2, the online may succeed and then vm2mwait's
     vCPUx will be stuck (possibly indefinitely) until for some reason
     VMEXIT happens on vm1mwait's vCPU2 _and_ host decides to schedule
     vCPUx on pCPU2 which would make vm1mwait stuck on vCPU2.
So either way it's expected behavior.

And if there is no intention to unplug vCPU on hypervisor side,
then VMEXIT on play_dead is not really necessary (mwait is better
then HLT), since hypervisor can't safely reuse pCPU elsewhere and
VCPU goes into deep sleep within guest context.

PS:
The only case where making HLT/VMEXIT on play_dead might work out,
would be if new workload weren't pinned to the same pCPU nor
used mwait (i.e. host can migrate it elsewhere and schedule
vCPU2 back on pCPU2).


> > So to ensure that this ends up in HLT something like the below is
> > required.
> > 
> > Note, the removal of the comment after mwait_play_dead() is intentional
> > because the comment is completely bogus. Not having MWAIT is not a
> > failure. But that wants to be a seperate patch.
> >   
> 
> Sounds good, will do and post a new version.
> 
> Thank you!
> 
> Regards,
> Srivatsa
> VMware Photon OS
> 
> 
> > Thanks,
> > 
> >         tglx
> > ---        
> > diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> > index 55cad72715d9..3f1f20f71ec5 100644
> > --- a/arch/x86/kernel/smpboot.c
> > +++ b/arch/x86/kernel/smpboot.c
> > @@ -1833,7 +1833,10 @@ void native_play_dead(void)
> >  	play_dead_common();
> >  	tboot_shutdown(TB_SHUTDOWN_WFS);
> >  
> > -	mwait_play_dead();	/* Only returns on failure */
> > +	if (this_cpu_has(X86_FEATURE_HYPERVISOR))
> > +		hlt_play_dead();
> > +
> > +	mwait_play_dead();
> >  	if (cpuidle_play_dead())
> >  		hlt_play_dead();
> >  }
> > 
> > 
> >   
> >   
> 


