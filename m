Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FDB9380F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 00:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128087.1468566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0pGL-0002Rx-8m; Mon, 22 Sep 2025 22:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128087.1468566; Mon, 22 Sep 2025 22:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0pGL-0002Pi-5k; Mon, 22 Sep 2025 22:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1128087;
 Mon, 22 Sep 2025 22:43:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0pGJ-0002PP-QP
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 22:43:59 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a04d9818-9805-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 00:43:58 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so3466085f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 15:43:58 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018167asm142213415ad.57.2025.09.22.15.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 15:43:56 -0700 (PDT)
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
X-Inumbo-ID: a04d9818-9805-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758581037; x=1759185837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1reynL0NO/WMAk1bmvRUNgObJOg6+q45A/OSLy/lsJg=;
        b=fefJIJOxRtlY9KVgDVJcvJmGrtAwwaFpDV+DtZfQU7N7FLZBQP/RZCsJ62orymzkXx
         ZeGPpmj0th9rQaF4ZpERMnZ2xyB579vc2z+ysvTqmyp4doR3WQkD/m1u5qHwmiy/Agek
         YZTD5PnPVrsFJU+IRhTlhP2z9/WITM6AB8kr3bbFOj3cQneUTIteIbQncTv5KnJ6sW/2
         GwS3Mj6DU9/YimYL195FyFOmGqNdDDFhC7BZjvpM9+enUUMzB3rdWZY3ktxj3n8SyFEx
         gMeNw1f3a39UR7mGY8VTwyXDUBJzqpuKMRTgOUgmwizaScLstZZ7lIQYsTNzodMu3TkT
         M0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758581037; x=1759185837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1reynL0NO/WMAk1bmvRUNgObJOg6+q45A/OSLy/lsJg=;
        b=cLmY5wn1JQq/cYko5ug2gekIhMNCH9RqJKCh/F58V4PgDlGOiFJ9KHvpkwIrMzjrs2
         EPzUiT8n1w7B+2Q+UQaIjL3cBnx2etSOce+nHfBycKjJWpea0R3Plj9j+FhlQSJYOTZs
         y8R3ZRYSK2tX6Q+PF8tKbEgz9THQp06KMThu/wvUPDySfmDzubMt9yZeaqYiyyJK8QTo
         CCVh+eTKOkdOnnGzUDA+v6yJyHfjM5eGBDT3a6PKTWnS9YRNpBCVoLqFrnwWwAq3cW7J
         rOxt+qv68DY65CNCs2cj+BUj1KRvz0Brc4Xhg6/OIGQ3uzQ0p1nOXPSsv1Qq4/wTKYFP
         WyJA==
X-Forwarded-Encrypted: i=1; AJvYcCWoNLaoTiHGjXqbqQH6yaq0e/CikFC0M+USjr7tYEt8eKc+MmRdZx0OhK09wmTvoYgskWHUv/5T+5I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfIAnGHr2EE/uVI8fvgRF/+DKuEO+9zZ8KydX9uop/88GoFHZ+
	DoodQuLkII55NGpTQWNMtB8AKkNtzwu/UJic9SAZ//KFxPZMi19JCxxiEsRk83eLSg==
X-Gm-Gg: ASbGnctC5Bl2M+iA/Nt9ZJvuUjRm/9pKkQxCsNvdTYxso/SGcuo7r5pkWjPlb2y/XEg
	mCK4+z1NV8JkoeL6jXCzdQCIMpjp8xLFRFLy49qcaQVrAmk+l1wlrLMq5rZjz5aT3rjEIQkFFzb
	M6kLKVXJzuq3FwrtG4yBgSkRqdfpJuKy88pSY7uc3K7COazfeWz7dYXb7TW1M94LCfzzNqkIRST
	AeympCPCXuJBF1nfSS9MaZThnQ7gU+h3OLyfzA+wEacSNkAyou0kcUYG5B2jRE3K54KVHVXxcXg
	nF4/hzDJQI5MgrBbTv1TgVjppFkMiPvltqfP/B95cdsp2JtenvcJvIzWyAnRZk8JwFGR4G2V6Wo
	YR2AOSScGA/p+0UG1Valnd95VY6+O6Aus
X-Google-Smtp-Source: AGHT+IE9Ex6CZcskMDsvYNsODTnl7gCRLG0NzWVjWyJ1rDEI05ttOlNXgHfr3c5woqNah9qomcYSAw==
X-Received: by 2002:a05:6000:401f:b0:3ee:1296:d9e8 with SMTP id ffacd0b85a97d-405c4c80030mr212021f8f.17.1758581037571;
        Mon, 22 Sep 2025 15:43:57 -0700 (PDT)
Message-ID: <c3a3bb25-b37f-4ccc-b71b-3bd5f5b8a3ef@suse.com>
Date: Tue, 23 Sep 2025 00:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: introduce DOMID_ANY
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250920174732.1207847-2-dmukhin@ford.com>
 <c7e17ae4-0630-4061-b0e8-495cba02bc20@suse.com> <aNHGCmItdmjEAdZK@kraken>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aNHGCmItdmjEAdZK@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.09.2025 23:56, dmukhin@xen.org wrote:
> On Mon, Sep 22, 2025 at 05:23:37PM +0200, Jan Beulich wrote:
>> On 20.09.2025 19:47, dmukhin@xen.org wrote:
>>> From: Denis Mukhin <dmukhin@ford.com> 
>>>
>>> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
>>> of the code.
>>>
>>> Update all relevant domid_alloc() call sites.
>>>
>>> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> Changes since v1:
>>> - moved DOMID_ANY from the public header
>>
>> This addresses my comment, but not Andrew's subsequent response, specifically
>> aiming at ...
> 
> AFAIU, toolstack should start using DOMID_ANY instead of 0 in
> XEN_DOMCTL_createdomain.
> 
> I was planning to send a separate patch to address it if that's OK.
> 
>>
>>> --- a/tools/tests/domid/harness.h
>>> +++ b/tools/tests/domid/harness.h
>>> @@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
>>>  
>>>  #define DOMID_FIRST_RESERVED            (100)
>>>  #define DOMID_INVALID                   (101)
>>> +#define DOMID_ANY                       DOMID_INVALID
>>
>> ... avoiding the need for any such secondary definitions.
> 
> In the current design, unit test harness.h has to define DOMID_ANY.
> Enabling xen/domain.h to compile for unit test is a separate task, IMO.

That wasn't suggested as an option. The #define wants to move back to
the public header, but be properly guarded there. See the v1 replies
you got.

Jan

