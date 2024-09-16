Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1068979B6A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799170.1209056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Wt-0005ar-7m; Mon, 16 Sep 2024 06:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799170.1209056; Mon, 16 Sep 2024 06:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Wt-0005Ws-2w; Mon, 16 Sep 2024 06:48:11 +0000
Received: by outflank-mailman (input) for mailman id 799170;
 Mon, 16 Sep 2024 06:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5Wr-0005Bn-Ld
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:48:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a24b5963-73f7-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 08:48:09 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so486452066b.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:48:09 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906133049csm268864066b.205.2024.09.15.23.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:48:07 -0700 (PDT)
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
X-Inumbo-ID: a24b5963-73f7-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726469288; x=1727074088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a4iLfOTw0rRlcCEu6pfY5VjVYoDxS0zqlVvF9jvFUWk=;
        b=LRVLRLbDOLY6qIjO/154OydTrXXIfz9FVJV9aXfzWIRYobONUivbR02pBcrlTUCV2X
         quPjlpsumI03Tnoir39Ou8OPTEks6IA2bhIzGC/8HlGpybJ7gk3bat+72XlTgIBi7jU4
         k9Wpa1zQELu9Oa5z6aMJtgiykNzamUy51jKT0ZHiXOmbJtR6CPk+G2lMTh4cA5n0HNBD
         BVrkDTfdl61N1RS3v6wbv6dJA5oBxOPq3nyYGD5bww94m08HWs9B01Iay0CIriWHg1hN
         0IFMyNtjonIMk9aB0D53OqZakfjifgAgGF4iyOI1uJjhMzSRHltCpy4cKAObDl+A2bCo
         0Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726469288; x=1727074088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a4iLfOTw0rRlcCEu6pfY5VjVYoDxS0zqlVvF9jvFUWk=;
        b=qlx4/k91k2oLtgEACJDFq+LEl7ifJlVC5t2jm4n5tbpz8JNUb+2DPmqoq5sXqu1gS/
         d4Fg17ZZBRuUME5E6S2FRkNpJRIPH7SSAyjWpxhPNr6Bqyhs/hSIfajfohVeADRfbqhJ
         knYxKH/6i2ctN09C1sAZWfAnwJVSKGv52CxNGTFzsWd7z3iqia+/buwldp9NoImh+750
         zuy0POk/fn289U//+NdxGx7zzscNr3K5rcDWMMtO0RzdJtv35qpgZRPxhJPD6jcwNAun
         1YI85OvZzDkfHHosprTlzeSWJdrm2RjNxc09k+yiS+HVul2D5c5JzJjQrYtPzU0d4lR7
         WsEg==
X-Forwarded-Encrypted: i=1; AJvYcCVgTGtnnF5xIls5awfdGWF/dkp1vfeXZ4AWFUVH/thM/PR/27VqBexG5HeFS6+0zX8YaVJxlfFl9SE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKm4ZrtHeuEwZD5vsfd+qv194/8ePXT7rts0crID5k8+/OgSID
	wPMWyi+BQMqshJMNUuKdPw6/0C5AFqnjAxqhE8dA+l1uM3S1x7Jygzk8VkBErw==
X-Google-Smtp-Source: AGHT+IFH3FlrnH0RjkXTaatUjku1yUZKzIDEUZYg3ZM5O0Ep5iimOoBUbaML7NamO8+FqFSo9XDIbw==
X-Received: by 2002:a17:907:f752:b0:a86:a481:248c with SMTP id a640c23a62f3a-a90294465abmr1272086266b.19.1726469288174;
        Sun, 15 Sep 2024 23:48:08 -0700 (PDT)
Message-ID: <d0675928-3261-42cb-96d8-95b626e6552e@suse.com>
Date: Mon, 16 Sep 2024 08:48:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] xen/riscv: introduce functionality to work with
 CPU info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <461a246e3a54345578556821f2c7dbf01e348a05.1726242605.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <461a246e3a54345578556821f2c7dbf01e348a05.1726242605.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 17:57, Oleksii Kurochko wrote:
> Introduce struct pcpu_info to store pCPU-related information.
> Initially, it includes only processor_id and hart id, but it
> will be extended to include guest CPU information and
> temporary variables for saving/restoring vCPU registers.
> 
> Add set_processor_id() function to set processor_id stored in
> pcpu_info.
> 
> Define smp_processor_id() to provide accurate information,
> replacing the previous "dummy" value of 0.
> 
> Initialize tp registers to point to pcpu_info[0].
> Set processor_id to 0 for logical CPU 0 and store the physical
> CPU ID in pcpu_info[0].
> 
> Introduce helpers for getting hart_id ( physical CPU id in RISC-V
> terms ) from Xen CPU id.
> 
> Removing of <asm/processor.h> inclusion leads to the following
> compilation error:
>   common/keyhandler.c: In function 'dump_registers':
>   common/keyhandler.c:200:13: error: implicit declaration of function
>      'cpu_relax' [-Werror=implicit-function-declaration]
>   200 |             cpu_relax();

What is this paragraph about? It may be stale, or it may be lacking
information / context on what it tries to explain.

> @@ -14,6 +16,22 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>   */
>  #define park_offline_cpus false
>  
> +/*
> + * Mapping between Xen logical cpu index and hartid.
> + */
> +static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
> +{
> +    return pcpu_info[cpuid].hart_id;
> +}
> +
> +static inline void map_cpuid_to_hartid(unsigned long cpuid,
> +                                       unsigned long hartid)
> +{
> +    pcpu_info[cpuid].hart_id = hartid;
> +}

"map" is ambiguous - it may mean both "get" or "set". May I ask that
this become "set", just like for the processor-ID helper?

Jan

