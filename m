Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB4aIkmS4GmsjwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:39:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192140B1DA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 09:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283015.1565326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHK4-0006yf-Bh; Thu, 16 Apr 2026 07:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283015.1565326; Thu, 16 Apr 2026 07:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHK4-0006wZ-97; Thu, 16 Apr 2026 07:39:36 +0000
Received: by outflank-mailman (input) for mailman id 1283015;
 Thu, 16 Apr 2026 07:39:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDHK3-0006wT-8I
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 07:39:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHK2-00HTU7-H9
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 09:39:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09235-bab6-0a2a0a5309dd-0a2a450c94be-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:39:34 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69e09236-f40c-0a2a450c0019-d155802cb838-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 09:39:34 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so101700285e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 00:39:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5854163sm31390845e9.13.2026.04.16.00.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 00:39:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1776325174; x=1776929974; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lUy4IMsFKUYxEdOGRnb7lcU/LwT38X80A2ejqY9vxrs=;
        b=XsmmIFKyBOmVsH5LOCJ0T0KRdA12eAnZGJPvZSExsRvwFBnEZhZGHun83Cfz+fISeN
         44OjKubVVeFRkxUpww0freoj2t1venoGqRIE1Kaq4vxLH9p+/r/EIYm3TaYnmhmYWZCp
         9hZaRKcBwPmkY/p6LsVMyBMryJ7I6tV1LKGqD62RMQ9CpPdPOTc9Im+4wghh34Vv0ivR
         v5yk39WcIaPXCsndDhbkf0/dbUo+PGGhnk+WjCAcUFpCHtwW18YYJ4WqfklEuS66J6uP
         vGxPh6KO/RyMwKHnIfNKf8EZSBBbuUXIZPUo3MahMc7L+dm5NbsS7BQLK+W0Pksa3IFv
         IBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776325174; x=1776929974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUy4IMsFKUYxEdOGRnb7lcU/LwT38X80A2ejqY9vxrs=;
        b=Hs2jiWouDixA9vrkq5YmTDHdFPf0UpVrZzfxsFooBz2oBfbMQybsCd72/rvphBWeUY
         QMT/gGWq76Qb/T1lQn41VHuQ8BKGFESjsEmo4szUqALwmeDyO8BfwEEgkQgkoqZVu4Aq
         /miduf3gtje+XNGSzae1kcn8YzdikSYPnKWAYfLuYH9OUItWYhzd+vzibpJSUuXqwYrL
         K1m8s/dDNnkBVXh+6/PS/hZbayVyxWvCZdODiwMV5bpgtKfkV0LZgGiHCgqnEpInlKxt
         Vb+k23dJj16xY11hh5z0goeONnURPSDygZMXtbg1GESz9KADJPKCkrQ4s11ZIZVWDAMm
         i08w==
X-Forwarded-Encrypted: i=1; AFNElJ82aQuA+U4Vfy2SeBOpWY/6s2Spv5G7hsrIDlqWaOAiZX5+M5LMpavRResbnOXFgWj1LkoTQeppuTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwP90GusUrtCtkqS51725u9VO4syqN7R39EaSIPp3iLxY9xVSnS
	Fn4ipCXJ31T4ws2XQTbeANj398UHipquleqrtlEahRIFT7F92Xnl728pzyH9hg6gmA==
X-Gm-Gg: AeBDies/bvX49R9RxetmAcnq+pviFtCRBsav+pnA9mFHuoTs8QYwCDvDq012vD5YZvK
	HBIcRGFlQ4t3wiEcLfZ3V3jAXu/LaOAk+H256W3MnaEjRS8JBSjfQxoxfEPpsafWB4RQJaKRPEz
	hLhg+dRel+DSIYKWHX6BaJqDmasAJMPyeqmtq9s5VRNNCM0W1Klw6Hw4W/2Uu6b99YD2Y0hXyJm
	mgbwwSjKuZ1du8zAsenAoxpkeq+uuqVcM/7rHaXKbudezGoaf56kRNvLtlLobUkTZXbQiRkb9hG
	VLKlHYIoJuqSLol5cl0BpgHYv38y66+JKloQb1qW6tY0Ge9zs7ZVqbyjcOCblpz0wPFJupW5+ei
	EVMKhZf1Al6aQdPLkXON63+h8dw58MquQyNNq8h7QvQUaBAB3qeuz6Nuna269cumDUfZ7zOumyh
	a9AXSuv0sONVUgnIc/83ueKHiLkDOkUkXbpLMr1DpGNJhLjZh1xToDhwxPr292A31qZIq3l9Fiq
	MxRnVgCl97dnqkaraITBLJ0bA==
X-Received: by 2002:a05:600c:19c8:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-488d68ab2ccmr333871375e9.29.1776325173722;
        Thu, 16 Apr 2026 00:39:33 -0700 (PDT)
Message-ID: <15fa364f-03b1-433b-b759-9f87da338cac@suse.com>
Date: Thu, 16 Apr 2026 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tools/tests/alloc: Unit and Integration Test
 Framework for page_alloc.c
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1776273656.git.bernhard.kaindl@citrix.com>
 <bbd242400a624465bebae0fa2b7591acd37c7236.1776273656.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <bbd242400a624465bebae0fa2b7591acd37c7236.1776273656.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1776325174-81D53A3D-AA714608/0/0
X-purgate-type: clean
X-purgate-size: 1935
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5192140B1DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15.04.2026 19:34, Bernhard Kaindl wrote:
> Add a test framefork for unit and integration test suites testing
> the Xen page allocator module xen/common/page_alloc.c in isolation.
> 
> It enables test suites to verify the behaviour of the page allocator
> in situations that are easier to create and validate in isolation,
> with full control over a synthetic Xen heap state and visibility
> into the allocator and domain state.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Just two remarks (nits?) for now:

> ---
>  tools/tests/Makefile                   |   1 +
>  tools/tests/alloc/.gitignore           |   6 +
>  tools/tests/alloc/Makefile             | 141 ++++++++
>  tools/tests/alloc/README.rst           |  31 ++
>  tools/tests/alloc/check-asserts.h      | 347 ++++++++++++++++++
>  tools/tests/alloc/harness.h            |  69 ++++
>  tools/tests/alloc/hypervisor-macros.h  | 101 ++++++
>  tools/tests/alloc/libtest-page_alloc.h | 356 +++++++++++++++++++
>  tools/tests/alloc/mock-page_list.h     | 307 ++++++++++++++++
>  tools/tests/alloc/page_alloc-wrapper.h | 465 +++++++++++++++++++++++++
>  tools/tests/alloc/page_alloc_shim.h    | 433 +++++++++++++++++++++++
>  11 files changed, 2257 insertions(+)

This is a lot of new code.

>  create mode 100644 tools/tests/alloc/.gitignore
>  create mode 100644 tools/tests/alloc/Makefile
>  create mode 100644 tools/tests/alloc/README.rst
>  create mode 100644 tools/tests/alloc/check-asserts.h
>  create mode 100644 tools/tests/alloc/harness.h
>  create mode 100644 tools/tests/alloc/hypervisor-macros.h
>  create mode 100644 tools/tests/alloc/libtest-page_alloc.h
>  create mode 100644 tools/tests/alloc/mock-page_list.h
>  create mode 100644 tools/tests/alloc/page_alloc-wrapper.h
>  create mode 100644 tools/tests/alloc/page_alloc_shim.h

No underscores please in new files' names when dashes will do.

Jan

