Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E805BCBEF06
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 17:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187445.1508836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBZY-0007GB-DP; Mon, 15 Dec 2025 16:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187445.1508836; Mon, 15 Dec 2025 16:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVBZY-0007Ed-Ag; Mon, 15 Dec 2025 16:37:20 +0000
Received: by outflank-mailman (input) for mailman id 1187445;
 Mon, 15 Dec 2025 16:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVBZW-0007ET-Lq
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 16:37:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50ced49f-d9d4-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 17:37:16 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42f9ece6387so1481942f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 08:37:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f984a268sm10384018f8f.1.2025.12.15.08.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 08:37:15 -0800 (PST)
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
X-Inumbo-ID: 50ced49f-d9d4-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765816635; x=1766421435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s6kU7Hc5AETBlewka46/PlUa4wWZ7ukkAJTBWrTSqSQ=;
        b=cRM8A+3HikN61aSzIMOU5tBEg2M6SQakplx9O37/Fx+vAy6E6kAown4P3g7YLrAqtE
         TC6+qRcD3Xat90/TKECo1uvlJjY8At2Qmap1NuymT3jFUZ0Q7w/iZYZAYo1vUyKwOVGB
         Hcpio8zWRezsLZGp4zH313MTCD6bpuAJlct96Cb1TPjnuuSvD20crti2a0Rf/KELGRIz
         N0hscn0T+AGmhIYLtCbf2uEs/35AiRaPYQsbnwTYQb8PnENM8zWHIEu3aS3yNR0XwIJN
         Q41P8jGHUh+PL05zm8AB81yebXJ3Px9f2f5QlxT9J1YpMNe7BaXNy5aWYs78IXf9d/IT
         51PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816635; x=1766421435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6kU7Hc5AETBlewka46/PlUa4wWZ7ukkAJTBWrTSqSQ=;
        b=XFQOmwgomcan0JAHnxqF4GQduyWvhzXsvi2721N62yf9sOz6uQgXc+XbO2n1eF/F5Z
         Be2I+c7N464LiH7DDc/RjgccXyxDbdyj79FV1tG/VfOQ8jbVeCose3F9PewQweJLkmE0
         PJ4lmRCso1SbkKfsVjKFQQNf7eDH2FmJvHOkbo7sXZv3F37MqlXO8qNBZgJrz2gjB0Ck
         csESwL+2/o40w97O8NesmFFyfMFRuWjnmBDr54ocXy5zBZvZRigwVJvd9G9Vf+R0upfu
         1tB2EmZanezbtlxk5qOjlt+SYCeKWVaeHXsGO6cyWUCqwiAtcJkC8GaZ+9ghzCvUV5iw
         0StA==
X-Forwarded-Encrypted: i=1; AJvYcCWZomN4Hb/mPaN+Ku/yAWKZcEeN0N1k3DOQlGq5XD8pajZkjXtakj3UGQ5Z/Tnma3GY6k1xm/GSZ6k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/5sr2IXRUnIW0qugA8WofRAqW5gvIUROgn3JOWBBqHIZ+UQYG
	Ll4uMjqBLte65JIxrrBsEqEZnp/cdX81WoqEQJDQBpJ4OyFnFPCvSynW9jXQ2q3wZw==
X-Gm-Gg: AY/fxX6B2AcdcPQ9YRcE9KmneKLJlok/4/U+DrvEZCCwnxIsvtXr2y6EMjtn7o53l3I
	KDaDtTxWXoM1u3IcTuzCAIJNhi0bDFWxmPO6v53UaylO3eXfeDtTcgt+SnuCPRRK6fyIjge2Uqr
	zy5n0E9YUcjLJaot8LSMtT78BzRC9QHuG/Uij6L1Xy5IyENMvseSBG4QFhCYeqfZ2JvC70SIzom
	OPnRjMNgZeKldOjr61OUHzhfLD/Dd8W+/3SDSRjPYFsJLOAaomnwLLFgEZ67Wia8qkQYZjqJebn
	AUPUaTZgaUSuaA4dHZlRM/l9U5Fy2glAFAH60hFbO+8QNrSP6LQm4vLdbmZPCH1uTd/Ft0oebYN
	KyXB7I9sDbGIpIygEaR8VMxb0FMn8uMYuUNqUKcU67Vkg6uJv2rBbb1odPG88nF3HxMk/4CL+yA
	RE7UHvCitjZ5NAj6J6Yq92/yyq2+9U5it3605Q3LRutYFyu6RC10IzFsItUywwIXLEQDTzRrgSr
	4Q=
X-Google-Smtp-Source: AGHT+IGwUU3Q5x8MjB31DFPb6NrOEDp1e0e5AJrUHBFP+RDuLG/Kz6Eq8qJxZRA0HM59DdDhkU4fOQ==
X-Received: by 2002:a5d:5d09:0:b0:3ec:db87:e5f4 with SMTP id ffacd0b85a97d-42fb44762cbmr11160923f8f.7.1765816635576;
        Mon, 15 Dec 2025 08:37:15 -0800 (PST)
Message-ID: <dbd26a5e-d6d3-42c8-b1f9-325be2f807ff@suse.com>
Date: Mon, 15 Dec 2025 17:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: overlapping XENMAPSPACE_gmfn_range requests
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7d254163-ac13-4c58-bcb5-aaff2e892e15@suse.com>
 <8038ba8e-ea1f-4005-94ab-56e4ab5f7062@citrix.com>
 <1ce5a050-929c-48e4-8645-7310a07279cc@suse.com>
Content-Language: en-US
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
In-Reply-To: <1ce5a050-929c-48e4-8645-7310a07279cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2025 15:17, Jan Beulich wrote:
> On 15.12.2025 13:46, Andrew Cooper wrote:
>> On 15/12/2025 11:22 am, Jan Beulich wrote:
>>> Overlapping requests may need processing backwards, or else the intended
>>> effect wouldn't be achieved (and instead some pages would be moved more
>>> than once).
>>>
>>> Also covers XEN_DMOP_relocate_memory, where the potential issue was first
>>> noticed.
>>>
>>> Fixes: a04811a315e0 ("mm: New XENMEM space, XENMAPSPACE_gmfn_range")
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Of course an alternative would be to simply reject overlapping requests.
>>> Then we should reject all overlaps though, I think. But since the code
>>> change didn't end up overly intrusive, I thought I would go the "fix it"
>>> route first.
>>>
>>> In-place moves (->idx == ->gpfn) are effectively no-ops, but we don't look
>>> to short-circuit them for XENMAPSPACE_gmfn, so they're not short-circuited
>>> here either.
>>
>> Maybe we should short-circuit them.  I can't think of anything good that
>> will come of having redundant TLB/IOTLB flushing.  At the best it's a
>> waste of time, and at the worst it covers up bugs.
> 
> I can do so (in a prereq change).

Or rather not. In looking more closely while actually trying to carry this out,
I had to realize that such a request e.g. has the side effect of unsharing the
source page (i.e. implicitly also allocating it). We would also take away from
the caller certain error indicators or state changes (e.g. a p2m_ram_logdirty
-> p2m_ram_rw type change; see also Roger's "x86/hvm: be more strict with
XENMAPSPACE_gmfn source types").

Jan

