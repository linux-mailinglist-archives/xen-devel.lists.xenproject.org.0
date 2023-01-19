Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E7674417
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 22:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481338.746151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIcD6-0002kS-LJ; Thu, 19 Jan 2023 21:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481338.746151; Thu, 19 Jan 2023 21:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIcD6-0002ha-IT; Thu, 19 Jan 2023 21:12:36 +0000
Received: by outflank-mailman (input) for mailman id 481338;
 Thu, 19 Jan 2023 21:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4g95=5Q=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pIcD4-0002Ux-7s
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 21:12:34 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd594469-983d-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 22:12:33 +0100 (CET)
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
X-Inumbo-ID: fd594469-983d-11ed-91b6-6bf2151ebd3b
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1674162752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rRUXLP0p0WQ+Qd4xVEuRKMl25ggID9YoYcEY3DCIiik=;
	b=mdQ7CD0wRJvfaZDOr0f82Dc4967iwC75I1+s5lDCu1fHHwtrp+IBba8UPSoQ/va3j4Qar2
	ATGu2nZLLKa0vJ8CheBHLvt0I89xHSG06ZUusQKDPY104va7qqUjwYfiuIUukk+LaqO7Gu
	N+aHnCbtSnW+e8Smx0L+A2DiKy1AOSyLQ5QGRIN4vgJHVE1sRkt9jT/0k9LahiDV7T+AiK
	jKmIL8dmtVDNgeoMh+UAXcZ37mv49o4hNCz9KdPCGAyDUP9ZfpqnymsWZ0f3dG4LxhFiyw
	RTndkgdz2BKS/FhRmtxFB9hP9YbenuT2IOAVALIMh4inh4bZRqxisS45FivGfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1674162752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rRUXLP0p0WQ+Qd4xVEuRKMl25ggID9YoYcEY3DCIiik=;
	b=0BJ5w/p0x778LsQ1MznxzGrIdB3OE1QGABAUfN3vpOmJUgdDINUgQsr9tLqZGxSzWuC+ct
	ivl26is4VR39BBBw==
To: Igor Mammedov <imammedo@redhat.com>, "Srivatsa S. Bhat"
 <srivatsa@csail.mit.edu>
Cc: linux-kernel@vger.kernel.org, amakhalov@vmware.com, ganb@vmware.com,
 ankitja@vmware.com, bordoloih@vmware.com, keerthanak@vmware.com,
 blamoreaux@vmware.com, namit@vmware.com, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, Wyes Karny <wyes.karny@amd.com>, Lewis Caroll
 <lewis.carroll@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Juergen
 Gross <jgross@suse.com>, x86@kernel.org, VMware PV-Drivers Reviewers
 <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/hotplug: Do not put offline vCPUs in mwait idle
 state
In-Reply-To: <20230116155526.05d37ff9@imammedo.users.ipa.redhat.com>
References: <20230116060134.80259-1-srivatsa@csail.mit.edu>
 <20230116155526.05d37ff9@imammedo.users.ipa.redhat.com>
Date: Thu, 19 Jan 2023 22:12:31 +0100
Message-ID: <87bkmui5z4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 16 2023 at 15:55, Igor Mammedov wrote:
> "Srivatsa S. Bhat" <srivatsa@csail.mit.edu> wrote:
>> Fix this by preventing the use of mwait idle state in the vCPU offline
>> play_dead() path for any hypervisor, even if mwait support is
>> available.
>
> if mwait is enabled, it's very likely guest to have cpuidle
> enabled and using the same mwait as well. So exiting early from
>  mwait_play_dead(), might just punt workflow down:
>   native_play_dead()
>         ...
>         mwait_play_dead();
>         if (cpuidle_play_dead())   <- possible mwait here                                              
>                 hlt_play_dead(); 
>
> and it will end up in mwait again and only if that fails
> it will go HLT route and maybe transition to VMM.

Good point.

> Instead of workaround on guest side,
> shouldn't hypervisor force VMEXIT on being uplugged vCPU when it's
> actually hot-unplugging vCPU? (ex: QEMU kicks vCPU out from guest
> context when it is removing vCPU, among other things)

For a pure guest side CPU unplug operation:

    guest$ echo 0 >/sys/devices/system/cpu/cpu$N/online

the hypervisor is not involved at all. The vCPU is not removed in that
case.

So to ensure that this ends up in HLT something like the below is
required.

Note, the removal of the comment after mwait_play_dead() is intentional
because the comment is completely bogus. Not having MWAIT is not a
failure. But that wants to be a seperate patch.

Thanks,

        tglx
---        
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 55cad72715d9..3f1f20f71ec5 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1833,7 +1833,10 @@ void native_play_dead(void)
 	play_dead_common();
 	tboot_shutdown(TB_SHUTDOWN_WFS);
 
-	mwait_play_dead();	/* Only returns on failure */
+	if (this_cpu_has(X86_FEATURE_HYPERVISOR))
+		hlt_play_dead();
+
+	mwait_play_dead();
 	if (cpuidle_play_dead())
 		hlt_play_dead();
 }


  

