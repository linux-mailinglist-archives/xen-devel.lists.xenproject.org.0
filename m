Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C667A0732
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 16:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602305.938795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnEl-0005xv-Db; Thu, 14 Sep 2023 14:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602305.938795; Thu, 14 Sep 2023 14:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgnEl-0005vn-Aq; Thu, 14 Sep 2023 14:22:31 +0000
Received: by outflank-mailman (input) for mailman id 602305;
 Thu, 14 Sep 2023 14:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgnEk-0005vh-QK
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:22:30 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 226e235a-530a-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 16:22:28 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40434d284f7so8185845e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:22:28 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 v26-20020a1cf71a000000b003fe1630a8f0sm5015544wmh.24.2023.09.14.07.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 07:22:28 -0700 (PDT)
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
X-Inumbo-ID: 226e235a-530a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694701348; x=1695306148; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ff9Ehpvke6LtFPxvHhzarjEmuj2e3YwgZf0e14rNLIQ=;
        b=aeTeZxwUhQC56luL0Ch3lZeTSxIVLwmHf5hUG7Th2jyWBp3ux/C4xCeIMk2Nhuqtn3
         BLzVxVGiwak7sjZ2eE20L0KTxg/Qw2wY4vj9xpj927xUvA7j1NoOEgwnRwmrdWMTPbm7
         ppIyJD7uByDvW6mE8R45g8aT2/ZlXqKz8E/+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694701348; x=1695306148;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ff9Ehpvke6LtFPxvHhzarjEmuj2e3YwgZf0e14rNLIQ=;
        b=QeJWF9XcHtY4XsAcK1p74yD3Y1KMcEjMJMqgR8PRkwMg2zzT3xMTEuycPYVGk7GVL+
         BeVuYYymrH2K3zoavqi6Qb4MzGflBc+NfKztM+XvllhDQsHC2a2SpPlpiebV4JI/aTtr
         93sZolCQ6hqgYKhQ6VVsLHD+cyNT4zDY8KAfAks7F6bShL/8/NohinpTwkiGsc6ITEIF
         SfeT5LZ0VSTM1VQV2K7GD1b0L+ySwZ9aoYJiozqICjnVnFYPDsa5g39K77JgQCZfwoLY
         KpfzoCAvuqqIMLHv1d1wgNPXBI0iGAK5Xb2LlYprH9PddpGQVyB+JGk2vFt8U3Ezcw02
         JOWw==
X-Gm-Message-State: AOJu0YyMwKpGvK3jDGZW0c8E6JJ7W0VzATnaHNgwqK2en+B3yz9t3GN1
	vkydzvBIq4ypBgtW3muDWo7AMA==
X-Google-Smtp-Source: AGHT+IFve9l57veSgCPqyrpryNeRPxRNyvtIANtQFRamRYlphhlxA6Tmolp/NSw7/qlFLxzi7VWxww==
X-Received: by 2002:a7b:c414:0:b0:402:fe6d:6296 with SMTP id k20-20020a7bc414000000b00402fe6d6296mr4934579wmi.9.1694701348349;
        Thu, 14 Sep 2023 07:22:28 -0700 (PDT)
Message-ID: <cd4979cf-bcf4-75b4-a18b-c61a9b2e0ffb@citrix.com>
Date: Thu, 14 Sep 2023 15:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v10 05/38] x86/trapnr: Add event type macros to
 <asm/trapnr.h>
Content-Language: en-GB
To: Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
 jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
 jiangshanlai@gmail.com
References: <20230914044805.301390-1-xin3.li@intel.com>
 <20230914044805.301390-6-xin3.li@intel.com>
In-Reply-To: <20230914044805.301390-6-xin3.li@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 5:47 am, Xin Li wrote:
> Intel VT-x classifies events into eight different types, which is
> inherited by FRED for event identification. As such, event type
> becomes a common x86 concept, and should be defined in a common x86
> header.
>
> Add event type macros to <asm/trapnr.h>, and use it in <asm/vmx.h>.
>
> Suggested-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>
> ---
>  arch/x86/include/asm/trapnr.h | 12 ++++++++++++
>  arch/x86/include/asm/vmx.h    | 17 +++++++++--------
>  2 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/include/asm/trapnr.h b/arch/x86/include/asm/trapnr.h
> index f5d2325aa0b7..ab7e4c9d666f 100644
> --- a/arch/x86/include/asm/trapnr.h
> +++ b/arch/x86/include/asm/trapnr.h
> @@ -2,6 +2,18 @@
>  #ifndef _ASM_X86_TRAPNR_H
>  #define _ASM_X86_TRAPNR_H
>  
> +/*
> + * Event type codes used by both FRED and Intel VT-x

And AMD SVM.  This enumeration has never been unique to just VT-x.

> + */
> +#define EVENT_TYPE_EXTINT	0	// External interrupt
> +#define EVENT_TYPE_RESERVED	1
> +#define EVENT_TYPE_NMI		2	// NMI
> +#define EVENT_TYPE_HWEXC	3	// Hardware originated traps, exceptions
> +#define EVENT_TYPE_SWINT	4	// INT n
> +#define EVENT_TYPE_PRIV_SWEXC	5	// INT1
> +#define EVENT_TYPE_SWEXC	6	// INT0, INT3

Typo.  into, not int0  (the difference shows up more clearly in lower case.)

> diff --git a/arch/x86/include/asm/vmx.h b/arch/x86/include/asm/vmx.h
> index 0e73616b82f3..c84acfefcd31 100644
> --- a/arch/x86/include/asm/vmx.h
> +++ b/arch/x86/include/asm/vmx.h
> @@ -374,14 +375,14 @@ enum vmcs_field {
>  #define VECTORING_INFO_DELIVER_CODE_MASK    	INTR_INFO_DELIVER_CODE_MASK
>  #define VECTORING_INFO_VALID_MASK       	INTR_INFO_VALID_MASK
>  
> -#define INTR_TYPE_EXT_INTR              (0 << 8) /* external interrupt */
> -#define INTR_TYPE_RESERVED              (1 << 8) /* reserved */
> -#define INTR_TYPE_NMI_INTR		(2 << 8) /* NMI */
> -#define INTR_TYPE_HARD_EXCEPTION	(3 << 8) /* processor exception */
> -#define INTR_TYPE_SOFT_INTR             (4 << 8) /* software interrupt */
> -#define INTR_TYPE_PRIV_SW_EXCEPTION	(5 << 8) /* ICE breakpoint - undocumented */
> -#define INTR_TYPE_SOFT_EXCEPTION	(6 << 8) /* software exception */
> -#define INTR_TYPE_OTHER_EVENT           (7 << 8) /* other event */
> +#define INTR_TYPE_EXT_INTR		(EVENT_TYPE_EXTINT << 8)	/* external interrupt */
> +#define INTR_TYPE_RESERVED		(EVENT_TYPE_RESERVED << 8)	/* reserved */
> +#define INTR_TYPE_NMI_INTR		(EVENT_TYPE_NMI << 8)		/* NMI */
> +#define INTR_TYPE_HARD_EXCEPTION	(EVENT_TYPE_HWEXC << 8)		/* processor exception */
> +#define INTR_TYPE_SOFT_INTR		(EVENT_TYPE_SWINT << 8)		/* software interrupt */
> +#define INTR_TYPE_PRIV_SW_EXCEPTION	(EVENT_TYPE_PRIV_SWEXC << 8)	/* ICE breakpoint - undocumented */

ICEBP/INT1 is no longer undocumented.

~Andrew

