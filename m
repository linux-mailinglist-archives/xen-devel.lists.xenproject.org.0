Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA952A9DB45
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 15:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969186.1358431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8fqp-0006LR-Co; Sat, 26 Apr 2025 13:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969186.1358431; Sat, 26 Apr 2025 13:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8fqp-0006IS-9g; Sat, 26 Apr 2025 13:45:51 +0000
Received: by outflank-mailman (input) for mailman id 969186;
 Sat, 26 Apr 2025 13:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/J9Y=XM=linux.intel.com=ilpo.jarvinen@srs-se1.protection.inumbo.net>)
 id 1u8fqo-0006I3-1t
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 13:45:50 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0d008e8-22a4-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 15:45:47 +0200 (CEST)
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 06:45:44 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2025 06:45:29 -0700
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
X-Inumbo-ID: c0d008e8-22a4-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745675147; x=1777211147;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=I4nsA4r/Iu57UddEcOKuVuHTuSSaO7yRpZoDOY/Qp2U=;
  b=minQNd4PV8UvM6sS4XH470LF4gFoSwzIUdtxZBBvpXPTDa4i4ZR9inpC
   1lgGYgJLwYHgzcE6Qgs+wXV4aY04svzmCoQpUndxjQAe0GsCr6KiXfl2h
   hvlqsJzQMpHOhzBIR2mWg/j0yoVZ99OPbJyIzF8TvrEFtTKUluojB6M5H
   0XY0nU/TumYogcpvAOl+WYqNKoA5ehcIqetfcPNwDE87r3/mNePKg6n5c
   eu+tGOA0QlMt/4EGyeWvk/RPDDQ2WeaKCjXfq2xh4YqePtJxFrfg0XBCH
   oso7yNu6gZfgm+cOx0ouwyOEe0fT0Kd/jMOeGhH9j/fZzmdE1fxHa7LN9
   Q==;
X-CSE-ConnectionGUID: joVWRuThQpWSTAiBySOrqQ==
X-CSE-MsgGUID: awuDPgtGSYS3cylfsoBFzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47229785"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47229785"
X-CSE-ConnectionGUID: WMbNce1ORpCDbJZHWjGjpw==
X-CSE-MsgGUID: UaIR2HdjTjK095toUEDbGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="138223278"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sat, 26 Apr 2025 16:45:26 +0300 (EEST)
To: Xin Li <xin@zytor.com>
cc: LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
    virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
    linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
    linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    Netdev <netdev@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, 
    peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com, 
    alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
    adrian.hunter@intel.com, kan.liang@linux.intel.com, wei.liu@kernel.org, 
    ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
    tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com, 
    seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com, 
    kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com, 
    dapeng1.mi@linux.intel.com
Subject: Re: [PATCH v3 01/14] x86/msr: Move rdtsc{,_ordered}() to
 <asm/tsc.h>
In-Reply-To: <e62b81f3-1952-43e6-85fd-18c6f37d531d@zytor.com>
Message-ID: <f8a5b080-b2a8-06f0-3d2d-d232ef0887a4@linux.intel.com>
References: <20250425083442.2390017-1-xin@zytor.com> <20250425083442.2390017-2-xin@zytor.com> <42dc90e1-df2a-2324-d28c-d75fb525e4a2@linux.intel.com> <e62b81f3-1952-43e6-85fd-18c6f37d531d@zytor.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-589040720-1745675126=:944"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-589040720-1745675126=:944
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 26 Apr 2025, Xin Li wrote:

> On 4/25/2025 8:45 AM, Ilpo J=C3=A4rvinen wrote:
> > To me this looks really a random set of source files, maybe it helped s=
ome
> > build success but it's hard for me to review this because there are sti=
ll
> > cases that depend on indirect include chains.
> >=20
> > Could you just look into solving all missing msr.h includes instead
> > as clearly some are still missing after 3 pre-existing ones and you add=
ing
> > it into 3 files:
> >=20
> > $ git grep -e rdmsr -e wrmsr -l drivers/platform/x86/
> > drivers/platform/x86/intel/ifs/core.c
> > drivers/platform/x86/intel/ifs/load.c
> > drivers/platform/x86/intel/ifs/runtest.c
> > drivers/platform/x86/intel/pmc/cnp.c
> > drivers/platform/x86/intel/pmc/core.c
> > drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> > drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c
> > drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> > drivers/platform/x86/intel/tpmi_power_domains.c
> > drivers/platform/x86/intel/turbo_max_3.c
> > drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> > drivers/platform/x86/intel_ips.c
> >=20
> > $ git grep -e 'msr.h' -l drivers/platform/x86/
> > drivers/platform/x86/intel/pmc/core.c
> > drivers/platform/x86/intel/tpmi_power_domains.c
> > drivers/platform/x86/intel_ips.c
>=20
> I think you want me to add all necessary direct inclusions, right?

For asm/msr.h yes, as it seems you're altering the inclusion paths and all=
=20
non-direct includes have a chance of breaking so it seems prudent to just=
=20
convert them into direct includes.

> This is the right thing to do, and I did try it but gave up later.
>=20
> I will do it in the next iteration as you asked.  But I want to make my
> points:
>=20
> 1) It's not just two patterns {rd,wr}msr, there are a lot of definitions
>    in <asm/msr.h> and we need to cover all of them:

I know and I don't expect you to get it 100% perfect, but taking a major=20
step into the right direction would be way better than build testing one=20
configuration and see what blows up and fix only those.

In this particular case, the amount of includes seemed really subpar with=
=20
many users lacking the include.

>       struct msr_info
>       struct msr_regs_info
>       struct saved_msr
>       struct saved_msrs

Could be shortened to -e 'struct msr' -e 'struct saved_msr'.

>       {read,write}_msr
>       rdpmc
>       .*msr.*_on_cpu

Well, my pattern already caught rdmsr.*on_cpu and wrmsr.*on_cpu.

For the other patterns, I don't see those at all under=20
drivers/platform/x86/ but I think when one typically implies the=20
others tend appear as well so this might not be as hard as it seems.

> 2) Once all necessary direct inclusions are in place, it's easy to
>    overlook adding a header inclusion in practice, especially if the
>    build passes.  Besides we often forget to remove a header when a
>    definition is removed.  In other words, direct inclusion is hard to
>    maintain.

This is true as well but we should still try to move towards the right=20
state affairs even if we will not get it near 100% until there's a real=20
tool that relentlessly keeps exposing such human oversight.

And do I try to check also includes whenever I remember while reviewing=20
patches (which requires some effort as they are not visible in the code=20
context and might not appear in a patch at all).

> 3) Some random kernel configuration combinations can cause the current
>    kernel build to fail.  I hit one in x86 UML.

Yes, which why direct including is much better than relying on fragile=20
indirects.

> We all know Ingo is the best person to discuss this with :).  While my
> understanding of the header inclusion issue may be inaccurate or
> outdated.
>=20
> So for me, using "make allyesconfig" is a practical method for a quick
> local build check, plus I always send my patches to Intel LKP.

Even with LKP, randconfig builds may still require many tests to find=20
issues.

> There probably wants a script that identifies all files that reference a
> definition in a header thus need to include it explicitly.  And indirect
> includes should be zapped.

Sadly, the clang based include-what-you-use tool is not yet there for=20
the kernel AFAIK.

--=20
 i.

--8323328-589040720-1745675126=:944--

