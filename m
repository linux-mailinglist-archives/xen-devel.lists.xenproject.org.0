Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FAB671B29
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 12:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480532.745005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6ti-0005rn-BR; Wed, 18 Jan 2023 11:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480532.745005; Wed, 18 Jan 2023 11:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI6ti-0005ow-8f; Wed, 18 Jan 2023 11:46:30 +0000
Received: by outflank-mailman (input) for mailman id 480532;
 Wed, 18 Jan 2023 11:46:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Si3C=5P=linux.intel.com=kirill.shutemov@srs-se1.protection.inumbo.net>)
 id 1pI6tg-0005oa-2W
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 11:46:28 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baf9b2f8-9725-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 12:46:24 +0100 (CET)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:46:21 -0800
Received: from semenova-mobl1.ccr.corp.intel.com (HELO box.shutemov.name)
 ([10.252.53.249])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:46:17 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 83581104CC6; Wed, 18 Jan 2023 14:46:14 +0300 (+03)
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
X-Inumbo-ID: baf9b2f8-9725-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674042384; x=1705578384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoF9vVe1tkCvj804j2tCzb7TiNPsCz/UXlCdDCW6W10=;
  b=ln9RTQj+fzHtrQc6D4Uf/2oU3WFWIIWYGRUb7YRhAb7GZoQmPezx7cvz
   lxjDRulCEPJSh5z4vk9Zoy0bRRWZoeStOpWuiHwoDmsvoSDUpCwvqUu2c
   domhmt8+M2qEhNgY36LrTAdAq9jFdb4lz1IAS5QT7Ji1drmqpRnZxecMm
   zT3S154EwAhf3W7jbFtnMRhhDmdcMYjApmxRKD6ZYJST8nwKZAVlXVYhQ
   BgCVZhFQ09WmoHj0pica0acjuc4YPgRSDOkvenXhpdhntm49gwMTV2r/B
   6QrwQYvLKy6GIR+e9dhJlzW0oEpzJ6jNBBwZWckWiCZeakZeYnNtIl/ND
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="352210621"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="352210621"
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="690160335"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="690160335"
Date: Wed, 18 Jan 2023 14:46:14 +0300
From: kirill.shutemov@linux.intel.com
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Kees Cook <keescook@chromium.org>, mark.rutland@arm.com,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	=?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	"H. Peter Anvin" <hpa@zytor.com>, jroedel@suse.de,
	dave.hansen@intel.com, kai.huang@intel.com
Subject: Re: [PATCH v2 1/7] x86/boot: Remove verify_cpu() from
 secondary_startup_64()
Message-ID: <20230118114614.x2shsi6s3noiopux@box.shutemov.name>
References: <20230116142533.905102512@infradead.org>
 <20230116143645.589522290@infradead.org>
 <Y8e/yKgVZgbqgvAG@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8e/yKgVZgbqgvAG@hirez.programming.kicks-ass.net>

On Wed, Jan 18, 2023 at 10:45:44AM +0100, Peter Zijlstra wrote:
> On Mon, Jan 16, 2023 at 03:25:34PM +0100, Peter Zijlstra wrote:
> > The boot trampolines from trampoline_64.S have code flow like:
> > 
> >   16bit BIOS			SEV-ES				64bit EFI
> > 
> >   trampoline_start()		sev_es_trampoline_start()	trampoline_start_64()
> >     verify_cpu()			  |				|
> >   switch_to_protected:    <---------------'				v
> >        |							pa_trampoline_compat()
> >        v								|
> >   startup_32()		<-----------------------------------------------'
> >        |
> >        v
> >   startup_64()
> >        |
> >        v
> >   tr_start() := head_64.S:secondary_startup_64()
> > 
> > Since AP bringup always goes through the 16bit BIOS path (EFI doesn't
> > touch the APs), there is already a verify_cpu() invocation.
> 
> So supposedly TDX/ACPI-6.4 comes in on trampoline_startup64() for APs --
> can any of the TDX capable folks tell me if we need verify_cpu() on
> these?
> 
> Aside from checking for LM, it seems to clear XD_DISABLE on Intel and
> force enable SSE on AMD/K7. Surely none of that is needed for these
> shiny new chips?

TDX has no XD_DISABLE set and it doesn't allow to write to
IA32_MISC_ENABLE MSR (triggers #VE), so we should be safe.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

