Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFjeAvl7ymlo9QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:34:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5A35C10C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267642.1557100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CkZ-0005cJ-Bd; Mon, 30 Mar 2026 13:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267642.1557100; Mon, 30 Mar 2026 13:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7CkZ-0005aj-8f; Mon, 30 Mar 2026 13:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1267642;
 Mon, 30 Mar 2026 13:33:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7CkX-0005ad-Kc
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:33:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7CkW-00EVqe-VB
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:33:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca7bb6-2eae-0a2a0a5409dd-0a2a4507a3bc-20
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:33:48 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca7bbc-fd74-0a2a45070019-d155dd2fa5a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:33:48 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so911021f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 06:33:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21eb95fsm21196306f8f.12.2026.03.30.06.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 06:33:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1774877628; x=1775482428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg/CbfknMaJVwMYfT16B838FDln3W0SfrBw3dLtEV/4=;
        b=HQmFoztVSVt9yadkdxqy2BoxQFElF0Xgyi2X6ssI3bc6KZhII2RWS3EmAC54oy2Trz
         cuPIlJYm5ehOnTJZpUMgnBkI5t/10yEdUgl1O1KAQ0UARXqwCIeP9E3R5uwGAZnO5rQc
         BEJX1/lWZxFFjxTU3vwhleJLfjLT106ZAt1s5q3khtLWtQi/YMkCah0YP1Q92RytfD6G
         +zBZ7dlkCjzVaRSOBnBVdGu5Ff8Gov+Wr5L1HbM8rFBSaTb6aw63ZdMipmAk442r3KVL
         tPJJj788nO3u5YIDVv0Y7Wrkb+Qcpw6t6VPgyQgLqRKoiH9PIEnkeQJlPTYrVMhAGqdZ
         MeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877628; x=1775482428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg/CbfknMaJVwMYfT16B838FDln3W0SfrBw3dLtEV/4=;
        b=QvKWm+35GFhNaT6BZtyVCUCrwhpKkX05x7Co5F2L485ODQw9fqbUQBka/joAylqgFM
         y+krhAk+ClPtFLQR4hn4EFKkApHilAPiMcP87aimj/Zjt55eNtWbveFn0pVVqVna/z+l
         HkJnqpxZT5JWWkXyr9RSss6t+rdULbqx+A4r3tBX/MGYLrK3M4Q1UJnWZodqkWR/kmJy
         Crw4nHgFtp1d8gM+j4a2dahJPh5UbxYcx7/uiMizBE4HtFtp0VL7E7qRUNkSRNVPtmBl
         5tbbFGX22SoPm8TqsmCp1i3xQjJlxIOST7WCKGgAiDcMy+4/AphiX7mgO6oq/inMXZzT
         Ou3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbbEYmu6frSCRfTrx5IzjaPlIB4qaeDOsVHkVW46K892SkjseL2J9nu/KibcmKW+2KFGVhU2l3tLQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx08OWgFDgLfVib6Osq5HENWPxz81YL76Kpauzht8G9yWQnKOaI
	wF8sv39iOLPY3z4UGqQUF4AjbNHy5CA8R3KcbRToNndrP6R097y/zQkmuAgZks4rhg==
X-Gm-Gg: ATEYQzxGC0N444eRNlvfhx7SsPuiAuGCt4qLictnHBVJuU/cYJ1CIMUbLRxsl9UTfbm
	RINN1ZVxzR9aoFUpnfv/EThen1NcbeTtZ6B0ZEumL/N0m0Zct9n0xfP1PjVvFa95qrjGLFE2ADr
	sIMSdDKMwgOG/QKzNhHiUSc3oglulQeCUcUJ03z9YhQeXeXRgFcdo5IbqaEnv98hGxPAb3JVplG
	FdU4PSVVGNFv1JH6kCeai3rB3qqZZkCghk2vt8GT3+PLWkTfrXRXzQIXbQqAT96W1dmVVHGrINp
	kXx4kZZy0TNuRdpXPf7bEib2+o0RORJjvoKXngL1nL373fzb9P+hu+C1lJmPZzCdntydgx0eFJg
	MHrMqDA2qn4oHsYdw77JtTwCLGRpj0n+xCbjvrYsNKpzclDdb/hEmPlOmQ6aEa8N6Arxf7ir2KO
	e7LEQ90Sxy67+th+rDsmuFDDWDygAioWOHLq6APHlC/LlJ/IKPQ+4y7wMQi/uQjo04K0jZXx8uO
	THbzwYAhc53oCg=
X-Received: by 2002:a05:6000:2c06:b0:43b:4312:2cbb with SMTP id ffacd0b85a97d-43b9eb10dc5mr19894273f8f.17.1774877628161;
        Mon, 30 Mar 2026 06:33:48 -0700 (PDT)
Message-ID: <07790d30-a739-46de-8e87-60f239cd8ad1@suse.com>
Date: Mon, 30 Mar 2026 15:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/arm: fix mfn_to_gfn() usage in
 memory_exchange()
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, alejandro.garciavallejo@amd.com
References: <20260327075025.3008606-1-Penny.Zheng@amd.com>
 <20260327075025.3008606-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20260327075025.3008606-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774877628-562B1303-4443844E/0/0
X-purgate-type: clean
X-purgate-size: 2248
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Penny.Zheng@amd.com,m:ray.huang@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 54C5A35C10C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 08:50, Penny Zheng wrote:
> On ARM, the only callsite of mfn_to_gfn() is in memory_exchange(). Although
> memory_exchange() is actually not reachable on ARM because steal_page() always
> returns -EOPNOTSUPP. We still need to fix it here to ensure correctness once
> steal_page() is implemented for ARM in the future, and avoid propagating
> broken usage.

steal_page() may need making functional on Arm without the need to permit
memory_exchange(). That would allow a different approach to the problem.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -814,6 +814,13 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>                      goto fail;
>                  }
>  
> +#ifndef CONFIG_X86
> +                /*
> +                 * Record the GFN in the page's type_info,
> +                 * so that we can retrieve it later when consuming the page.
> +                 */
> +                page_set_gfn(page, _gfn(gmfn + k));
> +#endif
>                  page_list_add(page, &in_chunk_list);
>  #ifdef CONFIG_X86
>                  put_gfn(d, gmfn + k);
> @@ -849,7 +856,11 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>              gfn_t gfn;
>  
>              mfn = page_to_mfn(page);
> +#ifdef CONFIG_X86
>              gfn = mfn_to_gfn(d, mfn);
> +#else
> +            gfn = page_get_gfn(page);
> +#endif
>              /* Pages were unshared above */
>              BUG_ON(SHARED_M2P(gfn_x(gfn)));
>              if ( guest_physmap_remove_page(d, gfn, mfn, 0) )

I pretty strongly object to further CONFIG_<arch> uses in common code. We should
reduce their amount, not increase it. Why can't page_set_gfn() be a no-op on x86,
while page_get_gfn() would resolve to mfn_to_gfn()?

The #ifdef-ary here will, btw, likely need reducing if you want to make
steal_page() and memory_exchange() work on Arm: Like x86, a GFN reference would
then presumably need holding across the steal_page() invocation.

After you have fetched the GFN, I think you want to invalidate the field again.
Otherwise, after the subsequent guest_physmap_add_page(), the stored value will
likely be stale.

Jan

