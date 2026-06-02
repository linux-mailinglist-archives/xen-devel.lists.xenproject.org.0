Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJIRGXSoHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:55:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C744A62BF61
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 11:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324687.1590176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULpR-00010c-B0; Tue, 02 Jun 2026 09:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324687.1590176; Tue, 02 Jun 2026 09:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULpR-0000yI-8N; Tue, 02 Jun 2026 09:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1324687;
 Tue, 02 Jun 2026 09:54:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wULpP-0000yC-FA
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:54:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULpO-00BVwN-MK
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:54:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea853-5cb7-0a2a0a5109dd-0a2a4507dd74-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:54:30 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ea856-229c-0a2a45070019-d1558031bdd2-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 11:54:30 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490b12270b3so4272055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 02:54:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e0f26csm53694855e9.2.2026.06.02.02.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 02:54:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1780394070; x=1780998870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o+OQp4Eo+twTrU73OA/REm/dINSjD2tkrdHlR4STHRY=;
        b=Nb82GxkJuP9ALCkmbfDAprpCZlYxnB3EHgmowPn6hdVUPexPcAVWYr/YMebE6NAEFp
         Mfc39Oxi3cOJB1223iQZWYkRLkcp0iMESLfS8Fesn0fRrgsh9J8i6QUR/bg8UeyIWKU4
         ldYgbogdia5QAcyglFeWpVg27AM/4IbXolX75vjGBJHfg5guXqFIjiF2ktm4QYzftkB2
         xtAvfV6s2nIaW6T6hMr/tAnopa2Cy23uRSuD7u7rxL/4KfC1/PB2aN1Om3r/fXcOkzlG
         tiHbdLrOdoJOZyEdBgqaD6Z0j0uJIhl3JzwkP0HJM452xLbt0gXa39SDorJ3mahNTDM3
         kCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394070; x=1780998870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+OQp4Eo+twTrU73OA/REm/dINSjD2tkrdHlR4STHRY=;
        b=CHZ1sJi2JKkrI7SlLsxBRcBEc9uW17vzmmXnGXVd7CAQ4teR5cJuY9gsRXr+aIUxSh
         lv2acfpeEPQ3uUJVixrVUE6uHuMUg15nw9Wk+v33UpAEQY4ITAcr/xM0hZwY/AV5/R3r
         k9ALxG134Y2dMyalTYw0ExIrX/+X63pfSleAodx/GHM8To8MlnNdykJSV/HN1yiYhLpa
         Je2RVEr+TkVTVz7rDnV/7O8q6QIIwZ89cV+17XVd7+ru5X2b1/LVN/4X4dU18sNjhjIF
         JM4KgLv6vjeE9mL9v/5WBScE8MvJ93RUQm/FgYYm8cROVEeMUp8Ky4uBy0Pk6A0aRsbE
         Z/EQ==
X-Gm-Message-State: AOJu0YxQ7bKfr1toEUh/iBWvSvuZsXbM5qbmHPLpdtwzqUImv1U1RKbU
	nqEt3Sp4DYnuJpuXJv6xYS/TAjuaiPtwXuLiwTqYnBx3cFyoKVHDc4VPaZj6fpRhwA==
X-Gm-Gg: Acq92OFbBUkWJq/BROG790VkfaD9qnKqCaWIKOYQIxWl9rss/bNN4gt0IrnixUf+n7r
	2KD2DbbW2iJbC6Kc22ASRwrWXLaRbzB4i7kRqveL3lQfcoxQPcvHEnx6yJHI1oG/uELYSV9wLjX
	T4PpLkeyVTqavxks2kYMiH5nGoo3mZh7VibwkmEYfaaxz9lQ5Dri/kVTQzQevqWfNJf39ZXwGsw
	xCw0+xqYM4Cgdm4ahi7Tiis21iChuNhaKseYhL+IV8G0gVuDNhGehB5CC1dskwzcCETjK6RMzNl
	lAc7ZJoMwcx5D7msBt83JYxXJ1ZTpWQq4YOPkQ9WKETihjpjmRh9/puj7RjIj1BR1SluMTVxX8G
	MuUTqexRjr5AEoo8li1AdoBBQjDxafsbCSRR9MmwAK0Ktt62V3FrvUGJrV/Vpmhtv989YJyrG34
	F2qJgulCTntkNwxDsm+0hIT6JAPcJvQ4XEPxPAVHe7ZKeaGmgDgBiIavZg8rXb8cB5HFWTBq5NK
	PehJLz8uBxgTkvAeCuOk6rxuQ==
