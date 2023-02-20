Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5859969D613
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 23:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498398.769254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUEDr-0005Ga-Us; Mon, 20 Feb 2023 22:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498398.769254; Mon, 20 Feb 2023 22:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUEDr-0005Dv-Rz; Mon, 20 Feb 2023 22:01:23 +0000
Received: by outflank-mailman (input) for mailman id 498398;
 Mon, 20 Feb 2023 22:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kFZ2=6Q=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pUEDp-0005DD-Ji
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 22:01:21 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ad5d070-b16a-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 23:01:19 +0100 (CET)
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
X-Inumbo-ID: 1ad5d070-b16a-11ed-93b5-47a8fe42b414
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1676930478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rfqBIrdn5rWMQ3+U0cKrDyXxSebET4rDLTATkZ1AnaI=;
	b=qLliU2OdF3CeCWdUu/vgg+84f2MEcYKOprom+1N3lo3YmqUY2WVd/egbgwUd54ueHzc75A
	MoZxZhkJi9KCH/zGuNwzYbZpsa4xsC9kNjUPSpzhB//fz5DNhl4SHHro5KqvRJaeIQ5IRc
	/8DIrz0rbH0cJB/Cluoq5OUIiJQF0E6A+AiTZFPrpT6jLodbuFZul1h9b5X694jV76zi4y
	OfP8mzpQmGt7NkjDn1auLZjcTgetZflhWDUyqNjWRjegKWRJM8P6QXZ5Rcy2LGy/1uqB3+
	W19YfkHtA3ahKQUADvW9bNOe6rTnG9dD/+w0SnT/Xb/F5JZoDTKXSJMcpXzbsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1676930478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rfqBIrdn5rWMQ3+U0cKrDyXxSebET4rDLTATkZ1AnaI=;
	b=yEZzRQZzZkp6F4iyf7NMpiysEygey1YR2ob12Bb9ctIazuHEPk6p4wSzkSdVo8P1IBuHRZ
	UYBZUPspScc/R2AQ==
To: Krister Johansen <kjlx@templeofstupid.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Anthony Liguori <aliguori@amazon.com>, David Reaver
 <me@davidreaver.com>, Brendan Gregg <brendan@intel.com>
Subject: Re: [PATCH linux-next 2/2] x86/xen/time: cleanup
 xen_tsc_safe_clocksource
In-Reply-To: <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
 <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
Date: Mon, 20 Feb 2023 23:01:18 +0100
Message-ID: <87h6vgov2p.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 20 2023 at 09:17, Krister Johansen wrote:
> @@ -495,8 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
>  	/* Leaf 4, sub-leaf 0 (0x40000x03) */
>  	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
>  
> -	/* tsc_mode = no_emulate (2) */
> -	if (ebx != 2)
> +	if (ebx != XEN_CPUID_TSC_MODE_NEVER_EMULATE)
>  		return 0;
>  
>  	return 1;

What about removing more stupidity from that function?

static bool __init xen_tsc_safe_clocksource(void)
{
	u32 eax, ebx. ecx, edx;
 
	/* Leaf 4, sub-leaf 0 (0x40000x03) */
	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);

	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
}

Thanks,

        tglx

