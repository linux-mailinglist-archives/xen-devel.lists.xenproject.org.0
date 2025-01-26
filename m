Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F4A1CEBD
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877326.1287472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9xy-0004uZ-FH; Sun, 26 Jan 2025 21:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877326.1287472; Sun, 26 Jan 2025 21:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9xy-0004sh-CZ; Sun, 26 Jan 2025 21:14:50 +0000
Received: by outflank-mailman (input) for mailman id 877326;
 Sun, 26 Jan 2025 21:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9xw-0004qC-6H
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:14:48 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91611d32-dc2a-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 22:14:46 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-2eed82ca5b4so6507545a91.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:14:46 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb193e1sm5644337a91.42.2025.01.26.13.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:14:44 -0800 (PST)
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
X-Inumbo-ID: 91611d32-dc2a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926085; x=1738530885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
        b=rsszn5uqTubgBIOCdr6W1Jnbclu9mGaKxjnhzpARcn9xo6g2VBN9IgWFBcYCeZN5CP
         uXW39ZQM3YtJUrKk21Wf0nfL4jzZxDe+vyxnMu1HT1FN5YaWUQPP3mlDjjXkLS2NReH5
         jnBCYcnjG3tCn3MtKKMovljfz3Vz+aBPlgYSDW7TNREiTPBnDABlO+6EgWPuHbAn2G1G
         LIPECxukaoGMKUPheRZxAdV4UAKjAvUWqLh1SYNlklkz2g2HJ40GmRrf3kra/B+tx7Gg
         brCIma3ab0DVGoMSktECR27DNbuNgwLlqxmCvsLVyOI6zXZeDuCV3iSQPr8MNdNq6HCs
         dvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926085; x=1738530885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM482TolBOr/dYb2pXuY2SYJtabVGHzvURXSW1TjI40=;
        b=P6CCZOqZ0RKQEVqUkk3lRE2mYs0WSXV0Nx/KaW9YlgvCsZnowYsR6VxfWpcpQlpA7l
         gZARtEDTFDmO1Lca8oNnCXrn3gb3P1Nf4dbcR2rfjjHLYGbg744bQWM2kPbC2idLOH/I
         T6j0WUMD6skEtoq5TIvw0cFlRM61TnSUVtAgd3Oh0rxxxfImGvIP9pEJYMvDf7S7izs/
         +en4mbbqrzdwPF+JBgZet9CIKmP5jpl70yh1NWC+SCDfOn0MgVnOILg4tNRN0Fuwz8WW
         5xgfvrH3q1ok0eQg/lxPgzUGkJzKp7a7qscwioYsQeSAlkAYbqdZh8VtVU4dpnudSpfB
         YX0w==
X-Forwarded-Encrypted: i=1; AJvYcCXf1kXN86nt6eibjWBsPidLpNAwiUqETDOx0/W/HTnkDEDPko1ZuXwXksgVwJZws8/Qvb7bVQTP2yg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1s29wuoKkTRkz/2WgScdrKMZKLNBSHwCg1OeT9O8zUud50pXh
	PqgYndtkhfFuim8VTFSax03PGXRhK8NIvAAJOxtTscUYvM+wRQL4K6tgfN0WPKQ=
X-Gm-Gg: ASbGncv/7/9+2jEHzEiZaVdzsiiOr+Dx4Kj3qXvolgtu0EXOQlCx0JOHkmfwGd1/K7p
	lOW94HEt8LRbgXljvuNl7OSrd3IAEcWJpaxp7HYjm7xn6ezY7xfTmVL5TCBtUUxv+RMlUuzpQVC
	RdjRC+Ap1IENcJdBAVRr9U84dc1gjnNmj4XBYRi0nQxfrAwoiXBvw9M8URdKgWXMsHOPO0xnb6S
	8SLzPL0tS6VjVaPrwBcVmaBa86vZHhJxHoUWazPG2G1dKne5sZBXxGpTqvP2uTlnf83NMU7iOeO
	fZgzhtS8o8uRQ4EGiBNK9xGSe8Fabuex5CtVhgZEGAuGFDM=
X-Google-Smtp-Source: AGHT+IE1AaZn04VsAmZoovvHskfFwwHs+/I0v2XJVpXr12XD+Jd8EH5sfL0xlHcxmhZL8x5QsccIOQ==
X-Received: by 2002:a17:90b:2f50:b0:2ee:fdf3:38ea with SMTP id 98e67ed59e1d1-2f782d32c45mr47771107a91.23.1737926085217;
        Sun, 26 Jan 2025 13:14:45 -0800 (PST)
Message-ID: <f7c1590d-5c61-4408-92c9-7241aed2c6be@linaro.org>
Date: Sun, 26 Jan 2025 13:14:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] cpus: Fix style in cpu-target.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Fix style on code we are going to modify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index 6d8b7825746..a2999e7c3c0 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -47,12 +47,15 @@ static int cpu_common_post_load(void *opaque, int version_id)
>   {
>       CPUState *cpu = opaque;
>   
> -    /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
> -       version_id is increased. */
> +    /*
> +     * 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
> +     * version_id is increased.
> +     */
>       cpu->interrupt_request &= ~0x01;
>       tlb_flush(cpu);
>   
> -    /* loadvm has just updated the content of RAM, bypassing the
> +    /*
> +     * loadvm has just updated the content of RAM, bypassing the
>        * usual mechanisms that ensure we flush TBs for writes to
>        * memory we've translated code from. So we must flush all TBs,
>        * which will now be stale.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