X-Received: by 2002:a05:600d:486:10b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-490a29128a3mr204800405e9.13.1780394069969;
        Tue, 02 Jun 2026 02:54:29 -0700 (PDT)
Message-ID: <13a9c44b-201d-4875-b290-59b07b79c259@suse.com>
Date: Tue, 2 Jun 2026 11:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] xen/console: switch conring runtime allocation to
 xvmalloc
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 sstabellini@kernel.org
References: <20260509005714.892018-1-dmukhin@ford.com>
 <20260509005714.892018-5-dmukhin@ford.com> <ah6nDtFZTo-xhor_@macbook.local>
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
In-Reply-To: <ah6nDtFZTo-xhor_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780394070-20D67C48-A0C22046/0/0
X-purgate-type: clean
X-purgate-size: 2727
X-Rspamd-Queue-Id: C744A62BF61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 02.06.2026 11:49, Roger Pau Monné wrote:
> On Fri, May 08, 2026 at 05:57:14PM -0700, dmukhin@ford.com wrote:
>> From: Denis Mukhin <dmukhin@ford.com> 
>>
>> The console ring only needs to be virtually contiguous; it does not need
>> a naturally aligned or physically contiguous allocation. Replace the
>> runtime xenheap allocation in console_init_ring() with an xvmalloc-backed
>> buffer.
>>
>> Also clamp the user-configured ring size to the supported range and emit
>> warnings when the requested size is adjusted.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>> Changes since v5:
>> - switched to xvmalloc_array()
>> - fixed conring size checks
>> - corrected diagnostic messages
>> ---
>>  xen/drivers/char/console.c | 27 +++++++++++++++++++++------
>>  1 file changed, 21 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>> index 5cac87d052b9..29b9359468e7 100644
>> --- a/xen/drivers/char/console.c
>> +++ b/xen/drivers/char/console.c
>> @@ -33,6 +33,7 @@
>>  #include <asm/setup.h>
>>  #include <xen/sections.h>
>>  #include <xen/consoled.h>
>> +#include <xen/xvmalloc.h>
>>  
>>  #ifdef CONFIG_X86
>>  #include <asm/guest.h>
>> @@ -343,6 +344,7 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
>>  static unsigned int __initdata opt_conring_size;
>>  size_param("conring_size", opt_conring_size);
>>  
>> +#define CONRING_SIZE_MIN    (1U << 14)
>>  #define _CONRING_SIZE       (1U << CONFIG_CONRING_SHIFT)
>>  #define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
>>  static char __initdata _conring[_CONRING_SIZE];
>> @@ -464,20 +466,33 @@ void __init console_init_ring(void)
>>  {
>>      char *ring;
>>      XENCONS_RING_IDX i, size;
>> -    unsigned int order, memflags;
>> +    unsigned int order;
>>      unsigned long flags;
>>  
>>      if ( !opt_conring_size )
>>          return;
>>  
>>      order = get_order_from_bytes(max(opt_conring_size, conring_size));
>> -    memflags = MEMF_bits(crashinfo_maxaddr_bits);
>> -    while ( (ring = alloc_xenheap_pages(order, memflags)) == NULL )
>> +    size = PAGE_SIZE << order;
>> +    if ( size != opt_conring_size )
>>      {
>> -        BUG_ON(order == 0);
>> -        order--;
>> +        opt_conring_size = size;
>> +        printk(XENLOG_WARNING "Normalizing console ring size.\n");

Nit: Both here and ...

> I think you want to also specify to what it has been normalized, ie:
> 
> "Normalizing command line console ring size %u to %u.\n", opt_conring_size, size

... here: No full stop at the end of log messages please.

Jan

