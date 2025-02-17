Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4905EA37EE5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889893.1298928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxig-0006sh-7N; Mon, 17 Feb 2025 09:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889893.1298928; Mon, 17 Feb 2025 09:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjxig-0006rC-30; Mon, 17 Feb 2025 09:47:18 +0000
Received: by outflank-mailman (input) for mailman id 889893;
 Mon, 17 Feb 2025 09:47:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjxie-0006r4-4C
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:47:16 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2614fa93-ed14-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 10:47:06 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5e04cb346eeso2330514a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:47:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270a7fsm6974333a12.58.2025.02.17.01.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:47:06 -0800 (PST)
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
X-Inumbo-ID: 2614fa93-ed14-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739785626; x=1740390426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=11j2ytVisNDAl9nKWgwVPnP1QyQ7uwpvDb4jJHLbbKE=;
        b=RvGQUJaSNSi5c4AUnZ3CDhjfa1KvJ7Yp4LKQSfFuh99iqolfgEnju1c7+TJJD5q7jV
         3Xng7pl+A1Mjf75L02PdJ+obodEr4uDfQQ/Tk5KQm5dSIuqzRzQIUH0XxTCUlR64G0Rr
         5UHB1kp40fkChuoF5UC3odBB2wqGRFlVeeiesqmc0ZF6ByFOlhWVeJfn6eM8cpOo9bGl
         Vb/O7lF4svkEmBGFgVyV6OigqM0DjKfQyExVmUU3SgJJJEk32E3BzQk5HZje1vtHamfq
         0AIapPpOc/TXaqwcVVtLyKi9ve/476TCW5lhZXVsCso4x6xnFvtMwX8q4hE+f3ecvjob
         JbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739785626; x=1740390426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11j2ytVisNDAl9nKWgwVPnP1QyQ7uwpvDb4jJHLbbKE=;
        b=ZX82EDzh+yBBi6BzdblQHcJFriEbRLVrBGmoV2UItkU0gWwQQYz7PgHHPHgxw1B/yi
         uf4K1wNFxP9nq+gxccsWFjeJfuhsiqRLgJsCisbkcMBJLCCDl9scALCJdcytTEFNINUo
         flHjRY1AgKWIqBZGpeoGBMarTZ30mEvI/pbSHmgzd8tMXneI/+Fiab23H7oWVE/CPDQr
         mrQEGdDMop4RMBED8+tOAt5nG/UXp7/dTHuTUF+vz5xBX11G5/21YCOn+YwGSr3c0dTS
         Z7jEZdL2oKQ0z/tqcQ6/NSkGMH0sTNPmXb+ByN8OjO/13LYpcq5p6gm4qE//niSvXTT0
         wRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUflgbhWeZx7eWfFirf3AxK0zD0FPbcSoJrq1cjEYM0sSez+6sR9ChlpCRbCZnyrOuheni1FzNDBdg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW+CSpG4bwMySSSO/+R1fZAiXsCcPvJQYj1NIp/GttknlTZEPJ
	HpUjN/pNWylfUHtkPD7xFlf7tUXhFOx54O0HzFb1p2dF0E9phzSpdXp7vMTYFQ==
X-Gm-Gg: ASbGncuBIzSSwn8YMBCrH/f9QpTl3gGYlTmuyj3++pImWfKBNUadbaJPvhTUqodfd+j
	zUhqA8s5Qj4Oeqon53YtGkPYoU7yNxyyw8UWGrl5A/PqxZW1UAE6gItTz/UA+JYBnHrbVomd/Ke
	qodMR30gff1J2IHx6/NipWa8xYu0cujwZy9WFvhvVB2JWCXdSCAt83CZ5p8eUhGlds/AHqBYmFq
	RFALAyVuAwZfY/CBFSAbiIu8+viwuXYm/2ObvcpjahzwBTO4cuwWViVOYN3kKPnnY15n32h6mcw
	jS4nHCiRkMOA1SYKP728DrRYyb+FLzLzrP3X2dHLB1obbED+rP1Lig47dhsFNDPDpdgei1Kot/u
	L
X-Google-Smtp-Source: AGHT+IFRInmDkdDHFRpjcXqhIRhIe3DframHmOBhQGHb5KHy6rpe1qDbiVtFC47koBkAD8Kg4ZSLzw==
X-Received: by 2002:a05:6402:280a:b0:5de:6486:3f52 with SMTP id 4fb4d7f45d1cf-5e036070696mr8399305a12.9.1739785626468;
        Mon, 17 Feb 2025 01:47:06 -0800 (PST)
