Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29A708ADE
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536586.835051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzlcO-0005HJ-Oj; Thu, 18 May 2023 21:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536586.835051; Thu, 18 May 2023 21:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzlcO-0005F1-LK; Thu, 18 May 2023 21:57:04 +0000
Received: by outflank-mailman (input) for mailman id 536586;
 Thu, 18 May 2023 21:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EfMJ=BH=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1pzlcM-0005Ev-G8
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:57:02 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e71b5cef-f5c6-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 23:56:56 +0200 (CEST)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:56:53 -0700
Received: from nroy-mobl1.amr.corp.intel.com (HELO [10.209.81.123])
 ([10.209.81.123])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:56:52 -0700
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
X-Inumbo-ID: e71b5cef-f5c6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684447017; x=1715983017;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TfncyPoLkgEVKt4cWoEjhnDcsRhR4hVCsiDKfdnguT0=;
  b=i6qdD5EqNO9/VxpfPWtOWkvlKjQ4zTyz9oZu1izzSorxItwCJEn+AcPm
   G1kC/QSc39zCxCdPGq/E8POBF0DIM24tKld8tN5uvxElwQ6IZI26dYL2z
   ltGnCr/ZkZkbPVMubNeFfJBYQJGNLoj7Nz7hPAGMZrcX88JP8SSU7kJB6
   pSnMvOOqBGT8ZcTp2nM1hHE6jJ0NYBpXxVFm3m7WR7t+QTY/Q2v9IMdby
   jNGYqT+OITq+U+2e+JdSH9GQL15d6E5zmmj8ca0JUGMguNfmTAhqpPixo
   apAcuE0VzXI3z2XG7eusZMoeDYje0ffxb2742+YvMo4PWpsXq6kygzX53
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354550239"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="354550239"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948852100"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; 
   d="scan'208";a="948852100"
Message-ID: <a78d9dcd-0bc1-7e98-a8f1-e5d6cd0c09a3@intel.com>
Date: Thu, 18 May 2023 14:56:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/20] x86: address -Wmissing-prototype warnings
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
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/23 12:35, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This addresses all x86 specific prototype warnings. The majority of the
> patches should be straightforward, either adding an #include statement
> to get the right header, or ensuring that an unused global function is
> left out of the build when the prototype is hidden.
> 
> The ones that are a bit awkward are those that just add a prototype to
> shut up the warning, but the prototypes are never used for calling the
> function because the only caller is in assembler code. I tried to come up
> with other ways to shut up the compiler using the asmlinkage annotation,
> but with no success.
> 
> All of the warnings have to be addressed in some form before the warning
> can be enabled by default.

I picked up the ones that were blatantly obvious, but left out 03, 04,
10, 12 and 19 for the moment.

BTW, I think the i386 allyesconfig is getting pretty lightly tested
these days.  I think you and I hit the same mlx4 __bad_copy_from()
compile issue.

