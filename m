Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A9B010DD
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 03:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040114.1411570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua2eT-0007mh-9U; Fri, 11 Jul 2025 01:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040114.1411570; Fri, 11 Jul 2025 01:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua2eT-0007lG-6n; Fri, 11 Jul 2025 01:34:13 +0000
Received: by outflank-mailman (input) for mailman id 1040114;
 Fri, 11 Jul 2025 01:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LlY=ZY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ua2eR-0007lA-Rj
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 01:34:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23301a7f-5df7-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 03:34:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 35DC25C6E0A;
 Fri, 11 Jul 2025 01:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B390C4CEE3;
 Fri, 11 Jul 2025 01:34:05 +0000 (UTC)
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
X-Inumbo-ID: 23301a7f-5df7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752197646;
	bh=BCdQaX0PykRYotk6xeeYaRpNsCRexbaeC12xQ3JtWPs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jCs1bwK5kn91Kq4zGu/b8nhJN7DQk4gyOfmmJDAxS8z9b2dUNIsqDKDJYGHWFt9Kg
	 TnhN/BmyaPpNmMuwsNLU4O6lbImd66EINFY3osRf/SGF4Wtu59RsWx2PLDnR8BOuIK
	 JMuq5IeFMZFcRYkuj3WlULGJq1OXhw3Xx8B7X4rzSSZ62dkC1yGwkvfu3Y6j3QQ4th
	 mOPI85TAtSEYSXIbLVOs8+2aC12cxEt6Rp+YoH2rqUGTry8tYWSVz4Am1SloSIxDqr
	 P5AO3/T5iui+3tfaBM7KjJ4D3wGuSufJx8HR9BHIloYAYj+zmABRymG5AG/VcEYaFu
	 WOMiF0nhLHTuQ==
Date: Thu, 10 Jul 2025 18:34:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Xenia.Ragiadakou@amd.com, 
    alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org
Subject: Re: [PATCH v2 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
In-Reply-To: <5f6df28e-8f67-486d-b227-23b3d173b06d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2507101808040.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop> <20250708183238.3104638-1-stefano.stabellini@amd.com> <5f6df28e-8f67-486d-b227-23b3d173b06d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Jul 2025, Jan Beulich wrote:
> On 08.07.2025 20:32, Stefano Stabellini wrote:
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -2297,11 +2297,7 @@ static void cf_check time_calibration(void *unused)
> >      };
> >  
> >      if ( clocksource_is_tsc() )
> > -    {
> > -        local_irq_disable();
> > -        r.master_stime = read_platform_stime(&r.master_tsc_stamp);
> > -        local_irq_enable();
> > -    }
> > +        return;
> 
> Assuming the rendezvous can indeed be entirely skipped, I agree that there's
> no point calling read_platform_stime() here. Yet to yield a consistent
> result, more changes are then necessary imo:
> - as indicated before, the invocation of this function from
>   verify_tsc_reliability() when plt_tsc was chosen is then entirely
>   pointless,
> - time_calibration_nop_rendezvous() would then apparently want purging, not
>   the least to make clear that TIME_CALIBRATE_SOFTIRQ is never raised in
>   this mode (one of your goals after all, aiui),

Good suggestions.


> - the function being a timer handler, it would be preferable if the timer
>   wasn't ever activated in this mode (at which point rather than returning
>   early, the code above could simply be purged, maybe replaced by e.g. an
>   assertion),

I see your point about the timer not being activated in the first place.

But if we want to make the code more reliable we should keep the if
(clocksource_is_tsc()) return; in time_calibration. That way, in case of
mistakes elsewhere, still the desired behavior is obtained.

I'll add the changes to cpu_frequency_change and local_time_calibration.
I'll append an incremental patch to clarify my intent.


