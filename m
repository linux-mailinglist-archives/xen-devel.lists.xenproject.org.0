Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF6903A06
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 13:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738298.1145014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzdx-0000ZI-W7; Tue, 11 Jun 2024 11:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738298.1145014; Tue, 11 Jun 2024 11:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGzdx-0000Wh-TL; Tue, 11 Jun 2024 11:26:25 +0000
Received: by outflank-mailman (input) for mailman id 738298;
 Tue, 11 Jun 2024 11:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGzdw-0000Wb-DU
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 11:26:24 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb6af78-27e5-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 13:26:23 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6ef46d25efso435319366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 04:26:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1226c190sm362513566b.93.2024.06.11.04.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 04:26:22 -0700 (PDT)
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
X-Inumbo-ID: 6eb6af78-27e5-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718105182; x=1718709982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PLBOlfmpvygct6ZbMMhgVvalzCMpGnzPOX1hgd8wYU4=;
        b=J3th1U/CBLCHf6hlBLPKKUPs3B4Qy7hYKsaMNdSMgmK+8RkjwWqogm86fE5REzrXg6
         BKPKfJy5xGcHv50EkgADnLtqQPa0bdSrEPsexyCIK+QcFmro1dGZbumqW9xPgSwFuvRJ
         CQhRFuMEUHQ7FpWo3GoPhBedyd5sfajonxiF8wa2z6WNJqoVymTdHdeY8FrWrmO7wdTP
         IWj8QAkKy46KmeRKfCP7vue5cI8CI2rMu/jBHtsMvmm42LJPHS8JzgU65eRxIasIwZk0
         xCFsooP4VxsGPS0Hr5q4iSryE/hK7TM3xxe5nxaVPbEhOGK8EIwbiejUdsB39ISE/z2X
         LhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718105182; x=1718709982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLBOlfmpvygct6ZbMMhgVvalzCMpGnzPOX1hgd8wYU4=;
        b=JAPzOLePrb26JVDiYuVVCAsGCLWKL7vcjABbj0LhZgSo8IM6IMwsCIVTaztaqrB2MC
         LBEIDq6Wj1dh3xeKR5e0ZLzX2Fs8dHexktVYYifuXz/JNcWSOZZO3KKgoZPVkxUchDPi
         LJzR9Qo2oA/eOJvTLSTZs7xSbEyJG8bvLzRUieVD4kXiXIlyzVYLRq2z/W3pp9Hc5gTC
         qG16DMYQVtefLkRKmoNX+UQrURlV8A0yRfH6SdD0x7l20pSSA8P7x8tZuAMk3ulIATrg
         MVWpiP5UruA0dQt1DvPFV8awgrD3tKb/QLAryyfytbiVJsZY8k6KWb1OLZOoKN0sYchR
         vm7A==
X-Gm-Message-State: AOJu0Yy65UdPkb+c/mpZNCMuoh/2AmNknFICcCuc10e8UgXNBhamVve5
	09PReXXBJjfpf8GZkuRF7TYx3ExLIJ+ca4J25W+jmSyP5dbXazGD7VciYaxdX5mpJ1Mc3z6BI+M
	=
X-Google-Smtp-Source: AGHT+IHKne9GF30+gAF2mcTow4+gjbglsJsEu8b2Nr4/uxawWMpTDrwzZxIMr46w/XdUIYRMt9QmGQ==
X-Received: by 2002:a17:906:b190:b0:a6e:f6b0:66cc with SMTP id a640c23a62f3a-a6ef6b06d15mr614292866b.18.1718105182577;
        Tue, 11 Jun 2024 04:26:22 -0700 (PDT)
Message-ID: <a1281966-3f3b-4dbc-aa98-0cabbfc4e16a@suse.com>
Date: Tue, 11 Jun 2024 13:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
 <ZmgpsZJ4afLd1Fc3@macbook>
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
In-Reply-To: <ZmgpsZJ4afLd1Fc3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 12:40, Roger Pau Monné wrote:
> On Wed, May 22, 2024 at 05:39:03PM +0200, Marek Marczykowski-Górecki wrote:
>> +int __init subpage_mmio_ro_add(
>> +    paddr_t start,
>> +    size_t size)
>> +{
>> +    mfn_t mfn_start = maddr_to_mfn(start);
>> +    paddr_t end = start + size - 1;
>> +    mfn_t mfn_end = maddr_to_mfn(end);
>> +    unsigned int offset_end = 0;
>> +    int rc;
>> +    bool subpage_start, subpage_end;
>> +
>> +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
>> +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
>> +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
>> +        size = ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);
>> +
>> +    if ( !size )
>> +        return 0;
>> +
>> +    if ( mfn_eq(mfn_start, mfn_end) )
>> +    {
>> +        /* Both starting and ending parts handled at once */
>> +        subpage_start = PAGE_OFFSET(start) || PAGE_OFFSET(end) != PAGE_SIZE - 1;
>> +        subpage_end = false;
> 
> Given the intended usage of this, don't we want to limit to only a
> single page?  So that PFN_DOWN(start + size) == PFN_DOWN/(start), as
> that would simplify the logic here?
> 
> Mostly asking because I think for the usage of XHCI the registers that
> need to be marked RO are all inside the same page, and hence would
> like to avoid introducing logic to handle multipage ranges if that's
> not tested at all.
> 
>> +    }
>> +    else
>> +    {
>> +        subpage_start = PAGE_OFFSET(start);
>> +        subpage_end = PAGE_OFFSET(end) != PAGE_SIZE - 1;
>> +    }
>> +
>> +    spin_lock(&subpage_ro_lock);
> 
> Do you really need the lock if modifications can only happen during
> init?  Xen initialization is single threaded, so you can likely avoid
> the lock during boot.

I was wondering the same, but then concluded the locking here is for
the sake of completenese, not because it's strictly needed.

Jan

