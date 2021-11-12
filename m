Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A444EDBE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 21:10:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225406.389249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlcsL-0006sT-6T; Fri, 12 Nov 2021 20:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225406.389249; Fri, 12 Nov 2021 20:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlcsL-0006qN-2y; Fri, 12 Nov 2021 20:10:17 +0000
Received: by outflank-mailman (input) for mailman id 225406;
 Fri, 12 Nov 2021 20:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcwL=P7=intel.com=lucas.demarchi@srs-se1.protection.inumbo.net>)
 id 1mlcsJ-0006qH-SL
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 20:10:15 +0000
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88b62cd9-43f4-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 21:10:10 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 12:09:59 -0800
Received: from rjlank1-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.91.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 12:09:58 -0800
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
X-Inumbo-ID: 88b62cd9-43f4-11ec-9787-a32c541c8605
X-IronPort-AV: E=McAfee;i="6200,9189,10166"; a="230662175"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; 
   d="scan'208";a="230662175"
X-IronPort-AV: E=Sophos;i="5.87,230,1631602800"; 
   d="scan'208";a="505018696"
Date: Fri, 12 Nov 2021 12:09:57 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 0/2] Nuke PAGE_KERNEL_IO
Message-ID: <20211112200957.qem4dyjnzjhls4v3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211021181511.1533377-1-lucas.demarchi@intel.com>
 <20211112190403.GK174703@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211112190403.GK174703@worktop.programming.kicks-ass.net>

On Fri, Nov 12, 2021 at 08:04:03PM +0100, Peter Zijlstra wrote:
>On Thu, Oct 21, 2021 at 11:15:09AM -0700, Lucas De Marchi wrote:
>> Last user of PAGE_KERNEL_IO is the i915 driver. While removing it from
>> there as we seek to bring the driver to other architectures, Daniel
>> suggested that we could finish the cleanup and remove it altogether,
>> through the tip tree. So here I'm sending both commits needed for that.
>>
>> Lucas De Marchi (2):
>>   drm/i915/gem: stop using PAGE_KERNEL_IO
>>   x86/mm: nuke PAGE_KERNEL_IO
>>
>>  arch/x86/include/asm/fixmap.h             | 2 +-
>>  arch/x86/include/asm/pgtable_types.h      | 7 -------
>>  arch/x86/mm/ioremap.c                     | 2 +-
>>  arch/x86/xen/setup.c                      | 2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_pages.c | 4 ++--
>>  include/asm-generic/fixmap.h              | 2 +-
>>  6 files changed, 6 insertions(+), 13 deletions(-)
>
>Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

thanks, Peter.

The intention was to merge this through the tip tree. Although now I'm
not sure. Options:

	1) take the first patch through the drm-intel tree and apply the
	   second patch later
	2) take everything through the drm tree
	3) take everything through the tip tree

What's your preference here?

Lucas De Marchi

