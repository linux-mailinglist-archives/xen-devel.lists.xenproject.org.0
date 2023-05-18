Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF07086EC
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 19:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536490.834861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzhTI-0002mn-Pp; Thu, 18 May 2023 17:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536490.834861; Thu, 18 May 2023 17:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzhTI-0002ko-MW; Thu, 18 May 2023 17:31:24 +0000
Received: by outflank-mailman (input) for mailman id 536490;
 Thu, 18 May 2023 17:31:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EfMJ=BH=intel.com=dave.hansen@srs-se1.protection.inumbo.net>)
 id 1pzhTH-0002kg-Ax
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 17:31:23 +0000
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cce18eeb-f5a1-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 19:31:21 +0200 (CEST)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 10:31:18 -0700
Received: from nroy-mobl1.amr.corp.intel.com (HELO [10.209.81.123])
 ([10.209.81.123])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 10:31:17 -0700
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
X-Inumbo-ID: cce18eeb-f5a1-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684431081; x=1715967081;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wl8BDYVG0i7AvYNjyPawAfZhnam6nIO2zxc9kJVuY98=;
  b=WpzfTPZYDSOXeNuKq7AQYSu6P41BySw4wNiz2aSfmDSWcklIFwwzpmpZ
   B4UFkZm0pjHH0TmTiV95F7HAFLxBPFOo1VID+8WSCB+7DWyrRfMVXXpTT
   Err7TrnNCyaQNuQ1TKl2fUhx4gjZx81DCvB8wcHnF1MIAeYourh/hE48P
   HCIIrEV77WlNurieCvNBQQcYqDKWFxMv8/rrpRW/BLzjkHSdZMMmALzls
   TfWpeKgymFi5/zYdyLjr0Vwf56UxfQ9P6wObk0YhbUP9z+kuHhhFJtdsE
   1UM4aHF6vLxBcbl/T42EiaPlaKStMiXid40AYFt/gwyZ5SczSHegn3ftt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354475450"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; 
   d="scan'208";a="354475450"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="1032284552"
X-IronPort-AV: E=Sophos;i="6.00,174,1681196400"; 
   d="scan'208";a="1032284552"
Message-ID: <d03ef733-8098-69b7-97c2-304f1195e2a4@intel.com>
Date: Thu, 18 May 2023 10:31:16 -0700
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
> The ones that are a bit awkward are those that just add a prototype to
> shut up the warning, but the prototypes are never used for calling the
> function because the only caller is in assembler code. I tried to come up
> with other ways to shut up the compiler using the asmlinkage annotation,
> but with no success.

I went looking for the same thing.  It's too bad gcc doesn't have an
__attribute__ for it.

