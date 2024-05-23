Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4758CD534
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728512.1133437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA8yy-00079T-Pr; Thu, 23 May 2024 13:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728512.1133437; Thu, 23 May 2024 13:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA8yy-00077T-NC; Thu, 23 May 2024 13:59:48 +0000
Received: by outflank-mailman (input) for mailman id 728512;
 Thu, 23 May 2024 13:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrMT=M2=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1sA8yy-00077N-4F
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 13:59:48 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6025bf8-190c-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 15:59:46 +0200 (CEST)
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
X-Inumbo-ID: b6025bf8-190c-11ef-b4bb-af5377834399
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1716472784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+N81KTAmxqigDRwmaMjHxrB3yOtm6eDGK4EsQAR05Bo=;
	b=3qmiiYvMYsQdwmhYZykoeLa6Ht9fNsda+B+xGXs1GtINIlgZdCjyTJxslL4JHmYMirFkmA
	SvFhg2Yar0leAwdeE7tbU0Bky3TyxDTKYATe8y+t/OnZ+9L32Gw7F/oWxSsWmrOwynHI0S
	pHlqIVsfymFZHsvS3PhYBeT1ZxzJa+Zp7+atlGMS3+LmymRRIBFD/HSrI44rxk/LcoBMht
	fEfMlF3G/a5qS1R5y7cncVNz7xWrTNHaZGvb/MiwRsMwXknOqBIoomgsChudRKmYvrhwx4
	3Egt3PuNvKTnlIjEc+PfKb+drs2SzYCsWB3J21eH1pJiCu9I/zMWJyTizxUfNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1716472784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+N81KTAmxqigDRwmaMjHxrB3yOtm6eDGK4EsQAR05Bo=;
	b=qzAcmqidEnAzvYGxC+ikZM7oqaU+gz4H5u+F3oRQcbZSXUCYE9t+BXk0btN4JIBr2WNikD
	7+9Q3vd5MlBPdbCQ==
To: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Jason
 Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH 4/5] x86/kernel: Move page table macros to new header
In-Reply-To: <20240410194850.39994-5-jason.andryuk@amd.com>
References: <20240410194850.39994-1-jason.andryuk@amd.com>
 <20240410194850.39994-5-jason.andryuk@amd.com>
Date: Thu, 23 May 2024 15:59:43 +0200
Message-ID: <87pltcfx2o.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Apr 10 2024 at 15:48, Jason Andryuk wrote:
> ---
>  arch/x86/kernel/head_64.S            | 22 ++--------------------
>  arch/x86/kernel/pgtable_64_helpers.h | 28 ++++++++++++++++++++++++++++

That's the wrong place as you want to include it from arch/x86/platform.

arch/x86/include/asm/....

Thanks,

        tglx