> - the above in particular requires dealing with cpu_frequency_change() (the
>   other of the two places where the timer is actually activated).
>
> Some care may be needed in all of this taking into consideration that the
> platform timer change to TSC happens late. Albeit commit f954a1bf5f74
> ("x86/time: change initiation of the calibration timer") has imo eliminated
> the main concern here.
> 
> As to skipping the rendezvous: Besides invoking the calibration softirq,
> time_calibration_nop_rendezvous() also updates the per-CPU cpu_calibration
> fields. There would thus need to be a pretty formal proof that calculations
> involving ->local_stime or ->local_tsc can't possibly degrade or even
> degenerate when they remain at their boot-time values. (As to
> ->master_stime, afaict the field simply isn't used at all in that mode,
> which is a fair part of the reason why the code change above is okay _if_
> the rendezvous itself can be eliminated. The justification for that could
> also do with extending some, considering that much of the involved code is
> pretty subtle.) Alternatively, if such a proof turned out impossible,
> another way of updating the fields every once in a while would need adding.

Do you mean a formal proof that the TSC is actually stable from a
hardware perspective? The software algorithm is the same no matter the
number of updates.


> Finally, what you do here isn't entirely reliable as to your apparent end
> goal: "clocksource=tsc" is respected only when tsc_check_reliability()
> completes with an acceptable outcome. There's certainly some variability in
> this across multiple runs, i.e. if things went extremely bad, once in blue
> moon you may end up with the TSC being rejected for use as platform timer.
 
That is interesting! One option is to change the code so that
clocksource=tsc is always respected. I have appended the change on top
of this patch. Please let me know if you have other suggestions.


diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index d72e640f72..d29266086d 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1877,7 +1877,7 @@ int cpu_frequency_change(u64 freq)
     update_vcpu_system_time(current);
 
     /* A full epoch should pass before we check for deviation. */
-    if ( smp_processor_id() == 0 )
+    if ( smp_processor_id() == 0 && !clocksource_is_tsc() )
     {
         set_timer(&calibration_timer, NOW() + EPOCH);
         platform_time_calibration();
@@ -2024,7 +2024,7 @@ static void cf_check local_time_calibration(void)
     update_vcpu_system_time(current);
 
  out:
-    if ( smp_processor_id() == 0 )
+    if ( smp_processor_id() == 0 && !clocksource_is_tsc() )
     {
         set_timer(&calibration_timer, NOW() + EPOCH);
         platform_time_calibration();
@@ -2271,22 +2271,6 @@ static void cf_check time_calibration_std_rendezvous(void *_r)
     time_calibration_rendezvous_tail(r, 0, rdtsc_ordered());
 }
 
-/*
- * Rendezvous function used when clocksource is TSC and
- * no CPU hotplug will be performed.
- */
-static void cf_check time_calibration_nop_rendezvous(void *rv)
-{
-    const struct calibration_rendezvous *r = rv;
-    struct cpu_time_stamp *c = &this_cpu(cpu_calibration);
-
-    c->local_tsc    = r->master_tsc_stamp;
-    c->local_stime  = r->master_stime;
-    c->master_stime = r->master_stime;
-
-    raise_softirq(TIME_CALIBRATE_SOFTIRQ);
-}
-
 static void (*time_calibration_rendezvous_fn)(void *) =
     time_calibration_std_rendezvous;
 
@@ -2488,7 +2472,7 @@ static int __init cf_check verify_tsc_reliability(void)
          * CPUs are booted.
          */
         tsc_check_reliability();
-        if ( tsc_max_warp )
+        if ( tsc_max_warp && strcmp(opt_clocksource, "tsc") )
         {
             printk("TSC warp detected, disabling TSC_RELIABLE\n");
             setup_clear_cpu_cap(X86_FEATURE_TSC_RELIABLE);
@@ -2506,21 +2490,12 @@ static int __init cf_check verify_tsc_reliability(void)
              */
             on_selected_cpus(&cpu_online_map, reset_percpu_time, NULL, 1);
 
-            /*
-             * We won't do CPU Hotplug and TSC clocksource is being used which
-             * means we have a reliable TSC, plus we don't sync with any other
-             * clocksource so no need for rendezvous.
-             */
-            time_calibration_rendezvous_fn = time_calibration_nop_rendezvous;
-
             /* Finish platform timer switch. */
             try_platform_timer_tail();
 
             printk("Switched to Platform timer %s TSC\n",
                    freq_string(plt_src.frequency));
 
-            time_calibration(NULL);
-
             return 0;
         }
     }

