Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B64CF7BDF
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 11:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195977.1513852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd48G-0000WD-R6; Tue, 06 Jan 2026 10:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195977.1513852; Tue, 06 Jan 2026 10:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd48G-0000Tl-Na; Tue, 06 Jan 2026 10:17:44 +0000
Received: by outflank-mailman (input) for mailman id 1195977;
 Tue, 06 Jan 2026 10:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZuO=7L=bounce.vates.tech=bounce-md_30504962.695ce142.v1-87690f0c43da4feab2fe905a101f6203@srs-se1.protection.inumbo.net>)
 id 1vd48E-0000SE-RM
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 10:17:43 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eda7efdb-eae8-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 11:17:39 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4dlnD21WhpzK5vgM2
 for <xen-devel@lists.xenproject.org>; Tue,  6 Jan 2026 10:17:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 87690f0c43da4feab2fe905a101f6203; Tue, 06 Jan 2026 10:17:38 +0000
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
X-Inumbo-ID: eda7efdb-eae8-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1767694658; x=1767964658;
	bh=bsU2eUdwrfoDXp5ItDq8DJEDIz9Wl4CJVMm0N36WL8E=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kkBcbENirjuN3QPZqnsVlv5KZe7yVpdBAYsoYQtlzLniJwRXpyIT8oPTwQEGgana0
	 FSHtTgL0JreQI9XfzznpjeJOeEdIaw6eAoSW8lLugOXq4fEMCszRqTkqd+oJoDezYD
	 E5DkD7Ga5ePEXXRX157tuUWBO1n0zuAJYU5s+MFT6eN9chMxiqezjCnmjIpJOgvA91
	 +xdELVQLNYNM3dPcvS/6T3N5pAyHowr/dw3QDrZyrfcm3tiAL4wOmobhg7PNQJ63UF
	 bY2sgyoZt3qU3dsrrqs5gy1ozExFYCgrJP9bc2Qu2+eIb9mi7LmvJVE7hB6QftY/eu
	 ChOn67Dpw3uzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1767694658; x=1767955158; i=teddy.astie@vates.tech;
	bh=bsU2eUdwrfoDXp5ItDq8DJEDIz9Wl4CJVMm0N36WL8E=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GgdXkVMoiIPBZQ5hyIHIdCnTE5fKIEnbeM7cF0CjWIvJjlsdOWROnBGTO9IOcgVD/
	 7+jBYPRGVV6kmTDA5lyTVOxBmT2TOgp87xEeLdPQgrRsTqYTzkw9zprQhlLDV0FkHi
	 Qp1MDK1Huk60hjSSyKwH8x38cqPhklnLARptVsAC9F749SV1sCY3Czmpq9nq/WyfQu
	 nmwW0YYoNzAf8b3+HXTx+SzTttpF9UAsRJHkD9a2saS4zmBsXcvuEqd/MrT/OUXZP8
	 6yaOBVK0LhtMxyigKezaQNjLXrL0ELG6F+gSNVtHo60f+Db9+vxveQqBUpZsqZC+uN
	 l1HFqD4hQsddg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen:=20Drop=20xenoprofile=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1767694656181
