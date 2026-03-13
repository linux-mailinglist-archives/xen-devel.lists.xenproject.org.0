Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOx/AnK3s2nbaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:06:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB627E7C0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 08:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253268.1549544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wa5-0002mm-0o; Fri, 13 Mar 2026 07:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253268.1549544; Fri, 13 Mar 2026 07:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0wa4-0002kg-Tt; Fri, 13 Mar 2026 07:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1253268;
 Fri, 13 Mar 2026 07:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0wa3-0002ka-E0
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 07:05:07 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3df72d5-1eaa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 08:05:01 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so17970525e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 00:05:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48557c66583sm13953565e9.21.2026.03.13.00.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 00:04:59 -0700 (PDT)
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
X-Inumbo-ID: f3df72d5-1eaa-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773385500; x=1773990300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N8jOkHiXd1EfrhPo3SajjKBWEjcQ9wGxmz6VVii8k3M=;
        b=Zr01AhX4fVcBAPE1WqHZ3Oj08Z37Sq/6R+kJQzd72zRLqdER49rEMrRiUMRtenkf95
         Yw3g6c+clQ+PF/+MflGdidpK/N2+T3nOKvU5j4o6zhU7+p7HT5USIQQk91qseCCTca+9
         8Ri2ZINTmuX6Arx5YJVXweoD9fIcv6M3PEfVI9zcLOIMppMXgdNNbAFGbCRTj/aGuz1J
         Yyg9r9hot6XG0RdwW23ullJWzO915fGHUPL7bnQdqDYHPBiubk4e/mGopNoMZzL9wtgX
         YzqfVV880l65QHIQ93RkZLB7WHCQrDqWyZ1GdWca/H3IHUqkxn0AHtKxri3pAGyJjdTd
         7LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385500; x=1773990300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8jOkHiXd1EfrhPo3SajjKBWEjcQ9wGxmz6VVii8k3M=;
        b=dw8PAMd2bpVbDqPutIgaFyOTPodg+M/hh6B0SgAyGjflNjaExPlp7bjQWjfnAtOuA6
         P//eZJIMBsLGik5K7lK31ZlXl0lrOPg1DBW/EQyPxH3ndCafj+OwhsosxfLv/+/b2L2o
         AJ/L7v6j7pVmp0si+QvifPGSeVwVmOvW9bKPSgdyusNowlCkdAwA23GenCJMSs0+SZur
         T90tseA/R+6MhzMeLtlXx4zAXt+IBMqo5qnMvMnWvGkn75d457wfWWb3epATD9rSB/HQ
         a+pGMpNgbEG5hxaXpir9eYHwEnAfmEp8B2GOGfwUuN8Z2UD+X62Pa/jnGLZMsXt59lGq
         iiWg==
X-Forwarded-Encrypted: i=1; AJvYcCWuUOOs7+8nk+ehc0xoiR31UsaTV0MyvCrsO02Rkhb4Q8R+f3lUDtnm04WE1uOgB9SBWiC8oeW2geQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWgLbsbQNQGkN727z6pV0/FowXR8vLsu6Lg4EKha5x0H8WKAR5
	BGYYtSpENL2VaG+KBtE5etRKzpZMZmZagpOY+Cv2ZMuCNxM+AuWpfT/IbXCYkE2L7Q==
X-Gm-Gg: ATEYQzzaoHLJlkEjVv0kDSaMrelIhrYsHWaj3dCqYWUoyKHQ52dqOPQUKKpWVKGjYka
	pzDuif6/up+mfjSdBuejOuA9h9NOVxqyA1R4QVNv1cGd4ttRZjbNA+Y56lc9eHuQESefUMABsD7
	CTmSO/9Ht+Bq7dxXJoQgmrCk5XKaaIpWB7tou0UF8tNJJ4FJRRrtmS5fvoUEsN2B+6lukl1w0id
	bXimN2abumN/WGF3pbfa9btb178xNdMYV3StDU7pnmJRJOn8QT6FP7kkUmprPvHKvAL7I6czH4B
	pmSQM0rv9FTWPOOPRoJNppL8/qs42JuW+1kScaXI6+9EnpD3K+N2KRXGJ5TX+SAU2+8G2SOCJM8
	hYiFkxXM/y/iQDKfXL6nVl1p8gC+sZQS6TPz0FkwqEWATWnBIjXLjMJW9FRgl8k5aeQNtrI6JZs
	rpYL35tbjb5cumPGaouYSq4BKW4CWB4l6yWU1X2jcvBoJhSyrVm8mLUYdBnhZ3rtN7FdZjkoXWR
	m7wvy6/fq/Y5YI=
X-Received: by 2002:a05:600c:3487:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-485567052f6mr31803335e9.21.1773385500532;
        Fri, 13 Mar 2026 00:05:00 -0700 (PDT)
Message-ID: <7d4bd6e2-efcb-470b-a82e-83e693d28993@suse.com>
Date: Fri, 13 Mar 2026 08:04:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v2 1/7] x86: Remove x86 prefixed names from mcheck code
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: roger.pau@citrix.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
 <20260312204339.740403-2-kevin.lampis@citrix.com>
 <abbcce95-836f-4a06-a250-4480061ac3cf@citrix.com>
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
In-Reply-To: <abbcce95-836f-4a06-a250-4480061ac3cf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 55AB627E7C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 01:01, Andrew Cooper wrote:
> On 12/03/2026 8:43 pm, Kevin Lampis wrote:
>> diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
>> index 839a0e5ba9..4d6b7d588e 100644
>> --- a/xen/arch/x86/cpu/mcheck/mce_intel.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
>> @@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
>>       * DisplayFamily_DisplayModel encoding of 06H_EH and above,
>>       * a MCA signal is broadcast to all logical processors in the system
>>       */
>> -    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
>> -         c->x86_model >= 0xe )
>> -        return true;
>> -    return false;
>> +    return c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH;
>>  }
> 
> This breaks P4.
> 
> It is not safe to write expressions like this, and I've already
> explained why.

Plus I had asked whether the comparison needs to stay at all, seeing how
Xen has been 64-bit only for a pretty long while.

Jan

