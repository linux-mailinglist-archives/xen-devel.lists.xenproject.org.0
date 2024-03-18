Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE587EA6E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694725.1083791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDRU-0000HK-GY; Mon, 18 Mar 2024 13:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694725.1083791; Mon, 18 Mar 2024 13:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDRU-0000Ee-DB; Mon, 18 Mar 2024 13:54:20 +0000
Received: by outflank-mailman (input) for mailman id 694725;
 Mon, 18 Mar 2024 13:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmDRS-0008Qw-Vg
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:54:18 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03502659-e52f-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:54:18 +0100 (CET)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-789e2bf854dso158611385a.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:54:18 -0700 (PDT)
Received: from [10.80.67.23] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o5-20020ae9f505000000b0078812b73ea1sm4581535qkg.28.2024.03.18.06.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:54:16 -0700 (PDT)
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
X-Inumbo-ID: 03502659-e52f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710770057; x=1711374857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ai+rH1Ya2HGRi5MrW4Yk9UAKRD8uMIBORJU1vstP6xw=;
        b=o9jZf9z/oDiIi99fBT9i0KlIGkDYqTM3UUpYWhUpgitSjwWcP6zrRKgRfTy4F14nBC
         Di0LHvFDITy72AL1+ZoMWAxTYHFNrPPQJUZdJXnt6UP4+akstkcT3K0BVqUhOOF1Nm92
         t7ht1JcMeTR+R3vHYs676vMfR7rekB5O0N/2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710770057; x=1711374857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ai+rH1Ya2HGRi5MrW4Yk9UAKRD8uMIBORJU1vstP6xw=;
        b=gpW6o2QtecKf1t10m/HTEu6wsxeXvxJJL2zNieM53/TTOsq6oeISJ+j/LVseKQ9eWg
         nHYsliUkKAvNq6r0qBLoscKKRn9yXmguB00v8g6LM6/Y1oHkqsM72Z869RsJbtJiaVxh
         F3NzvQLXhmvum9ORHvXAIcs1tZgMGO/ZZLvrSSA3/0NavLuJKGxnwdLkEE9AKcp7LSFp
         6GCtOkHiTU8DEDZBLvp1NbwOGYw8XuzcPcLxeBRByw+vF9UX7dEKTSm7OtxkkwiIQxNi
         Dkz7uAID2FM3yTFsiLpMwV8UDIHN6zUz5e6SQndbEkZSxJmdvblJq7pUOtP1IaYT+MFc
         tHBA==
X-Forwarded-Encrypted: i=1; AJvYcCVVX0QcDCKQpXiDvGEd32R7b+ie6aWucDnthEmipcQPT9U5FNOuum+Gz4p68x1QGpCImm31atlb8lKhtUVgXvez/Zkm6L9uptqmlfqHYOo=
X-Gm-Message-State: AOJu0YxY47+jUTnqZU+rr+L5K8NsJjEJontrQGsCqGdL1DCJFceqwIMX
	PQlpFwLwKBnZ5KeaRWPKyB+1iTmPX3ZOAIXiVB7DAzuydzzZGEtpJZklxnZ8Ed8=
X-Google-Smtp-Source: AGHT+IFnkx8BnXe53mpSL+LDkTWhltJ/rmeXDFYclFZMadSWR7d8pcwiJiPOkLlTlTvt2mx+iaNelg==
X-Received: by 2002:a05:620a:2951:b0:789:fe61:8451 with SMTP id n17-20020a05620a295100b00789fe618451mr3649504qkp.63.1710770057223;
        Mon, 18 Mar 2024 06:54:17 -0700 (PDT)
Message-ID: <483c2375-26f9-442d-ba2f-c87cb2253178@citrix.com>
Date: Mon, 18 Mar 2024 13:54:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/virtual-region: Link the list build time
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-4-andrew.cooper3@citrix.com>
 <94622e8d-e5b9-4306-bc61-d37cd8078338@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <94622e8d-e5b9-4306-bc61-d37cd8078338@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2024 1:25 pm, Jan Beulich wrote:
> On 18.03.2024 12:04, Andrew Cooper wrote:
>> Given 3 statically initialised objects, its easy to link the list at build
>> time.  There's no need to do it during runtime at boot (and with IRQs-off,
>> even).
> Hmm, technically that's correct, but isn't the overall result more fragile,
> in being more error prone if going forward someone found a need to alter
> things? Kind of supporting that view is also ...
>
>> ---
>>  xen/common/virtual_region.c | 45 ++++++++++++++++++++++++-------------
>>  1 file changed, 30 insertions(+), 15 deletions(-)
> ... the diffstat of the change. It's perhaps also for a reason that ...
>
>> --- a/xen/common/virtual_region.c
>> +++ b/xen/common/virtual_region.c
>> @@ -15,8 +15,19 @@ extern const struct bug_frame
>>      __start_bug_frames_2[], __stop_bug_frames_2[],
>>      __start_bug_frames_3[], __stop_bug_frames_3[];
>>  
>> +/*
>> + * For the built-in regions, the double linked list can be constructed at
>> + * build time.  Forward-declare the elements.
>> + */
>> +static struct list_head virtual_region_list;
>> +static struct virtual_region core, core_init;
>> +
>>  static struct virtual_region core = {
>> -    .list = LIST_HEAD_INIT(core.list),
>> +    .list = {
>> +        .next = &core_init.list,
>> +        .prev = &virtual_region_list,
>> +    },
>> +
>>      .text_start = _stext,
>>      .text_end = _etext,
>>      .rodata_start = _srodata,
>> @@ -32,7 +43,11 @@ static struct virtual_region core = {
>>  
>>  /* Becomes irrelevant when __init sections are cleared. */
>>  static struct virtual_region core_init __initdata = {
>> -    .list = LIST_HEAD_INIT(core_init.list),
>> +    .list = {
>> +        .next = &virtual_region_list,
>> +        .prev = &core.list,
>> +    },
>> +
>>      .text_start = _sinittext,
>>      .text_end = _einittext,
>>  
>> @@ -50,7 +65,10 @@ static struct virtual_region core_init __initdata = {
>>   *
>>   * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
>>   */
>> -static LIST_HEAD(virtual_region_list);
>> +static struct list_head virtual_region_list = {
>> +    .next = &core.list,
>> +    .prev = &core_init.list,
>> +};
> ... there's no pre-cooked construct to avoid any open-coding at least
> here.
>
> To clarify up front: I'm willing to be convinced otherwise, and I therefore
> might subsequently provide an ack. I'm also specifically not meaning this
> to be treated as "pending objection"; if another maintainer provides an ack,
> that's okay(ish) with me.

I think it's a very small price to pay in order to allow patch 4 to exist.

If you can think of a nice way to express this with a pre-cooked
construct then suggestions welcome, but it's a really complicated piece
of metaprogramming to express in a nice way.

~Andrew

