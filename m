Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBbMLmC1wmlilAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:01:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA27318861
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261026.1554167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54Bu-0001zb-BI; Tue, 24 Mar 2026 16:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261026.1554167; Tue, 24 Mar 2026 16:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54Bu-0001xs-7A; Tue, 24 Mar 2026 16:01:14 +0000
Received: by outflank-mailman (input) for mailman id 1261026;
 Tue, 24 Mar 2026 16:01:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54Bt-0001xm-CC
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:01:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54Bs-00Djc7-9j
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:01:12 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b53f-e002-0a2a0a5209dd-0a2a45078f28-16
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:01:12 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2b547-fd74-0a2a45070019-d155dd31e53a-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:01:11 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43b3f91a7abso907000f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:01:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b647036e0sm39924244f8f.21.2026.03.24.09.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:01:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1774368071; x=1774972871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+uA0bTzfyfDdSO1Kzokmr2t1nVV2y2jd9hlzyXrJoMI=;
        b=IxU38UWxqcvud/fkbEhhOp8QuGTTCbRDEViOVv2jWRJz5rnIU9I2BQwf+JxYRo57ek
         Xv9PAKMDr9vwa8wtAdD/rRvRXIxThylju32va/ugUiJUyeXd2LerTmEzDgCvUSh05AiA
         boCoDjQckLdYC8xa+5TTERdczxtA/E/bOjkKTATKFOsbzNbC53hRoTpdD/m2BTBeRCUh
         F8wuvNvSgjpzEX+LqhgoEBshCMUPBp67rqBMP+O5mluiYbgB0iMOGjUr1LIwffj35osX
         YiqgiOYFv+y3+MpPGJF0mu2HVBMYjO4dHovi40uxKjvcov2EcUyTfuQWepVohlhf7ftb
         5Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368071; x=1774972871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uA0bTzfyfDdSO1Kzokmr2t1nVV2y2jd9hlzyXrJoMI=;
        b=YMmq98Y9sT6A91SKySsCgpARovtH5TBIgqIfahP3xLbSKz3eCMXWi9+4rjn5EIC069
         3lE6loDxnyGyiwxzmvt8bPgd2rv1+1g/YV99K5BD5C/HupXge9K9SnriBetW6zgpQDsQ
         NP0KH5YKx33cDZoOOdWWqHW2ZRdCft8Z8m+iP3lTaqMn5n5uedBWAqt0Zkb6you6cVZ8
         qZMa5dZpxU8Hy6EYxHA86VnSjElDBvLlGZd/f5Ie81sqCdtUDVmyGYnxzSsyuXKnFg9I
         oFyQXbJrMmgf+SbH7RdCqH3rNRd3uBmsM3x6uyTDwsBdDpNR2n1Sy7eSy+bbUsE8B9Zp
         mSsA==
X-Forwarded-Encrypted: i=1; AJvYcCVc4iO4DTu5BjW3OsU/byJSmrveHKfiRba8uhzleE/wbM17nhZFjhJStPtwtQSwCXbDtonRTXIhuGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx0caknDBL9NOoIoxTL4nhLwOZIygNX6d+KYEdyCXrf1lifCgT
	mL2As5CA0WSLWovpzkQ+qQ++3vwDYIEJpO/P2QLEwnRt/AmaigscX4oao7aHBxj3BQ==
X-Gm-Gg: ATEYQzyRJ95mzDdllvJ8HVH1gG9TdLX1MHJoJQ9pAS366iTIOyHB2UHzSof4qUk2zCR
	J72XqH7DDljRP6Is6OLFsACjGrseNsS7Uqxo9gXAEbxfUiSxsChwMgTwI6VWW1pcG+C8pkCqnR8
	JnY4W+OMmo4FIibRf29ICo7rltt0ivYlcfekNKGwXNNnyQBhxaDNcCuB5nvIlvL11q9OokYoaET
	kWbx/qhXPm+i/4p7VJtyhkcS6qwADMfx9z1C3BUglDnLMYQAvWyAihZo/1sI9ekxxWWBMjvjJlp
	JXyoaqODoIQyXC4qXRba4nYUt0+dnRFYNYKyE+IdKnPOf4NS7P/7GI/n3FjjvlezKExC64tUYG0
	C7l0I2o2nyQCuOGAQc78Z/sUgtQa8ohsYcmOhWm1QY7a6PNlrT7D37rnjeXgtv6AVkanuByooEM
	LQdECnJJxCiJlgxJwbQUnCRbucngkDLDNNILFqubSkchAY4aFwZtqTjGJ2xXkxL7lZHg88gBKhQ
	vBiHjzOkxRD574=
X-Received: by 2002:a05:6000:40c7:b0:43b:4f0c:aefd with SMTP id ffacd0b85a97d-43b889c85d2mr30686f8f.23.1774368068551;
        Tue, 24 Mar 2026 09:01:08 -0700 (PDT)
Message-ID: <0857c00d-f11e-4b84-8988-e7a096aa55f5@suse.com>
Date: Tue, 24 Mar 2026 17:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86/vpmu: Sanitise Intel PMU version
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <dcd278658139976d1af92b4d201c17e12cf7eb2b.1773160025.git.teddy.astie@vates.tech>
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
In-Reply-To: <dcd278658139976d1af92b4d201c17e12cf7eb2b.1773160025.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774368071-4EEAB303-03C69D91/0/0
X-purgate-type: clean
X-purgate-size: 1275
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6BA27318861
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 17:44, Teddy Astie wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -253,6 +253,33 @@ static void recalculate_xstate(struct cpu_policy *p)
>      }
>  }
>  
> +static void sanitise_vpmu(struct cpu_policy *p)
> +{
> +switch ( p->x86_vendor )

Nit: Lack of indentation.

> +    {
> +    case X86_VENDOR_INTEL:
> +        if ( !p->basic.pmu.version )
> +            return;

Better use "break", but: Why is this check needed anyway? Nothing ...

> +        /*
> +         * Expose up to PMU version 2 
> +         *
> +         * PMU version 3 introduced the AnyThread bit we don't want
> +         * to support (see "AnyThread Counting and Software Evolution"
> +         * regarding notes with virtualization). This is the only known
> +         * feature introduced in PMU version 3.
> +         *
> +         * PMU version 5 deprecated AnyThread, and introduced a CPUID
> +         * bit (ANYTHREAD_DEPRECATION) to indicate that this bit isn't supported.
> +         * That CPUID bit should be set for PMU version 5.
> +         */
> +        if ( p->basic.pmu.version > 2 )
> +            p->basic.pmu.version = 2;
> +
> +        break;
> +    }

... here breaks if it was dropped.

Jan

