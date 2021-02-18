Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43E31E805
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 10:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86511.162488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCfhM-0003ec-0n; Thu, 18 Feb 2021 09:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86511.162488; Thu, 18 Feb 2021 09:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCfhL-0003eD-TG; Thu, 18 Feb 2021 09:34:11 +0000
Received: by outflank-mailman (input) for mailman id 86511;
 Thu, 18 Feb 2021 09:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UbXw=HU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lCfhK-0003e8-K8
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 09:34:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2c6039f-a2b0-4678-bdf3-3ba294f18306;
 Thu, 18 Feb 2021 09:34:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EDE3FACE5;
 Thu, 18 Feb 2021 09:34:07 +0000 (UTC)
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
X-Inumbo-ID: a2c6039f-a2b0-4678-bdf3-3ba294f18306
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613640848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v0jfYtZwVgb7PTear6gYtmpMP/Ium18ZC+jrWab3JrI=;
	b=n6KHcmY2eophbPa/suL1PvzEhsWTgcW222t1pJL4IaA+pS7fDQMCTTRkSrXvSMz7MXD5VP
	l2+NcwUgKKr0qQWKd2DogRof6zeoA1/Vy+XgGOEc0iVc64jyUGcFpmkDo9q1aarLgXgeiW
	TzIFTQAfnrlPuMoW9iEKMQ51N0tGX0Y=
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f8b7cd40-7f58-ac64-e2c2-a2a4c9cc90ce@suse.com>
Date: Thu, 18 Feb 2021 10:34:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GNJRm2pyggWu40eK3nt8thzH0tNlKfd4Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GNJRm2pyggWu40eK3nt8thzH0tNlKfd4Y
Content-Type: multipart/mixed; boundary="C9gK4prqazbYKcbofgeDVBEzotxWg6ffV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Message-ID: <f8b7cd40-7f58-ac64-e2c2-a2a4c9cc90ce@suse.com>
Subject: Re: Linux DomU freezes and dies under heavy memory shuffling
References: <CAMmSBy-_UOK6DTrwGNOw8Y59Muv8H8wxmsc4-BXcv3N_u5USBA@mail.gmail.com>
 <alpine.DEB.2.21.2102161232310.3234@sstabellini-ThinkPad-T480s>
 <45b8ef4c-6d36-e91b-ca1a-a82eeca5aaf5@suse.com>
 <CAMmSBy8k0Y50Xkq9Kq+oES27gsoG==T++Hz9SiR0gDgAKnpvRA@mail.gmail.com>
 <49344e8d-5518-68c6-a417-68522a915e72@suse.com>
 <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>
In-Reply-To: <CAMmSBy-3y+Y3nhyf1uGN6KB_wNLVAqYRfc0hpkdKHtvdGSM5wg@mail.gmail.com>

--C9gK4prqazbYKcbofgeDVBEzotxWg6ffV
Content-Type: multipart/mixed;
 boundary="------------457068B34F1ADD00FE05D41D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------457068B34F1ADD00FE05D41D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.02.21 06:21, Roman Shaposhnik wrote:
> On Wed, Feb 17, 2021 at 12:29 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
=20
> <mailto:jgross@suse.com>> wrote:
>=20
>     On 17.02.21 09:12, Roman Shaposhnik wrote:
>      > Hi J=C3=BCrgen, thanks for taking a look at this. A few comments=
 below:
>      >
>      > On Tue, Feb 16, 2021 at 10:47 PM J=C3=BCrgen Gro=C3=9F <jgross@s=
use.com
>     <mailto:jgross@suse.com>> wrote:
>      >>
>      >> On 16.02.21 21:34, Stefano Stabellini wrote:
>      >>> + x86 maintainers
>      >>>
>      >>> It looks like the tlbflush is getting stuck?
>      >>
>      >> I have seen this case multiple times on customer systems now, b=
ut
>      >> reproducing it reliably seems to be very hard.
>      >
>      > It is reliably reproducible under my workload but it take a long=
 time
>      > (~3 days of the workload running in the lab).
>=20
>     This is by far the best reproduction rate I have seen up to now.
>=20
>     The next best reproducer seems to be a huge installation with sever=
al
>     hundred hosts and thousands of VMs with about 1 crash each week.
>=20
>      >
>      >> I suspected fifo events to be blamed, but just yesterday I've b=
een
>      >> informed of another case with fifo events disabled in the guest=
=2E
>      >>
>      >> One common pattern seems to be that up to now I have seen this
>     effect
>      >> only on systems with Intel Gold cpus. Can it be confirmed to be=
 true
