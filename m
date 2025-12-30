Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA9CEA0F2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 16:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194315.1512726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabbK-0005zE-HC; Tue, 30 Dec 2025 15:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194315.1512726; Tue, 30 Dec 2025 15:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabbK-0005wu-E9; Tue, 30 Dec 2025 15:25:34 +0000
Received: by outflank-mailman (input) for mailman id 1194315;
 Tue, 30 Dec 2025 15:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKsM=7E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vabbI-0005wo-Tn
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 15:25:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3f4c49e-e593-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 16:25:26 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b79e7112398so1769199466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 07:25:26 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ae2de9sm3757396866b.26.2025.12.30.07.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 07:25:24 -0800 (PST)
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
X-Inumbo-ID: c3f4c49e-e593-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767108325; x=1767713125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDug6IYjgs8gWf1ugYxdNlEv+J+emsZfHsQ3Vl4WJCE=;
        b=M+rBoFWYssB/58Ce5Bala6a08OojPhqJ8C44yL2NILUMH0szWa11+rfxIIo61SoFOc
         Sc9iClyqhmNn8mavbomdWY29UZdOKe9ySwmFeaZH0ZkD/bz306q/RZ5pmHF4nZ9PHtDi
         TLgCQaBQJHE8yLizwZ41Rq+x5fI5INluuoInsouwxYWRcWFqM4PnEutGTJN2HheR6j5p
         ThY7zuPuVMcH0IBLzqcpNBcyKVJjcP3G5n0rgrxX45N29H8jhT2ahDzQOdjeTI/cYEHz
         nS3/e+ynkEK0tUJKfGEZJDpDco9z/aq4JEZK0N8kSRbqmjaEVa8pugxld4el0h5mfiuz
         g5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108325; x=1767713125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDug6IYjgs8gWf1ugYxdNlEv+J+emsZfHsQ3Vl4WJCE=;
        b=AcILRr8DP7WvYvTEpXFtj6FV0kV7CwrCwqw6nyw7NBvaflmKehaDisKCka66mfQmt/
         HuV3fGRU9l9IGThFLN08Y1CxSLWx3q8zC+YPrE0QPev/qsCUsGTm8oY46SuE/YLITeWF
         V9sp6DGwjyg36eL2FZEWh/zgf3XVHocEqWEIpd6cruk/n9WDblN/AiHOM7D66bFDAA1G
         2RfSs0pSkC4WAJXMxHTaAAybd3AntjbsPFX8Ad5zpQR/3YcWg8tWIFh+oKVTBKQ71wXB
         tDhouTa3EIHjxc2Pm0rkIS6pHqkUeBuyO6GPsg5fEsm5rht2xShFoRVnTaePzAaeC299
         i4pA==
X-Forwarded-Encrypted: i=1; AJvYcCWbsssArftmd6QXyJfnh/tQ9CJRhRMYoP6VdUu9giqTPhMTLfSm7MUyB5t+Wgz+/pZTpKM7+eSH9/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOnIo/nsRnedfnnJ35Ih7CNTIp72jM8qFImycd/zQUaTTUj3xO
	7gb8n2aUc/my1Cdigz9wNZkeLxssP5FsrCJMa0KuDFPbS0UBVcVq6hlt
X-Gm-Gg: AY/fxX618q1A80WYiN+aUdKTBWnkHjLFtdLP5xcOdn8Wqtvee4vHn77fyFrxr+z6pMu
	xj4qvZpMD6loCyA1O2Z31vx70a/zs6KPEtHeq4EAAeg5r0fTwInmmuV8lzMQiKlYf6J/Ep/5JOq
	QkaPOVtWEhWYt1w7ZJS+XEC9+6hD7SMrA3qi2Z8aoyrbEr1xGaOX02KdLavuRxzRtyCEVJjA9ry
	2KxfdFJuJixZYuUeNSw52D2/4NIIVORzfGGMPWgwlcrysB47uNNhsS3RZb0wvVS2Y8HNzwUBF9E
	+qcwkcrf5z4gxQAqkzoYVELQV8LXWaXb9a4w3u1QYkskFiudu/dqsqwqmFj5wlJca5BobbfTf+p
	88QUrh5bPihsCn1x77APW8Rm/5zLSF7W9kO0kuZcHuZlEOSPaF//yvkWdwDUw3/awlHebPhYH4q
	zGjKexrJ5A7WaNA5cSdvNuBAtgvRH4psbh3rFKhIGa9IIxPP5eN1bEMYHuGuNt4/c=
