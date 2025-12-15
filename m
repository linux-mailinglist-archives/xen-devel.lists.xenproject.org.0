Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481ADCBD8E4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:40:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186888.1508317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6vi-000130-9r; Mon, 15 Dec 2025 11:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186888.1508317; Mon, 15 Dec 2025 11:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6vi-00011J-71; Mon, 15 Dec 2025 11:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1186888;
 Mon, 15 Dec 2025 11:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV6vg-000111-Jy
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:39:52 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4a75df9-d9aa-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 12:39:51 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso36896905e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:39:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f768936sm187043035e9.6.2025.12.15.03.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 03:39:50 -0800 (PST)
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
X-Inumbo-ID: c4a75df9-d9aa-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765798791; x=1766403591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TB8O3jxwzRMTmvvjsIUJXyYUoGfXC+KyhHVWQllhLFQ=;
        b=T3L+ij5uzinJ/MW1pTVBE/bC53p1lWlFEVPHpw7KZocC/VcwplzAn9j5kBU8uQvq4x
         K/SZmYeCQbZ3zmjsRbNHx7pGXtfJ/57JVYmlUQC9Dl3o4GEeM5ZY3ZRJFtv4ts7oA+hy
         oZsuoT1Knl5T3Y7/TQFbMtk0B68qYrb2J8rmlDTcNoaREl3dThXSZSGLiKtu+05Wax9a
         MNlCz80oDet/TH5wHrY6PpkysnyUHaiio6Rk9w4UxCeCKEtDGvj5aksLJwDyDja48H9C
         ekxloMFzPSKuSkNv9jRWu+efEScdfGRhWbaRocrYcPh6S0Ab2X6FhXPlm20Y3yM44NEK
         197Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765798791; x=1766403591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB8O3jxwzRMTmvvjsIUJXyYUoGfXC+KyhHVWQllhLFQ=;
        b=Bj7e6xsMaM6zwg1jOknqXokHVdIp6RhpZxpyGvq3WGlb5WznRFx9Zjevlkdx97G2m5
         7WEhJt9ufxwtBgwOq0YMWzELkh7S93l97YslTPqx+ZN/AaxzaQ/dIdR2FIyiADe0M8ah
         ZvSLRWXRR1hC7d5ubAkOOfK/qib45Mk1+s/moLMsLLWRE12nSGIj62AtRNctQR7t2nxW
         qIpEs2PzYWziwLD1Nqn2882V9fqe80ouzFTrVtzLsvRdgL5H9QtcAHnxQUu8EW5b7qpW
         RBOQa+qNzt5vud6oPPhS33MQ8rQDjFi2mm+n+PFixmMk5nrNObekDOsCr3svMr9UuEq4
         KQNw==
X-Forwarded-Encrypted: i=1; AJvYcCU3zuGtnZxPgechk6azgJVqsuUoBN1SdKIWoPQ49Vt+bcL7nFbnpqBEaT21BPr0BBVaAPfXvdCugUY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxflJnPyQ/tfxmg6AzraBQbV3n+hiAvalAOeZkSAn0h4cwJXqQu
	4dpYQX2/GrOLIuuChOSQfm2u03l306SV9rN/htAL0PHCJktQ3JErRJsAHKbVgkSCgA==
X-Gm-Gg: AY/fxX7eR7xTrI5atqVNSP1BzHL8FosXSCRGBSAWDfsAnL+hTsUOqF5OHLnzOLXywaP
	3EXgvpJfYFGTXLEoAEurVMswi+zs9Ghf7gvjHMes3fu9I9068fk7+UKPcaU75nvCmGuIDmDFWBg
	eRnsYfqB8IaxOICHFe2ZRsBhZ54CUNHl/QL30xhyoCJqFGPhIiDa9gIfIDzN32R6IcDA37spDae
	VL1JHWW+gNhErZ7yZa/ZsbiOZzJuq0S7HwU3VywMHDJUbre4D5XWTdYwBM9HqHKlQH/nLgQqBqZ
	V48lSGsXOy83n3GS57QiS+XFyg1jTIA38QoFvlVSiJtoZP2J0MrhFbb9TrCiwg8AS4MjX4aelcR
	ORTjdJW9RiF2lxFQBt9RzcBw841H+pyffs3Z7t34oalAzQADl9swkJoG0GvH5EBVkZfwNkvgMUz
	Nd+PeHyZbIex9IJsdQPriTATYE834fwp3z8i6/s8dFwBZaCeCCReZNWWUpwwhJ0KSMuZiVZB49E
	uc=
X-Google-Smtp-Source: AGHT+IEUqfBqHZWS+uHbOB/MXsBcDZav7xn/SeGDlXV9FdOkfisLCJCysf4V/2x5PVF/vbUw/REIIg==
X-Received: by 2002:a05:600c:4e93:b0:477:63b5:6f39 with SMTP id 5b1f17b1804b1-47a8f90453fmr86822775e9.19.1765798791087;
        Mon, 15 Dec 2025 03:39:51 -0800 (PST)
Message-ID: <59fc7f4c-b3f9-4a5e-b438-7989c4cd7c02@suse.com>
Date: Mon, 15 Dec 2025 12:39:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] xen/arm: gic-v3: add ITS suspend/resume support
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
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
In-Reply-To: <2fade2b96128053fbe3ed59f1d5e3444b32b96c3.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2025 19:43, Mykola Kvach wrote:
> --- a/xen/include/xen/list.h
> +++ b/xen/include/xen/list.h
> @@ -535,6 +535,20 @@ static inline void list_splice_init(struct list_head *list,
>           &(pos)->member != (head);                                        \
>           (pos) = list_entry((pos)->member.next, typeof(*(pos)), member))
>  
> +/**
> + * list_for_each_entry_continue_reverse - iterate backwards from the given point
> + * @pos:    the type * to use as a loop cursor.
> + * @head:   the head for your list.
> + * @member: the name of the list_head within the struct.
> + *
> + * Start to iterate over list of given type backwards, continuing after
> + * the current position.
> + */
> +#define list_for_each_entry_continue_reverse(pos, head, member)           \
> +    for ((pos) = list_entry((pos)->member.prev, typeof(*(pos)), member);  \
> +         &(pos)->member != (head);                                        \
> +         (pos) = list_entry((pos)->member.prev, typeof(*(pos)), member))
> +
>  /**
>   * list_for_each_entry_from - iterate over list of given type from the
>   *                            current point

While not said so anywhere, I understand this is taken from Linux. Maybe we
should indeed take it verbatim (as far as possible, i.e. without the use of
list_entry_is_head() which we don't have yet), but I'd like to point out
that in the comment "continuing after the current position" is ambiguous.
In list order, what is meant is "before the current position"; "after" is
correct only when considering iteration direction. Personally I would much
prefer if this was disambiguated.

Jan

