Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D956889AA1
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 11:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697687.1088712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohcJ-0008UV-4W; Mon, 25 Mar 2024 10:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697687.1088712; Mon, 25 Mar 2024 10:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohcJ-0008Sl-1o; Mon, 25 Mar 2024 10:31:47 +0000
Received: by outflank-mailman (input) for mailman id 697687;
 Mon, 25 Mar 2024 10:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rohcI-0008Sf-7t
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 10:31:46 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e094ef5a-ea92-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 11:31:45 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso4797588a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 03:31:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r10-20020a508d8a000000b0056ba017ca7fsm2767231edh.87.2024.03.25.03.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 03:31:44 -0700 (PDT)
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
X-Inumbo-ID: e094ef5a-ea92-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711362704; x=1711967504; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ0545G1JCpez8HYFxvWrnz/2I+hE/zYwBuCVnrnlB4=;
        b=HwN0rgrsZf+06kaCkoHqc9Xo9b34dHxcD7QresPnvJlFMng4IjSU38HUeoBaLKJ1m2
         +W43qP8+63o9uwhuNV48SCFn4x+4mYHnJU2XvbTJ3X8N3F3CTKbyon74yKWFsjRCvJDL
         jf8Ki3MpAnIPZ7wy4gUwISwEqvwceIAF9NtAwu9LZsuU1Lxhz34YPzaJCKI5Qh8ge+Mj
         rWi2aaDscOeByPW7mnUp1LoS3dqgUItUEyj62uXSV/g8V3HkvNwJiyIcca3+ZXtai0W9
         gqaFEBUmUu1EdX360W9+syNxplKxc6IabO+oL+lppB+rb9jLT+2M1Gep90axdfBJO28i
         1rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362704; x=1711967504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQ0545G1JCpez8HYFxvWrnz/2I+hE/zYwBuCVnrnlB4=;
        b=ZeIZo+kcw8H8zv+t+Yjo9fcCh6AeSqalyl08LK3GlCjA9vreyT+MaXykWOjCqcXbud
         8myehuzcUPCKo2SOF2W5joCRtceUCbevddegbLwNM0VnMYWp0rHW2XCY7Ci5yomW4Mud
         /2kR697INY0k63MK+sSUcwaTsyXsliYB1iv0iAQK7MXm4uHarrG9QD+0WVzbjU8wl3dH
         hgCgGIuVgRZNQluNkJEWVzcClWCFq6Aw6xCIccsPdwcw3pIcTJgoJ4Ln1N/6pkTXHEpX
         z69Tf2WoT3RBBq92KiCRrw4AuDwcrM4S2XgyHkcEB7z+YlaHcO8EJNres+5moGzJ+PCV
         Uo2w==
X-Forwarded-Encrypted: i=1; AJvYcCWKhsMQa1ejstlhmI3UzC9k7T+a4Q17DRSLGwcRT+QsJ+qVlBHBjysOmdZIXb+BOdn846ZtDMRDBgjfbnGBbiv+2EpS9fJXMRLsDdqkoHQ=
X-Gm-Message-State: AOJu0Yy0+PJXgC76ZDb35PI0KlaF3i9BJx7G32snB289tJxNu/SS6bu0
	3QQzn9MOoa8FGGv+OkCFDPR+YknNwMk6paa6IPvPMZwb1NTdV+xwx7xxm07czA==
X-Google-Smtp-Source: AGHT+IEcp5ycQyo2VBcv3rPPJY3x14ECmy4D1uoWewt+ONQsu3yS4MB7MQi2DNmT/aI3pfzJxkDlJQ==
X-Received: by 2002:a05:6402:202a:b0:56c:be3:7cef with SMTP id ay10-20020a056402202a00b0056c0be37cefmr1924420edb.11.1711362704526;
        Mon, 25 Mar 2024 03:31:44 -0700 (PDT)
Message-ID: <6d8d5bf3-3e16-435b-8701-ea57c8e01a08@suse.com>
Date: Mon, 25 Mar 2024 11:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 00/27] Remove the directmap
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-1-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> Elias El Yandouzi (3):
>   xen/x86: Add build assertion for fixmap entries
>   Rename mfn_to_virt() calls
>   Rename maddr_to_virt() calls
> 
> Hongyan Xia (13):
>   acpi: vmap pages in acpi_os_alloc_memory
>   xen/numa: vmap the pages for memnodemap
>   x86/srat: vmap the pages for acpi_slit
>   x86: Map/unmap pages in restore_all_guests
>   x86/pv: Rewrite how building PV dom0 handles domheap mappings
>   x86/pv: Map L4 page table for shim domain
>   x86/mapcache: Initialise the mapcache for the idle domain
>   x86: Add a boot option to enable and disable the direct map
>   x86/domain_page: Remove the fast paths when mfn is not in the
>     directmap
>   xen/page_alloc: Add a path for xenheap when there is no direct map
>   x86/setup: Leave early boot slightly earlier
>   x86/setup: vmap heap nodes when they are outside the direct map
>   x86/setup: Do not create valid mappings when directmap=no
> 
> Julien Grall (8):
>   xen/vmap: Check the page has been mapped in vm_init_type()
>   xen/vmap: Introduce vmap_size() and use it
>   xen/arm: fixmap: Rename the fixmap slots to follow the x86 convention
>   xen/x86: Add support for the PMAP
>   xen/arm32: mm: Rename 'first' to 'root' in init_secondary_pagetables()
>   xen/arm64: mm: Use per-pCPU page-tables
>   xen/arm64: Implement a mapcache for arm64
>   xen/arm64: Allow the admin to enable/disable the directmap
> 
> Wei Liu (3):
>   x86/setup: Move vm_init() before acpi calls
>   x86/pv: Domheap pages should be mapped while relocating initrd
>   x86: Lift mapcache variable to the arch level

Just to mention it explicitly: Before hearing back on the comments given up
to patch 13 I'm not intending to put time into looking at the remaining
patches in this series.

Jan