X-Google-Smtp-Source: AGHT+IHgwVYFdxfX9iU+0zZq4PPD81b7G9BYoqFAhof4Z5+V6D7k3GNP6+9hBNQnvQYmFzRPgOtNhg==
X-Received: by 2002:a17:907:90d5:b0:b80:3fff:336a with SMTP id a640c23a62f3a-b803fff343cmr2383344066b.21.1767108325180;
        Tue, 30 Dec 2025 07:25:25 -0800 (PST)
Message-ID: <360d4fb9-52b9-400d-93a7-baa4b98e708a@gmail.com>
Date: Tue, 30 Dec 2025 16:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] xen/riscv: add support of page lookup by GFN
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766406895.git.oleksii.kurochko@gmail.com>
 <5d10efb00eebb35861135280dfee391d0c55cf0d.1766406895.git.oleksii.kurochko@gmail.com>
 <e77ddd04-3dfa-464c-9655-3cc853e1759e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e77ddd04-3dfa-464c-9655-3cc853e1759e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/29/25 4:06 PM, Jan Beulich wrote:
> On 22.12.2025 17:37, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/p2m.c
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -1057,3 +1057,188 @@ int map_regions_p2mt(struct domain *d,
>>   
>>       return rc;
>>   }
>> +
>> +/*
>> + * p2m_get_entry() should always return the correct order value, even if an
>> + * entry is not present (i.e. the GFN is outside the range):
>> + *   [p2m->lowest_mapped_gfn, p2m->max_mapped_gfn]    (1)
>> + *
>> + * This ensures that callers of p2m_get_entry() can determine what range of
>> + * address space would be altered by a corresponding p2m_set_entry().
>> + * Also, it would help to avoid costly page walks for GFNs outside range (1).
>> + *
>> + * Therefore, this function returns true for GFNs outside range (1), and in
>> + * that case the corresponding level is returned via the level_out argument.
>> + * Otherwise, it returns false and p2m_get_entry() performs a page walk to
>> + * find the proper entry.
>> + */
>> +static bool check_outside_boundary(const struct p2m_domain *p2m, gfn_t gfn,
>> +                                   gfn_t boundary, bool is_lower,
>> +                                   unsigned int *level_out)
>> +{
>> +    unsigned int level = P2M_ROOT_LEVEL(p2m);
>> +    bool ret = false;
>> +
>> +    ASSERT(p2m);
>> +
>> +    if ( is_lower ? gfn_x(gfn) < gfn_x(boundary)
>> +                  : gfn_x(gfn) > gfn_x(boundary) )
>> +    {
>> +        for ( ; level; level-- )
>> +        {
>> +            unsigned long mask = BIT(P2M_GFN_LEVEL_SHIFT(level), UL) - 1;
>> +
>> +            if ( is_lower ? (gfn_x(gfn) | mask) < gfn_x(boundary)
>> +                          : (gfn_x(gfn) & ~mask) > gfn_x(boundary) )
>> +                break;
>> +        }
>> +
>> +        ret = true;
> For this case ...
>
>> +    }
>> +
>> +    if ( level_out )
>> +        *level_out = level;
> ... this is correct, but of "ret" is still false it very likely isn't, and
> arranging things this way may end up being confusing. Perhaps "level" should
> be constrained to the if()'s scope? The caller cares about the value only
> when the return value is true, after all.

We could simply move the "|if ( level_out )"| check inside the|if| block, but
is this really a significant issue? We still need to check the return value,
and if it is false,|level_out| should just be ignored and there is not big
difference then if level_out will contain what it contained before the call
of check_outside_boundary() or it will be set to P2M_ROOT_LEVEL(p2m).

Alternatively, could we initialize|level| to a non-existent value in the
"ret=false" case, for example|P2M_MAX_ROOT_LEVEL| + 1, and return that value
via|level_out|?

~ Oleksii


