Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B6CC738EF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 11:51:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166814.1493248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2GH-0006pn-TR; Thu, 20 Nov 2025 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166814.1493248; Thu, 20 Nov 2025 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2GH-0006mv-PE; Thu, 20 Nov 2025 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 1166814;
 Thu, 20 Nov 2025 10:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qEvF=54=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vM2GF-0006lL-UU
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 10:51:36 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df421b0d-c5fe-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 11:51:30 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-429c8632fcbso405416f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 02:51:30 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm4912620f8f.33.2025.11.20.02.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 02:51:29 -0800 (PST)
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
X-Inumbo-ID: df421b0d-c5fe-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763635890; x=1764240690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1M/18t6moVlkRgWVwoPcK84uBvdA6yoMjg+D+edbTko=;
        b=PnGVpq8upac2/1Mz5PZZNQ99N/qHaWpgl6bHwyCY3kfHOXxlXuTuaAyzTSJUhua2tb
         OyPsfGSmC/4Hy93F8RD5LdJdoY9yZpRBlf2BB3JsWRHa17DvzObHE+EAmfh8JGAcWTKC
         bnHU/gqXDDFY9IFf9PB9opohyQxfSG4FV+QJ9lqsseYV3frBQ56FKMMrz7HLHMlTKSkG
         eDS7tBwKZA72Ym/yJdHQrBM42vZOYBjK6qDs656tkvdoIw7tgaLjoojdHsF8AsC1v+wc
         ikBPjbNY4CMBCpDypTbIeBQyiUF2FHhWO5eMczT+Vk++e+Q+oNyB8nPmWz9lFfVorrOb
         dbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763635890; x=1764240690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M/18t6moVlkRgWVwoPcK84uBvdA6yoMjg+D+edbTko=;
        b=jVe3SOJ/hz2hWRzLkJA7wBHUYuc43hU+UwsdFvOSoq6A/i2mjFPOdtfUIgEfh1FYgY
         G0MBPK+T/XBOEnKnZYHJFiXk00+VOz1FOgMC8ecPOWQLopGIuWkEJr5gNPf997NNvnnw
         KbvkCbjTwcpsMWB7hnlOVBXoj7IHKHp2R4F+Qumm6hl/XBCgVZEUfBmXUTS4OtEQYfQX
         2OpbndaxtuxIXXB4GkptWg8k9Nx8sTR5GoVFNBt6uN9Losv+XtHu+yrRi/iF9hWZuzzU
         zzF0aOXTtyr8FDmAbmaKasJ0niekZZ/5irQ3nlXkIHiHrO6yo/ckPtqjCLgT2xI12hR3
         p79A==
X-Forwarded-Encrypted: i=1; AJvYcCUan9XnsoDhVbXpyzUIRZFxmQVCHwbJWX38hlXnVASUcIKnoe3EOZi57NjE6dGWsAGqmYDyDL8gRIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJejomzVy1WypbCPlzwCoQALYjVCzzEYGM4TzWfJA9oUM4iz+V
	hvfwIhxfh/462seSAZ0XKt6OouBCHLgFqISSUdUCQ+RpOy3XP409qIoLi0jTR7n0+tM=
X-Gm-Gg: ASbGncv7HMZW/U5xXeXOCDcpS1ExKKNepHPAxlqWSbnFpRnACTzta+ujYxp6CJUTkbJ
	KK2bSWGfcl+ZJw+QGGDJUYkSEfgTu5KsRuqa31an3eOQ0m/m39LEJlxW72fk9VkNNB1MitXTg6c
	+6AOJ+B/Z2SjyFAA5kw1b+g4L3VVTA+ftbDl5ZfxpDUW0E+pO6dDnoB8RJeqCDPyO8s9zdmxxfl
	yDLdE5V0pbZf/+gSZjuX86h+nFEA634Y3bBwC9zGXw0K0FJ4h2lBWxri92hiYkSNqqCMwHcL6uK
	JYB4dzJhpO5GzOxp1m0eOPPnQ3N2HzkW0vv2F3DT/aEBdOoLZLmk2WwjzFF/qEXOfbPodXuZhC2
	nIkYYCRU/kRO3B63JH7689qg7amEIPeIK04wrRkqo6TNCkBX+HCXwgo0YNUSbd1bz6Rpgv0YEf3
	fneE6ngjJL2B3KqVl0bdZSiszkcQGhQD0UPuf1RszbnzV6oTJGkrudHA==
X-Google-Smtp-Source: AGHT+IF1uX4P9Ldl1MKPWCI4CVFASAXHm93mBmH2oSNKZDSuBThVvq6LdHNkjvPuApS7MKVFsJt3HQ==
X-Received: by 2002:a05:6000:228a:b0:42b:3131:5433 with SMTP id ffacd0b85a97d-42cb9a2decbmr2359371f8f.26.1763635890108;
        Thu, 20 Nov 2025 02:51:30 -0800 (PST)
Message-ID: <ab69153d-b162-47f2-90c9-22cd248c94a5@linaro.org>
Date: Thu, 20 Nov 2025 11:51:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hw/core/loader: Make load_elf_hdr() return bool,
 simplify caller
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org, alistair@alistair23.me,
 edgar.iglesias@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 palmer@dabbelt.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, sstabellini@kernel.org,
 anthony@xenproject.org, paul@xen.org, berrange@redhat.com,
 peterx@redhat.com, farosas@suse.de, eblake@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, zhao1.liu@intel.com,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-2-armbru@redhat.com>
 <bf44d9cd-806a-4d2c-8cff-0a88222959ed@yandex-team.ru>
 <875xb5x2ds.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <875xb5x2ds.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/25 20:12, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> 
>> On 19.11.25 16:08, Markus Armbruster wrote:
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>>
>>> ---
>>>    include/hw/loader.h |  4 +++-
>>>    hw/arm/boot.c       |  6 +-----
>>>    hw/core/loader.c    |  8 ++++++--
>>>    hw/riscv/spike.c    | 10 +---------
>>>    4 files changed, 11 insertions(+), 17 deletions(-)
>>> diff --git a/include/hw/loader.h b/include/hw/loader.h
>>> index d035e72748..6f91703503 100644
>>> --- a/include/hw/loader.h
>>> +++ b/include/hw/loader.h
>>> @@ -188,8 +188,10 @@ ssize_t load_elf(const char *filename,
>>>     *
>>>     * Inspect an ELF file's header. Read its full header contents into a
>>>     * buffer and/or determine if the ELF is 64bit.
>>> + *
>>> + * Returns true on success, false on failure.
>>
>> I don't really care, but IMO, it's obvious contract for bool+errp functions, not worth a comment.
> 
> Nearby function comments all have a "Returns" sentence.  I try to blend
> in :)

New developers might just have to look at a particular API such this
loader one, without knowing the global errp contract. With that in
mind, I'll documents @return everywhere.

> 
>>>     */
>>> -void load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>>> +bool load_elf_hdr(const char *filename, void *hdr, bool *is64, Error **errp);
>>>      ssize_t load_aout(const char *filename, hwaddr addr, int max_sz,
>>>                      bool big_endian, hwaddr target_page_size);
> 


