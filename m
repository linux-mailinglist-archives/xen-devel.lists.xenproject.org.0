Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C0E386F8E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 03:45:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128570.241359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liom6-0002iB-Rg; Tue, 18 May 2021 01:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128570.241359; Tue, 18 May 2021 01:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liom6-0002gN-Jd; Tue, 18 May 2021 01:43:58 +0000
Received: by outflank-mailman (input) for mailman id 128570;
 Tue, 18 May 2021 01:43:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpwN=KN=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1liom5-0002gH-Rn
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 01:43:57 +0000
Received: from mail-pl1-x630.google.com (unknown [2607:f8b0:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 198b57ce-c00f-4e78-9262-3de83e0e873d;
 Tue, 18 May 2021 01:43:56 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id t21so4197824plo.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 18:43:56 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::1? ([2601:1c2:4f80:d230::1])
 by smtp.gmail.com with ESMTPSA id s3sm12297222pgs.62.2021.05.17.18.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 18:43:55 -0700 (PDT)
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
X-Inumbo-ID: 198b57ce-c00f-4e78-9262-3de83e0e873d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KoUioznIzJM7AjTLN+DNXOBvSstctxmIoCBWsVfkzhE=;
        b=Fiw9xJCv3W9YngUlDtQpnpx48h47JG8Uhw23whajawJ1Nio9xseZghoMNc0n3ZXHiE
         bTfSWaTR4bPW3RyLtn9+BV5n26dLAIIfXoluot0RsOYx991hBezY6Xly+eMCJo9n2o4w
         wHldKOH0rhNq2AI2QmXLdU6wi0AXJxFmLbjth55x1nyRrGbuKYL+c+b3Kunz41bqmjF+
         nj7K2aOuo/HCC5rHyeM8IookIceD1lIWMRsJQkiwWpYSlfEywerJAnFHVFWYDYZ1xXFK
         MOI0v2JC6aqvPw3h5ecqMUtH/JP/H8swv0xtG2vXP+St6otPr7FJufSr85hoIdyOT37r
         5img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KoUioznIzJM7AjTLN+DNXOBvSstctxmIoCBWsVfkzhE=;
        b=cFkiQKbkhaCmvOKx4g68zsVVamq77NeVmBkbFqpJ007pC8q9qvOxDMRT3doFFOEpZE
         hub1oY7fgTeUN6nQYx+j7zU05qBj55oL+w/EYqwEwVV2/TKLiIeReeU+LN+WD23/cINL
         u4vzFNyvuZnvzh1Ft4jZeeQ1qWmo+h9LRL7McPp9ddWNNo1Q9Kh9694p4W5tIjMVuziF
         6mDqmz7Mfcf1+WR5XKN2wDLV6KmnDe3v58Ob1hwmJqYEnN5amJGow4VzfNIcbz9FTB3m
         oMjaIvCxC9a9ipcIwFIUEffGvWLa7coUoBZRduVRKn/lgl+K1BfcgyRL3HkustpY5Y97
         AYLw==
X-Gm-Message-State: AOAM531wJORdOImMtHs+dwhjLiVLld9gG+R7HJRGMLhnyfmFk3hLP3wv
	awRrlvyivzxZ73A88fQcnyk=
X-Google-Smtp-Source: ABdhPJy7aMZWkLq9+eZqwm+r2bt9FSjZ9qeJ/RttoyarJp28gJ2EFqTWvTn7nihKnzBC/o7ZDNFySw==
X-Received: by 2002:a17:902:d4c6:b029:ef:80f3:c543 with SMTP id o6-20020a170902d4c6b02900ef80f3c543mr1674170plg.85.1621302235890;
        Mon, 17 May 2021 18:43:55 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1621017334.git.connojdavis@gmail.com>
 <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
 <97815ecd-7335-9c85-5df8-802ed119d518@gmail.com>
 <fcc06468-3249-6e6a-dfbd-fc9f69a3de2b@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <bbfaf1d6-5d2c-1a79-6237-c42083635d77@gmail.com>
Date: Mon, 17 May 2021 18:43:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <fcc06468-3249-6e6a-dfbd-fc9f69a3de2b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/14/21 4:47 PM, Connor Davis wrote:
> 
> On 5/14/21 3:53 PM, Bob Eshleman wrote:
>> On 5/14/21 11:53 AM, Connor Davis wrote:
>>
>>> +
>>> +#ifdef CONFIG_RISCV_64
>>> +
>>> +/*
>>> + * RISC-V Layout:
>>> + *   0x0000000000000000 - 0x0000003fffffffff (256GB, L2 slots [0-255])
>>> + *     Unmapped
>>> + *   0x0000004000000000 - 0xffffffbfffffffff
>>> + *     Inaccessible: sv39 only supports 39-bit sign-extended VAs.
>>> + *   0xffffffc000000000 - 0xffffffc0001fffff (2MB, L2 slot [256])
>>> + *     Unmapped
>>> + *   0xffffffc000200000 - 0xffffffc0003fffff (2MB, L2 slot [256])
>>> + *     Xen text, data, bss
>>> + *   0xffffffc000400000 - 0xffffffc0005fffff (2MB, L2 slot [256])
>>> + *     Fixmap: special-purpose 4K mapping slots
>>> + *   0xffffffc000600000 - 0xffffffc0009fffff (4MB, L2 slot [256])
>>> + *     Early boot mapping of FDT
>>> + *   0xffffffc000a00000 - 0xffffffc000bfffff (2MB, L2 slot [256])
>>> + *     Early relocation address, used when relocating Xen and later
>>> + *     for livepatch vmap (if compiled in)
>>> + *   0xffffffc040000000 - 0xffffffc07fffffff (1GB, L2 slot [257])
>>> + *     VMAP: ioremap and early_ioremap
>>> + *   0xffffffc080000000 - 0xffffffc13fffffff (3GB, L2 slots [258..260])
>>> + *     Unmapped
>>> + *   0xffffffc140000000 - 0xffffffc1bfffffff (2GB, L2 slots [261..262])
>>> + *     Frametable: 48 bytes per page for 133GB of RAM
>>> + *   0xffffffc1c0000000 - 0xffffffe1bfffffff (128GB, L2 slots [263..390])
>>> + *     1:1 direct mapping of RAM
>>> + *   0xffffffe1c0000000 - 0xffffffffffffffff (121GB, L2 slots [391..511])
>>> + *     Unmapped
>>> + */
>>> +
>> What is the benefit of moving the layout up to 0xffffffc000000000?
> 
> I thought it made the most sense to use the upper half since Xen is privileged
> 
> and privileged code is typically mapped in the upper half, at least on x86. I'm happy to
> 
> move it down if that would be preferred.
> 
> 

I do like the idea of following norms, but I think I prefer following the ARM norm
over the x86 norm unless there is a technical reason not to. Just due to
ARM and RISC-V having much more overlap than x86 and RISC-V.  In this case,
all things being equal, I'd prefer following the ARM model and use the lower half.
I definitely like adding the note on the inaccessible region.

Thanks,

-- 
Bobby Eshleman
SE at Vates SAS