Message-Id: <03ede724-4b01-4a16-a23f-0bc2ed25efbf@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20260105195717.601500-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260105195717.601500-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.87690f0c43da4feab2fe905a101f6203?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260106:md
Date: Tue, 06 Jan 2026 10:17:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 05/01/2026 =C3=A0 21:01, Andrew Cooper a =C3=A9crit=C2=A0:
> The most recent xenoprof change was 300ef0cb4fde ("x86: Add Xenoprofile
> support for AMD Family16h") in 2013, despite there being 42 changes worth=
 of
> other cleanup/rearranging since then.
> 
> Oprofile themselves dropped Xen support in commit 0c142c3a096d ("Remove
> opcontrol and the GUI and processor models dependent on it") in 2014, as =
part
> of releasing version 1.0 and switching over to using operf based on the L=
inux
> perf_event subsystem.  Linux's version of this patch was merged in commit
> 24880bef417f ("Merge tag 'oprofile-removal-5.12'") in 2021.
> 
> Drop xenoprof and all supporting infrastructure, including the hypercall,=
 the
> XSM hook and flask vectors which lose their only caller, and even shrinks
> struct domain by one pointer which wasn't properly excluded in
> !CONFIG_XENOPROF builds.
> 
> Retain the public xenoprof.h header as it is ABI, but note that the
> functionality is removed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Despite appearing to be architecture neutral, the internals of Xenoprof w=
ere
> entirely x86-specific.  Another curiosity is that only the VMX MSR hooks
> called passive_domain_do_{rd,wr}msr(), and I can't see how this was corre=
ct
> for SVM.
> 
> The real reason for finally getting around to this is the number of MISRA
> violations reported by the eclair-x86_64-allcode job that I don't feel li=
ke
> fixing.
> ---
>   CHANGELOG.md                            |   3 +
>   docs/misc/xen-command-line.pandoc       |   6 -
>   tools/flask/policy/modules/dom0.te      |   2 -
>   xen/arch/x86/Makefile                   |   1 -
>   xen/arch/x86/cpu/vpmu_amd.c             |   7 -
>   xen/arch/x86/cpu/vpmu_intel.c           |   6 -
>   xen/arch/x86/hvm/svm/entry.S            |   1 -
>   xen/arch/x86/hvm/svm/svm.c              |   2 -
>   xen/arch/x86/hvm/vmx/vmx.c              |   9 -
>   xen/arch/x86/include/asm/xenoprof.h     |  95 ---
>   xen/arch/x86/oprofile/Makefile          |   6 -
>   xen/arch/x86/oprofile/backtrace.c       | 145 ----
>   xen/arch/x86/oprofile/nmi_int.c         | 485 ------------
>   xen/arch/x86/oprofile/op_counter.h      |  41 -
>   xen/arch/x86/oprofile/op_model_athlon.c | 547 -------------
>   xen/arch/x86/oprofile/op_model_p4.c     | 721 -----------------
>   xen/arch/x86/oprofile/op_model_ppro.c   | 348 ---------
>   xen/arch/x86/oprofile/op_x86_model.h    |  58 --
>   xen/arch/x86/oprofile/xenoprof.c        | 106 ---
>   xen/arch/x86/traps.c                    |   4 -
>   xen/common/Kconfig                      |  11 -
>   xen/common/Makefile                     |   1 -
>   xen/common/compat/xenoprof.c            |  42 -
>   xen/common/domain.c                     |   6 -
>   xen/common/xenoprof.c                   | 977 ------------------------
>   xen/include/Makefile                    |   1 -
>   xen/include/hypercall-defs.c            |   6 -
>   xen/include/public/xen.h                |   2 +-
>   xen/include/public/xenoprof.h           |   2 +-
>   xen/include/xen/sched.h                 |   3 -
>   xen/include/xen/xenoprof.h              |  49 --
>   xen/include/xsm/dummy.h                 |   7 -
>   xen/include/xsm/xsm.h                   |   7 -
>   xen/xsm/dummy.c                         |   2 -
>   xen/xsm/flask/hooks.c                   |  35 -
>   xen/xsm/flask/policy/access_vectors     |   4 -
>   36 files changed, 5 insertions(+), 3743 deletions(-)
>   delete mode 100644 xen/arch/x86/include/asm/xenoprof.h
>   delete mode 100644 xen/arch/x86/oprofile/Makefile
>   delete mode 100644 xen/arch/x86/oprofile/backtrace.c
>   delete mode 100644 xen/arch/x86/oprofile/nmi_int.c
>   delete mode 100644 xen/arch/x86/oprofile/op_counter.h
>   delete mode 100644 xen/arch/x86/oprofile/op_model_athlon.c
>   delete mode 100644 xen/arch/x86/oprofile/op_model_p4.c
>   delete mode 100644 xen/arch/x86/oprofile/op_model_ppro.c
>   delete mode 100644 xen/arch/x86/oprofile/op_x86_model.h
>   delete mode 100644 xen/arch/x86/oprofile/xenoprof.c
>   delete mode 100644 xen/common/compat/xenoprof.c
>   delete mode 100644 xen/common/xenoprof.c
>   delete mode 100644 xen/include/xen/xenoprof.h
> 
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 7f15204c3885..b12fd10e6315 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -106,7 +106,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   #define __HYPERVISOR_nmi_op               28
>   #define __HYPERVISOR_sched_op             29
>   #define __HYPERVISOR_callback_op          30
> -#define __HYPERVISOR_xenoprof_op          31
> +#define __HYPERVISOR_xenoprof_op          31 /* Dropped in Xen 4.22 */
>   #define __HYPERVISOR_event_channel_op     32
>   #define __HYPERVISOR_physdev_op           33
>   #define __HYPERVISOR_hvm_op               34
> diff --git a/xen/include/public/xenoprof.h b/xen/include/public/xenoprof.=
h
> index 2298b6759ed3..f97a67042e07 100644
> --- a/xen/include/public/xenoprof.h
> +++ b/xen/include/public/xenoprof.h
> @@ -3,7 +3,7 @@
>    * xenoprof.h
>    *
>    * Interface for enabling system wide profiling based on hardware perfo=
rmance
> - * counters
> + * counters.  Dropped from Xen in 4.22.
>    *
>    * Copyright (C) 2005 Hewlett-Packard Co.
>    * Written by Aravind Menon & Jose Renato Santos

Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Some question: do we plan to drop xenoprof.h headers at some point (even 
if not today) ?

Teddy




--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



