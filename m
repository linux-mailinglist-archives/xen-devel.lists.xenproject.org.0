Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B8675CD5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 19:36:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482088.747423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIwF4-0007rj-Cr; Fri, 20 Jan 2023 18:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482088.747423; Fri, 20 Jan 2023 18:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIwF4-0007pR-A6; Fri, 20 Jan 2023 18:35:58 +0000
Received: by outflank-mailman (input) for mailman id 482088;
 Fri, 20 Jan 2023 18:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3+m8=5R=google.com=seanjc@srs-se1.protection.inumbo.net>)
 id 1pIwF3-0007pL-0Y
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 18:35:57 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45651643-98f1-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 19:35:54 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id jm10so6043229plb.13
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 10:35:54 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 y9-20020a17090aca8900b0022bb3ee9b68sm816173pjt.13.2023.01.20.10.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 10:35:52 -0800 (PST)
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
X-Inumbo-ID: 45651643-98f1-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=okolDEB21Y0jblKM4zeN9TyhMCVMpN2TkJfDtRniBvc=;
        b=HkY8uYC3eaoxfG+CDtPspZfD/eX0Nq+DRBL/w/lbBPAVctXPlKO27GnPIwXfthk5N9
         VC7gyEcJ6u4nAFPLBZZtLuaIrW5eLQ7pRUIMsQ0P7IH/vAwrMVeY6O0eq5y8N9gtXD71
         MsB/8V0TvAjpRoA/f7mCK/eJ8L5cCpz/8ba/KSvwKSwa6zBYdMvsYnc3fycaiKzhvXu0
         bdjb2uPAa1zIysmYxuisWAZGW6U9LNAlN4IJnA8+tzSANClzdAuibHS3CeaFv6CpylZE
         liAoGaxEFIkOokZ7ibDIQSN4J2us6Ws11V6wPdyXS4f5x0ophRHfbRwS5//CQJMGSnxo
         NK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okolDEB21Y0jblKM4zeN9TyhMCVMpN2TkJfDtRniBvc=;
        b=FSP0sl6hTSp7P/3YVyKxEyFeNBvWBjc9ZhXXEy4sbrOaSFBQaMXWjnMrIxqi+8kDy9
         9nplI4K51MLUPWdRH+1ZqbwUQqrxP8R04UFcrb9BSA4/PEF5UPiS8U3dgeutT8l67faS
         rvqjvHWPxxxW/hz5sqJjNtIh9247CWvNK5eJJq88ZA2/FGcvrIuGB2+ce9TwLY2A5wmk
         1UmYEUaWHeFmhZ1wLDwl96CtUTZYGRJx27kCVqYHd0+YeFL0a6/BlrViUGKZWsipMZCi
         MuIIv/dDdcME26P8dRiuBxuhZ7EWrqQJxURl6FP5qL0vt8Ai+St8s18CCNqwcdaChcsp
         IRSQ==
X-Gm-Message-State: AFqh2krqg6RoXuSfnhkj2iz2pIx+n0jZC9iNaM5ido5ZduebHzCUoB1H
	tlU+3pJcQcE9lg6tXJCCzeXSiw==
X-Google-Smtp-Source: AMrXdXtygWR/fMhpmxei/j385EDCB6XPa4vZRiEc+kaRf3Blc1If9RpQwQ0WRTDgbKj1ut4JY7mfcQ==
X-Received: by 2002:a17:90a:c985:b0:219:f970:5119 with SMTP id w5-20020a17090ac98500b00219f9705119mr297717pjt.1.1674239752856;
        Fri, 20 Jan 2023 10:35:52 -0800 (PST)
Date: Fri, 20 Jan 2023 18:35:48 +0000
From: Sean Christopherson <seanjc@google.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	amakhalov@vmware.com, ganb@vmware.com, ankitja@vmware.com,
	bordoloih@vmware.com, keerthanak@vmware.com, blamoreaux@vmware.com,
	namit@vmware.com, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Wyes Karny <wyes.karny@amd.com>,
	Lewis Caroll <lewis.carroll@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Juergen Gross <jgross@suse.com>, x86@kernel.org,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
Message-ID: <Y8rfBBBicRMk+Hut@google.com>
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
 <20230116155526.05d37ff9@imammedo.users.ipa.redhat.com>
 <87bkmui5z4.ffs@tglx>
 <ecb9a22e-fd6e-67f0-d916-ad16033fc13c@csail.mit.edu>
 <20230120163734.63e62444@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120163734.63e62444@imammedo.users.ipa.redhat.com>

