Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFXNFOFtoGk3jgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA41A9564
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242172.1542851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvdlm-0002ok-Rw; Thu, 26 Feb 2026 15:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242172.1542851; Thu, 26 Feb 2026 15:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvdlm-0002m3-Oq; Thu, 26 Feb 2026 15:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1242172;
 Thu, 26 Feb 2026 15:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vvdll-0002lj-GX
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 15:59:17 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19b9b840-132c-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 16:59:15 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48069a48629so11340385e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Feb 2026 07:59:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c597578sm476245f8f.0.2026.02.26.07.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Feb 2026 07:59:14 -0800 (PST)
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
X-Inumbo-ID: 19b9b840-132c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772121555; x=1772726355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9h7KiGa2XnrvUD/MkOcQiZBTqMcoMzchN1b+d4P6Dew=;
        b=KcSeEKXBkojCojJeTevuvVTWSWlYKLDK9imzYpCp307sIeQSfqX3cWf3Br97ZtvKhy
         mSZ6cmKaAVtLwH8uDxaFVUo2u6M5sPpwuznALQPqur+PEsAe9Ouq8yVB0GoaK1JPb21e
         amKoPhZUoCE6Yizdi0hQ47xS8Cx7poxEGuwylDdOlwJJfCypEjGF65jF/NOB/lwCLauq
         yj9XZBtG8rV18es7IkEajm/vATNWHUe4l5eosQrLJFXl4++a1jA+tpk/aIYyiC+N8TGM
         bxLdqRVtOp1JSI/yPAx6TzINR8d04jZb4rWU7IFJSZLMxwlz8RibTFgbjtdrwAxNTmje
         81wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772121555; x=1772726355;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9h7KiGa2XnrvUD/MkOcQiZBTqMcoMzchN1b+d4P6Dew=;
        b=ZpRggzans6wMBr/xqDOKiKF24OnBBSzN/ZAkhFxnfcIBK3ZmLzCdVgKuWD83uhUgy9
         AmXbgr54XlRdntFOdn0KH2GN93JKXpHqQgHDQaKzb8Z1twGROti9bsPD3ERBdTJLlqUp
         PIaFKVuAGLKJn791+Wbnt57OxuOp64aPEmPUUdBt3g28dEXSbrqITBdmoPmwfXQ20VHz
         wEgVUFCydV2O4i/9bVI222qyVkloK3rJMHg38ZTD5DKgaLqf/3BOJl+fXdcrKs5E/T5N
         DfcjYMi1Cn+4cKUac90odppI9YnaAG1uTghE0VpSmp6MUYcgGiwMXedGSHix5f2ZGyOU
         TFeA==
X-Forwarded-Encrypted: i=1; AJvYcCVGzVjsENy76zDmjTm16nWESCh2aziNQJhtEoo9nriQQIIJlMZQzxY7liL789tyb/7V0BCOmlkxnrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhjMFcN0djh6fusx0QQbvQI/2fEcolu8bK8xlY93Pq7gcyIOyQ
	TNZvgNBEnBqXs89vomdAM90V0d2T8xP8vXNYjKmS/RtJxK3IVTV+9OQ/ModkUIV6rA==
X-Gm-Gg: ATEYQzwfc7Xym/al/B3Ebrxo4hcM6a4r3rfPEnh8ZX+6+9fTV37nuComaoBmtJfw8K6
	4JvKsufnyUOhAazsbPI6kqhAQYow2aclj2yLS2wJncjMwifKsrlopdseWMTSfoMAQRayjrFfZnD
	7YMs5NknyIoYZujYgIbjklUe94mS+JjShxedTMDZJHXisTRxgkIvqmui9+ZsEeNZZ0iK0yXWlYj
	TPojhrbypDMzKObOxbEh5s0pz+LUvEL72hCHSba0XVPtG/UWWw+g+p+ldLMoCEPMT7yRt37q2U0
	i5zS/idzzi6RPEfRiUn7yXKp4F2oAvDnSsF9Ehnypb0B5W2qinNyh3RBV1t1jsFq6lWNg0d8ZSs
	uCqPj5ym11QPEfHbe0g1NLp+rM6bTuZWqbnEQj935Vo5qd8xscPu+ciwaBzkYnqS866g/Ee1Ctd
	zFgBtrbvn3b1AWz9R7eLHIpMuhXqszgmTK83kUkGwFJlKtE7Tsp72PZHNwb3jbtyXgcRlqgSJn8
	gIrFHrZTVKNK6s=
X-Received: by 2002:a05:600c:8b02:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483a95a86eamr356549035e9.5.1772121555053;
        Thu, 26 Feb 2026 07:59:15 -0800 (PST)
Message-ID: <7e71e904-3a15-42d8-a1dc-4ad001683ec8@suse.com>
Date: Thu, 26 Feb 2026 16:59:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
From: Jan Beulich <jbeulich@suse.com>
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260223093831.475769-1-julian.vetter@vates.tech>
 <20260223093831.475769-2-julian.vetter@vates.tech>
 <c9126823-7c90-40bb-9fd1-c5649ffdb5cd@suse.com>
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
In-Reply-To: <c9126823-7c90-40bb-9fd1-c5649ffdb5cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B7EA41A9564
X-Rspamd-Action: no action

On 26.02.2026 16:53, Jan Beulich wrote:
> On 23.02.2026 10:38, Julian Vetter wrote:
>> @@ -89,6 +91,39 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
>>      return hvm_alloc_legacy_ioreq_gfn(s);
>>  }
>>  
>> +static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
>> +                                  unsigned int nr_pages)
>> +{
>> +    struct domain *d = s->target;
>> +    unsigned long mask;
>> +    unsigned int i, run;
>> +
>> +    if ( nr_pages == 1 )
>> +        return hvm_alloc_ioreq_gfn(s);
>> +
>> +    /* Find nr_pages consecutive set bits */
>> +    mask = d->arch.hvm.ioreq_gfn.mask;
>> +
>> +    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
>> +    {
>> +        if ( !test_bit(i, &mask) )
>> +            run = 0;
>> +        else if ( ++run == nr_pages )
>> +        {
>> +            /* Found a run - clear all bits and return base GFN */
>> +            unsigned int start = i - nr_pages + 1;
>> +            unsigned int j;
>> +
>> +            for ( j = start; j <= i; j++ )
>> +                clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);
> 
> You using clear_bit() here doesn't make the while operation atomic. There will
> need to be synchronization (also with hvm_alloc_ioreq_gfn()), and once that's
> there (or if things are suitably synchronized already) __clear_bit() ought to
> suffice here.
> 
>> +            return _gfn(d->arch.hvm.ioreq_gfn.base + start);
>> +        }
>> +    }
>> +
>> +    return INVALID_GFN;
>> +}
> 
> Did you consider whether fragmentation could get in the way here, as is usually
> the case when doing mixed-size allocations from a single pool? In how far is it
> necessary for the GFNs used to be consecutive?

Thinking about it - isn't this GFN based approach the legacy one? Can't we demand
use of the resource mapping approach to support bigger guests?

Jan