Message-ID: <6e429c09-7f45-4bf6-b5b9-5d4b8885620c@suse.com>
Date: Mon, 17 Feb 2025 10:47:06 +0100
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
In-Reply-To: <20250216102356.18801-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2025 11:23, Juergen Gross wrote:
> The list_for_each_entry*() iterators are testing for having reached the
> end of the list in a way which relies on undefined behavior: the
> iterator (being a pointer to the struct of a list element) is advanced
> and only then tested to have reached not the next element, but the list
> head. This results in the list head being addressed via a list element
> pointer, which is undefined, in case the list elements have a higher
> alignment then the list head.

Nit: s/then/than/

> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -291,6 +291,17 @@ static inline void list_move_tail(struct list_head *list,
>      list_add_tail(list, head);
>  }
>  
> +/**
> + * list_is_first - tests whether @list is the first entry in list @head
> + * @list: the entry to test
> + * @head: the head of the list
> + */
> +static inline int list_is_first(const struct list_head *list,

bool?

> +                                const struct list_head *head)
> +{
> +    return list->prev == head;
> +}

"list" is ambiguous, as it could also mean the start of the list. Maybe
better "entry"? (I understand that'll be inconsistent with the subsequent
list_is_last(), but what do you do.)

> @@ -440,7 +451,19 @@ static inline void list_splice_init(struct list_head *list,
>    */
>  #define list_next_entry(pos, member) \
>          list_entry((pos)->member.next, typeof(*(pos)), member)
> - 
> +
> +/**
> +  * list_next_entry_or_null - get the next element in list
> +  * @pos:        the type * to cursor
> +  * @member:     the name of the struct list_head  within the struct.

Nit: Stray 2nd blank before "within"

> @@ -492,10 +527,10 @@ static inline void list_splice_init(struct list_head *list,
>   * @head:   the head for your list.
>   * @member: the name of the list_struct within the struct.
>   */
> -#define list_for_each_entry(pos, head, member)                          \
> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
> -         &(pos)->member != (head);                                      \
> -         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
> +#define list_for_each_entry(pos, head, member)                            \
> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
> +          pos;                                                            \

I suspect Misra would demand pos to be parenthesized here (and in similar
places elsewhere), too.

> @@ -556,11 +590,11 @@ static inline void list_splice_init(struct list_head *list,
>   * @head:   the head for your list.
>   * @member: the name of the list_struct within the struct.
>   */
> -#define list_for_each_entry_safe(pos, n, head, member)                  \
> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member),      \
> -         (n) = list_entry((pos)->member.next, typeof(*(pos)), member);  \
> -         &(pos)->member != (head);                                      \
> -         (pos) = (n), (n) = list_entry((n)->member.next, typeof(*(n)), member))
> +#define list_for_each_entry_safe(pos, n, head, member)                     \
> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member),  \
> +          (n) = (pos) ? list_next_entry_or_null(head, pos, member) : NULL; \

n can end up being NULL here even if pos isn't. Then ...

> +          pos;                                                             \
> +          (pos) = (n), (n) = list_next_entry_or_null(head, n, member) )

... you can't use list_next_entry_or_null() on it.

> @@ -655,10 +689,10 @@ static inline void list_splice_init(struct list_head *list,
>   * the _rcu list-mutation primitives such as list_add_rcu()
>   * as long as the traversal is guarded by rcu_read_lock().
>   */
> -#define list_for_each_entry_rcu(pos, head, member)                      \
> -    for ((pos) = list_entry((head)->next, typeof(*(pos)), member);      \
> -         &rcu_dereference(pos)->member != (head);                       \
> -         (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
> +#define list_for_each_entry_rcu(pos, head, member)                        \
> +    for ( (pos) = list_first_entry_or_null(head, typeof(*(pos)), member); \
> +          rcu_dereference(pos);                                           \
> +          (pos) = list_next_entry_or_null(head, pos, member) )

Don't you need a list_next_entry_or_null_rcu() flavor here, using
rcu_dereference() on the passed in pos for the (pos)->member.next deref?

Question on the patch as a whole: Since I have a vague recollection that we
may have a use or two of one of these iterator macros which actually make
assumptions on the state of pos upon loop exit, did you audit all use sites?

Jan

