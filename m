Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA087198B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 10:26:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688653.1073107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR3w-0001kJ-BL; Tue, 05 Mar 2024 09:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688653.1073107; Tue, 05 Mar 2024 09:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR3w-0001in-8M; Tue, 05 Mar 2024 09:26:16 +0000
Received: by outflank-mailman (input) for mailman id 688653;
 Tue, 05 Mar 2024 09:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhR3v-0001fb-6X
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 09:26:15 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68a909d8-dad2-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 10:26:13 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a4532f84144so249464266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 01:26:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a170906d21100b00a457a55b814sm1444630ejz.73.2024.03.05.01.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:26:12 -0800 (PST)
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
X-Inumbo-ID: 68a909d8-dad2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709630772; x=1710235572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JJo3GMuGF6faUVrtPbVVv//0bNWCj/rHRTAK1KsgDA=;
        b=KzBoHVQ9NLC9ADdTqpP2MyKUJxby0ftI7r1AVYYmA6GC4x8KTc0Qc7BgAQK3J++XKv
         V0maASOwCHJkk3CtOFr31MM4qD7yXrqvMAnG4aSqXgh7FMupXMrxzy484CNJdeY6deU/
         NaTOa2ous2qIDpZeDFUymaOpamSBt2/H8JmpgPh4VifYpg4P29M9N8G2Ux7viASbEnj+
         KrdimLKWbPYeGrEpj+B/+YihGEq5orIvyazrbgOGUDLkGfBj7DCL4mgqN5ijyqCpf7Qp
         AIHsIHMDjtxdjBpMHTOIAd9cQBZwFB9QOg1JVANetp/va+PpuWvm5UUKVJpQkorm18eJ
         fj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630772; x=1710235572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JJo3GMuGF6faUVrtPbVVv//0bNWCj/rHRTAK1KsgDA=;
        b=LW/42XoA8ll9ACplKZ106cQxss6n5GPeKSqAR+i33OE17U/0hY/n1xw5Ee4nxx05+W
         lm717kr2j5+wwdb6u5BSmczWCDwBxtQ5EutRn5UCvhQs12BgZUp5P5r1g5enI08BXfIN
         WmZVLCZfdkWr0y1xJfwrsiV1F54lJmYcrbpPcesmkLi7qHM5oWZQsUwFQoFwGiwHTK6D
         b9JdDorw62K6sVvJ2cRAdgt6pf2lkik72pIwOler9ktyqXdT5CMLdWycoY0jC95hxW/Q
         mK+zbOArKDdMFFlrOv8CZLwrS6fJX6d20300asX9USV/uqWnrn8gOo6dFvL0laY0SRyI
         2oxg==
X-Forwarded-Encrypted: i=1; AJvYcCX1PED7DuaetdwytW2D4j+BvwyU9rJ3mBlvZMuBI6akkLXk9yfb4Djzf45zn/lXgSN0Y6vF+ZEf6066wcNva1LKvNYl8lilU3XRI9Z1vmg=
X-Gm-Message-State: AOJu0YwkrfqRMDXdKIhxgMnGHq2uDpSrGTN2lUWax6NevFc6K1aV+uWk
	wZY+8FwrshJS/6975BkHOL6Ax/lzl2EClAd4QmK2SahChcMLLjVvPORhuH6A/Q==
X-Google-Smtp-Source: AGHT+IGSXirh1+eyuhVCCqfAnIN1KKxuzFQDHjYS4lMFcSJVyOdZAWBc4WBmC4IVp4xZaRcxSVSQUw==
X-Received: by 2002:a17:906:f2cb:b0:a45:a814:1cac with SMTP id gz11-20020a170906f2cb00b00a45a8141cacmr870589ejb.5.1709630772560;
        Tue, 05 Mar 2024 01:26:12 -0800 (PST)
Message-ID: <c1eb7340-aa11-476e-b2c6-bb8753d7edde@suse.com>
Date: Tue, 5 Mar 2024 10:26:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] X86/eager-fpu: Switch to eager fpu save/restore
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
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
In-Reply-To: <20240304091307.2295344-1-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.03.2024 10:13, Fouad Hilly wrote:
> X86 Xen will only eagerly switch FPU context in the scheduler.
> Xen itslef won't set CR0.TS other than for the purpose of servicing
> a PV guset.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>

Throughout replying to the series I got back "undeliverable" responses
for Wei's old address at Citrix (noticed only now when I looked at what
has accumulated again in my inbox in the meantime). Can you please avoid
having dead addresses in patch submissions?

Jan

