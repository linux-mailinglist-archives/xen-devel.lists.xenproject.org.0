Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHi7HNdL52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:05:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27F4394E7
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288772.1569016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7y7-0001zT-Ev; Tue, 21 Apr 2026 10:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288772.1569016; Tue, 21 Apr 2026 10:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF7y7-0001wf-B5; Tue, 21 Apr 2026 10:04:35 +0000
Received: by outflank-mailman (input) for mailman id 1288772;
 Tue, 21 Apr 2026 10:04:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF7y5-0001wZ-Uv
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:04:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF7y3-00BIYo-Q3
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:04:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e74bae-bab6-0a2a0a5309dd-0a2a4505a636-28
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:04:33 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e74bb0-aaa8-0a2a45050019-d155802bc490-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:04:32 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so4127265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:04:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d5b1sm40009102f8f.30.2026.04.21.03.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 03:04:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776765872; x=1777370672; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5gwkCcKzoBTxo7EO2L7igVFkM+tIMxSSN1DkJy9Dl2k=;
        b=V7B8dlJ26zZZLDw18HxY3e+xAAAPcfe1zIB6OU5NQdfv1WwqghmvzT/jLZr7jxjccL
         PCm8x1Dp7MRDrzwkY4RVIvzfxOPKteBvJbnPEciJjOoQYUC6SQdU3oaowU8B1Y5URxQI
         UCDoPt0cKkjMDI3/8bPolTUz3bfYNhIyifuDFNArTjzxfwsT3Vi2Vd4gBmrWvZQlUzCu
         JYXI5y8gwW4/A38mZhw7pJ7f8Jwg+6Aymm9p7hBn7pLlgT/D2yZd+8OnshBfyUug9rlk
         wsFmozxg+AKhqZY2vanWUhy0Ym/MCdiwZSZjRGjWtBKFAwmi0TbYKBydvKfzaqOUsHPk
         FC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765872; x=1777370672;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gwkCcKzoBTxo7EO2L7igVFkM+tIMxSSN1DkJy9Dl2k=;
        b=m53MMQ9MKRd1WXhy0tUIOhujzJ4vVzeOHCFyTBYjgzbDwVBCr+9g4nQsqa9ex7pGCr
         6CP/R790DSSLMzOOlUbodzMVeJ/7vrP32EyFMdX5hF2xOe6fLC8c1BulrL7CRrYWf/c4
         +Qpu/iU8sj9m9Sw3BiCW72VhcEqapcxU5YJxjxmKIDuQlfwM/tZYbJOGf10qWXCKjQTT
         oDqFPjDOwOyneddZAwY/TbqMY9BBraJCepBKAAYEoWpi06eGmrJLGwvXxlK9lPPunCfd
         C/IA2WSk0iN8z9TIuYzkpMHXkR3uZm+C7cp5BeLFcYexL/Z2PdGb4TElY3EjqMxShtaf
         7JTA==
X-Forwarded-Encrypted: i=1; AFNElJ9Y+XNe09V3gw3pGrYxOgyhrqzS+0gYIZTkLOS6uAYa3sjboNVbC7wPAejbAfPzw2L04PAVSo1fPUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk5EzAUl6obmqfUXcYL/t41iHVszAUPUErRemaR2yEv114Q1wo
	uLdOFDdnPj0vNOu97xKQ9u423b4T6fqgyvuxaM+40UNI3UJTUlovDPcTLvoq19Zllg==
