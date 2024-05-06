Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8598BCB61
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717421.1119614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v7q-000530-4M; Mon, 06 May 2024 09:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717421.1119614; Mon, 06 May 2024 09:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3v7q-00051U-1X; Mon, 06 May 2024 09:59:14 +0000
Received: by outflank-mailman (input) for mailman id 717421;
 Mon, 06 May 2024 09:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0G4=MJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s3v7o-00051N-Hh
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:59:12 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 499b99b4-0b8f-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:59:11 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34d7d04808bso1246090f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:59:11 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.211.4])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfb603000000b0034dced2c5bdsm10269498wre.80.2024.05.06.02.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:59:10 -0700 (PDT)
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
X-Inumbo-ID: 499b99b4-0b8f-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714989551; x=1715594351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RM2AUVZhCrZRBdwl2qu154tGUSj3YdbWUJhDj2uZ1jg=;
        b=ubdxtiJEpjb8LyCDW0EMYCkXdIkX35BfDBa/nXOqQno7PaxiIr9uHFBnzI3+Imvh3S
         Lkf6ZGmFQy1p9rEC/pT8WTiCSnqqhZiSB82yHzWx8Z5d7JgpQlOSBynax6c+KyJrEft1
         ZYkuc89wy2STjb3KvT4j7TU/K7F4AkEBS8Jkj1MS5fIm7Fhq1fWVLvvX6aXa9oD/GZOM
         K/wOyP6aWtdK8FHMK2cjUOcthPDk6eMbmCMmNqLCB29MoFQyUKvf+tKxcjWLtScDFmlR
         YmfG64tcXixI7kcyqDKxg7j1GVg5uM+V8OCDkvso9dIoRFteAvS6cBHSY711y57Ym9QQ
         PY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714989551; x=1715594351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RM2AUVZhCrZRBdwl2qu154tGUSj3YdbWUJhDj2uZ1jg=;
        b=EzZy4wSn0tYbblOFsbZuQzoSUB7+WHGm3MiRryIgWpxXr/lOMKZtydyGIWqaifERAf
         pxqbdsJJW2w1nWeTDCSGBW9JKHwdNq6dsgUEXPzcznx4ALXf2jjuy7iS4tZm5IvuRq/h
         kcibQtJz1K/pZqEuf7wuO6zUHJBOgw/AtuyI9TnUn7W97vGt93fCsdr0ooMFkBVBSM94
         Wfw3d0yUbMyj62LamdLxctFoJfmTYfwl/xBTlc3G/YoPCTKD21wT5FxPvaDvYVt2em4f
         y5hV7p5C6F5aRjA8lZBnVEPHSwY83dZBh2vQwttZDL+q1vewdhu7XYkioPGtv2n6CQxm
         6I/w==
X-Forwarded-Encrypted: i=1; AJvYcCVx3u0XuYIPIS+OvBR/vrwD5SGAJE+OawldX2CVqQHGTsoA8ke/F3OnXMSJTJPIHhJjH108Ivzt5Xfb1n3/bAA1WaSjn+sB13G4Lnc7b5s=
X-Gm-Message-State: AOJu0YxwkR4Bk8Z4tpLUJCIiJ0lrtIG5xvVWuLiS2xKZwVr7fpX9MtZq
	gQKmFHBu4RPQ8WwWgJoBeqPF+ZeSA0ZknEVdSCyu4UtvF68cLm+Jlxz0vKTGi0M=
X-Google-Smtp-Source: AGHT+IGQhLat87LYAh2IwfqAZwyzJJcGQTjnVUUxq0f0jcHzkbbN/ooQNq+MPvlN954LLRpUdApp6w==
X-Received: by 2002:a5d:456e:0:b0:34d:8d55:739a with SMTP id a14-20020a5d456e000000b0034d8d55739amr9345620wrc.57.1714989551149;
        Mon, 06 May 2024 02:59:11 -0700 (PDT)
Message-ID: <d4008042-6f68-42f6-8ade-fbb0ba115a33@linaro.org>
Date: Mon, 6 May 2024 11:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/17] xen: Add xen_mr_is_memory()
To: David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, jgross@suse.com,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 xen-devel@lists.xenproject.org
References: <20240430164939.925307-1-edgar.iglesias@gmail.com>
 <20240430164939.925307-15-edgar.iglesias@gmail.com>
 <0263b7e8-5800-4f5a-9dc5-bc2b4fbbbbfe@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <0263b7e8-5800-4f5a-9dc5-bc2b4fbbbbfe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/5/24 09:26, David Hildenbrand wrote:
> On 30.04.24 18:49, Edgar E. Iglesias wrote:
>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>
>> Add xen_mr_is_memory() to abstract away tests for the
>> xen_memory MR.
>>
>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>> ---
> 
> [...]
> 
>>   #endif
>> diff --git a/system/physmem.c b/system/physmem.c
>> index ad7a8c7d95..1a5ffcba2a 100644
>> --- a/system/physmem.c
>> +++ b/system/physmem.c
>> @@ -2227,7 +2227,7 @@ static void *qemu_ram_ptr_length(RAMBlock 
>> *block, ram_addr_t addr,
>>            * because we don't want to map the entire memory in QEMU.
>>            * In that case just map the requested area.
>>            */
>> -        if (block->offset == 0) {
>> +        if (xen_mr_is_memory(block->mr)) {
>>               return xen_map_cache(block->mr, addr, len, lock, lock,
>>                                    is_write);
>>           }
> 
> I'd have moved that into a separate patch, because this is not a simple 
> abstraction here.

Yes please, maybe using Stefano review comment in the description.

> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 


