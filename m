Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD83CB32E6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 15:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182987.1505779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTLMa-0003nm-G7; Wed, 10 Dec 2025 14:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182987.1505779; Wed, 10 Dec 2025 14:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTLMa-0003lB-DW; Wed, 10 Dec 2025 14:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1182987;
 Wed, 10 Dec 2025 14:40:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vTLMY-0003l5-SM
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 14:40:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vTLMX-003GZa-0w;
 Wed, 10 Dec 2025 14:40:17 +0000
Received: from [2a01:cb15:80df:da00:d2b0:117d:791c:30c0] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vTLMX-008VeW-0g;
 Wed, 10 Dec 2025 14:40:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=PnBfQblPeOHXUj0Eaq8Uk+egKrZisOUmmYlmDocgmt4=; b=tD2b7qHFQ7oYwtOmSDDTwRGIJN
	/rQMpK0ZiRqh+bnYPefiOQA8+p/aTxWRs8CuWxJZfchlNXnPchYKpq6LxRDz1Sc4f1YJiG+n9K70B
	Q4gubZFsUAcDs+8afmyN4gg8w+cyN8XteQApChyebyJWx6/rAkhrgM1lc2rxrwjAULJM=;
Date: Wed, 10 Dec 2025 15:40:13 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Victor Lira <victorm.lira@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
Message-ID: <aTmGTWIO2ZKWuQeu@l14>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209214728.278949-3-jason.andryuk@amd.com>

On Tue, Dec 09, 2025 at 04:47:28PM -0500, Jason Andryuk wrote:
> diff --git a/xen/Makefile b/xen/Makefile
> index e6cf287425..aeb5dcf2ee 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -469,10 +469,13 @@ all-symbols-$(CONFIG_FAST_SYMBOL_LOOKUP) += --sort-by-name
>  
>  include $(srctree)/arch/$(SRCARCH)/arch.mk
>  
> +XEN_FINAL_LDFLAGS-$(CONFIG_GC_SECTIONS) := --gc-sections

Is there a good reason to add this flags after the arch-specific
makefiles? If not, could you move that just before, and right after the
definition of "$(all-symbols)" as it's a variable that is used in the
same phase of the build. (With Jan's other feedback)

>  # define new variables to avoid the ones defined in Config.mk
>  export XEN_CFLAGS := $(CFLAGS)
>  export XEN_AFLAGS := $(AFLAGS)
>  export XEN_LDFLAGS := $(LDFLAGS)
> +export XEN_FINAL_LDFLAGS := $(LDFLAGS) $(XEN_FINAL_LDFLAGS-y)

"FINAL" isn't very descriptive. A completely wrong interpretation might
be that we should use the "final" variable instead of "XEN_LDFLAGS". How
about a name that describe where this set of flags is going to be used,
like "XEN_LDFLAGS_xen_syms" (which unfortunately doesn't exactly fit
with x86 xen.efi target), or maybe suffix it with "_target" or just
"_xen"? (In Linux build system, they use "LDFLAGS_vmlinux", but I don't
know what would be the equivalent of "vmlinux" in our build system.)

The prefix "XEN_" is used as namespace, with one reason described in the
comment.

Also, could you use $(XEN_LDFLAGS) instead of $(LDFLAGS) ?

Cheers,

-- 
Anthony PERARD

