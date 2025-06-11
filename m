Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C2AD4A7C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 07:39:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011310.1389684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPEB3-000597-7Z; Wed, 11 Jun 2025 05:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011310.1389684; Wed, 11 Jun 2025 05:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPEB3-00056R-4y; Wed, 11 Jun 2025 05:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1011310;
 Wed, 11 Jun 2025 05:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPEB1-00056L-AL
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 05:39:07 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 639e7a2d-4686-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 07:39:06 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so53290815e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 22:39:06 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b419:d0bf:1423:db44:9404?
 (p200300cab734b419d0bf1423db449404.dip0.t-ipconnect.de.
 [2003:ca:b734:b419:d0bf:1423:db44:9404])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531fe8526bsm22513885e9.0.2025.06.10.22.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 22:39:05 -0700 (PDT)
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
X-Inumbo-ID: 639e7a2d-4686-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749620345; x=1750225145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=D6QadpmVbw8/okvhf3T+sWyjH3XDcO5qMgmXqpsDaPc=;
        b=d5GpHuz21KcxUbOj13mPY7VVnKcaCcTVYO3eMheSu6nBlDtwUoXkOHT4pdUQeIe60x
         5ZyWMLOLHe4leUhXtfnZ6zXQ48xyckrE7oH/z1XPlsS6XP/OkZelLjvvsIKR6kbPlPiQ
         6FRAo1V4nDEWxG/cGvmN/YK8cd7w325AAfsFdvUGv0rriNob+Zpathb3ZMT4Vxgoy3ID
         92Jew5in+IjydCeODUmAAY7E+hic/dxcZVytElIUsbIcaf4mP7eiCckzwyx1zVRqUKrk
         5R8crhVuN/p4AeBn4Nib8X0S9nc1vs9r6GthEqXfQUXVutI+HGIT2nrct4Utiz0FJkYB
         AXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749620345; x=1750225145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6QadpmVbw8/okvhf3T+sWyjH3XDcO5qMgmXqpsDaPc=;
        b=FrBZWyVqmetL33e6Cm36hOTMCCA+ZiAmjmdAd0L+LbHeHtuHTpgmhr8fTjV2ydlOmG
         0TbbnJTgEhp4MvBwQe9iTUFexK6JzWgOG1hnmNEnBUtjC6hk1YuUBsOXmtCu339haoaI
         Qz55zznnyqgwUuK8vy1orn4LrGdz1ZyejPrqEuHoRnBLMKrHccar3bCl4XfNKF8FS/uL
         SVz8f2cbP9d7hgt2zt3o8lx4/4Cu1XrDBpoGu6vYdLdfQwNGUZbj2cV/6DiwY4MYX48B
         eaXnBVlD4gNH9r+g4Etd3UMbXdyhmXDOHSfV0HgQRJ00yV8gUXaHmbb4lHuno/AztdjG
         DqUg==
X-Forwarded-Encrypted: i=1; AJvYcCWWpMbcakVtXROf4YIjPDyfRNXHLRMFl3RDg8GsAHeVAIh1FPOb1XYWEK73ZKBNshEZOD43T2xs2cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOYtk4T8P+tdJM3D4fvQMoPhVGmwsIMrYpNvLKrh4QRkB1KVHE
	P8vPkf08tvpF6RAPgiopCfJWW5J7VlTu9wdoePaB/tkfmmgRpuEOXYrgUwOIrKDRNw==
X-Gm-Gg: ASbGncu9+NzgqUdLo9JLwvuPWqtx8i0TGZ1ObGoWXMpuWnDKauT4IoNmzdAnlKLxsak
	xNKhGqduBAnHzpi84kFRjoJ+NpD7ir5ojqWdNYZgB1sajXUEu3LGqEQu0NZS8zcZk1fpBmTcLHN
	rXYwqmNvkFna19/rR5WHPiNcMB+K8WkemSqhSchmZlg1oQa9qpsq8S2ME88ayPMxdyhOwnAkT1o
	Nzp9MJuEb9wnhJ5q06sURArlLnShK7akjxcBMs8PTG7ZGpIteYoT9JIJjrFIt5rJznABXzQ/XLg
	SnvP66yPUaquDyNyDZ3Z2vJHxyZ6CooGc4mHO03+uFujpFu7rVardxx9wIMOfmlagXMv4xswF4X
	BnB1BZemMTCruy5wcjKqdaCkilfn/yZa9uZaZZfby2VEwY4DHoQMTL37B7nzDjUj8INi+Ee/IuA
	EultjVsOKl0isXG1lx8nYU
X-Google-Smtp-Source: AGHT+IGz5XwF6KqRmna1XGpf8GEGFBU/QG8Ku7rAdIzhiXWW9sHTDltWgJ/tZnDLAZwWglK5Rj0sRQ==
X-Received: by 2002:a05:600c:a11:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-45324878fc2mr14065445e9.4.1749620345539;
        Tue, 10 Jun 2025 22:39:05 -0700 (PDT)
Message-ID: <b27f7652-424f-479c-a4bc-ed2ecd46ccc8@suse.com>
Date: Wed, 11 Jun 2025 07:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/console: unify printout behavior for UART
 emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250606201102.2414022-1-dmukhin@ford.com>
 <20250606201102.2414022-3-dmukhin@ford.com>
 <bcb3d553-b8aa-42ab-a9c8-7abf6f5d02c3@suse.com> <aEjInVF3zaa+VVd2@kraken>
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
In-Reply-To: <aEjInVF3zaa+VVd2@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.06.2025 02:07, dmkhn@proton.me wrote:
> On Tue, Jun 10, 2025 at 10:21:40AM +0200, Jan Beulich wrote:
>> On 06.06.2025 22:11, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> If virtual UART from domain X prints on the physical console, the behavior is
>>> updated to (see [1]):
>>> - console focus in domain X: do not prefix messages;
>>> - no console focus in domain X: prefix all messages with "(dX)".
>>
>> While, as indicated (much) earlier, I can see why omitting the prefix
>> may make sense for the domain having input focus, ...
>>
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -740,7 +740,17 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
>>>          if ( is_hardware_domain(cd) )
>>>          {
>>>              /* Use direct console output as it could be interactive */
>>> +            char prefix[16] = "";
>>> +            struct domain *consd;
>>> +
>>> +            consd = console_get_domain();
>>> +            if ( consd != cd )
>>> +                snprintf(prefix, sizeof(prefix), "(d%d) ", cd->domain_id);
>>> +            console_put_domain(consd);
>>> +
>>>              nrspin_lock_irq(&console_lock);
>>> +            if ( prefix[0] != '\0' )
>>> +                console_send(prefix, strlen(prefix), flags);
>>>              console_send(kbuf, kcount, flags);
>>>              nrspin_unlock_irq(&console_lock);
>>>          }
>>
>> ... this, aiui, is a behavioral change for the non-dom0less case, where
>> Dom0 output will suddenly also gain the prefix. Which I don't think is
>> wanted: Switching focus between Xen and Dom0 should remain unaffected
>> in this regard.
> 
> This change ensures that dom0 traces aren't mixed with domU traces when domU
> has input focus, or with Xen traces when the administrator is in the diagnostic
> console.

That's what the description also tries to describe, yet I still regard it as
a behavioral regression in (at least) the described scenario. The hardware
domain presently not having (d0) prefixed to its output is deliberate imo,
not accidental.

Jan

