Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94515ACC00F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 08:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003960.1383596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMKsf-0003c4-8A; Tue, 03 Jun 2025 06:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003960.1383596; Tue, 03 Jun 2025 06:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMKsf-0003Zv-47; Tue, 03 Jun 2025 06:12:13 +0000
Received: by outflank-mailman (input) for mailman id 1003960;
 Tue, 03 Jun 2025 06:12:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uMKsd-0003Zp-Vp
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 06:12:12 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9df218b-4041-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 08:12:01 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a50fc819f2so939401f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 23:12:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bdb3f4sm80459875ad.86.2025.06.02.23.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 23:12:00 -0700 (PDT)
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
X-Inumbo-ID: a9df218b-4041-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748931121; x=1749535921; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gCW1YWXzY7SUtJ7RPccHS3xdLZAmi9LuM82UNhqVUsY=;
        b=Gkv5GMyLof2pG5ef99WS3AeGp4Js1dftdbDInJhMrUMHlUGP6cRyJO44XaTZi9aFpE
         uUv9oRITz32d+bBLQhbubGndN3ICQk33XA/iCebLBJ2avQ9NwyqeZMtdXXoRKYEPuUsl
         BuJnb9oySbFuKgJ9paVqROOHCNBsoHSeIDHkKIn+DW8EsBHlnPSYmqq2vQahIT0RNPtd
         sgdh2bboTHpF9/yZwB4ebpapBrPmPGKWytlkhiveVXx14eU8kI4xMfoID+tuQKVdF+ac
         KnrWa5XJu6R7sgr+/I6UyHVVrWpXB0CM33vQqqBNo3/Qga+WlvxJ+3IWjPZLFLr/NvDu
         Wq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748931121; x=1749535921;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCW1YWXzY7SUtJ7RPccHS3xdLZAmi9LuM82UNhqVUsY=;
        b=RxpoNbskK+Ytr8DqfUMqObWVeccry77h1lRvVy/1oz195blpJB6r2u9YL15Xpyqmoj
         3akvfzb62MuQtQQPvSDtiv8ecs5/HC2LmD7mWom7L1VNtoxKwdkzROAY+Fy826kOrqr4
         Y5qBxLdtA8oY/QEjueKqJmDyPFjQbi6tZddUJt0Ant2BVNwf/P5dMO1ZGgBZU02y3O8b
         B8eyGxXJQDt2ejRPvxsDLgyVmg/4yFrMYLjZS7fqEPkHqKREuX/D9F2YbUrydQE+bxCK
         An9URifgqeX3q1YVvHP0QQcD2ny9bgnOvLeBYD9dMq+YN+HjacfefN523Gw7UcEVs6wb
         gyog==
X-Gm-Message-State: AOJu0YwcxgZEE5YCAxq2F3XyiJotUNULa4usMZNpx/Ol5PXii/Z+BXVO
	Mh2GLZhwlLfQnVn51LOY/7lvMT4m+bmxfiV0crE7BENG2FPn8dwS/UznO95N6i+cQQ==
X-Gm-Gg: ASbGnctWwdOCTio/7LRKMu4QxAx6kgwEYjpD/Z6yXSl6xE83OUkdfbwKFUULkyJRkjB
	nEXRc16OFEoW7XtEMtNu7lfGLyudqaEnd11fTTMqwztnQ64hsKnSJ5WPZxbMOMt3lTWXhJIdlNb
	b5ESh7pwH1KrvreYhWW93tPli4E+ebzgsF0aOP6nL4pJMxVTCKIWpKTpsWrryt+UKns0xfqWlxO
	Bci3CNgHDGEviD9pWqMqCbQoL75XHHlE1rJeF69Cjta4n4Y8KhQ+npvl4fFGHo4DQGhE/yFjvd7
	2qQsdjlyw9KkuVZxHVnEr4DuOWlrYjQdTYSttUvfDpwoRi//RO1f+7Enmc6KyUY/lHQ0zySknUs
	E34wNzhX7EkOF3xBO4RXV6jGms79zuM1TKiLG2YCgHi0dmpg=
X-Google-Smtp-Source: AGHT+IHGLmXc0ur50kXNPdlU5gfKgfT19cS/P5/yviC69hxHa8rxLZvwITKqg8YCs/CF2equlVXJFw==
X-Received: by 2002:a5d:64ed:0:b0:3a4:e8c8:fb9e with SMTP id ffacd0b85a97d-3a4f7aaf9d5mr11601961f8f.49.1748931121111;
        Mon, 02 Jun 2025 23:12:01 -0700 (PDT)
Message-ID: <d08a45cd-2e63-4f6a-81ef-2a3702cdba97@suse.com>
Date: Tue, 3 Jun 2025 08:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] xen/console: remove max_init_domid dependency
To: Stefano Stabellini <sstabellini@kernel.org>, dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com
References: <20250530231841.73386-1-dmukhin@ford.com>
 <20250530231841.73386-4-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2506021733330.1147082@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2506021733330.1147082@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2025 02:36, Stefano Stabellini wrote:
> On Fri, 30 May 2025, dmkhn@proton.me wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -2461,6 +2461,39 @@ void domid_free(domid_t domid)
>>      spin_unlock(&domid_lock);
>>  }
>>  
>> +/*
>> + * Find the ID of the next possible console owner domain.
>> + *
>> + * @return Domain ID: DOMID_XEN or non-system domain IDs within
>> + * the range of [0..DOMID_FIRST_RESERVED-1].
>> + */
>> +domid_t domid_find_with_input_allowed(domid_t hint)
>> +{
>> +    domid_t domid = DOMID_XEN;
>> +
>> +    if ( hint < DOMID_FIRST_RESERVED )
>> +    {
>> +        struct domain *d;
>> +
>> +        rcu_read_lock(&domlist_read_lock);
>> +
>> +        for ( d = domid_to_domain(hint);
>> +              d && get_domain(d) && d->domain_id < DOMID_FIRST_RESERVED;
> 
> The get_domain(d) worries me because it is increasing the domain's
> refcnt but I don't see a corresponding call to put_domain to decrease
> it.
> 
> If I keep rotating between consoles, I could keep increasing refcnt
> indefinitely?
> 
> I think we either need a corresponding put_domain(d) call when the domain
> loses input focus, or we remove the get_domain(d) based on the fact that
> we don't need it. I think before this patch we didn't increment refcnt
> when a domain has focus but I am not sure it was correct.

I think it was. The code was - aiui - specifically prepared to deal with
domains going away behind its back. A domain having input focus should
not prevent it from being (fully) destroyed.

Jan

