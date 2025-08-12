Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3F1B21E05
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 08:13:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078261.1439249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uliFb-0005Ka-Il; Tue, 12 Aug 2025 06:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078261.1439249; Tue, 12 Aug 2025 06:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uliFb-0005J3-Ev; Tue, 12 Aug 2025 06:12:47 +0000
Received: by outflank-mailman (input) for mailman id 1078261;
 Tue, 12 Aug 2025 06:12:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uliFa-0005Ix-Cu
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 06:12:46 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a2e55b9-7743-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 08:12:40 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af95b919093so752826066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 23:12:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af986a477c4sm1300187966b.56.2025.08.11.23.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:12:39 -0700 (PDT)
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
X-Inumbo-ID: 5a2e55b9-7743-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754979160; x=1755583960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r3hxZMC5xIX5GH/cs4otg6DKuNq6g09SkQ5PaaSNAu4=;
        b=aKfib5TO0zzWXvHPiDSLLe+aximGWSsQVIPUHsbCZ0ku4rWUxLBr/jpgzPoV42dtlp
         Zqvm3iBhf4/oxFGc0BzHGTj+NULbaG96KX2RhPcZw6OrwLxrDZer5DD7q78a+RFWDtov
         mYCS0goN6W8tAaI7l3Vjd86f/UyXgnNZ2hWgZZASzxYT4a/F03KXflh/DisKCfH1SM6i
         nZ5LSPGii86InYHyGuRDTY4SoritHo7FK7dXHiPhMQWPsJgX1KDkDRt85sXo8NRFOOn2
         sBK0FGzrjnQn+hYv4GTM5Rz6If9ILKlQxOlFkN67NgPBoBFxaMejqaRKDsSpl3Tqw4wP
         M5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754979160; x=1755583960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3hxZMC5xIX5GH/cs4otg6DKuNq6g09SkQ5PaaSNAu4=;
        b=AntgdUtqfZlJLpH66IcvW1kNWY48j2mrpGq6390Be/UztTF4SVssz2kIbcPQ9oHQU9
         XsfaXcr1Zz/0Uo9ONUSLkvq8xGyr2zuxeEDBufHNSRHDYmpU+qDqDZlI8CRb1YQJ8UU2
         avBYTNEflpFaVXzQUUbWHlTbDV8dvDZUSMsqgj+QgAfaNYvjdow/ctf9c+JKia59LfMX
         z4t1cisfCiQJwUbrqTYEX7LmQ92J4jjFo/R/OubJ6JP+qBvhiTo4AnrZU3Tzw5ABaMla
         j2CgsVscvHOpg0JswanZUxrRiESFJlJfTihzDocqaBpT8U4qv4Ttjc0M9WKw6fb39Y4T
         t35w==
X-Forwarded-Encrypted: i=1; AJvYcCXkT5rCL16jwDTcjN5/4JwjqAEhzRHYx2NrNi6KfKLc7zSOLA7vMc+dUatcJUfu7R573M71yeDi+54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIRtvrY1gXvHCye7ntrN9OYzeDIF0kxC1A6Ur8mJV705j6SeJ1
	KrCBYf+JzHMEaxULSIGrj8jpOlolpfUwQ0rDgS/DW1HJ8WrbSqABwhztjXxCeHakX6p6VoG4xZR
	7Z7Y=
X-Gm-Gg: ASbGnctxLcfPGE7//KWRtEbRd14aoHpEfGecEzHvin3W8E5gJ+f8Y96MplTI2SywA1I
	Ux2YKv2WbnUj3ylhX63UwnJ5KCaaBcewGDPVkxVYJvaXDmwoC4o+2ITZkb+8ApySgZnZaXL4ZxP
	VxBwoCx2m/Ext9SfskbxSbnAePBDyizks7oYkgwPBiwWACKEORMWXTddro+bWd/Wq7s9ym3QcKr
	OlKKX4OGoLcF0sd8ldPFSYhSZgikjpcTaG2M+TIAi7Rrf9KFXqzCwfVHLcGtSBLsZXvDGF873nb
	LlMQaLfTNiTmloIGgk3EntApAlzSlkAs4yLmC+wqI4XrKqFSUyhXJcTiouTgnc1Iv5Bqe2v/mHF
	BeHlDl61ZePs3cSwX2wdQO/HlnlbsgMLwp/zBdvf1qS+8ELQ+xNQqqydvEDbyljSWlZxnqgANm/
	Sv8Fz492a2gsoowAoxPkJy9B2/U70H
X-Google-Smtp-Source: AGHT+IGCWjMuKsYZDrABMFt/iKsaW2tCX8B9dUF/t9aJ3vVjOrVNojZxb3GWQx92ohr0EUY9nqk0WQ==
X-Received: by 2002:a17:907:1b11:b0:ae3:74be:49ab with SMTP id a640c23a62f3a-afa1def71c6mr204012666b.10.1754979160269;
        Mon, 11 Aug 2025 23:12:40 -0700 (PDT)
Message-ID: <755dd957-514b-4316-82f5-3619c19cbb15@suse.com>
Date: Tue, 12 Aug 2025 08:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EFI/runtime: switch to xv[mz]alloc_array()
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <41b7e14c-59ef-40f5-8c43-69bdc5fb4531@suse.com>
 <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
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
In-Reply-To: <761b584a-51fb-403d-948e-3366501cea50@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 02:19, Daniel P. Smith wrote:
> On 7/23/25 09:39, Jan Beulich wrote:
>> Use the more "modern" form, thus doing away with effectively open-coding
>> xmalloc_array() at the same time. While there is a difference in
>> generated code, as xmalloc_bytes() forces SMP_CACHE_BYTES alignment, if
>> code really cared about such higher than default alignment, it should
>> request so explicitly.
> 
> While I don't object to the change itself, I think this description is a 
> bit over simplification of the change. If the allocation is under 
> PAGE_SIZE, then they are equivalent, but if it is over the page size 
> there are a few more differences than just cache alignment. It 
> completely changes the underlying allocator. I personally also find it a 
> bit of a stretch to call xmalloc_bytes(size) an open coded version of 
> xmalloc_array(char, size).

My take is that xmalloc_bytes() should never have existed. Hence why I
didn't add xzmalloc_bytes() when introducing that family of interfaces.

> With a stronger description of the change,

So what exactly do you mean by "stronger"? I can add that in the unlikely
event that one of the allocations is (near) PAGE_SIZE or larger, we now
wouldn't require contiguous memory anymore. Yet based on your comment at
the top I'm not quite sure if that's what you're after and/or enough to
satisfy your request.

> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks, but will need clarification first as per above.

Jan

