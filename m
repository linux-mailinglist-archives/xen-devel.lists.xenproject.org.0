Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB685938F80
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 14:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761914.1171970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVscc-0001aJ-Uk; Mon, 22 Jul 2024 12:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761914.1171970; Mon, 22 Jul 2024 12:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVscc-0001Xz-Ro; Mon, 22 Jul 2024 12:58:34 +0000
Received: by outflank-mailman (input) for mailman id 761914;
 Mon, 22 Jul 2024 12:58:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVscb-0001Xt-1m
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 12:58:33 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18941497-482a-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 14:58:31 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc346ceso2942208a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 05:58:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785e12sm422108066b.25.2024.07.22.05.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 05:58:30 -0700 (PDT)
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
X-Inumbo-ID: 18941497-482a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721653110; x=1722257910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SfbkEoPW8DpchiHkPo6RKjHVE7QeBc5SXTNAX9kVoJk=;
        b=GMWURcWbu8+mGpSI9b3gCRSSO7kfujGNkzfA5YwJ5bNehTOMLXPcgHAbtk7iXRENik
         F6znB7I2Dv5JSCRTRA2VGvBkbXVwSAi15jSgVpLeKF+g7nhmobhucKVfXIeIw17b3pVj
         b2/czoa6Hv3gB/Es5+XT3vBNhmlrI0cKbSnTlh8ysXhWOBe4OzgRn76s4lyExP6L6NXq
         xM8nBrx8ImP9UimU5T39crFmPyG311FQSVx/ez8MpP1MAfQJeEKJKuQKII+S617QlqAe
         Fobrd5mRiMfxu2rN4CtT4nt7U5YXXhKwGi6qEgqlzJzfqDEWNrc6P5xo1yMb1LPG0TMH
         xnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721653110; x=1722257910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfbkEoPW8DpchiHkPo6RKjHVE7QeBc5SXTNAX9kVoJk=;
        b=IoxDcmrMCz2gKY6rG0KiXblcJUTAUHKe7YcOYSKk3eRt91k7WT+Nb+jhLUAtmVlGF1
         En8MtxGrkIuzLrXv0C0NJhxfTf66B9+kdCXnxfN7joJYA8t7i/lf41YkgNyebVCavZmr
         kKMWbAqeNW++4OWt5fcfn9QIpZnnwDY0GNvQ5O5gdP2yWlRl7qUxl8Rv9AGBwuhpWP0m
         hPaMX69ihm3DAlE3DV2KK1b33UK3RxT2/EU93I7YPK8oaeyfC+xVW0LSQuH9GGV5NFHM
         ydbfqOgPI3Y3ZgnZphfbXvJs/LSmPNPr5L52GP+J+favUJhprupan+BFNRFs8AHFuhfc
         y6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyuQSTC88xVNu9AW6glSa9xUMw2NjzGKVg+i6J72X/JCKzc4zs5obvXBASj92wmzw7MQvwv7n0hXmyIsnYXh/HLTPIQX9tibqy1S9RWpY=
X-Gm-Message-State: AOJu0YwGRmYP1y4geWHEQ2YcME4MVoTljV5EqPQJ85VjTs83P7Xfs+1N
	2D7Wxv25ljw+oQFAbZ2yzt7IOv3YnO/Jrb7ufyk8SgiFZevJ3ajDlo+1EwT9Jg==
X-Google-Smtp-Source: AGHT+IElNfCfp7zgtvKu1pfRm5KiP/OkhURSLwY7MtEa2WtCAcwG8H68c94mAnp47MAN55LsUnDPqQ==
X-Received: by 2002:a17:907:869f:b0:a6f:b11b:8ac5 with SMTP id a640c23a62f3a-a7a4c01c13cmr463689766b.30.1721653110555;
        Mon, 22 Jul 2024 05:58:30 -0700 (PDT)
Message-ID: <c6a06c8d-ed6c-42d2-9ba3-56c37e878d9c@suse.com>
Date: Mon, 22 Jul 2024 14:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
To: Julien Grall <julien@xen.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <15375179-1c94-43c3-a256-42a856905e21@xen.org>
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
In-Reply-To: <15375179-1c94-43c3-a256-42a856905e21@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.07.2024 10:51, Julien Grall wrote:
> On 12/07/2024 17:22, Oleksii Kurochko wrote:
>> +inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
>> +{
>> +    /* there is no attr field in RISC-V's pte */
>> +    (void) attr;
> 
> Surely you have a way to say indicate whether an entry is readable/writable?

I'm puzzled by this question. The sole outlier in Arm code is pmap.h, in
passing PAGE_HYPERVISOR_RW to this function when all others pass memory
types (MT_*). Afaics only the low three bits are then used in the
function, discarding access control bits altogether. R/W access appears
to be implied.

Jan

