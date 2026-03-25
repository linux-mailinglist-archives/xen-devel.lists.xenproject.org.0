Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELBVMI0TxGmfwAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:55:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50432973F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 17:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262796.1555170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RW1-0007LX-Di; Wed, 25 Mar 2026 16:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262796.1555170; Wed, 25 Mar 2026 16:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RW1-0007Jz-Aq; Wed, 25 Mar 2026 16:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1262796;
 Wed, 25 Mar 2026 16:55:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5RVz-0007Jl-Gw
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:55:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5RVy-00FAFv-T8
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:55:30 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c41380-bab6-0a2a0a5309dd-0a2a450b8d66-6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:55:30 +0100
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c41382-ef63-0a2a450b0019-d1558031b9f1-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 17:55:30 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48374014a77so796815e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 09:55:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871176391fsm129951905e9.12.2026.03.25.09.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 09:55:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1774457730; x=1775062530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t5K0wfKnJsP9IJpG6BvYI8BWiKuMPSPk7u+DqyMXWb0=;
        b=UC0wr2FfDHh1M0UGd/vlQJOYkrBLKhx/xVj474mys8b5EpZg8OoXFyR5SXqv0A+CHl
         72RF30Vg/SkaozUcqntbxEBqOWuJqwVRXJGpg9NAwOKWBf/Kp1GzL8xfjpZo2cai76do
         zBsDQMzdvtHv2zxj6ruKUtrehj1oVe3LuM9gOyfnPEFxuAGQJyA0z14eJ1QHsmQ1ApJ9
         TbyJ+7HyA2STiB4AwDJWVx9dC5XZuawbpbtGke3FwJcNwdtwe5uRZ79rBewZzw8fGY6h
         7vMqey605JKHuKUm6KT2DLRH8MiCKFy04UrXn9FYzWcfRgr60PKfSJ8Jt5KaIHET8fBX
         0e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774457730; x=1775062530;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5K0wfKnJsP9IJpG6BvYI8BWiKuMPSPk7u+DqyMXWb0=;
        b=hCAcobmX/dTAQ6QzwJW3l55Y1DDxlfXacCpkk9aRcSUudNUR8KAfmFfpFhi+4LU++5
         9pH7HdLgx+bXNZ13Y3y1r1Xf1RbakcaQxN+wRLbB9pdi41EGU3LJErSaCw9SVML2QGei
         Ct+Z7GG0dxnhmS0GiVN0zy4a/dMsVOVPJuQtgvQyc0cJ5LfWNK8nI1cG6JLt6lNh07kL
         4+eDOobPnClGvYFcVW1ukWobwX//0rVLBER6wXCY0YZRe/TrBvPbO5i+HnHDaW/bVmgd
         DVYvi1FD7i/Zz2ZY5oiYPLgwW8fqGdBx4qqgcOUc2Djbgo+wh3tVDACHSZuynwdx6W8a
         Yfvw==
X-Forwarded-Encrypted: i=1; AJvYcCWNDznqc+Eyb0gZGqqKdehOO1qRenPv+B3BeNrHgQgqyVKUBI8uxlu9zCXVcOMdb4jkp0TEgnb6C8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyapoHZAuew4FB6SpAkozUoQwP2pCCVYhJJShRrZMQrB9gIkrFV
	qVPznewPCbn4oYQar1c17eAfnVbzKnKeo9tCUZNiWoLDmsrxDBJXYbCaI1jOsGn06A==
X-Gm-Gg: ATEYQzyhVwfFzbFCn30F5U+W6XFvmJcc2frFGnmO3BwGB7WO1wGUTCxpX9XDF89/GHS
	5nXEvwT3vxlVp0RouQVJDVj0R7Y88a7QauQCv+qcay/pL+VTrXhC1SLWq7WLhB9iMIjvsAuVqNq
	lzn0qXHs2mDA7HL3xkl2KtRXO0+k+pFVhZdFdm+roCZI8r64oiTJx9V1c+RsYAFyZAatLYXUFqo
	ieoCs0UOJbCjDPDasU7ff5PgrcDwywgz7XsGcgQxTtBMlIF1QdctMVterUPwk6lSvyH0uXCXuA+
	ohKdWTloLOAITqOtWQfYdBcnB/R6eC+HlQCPniynZFqZJ9MW2aT4mid0G5Vdt6ssbU9OgxQM1hI
	TgcSHburol6UJDnBUYyU/i0EKFsbt7zvprYAYXAtwLQAP+NI6ZXQ77L9iBcO5Q+k8HsoaSDMt8D
	//4TTLVsr4z5FL/2dRq/ijVPG8b3ase3YhcyHVnyDz5AFO3PXwIaxauEWpnmw4PE3FpyHcMeXzg
	84hLBPBrHLUJSA=
X-Received: by 2002:a05:600c:4705:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-487160a2a33mr68599505e9.31.1774457730125;
        Wed, 25 Mar 2026 09:55:30 -0700 (PDT)
Message-ID: <81910cb8-554e-4147-bf29-4c518cc9543c@suse.com>
Date: Wed, 25 Mar 2026 17:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/mm: do not assign pages to a domain until they
 are scrubbed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260325100803.6640-1-roger.pau@citrix.com>
 <20260325100803.6640-3-roger.pau@citrix.com>
 <73c705eb-95f9-456c-ba0b-c6e0f7730ef1@suse.com>
 <acQMmXyOGFe5AN2i@macbook.local>
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
In-Reply-To: <acQMmXyOGFe5AN2i@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1774457730-98ABC112-8309BD3E/0/0
X-purgate-type: clean
X-purgate-size: 1117
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3D50432973F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 17:26, Roger Pau Monné wrote:
> On Wed, Mar 25, 2026 at 03:56:05PM +0100, Jan Beulich wrote:
>> On 25.03.2026 11:08, Roger Pau Monne wrote:
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -388,6 +388,12 @@ static void populate_physmap(struct memop_args *a)
>>>                              goto out;
>>>                          }
>>>                      }
>>> +
>>> +                    if ( assign_page(page, a->extent_order, d, memflags) )
>>> +                    {
>>> +                        free_domheap_pages(page, a->extent_order);
>>
>> The pages don't have an owner set yet, so that function will go straight
>> to free_heap_pages(), needlessly passing "true" as last argument. Correct,
>> but (for large pages, which the stashing is about) highly inefficient.
> 
> My bad, I was sure I was using the same freeing function as
> alloc_domheap_pages() on failure to assign, but I clearly wasn't.  I
> will switch to using free_heap_pages().

Well, not so much your bad, but likely a result of free_heap_pages()
being static in page_alloc.c.

Jan

