Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58570877EFE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 12:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691413.1077369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdqW-0002SG-PI; Mon, 11 Mar 2024 11:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691413.1077369; Mon, 11 Mar 2024 11:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjdqW-0002Qj-Lx; Mon, 11 Mar 2024 11:29:32 +0000
Received: by outflank-mailman (input) for mailman id 691413;
 Mon, 11 Mar 2024 11:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjdqV-0002QZ-HX
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 11:29:31 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0128b77-df9a-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 12:29:29 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d28051376eso38152751fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 04:29:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk6-20020a056402398600b005685eaa19d2sm853989edb.5.2024.03.11.04.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 04:29:29 -0700 (PDT)
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
X-Inumbo-ID: a0128b77-df9a-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710156569; x=1710761369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fw8THqtdVIILJCkIF8WdQcMGdgk7pbjBYcYVlpKgqDM=;
        b=eVCkp1KDu39vk+bcfXon18bX4ID1LK4mhA0afg7Jz0qbhkLySeyakCHt6jDeHqnBHt
         g9N2kRvMLQDjxXTA4hQ5us9AZMDpCeXqsQdGVv53sQsoQ9iQ4RzUKUXSay2WRAHRMigI
         1iEZ1cd05KwtE6o87JlPD7p0BB7yjM8lHgZzbRzTWR9sgLxKB0dN7To8w4dZVwES2vav
         3/luixDVymee1sK9/YPiN4w5IO0NgyQbXnTZu73oLvcAvnlUKWt6B4C4xaTbWcYrj11h
         ijnp86+3h7stgtIslk/RVoiw6iNfDpGZwRFQzrYZ2+mq6eSgZiYhkRIMTfL6W9P30uEe
         AaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710156569; x=1710761369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw8THqtdVIILJCkIF8WdQcMGdgk7pbjBYcYVlpKgqDM=;
        b=D4R4fGpKVxg3hHpsgyypfxFJgsT6Hd9VB5xSsGmlrQgfVGSt85VVwIVVa5umKdkoqt
         bgI8JgkZhRTs0K4XNvPkl/+85IztD8VGCv/yPNdsUSHTck+qY1OEy5AJJtuuh8rVU0vp
         G92xzq9yVy2lGCbMX9FvVWlyiYNelWVYfAYANFzU8k3FjWCvIFnP3Lk8XQWq5erlUhrE
         SyycNA19uHVFbrOEMxGUhHMsjDWezBwjE60L0Y35a2tb0IpOxBdHCm4FK3MUKoi6lIqZ
         uJkBH67xeRqvAoK0gyDSVqueYWXV9gObcTqqF3r9rteRO1hQCCi9hbGQCHivVAV7YaaY
         H+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2kEkFjq1+Y/4mEYDDXvm0h9+FQIgA8UyRt5iOkCJyc3hpvBSMABWKp0pV3rkCDh+AaKC2O/WY1mON0McCLyldf3zUjMwBJggqvDIOm+M=
X-Gm-Message-State: AOJu0Yy7BLNMhVOnyevRkhYggKJGOs54MIY9QIuFLxKtcOlggFxPa6TW
	NxymMB4Brx92UDOGdR6Og40supfszBGG2mij7ixNHelZIpuIHTzoyuMpURrR6Q==
X-Google-Smtp-Source: AGHT+IFkmyJFRPUDAKWXzI4HIB6i5NbZ5pU9U6PzknwegwRdnwn5B9uPjc8rydyYYih6P0g1IDnRsA==
X-Received: by 2002:a2e:8e3a:0:b0:2d2:a8b3:a20e with SMTP id r26-20020a2e8e3a000000b002d2a8b3a20emr3524318ljk.53.1710156569312;
        Mon, 11 Mar 2024 04:29:29 -0700 (PDT)
Message-ID: <ac38c8bf-56c2-49f8-98fe-1563803a9c14@suse.com>
Date: Mon, 11 Mar 2024 12:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: fix detection of last L1 entry in
 modify_xen_mappings_lite()
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240311105416.4556-1-roger.pau@citrix.com>
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
In-Reply-To: <20240311105416.4556-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2024 11:54, Roger Pau Monne wrote:
> The current logic to detect when to switch to the next L1 table is incorrectly
> using l2_table_offset() in order to notice when the last entry on the current
> L1 table has been reached.
> 
> It should instead use l1_table_offset() to check whether the index has wrapped
> to point to the first entry, and so the next L1 table should be used.
> 
> Fixes: 8676092a0f16 ('x86/livepatch: Fix livepatch application when CET is active')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> This fixes the osstest livepatch related crash, we have been lucky so far that
> the .text section didn't seem to have hit this.

About half a megabyte more to go until .text could run into such an issue,
I guess, just considering the core Xen image. Patches are presumably not
large enough to stand a sufficient risk of hitting the issue.

I think there's another latent problem though, related to this part of the
comment ahead of the function:

 * It is the callers responsibility to not pass s or e in the middle of
 * superpages if changing the permission on the whole superpage is going to be
 * a problem.

This only suggests that for a pointer into the middle of a superpage the
effect may be wider than intended. But with s misaligned modulo 2Mb the
superpage part of the loop would keep v misaligned, and if the 2nd 2Mb
range wasn't a superpage, part of the range wouldn't be touched at all.
Right now with .text always 2Mb-aligned (and with there not being a
superpage mapping across _srodata) there's no issue as long as superpages
aren't used in patch loading. Yet recall that .text used to be only 1Mb
aligned in older Xen versions, and this fact isn't entirely set in stone
when !XEN_ALIGN_2M.

Jan

