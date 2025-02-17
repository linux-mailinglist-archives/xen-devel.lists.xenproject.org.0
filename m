Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A3A382C6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 13:16:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890352.1299338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk031-0002To-QF; Mon, 17 Feb 2025 12:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890352.1299338; Mon, 17 Feb 2025 12:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk031-0002R9-Mm; Mon, 17 Feb 2025 12:16:27 +0000
Received: by outflank-mailman (input) for mailman id 890352;
 Mon, 17 Feb 2025 12:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tk030-0002R3-05
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 12:16:26 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01a4b684-ed29-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 13:16:25 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e05717755bso1499649a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 04:16:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece1c418bsm7388718a12.24.2025.02.17.04.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 04:16:24 -0800 (PST)
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
X-Inumbo-ID: 01a4b684-ed29-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739794584; x=1740399384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NQ/x9oExZKzRWWkR8WDEHsN2MYBKFJkuaizC3d7BIvw=;
        b=ZnIs6XX/JQsWsA27bbkAS+jK9qc14d71C/Bfo742AD4op2O73c332eSBgrT6u05wpd
         3iWT6sp2c28+4LxLIZGBj6mpFlTD2L8Xf6PAh7ItJM2CC3a6BJ24gHGDJy/qtxFFszCF
         dg+x1Hqi1S5A1emaL8Dby6u825Wu78TveCaAdvC/uBHyyLxdtSdXzT3LuepGBHi40VEW
         uYkduf3O7apJat1k73uZ4ooxspxLsI6UFW70OWnJKDEGTyDr5iQox2Je6GrNw7Xstj70
         tKH72Slp25C4srt/wId8mBcRK8AJEbFkpiUxGwvNYfYPEDSoUfP7WYbOFhcslG3bFYuV
         vYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739794584; x=1740399384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQ/x9oExZKzRWWkR8WDEHsN2MYBKFJkuaizC3d7BIvw=;
        b=oT0aldGUAaBBl1h+SgieJLT9bhtHvewuxJ7KNyt5yYecmEk32ag+R+BHxFSujADPmO
         GHAxWnO4G7MghEaW05ZPb63jjbE/HF3RUh6o9EH8+UnbN30dCxdZk0giN7r27DEDzsjY
         WOiT5QgSN9xu+dKwqAIQdUyk2llL7rgmcJfLs9HMnKWJmS7LLRgyXkL+043nP5QLu7qM
         uevXJQ0DbAkEDq4gnn/GKvAGwzEV3oDP8J+8WiYySVwYrNrjCDr71Q3S+nr3preLP2zp
         UN06HoUws453++6ZjPoz0Yv4xvzroO8t5zUNQPtI1S5A/GgLSyYZOrFpJt5ymduHJnoO
         07TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnP+ddo3q2pGiAomV3DZ197047eekuxH0crrN9Y4q5EqVC9z9XSm0TvJ9HwrrJb1/Jk0TFIiTuYXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/ATrm1JxX0Bbna7GcIK45wbxNheyMXh5pIx7hGvkEtbupTY/2
	f/Nz2gQNRhWEYJsFGwpWrDz8srtcV/dhyfuDSyiBqQj2Nx0r7/ibQYiLRcXkpg==
X-Gm-Gg: ASbGncvdgeV4J1aKmQPE4MtQVqz3ie1bLfJGtoKcoyWY1YnMQeeJy2d62WiCfSN6Nbv
	dFtE+eyS9xSrkqoSk5Cys0zuXSZeH/AQmv5aKXkF4jOAaMtd9OmIepJvlo1FRV8FTiYiaAim6et
	iPFdgOrCTDemCEjWR4BOSLtZsk2SaOUlqMRY4bn1Ok2TtuR/5RzE/PO9dUGJ1MC64TWZClugdfq
	+XkCEiy0aUUlTMx8jLS2KeJNpt1eo1oGqyE0gFGLC/CtrXRpfgnx3vNudID8dR2CywDYhDDYK+T
	HARRgfWkbVtqryUwWgOOG7sGl465NMXMMVsMnC1wIsEz3JvekdwrcebUTUVqzOWXZrv55QqIJqc
	m
