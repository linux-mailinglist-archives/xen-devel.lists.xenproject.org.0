Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C40850FEB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 10:47:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679458.1056901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZStv-00050M-A7; Mon, 12 Feb 2024 09:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679458.1056901; Mon, 12 Feb 2024 09:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZStv-0004yI-7C; Mon, 12 Feb 2024 09:46:59 +0000
Received: by outflank-mailman (input) for mailman id 679458;
 Mon, 12 Feb 2024 09:46:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZStt-0004vd-2A
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 09:46:57 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a80160b3-c98b-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 10:46:55 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-410cd2c7f27so5544385e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 01:46:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020a7bce92000000b00410c04e5455sm3525390wmj.20.2024.02.12.01.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 01:46:54 -0800 (PST)
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
X-Inumbo-ID: a80160b3-c98b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707731214; x=1708336014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nlhs7BLlVe73pNQjDo+s/qQOaUld7mWaqTgNZBzwLcg=;
        b=OExSBxOcwYrYI04ZJyKvmTepKCSI2uSgjugnscNJ8hCumU/quA74CQkQmNVQfd4P27
         AKVdWF3BHNjjmSz3B87VldF7NyctvGOwCisIlT77ROaVOK6h7AyuLj0EtDy4ZZDQYBj8
         pKjt/0aI58r/IbuM1VXd4SyuiEFG2kWRjo/wdkrxVA4Sj68vZsQUqThnqdAb5ynPMJUh
         HxtodAjjvvw1k/4XvCzuufqrE9PgXYVUzkmEMZjOyUX5pE6ySUdNNxn3emyBpyEk6aaB
         caFZbAOLF+mgVYKboORiTREj130GQRJtBBJj+Lldu+O3Y2yibO5FKSnVsDUT/Bzy5Mcg
         Bbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731214; x=1708336014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlhs7BLlVe73pNQjDo+s/qQOaUld7mWaqTgNZBzwLcg=;
        b=IRlF0NdrfMYbZA9A1dfoG5t0wBf3nq0L6KXCMIMXfNlo/E2l1NQ2a4pqBgWOMDJRwf
         8v9JI2nq+JLGldcy71mHpmIja9MA0A5iC4Zjg3aemASHfV1ut8IYbqj/p7uz2ozR3/13
         d8s/NLc1o2EO2WAbjC2f9+74lxToi7cD7cGTT0rgmZH6hRSEpF7Gf/E8zz95UsEzwfA7
         2EauSzzPBrsRAung84SR8CLRF610Lq8cNxfZamv7gCtoje1QTws15xNh5HsYJ8kkJWnC
         CTD2XSorsSatQdi6tm0Zd/M2JQHCHft19VrJhlUIS19lNJhsFk3oN4FKUuySEK1lx+vD
         n9lw==
X-Gm-Message-State: AOJu0YwhP6mMEyVz74jM8y9Djjq1OVL4wUVOpW1L/Yw3M2UlLCANjKoY
	Z9JW52HQ5zzCMg8T0LUld8JZucCOdzlFiQQV8YX7FLwiHB//BvKBjfAAa1l1jg==
X-Google-Smtp-Source: AGHT+IG48c5IbieNOatakkD4O/WCk/J8CeowBdUAo2oqvZo352aCDln0/1C4u+/lmpnB6KGGiYRhqw==
X-Received: by 2002:a05:600c:3596:b0:410:e4fd:8259 with SMTP id p22-20020a05600c359600b00410e4fd8259mr929792wmq.0.1707731214656;
        Mon, 12 Feb 2024 01:46:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWPZYyCV+TN4o5xYRUk+Vekv7ZHGhdn2eL6/xjYpeCrx+mvZTTTn4O/UFe6IuTKmgE/9QKkaUuhFPnDPiHxLJLjn+9TyvA2xOytUYHLimY4K9nOw1/6NRqhsZC+W/91CVpIVdPW5CkkADkLOX1L64BL7yFrcuozqZwrvpemcEdskDOMBNf2KYFFtiIkp/gsQ++DhKuhtKppgLiXFLyFsb2SgNO3GCdMK5EfQ==
Message-ID: <561102e1-7f02-4928-86c1-9e058a405c4b@suse.com>
Date: Mon, 12 Feb 2024 10:46:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] VT-d: move {,un}map_vtd_domain_page()
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <25506838-b818-4686-8c16-3a198338af44@suse.com>
 <22e7036c-cf49-4160-bd26-fbba6b67ff5d@suse.com> <ZcXkpk8XxJmGO1EM@macbook>
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
In-Reply-To: <ZcXkpk8XxJmGO1EM@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.02.2024 09:39, Roger Pau Monné wrote:
> On Mon, Feb 05, 2024 at 02:57:30PM +0100, Jan Beulich wrote:
>> ..., thus allowing them to become static. There's nothing x86-specific
>> about these functions anyway.
>>
>> Since only the "iommu_inclusive_mapping" parameter declaration would be
>> left in the file, move that as well. There's nothing VT-d specific about
>> it (anymore?): "dom0-iommu=map-inclusive" is similarly generic, and
>> documentation also doesn't say anything.
> 
> Hm, I guess documentation should at least say that
> iommu_inclusive_mapping is x86 specific, because it's not parsed on
> Arm and hence might give the wrong impression that it's actually
> acknowledged there.

In v2 I'm adding "(x86)" there.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Albeit I think it would be better to put the parsing in generic
> iommu.c, so that the option gets parsed on Arm and
> arch_iommu_hwdom_init() can print a warning message about it not
> supported on Arm.

Hmm, I would have considered doing things the other way around - make
that part of parsing in parse_dom0_iommu_param() x86-only. I would
feel odd to introduce an option to Arm, just to be able to report
that it's unsupported. The more when generic option parsing code will
already log unrecognized options (sadly such log messages aren't seen
in the serial log, for being issued too early). But let's ask Arm
folks what they'd prefer, by adding all of them to To:.

Jan

