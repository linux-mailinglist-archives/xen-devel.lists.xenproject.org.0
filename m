Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB64AA6E7
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 06:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265890.459457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGDbU-00089k-Ay; Sat, 05 Feb 2022 05:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265890.459457; Sat, 05 Feb 2022 05:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGDbU-00087G-7z; Sat, 05 Feb 2022 05:27:20 +0000
Received: by outflank-mailman (input) for mailman id 265890;
 Sat, 05 Feb 2022 03:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NIY/=SU=linux.intel.com=ricardo.neri-calderon@srs-se1.protection.inumbo.net>)
 id 1nGBQ6-0003qp-5I
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 03:07:26 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbce3f5e-8630-11ec-8f75-fffcc8bd4f1a;
 Sat, 05 Feb 2022 04:07:22 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 19:07:20 -0800
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2022 19:07:20 -0800
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
X-Inumbo-ID: bbce3f5e-8630-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644030442; x=1675566442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SVt+kz06lumoHSJeOZCowvMvVSRtLKaNCZWiLQNIEik=;
  b=ZiMEAJ/hoN4nKUT3QfTeYEseCkyDDmGcQ4IX9hhq8Nl/YDXGFtj8xeEk
   gRiKNxp72fxwtzeeidVLZH9tZngMNwWjLk9FkM0DxuGA5uQliPSQWbTg8
   2KG2jf02Tb0ZWNipEr0a2lNBMYBIsPfasR8/ECTkalwby7cAAjLjD8GLu
   T6PX4iwmaGXNoY8oy5rh6iQkkaDr7dUjt5p1LkuCkvIzJO6isjnJKAnU1
   Hs9ESMMG1Uc8AP2Hbwc4PYcnwYCzCPyFDoigtjtglSJG5qA+Nx2s1kG2g
   bQ0dg1O6BNmVIcz6c4NKgQ4QrJ8lNqGT4bSe7/8d8rJgwpaTXfdly34aC
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="272990459"
X-IronPort-AV: E=Sophos;i="5.88,344,1635231600"; 
   d="scan'208";a="272990459"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,344,1635231600"; 
   d="scan'208";a="621020506"
Date: Fri, 4 Feb 2022 19:09:09 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: x86: insn-eval.c's use of native_store_gdt()
Message-ID: <20220205030909.GA12533@ranerica-svr.sc.intel.com>
References: <0d687d64-1cf0-8965-0569-bce27cf0a8b7@suse.com>
 <68c4f398-0494-e272-47e0-6803b6865f15@suse.com>
 <87fsoyd8rl.ffs@tglx>
 <f1710902-3085-0f7b-54d3-d65ac5b09e32@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1710902-3085-0f7b-54d3-d65ac5b09e32@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Feb 04, 2022 at 03:13:52PM +0100, Jan Beulich wrote:
> On 04.02.2022 15:08, Thomas Gleixner wrote:
> > On Fri, Feb 04 2022 at 10:23, Jan Beulich wrote:
> >> On 30.11.2021 12:09, Jan Beulich wrote:
> >>> I think it is b968e84b509d ("x86/iopl: Fake iopl(3) CLI/STI usage")
> >>> which uncovered an issue with get_desc() trying to access the GDT, as
> >>> introduced by 670f928ba09b ("x86/insn-eval: Add utility function to
> >>> get segment descriptor"). When running in a PV domain under Xen, the
> >>> (hypervisor's) GDT isn't accessible; with UMIP enabled by Xen even
> >>> SGDT wouldn't work, as the kernel runs in ring 3.
> >>>
> >>> There's currently no hypercall to retrieve a descriptor from the GDT.
> >>> It is instead assumed that kernels know where their present GDT
> >>> lives. Can the native_store_gdt() be replaced there, please?
> >>>
> >>> For context (I don't think it should matter much here) I'm observing
> >>> this with the kernel put underneath a rather old distro, where
> >>> hwclock triggers this path.
> >>
> >> I'd like to note that the issue still exists in 5.16.
> > 
> > I'd like to note, that I've seen no patches to that effect.
> 
> I could have worded it that way as well, yes.

Hi Jan, I am sorry I missed your email. I'll look at the issue you
describe and get back to you.

Thanks and BR,
Ricardo

