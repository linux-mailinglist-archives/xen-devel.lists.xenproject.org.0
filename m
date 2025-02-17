Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C357A38201
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 12:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890292.1299288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzTW-0002xa-3e; Mon, 17 Feb 2025 11:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890292.1299288; Mon, 17 Feb 2025 11:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjzTW-0002vO-09; Mon, 17 Feb 2025 11:39:46 +0000
Received: by outflank-mailman (input) for mailman id 890292;
 Mon, 17 Feb 2025 11:39:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjzTV-0002vI-4D
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 11:39:45 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0fbea81-ed23-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 12:39:42 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e0516e7a77so1548997a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 03:39:42 -0800 (PST)
Received: from [10.156.60.236] ([37.24.206.209])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53397f54sm862874266b.124.2025.02.17.03.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 03:39:42 -0800 (PST)
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
X-Inumbo-ID: e0fbea81-ed23-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739792382; x=1740397182; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BDNiB/WVrcDq7TaGR2DRIye6KojNO9lixgOZT6zZtik=;
        b=Ut1YoyVKGlm5quwXNOZeMu+paL5v44xzU7jCr0wkxQ5zHBDWz86P6r2IsN9+O38tZP
         FjJpOoLOgpdMPFkjn1cQ0nZofcwXufu/9AmuXXEnJ8X+zNcwmqP0VSHyhM0T+DbeWeEW
         OjUMja6/07MGaTVADooeFLpZtiHIoKvS4/jtWXRjLxX/NeWgiJLxD1iKyZ9KtEynnlIa
         uBfY2V4zXb40dp3BY72HDgO6R4KSZ4JMJjjQfrwaKoUVRU68WbzFmGF9HeX6DbOaex1V
         u0nz4jmdgbIU6wOv74Iwock6rTjyuQUwbctfRAZVbNsC8KybvRU0c8qcLBidFPAZuTDI
         ys2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739792382; x=1740397182;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDNiB/WVrcDq7TaGR2DRIye6KojNO9lixgOZT6zZtik=;
        b=GU9O00a2VsajAdRh4Z7Kzgmnq8PpilfkLSPmmkLHSVyJP1jXonHveGnIBWohcmMvTU
         A1aFtI1vNLu6QVYvS1VMtHkOum8KaRkhXDhsmYDFSG40bTSnghC2J0IYafSHeCAztg7+
         3SEYYK1HES5zz1fxTWHfvDpvArDIMZilMMOlI2kLsn6uk6IFT5R2XW+WehVT3BSlKYTS
         xxt5dzEb8GrRgYVEV7LLt77L5WMPm2GHoTaapehQ1oHl7E+p5YfVtcBgduHi4J6SKy/8
         7AUxQrargCuSW+JGA3VZTEJso0g0maqFH4Kje9AVsD0gem+7LIgYptl91lk5xV+9PpQF
         BSlw==
X-Forwarded-Encrypted: i=1; AJvYcCWvNHtlttdLSW7Mc4jHTXNE8si9Q0vQOqKpoZWqwj61lAgZf3OAxeaFm77Su9KEV+SBe5RZCyzceRM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxZxzLlupatjOg6sVo+VwyP0DoWkhKwRKjE7W+GXBaaWQT+knO
	+Wz0DXTLvEwcnKQVgfqwyf+Srzp3Ht0PAgxPNre7RNoFOZwpU5lw01kV1sVLug==
X-Gm-Gg: ASbGnctpRGabi7cEcEFbx/C82FNsv6LBgM8XxM14LNUnAQUUw+jOKRH4RgZ1RZivR2v
	ITVrrx94nb7xH+3tXwNrAMFi3xRZ2rM86+91zDEpnywclLUgbySB9GMsjbJzdINt3mBNTUA52G0
	QJls0jkLHgK85Mu0uoZ7D6BZxwN22Ihnckb/AKdNXODaN8AkDwH8V/I5EAiQ9dtFU0gIVDv8teL
	n0a5YFmA06av349Wq7J+HRuPaz+5Ttyou/fy7BViT+vj2098Ql1uub3G8cPnVEhjXHwbZx9dzje
	bDd2eUr6ESdPyU/V/R5QIXQfcQ==
X-Google-Smtp-Source: AGHT+IF1gKcQKhBqgCqWUo8nYYNPEq/a+LMN9gn1E+k65+WvVw4bngQkW0sUcDRrWaQvpYIWfJtH5g==
X-Received: by 2002:a17:907:9716:b0:ab9:5544:5eb3 with SMTP id a640c23a62f3a-abb70b354e7mr849879866b.26.1739792382254;
        Mon, 17 Feb 2025 03:39:42 -0800 (PST)
Message-ID: <ad91884b-e712-4f6e-a7ee-04817e8aabce@suse.com>
Date: Mon, 17 Feb 2025 12:39:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/list: avoid UB in list iterators
To: Juergen Gross <jgross@suse.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250216102356.18801-1-jgross@suse.com>
 <20250216102356.18801-2-jgross@suse.com>
 <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
 <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
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
In-Reply-To: <93a37ce1-cffb-4dae-b339-7fd52a1098d8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 12:16, Juergen Gross wrote:
> On 17.02.25 10:47, Jan Beulich wrote:
>> On 16.02.2025 11:23, Juergen Gross wrote:
>>> @@ -556,11 +590,11 @@ static inline void list_splice_init(struct list_head *list,
>>>    * @head:   the head for your list.
>>>    * @member: the name of the list_struct within the struct.
>>>    */
>>> -#define list_for_each_entry_safe(pos, n, head, member)                  \
>>> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member),      \
>>> -         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
>>> -         &(pos)->member != (head);                                      \
>>> -         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
>>> +#define list_for_each_entry_safe(pos, n, head, member)                     \
>>> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member),  \
>>> +          (n) = (pos) ? list_next_entry_or_null(head, pos, member) : NULL; \
>>
>> n can end up being NULL here even if pos isn't. Then ...
>>
>>> +          pos;                                                             \
>>> +          (pos) = (n), (n) = list_next_entry_or_null(head, n, member) )
>>
>> ... you can't use list_next_entry_or_null() on it.
> 
> Ah, indeed.
> 
> What would you prefer? Handling that in the *_safe() iterator macros, or
> allowing the *_entry_or_null() macros to be called with a NULL parameter?

I'd prefer the former, but I probably wouldn't mind the latter.

>>> @@ -655,10 +689,10 @@ static inline void list_splice_init(struct list_head *list,
>>>    * the _rcu list-mutation primitives such as list_add_rcu()
>>>    * as long as the traversal is guarded by rcu_read_lock().
>>>    */
>>> -#define list_for_each_entry_rcu(pos, head, member)                      \
>>> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
>>> -         &rcu_dereference(pos)->member != (head);                       \
>>> -         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
>>> +#define list_for_each_entry_rcu(pos, head, member)                        \
>>> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
>>> +          rcu_dereference(pos);                                           \
>>> +          (pos) = list_next_entry_or_null(head, pos, member) )
>>
>> Don't you need a list_next_entry_or_null_rcu() flavor here, using
>> rcu_dereference() on the passed in pos for the (pos)->member.next deref?
> 
> Isn't the "rcu_dereference(pos);" all what is needed for the current iteration?

Reading Linux'es rcu_dereference.rst, my understanding is that one of them
would suffice if then we used its result rather than the original pointer.
Then again RCU has been somewhat opaque to me for all the years ...

> Otherwise today's implementation would suffer from the same problem IMHO.

That's the impression I'm (now) having.

Jan

