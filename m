Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761DCCCBF9F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 14:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189596.1510338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDxR-0006ni-Hr; Thu, 18 Dec 2025 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189596.1510338; Thu, 18 Dec 2025 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDxR-0006lR-ET; Thu, 18 Dec 2025 13:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1189596;
 Thu, 18 Dec 2025 13:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWDxP-0006lL-L8
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 13:22:15 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90760970-dc14-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 14:22:13 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so4901925e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 05:22:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244934b09sm5011801f8f.9.2025.12.18.05.22.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 05:22:12 -0800 (PST)
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
X-Inumbo-ID: 90760970-dc14-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766064132; x=1766668932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bkn5yEKSdWPT5aiSsTMUXHomEEXPhM7hr7Hp5oy5o2E=;
        b=WnGd+5RctZ5d+UZkXuQJ8Wg8AK9dGcVpJRIs1SYFzv8jC2jxblVfsMcWkH/rg6O11C
         MJgb6qVAQAnLERy2HKfbT2ImP8RhQtVWfCTrVkSrBrHY21Ib0LsBir9sp37qzNxa6lkt
         du35vxXcJsw1FiHlJ2rGrEAFLFPZaYZcUQvOKWBLJ4VvwdLHe+squ5XSwnKmdzCFyrct
         pTM9IZz6flvf4FCN+rMGeYKXi+lLO21TFaEFzgTa1ncsQV6nHyX5iGWevKSpEozgdo7Y
         rZwcdqqbQcYgbvmYoImLTeffNYnsCCfHycO5fHJ5NnbdAtU9lOTbT68bR7nhUuDrvdCz
         E9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064132; x=1766668932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bkn5yEKSdWPT5aiSsTMUXHomEEXPhM7hr7Hp5oy5o2E=;
        b=vi2DaWeojVkxyaARBzo6D+yCfKJMDmR2Lo+o8BHPzZbwgdEuFbcuEbwrWjreoKvK6r
         iYizClUreNfBG5xd6oTWsQ/quhNoAp+cOVE8T3+4du/Troaj2aKEg/X8PU0MJK+Ujh6y
         +CFPGNGNmrNrndPnqgCbMNDfda1RTsDKrrx3QJhkV9vQjNpPwqwOvtHf0rwwWbHRHDVJ
         Fn3HHV9djOPbv5yfL/Aee3Gzpeen2pS2Fpdb1dWNi1AZ/HMrj+81C44jvIFf88Rtu/pn
         oZR5pGiyAbzQZ1ikqkeYPailMXsMcRPXWAGXgxPr+4AaVEx4ecptxPab/h08+o3t3gmS
         CGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW70u5hA5dM7zb3DgKNRlrgY0uyQHjXZte6fzjv+bc2tDd/uZE8dI9GCSUeo3Xn/P36SnUtk4AJIfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzvR8gji9UiNdVjH/KhBg0meuFVRhIkJ/nr/ABvVtZ8r9WLOJf
	1VV9vuNwxiF9m3QmFEEMzOUuKrWYH1g8c103xiQfkHolvqCHMgnGe6phaYma+P4oKg==
X-Gm-Gg: AY/fxX79G+E2TY2bf74+NBl9+jUT1YTXlz9NWNUXeLxzU/H6gW9bbJxZiKpntdHn0v6
	8ymAAFrVUqGEpGCe7d1kOT+9NF3AyQE+DdnQBA48h+h9QiZaLcJdJD1X5C+uBfjU1dAPb/0uIEs
	hP1CBt8pkLvsfqw45WW6OXzM7zHXyIzBDUWZpZrArPUT1RO7olKkpyQOrBsNqISmpoFLcc5M4u/
	12WaXnHjTo5ipSt4icrpR4qdZEhFy4MktlYmubr2IIx8wj/3A2G/ma/TwF06UdBQFflP87Gmdjq
	VF7E4T0rlBtmfzbJfG7U/Whf+XuUAiybGsQvzzBGNrk2qWwWxPs4b2UZHI1Fpk3jvPmYJkPCHfa
	KQa6N3e1zcLSdd8TUkNivhAE1kiiQe/Zih1WFiRTPvfQaMO/uBHktEg+laYvEz+IHjvTCDGQpJ2
	akgN5dmjaNWNMFszAz5MIBRiWBY9ewot0G50prOsyAknWJtEMU/q538reGRYYdSdfQBhJkatngA
	tg=
X-Google-Smtp-Source: AGHT+IGaVU2rUvaE6EpE4FhpBEVEzVw1Wx9WGgRsdodAnHMlk7dGwc5aLHvI6lgrevT66IAWiEJF3w==
X-Received: by 2002:a05:600c:4f4f:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-47a8f8aaf45mr274132495e9.5.1766064132525;
        Thu, 18 Dec 2025 05:22:12 -0800 (PST)
Message-ID: <a0d64b79-f66c-4149-bd71-ae2f22629ac0@suse.com>
Date: Thu, 18 Dec 2025 14:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 19/19] xen/riscv: update p2m_set_entry to free unused
 metadata pages
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <4274ff86c3b7233c03d72faf8989991094a7630a.1765879052.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4274ff86c3b7233c03d72faf8989991094a7630a.1765879052.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2025 17:55, Oleksii Kurochko wrote:
> Introduce tracking of metadata page entries usage and if all of them are
> p2m_invalid then free them.
> 
> Intermediate P2M page tables are allocated with MEMF_no_owner, so we are free
> to repurpose struct page_info fields for them. Since page_info.u.* is not
> used for such pages, introduce a used_entries counter in struct page_info
> to track how many metadata entries are in use for a given intermediate P2M
> page table.
> 
> The counter is updated in p2m_set_type() when metadata entries transition
> between p2m_invalid and a valid external type. When the last metadata entry
> is cleared (used_entries == 0), the associated metadata page is freed and
> returned to the P2M pool.
> 
> Refactor metadata page freeing into a new helper, p2m_free_metadata_page(),
> as the same logic is needed both when tearing down a P2M table and when
> all metadata entries become p2m_invalid in p2m_set_type(). As part of this
> refactoring, move the declaration of p2m_free_page() earlier to satisfy the
> new helper.
> 
> Additionally, implement page_set_tlbflush_timestamp() for RISC-V instead of
> BUGing, as it is invoked when returning memory to the domheap.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


