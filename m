Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D88A9895
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:32:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708239.1106933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPz0-0004GV-BT; Thu, 18 Apr 2024 11:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708239.1106933; Thu, 18 Apr 2024 11:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxPz0-0004Du-8O; Thu, 18 Apr 2024 11:31:14 +0000
Received: by outflank-mailman (input) for mailman id 708239;
 Thu, 18 Apr 2024 11:31:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxPyy-0004Do-FT
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:31:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27a3c5fe-fd77-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 13:31:10 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343b92e54f5so551450f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 04:31:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h1-20020a5d5481000000b003437a76565asm1622596wrv.25.2024.04.18.04.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 04:31:09 -0700 (PDT)
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
X-Inumbo-ID: 27a3c5fe-fd77-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713439870; x=1714044670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5Iaesl8Wtddqn1hEetvekHhZV+EdCXbrreVM0ABKBw=;
        b=Ipn/JBki6T4JcWp207UuxNbdpWUQeURdHmlqzMdHPgPvjQfCuTtsSwPddwFviJpWM6
         6+GVaTDZffcglv92YN7T/idqChjPaHGh6ek7oSSc3moK08vRDQJErd39985suHAL2V8B
         yYSpjOz2o3REfukAbNvKlgs+eam6EA3Bn0k3HgbYetpyLWYvuWUz4IHlVv4oH6IVh/5M
         EXqBPIx+UZujSt7ZgyHIRX0QzyWMuC81yFLCOfIbUmiX1enktIdG4u1eZ0iihCV9Ep28
         +6PQfBlqWL8Rqlh4W7wOT8fIfH5c/rLHSPIYU7GM8wrU3cgrfgLQTADnpypiSrJp4+F2
         b3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713439870; x=1714044670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5Iaesl8Wtddqn1hEetvekHhZV+EdCXbrreVM0ABKBw=;
        b=lMRRURZ3OsjqGTl8xFir1+z/NWDKcsYOCgKTvUp6LCrUhdoDqe9WWsPDX0N6oFh0mA
         /cpGecbrLbgt9M1JOUx7+4bVsNgR0kH15aSmZOj3hvyRG98A1q5iIsKr0eskBXrID8Vz
         VNmHUbuNb7UJdDjGdt3nz2EVOnBr5gTnvOOJqDLcyJUo+K8OmdwvSgZ2A1jD/tSM0c+H
         nF0OfyBx1wV4Dt9szqYMeYVLIYD3sDoPykGU6fQUYP9m6rcGz3t4R3Cv89H1mNJIf3OT
         5fojv9OLifi6Ek9MNltOkVfchfeUxYpvkjkI7co6S0yzbQ4TMbbIkl6GOsAAdwVKFLZQ
         Udyg==
X-Forwarded-Encrypted: i=1; AJvYcCXyo1LMEM8s7fJIDlg5kLVkSqtFKtpU89Ter0G6wLfn0ABujiy8DiJ2YU7I/R2s9IQf/Lq8Iz9rH2R8IAk5fJEGoibv0+SKeER4dXfy2lE=
X-Gm-Message-State: AOJu0Yyscm1sPek+05UTAwpLfyBb29Y9wgR4D6ZTSRTEa0WFEOC2G1kg
	gx7NF2olF+S1EvTDlFh7+Mt8Lqg2AsBxl3DHOd94C4SNZ0OUPJS+qH0jOjhlnA==
X-Google-Smtp-Source: AGHT+IFLrtS3IC8XnBeet2XRTDnpltvFre7QPdpIHZnV01osIgY7lj9rPWw7mg1/AMqqR3NInLFDRA==
X-Received: by 2002:adf:e60d:0:b0:346:65dd:560a with SMTP id p13-20020adfe60d000000b0034665dd560amr1613943wrm.3.1713439869829;
        Thu, 18 Apr 2024 04:31:09 -0700 (PDT)
Message-ID: <e8435c75-63c3-4a10-b266-6f4133c1cb9f@suse.com>
Date: Thu, 18 Apr 2024 13:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 03/15] x86/monitor: guard altp2m usage
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240416062503.3468942-1-Sergiy_Kibrik@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240416062503.3468942-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2024 08:25, Sergiy Kibrik wrote:
> Use altp2m index only when it is supported by the platform, i.e. VMX.
> The puspose of that is the possiblity to disable VMX support and
> exclude its code from the build completely.

I'm afraid this description doesn't make clear what problem there is,
which may be related to the fact that (as mentioned elsewhere by others)
altp2m isn't a VMX-specific thing. The field read by altp2m_vcpu_idx()
also looks to be zero for domains that never had altp2m enabled for them.
Further, ...

> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>      struct vcpu *curr = current;
>      vm_event_request_t req = {};
>      paddr_t gpa = (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
> +    unsigned int altp2m_idx = hvm_altp2m_supported() ?
> +                              altp2m_vcpu_idx(curr) : 0;

... elsewhere uses of altp2m_vcpu_idx() are guarded by altp2m_active()
checks. Why the domain-independent hvm_altp2m_supported() here?

Jan

