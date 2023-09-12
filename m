Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399679D669
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 18:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600670.936399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6MB-0006Ce-Dy; Tue, 12 Sep 2023 16:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600670.936399; Tue, 12 Sep 2023 16:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg6MB-0006A9-An; Tue, 12 Sep 2023 16:35:19 +0000
Received: by outflank-mailman (input) for mailman id 600670;
 Tue, 12 Sep 2023 16:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mt1s=E4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qg6MA-0006A3-7o
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 16:35:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5afcdd6b-518a-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 18:35:17 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401da71b85eso63967225e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Sep 2023 09:35:17 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n17-20020a1c7211000000b003fe1630a8f0sm16435390wmc.24.2023.09.12.09.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 09:35:16 -0700 (PDT)
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
X-Inumbo-ID: 5afcdd6b-518a-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694536516; x=1695141316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WuEmxMleklPw86um4iVPywee7TiPX6THf/XHkQqxfvM=;
        b=PCcXQWdFUoYWLcon3qeZciA78tno/Zm9eRIxvwJW7w9R1aYWDcXaIKIcNIeXyQoo57
         cx5Znx6bDaNmmoaQ94Ylpn73ihk99/RtR11m1P1cLSUAv1gNNkH4r5OT8f/VvZw3Gm8a
         Q1PscHz3VA6pS/LIi6XQ3GVn2llkEy3plD5iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694536516; x=1695141316;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuEmxMleklPw86um4iVPywee7TiPX6THf/XHkQqxfvM=;
        b=mO7ljRkPwmkLiweFPjNGlQNbDqC8A850q55OiH0UUjjbjI/WKQ+dvwSzCF5UFNqDwG
         iXJfHMfNorv81ZE+9UxK5uBwNDRa87L6FiRPv0kyVfTcYk81t719yxbSfU0V1nn/EXPr
         2QLDfB/cAFd+O//CKKER794oTSJ7EWWY7fce9DArtP+hl/k+NoVH1BQt4BMLhweR9DBm
         6BJBGs343acVtt6Ad972IXbNTweTWvkPm2srbnL/Z7MiK335yNcN20XxZDa0SSswjaQg
         DGd9lcKpt+BSBshc95xnCFoPphDvTBsojLQ+2kkNadTsUGIxqjwNlkp7lIN/5EBG54aH
         /+EQ==
X-Gm-Message-State: AOJu0YyHmnwAgN9C/MLcEjicCg8PIg4yIMQicnxPEX1x+BA7tNe7Kc3n
	UREeBkqrA4eyKAEn96IRYu4g9w==
X-Google-Smtp-Source: AGHT+IHFhrfSx9bYQvWs2H1ziekUE4RXPvwPYB65/2peoFXrK20EBpyyLvuzNV0YeEGwq3pPvvGnyw==
X-Received: by 2002:a05:600c:1d19:b0:403:bb04:2908 with SMTP id l25-20020a05600c1d1900b00403bb042908mr2239058wms.23.1694536516460;
        Tue, 12 Sep 2023 09:35:16 -0700 (PDT)
Message-ID: <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
Date: Tue, 12 Sep 2023 17:35:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 solene@openbsd.org,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20230912162305.34339-1-roger.pau@citrix.com>
In-Reply-To: <20230912162305.34339-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
> set, and will also attempt to unconditionally access HWCR if the TSC is
> reported as Invariant.
>
> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
> a suitable solution.
>
> In order to fix expose an empty HWCR.

At first I was thinking a straight up revert, but AMD's CPUID Faulting
is an architectural bit in here so it's worth keeping the register around.

>
> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Not sure whether we want to expose something when is_cpufreq_controller() is
> true, seeing as there's a special wrmsr handler for the same MSR in that case.
> Likely should be done for PV only, but also likely quite bogus.
>
> Missing reported by as the issue came from the QubesOS tracker.

Well - we can at least have a:

Link: https://github.com/QubesOS/qubes-issues/issues/8502

in the commit message, and it's probably worth asking Solène / Marek
(both CC'd) if they want a Reported-by tag.

> ---
>  xen/arch/x86/msr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index 3f0450259cdf..964d500ff8a1 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>      case MSR_K8_HWCR:
>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>              goto gp_fault;
> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
> +        /*
> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
> +         * also poke at PSTATE0.
> +         */

While this is true, the justification for removing this is because
TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.

Also because it's addition without writing into the migration stream was
bogus irrespective of the specifics of the bit.

I'm still of the opinion that it's buggy for OpenBSD to be looking at
model specific bits when virtualised, but given my latest reading of the
AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
can see TSC_FREQ_SEL.

In some theoretical future where the toolstack better understands MSRs
and (non)migratable VMs (which is the QubesOS usecase), then it would in
principle be fine to construct a VM which can see the host TSC_FREQ_SEL
and PSTATE* values.

Preferably with an adjusted comment, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

~Andrew

