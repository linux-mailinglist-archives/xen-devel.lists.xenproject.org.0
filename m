Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D37A5C8A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 10:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604461.941844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiW6H-0001Gz-75; Tue, 19 Sep 2023 08:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604461.941844; Tue, 19 Sep 2023 08:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiW6H-0001Eo-4V; Tue, 19 Sep 2023 08:28:53 +0000
Received: by outflank-mailman (input) for mailman id 604461;
 Tue, 19 Sep 2023 08:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkrE=FD=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qiW6E-0001Ei-Jq
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 08:28:50 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ea3091c-56c6-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 10:28:49 +0200 (CEST)
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
X-Inumbo-ID: 8ea3091c-56c6-11ee-8789-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695112128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g/J3RiWKdg8c3IzdjWmLh9zLCv7VF76fYepXRQtkHb0=;
	b=U3ecSGCa3F2gvLLwz1Ij5s049fnE+mB8KhUG/kINpG9gVGfyTRvYvyyxoFnM0is9mqZ0Um
	RSFc8r37Ueg5axCqiQW0rdvc8RErKGb7CCXtfrEA+F38yE/AwhQCiw6v622RKTttoTvTCz
	RTJsf6jx1UlOXNAoqOTC/hQxrmZqNEgjEcZByd3DjNjh5CD9r/CIe13PTRRCK31Q+Tjkgd
	HZeL25W9eVSai+S77A3weyQcehuhDyUfqHcTht0GIWMmWmyLC8mi+I7+W8KgGxNCqcw46D
	Q1jY8vAZtTR3H02IWJgTCCmosSGbuL+SzPWJ3XPqStgVHKCRxUiHTGzMUMrnUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695112128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g/J3RiWKdg8c3IzdjWmLh9zLCv7VF76fYepXRQtkHb0=;
	b=Sl2Ncxcrp84n8qOLd17+QPVSsnJWwjTJhHEW5C5C3dyLrVSuoCsaT/WfyM/4UuDdWtvOxm
	EdqWbhFdtlEDc9Bg==
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, pbonzini@redhat.com,
 seanjc@google.com, peterz@infradead.org, jgross@suse.com,
 ravi.v.shankar@intel.com, mhiramat@kernel.org, andrew.cooper3@citrix.com,
 jiangshanlai@gmail.com
Subject: Re: [PATCH v10 36/38] x86/fred: Add fred_syscall_init()
In-Reply-To: <20230914044805.301390-37-xin3.li@intel.com>
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-37-xin3.li@intel.com>
Date: Tue, 19 Sep 2023 10:28:47 +0200
Message-ID: <87v8c6woqo.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Sep 13 2023 at 21:48, Xin Li wrote:
> +static inline void fred_syscall_init(void)
> +{
> +	/*
> +	 * Per FRED spec 5.0, FRED uses the ring 3 FRED entrypoint for SYSCALL
> +	 * and SYSENTER, and ERETU is the only legit instruction to return to
> +	 * ring 3, as a result there is _no_ need to setup the SYSCALL and
> +	 * SYSENTER MSRs.
> +	 *
> +	 * Note, both sysexit and sysret cause #UD when FRED is enabled.
> +	 */
> +	wrmsrl(MSR_LSTAR, 0ULL);
> +	wrmsrl_cstar(0ULL);

That write is pointless. See the comment in wrmsrl_cstar().

Thanks,

        tglx