>      >> in this case, too?
>      >
>      > I am pretty sure mine isn't -- I can get you full CPU specs if
>     that's useful.
>=20
>     Just the output of "grep model /proc/cpuinfo" should be enough.
>=20
>=20
> processor: 3
> vendor_id: GenuineIntel
> cpu family: 6
> model: 77
> model name: Intel(R) Atom(TM) CPU =C2=A0C2550 =C2=A0@ 2.40GHz
> stepping: 8
> microcode: 0x12d
> cpu MHz: 1200.070
> cache size: 1024 KB
> physical id: 0
> siblings: 4
> core id: 3
> cpu cores: 4
> apicid: 6
> initial apicid: 6
> fpu: yes
> fpu_exception: yes
> cpuid level: 11
> wp: yes
> flags: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pa=
t=20
> pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdtscp=
=20
> lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology=20
> nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx es=
t=20
> tm2 ssse3 cx16 xtpr pdcm sse4_1 sse4_2 movbe popcnt tsc_deadline_timer =

> aes rdrand lahf_lm 3dnowprefetch cpuid_fault epb pti ibrs ibpb stibp=20
> tpr_shadow vnmi flexpriority ept vpid tsc_adjust smep erms dtherm ida=20
> arat md_clear
> vmx flags: vnmi preemption_timer invvpid ept_x_only flexpriority=20
> tsc_offset vtpr mtf vapic ept vpid unrestricted_guest
> bugs: cpu_meltdown spectre_v1 spectre_v2 mds msbds_only
> bogomips: 4800.19
> clflush size: 64
> cache_alignment: 64
> address sizes: 36 bits physical, 48 bits virtual
> power management:
>=20
>      >
>      >> In case anybody has a reproducer (either in a guest or dom0) wi=
th a
>      >> setup where a diagnostic kernel can be used, I'd be _very_
>     interested!
>      >
>      > I can easily add things to Dom0 and DomU. Whether that will
>     disrupt the
>      > experiment is, of course, another matter. Still please let me
>     know what
>      > would be helpful to do.
>=20
>     Is there a chance to switch to an upstream kernel in the guest? I'd=
 like
>     to add some diagnostic code to the kernel and creating the patches =
will
>     be easier this way.
>=20
>=20
> That's a bit tough -- the VM is based on stock Ubuntu and if I upgrade =

> the kernel I'll have fiddle with a lot things to make workload=20
> functional again.
>=20
> However, I can install debug kernel (from Ubuntu, etc. etc.)
>=20
> Of course, if patching the kernel is the only way to make progress --=20
> lets try that -- please let me know.

I have found a nice upstream patch, which - with some modifications - I
plan to give our customer as a workaround.

The patch is for kernel 4.12, but chances are good it will apply to a
4.15 kernel, too.

Are you able to give it a try? I hope it will fix the hangs, but in#case =

of a fixed situation there should be a message on the console.


Juergen

--------------457068B34F1ADD00FE05D41D
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-kernel-smp-Provide-CSD-lock-timeout-diagnostics.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename*0="0001-kernel-smp-Provide-CSD-lock-timeout-diagnostics.patch"

From: "Juergen Gross" <jgross@suse.com>
Date: Thu, 18 Feb 2021 09:22:54 +0100
Subject: [PATCH] kernel/smp: Provide CSD lock timeout diagnostics

This commit causes csd_lock_wait() to emit diagnostics when a CPU
fails to respond quickly enough to one of the smp_call_function()
family of function calls.

In case such a stall is detected the cpu which ought to execute the
function will be pinged again in case the IPI somehow got lost.

This commit is based on an upstream patch by Paul E. McKenney.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
diff --git a/kernel/smp.c b/kernel/smp.c
--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -19,6 +19,9 @@
 #include <linux/sched.h>
 #include <linux/sched/idle.h>
 #include <linux/hypervisor.h>
+#include <linux/sched/clock.h>
+#include <linux/nmi.h>
+#include <linux/sched/debug.h>
=20
 #include "smpboot.h"
=20
@@ -96,6 +99,79 @@ void __init call_function_init(void)
 	smpcfd_prepare_cpu(smp_processor_id());
 }
