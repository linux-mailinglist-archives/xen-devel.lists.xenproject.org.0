Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9D94A776
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 14:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773471.1183904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbfQA-0005X5-ES; Wed, 07 Aug 2024 12:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773471.1183904; Wed, 07 Aug 2024 12:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbfQA-0005VI-9z; Wed, 07 Aug 2024 12:05:38 +0000
Received: by outflank-mailman (input) for mailman id 773471;
 Wed, 07 Aug 2024 12:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbfQ8-0005VC-Rj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 12:05:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56d80051-54b5-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 14:05:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5bb477e3a6dso2083221a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 05:05:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839716a97sm6906543a12.16.2024.08.07.05.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 05:05:33 -0700 (PDT)
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
X-Inumbo-ID: 56d80051-54b5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723032334; x=1723637134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MuT+owmBfBGHR66APeEDFcZLpyhq79heLar8HGmLCSk=;
        b=AQvBbO8+9l8jDIiEbTwjKt37Ii5gZKy4SlWp4Piq6CXfopq2NcSQT9OwkXc6eevJ6q
         AcQaOb23lW+rij2I4nNqp4h3hzWRT5aB7sCmOOBcDgKjA4Gpsud2vtLxH1L3F18Dg8P0
         6diWoWv4S0SCJEgjLEitIfJxiYQo1C3rqHU8x0RdFARmlcB8DG6Ze3TNG9+6yu9a9bbB
         7B0MK0tvmxLWVAjp1iJ1iWOimU0Hw6MndQdGw7McoZAdnJ1FLZK5LyikzbZi4rcQf4bq
         PzJj8wxX9HFvPmkaqm0Ke3s6+WXj++GGFY7lES70pwffmVhAdcxRDsCfiGDLYOYPujsH
         Dx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723032334; x=1723637134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuT+owmBfBGHR66APeEDFcZLpyhq79heLar8HGmLCSk=;
        b=cNlnykeGHQP+WbxgcC1XQG9jFjubRrskKPCqXLtuscQIrKmiWvdB1N85VbF41BpLoY
         YZZreXawmNAEcUXWQXvdvTMa+jz8WJVgdygEEB6CT0d4tLnLpFVp9higJRfXKZbneevP
         VlJSZR0W3WJWt+Ba6g1wtjsUEJ5/e/Lmqge4TdHOhBeuLP8UxjALfK+k0Cj+GG1aUG37
         x9T2DjAcvhNePLIMNPk/fPRpbIkII7B0a2F+S5Ow28Humbpp7F1nKmK4KBB7Uhp5qHoL
         IGimzyaYLsvWjuDKU5GRsndkOu2ZFkeVP4Pwi7x6rj1zWa6zIZfdhs8p9bH9oAsi6I4y
         rjSA==
X-Forwarded-Encrypted: i=1; AJvYcCUgak+IK4ZftXkvav7Ik5QdEDkUeeMp3zu2otzdCXHw8JlBA2CK/PZTGi40uCyUl/kYXDzUT16I7FA9iRu9xdr/BfOpdtBCO7xlBiLlEV4=
X-Gm-Message-State: AOJu0YyaQ7+kgHFpj7cwufUXPMx2B8pz0w5McE9MmEcvtYz+fOhGOCgd
	IBGERWfib2WpTQBTlEg0Lv1rUlthX9kEPAz3hmyUKgO8UbPC4KnyLxbKrYwZDg==
X-Google-Smtp-Source: AGHT+IHvW8je1lTSF8Nb98ubzh722Xg2WrwmRlMCXY9CtnaNJOL4qZOIC7XEf4k2/+uVM13wAgiu7g==
X-Received: by 2002:a05:6402:b11:b0:5a1:32d1:91a6 with SMTP id 4fb4d7f45d1cf-5b7f4295746mr12722364a12.22.1723032333919;
        Wed, 07 Aug 2024 05:05:33 -0700 (PDT)
Message-ID: <90d67e10-6e35-487e-a9e7-611a0fa3b00b@suse.com>
Date: Wed, 7 Aug 2024 14:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240807104110.18117-1-jgross@suse.com>
 <20240807104110.18117-6-jgross@suse.com>
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
In-Reply-To: <20240807104110.18117-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 12:41, Juergen Gross wrote:
> In order to minimize required special handling for running as Xen PV
> dom0, the memory layout is modified to match that of the host. This
> requires to have only RAM at the locations where Xen allocated memory
> is living. Unfortunately there seem to be some machines, where ACPI
> NVS is located at 64 MB, resulting in a conflict with the loaded
> kernel or the initial page tables built by Xen.
> 
> As ACPI NVS needs to be accessed by the kernel only for saving and
> restoring it across suspend operations, it can be relocated in the
> dom0's memory map by swapping it with unused RAM (this is possible
> via modification of the dom0 P2M map).

While the kernel may not (directly) need to access it for other purposes,
what about AML accessing it? As you can't advertise the movement to ACPI,
and as non-RAM mappings are carried out by drivers/acpi/osl.c:acpi_map()
using acpi_os_ioremap(), phys-to-machine translations won't cover for
that (unless I'm overlooking something, which unfortunately seems like I
might be).

Even without that I wonder in how far tools (kexec?) may be misguided by
relocating non-RAM memory ranges. Even more so when stuff traditionally
living below the 4G boundary suddenly moves far beyond that.

Jan

