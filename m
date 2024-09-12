Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96C9768AC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797380.1207311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiai-0000iP-Qb; Thu, 12 Sep 2024 12:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797380.1207311; Thu, 12 Sep 2024 12:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiai-0000gS-Nl; Thu, 12 Sep 2024 12:06:28 +0000
Received: by outflank-mailman (input) for mailman id 797380;
 Thu, 12 Sep 2024 12:06:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soiah-0000La-0j
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:06:27 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6edd8068-70ff-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:06:25 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso106950066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:06:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c624d4sm729458566b.112.2024.09.12.05.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:06:24 -0700 (PDT)
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
X-Inumbo-ID: 6edd8068-70ff-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726142785; x=1726747585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DI+i4CjUBO+urp5r6jYuCW3x0FROw+1L90qO7v5Pc10=;
        b=YdYcFTNRNJu2Wm2Z6+PTn5YeYqCSIOxpwy2cO9jQDJpovjbzpAb+4LCuVX/mdz1HLx
         8tUj1leXhg8CNba+KVsOcWWMSc0V8J9O3DZh6PMbVkUoURFSHetaLYRcLguR0TgDvbaq
         hY8akGR8ZJYep+x+nWY84e2TldpPqwFywQcW4Wk/5rSUp4RsDSr9hpQqH6hOcyNkdxqh
         +5rH/XbyJS1nc856759HL0grK0q7UVaz/XoG2xpWgInpWLDvrX6ADymd/K7VCMRH3ugT
         eiamKxk0i09vNYC33fYwD9+EZBQxMhJ/N6tsUSgK4S3v9cLBT9N2OXFziRSegwtgRmr+
         A8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726142785; x=1726747585;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI+i4CjUBO+urp5r6jYuCW3x0FROw+1L90qO7v5Pc10=;
        b=wQXYQ6AG8/Q7VeXH3rleKW9FmXa2fUYgFC45WB6EAgoL2++XTPMfgfnZir1H5bQzzG
         flRggOgvPpwY0dDgda/oqTgtLkVJ0a+Hi51al1gjUWFals7YGNwNa8J4aKJ+miXM/R6p
         goxS6KIwHTrbZXL6f6s2cQC8J1i4xw1aB94p58bfOvInudzlRXgT/73VAYMBhaLmQ9V1
         byQEo1zZxRs7+Hzk/HOe1UQWUtgABBwuxWYIqEwsIVq8AsSXpS49XL90Bt2Tw4eQzmxQ
         rx9Ii2t8nX+96F9DcRCTCmiFyN0aFr9XFy3Je3FRERlI5O+/US+hQiyvbqaNjfmTfkbc
         VN0A==
X-Forwarded-Encrypted: i=1; AJvYcCWz0t4ERv3KCPLAZrom0S/yXleFoVYZD45PxCAyfw5OD8AiAW1DkY7ya2pDNViIsO/0lR3Y/TBYyPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd9WR7rwLYat2nvf1pqcMh8Hy84o7p53umZAYP9TXthqZN6E2L
	89EeZl+jHAASVUH+sKg7lTQyl2mgZ64G0cRyCJ4FgA6XQhWoY+7FvSlVTkwB5w==
X-Google-Smtp-Source: AGHT+IEkYVLpCSmFsZDakrBlSZN19Fv/365HYo/aFuzPZwATr11QZOPyGOZvnARaK7GKyvClIqmhkQ==
X-Received: by 2002:a17:907:944c:b0:a8d:68fd:cae6 with SMTP id a640c23a62f3a-a90296eab46mr247432366b.49.1726142784448;
        Thu, 12 Sep 2024 05:06:24 -0700 (PDT)
Message-ID: <a82d2493-c347-4519-a454-59349df1e62e@suse.com>
Date: Thu, 12 Sep 2024 14:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] blkif: reconcile protocol specification with in-use
 implementations
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240912095729.25927-1-roger.pau@citrix.com>
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
In-Reply-To: <20240912095729.25927-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 11:57, Roger Pau Monne wrote:
> Current blkif implementations (both backends and frontends) have all slight
> differences about how they handle the 'sector-size' xenstore node, and how
> other fields are derived from this value or hardcoded to be expressed in units
> of 512 bytes.
> 
> To give some context, this is an excerpt of how different implementations use
> the value in 'sector-size' as the base unit for to other fields rather than
> just to set the logical sector size of the block device:
> 
>                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> Linux blk{front,back}   │         512         │          512           │           512
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> QEMU blkback            │     sector-size     │      sector-size       │       sector-size
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> Windows blkfront        │     sector-size     │      sector-size       │       sector-size
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> MiniOS                  │     sector-size     │          512           │           512
> 
> An attempt was made by 67e1c050e36b in order to change the base units of the
> request fields and the xenstore 'sectors' node.  That however only lead to more
> confusion, as the specification now clearly diverged from the reference
> implementation in Linux.  Such change was only implemented for QEMU Qdisk
> and Windows PV blkfront.
> 
> Partially revert to the state before 67e1c050e36b while adjusting the
> documentation for 'sectors' to match what it used to be previous to
> 2fa701e5346d:
> 
>  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
>    the node, backends should not make decisions based on its presence.
> 
>  * Clarify that 'sectors' xenstore node and the requests fields are always in
>    512-byte units, like it was previous to 2fa701e5346d and 67e1c050e36b.
> 
> All base units for the fields used in the protocol are 512-byte based, the
> xenbus 'sector-size' field is only used to signal the logic block size.  When
> 'sector-size' is greater than 512, blkfront implementations must make sure that
> the offsets and sizes (despite being expressed in 512-byte units) are aligned
> to the logical block size specified in 'sector-size', otherwise the backend
> will fail to process the requests.
> 
> This will require changes to some of the frontends and backends in order to
> properly support 'sector-size' nodes greater than 512.
> 
> Fixes: 2fa701e5346d ('blkif.h: Provide more complete documentation of the blkif interface')
> Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

The Fixes: tags generally suggest this wants backporting. I'm a little uncertain
here though, as it won't really affect anything that is built. Opinions?

Jan

