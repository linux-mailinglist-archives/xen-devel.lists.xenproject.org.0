Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0512FCD57
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 10:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71286.127543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29ds-0006sB-G3; Wed, 20 Jan 2021 09:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71286.127543; Wed, 20 Jan 2021 09:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29ds-0006rm-Cq; Wed, 20 Jan 2021 09:19:08 +0000
Received: by outflank-mailman (input) for mailman id 71286;
 Wed, 20 Jan 2021 09:19:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l29dq-0006rh-3d
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 09:19:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2c1688b-4b72-4e2b-b074-c454a072a26b;
 Wed, 20 Jan 2021 09:19:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F43BAAAE;
 Wed, 20 Jan 2021 09:19:03 +0000 (UTC)
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
X-Inumbo-ID: d2c1688b-4b72-4e2b-b074-c454a072a26b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611134343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C9alOZ5d+yMij6qF1P/tzedckc66XovK63NYhYMjans=;
	b=s4niSRYXOZ0iZBSnE9qt60tIOsVDlraA3U+38mJYPU11NllBK/s9uKvlNfJxrBQyswZkdT
	vw3lGDhPsgu83IqlLqzufskqn0yWtR7PlGyN0njjren8v1KdzXv4xwZLbW6ZwhN3PYedyJ
	a9HJgGtUJTLfU0NUvEXFy55Gy5dcE4Q=
Subject: Re: [PATCH 3/3] x86: Support booting under Secure Startup via SKINIT
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Norbert_Kami=c5=84ski?= <norbert.kaminski@3mdeb.com>,
 Marek Kasiewicz <marek.kasiewicz@3mdeb.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>,
 Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Rich Persaud <persaur@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c24ddd1-a443-9da8-d840-93a5518b741f@suse.com>
Date: Wed, 20 Jan 2021 10:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115231046.31785-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.01.2021 00:10, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -834,6 +834,29 @@ void load_system_tables(void)
>  	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
>  }
>  
> +static void skinit_enable_intr(void)
> +{
> +	uint64_t val;
> +
> +	/*
> +	 * If the platform is performing a Secure Launch via SKINIT
> +	 * INIT_REDIRECTION flag will be active.
> +	 */
> +	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
> +	     !(val & VM_CR_INIT_REDIRECTION) )
> +		return;
> +
> +	ap_boot_method = AP_BOOT_SKINIT;
> +
> +	/*
> +	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
> +	 * enabling GIF, so a pending INIT resets us, rather than causing a
> +	 * panic due to an unknown exception.
> +	 */
> +	wrmsr_safe(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);

Why wrmsr_safe() without checking its return value? If the write
faults, we're hosed anyway, aren't we, so we may as well crash on
the offending WRMSR rather than some time later?

Jan

