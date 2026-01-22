Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GWWLKwhcmmPdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:10:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271346712C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 14:10:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211010.1522571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuRa-0007vS-Q0; Thu, 22 Jan 2026 13:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211010.1522571; Thu, 22 Jan 2026 13:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viuRa-0007tB-Mj; Thu, 22 Jan 2026 13:09:50 +0000
Received: by outflank-mailman (input) for mailman id 1211010;
 Thu, 22 Jan 2026 13:09:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viuRZ-0007t5-Hj
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 13:09:49 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04c2676-f793-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 14:09:47 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee4338e01so5862295e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 05:09:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921facsm42863280f8f.5.2026.01.22.05.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 05:09:46 -0800 (PST)
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
X-Inumbo-ID: a04c2676-f793-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769087386; x=1769692186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7OSGJaWFTQVWZfE69s8ozooWMhYaLI9iwnCjkHUWTpQ=;
        b=S/0M2GXVI08Wo7Ul/LkAgLXsgzdF8dV1yVmvyXE3lAz4TKZUD1swhbQP+n9ZF0s36d
         cLYDZHkn0uWm4vAVWm7ieBd64hlDJ0i8c7B7DGSiKzwmfierNTPRv88EsUu2SG16bGGN
         Q7QXUBIVMh8G622QHmXNA3XEcZ1xIR+h0Txznt9MV4cotTmaDXU91PupxdoNU3w8aifo
         RmD5tc8goa5ehroVj+Sy8opLSv2PhU53dr5C0eEcxfCjht2FYp06dhBSsEsNoKdpEJAF
         v/cixIW9+qnldGrpW3SSeZwZZcFS6UilGWulCR6B2UvCns8DWDdF/cRwRaIOqj054uax
         Urnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769087386; x=1769692186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OSGJaWFTQVWZfE69s8ozooWMhYaLI9iwnCjkHUWTpQ=;
        b=cYWf9WLAWFk1rGq9QHPoxUN0rk1WP5m3Qj2C0AbhwWxmRdvk6pZo5eEaLt/T9cGrA/
         D+DE8isYE+eFhAUZk5C7H87Sn4vwsATM25T8bp+IJBdtb988wzLgYihGEiiWVIsxpivY
         R9Nc7Um2ln0icDZZEA0RoFSyQ2bCls+dxK417V3YupQi97oUG0yAEfqWwKOERbPZAyAl
         8qZXYHpEO+jlnF8861Yxabyedte6IXY9YAGqW0ENI4TPwUP/rQiu73SKU0iIgQMcjn1o
         v+sI/sAgf8KEWL/khmVK0qp6ybW2Bu9u9FL6rTrtO2Di8qfzKpVIBORK2IS9z82OapBc
         jmwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXLR0UpGEkXYivud7jozGQn7SR6k1LPaAENqJWmgeMjGSjUZpfGltZgyebHDvWgEnLkjLhuAw+NZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6J5IbG7Zz/IU0dEjalVnXZiYVufoOu3Xdq7SRG9Au+vwMVn66
	2PEfBKyHLPyTnPa7NzmZmzOVAwfNqAE4GZ+MlzOL6+zBjcUt6CWQr6sBbjbdVQ/zIQ==
X-Gm-Gg: AZuq6aIleeCaaTTAgFhzSmUBU03Uk8ZkWxNBXzJIkoYV9dnognc1775oDL7fv0Hvc2W
	f5RhIKrJFoyGECWzMnU9DumHlpMEQ73XUwYy2K+FMlAoKwOW0UAiCGzj8+0kKAtCT6YA1MbV1tp
	1PO2rZUK+OSmTpg65ghR9DoQRT7sQyi30m4elnBtfESrHPdldWf6dImTy+aieuq2vviJW3K56Gu
	kJDR2+5XtQHg/B6/y0G0X2ACKX9kB6SmMa4llT38YzumBQPjgE9WxqcM7B3puHwq4KabkGl7WDU
	oPJVfsFHC+FQnQMmAkNJXtkv9mRaldG1Pl9UdHpJpsjUz63wcPH+FfM4aIMqWSXXe+oYH1pmLlT
	nO5mmX+xBzvldyqwyIYcaaD8WTGEmcyRnsaYurqDDd7UmuPJwiuqTwGgUipnZR0XJrF4kvJp7hZ
	7EH8JzYpyLwqGx1h/8Wvazl2CQVX57qMGWaoa57ok+SpLJzXXJuln69DQZrUDFWamzwFypEYEE8
	ts=
X-Received: by 2002:a05:6000:2406:b0:430:8583:d189 with SMTP id ffacd0b85a97d-4356a051afbmr34449511f8f.39.1769087386472;
        Thu, 22 Jan 2026 05:09:46 -0800 (PST)
Message-ID: <7a90ab94-3eb0-4d3f-8128-210baed60e3c@suse.com>
Date: Thu, 22 Jan 2026 14:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-4-roger.pau@citrix.com>
 <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
 <97127b23-4e4c-4b06-a8bb-b1dad31bf0b0@suse.com> <aXIgscqjXmCUqsQn@Mac.lan>
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
In-Reply-To: <aXIgscqjXmCUqsQn@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 271346712C
X-Rspamd-Action: no action

On 22.01.2026 14:05, Roger Pau Monné wrote:
> On Tue, Jan 20, 2026 at 08:25:49AM +0100, Jan Beulich wrote:
>> On 19.01.2026 17:13, Jan Beulich wrote:
>>> On 15.01.2026 12:18, Roger Pau Monne wrote:
>>>> The current logic allows for up to 1G pages to be scrubbed in place, which
>>>> can cause the watchdog to trigger in practice.  Reduce the limit for
>>>> in-place scrubbed allocations to a newly introduced define:
>>>> CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_DOMU_MAX_ORDER
>>>> on all architectures.  Also introduce a command line option to set the
>>>> value.
>>>>
>>>> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Changes since v1:
>>>>  - Split from previous patch.
>>>>  - Introduce a command line option to set the limit.
>>>> ---
>>>>  docs/misc/xen-command-line.pandoc |  9 +++++++++
>>>>  xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
>>>>  2 files changed, 31 insertions(+), 1 deletion(-)
>>>
>>> If you confine the change to page_alloc.c, won't this mean that patch 2's
>>> passing of MEMF_no_scrub will then also be bounded (in which case the need
>>> for patch 2 would largely disappear)?
>>
>> This was rubbish, sorry. Besides my being thick-headed I can only attribute
>> this to the double negation in !(memflags & MEMF_no_scrub).
>>
>> I have another concern, though: You effectively undermine ptdom_max_order,
>> which is even more of a problem as that would also affect Dom0's ability to
>> obtain larger contiguous I/O buffers. Perhaps DIRTY_MAX_ORDER ought to
>> default to PTDOM_MAX_ORDER (if HAS_PASSTHROUGH)?
> 
> OK, yes, I can default to PTDOM_MAX_ORDER instead of DOMU_MAX_ORDER.
> 
>> Yet then command line
>> options may also need tying together, such that people using
>> "memop-max-order=" to alter (increase) ptdom_max_order won't need to
>> additionally use "max-order-dirty="? At which point maybe the new option
>> shouldn't be a standalone one, but be added to "memop-max-order=" (despite
>> it being effected in alloc_heap_pages())?
> 
> I had concerns about adding it to "memop-max-order=" because it's effect
> is not limited to "issued by the various kinds of domain", this is an
> option that affects all allocations.  I could try expanding the option
> description to reflect that, but I wasn't sure whether it would lead
> to confusion (as all options there are per-domain currently).

Hmm, fair point. Let's keep it separate then.

Jan