On Fri, Jan 20, 2023, Igor Mammedov wrote:
> On Fri, 20 Jan 2023 05:55:11 -0800
> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
> 
> > Hi Igor and Thomas,
> > 
> > Thank you for your review!
> > 
> > On 1/19/23 1:12 PM, Thomas Gleixner wrote:
> > > On Mon, Jan 16 2023 at 15:55, Igor Mammedov wrote:  
> > >> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:  
> > >>> Fix this by preventing the use of mwait idle state in the vCPU offline
> > >>> play_dead() path for any hypervisor, even if mwait support is
> > >>> available.  
> > >>
> > >> if mwait is enabled, it's very likely guest to have cpuidle
> > >> enabled and using the same mwait as well. So exiting early from
> > >>  mwait_play_dead(), might just punt workflow down:
> > >>   native_play_dead()
> > >>         ...
> > >>         mwait_play_dead();
> > >>         if (cpuidle_play_dead())   <- possible mwait here                                              
> > >>                 hlt_play_dead(); 
> > >>
> > >> and it will end up in mwait again and only if that fails
> > >> it will go HLT route and maybe transition to VMM.  
> > > 
> > > Good point.
> > >   
> > >> Instead of workaround on guest side,
> > >> shouldn't hypervisor force VMEXIT on being uplugged vCPU when it's
> > >> actually hot-unplugging vCPU? (ex: QEMU kicks vCPU out from guest
> > >> context when it is removing vCPU, among other things)  
> > > 
> > > For a pure guest side CPU unplug operation:
> > > 
> > >     guest$ echo 0 >/sys/devices/system/cpu/cpu$N/online
> > > 
> > > the hypervisor is not involved at all. The vCPU is not removed in that
> > > case.
> > >   
> > 
> > Agreed, and this is indeed the scenario I was targeting with this patch,
> > as opposed to vCPU removal from the host side. I'll add this clarification
> > to the commit message.

Forcing HLT doesn't solve anything, it's perfectly legal to passthrough HLT.  I
guarantee there are use cases that passthrough HLT but _not_ MONITOR/MWAIT, and
that passthrough all of them.

> commit message explicitly said:
> "which prevents the hypervisor from running other vCPUs or workloads on the
> corresponding pCPU."
> 
> and that implies unplug on hypervisor side as well.
> Why? That's because when hypervisor exposes mwait to guest, it has to reserve/pin
> a pCPU for each of present vCPUs. And you can safely run other VMs/workloads
> on that pCPU only after it's not possible for it to be reused by VM where
> it was used originally.

Pinning isn't strictly required from a safety perspective.  The latency of context
switching may suffer due to wake times, but preempting a vCPU that it's C1 (or
deeper) won't cause functional problems.   Passing through an entire socket
(or whatever scope triggers extra fun) might be a different story, but pinning
isn't strictly required.

That said, I 100% agree that this is expected behavior and not a bug.  Letting the
guest execute MWAIT or HLT means the host won't have perfect visibility into guest
activity state.

Oversubscribing a pCPU and exposing MWAIT and/or HLT to vCPUs is generally not done
precisely because the guest will always appear busy without extra effort on the
host.  E.g. KVM requires an explicit opt-in from userspace to expose MWAIT and/or
HLT.

If someone really wants to effeciently oversubscribe pCPUs and passthrough MWAIT,
then their best option is probably to have a paravirt interface so that the guest
can tell the host its offlining a vCPU.  Barring that the host could inspect the
guest when preempting a vCPU to try and guesstimate how much work the vCPU is
actually doing in order to make better scheduling decisions.

> Now consider following worst (and most likely) case without unplug
> on hypervisor side:
> 
>  1. vm1mwait: pin pCPU2 to vCPU2
>  2. vm1mwait: guest$ echo 0 >/sys/devices/system/cpu/cpu2/online
>         -> HLT -> VMEXIT
>  --
>  3. vm2mwait: pin pCPU2 to vCPUx and start VM
>  4. vm2mwait: guest OS onlines Vcpu and starts using it incl.
>        going into idle=>mwait state
>  --
>  5. vm1mwait: it still thinks that vCPU is present it can rightfully do:
>        guest$ echo 1 >/sys/devices/system/cpu/cpu2/online
>  --              
>  6.1 best case vm1mwait online fails after timeout
>  6.2 worse case: vm2mwait does VMEXIT on vCPUx around time-frame when
>      vm1mwait onlines vCPU2, the online may succeed and then vm2mwait's
>      vCPUx will be stuck (possibly indefinitely) until for some reason
>      VMEXIT happens on vm1mwait's vCPU2 _and_ host decides to schedule
>      vCPUx on pCPU2 which would make vm1mwait stuck on vCPU2.
> So either way it's expected behavior.
> 
> And if there is no intention to unplug vCPU on hypervisor side,
> then VMEXIT on play_dead is not really necessary (mwait is better
> then HLT), since hypervisor can't safely reuse pCPU elsewhere and
> VCPU goes into deep sleep within guest context.
> 
> PS:
> The only case where making HLT/VMEXIT on play_dead might work out,
> would be if new workload weren't pinned to the same pCPU nor
> used mwait (i.e. host can migrate it elsewhere and schedule
> vCPU2 back on pCPU2).

