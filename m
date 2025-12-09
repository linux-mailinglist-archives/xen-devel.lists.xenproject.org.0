Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF7CAFD02
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 12:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181512.1504555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwBo-0007w0-Va; Tue, 09 Dec 2025 11:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181512.1504555; Tue, 09 Dec 2025 11:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwBo-0007uX-SV; Tue, 09 Dec 2025 11:47:32 +0000
Received: by outflank-mailman (input) for mailman id 1181512;
 Tue, 09 Dec 2025 11:47:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSwBn-0007u8-8t
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 11:47:31 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6710b27-d4f4-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 12:47:28 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-641977dc00fso6772231a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 03:47:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b4121eb6sm13824315a12.26.2025.12.09.03.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 03:47:27 -0800 (PST)
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
X-Inumbo-ID: d6710b27-d4f4-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765280848; x=1765885648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dbP/Ei4BMUdrCYo3EdbJe8BBHowxkgRf3kv2cnV+ww=;
        b=dT4/DYoaqVcGN5JMkBcrFIhgfpKmHOIvhXoc8GdjA7uDs7hlNlv5zTy6NXNqYCIPCg
         v6ayGYDfMTbraoqFOlr89gklX+qGtnJrQ8+sTJLRN5nSkjaeLCokgONYjTuPCisSmG7w
         DaJHy6vxlnprTf/SYHLnpgcBEud+dCpepsJZTOI3eo+d4PQ8emUwy4bD75QA0VKBp0wi
         X3J5mpxfHhygDjZm8wHcncCfoCD9MbRsnyy2yML0sf/b3FC/2zrCIKKCRNFZauVUYo6V
         xiEtF0V5koTPc1q9UXB0KenjfG0sReMX3nIqr5mJ5J42cvQnLSP6Osml+KfwDt5SOZdM
         2OFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765280848; x=1765885648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dbP/Ei4BMUdrCYo3EdbJe8BBHowxkgRf3kv2cnV+ww=;
        b=YUSyD5qd/EG3gdn94veUWRC5HmP6CPEWF3YDXwMm4LvitfkfwF1dq8RkI9aRmgrnSq
         UFCrXQKjUVKTqtcRvc5T+ZgsS9Bhrzg+pnsKPGp2VBeoc7YH+PeP8sQx/u+lBCSWXDVr
         9553QmOfKt8A003pLAX4mCKVRnbBn//75TkVJwpb2n9Zqn1/Z6K+p1lh5uKVpOSON0Sb
         2jB5CWzyKubVCuDTYrLIbNFw8EYu9zA07Aq1UOMBZbnqNP6paKSm448hBWDLrJIisN2Z
         QFpl0ZZjOuNORxlaBGqW5t5k08LPAr9rnCPVAof9W3HTCd7sM9fe78R1/Zhe6Br8Q68p
         ThjA==
X-Forwarded-Encrypted: i=1; AJvYcCVK4yh2xCSxtACmc38MJkAQjtUudVs2pqUUpGTPggSK6pVpNXBLIoiopeqimdNFsM/zq9rPFSHYja0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUB3w/FGKttxko4uPK9cOjA8T/KsbSgmOv6JUeM5DKJo3R+6Gw
	q/szMIEtXIP0pAx5oNpeo6LQk2GcEFNzzTEOHKv5DNViDwbD+zvjJWjT
X-Gm-Gg: ASbGncv/cPzstxMPDEosITVbQzQIexC9i5aTO6UAj6MWAA0oFETJlxcYj1Zc2VVq5ON
	liRbXPhdC/QDFrtL+OU5FRA5IDaed6StYiNYtHLE2nAaTInbbMLyb8YDzRHJqY8RjAx+VYUAo5n
	5MOYM5PPC8AEOnxTm98wI5S8Ih185TglXTfjx1cxF6WaL8UPErlXGt/9D4ha6oE1+/jqwXTmiMj
	5wWfsv+dcXEixhLA+tZjYr6+q6TVABzjPAjbi61KowIGMCC5O1BCU9mJBjzYsOAyYi8+b40ZIlt
	cX5d6JIhhXTBNTQ0itlLfFbBGAzS+4eOWD8h3OmMtoUw/YdGoZNAdTLfZAqLNwePiG1sZYdOaXJ
	FWybRoe8T9yBp1t11CLYDZMM5U3IiCmXItriHoE8reb4/U6gD0wx0Er8VY2NxbvefU4CZRQvaJJ
	zRaGOH0eiRbHhE7RrEvBHlJtz6Q9+aeeVv6zAMaoQt96TFOYptYSODSM3TwlkV
