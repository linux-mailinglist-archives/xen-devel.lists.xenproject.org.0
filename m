Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3279431A9
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768781.1179665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9zB-0005YK-Up; Wed, 31 Jul 2024 14:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768781.1179665; Wed, 31 Jul 2024 14:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9zB-0005VI-S4; Wed, 31 Jul 2024 14:07:25 +0000
Received: by outflank-mailman (input) for mailman id 768781;
 Wed, 31 Jul 2024 14:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/qb=O7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sZ9zA-0005TA-Op
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:07:24 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3584e31e-4f46-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 16:07:23 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a7a94aa5080so681794066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 07:07:23 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad91075sm771904466b.168.2024.07.31.07.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 07:07:22 -0700 (PDT)
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
X-Inumbo-ID: 3584e31e-4f46-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722434843; x=1723039643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FjZ4zKrTVE02CIFl2QtucXqR067v1+j3M5J1TjNg8Q8=;
        b=mSkN5R9WbULwFmO2bHQf4LTWxNwD7mcxuK6dKyomEsabC5w4YWKR9yw+zWYwxPX8YC
         OMPCqs3MC10eqV+EEjACtXlI9IdD9gqWBA56Dutz7VGSz/VLYQy+gaCbLOdCo4A0tGHc
         gkaTAx0VZwv++2ztIi1SAtwAqvQEv3sDSjfDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722434843; x=1723039643;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjZ4zKrTVE02CIFl2QtucXqR067v1+j3M5J1TjNg8Q8=;
        b=xGLc6WIxPhqXxw84svY4AeiLt3F7QssQEg6lbu1i3D3tPVaXmJYT2CpUAfn4ulcDzA
         SQyUri/Ncv/H46HiSHQE/2oNivXb910o68Eo9yqQ1jGNT69acQIhFrSoW8+iz4K/h5Om
         lq6Utm0IBqkEGRRYe6TA/j85VLIisvfBNb/5s0WWhmNKxklPZiOl7UjhgB3WBfm3ZmoP
         hPRdyU7iFG0uUZ5LIE90WLouo5HxbvARb9rGOll1dP9jdP4jAZ2TW3fH8KbZ0rmZcZ3C
         jb5XNoVSdMyp5hcTBHFnpjCJMWZGqBwyD5t6RXybazjpus9GXOaSyYIAmgOQi+kQ+uZF
         QvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUr17GseyU7umteAKID9hYmdgDfrVRHWY4VzwCHA0+6WF9sBe8MYTQ97baMe3MotZ0iIumj27nYjpeKq34XXfkhBSyTDkHaW+SR156K1U=
X-Gm-Message-State: AOJu0YwKtjlDWoepfvm17pcH8MwmcQyfsMV/EAgNuFrwh9uTl8M1zL4a
	d9QqKTwPoJPCaVb/bpfe/h/kTuO+571NNgCmSrxCLEB6tuSxrtuPvf+9fQunhz4=
X-Google-Smtp-Source: AGHT+IHZJmvN1E0sOAAKnui0Q+ECvK+XvDKk8E1oqGOmoWBcKE9PAtY73zMigkOkxGKdpeMevGvILg==
X-Received: by 2002:a17:907:968e:b0:a7a:9144:e251 with SMTP id a640c23a62f3a-a7d3fdb7e94mr1200381766b.11.1722434842939;
        Wed, 31 Jul 2024 07:07:22 -0700 (PDT)
Message-ID: <1de0e761-0c87-4a7f-a7a9-3c468489c410@citrix.com>
Date: Wed, 31 Jul 2024 15:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: Factor domlist_{insert,remove}() out of
 domain_{create,destroy}()
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240731120406.3429430-1-andrew.cooper3@citrix.com>
 <33cde4c7-e00a-47e0-b752-82e514df99d3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <33cde4c7-e00a-47e0-b752-82e514df99d3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/07/2024 1:14 pm, Jan Beulich wrote:
> On 31.07.2024 14:04, Andrew Cooper wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -64,6 +64,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
>>  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
>>  struct domain *domain_list;
>>  
>> +/*
>> + * Insert a domain into the domlist/hash.  This allows the domain to be looked
>> + * up by domid, and therefore to be the subject of hypercalls/etc.
>> + */
>> +static void domlist_insert(struct domain *d)
>> +{
>> +    struct domain **pd;
>> +
>> +    spin_lock(&domlist_update_lock);
>> +
>> +    /* domain_list is maintained in domid order. */
>> +    pd = &domain_list;
> Make this the initializer of the variable, if ...
>
>> +    for ( ; *pd != NULL; pd = &(*pd)->next_in_list )
> ... isn't to be the starting clause of the for()?

Ok.

>
>> +        if ( (*pd)->domain_id > d->domain_id )
>> +            break;
>> +
>> +    d->next_in_list = *pd;
>> +    d->next_in_hashbucket = domain_hash[DOMAIN_HASH(d->domain_id)];
>> +    rcu_assign_pointer(*pd, d);
>> +    rcu_assign_pointer(domain_hash[DOMAIN_HASH(d->domain_id)], d);
> Maybe worth putting the hash in a local variable?

Ok.

>
>> +    spin_unlock(&domlist_update_lock);
>> +}
>> +
>> +/*
>> + * Remove a domain from the domlist/hash.  This means the domain can no longer
>> + * be looked up by domid, and therefore can no longer be the subject of
>> + * *subsequent* hypercalls/etc.  In-progress hypercalls/etc can still operate
>> + * on the domain.
>> + */
>> +static void domlist_remove(struct domain *d)
>> +{
>> +    struct domain **pd = &domain_list;
>> +
>> +    spin_lock(&domlist_update_lock);
>> +
>> +    pd = &domain_list;
> pd already has an initializer.

Ah - that was a copy&paste error of mine.  I'll drop the initialiser.

The code I copied from strictly initialises *pd with the update lock
held.  As we're only taking the address of pointer, I think it's safe to
be outside, but its also just an LEA so also not interesting to
initialise outside.

> With at least the pd related adjustments
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

