Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF144AA46C0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 11:17:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973510.1361628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA3ZI-0002uV-6r; Wed, 30 Apr 2025 09:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973510.1361628; Wed, 30 Apr 2025 09:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA3ZI-0002sA-3u; Wed, 30 Apr 2025 09:17:28 +0000
Received: by outflank-mailman (input) for mailman id 973510;
 Wed, 30 Apr 2025 09:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/+r=XQ=linux.intel.com=ilpo.jarvinen@srs-se1.protection.inumbo.net>)
 id 1uA3ZG-0002s4-Id
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 09:17:26 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec92f597-25a3-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 11:17:24 +0200 (CEST)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:17:22 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 02:17:10 -0700
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
X-Inumbo-ID: ec92f597-25a3-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746004644; x=1777540644;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=0MRDc7XkKAhdLo9NoWiZ7a37tKdrUj31jPMIXHPElEQ=;
  b=FmVVrpX31idIr+m1wN1XNNIjWkNf4aLWdVD/AxCrITc/5edUx6E0zNP8
   aDIYb8DZbnlk1HuNqZvJVBIEUfB1iNau/84wrUaIOFqxfwY4MhRnCC+Yg
   0XgjPd3e8V9CMTZhrBbmPEij4eQYVnsQqhqa0KqZpC2KV/BuPRZPpkid2
   NufZNOoersoL9rdQEkBBwE1TJlC/0oEv7X2bfxTgiMJNaAZ9qJFaBOITF
   h2mZSuqvzT40KyLxAyAi4yj7Hz7mw3Bl2tr4C2uuHKvPE1XznOTY3NuZk
   U360C4u8lFW8pGfAIjedX0IdhMo1gfqVtQpjfwbtb27FVl5h8M9IQsstS
   A==;
X-CSE-ConnectionGUID: 7vBytfcqSUK/SWC8unV/+A==
X-CSE-MsgGUID: FcG9NdqSQiGuWxUZSYgmtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="73044386"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="73044386"
X-CSE-ConnectionGUID: /a7mAvi6S1y/UJBA/L4NuA==
X-CSE-MsgGUID: NSdWhcCYRFm9Gy2+IE0YuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="139249217"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 30 Apr 2025 12:17:06 +0300 (EEST)
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
Subject: Re: [PATCH v4 01/15] x86/msr: Add missing includes of <asm/msr.h>
In-Reply-To: <c16677bd-ee63-4032-8825-7d2789dd7555@zytor.com>
Message-ID: <d1bf0657-1cc5-b6ec-5601-f31efefacd9a@linux.intel.com>
References: <20250427092027.1598740-1-xin@zytor.com> <20250427092027.1598740-2-xin@zytor.com> <a1917b37-e41e-d303-749b-4007cda01605@linux.intel.com> <c16677bd-ee63-4032-8825-7d2789dd7555@zytor.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-830254077-1746003796=:7433"
Content-ID: <b1309532-f075-10c2-3416-1951dccf3d32@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-830254077-1746003796=:7433
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d13050cf-2b1d-6913-5e66-9452e1353593@linux.intel.com>

On Wed, 30 Apr 2025, Xin Li wrote:

> On 4/29/2025 2:45 AM, Ilpo J=E4rvinen wrote:
> > >   arch/x86/events/msr.c                                         | 3 +=
++
> > >   arch/x86/events/perf_event.h                                  | 1 +
> > >   arch/x86/events/probe.c                                       | 2 +=
+
> > Under arch/x86/events/ a few files seem to be missing the include?
>=20
>=20
> Most C files in arch/x86/events/ include arch/x86/events/perf_event.h,
> thus they don't need to include <asm/msr.h> directly once
> arch/x86/events/perf_event.h includes <asm/msr.h>, and this patch does
> that.
>=20
>=20
> The following files include arch/x86/events/intel/uncore.h which includes
> arch/x86/events/perf_event.h, thus no change needed:
>     arch/x86/events/intel/uncore.c
>     arch/x86/events/intel/uncore_discovery.c
>     arch/x86/events/intel/uncore_nhmex.c
>     arch/x86/events/intel/uncore_snb.c
>     arch/x86/events/intel/uncore_snbep.c
>=20
> The following 2 files don't include arch/x86/events/perf_event.h so they
> include <asm/msr.h> directly with this patch:
>     arch/x86/events/msr.c
>     arch/x86/events/probe.c
>=20
> arch/x86/events/amd/uncore.c doesn't include
> arch/x86/events/perf_event.h but includes <asm/msr.h> already.
>=20
>=20
> So we are good in this directory, but it should be a separate patch with
> the above explanation then.

Hi,

While this is not my subsystem so don't have the final say here, you had=20
to explain quite much to prove that (and reviewer would have to go through=
=20
the same places to check). Wouldn't it be much simpler for all if all=20
those .c files would just include <asm/msr.h> directly? No need to explain=
=20
anything then.

Also, similar to what you're doing for some tsc related things in this=20
series, somebody could in the future decide that hey, these static inline=
=20
functions (that use .*msr.*) belong to some other file, allowing msr.h to=
=20
be removed from arch/x86/events/perf_event.h. Again, we'd need to add=20
asm/msr.h into more .c files. This is the problem with relying on indirect=
=20
includes, they create hard to track dependencies for #includes done in .h=
=20
files. If we actively encourage to depend on indirect #include=20
dependencies like that, it makes it very hard to  _remove_ any #include=20
from a header file (as you have yourself discovered).

--=20
 i.
--8323328-830254077-1746003796=:7433--