=20
+static DEFINE_PER_CPU(call_single_data_t *, cur_csd);
+static DEFINE_PER_CPU(smp_call_func_t, cur_csd_func);
+static DEFINE_PER_CPU(void *, cur_csd_info);
+
+#define CSD_LOCK_TIMEOUT (5ULL * NSEC_PER_SEC)
+atomic_t csd_bug_count =3D ATOMIC_INIT(0);
+
+/* Record current CSD work for current CPU, NULL to erase. */
+static void csd_lock_record(call_single_data_t *csd)
+{
+	if (!csd) {
+		smp_mb(); /* NULL cur_csd after unlock. */
+		__this_cpu_write(cur_csd, NULL);
+		return;
+	}
+	__this_cpu_write(cur_csd_func, csd->func);
+	__this_cpu_write(cur_csd_info, csd->info);
+	smp_wmb(); /* func and info before csd. */
+	__this_cpu_write(cur_csd, csd);
+	smp_mb(); /* Update cur_csd before function call. */
+		  /* Or before unlock, as the case may be. */
+}
+
+/* Complain if too much time spent waiting. */
+static __always_inline bool csd_lock_wait_toolong(call_single_data_t *cs=
d, u64 ts0, u64 *ts1, int *bug_id, unsigned int cpu)
+{
+	bool firsttime;
+	u64 ts2, ts_delta;
+	call_single_data_t *cpu_cur_csd;
+	unsigned int flags =3D READ_ONCE(csd->flags);
+
+	if (!(flags & CSD_FLAG_LOCK)) {
+		if (!unlikely(*bug_id))
+			return true;
+		pr_alert("csd: CSD lock (#%d) got unstuck on CPU#%02d, CPU#%02d releas=
ed the lock.\n",
+			 *bug_id, raw_smp_processor_id(), cpu);
+		return true;
+	}
+
+	ts2 =3D sched_clock();
+	ts_delta =3D ts2 - *ts1;
+	if (likely(ts_delta <=3D CSD_LOCK_TIMEOUT))
+		return false;
+
+	firsttime =3D !*bug_id;
+	if (firsttime)
+		*bug_id =3D atomic_inc_return(&csd_bug_count);
+	cpu_cur_csd =3D smp_load_acquire(&per_cpu(cur_csd, cpu)); /* Before fun=
c and info. */
+	pr_alert("csd: %s non-responsive CSD lock (#%d) on CPU#%d, waiting %llu=
 ns for CPU#%02d %pS(%ps).\n",
+		 firsttime ? "Detected" : "Continued", *bug_id, raw_smp_processor_id()=
, ts2 - ts0,
+		 cpu, csd->func, csd->info);
+	if (cpu_cur_csd && csd !=3D cpu_cur_csd) {
+		pr_alert("\tcsd: CSD lock (#%d) handling prior %pS(%ps) request.\n",
+			 *bug_id, READ_ONCE(per_cpu(cur_csd_func, cpu)),
+			 READ_ONCE(per_cpu(cur_csd_info, cpu)));
+	} else {
+		pr_alert("\tcsd: CSD lock (#%d) %s.\n",
+			 *bug_id, !cpu_cur_csd ? "unresponsive" : "handling this request");
+	}
+	if (cpu >=3D 0) {
+		if (!trigger_single_cpu_backtrace(cpu))
+			dump_cpu_task(cpu);
+		if (!cpu_cur_csd) {
+			pr_alert("csd: Re-sending CSD lock (#%d) IPI from CPU#%02d to CPU#%02=
d\n", *bug_id, raw_smp_processor_id(), cpu);
+			arch_send_call_function_single_ipi(cpu);
+		}
+	}
+	dump_stack();
+	*ts1 =3D ts2;
+
+	return false;
+}
+
 /*
  * csd_lock/csd_unlock used to serialize access to per-cpu csd resources=

  *
@@ -103,14 +179,23 @@ void __init call_function_init(void)
  * previous function call. For multi-cpu calls its even more interesting=

  * as we'll have to ensure no other cpu is observing our csd.
  */
-static __always_inline void csd_lock_wait(call_single_data_t *csd)
+static __always_inline void csd_lock_wait(call_single_data_t *csd, unsig=
ned int cpu)
 {
-	smp_cond_load_acquire(&csd->flags, !(VAL & CSD_FLAG_LOCK));
+	int bug_id =3D 0;
+	u64 ts0, ts1;
+
+	ts1 =3D ts0 =3D sched_clock();
+	for (;;) {
+		if (csd_lock_wait_toolong(csd, ts0, &ts1, &bug_id, cpu))
+			break;
+		cpu_relax();
+	}
+	smp_acquire__after_ctrl_dep();
 }
=20
-static __always_inline void csd_lock(call_single_data_t *csd)
+static __always_inline void csd_lock(call_single_data_t *csd, unsigned i=
nt cpu)
 {
-	csd_lock_wait(csd);
+	csd_lock_wait(csd, cpu);
 	csd->flags |=3D CSD_FLAG_LOCK;
=20
 	/*
@@ -148,9 +233,11 @@ static int generic_exec_single(int cpu,
 		 * We can unlock early even for the synchronous on-stack case,
 		 * since we're doing this from the same CPU..
 		 */
+		csd_lock_record(csd);
 		csd_unlock(csd);
 		local_irq_save(flags);
 		func(info);
+		csd_lock_record(NULL);
 		local_irq_restore(flags);
 		return 0;
 	}
@@ -238,6 +325,7 @@ static void flush_smp_call_function_queu
 		smp_call_func_t func =3D csd->func;
 		void *info =3D csd->info;
=20
+		csd_lock_record(csd);
 		/* Do we wait until *after* callback? */
 		if (csd->flags & CSD_FLAG_SYNCHRONOUS) {
 			func(info);
@@ -246,6 +334,7 @@ static void flush_smp_call_function_queu
 			csd_unlock(csd);
 			func(info);
 		}
+		csd_lock_record(NULL);
 	}
