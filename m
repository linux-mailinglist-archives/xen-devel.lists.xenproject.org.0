Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CF196DB5
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 15:41:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIY7Y-00034n-QY; Sun, 29 Mar 2020 13:37:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jlgP=5O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIY7X-00034i-Oc
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 13:36:59 +0000
X-Inumbo-ID: 5d0a398a-71c2-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d0a398a-71c2-11ea-92cf-bc764e2007e4;
 Sun, 29 Mar 2020 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=A1y5lW2yV7A2r5T7CPvwdA1Rx46AtoezAi0zBGRIk3A=; b=GqyUGp5y5DISZHis2crEVE/Fzg
 J7iZEqqihW6Lr50+c21SQ7Z1bh+J6S6y1WLKX1NXMFmiXJM08jBDxOEGcl0UGDEgFeDJfhNp3dE0r
 2sMgnRKVmur+0+aNfDAb3zV8iHhc9BuRAn/m6pwEWgGNp5DaviUeLZByp9idB+EIlegU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIY7T-0003Zk-5i; Sun, 29 Mar 2020 13:36:55 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIY7S-0001Fa-S0; Sun, 29 Mar 2020 13:36:55 +0000
Date: Sun, 29 Mar 2020 14:36:51 +0100
From: Wei Liu <wl@xen.org>
To: Simran Singhal <singhalsimran0@gmail.com>
Message-ID: <20200329133651.yra3nesdqrwwgbte@debian>
References: <20200329045512.GA28203@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329045512.GA28203@simran-Inspiron-5558>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
 pointer
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
> Assignment to a typed pointer is sufficient in C.
> No cast is needed.
> 
> Also, changed some u64/u32 to uint64_t/uint32_t.
> 
> Signed-off-by: Simran Singhal <singhalsimran0@gmail.com>
> ---
> Changes in v2:
> 	- Took the chance to change some uintX to uintX_t.
> 
>  xen/arch/x86/acpi/cpufreq/powernow.c |  2 +-
>  xen/arch/x86/cpu/vpmu.c              |  2 +-
>  xen/arch/x86/hpet.c                  |  2 +-
>  xen/arch/x86/hvm/save.c              |  2 +-
>  xen/arch/x86/hvm/vmx/vvmx.c          | 12 ++++++------
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> index 3cf9c6cd05..f620bebc7e 100644
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -58,7 +58,7 @@ static void transition_pstate(void *pstate)
>  
>  static void update_cpb(void *data)
>  {
> -    struct cpufreq_policy *policy = (struct cpufreq_policy *)data;
> +    struct cpufreq_policy *policy = data;
>  
>      if (policy->turbo != CPUFREQ_TURBO_UNSUPPORTED) {
>          uint64_t msr_content;
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index e50d478d23..1ed39ef03f 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -337,7 +337,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs)
>  
>  static void vpmu_save_force(void *arg)
>  {
> -    struct vcpu *v = (struct vcpu *)arg;
> +    struct vcpu *v = arg;
>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
>  
>      if ( !vpmu_is_set(vpmu, VPMU_CONTEXT_LOADED) )
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index 86929b9ba1..c46e7cf4ee 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -215,7 +215,7 @@ again:
>  static void hpet_interrupt_handler(int irq, void *data,
>          struct cpu_user_regs *regs)
>  {
> -    struct hpet_event_channel *ch = (struct hpet_event_channel *)data;
> +    struct hpet_event_channel *ch = data;
>  
>      this_cpu(irq_count)--;
>  
> diff --git a/xen/arch/x86/hvm/save.c b/xen/arch/x86/hvm/save.c
> index 0fc59d3487..a2c56fbc1e 100644
> --- a/xen/arch/x86/hvm/save.c
> +++ b/xen/arch/x86/hvm/save.c
> @@ -417,7 +417,7 @@ void _hvm_read_entry(struct hvm_domain_context *h, void *dest,
>      memcpy(dest, &h->data[h->cur], d->length);
>  
>      if ( d->length < dest_len )
> -        memset((char *)dest + d->length, 0, dest_len - d->length);
> +        memset(dest + d->length, 0, dest_len - d->length);

I believe you shouldn't drop the cast here either because dest is of
type void*.

Although the calculation in the end is the same (void* considered of
size 1), I would still keep the cast such that the semantics is correct.

Wei.

