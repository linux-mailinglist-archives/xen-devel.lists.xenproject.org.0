Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5766675629
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 14:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481799.746933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrre-0003A8-D4; Fri, 20 Jan 2023 13:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481799.746933; Fri, 20 Jan 2023 13:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIrre-00037h-A7; Fri, 20 Jan 2023 13:55:30 +0000
Received: by outflank-mailman (input) for mailman id 481799;
 Fri, 20 Jan 2023 13:55:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6fY=5R=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pIrrc-00037b-Au
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 13:55:28 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 167c467d-98ca-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 14:55:25 +0100 (CET)
Received: from [198.134.98.50] (helo=srivatsab3MD6R.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pIrrV-00Fo3V-LQ;
 Fri, 20 Jan 2023 08:55:21 -0500
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
X-Inumbo-ID: 167c467d-98ca-11ed-91b6-6bf2151ebd3b
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
To: Thomas Gleixner <tglx@linutronix.de>, Igor Mammedov <imammedo@redhat.com>
Cc: linux-kernel@vger.kernel.org, amakhalov@vmware.com, ganb@vmware.com,
 ankitja@vmware.com, bordoloih@vmware.com, keerthanak@vmware.com,
 blamoreaux@vmware.com, namit@vmware.com,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>,
 Lewis Caroll <lewis.carroll@amd.com>, Tom Lendacky
 <thomas.lendacky@amd.com>, Juergen Gross <jgross@suse.com>, x86@kernel.org,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
 <20230116155526.05d37ff9@imammedo.users.ipa.redhat.com> <87bkmui5z4.ffs@tglx>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <ecb9a22e-fd6e-67f0-d916-ad16033fc13c@csail.mit.edu>
Date: Fri, 20 Jan 2023 05:55:11 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87bkmui5z4.ffs@tglx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hi Igor and Thomas,

Thank you for your review!

On 1/19/23 1:12 PM, Thomas Gleixner wrote:
> On Mon, Jan 16 2023 at 15:55, Igor Mammedov wrote:
>> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
>>> Fix this by preventing the use of mwait idle state in the vCPU offline
>>> play_dead() path for any hypervisor, even if mwait support is
>>> available.
>>
>> if mwait is enabled, it's very likely guest to have cpuidle
>> enabled and using the same mwait as well. So exiting early from
>>  mwait_play_dead(), might just punt workflow down:
>>   native_play_dead()
>>         ...
>>         mwait_play_dead();
>>         if (cpuidle_play_dead())   <- possible mwait here                                              
>>                 hlt_play_dead(); 
>>
>> and it will end up in mwait again and only if that fails
>> it will go HLT route and maybe transition to VMM.
> 
> Good point.
> 
>> Instead of workaround on guest side,
>> shouldn't hypervisor force VMEXIT on being uplugged vCPU when it's
>> actually hot-unplugging vCPU? (ex: QEMU kicks vCPU out from guest
>> context when it is removing vCPU, among other things)
> 
> For a pure guest side CPU unplug operation:
> 
>     guest$ echo 0 >/sys/devices/system/cpu/cpu$N/online
> 
> the hypervisor is not involved at all. The vCPU is not removed in that
> case.
> 

Agreed, and this is indeed the scenario I was targeting with this patch,
as opposed to vCPU removal from the host side. I'll add this clarification
to the commit message.

> So to ensure that this ends up in HLT something like the below is
> required.
> 
> Note, the removal of the comment after mwait_play_dead() is intentional
> because the comment is completely bogus. Not having MWAIT is not a
> failure. But that wants to be a seperate patch.
> 

Sounds good, will do and post a new version.

Thank you!

Regards,
Srivatsa
VMware Photon OS


> Thanks,
> 
>         tglx
> ---        
> diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
> index 55cad72715d9..3f1f20f71ec5 100644
> --- a/arch/x86/kernel/smpboot.c
> +++ b/arch/x86/kernel/smpboot.c
> @@ -1833,7 +1833,10 @@ void native_play_dead(void)
>  	play_dead_common();
>  	tboot_shutdown(TB_SHUTDOWN_WFS);
>  
> -	mwait_play_dead();	/* Only returns on failure */
> +	if (this_cpu_has(X86_FEATURE_HYPERVISOR))
> +		hlt_play_dead();
> +
> +	mwait_play_dead();
>  	if (cpuidle_play_dead())
>  		hlt_play_dead();
>  }
> 
> 
>   
> 

