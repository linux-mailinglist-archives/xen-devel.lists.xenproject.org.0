Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C32A6021
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18909.44016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEkS-00062y-6G; Wed, 04 Nov 2020 09:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18909.44016; Wed, 04 Nov 2020 09:06:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEkS-00062Q-2W; Wed, 04 Nov 2020 09:06:32 +0000
Received: by outflank-mailman (input) for mailman id 18909;
 Wed, 04 Nov 2020 09:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d6HI=EK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kaEkP-00060O-Qb
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:06:29 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13280b07-5125-48ab-9d03-1b5a2930a113;
 Wed, 04 Nov 2020 09:06:23 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s30so3861232lfc.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:06:23 -0800 (PST)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
 by smtp.gmail.com with ESMTPSA id n23sm349389lfe.210.2020.11.04.01.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 01:06:22 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=d6HI=EK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kaEkP-00060O-Qb
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:06:29 +0000
X-Inumbo-ID: 13280b07-5125-48ab-9d03-1b5a2930a113
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13280b07-5125-48ab-9d03-1b5a2930a113;
	Wed, 04 Nov 2020 09:06:23 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id s30so3861232lfc.4
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=axTLjJW9pP5qcu9UM7eUKbFLNLSswfMDMuK1tEN4aa8=;
        b=pzS7j4KK5si2KPo7uwgcoPd9rlGFqnz1LjGZtCazdpSnZx9nuoC205qSJm7vlWdFuh
         8wILrkB9eKslJG6NctTJ61K5gSdMYNUdiFpGfwI3FkpbekuwTNtPgdyoC7nCFRRnf3qI
         YrvWZNy4PZhEgd5skCPvpyIQwip1Y0v1EE2C2iPkay2Tv2BgCfBwlgbxdPXQlTbWmMCN
         HWYEYj2UKpFpDYxJbivMtBZsur7jVgAKR4exPIC+lufI2Zv7EWHheqz9ScAzjoi8LbU9
         m9FpBmOq6f535rOPbia126aHQao88T0ZkDg8EY5mb11nkyy3faa7sBwtZsqlpr5GS5o2
         ITpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=axTLjJW9pP5qcu9UM7eUKbFLNLSswfMDMuK1tEN4aa8=;
        b=teZGehzjYRexU0VAwLxl09bxUpyqsy6ayHxwgx/IodTzpJEeg2cDsgbbQKz2/CZ3Q4
         c3WGTkCROJH4g/TfP9QUH39Us6MC4cR58S7vz8MKjvNM7TsvYaFRjd/QTRgjUjSsq3/P
         tSVnZuoLq6F5NaFJwDXcH3SN0CPgFadN00GumI0H6mcpcquEu1fYWO3AICCIlzjhpS/A
         FDkP5wQGwZ3+wt533i5wNd23fZ4zYUOcKTimeQvkWXFcsTWrX1rgBLFMysW4kfhfLcAL
         9TF7QnNgK9rBmekOswJ4OT6sNvSF4fRLULZOJPi+L3Qx7waZx09LXNIcZSRZ5BywvFBp
         T77w==
X-Gm-Message-State: AOAM531R9foCBQEXpWf/Y0LKsmRNG7B8C3hzLxMIOUSq6xmOjmlkSeFo
	9cxLelZ1SVygfrrwunHsOIU=
X-Google-Smtp-Source: ABdhPJytUl2YF8xoDU181hAQYEzfF9rGbPL42yGnM/scNRtyLavk99yogN8o1jzsIt/ZnLJPDA5ykA==
X-Received: by 2002:a05:6512:3052:: with SMTP id b18mr8239333lfb.505.1604480782765;
        Wed, 04 Nov 2020 01:06:22 -0800 (PST)
Received: from [100.64.112.11] (ll-18.209.223.85.sovam.net.ua. [85.223.209.18])
        by smtp.gmail.com with ESMTPSA id n23sm349389lfe.210.2020.11.04.01.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 01:06:22 -0800 (PST)
Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
 <003c01d6a6b0$8c418f50$a4c4adf0$@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3dd55087-0c07-c9f3-e80a-8b136c226475@gmail.com>
Date: Wed, 4 Nov 2020 11:06:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003c01d6a6b0$8c418f50$a4c4adf0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.10.20 10:13, Paul Durrant wrote:

Hi Paul.

Sorry for the late response.

>> +
>> +/* Called when target domain is paused */
>> +static inline void arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
>> +{
>> +    p2m_set_ioreq_server(s->target, 0, s);
>> +}
>> +
>> +/*
>> + * Map or unmap an ioreq server to specific memory type. For now, only
>> + * HVMMEM_ioreq_server is supported, and in the future new types can be
>> + * introduced, e.g. HVMMEM_ioreq_serverX mapped to ioreq server X. And
>> + * currently, only write operations are to be forwarded to an ioreq server.
>> + * Support for the emulation of read operations can be added when an ioreq
>> + * server has such requirement in the future.
>> + */
>> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>> +                                                   ioservid_t id,
>> +                                                   uint32_t type,
>> +                                                   uint32_t flags)
>> +{
>> +    struct hvm_ioreq_server *s;
>> +    int rc;
>> +
>> +    if ( type != HVMMEM_ioreq_server )
>> +        return -EINVAL;
>> +
>> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>> +        return -EINVAL;
>> +
>> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
>> +
>> +    s = get_ioreq_server(d, id);
>> +
>> +    rc = -ENOENT;
>> +    if ( !s )
>> +        goto out;
>> +
>> +    rc = -EPERM;
>> +    if ( s->emulator != current->domain )
>> +        goto out;
>> +
>> +    rc = p2m_set_ioreq_server(d, flags, s);
>> +
>> + out:
>> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>> +
>> +    if ( rc == 0 && flags == 0 )
>> +    {
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>> +
>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
> The above doesn't really feel right to me. It's really an entry point into the ioreq server code and as such I think it ought to be left in the common code. I suggest replacing the p2m_set_ioreq_server() function with an arch specific function (also taking the type) which you can then implement here.

Agree that it ought to be left in the common code.

However, I am afraid I didn't entirely get you suggestion how this 
function could be split. On Arm struct p2m_domain doesn't contain IOREQ 
fields (p2m->ioreq.XXX), nor p2m_change_entry_type_global() is used, so 
they should be abstracted together with p2m_set_ioreq_server().

So the whole "if ( rc == 0 && flags == 0 )" check should be folded into 
arch_p2m_set_ioreq_server implementation on x86? This in turn raises a 
question can we put a spin_unlock after.

I am wondering would it be acceptable to replace 
hvm_map_mem_type_to_ioreq_server by 
arch_hvm_map_mem_type_to_ioreq_server here and have the following in the 
common code:

int hvm_map_mem_type_to_ioreq_server(struct domain *d,
                                      ioservid_t id,
                                      uint32_t type,
                                      uint32_t flags)
{
     return arch_hvm_map_mem_type_to_ioreq_server(d, id, type, flags);
}


>
> The rest of the patch looks ok.

Thank you.

-- 
Regards,

Oleksandr Tyshchenko


