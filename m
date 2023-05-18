Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756847086E8
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 19:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536486.834850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzhR7-0001QE-Do; Thu, 18 May 2023 17:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536486.834850; Thu, 18 May 2023 17:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzhR7-0001NW-Aq; Thu, 18 May 2023 17:29:09 +0000
Received: by outflank-mailman (input) for mailman id 536486;
 Thu, 18 May 2023 17:29:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EfMJ=BH=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1pzhR5-0001NK-68
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 17:29:07 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79fc4896-f5a1-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 19:29:02 +0200 (CEST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 10:28:58 -0700
Received: from nroy-mobl1.amr.corp.intel.com (HELO [10.209.81.123])
 ([10.209.81.123])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 10:28:58 -0700
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
X-Inumbo-ID: 79fc4896-f5a1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684430942; x=1715966942;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YbB0ITNWC6W+DKq+pyGIH80h6yd4xEjccS7jew/3CTQ=;
  b=aKZT4vEpd/1SU6W4n3H/qvzp094XJ3lgXfgWAzUXUkefbl/I8nNwkN5P
   2JM6nSjwuvkv1EcEf4gorDf1Zar2ueQ91us7eP5v4ooLxlRqgYayYZ9Ul
   2PjHBjnx04lMQa6DqTQrHLX/9kOpVStF1oGyqImObVWW1CEKgXev7A3Bv
   NvlRB/JrIVT+F5FfO8MWkBIAV60xb4B+dnP/1Tb4Xkcx9aHrK2mMOIEEJ
   Lrt2yFUa2aZHftKCc9ga42ij0Irohm724zB3XP3daqs5VQPSdvALIypPP
   rRKbCg1BIyxApr0SNpgCp8QjZM/bCvKRQwSegvA+iV8OVStktLHz9QMhH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354474559"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; 
   d="scan'208";a="354474559"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="702214993"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; 
   d="scan'208";a="702214993"
Message-ID: <cabdd839-71d5-aabb-aee6-d37ebcabf2ab@intel.com>
Date: Thu, 18 May 2023 10:28:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/20] x86: xen: add missing prototypes
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Juergen Gross <jgross@suse.com>,
 "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
 Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Andy Shevchenko <andy@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pm@vger.kernel.org, linux-mm@kvack.org
References: <20230516193549.544673-1-arnd@kernel.org>
 <20230516193549.544673-11-arnd@kernel.org>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230516193549.544673-11-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/23 12:35, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> arch/x86/xen/enlighten_pv.c:1233:34: error: no previous prototype for 'xen_start_kernel' [-Werror=missing-prototypes]
> arch/x86/xen/irq.c:22:14: error: no previous prototype for 'xen_force_evtchn_callback' [-Werror=missing-prototypes]
> arch/x86/xen/mmu_pv.c:358:20: error: no previous prototype for 'xen_pte_val' [-Werror=missing-prototypes]
> arch/x86/xen/mmu_pv.c:366:20: error: no previous prototype for 'xen_pgd_val' [-Werror=missing-prototypes]

What's the deal with this one?

The patch is doing a bunch functions on top of the ones from the commit
message.  Were you just showing a snippet of what the actual set of
warnings is?

Also, fwiw, it would be nice to have actual words in the changelog, even
for these maddeningly repetitive series.  Even something like:

	Xen has a bunch of these because of how the paravirt code uses
	inline assembly.