X-Google-Smtp-Source: AGHT+IGDKGdEbQWZigRB9FFx4zKR/juMxhVIrkP6DW3dPUelN9vKIgkHG7Lrj6bunXwjjetUQ+TY1A==
X-Received: by 2002:a05:6402:518c:b0:640:7529:b8c7 with SMTP id 4fb4d7f45d1cf-6491a2d0516mr8056264a12.1.1765280847752;
        Tue, 09 Dec 2025 03:47:27 -0800 (PST)
Message-ID: <021bdde7-ea62-447f-a788-dc31c6a930bd@gmail.com>
Date: Tue, 9 Dec 2025 12:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/19] xen/riscv: implement p2m_set_range()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <5f2812bb3b82ba1f9178eb00f68a85388f862f09.1763986955.git.oleksii.kurochko@gmail.com>
 <8b95ccca-7924-4cf8-818a-094782c6bbea@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b95ccca-7924-4cf8-818a-094782c6bbea@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/8/25 5:52 PM, Jan Beulich wrote:
> On 24.11.2025 13:33, Oleksii Kurochko wrote:
>> @@ -28,6 +36,77 @@ unsigned char get_max_supported_mode(void)
>>       return max_gstage_mode.mode;
>>   }
>>   
>> +static inline unsigned int calc_offset(const struct p2m_domain *p2m,
>> +                                       const unsigned int lvl,
>> +                                       const paddr_t gpa)
>> +{
>> +    unsigned int off = (gpa >> P2M_GFN_LEVEL_SHIFT(lvl)) &
>> +                       P2M_TABLE_OFFSET(p2m, lvl);
>> +
>> +    /*
>> +     * For P2M_ROOT_LEVEL, `offset` ranges from 0 to 2047, since the root
>> +     * page table spans 4 consecutive 4KB pages.
>> +     * We want to return an index within one of these 4 pages.
>> +     * The specific page to use is determined by `p2m_get_root_pointer()`.
>> +     *
>> +     * Example: if `offset == 512`:
>> +     *  - A single 4KB page holds 512 entries.
>> +     *  - Therefore, entry 512 corresponds to index 0 of the second page.
>> +     *
>> +     * At all other levels, only one page is allocated, and `offset` is
>> +     * always in the range 0 to 511, since the VPN is 9 bits long.
>> +     */
>> +    return off & (PAGETABLE_ENTRIES - 1);
>> +}
>> +
>> +#define P2M_MAX_ROOT_LEVEL 5
>> +
>> +#define P2M_BUILD_LEVEL_OFFSETS(p2m, var, addr) \
>> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1}; \
> What use is this initializer? Slot 0 ...

I wanted a way to detect if something mistakenly tries to access an uninitialized
array element, and using -1 would help distinguish whether an element was truly
uninitialized or if calc_offset() simply returned 0. However, you’re right, it
doesn’t work because only Slot 0 is initialized with -1. So...

>
>> +    BUG_ON(P2M_ROOT_LEVEL(p2m) >= P2M_MAX_ROOT_LEVEL); \
>> +    for ( unsigned int i = 0; i <= P2M_ROOT_LEVEL(p2m); i++ ) \
>> +        var[i] = calc_offset(p2m, i, addr);
> ... is guaranteed to be written to, afaics. With this simplified (or an
> explanation given for why it is needed)

... I will just drop an initializer and let var[] to be initialized with 0s.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii


