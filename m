Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D863DAF6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 17:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450011.707116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QFz-00005t-VX; Wed, 30 Nov 2022 16:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450011.707116; Wed, 30 Nov 2022 16:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0QFz-0008UT-Sd; Wed, 30 Nov 2022 16:48:23 +0000
Received: by outflank-mailman (input) for mailman id 450011;
 Wed, 30 Nov 2022 16:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/x3z=36=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1p0QFy-0008UN-Tt
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 16:48:23 +0000
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cabdb18d-70ce-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 17:48:20 +0100 (CET)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 08:48:17 -0800
Received: from xwang-mobl1.amr.corp.intel.com (HELO [10.212.177.221])
 ([10.212.177.221])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 08:48:16 -0800
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
X-Inumbo-ID: cabdb18d-70ce-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669826900; x=1701362900;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uTrgL6k/pta00i+eT2v7N/wL/p9QjJsL21ekxDAFN/o=;
  b=D5LeVIK1DANp9O2XJGJ9P8HStbjxbeex6Je4MgKovO7PVj4PAMAd5+hz
   3WRH1CdoWlGrg0Wl7KlQSc+Kk4/aMLEb2SD7Bc5rMWsYjkFTsh2R04sit
   xaReRcYDEsI/ZxtTT1GH/3aOseu7Ag60zklVJacswFSTm7w1u8EsjItD5
   lNkZDQ7kkTJLhshlz4zRRtLfH0FFpYgYKUO3cMSrIWpVV9ByBUAHosYsM
   k1JSMgdR33YEchPXsNq2L7C+JQMT3suMoED+DUixDxWMRSpM1DtYrHG5t
   Etmml0MU7YF8Tfm/+a6wq7BCdB4PIPkxdyGHOWdsspoqaFPyMDZhwgQc7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314141269"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="314141269"
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="973170182"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="973170182"
Message-ID: <4a0e9f91-8d8b-84bc-c9db-7265f5b65b63@intel.com>
Date: Wed, 30 Nov 2022 08:48:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Alex Chiang <achiang@hp.com>,
 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>,
 linux-acpi@vger.kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
 <20221121102113.41893-2-roger.pau@citrix.com>
 <6b212148-4e3f-3ef6-7922-901175746d44@intel.com>
 <Y4d8cm97hn5zuRQ1@Air-de-Roger>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <Y4d8cm97hn5zuRQ1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/30/22 07:53, Roger Pau Monné wrote:
> On Tue, Nov 29, 2022 at 09:43:53AM -0800, Dave Hansen wrote:
>> On 11/21/22 02:21, Roger Pau Monne wrote:
>>> When running as a Xen dom0 the number of CPUs available to Linux can
>>> be different from the number of CPUs present on the system, but in
>>> order to properly fetch processor performance related data _PDC must
>>> be executed on all the physical CPUs online on the system.
>>
>> How is the number of CPUs available to Linux different?
>>
>> Is this a result of the ACPI tables that dom0 sees being "wrong"?
> 
> Depends on the mode.  This is all specific to Linux running as a Xen
> dom0.
> 
> For PV dom0 the ACPI tables that dom0 sees are the native ones,
> however available CPUs are not detected based on the MADT, but using
> hypercalls, see xen_smp_ops struct and the
> x86_init.mpparse.get_smp_config hook used in smp_pv.c
> (_get_smp_config()).
> 
> For a PVH dom0 Xen provides dom0 with a crafted MADT table that does
> only contain the CPUs available to dom0, and hence is likely different
> from the native one present on the hardware.
> 
> In any case, the dynamic tables dom0 sees where the Processor
> objects/devices reside are not modified by Xen in any way, so the ACPI
> Processors are always exposed to dom0 as present on the native
> tables.
> 
> Xen cannot parse the dynamic ACPI tables (neither should it, since
> then it would act as OSPM), so it relies on dom0 to provide same data
> present on those tables for Xen to properly manage the frequency and
> idle states of the CPUs on the system.
> 
>>> The current checks in processor_physically_present() result in some
>>> processor objects not getting their _PDC methods evaluated when Linux
>>> is running as Xen dom0.  Fix this by introducing a custom function to
>>> use when running as Xen dom0 in order to check whether a processor
>>> object matches a CPU that's online.
>>
>> What is the end user visible effect of this problem and of the solution?
> 
> Without this fix _PDC is only evaluated for the CPUs online from dom0
> point of view, which means that if dom0 is limited to 8 CPUs but the
> system has 24 CPUs, _PDC will only get evaluated for 8 CPUs, and that
> can have the side effect of the data then returned by _PSD method or
> other methods being different between CPUs where _PDC was evaluated vs
> CPUs where the method wasn't evaluated.  Such mismatches can
> ultimately lead to for example the CPU frequency driver in Xen not
> initializing properly because the coordination methods between CPUs on
> the same domain don't match.
> 
> Also not evaluating _PDC prevents the OS (or Xen in this case)
> from notifying ACPI of the features it supports.
> 
> IOW this fix attempts to make sure all physically online CPUs get _PDC
> evaluated, and in order to to that we need to ask the hypervisor if a
> Processor ACPI ID matches an online CPU or not, because Linux doesn't
> have that information when running as dom0.
> 
> Hope the above makes sense and allows to make some progress on the
> issue, sometimes it's hard to summarize without getting too
> specific,

Yes, writing changelogs is hard. :)

Let's try though.  I was missing some key pieces of background here.
Believe it or not, I had no idea off the top of my head what _PDC was or
why it's important.

the information about _PDC being required on all processors was missing,
as was the information about the dom0's incomplete concept of the
available physical processors.

== Background ==

In ACPI systems, the OS can direct power management, as opposed to the
firmware.  This OS-directed Power Management is called OSPM.  Part of
telling the firmware that the OS going to direct power management is
making ACPI "_PDC" (Processor Driver Capabilities) calls.  These _PDC
calls must be made on every processor.  If these _PDC calls are not
completed on every processor it can lead to inconsistency and later
failures in things like the CPU frequency driver.

In a Xen system, the dom0 kernel is responsible for system-wide power
management.  The dom0 kernel is in charge of OSPM.  However, the Xen
hypervisor hides some processors information from the dom0 kernel.  This
is presumably done to ensure that the dom0 system has less interference
with guests that want to use the other processors.

== Problem ==

But, this leads to a problem: the dom0 kernel needs to run _PDC on all
the processors, but it can't always see them.

== Solution ==

In dom0 kernels, ignore the existing ACPI method for determining if a
processor is physically present because it might not be accurate.
Instead, ask the hypervisor for this information.

This ensures that ...

----

Is that about right?

