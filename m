Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1FBA5D14A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 21:59:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909271.1316246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6hG-0005MF-TP; Tue, 11 Mar 2025 20:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909271.1316246; Tue, 11 Mar 2025 20:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6hG-0005JA-Qn; Tue, 11 Mar 2025 20:59:30 +0000
Received: by outflank-mailman (input) for mailman id 909271;
 Tue, 11 Mar 2025 20:59:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts6hE-0005J4-Vq
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:59:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6hE-00Eiub-2G;
 Tue, 11 Mar 2025 20:59:28 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6hE-004nch-0F;
 Tue, 11 Mar 2025 20:59:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ytqT0XbvtxFADS1Rg3eUrTjTyGQ2eIkAHFMOiAgmQcA=; b=0KdDlNEVbVgEsvoF8UukEZ92wo
	NPhvTVmsrN8Pyxx7aGi3vyIFO8RMtSGNpEIUfNQirpqJghJoR/nRPFhHLcmOIep3BzT6M6pvM2Ma0
	3tOVrg9SjmTWJo8G/yPqRGK2i0WkOWZCr3F7DBdNMiLSTkgsmWsFqJF7paPdzPdYycpo=;
Message-ID: <c5ccb703-45eb-4fb1-842c-75317354afad@xen.org>
Date: Tue, 11 Mar 2025 20:59:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] xen/percpu: don't initialize percpu on resume
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>, Juergen Gross <jgross@suse.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e44b56f18fe5e1c7f1d6cd9d33ba84cf0e26b440.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Juergen)

Hi Mykola,

On 05/03/2025 09:11, Mykola Kvach wrote:
> Invocation of the CPU_UP_PREPARE notification
> on ARM64 during resume causes a crash:
> 
> (XEN) [  315.807606] Error bringing CPU1 up: -16
> (XEN) [  315.811926] Xen BUG at common/cpu.c:258
> [...]
> (XEN) [  316.142765] Xen call trace:
> (XEN) [  316.146048]    [<00000a0000202264>] enable_nonboot_cpus+0x128/0x1ac (PC)
> (XEN) [  316.153219]    [<00000a000020225c>] enable_nonboot_cpus+0x120/0x1ac (LR)
> (XEN) [  316.160391]    [<00000a0000278180>] suspend.c#system_suspend+0x4c/0x1a0
> (XEN) [  316.167476]    [<00000a0000206b70>] domain.c#continue_hypercall_tasklet_handler+0x54/0xd0
> (XEN) [  316.176117]    [<00000a0000226538>] tasklet.c#do_tasklet_work+0xb8/0x100
> (XEN) [  316.183288]    [<00000a0000226920>] do_tasklet+0x68/0xb0
> (XEN) [  316.189077]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
> (XEN) [  316.195644]    [<00000a0000277638>] shutdown.c#halt_this_cpu+0/0x14
> (XEN) [  316.202383]    [<0000000000000008>] 0000000000000008
> 
> Freeing per-CPU areas and setting __per_cpu_offset to INVALID_PERCPU_AREA
> only occur when !park_offline_cpus and system_state is not SYS_STATE_suspend.
> On ARM64, park_offline_cpus is always false, so setting __per_cpu_offset to
> INVALID_PERCPU_AREA depends solely on the system state.
> 
> If the system is suspended, this area is not freed, and during resume, an error
> occurs in init_percpu_area, causing a crash because INVALID_PERCPU_AREA is not
> set and park_offline_cpus remains 0:
> 
>      if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>          return park_offline_cpus ? 0 : -EBUSY;
> 
> It appears that the same crash can occur on x86 if park_offline_cpus is set
> to 0 during Xen suspend.

I am rather confused. Looking at the x86 code, it seems 
park_offline_cpus is cleared for AMD platforms. So are you saying the 
suspend/resume doesn't work on AMD?

I am also CCing Juergen because he originally add the check to the 
system_state in 2019. Maybe he will remember why CPU_UP_PREPARE was not 
changed.

> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> These changes were introduced in V2 inside
> "xen: don't free percpu areas during suspend" patch.
> ---
>   xen/common/percpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/percpu.c b/xen/common/percpu.c
> index e4e8b7bcab..83dca7edd6 100644
> --- a/xen/common/percpu.c
> +++ b/xen/common/percpu.c
> @@ -74,7 +74,8 @@ static int cf_check cpu_percpu_callback(
>       switch ( action )
>       {
>       case CPU_UP_PREPARE:
> -        rc = init_percpu_area(cpu);
> +        if ( system_state != SYS_STATE_resume )
> +            rc = init_percpu_area(cpu);
>           break;
>   
>       case CPU_UP_CANCELED:

Cheers,

-- 
Julien Grall


