Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB517EB790
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 21:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633205.987854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2zmW-0002cI-RA; Tue, 14 Nov 2023 20:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633205.987854; Tue, 14 Nov 2023 20:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2zmW-0002ad-OV; Tue, 14 Nov 2023 20:13:08 +0000
Received: by outflank-mailman (input) for mailman id 633205;
 Tue, 14 Nov 2023 20:13:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2zmU-0002aV-Cu
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 20:13:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2zmS-0006fj-I5; Tue, 14 Nov 2023 20:13:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2zmS-0002zc-Bx; Tue, 14 Nov 2023 20:13:04 +0000
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
	bh=Sqk5V+4oJqpprrMEolY+9CL2alOW27zmmnLGuOp8q6U=; b=RN0KlW60tJ0bVDvLtRLFICmdOY
	bs/Rfzm2eEjdHaaXhqxPGpCgIl7Ljc7+r1C8XJs+P777GmHSWlEDm0VCLwaRCnjxB2BjTjcv/wHbK
	KHH4QxZkh+cmsLPF9W/A+6bNwbhx/1nlRH+slli2Z8BVwvuONCyS+Tc+gVdt3jW3F9vo=;
Message-ID: <aeaf4e1a-6a6e-4af1-bd2e-f68ec3f12cd6@xen.org>
Date: Tue, 14 Nov 2023 20:13:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/9] x86: parallelize AP bring-up during boot
Content-Language: en-GB
To: Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krystian,

Thanks you for sending the series! Just posting some extra data point.

On 14/11/2023 17:49, Krystian Hebel wrote:
> Patch series available on this branch:
> https://github.com/TrenchBoot/xen/tree/smp_cleanup_upstreaming
> 
> This series makes AP bring-up parallel on x86. This reduces number of
> IPIs (and more importantly, delays between them) required to start all
> logical processors significantly.
> 
> In order to make it possible, some state variables that were global
> had to be made per-CPU. In most cases, accesses to those variables can
> be performed through helper macros, some of them existed before in a
> different form.
> 
> In addition to work required for parallel initialization, I've fixed
> issues in error path around `machine_restart()` that were discovered
> during implementation and testing.
> 
> CPU hotplug should not be affected, but I had no way of testing it.
> During wakeup from S3 APs are started one by one. It should be possible
> to enable parallel execution there as well, but I don't have a way of
> testing it as of now.
> 
> To measure the improvement, I added output lines (identical for before
> and after changes so there is no impact of printing over serial) just
> above and below `if ( !pv_shim )` block. `console_timestamps=raw` was
> used to get as accurate timestamp as possible, and average over 3 boots
> was taken into account for each measurement. The final improvement was
> calculated as (1 - after/before) * 100%, rounded to 0.01%. These are
> the results:
> 
> * Dell OptiPlex 9010 with Intel(R) Core(TM) i5-3470 CPU @ 3.20GHz
>    (4 cores, 4 threads): 48.83%
> * MSI PRO Z790-P with 13th Gen Intel(R) Core(TM) i5-13600K (14 cores,
>    20 threads, 6P+8E) `smt=on`: 36.16%
> * MSI PRO Z790-P with 13th Gen Intel(R) Core(TM) i5-13600K (14 cores,
>    20 threads, 6P+8E) `smt=off`: 0.25% (parking takes a lot of additional
>    time)
> * HP t630 Thin Client with AMD Embedded G-Series GX-420GI Radeon R7E
>    (4 cores, 4 threads): 68.00%

Your series reminded me some optimization we did at AWS in the SMP boot 
code. This hasn't yet been sent upstrema so I thought I would compare to 
your series to see if there are any differences.

Instead of adding support for parallel SMP boot, we decided to optimize 
some of the wait call (see diff below).

This was tested on a nested environment (KVM/QEMU) on c5 metal with 
x2apic disabled. The numbers are for bringing-up 95 CPUs:

   * Currently: 2s
   * With AWS change only: 300ms
   * With your change only: 100ms

So your approach is superior :). I see you are dropping the loop in 
smp_callin(). So the first hunk in the below diff is not necessary 
anymore. The second hunk probably still makes sense for CPU hotplug (and 
maybe S3 bring-up) even though it would only save 10ms. I will look to 
send the patch.

Diff:

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 3a1a659082c6..86fd5500e1ea 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -172,9 +172,9 @@ static void smp_callin(void)
      Dprintk("Waiting for CALLOUT.\n");
      for ( i = 0; cpu_state != CPU_STATE_CALLOUT; i++ )
      {
-        BUG_ON(i >= 200);
+        BUG_ON(i >= 200000);
          cpu_relax();
-        mdelay(10);
+        udelay(10);
      }

      /*
@@ -430,6 +430,10 @@ static int wakeup_secondary_cpu(int phys_apicid, 
unsigned long start_eip)
       * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
       */
      bool send_INIT = ap_boot_method != AP_BOOT_SKINIT;
+    bool modern_cpu = ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) &&
+                       (boot_cpu_data.x86 == 6)) ||
+                      ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD) &&
+                       (boot_cpu_data.x86 >= 0xF));

      /*
       * Some versions of tboot might be able to handle the entire wake 
sequence
@@ -464,7 +468,15 @@ static int wakeup_secondary_cpu(int phys_apicid, 
unsigned long start_eip)
                  send_status = apic_read(APIC_ICR) & APIC_ICR_BUSY;
              } while ( send_status && (timeout++ < 1000) );

-            mdelay(10);
+            /*
+             * The Multiprocessor Specification 1.4 (1997) example code 
suggests
+             * that there should be a 10ms delay between the BSP 
asserting INIT
+             * and de-asserting INIT, when starting a remote processor.
+             * But that slows boot and resume on modern processors, 
which include
+             * many cores and don't require that delay.
+             */
+            if ( !modern_cpu )
+                mdelay(10);

              Dprintk("Deasserting INIT.\n");

Cheers,

-- 
Julien Grall

