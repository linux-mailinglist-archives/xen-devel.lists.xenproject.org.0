Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640E1945E2B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771121.1181699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrqD-0005pT-Ai; Fri, 02 Aug 2024 12:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771121.1181699; Fri, 02 Aug 2024 12:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrqD-0005nz-7w; Fri, 02 Aug 2024 12:57:05 +0000
Received: by outflank-mailman (input) for mailman id 771121;
 Fri, 02 Aug 2024 12:57:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTZu=PB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1sZrqA-0005m0-Ul
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:57:03 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b54ddac8-50ce-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 14:57:01 +0200 (CEST)
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
X-Inumbo-ID: b54ddac8-50ce-11ef-8776-851b0ebba9a2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722603419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lD3D+R0O0Em71mRsMfaOIka63qjKDA7WWE2rtnMjgEU=;
	b=dZcUWZSGh9bGff4aCRomiWr1icF2Wg4bv0lRE9aRsL5FKsB8Q6pWnBY+f7tuYRIditgxTE
	7yvT7OEA1TVi9/w25Fjg4GbFzDfDlu4dl8AbarCh5bEB9fNsZzoi+5VBQsKK1kXdopM3SP
	KPexSQqTua7F3MXymturY2rwzgw/PIUhEQ5yeaSSqtGXn6EbTBi+JyzsPMpQeWXRIniH/Z
	o5oFfx+pMrUt92cANNTgUwKDsxx/3S3eXxWp/9vpR3ZbSTUiPkVflvXw1dS2ieI1F2v7Mw
	UCu+2AjwQREJxDSlfyydp/JUYekKS8C6hXDUKZQR4BOev8Lrz+oPsfTvcaAggA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722603419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lD3D+R0O0Em71mRsMfaOIka63qjKDA7WWE2rtnMjgEU=;
	b=LcS0nrflXj5N91hTteiaGk7vViHLu1+T9de/uWLDfB8oqgfeg2UYqnKEj7WaMjtHcxEwy/
	ocCi8Am6lrFvfPCg==
To: Alexey Dobriyan <adobriyan@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 2/3] x86/cpu: fix unbootable VMs by inlining memcmp in
 hypervisor_cpuid_base
In-Reply-To: <304592cf-e4a7-4ba1-baa6-4941c60f0e3c@p183>
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
 <304592cf-e4a7-4ba1-baa6-4941c60f0e3c@p183>
Date: Fri, 02 Aug 2024 14:56:58 +0200
Message-ID: <87frrn13s5.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Aug 02 2024 at 11:50, Alexey Dobriyan wrote:

Please amend functions with '()' in the subject line and the change log
consistently.

> diff --git a/arch/x86/include/asm/cpuid.h b/arch/x86/include/asm/cpuid.h
> index 6b122a31da06..3eca7824430e 100644
> --- a/arch/x86/include/asm/cpuid.h
> +++ b/arch/x86/include/asm/cpuid.h
> @@ -196,7 +196,20 @@ static inline uint32_t hypervisor_cpuid_base(const char *sig, uint32_t leaves)
>  	for_each_possible_hypervisor_cpuid_base(base) {
>  		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
>  
> -		if (!memcmp(sig, signature, 12) &&
> +		/*
> +		 * FIXME rewrite cpuid comparators to accept uint32_t[3].

Which comparators?

Thanks,

        tglx

