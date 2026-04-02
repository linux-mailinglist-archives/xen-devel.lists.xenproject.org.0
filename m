Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD9EHR0IzmkwkgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:09:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2938449A
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271086.1559384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BF2-0006pG-23; Thu, 02 Apr 2026 06:09:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271086.1559384; Thu, 02 Apr 2026 06:09:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8BF1-0006nH-VT; Thu, 02 Apr 2026 06:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1271086;
 Thu, 02 Apr 2026 06:09:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8BF1-0006nB-51
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:09:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8BF0-008t0F-Hl
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:09:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0806-5cb7-0a2a0a5109dd-0a2a450aea0e-18
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:09:18 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce080e-ee98-0a2a450a0019-d155802bb881-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:09:18 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48891776099so2070785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 23:09:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c60a2sm5214493f8f.10.2026.04.01.23.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 23:09:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1775110158; x=1775714958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wvcurm6D7Kk9ztMyZ9pmbclUAnFvWsUBR6b0jGFOz3M=;
        b=AUIQQIqus3HHDEB1hqUhwmGoihc37TfM3xIJ4Si3WhsAgcb/YbCKJR3n6JlvZnkj83
         rJ9ufpYrVCcAriLNSkjohGS5is50MVvIwhEQy/EfEhvaT+yy2UcVRcwkkGqgPsVRigFZ
         tHWZaZ8P/kFgTU6Gg2rDQrsbn2KF3Zwz/yiE1GgzPteSHXIWX/q7zIFmkUwYgcMwKizK
         OAt/vQMJz9ZbOd/muZFHij9lT0WT/G3m4XSK8kOFQ+kn82UOKWZ0H7TRtjGqOY4pg5e5
         Dr0CfXg43JeE0IIwvaO6jdPYiyLXpHqnBoRXkh4Sd5EAaVdUdD+1p6+iozx8a7xqSh9J
         AZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110158; x=1775714958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvcurm6D7Kk9ztMyZ9pmbclUAnFvWsUBR6b0jGFOz3M=;
        b=AYKp6oL0OgWeiHLA4k8nMXSYj3+t5iFz71lXcyztdvipd4OhF7zDFhj2iteaYD4T72
         qhm8PXUiUgORGV4l6mgBFevYXUNUlGQl4/RH9JLBmhlAI9mvgKLJjB9QBQQ00OL6Th6j
         RRnkL6jtUzukW2dSb+3Mgs9BakO347MegTNdx3INMqBhJ7+qpvseV9FzEO3+JDbkWbjN
         QteX8n0KSE9I5gEBh28bF8mnyZG6er8dIjFCLrJhlRBtMq994seoCguuALprbCjGqMaO
         +FBuIGfl+1B9xTJdLeNvkoFgeRqUPYF4Dk8UvNZyumAKuZnDRRrNGdjDYaQZkaiL7yR/
         Poag==
X-Forwarded-Encrypted: i=1; AJvYcCWFC9+hac8QTDvTCKisw7e4yFegoFebX7ea6qTNuJp6uaymF0tK4DNOSB2rpNwQhPmU9E9zmcY6V/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy5wB08qDmXdxQXxtvuGItDOZGTd46Bie4qOMGkOW5KT7b1pdS
	KBSw4apQWxvl5yQkDLb4xBlztGzrf51YyktITApIHChVRnp7iC9w6UYNw3IwdQ2t1w==
X-Gm-Gg: ATEYQzwSKl29rbMFqHcqU9/c8H14+Uu6oHsP00tfaXMslDfgPmKpOA482w6Ppo9Na/F
	/yOVsl6USy8A48Vte5U6uNuFJv5r5iT6HLS4FxdFpdOwMHM3plWUk6KGDeCAExSpO6iKoZKW3RG
	jvxF4oV+HXuatW+nsVSVsRJajV+n1ZQ+qG2ynxeK2QDf7r6DsJx9KBpGI0ownneeP8hCr+O3dAN
	hdmoOArE6r2u8/sij+WQC9rJ6yhrMYKrnih71bzGEFOuqrfZ//yulL96GxONxB7jaC1+qgtFhE9
	n/U7LCM3J0+YjbPUNJNIJ2BKasLuk5cg0iS6kETwvJzMVHXyrg2iL+vXuDVSb2p9nSbxBLb6a8o
	rY4R5aurcCBOwqBH59DjWo53gnDnqC4+kYIXY0YqsgaremLQJi1kZdWf/1brSaHxv5krfRDKep4
	VsjO7lNVRfiRqGgO3tQHzuPpJqLR8B+USVrNe1VMSY0KNAe7DhWsBKOpLQ9utxbG7IMyQh9/8O4
	pSc1mj8XwAfmhg=
X-Received: by 2002:a05:600c:1f89:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-4888b7135d1mr32158855e9.13.1775110157857;
        Wed, 01 Apr 2026 23:09:17 -0700 (PDT)
Message-ID: <94b2e444-844a-4d34-9c9f-de0b9e6e23b1@suse.com>
Date: Thu, 2 Apr 2026 08:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Lockless SMP function call and TLB flushing
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775110158-BE1500B1-E009B9EE/0/0
X-purgate-type: clean
X-purgate-size: 2028
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
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C9A2938449A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01.04.2026 18:35, Ross Lagerwall wrote:
> Hi,
> 
> This series implements lockless SMP function call and then rewrites x86 TLB
> flushing to use SMP function calls.
> 
> We have observed that the TLB flush lock can be a point of contention for
> certain workloads, e.g. migrating 10 VMs off a host during a host evacuation.
> 
> Performance numbers:
> 
> I wrote a synthetic benchmark to measure the performance. The benchmark has one
> or more CPUs in Xen calling on_selected_cpus() with between 1 and 64 CPUs in
> the selected mask. The executed function simply delays for 500 microseconds.
> 
> The table below shows the % change in execution time of on_selected_cpus():
> 
>                   1 thread   2 threads    4 threads
> 1 CPU in mask     0.02       -35.23       -51.18
> 2 CPUs in mask    0.01       -47.20       -69.27
> 4 CPUs in mask    -0.02      -42.40       -66.55
> 8 CPUs in mask    -0.03      -47.82       -68.39
> 16 CPUs in mask   0.12       -41.95       -58.26
> 32 CPUs in mask   0.02       -25.43       -39.35
> 64 CPUs in mask   0.00       -24.70       -37.83
> 
> With 1 thread (i.e. no contention), there is no regression in execution time.
> With multiple threads, as expected there is a significant improvement in
> execution time.
> 
> As a more practical benchmark to simulate host evacuation, I measured the
> memory dirtying rate across 10 VMs after enabling log dirty (on an AMD system,
> so without PML). The rate increased by 16% with this patch series, even
> after the recent deferred TLB flush changes.

Is this a positive thing though? In the context of some related work something
similar was mentioned iirc, accompanied by stating that this is actually
problematic. A guest in log-dirty mode generally wants to be making progress,
but also wants to be throttled enough to limit re-dirtying, such that
subsequent iterations (in particular the final one) of page contents
migration won't have to process overly many pages a 2nd time.

Jan

