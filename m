Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242F94C081
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 17:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774373.1184828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc4fi-0005k3-9A; Thu, 08 Aug 2024 15:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774373.1184828; Thu, 08 Aug 2024 15:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc4fi-0005iJ-5z; Thu, 08 Aug 2024 15:03:22 +0000
Received: by outflank-mailman (input) for mailman id 774373;
 Thu, 08 Aug 2024 15:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc4fh-0005iD-DJ
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 15:03:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59893bb4-5597-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 17:03:20 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso342500466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 08:03:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e7fe2fsm755051466b.178.2024.08.08.08.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 08:03:19 -0700 (PDT)
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
X-Inumbo-ID: 59893bb4-5597-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723129400; x=1723734200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8sQ9PGsBk8Eff8tQCepimSQrw1AMgb/HWeK4EkA3Pzo=;
        b=C6XRpkvwetDDaB/KuBX2G8Yg40N/nB48fm0ZDRCdBkdIwOVQGd+Kz5klxDLTQPUn4o
         uWd/PSimUvY75aDHuMxECx3oG7/H2R5uWWf2MNwW60xFc/Jjp743eyzw5YARZJmIoHvq
         WehIcs9hJptvRvEBtHbR8CnefiXI6PhOLTzpmsVzPlgMXTFCS6brkcHseOt9t8i5DdAb
         vj1Rlg5/mZY5nrEMGG+Xql6wbT52nfiqU9YPKqUfwVlq4TZeV8mWvzf00AZPO5Hu+xqT
         U1oIVpG1mZjScKC5fQXMn0tf+V0QGrghm4CCTvjoj0hRjaLpD+XXP48Pnh0lqHPVN/v0
         fnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723129400; x=1723734200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sQ9PGsBk8Eff8tQCepimSQrw1AMgb/HWeK4EkA3Pzo=;
        b=p94DDYvJdQo9n6fKAv/XP4sjY61qI7JCFIzystjY4l8wOiw2meUpvJ67uGsvpj1fqu
         xG5pk2FNP/gb+bJDJLAQbF/NI3P3JlbHAdkuygiwN2t5vQKE71/ikDWDzLvaCt5n+Up5
         LxTCTT8zd8+v6Oyagh5ujxQunmI9VNy0c3fAdmbszaf7vah+jJx7s1TH4DMzbHtWR0KR
         nHtljfW5NqyanJrm+w8YszfZsdU9Lo1NxOggsxrOyBoB27eMWgKjjFNRAN/e8h7/SgrD
         Rz4jnuRbkGagguMBjhZOY4V0s4j/QTOXdMhPpuMkcFlDEK08CyMka6YP9O/GBqoQl53z
         Uc7g==
X-Forwarded-Encrypted: i=1; AJvYcCWg6jhJRwsEAQRf2mEaEy1hethOmiQOolOFjrptbnPB2EX6GF2QW7x9Ob98F0of/VGybSqi+mZFEj60zn24uMsuLZ+soe2vBNM8VBSLH0c=
X-Gm-Message-State: AOJu0YywDsDbY3LYyo9VaAOXozsh1ZuClhRFXgJ2sQeUk1iHUX7qplbg
	ZwFvXRvT5PTiBpJx3U3hgOsqHJ8Iq08QoydwLfkI2aykHrZP7MsM/5qSysIByA==
X-Google-Smtp-Source: AGHT+IHbEGRrZx7dXgPgKuL89cLMS/JVbDOgFN8ZoeVQ8hco5CBysjwbSaKRxrQHuJA5E7MwiIyOFw==
X-Received: by 2002:a17:907:1b23:b0:a7d:895b:fd with SMTP id a640c23a62f3a-a8091ec5ef8mr203185766b.6.1723129399785;
        Thu, 08 Aug 2024 08:03:19 -0700 (PDT)
Message-ID: <5de3bdbc-74a7-4722-be12-eacea6bebbdf@suse.com>
Date: Thu, 8 Aug 2024 17:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240807104110.18117-1-jgross@suse.com>
 <20240807104110.18117-6-jgross@suse.com>
 <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
 <5389eb85-873c-4ae2-a916-6fdd0e5b496d@suse.com>
Content-Language: en-US
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
In-Reply-To: <5389eb85-873c-4ae2-a916-6fdd0e5b496d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2024 16:42, Jürgen Groß wrote:
> On 07.08.24 14:05, Jan Beulich wrote:
>> Even without that I wonder in how far tools (kexec?) may be misguided by
>> relocating non-RAM memory ranges. Even more so when stuff traditionally
>> living below the 4G boundary suddenly moves far beyond that.
> 
> I don't think kexec is working in PV mode.

I wasn't thinking of in-Dom0 kexec, but about host one. Iirc the kexec tool
will collect information it needs from various data sources, not uniformly
everything from the hypervisor. But I may be wrong with this.

Jan