X-Google-Smtp-Source: AGHT+IHulvsKl6BYujFDKsutL+BHnoJWV2phe4xTRL3gcmf8GAVrY/lEAJ7aGmDzK2haL/eXvmIibw==
X-Received: by 2002:a05:6402:26ca:b0:5de:3c29:e834 with SMTP id 4fb4d7f45d1cf-5e0361f5a47mr9315463a12.27.1739794584443;
        Mon, 17 Feb 2025 04:16:24 -0800 (PST)
Message-ID: <3a3a1efe-ddde-44c6-b4c0-1701657f31c1@suse.com>
Date: Mon, 17 Feb 2025 13:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
 <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
 <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
 <b1a4fd99-6553-4256-97ec-655c944170b2@suse.com>
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
In-Reply-To: <b1a4fd99-6553-4256-97ec-655c944170b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.02.2025 12:58, Jürgen Groß wrote:
> On 17.02.25 12:39, Jan Beulich wrote:
>> On 17.02.2025 12:16, Juergen Gross wrote:
>>> On 17.02.25 10:47, Jan Beulich wrote:
>>>> On 16.02.2025 11:23, Juergen Gross wrote:
>>>>> @@ -556,11 +590,11 @@ static inline void list_splice_init(struct list_head *list,
>>>>>     * @head:   the head for your list.
>>>>>     * @member: the name of the list_struct within the struct.
>>>>>     */
>>>>> -#define list_for_each_entry_safe(pos, n, head, member)                  \
>>>>> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member),      \
>>>>> -         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
>>>>> -         &(pos)->member != (head);                                      \
>>>>> -         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
>>>>> +#define list_for_each_entry_safe(pos, n, head, member)                     \
>>>>> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member),  \
>>>>> +          (n) = (pos) ? list_next_entry_or_null(head, pos, member) : NULL; \
>>>>
>>>> n can end up being NULL here even if pos isn't. Then ...
>>>>
>>>>> +          pos;                                                             \
>>>>> +          (pos) = (n), (n) = list_next_entry_or_null(head, n, member) )
>>>>
>>>> ... you can't use list_next_entry_or_null() on it.
>>>
>>> Ah, indeed.
>>>
>>> What would you prefer? Handling that in the *_safe() iterator macros, or
>>> allowing the *_entry_or_null() macros to be called with a NULL parameter?
>>
>> I'd prefer the former, but I probably wouldn't mind the latter.
>>
>>>>> @@ -655,10 +689,10 @@ static inline void list_splice_init(struct list_head *list,
>>>>>     * the _rcu list-mutation primitives such as list_add_rcu()
>>>>>     * as long as the traversal is guarded by rcu_read_lock().
>>>>>     */
>>>>> -#define list_for_each_entry_rcu(pos, head, member)                      \
>>>>> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
>>>>> -         &rcu_dereference(pos)->member != (head);                       \
>>>>> -         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
>>>>> +#define list_for_each_entry_rcu(pos, head, member)                        \
>>>>> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
>>>>> +          rcu_dereference(pos);                                           \
>>>>> +          (pos) = list_next_entry_or_null(head, pos, member) )
>>>>
>>>> Don't you need a list_next_entry_or_null_rcu() flavor here, using
>>>> rcu_dereference() on the passed in pos for the (pos)->member.next deref?
>>>
>>> Isn't the "rcu_dereference(pos);" all what is needed for the current iteration?
>>
>> Reading Linux'es rcu_dereference.rst, my understanding is that one of them
>> would suffice if then we used its result rather than the original pointer.
>> Then again RCU has been somewhat opaque to me for all the years ...
>>
>>> Otherwise today's implementation would suffer from the same problem IMHO.
>>
>> That's the impression I'm (now) having.
> 
> The rcu_dereference() is basically just for documentation purposes. If needed
> by an arch, it can add barriers, too, but according to the comments those would
> be needed on alpha only. The returned value is always the original pointer
> value. See the comment block in xen/include/xen/rcupdate.h

Note the "This pointer may later be safely dereferenced" in there. As said,
we'd be fine if we used the return value instead of the original "pos". Yet
we don't. We effectively assume that the macro expands to just the passed
in pointer, with no barriers or anything else.

Anyway, since - as you validly say - this is a pre-existing issue, let's put
it on the side right here.

Jan

