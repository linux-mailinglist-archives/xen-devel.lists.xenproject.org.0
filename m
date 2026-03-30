Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBNMFEx/ymmR9QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:49:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9B35C49E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267666.1557118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Cyq-00080i-Qu; Mon, 30 Mar 2026 13:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267666.1557118; Mon, 30 Mar 2026 13:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Cyq-0007ys-OC; Mon, 30 Mar 2026 13:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1267666;
 Mon, 30 Mar 2026 13:48:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7Cyp-0007ym-JV
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:48:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Cyo-00EYvL-S4
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:48:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca7f2c-e002-0a2a0a5209dd-0a2a4507b718-24
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:48:34 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca7f32-fd74-0a2a45070019-d155dd2ac5e6-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:48:34 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43cfa33a983so845762f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 06:48:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf1db08e6sm29082874f8f.0.2026.03.30.06.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 06:48:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774878514; x=1775483314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqBgRGen6k/0ph3p5uFFTz07oq/YgG0W+10SwN62QdU=;
        b=TcFf4vCW7x1wip89zs10Ll/vwPs7wSh8olawEvwUW9dCIOB09BGJlAFhwFo4As2BgQ
         QcUUDBGC5EG4FA3k63lhAxryMu3SYnZyYZISlHCULBxE5AhUVXvfQIfinXhKS5NJsypq
         3c72FwiX/bXbK0KUWzjs6CgdIqzFQ6RGPKid9Dogbra8BDpBwfaIQ2W+J9F9/oyLQTiZ
         zRvgTxplGqGnBF1n81wgpKaM+vn6/+PwLrWQhiE0xIGpFWbwGlcPlt2B6JBl09SZB19d
         IwajRofa/Q8c5eeXskUca93cBA4EtnDJATCDkXBM2+6/yj9+XtVuGZ5X8jOlu7fk4mBR
         shmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774878514; x=1775483314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqBgRGen6k/0ph3p5uFFTz07oq/YgG0W+10SwN62QdU=;
        b=Ij+7R2i705zpRWKSJPqYPLyq/cGGCQfouNoXetCXoNQpFseTVHQdCBBLXIO/hL4i09
         ktAylNNQjF+8muyqzv6cZZ3s6a3F8iDYYtwKzSQMQBU+EpyiAQdgn6bYVwDh+Ii8FpM6
         UiykrpW/OdNA1XrvOFokafNMgv/3zJ9pQ7xJW/Ef5xu1JY5/qj/iypLRfC1RLfpjce/V
         O3X5VDnvydD4EIH/6eHwNt/85PUO+qCbSZFjGCIdD4xlcMwucpt2LeIZUQoXEuk8VnKt
         ztwcLp1ikYy6B7KNsdL8XWRhFkxOqSQsl6S57U7iI7YA8Pw9ENjd03wJgLNDc4a6yfmU
         RUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOv7pCgCamVuoeUyAy5ztE7yU27ffmoqEreI0b/wqK4f8ZGomp41kcVWyV8aXTepzCA7IECuVolY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLvjnI9Yk2AI45DMAiUVJIphVi83pzF0ymmrjsGzyLPuxFoflc
	OEnVK5+Cc2I1XtSG/vukiYL3UoAMaLmAJ1Rk/8raKDuO4UsckhXbedjxYHau87J2Wg==
X-Gm-Gg: ATEYQzy9HdlkPLbgMQ9V3wCR2j9j2TacCpfLJwZBRXaMN1y4VmfMPQmLtnwTBjC/WL4
	syWbSTLps7sj1v97RbC43r9dHMgnL44xw1lFhZr2yJntA3qztr1KJ3+1vZYLPRqvcj1wAcl2Zsg
	DW0xHEhtzDImJtC/RpEzbbOYpXB73B3a3l645PLMW/yKH7qKkB+9U51A76OohfzY2E4A5Tp/ZJN
	p3wJEf4TQqsXxlhZlS3QUYsLljUGgXTzivRoumuyGYnW7PBiBxwbUHk4eQDegKkuOk8XWvZLEbJ
	YHxCBOCniE2qxw86QPMFf7Nf4ZQPTO0wZlevdCF+cmdK2ji1V4pu9uCKCqHKIJkbY9o2zsMmfdv
	vOhWKPpZ2NA7HlAlvkNEMHBHm8AdxouJ8kM0Wa9qByJyJvbbSZt3ZCmZgc5zoOtfXLmGSnm115t
	27QFBoGUMCBEolvhUZj4c9eDFi0bWWl9sW8YVF/pfUVo/JkhgAOFBFbT9/JJJvdOLG+gktK30gW
	qnnu5Y9Zo4/vws=
X-Received: by 2002:a05:6000:200c:b0:43b:4f7d:e08b with SMTP id ffacd0b85a97d-43b9ea6213amr19903257f8f.36.1774878514070;
        Mon, 30 Mar 2026 06:48:34 -0700 (PDT)
Message-ID: <8a0762de-493f-46f7-be8d-25949532e2fc@suse.com>
Date: Mon, 30 Mar 2026 15:48:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/arm: generalize per-page GFN storage beyond
 xenheap pages
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
 <20260327075025.3008606-2-Penny.Zheng@amd.com>
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
In-Reply-To: <20260327075025.3008606-2-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774878514-4D8B4303-6945BFB3/0/0
X-purgate-type: clean
X-purgate-size: 1819
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Penny.Zheng@amd.com,m:ray.huang@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6DC9B35C49E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 08:50, Penny Zheng wrote:
> As preparation for fixing mfn_to_gfn() on ARM, we extend the existing GFN
> field in page_info's type_info to be usable for not only xenheap ones.
> Another usage will be introduced later for stolen pages in memory exchaging.
> 
> Introduce general-purpose page_get_gfn() and page_set_gfn() helpers
> that read and write the GFN stored in type_info. The old
> page_get_xenheap_gfn() and page_set_xenheap_gfn() are retained as thin
> wrappers with their xenheap ASSERTs, so all current callers remain unchanged.

Why was this GFN setting limited to Xenheap pages back at the time? Depending
on the reasons, retaining the old accessors may or may not be a good idea.

> Also introduce PGT_INVALID_GFN as the general sentinel, with
> PGT_INVALID_XENHEAP_GFN aliased to it for backward compatibility.

This I view as unnecessary, if not confusing.

> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -113,18 +113,21 @@ struct page_info
>  #define PGT_count_mask    PG_mask(3, 3)
>  
>  /*
> - * Stored in bits [28:0] (arm32) or [60:0] (arm64) GFN if page is xenheap page.
> + * Stored in bits [28:0] (arm32) or [60:0] (arm64) GFN if page is xenheap page,
> + * or stolen ones in memory exchanging.
>   */

Does the purpose really need limiting like this? If the field covered by PGT_gfn_*
is uniformly available (see the question above), I don't see why a new constraint
would need spelling out. If it's not uniformly available, then likely the
description needs expanding as to when the new accessors are okay to use. If
uniformly available, what may want spelling out is under what conditions one can
expect the field to be properly set (until such time where it's set correctly on
all guest-owned pages).

Jan