=20
 	/*
@@ -293,13 +382,13 @@ int smp_call_function_single(int cpu, sm
 	csd =3D &csd_stack;
 	if (!wait) {
 		csd =3D this_cpu_ptr(&csd_data);
-		csd_lock(csd);
+		csd_lock(csd, cpu);
 	}
=20
 	err =3D generic_exec_single(cpu, csd, func, info);
=20
 	if (wait)
-		csd_lock_wait(csd);
+		csd_lock_wait(csd, cpu);
=20
 	put_cpu();
=20
@@ -331,7 +420,7 @@ int smp_call_function_single_async(int c
=20
 	/* We could deadlock if we have to wait here with interrupts disabled! =
*/
 	if (WARN_ON_ONCE(csd->flags & CSD_FLAG_LOCK))
-		csd_lock_wait(csd);
+		csd_lock_wait(csd, cpu);
=20
 	csd->flags =3D CSD_FLAG_LOCK;
 	smp_wmb();
@@ -448,7 +537,7 @@ void smp_call_function_many(const struct
 	for_each_cpu(cpu, cfd->cpumask) {
 		call_single_data_t *csd =3D per_cpu_ptr(cfd->csd, cpu);
=20
-		csd_lock(csd);
+		csd_lock(csd, cpu);
 		if (wait)
 			csd->flags |=3D CSD_FLAG_SYNCHRONOUS;
 		csd->func =3D func;
@@ -465,7 +554,7 @@ void smp_call_function_many(const struct
 			call_single_data_t *csd;
=20
 			csd =3D per_cpu_ptr(cfd->csd, cpu);
-			csd_lock_wait(csd);
+			csd_lock_wait(csd, cpu);
 		}
 	}
 }

--------------457068B34F1ADD00FE05D41D
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------457068B34F1ADD00FE05D41D--

--C9gK4prqazbYKcbofgeDVBEzotxWg6ffV--

--GNJRm2pyggWu40eK3nt8thzH0tNlKfd4Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAuNI4FAwAAAAAACgkQsN6d1ii/Ey+9
nQf+Osx/VUZ6+S0+UYwDjYW2xrVye1BhzhUXgw3s3VZbauUjVrtS1IfN1hmG+kGzTV3Os88nzalt
L2F2CbyangRjHIv9evE4meUOMeFJxcgYRmuY436hyczDuGTB/zvba+Uf93AwEjrTovXuOjKJPdYg
wZovPCnUzm4TLk2VsHqUtdSi3q2Ir9tt21IhL6ot/qN+a/IhlCENXKxU3lxTOdwKUY+GQvd+NItB
xn5DrWhsXJ5qAdM1rX7jrjJJ7Tq8OV59se82K63PRvK7gXsa0cAATujRs7dUksQG7P5wFFuRuw/c
IL9H9644sld1q3aV4mEx22orm0asNqNMTP2oB/gvjg==
=nn8W
-----END PGP SIGNATURE-----

--GNJRm2pyggWu40eK3nt8thzH0tNlKfd4Y--