X-Gm-Gg: AeBDies1FO9Wqwr4C/JzFq17rKXIB4dEIQJm0q75QXb68c8YadcSkF1ycb29M3QFreR
	+oor4iwwlXiq0LNrKfCmxA1ZGmIwgdJkbfcmkjGunO+gc8r+uIlv1aiNVXYl5LiHS3Km+U40Biz
	jFMxTZlenJlQgkskI1wINp6nqugI540Zbk9Ev03N79RrDzKA46c5xvqpQ1zq7FmBwVPsFzbGUNM
	TOiOd9PhyEt6bLiwJ1lTlnaKLhrm5JwD5bHcmsBM8hCJQyFh5JyemIsKWVVU20WmmpbN7IrEpxI
	Uob2owq7TbhkmAh0BP6URZ9q0GKSPdR9U5fRFJdWfrOJsGY9f1JVXRDhF4XSW9nV2in7w9xtjmt
	9WfvpZJm/rK7HiVNaZeB/QDULG32jZ55R7BH5eDv3EInE4kyCuh0ep0/avnFzrEOq8asCZmOH+S
	/gMLXGeuUBYzmAe1BYfB4/TFRQ60KFaw8uqWV9o1Xc8qY69Ayfz83+72SRU3WfmI/2FsrV5EdRc
	QiWf8eI0198qL4IIHFY+8rvjQ==
X-Received: by 2002:a05:600c:5254:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-488fb6e62a8mr267017505e9.0.1776765871963;
        Tue, 21 Apr 2026 03:04:31 -0700 (PDT)
Message-ID: <16cd27e6-8b29-409e-a431-055df43a5b01@suse.com>
Date: Tue, 21 Apr 2026 12:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xvmalloc: adjust XVFREE() ordering
From: Jan Beulich <jbeulich@suse.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
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
In-Reply-To: <29c2a896-59b4-4804-ade4-362f65ffadfc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776765872-E1DDB443-7DD972EB/0/0
X-purgate-type: clean
X-purgate-size: 2358
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4D27F4394E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 16:32, Jan Beulich wrote:
> What c4f427ec879e ("xen: Swap order of actions in the FREE*() macros") did
> should have been done right away when XVFREE() was introduced.
> 
> Amends: 9102fcd9579f ("mm: introduce xvmalloc() et al and use for grant table allocations")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

On Arm64, and only for alpine-3.18-gcc-debug-arm64-boot-cpupools, this
reproducibly causes:

diff -u  ./.xen-syms.1.o.sym  ./.xen-syms.2.o.sym
--- ./.xen-syms.1.o.sym
+++ ./.xen-syms.2.o.sym
@@ -7,11 +7,11 @@
 0000000000000000 l    d  .bss	0000000000000000 .bss
 0000000000000000 l    d  .rodata	0000000000000000 .rodata
 0000000000000000 l    d  .note.GNU-stack	0000000000000000 .note.GNU-stack
-0000000000000000 g     O .rodata	0000000000004dd8 .hidden symbols_addresses
-0000000000004dd8 g     O .rodata	0000000000000004 .hidden symbols_num_addrs
-0000000000004ddc g     O .rodata	0000000000007721 .hidden symbols_names
-000000000000c500 g     O .rodata	0000000000000028 .hidden symbols_markers
-000000000000c528 g     O .rodata	00000000000003b5 .hidden symbols_token_table
-000000000000c8de g     O .rodata	0000000000000200 .hidden symbols_token_index
+0000000000000000 g     O .rodata	0000000000004de8 .hidden symbols_addresses
+0000000000004de8 g     O .rodata	0000000000000004 .hidden symbols_num_addrs
+0000000000004dec g     O .rodata	0000000000007749 .hidden symbols_names
+000000000000c538 g     O .rodata	0000000000000028 .hidden symbols_markers
+000000000000c560 g     O .rodata	00000000000003b5 .hidden symbols_token_table
+000000000000c916 g     O .rodata	0000000000000200 .hidden symbols_token_index

There are only two uses of XVFREE() in code that is built for Arm. I'll
see if I can repro locally with the exact same .config, but I fear my
chances are slim.

It feels wrong to push the patch nevertheless, but it also feels wrong to
have to keep it out.

Jan

> --- a/xen/include/xen/xvmalloc.h
> +++ b/xen/include/xen/xvmalloc.h
> @@ -71,8 +71,9 @@ void *_xvrealloc(void *va, size_t size,
>  
>  /* Free an allocation, and zero the pointer to it. */
>  #define XVFREE(p) do { \
> -    xvfree(p);         \
> +    void *_ptr_ = (p); \
>      (p) = NULL;        \
> +    xvfree(_ptr_);     \
>  } while ( false )
>  
>  static inline void *_xvmalloc_array(


