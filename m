Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC42FF35D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 19:43:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72349.130203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2euz-0004P3-Ux; Thu, 21 Jan 2021 18:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72349.130203; Thu, 21 Jan 2021 18:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2euz-0004Oe-Ra; Thu, 21 Jan 2021 18:42:53 +0000
Received: by outflank-mailman (input) for mailman id 72349;
 Thu, 21 Jan 2021 18:42:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/JE=GY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2euy-0004OZ-KO
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 18:42:52 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f1ff097-15af-4114-b120-22ab80402a28;
 Thu, 21 Jan 2021 18:42:51 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id i17so3707184ljn.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 10:42:51 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m25sm607864lfb.144.2021.01.21.10.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 10:42:49 -0800 (PST)
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
X-Inumbo-ID: 1f1ff097-15af-4114-b120-22ab80402a28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7htKpng1+LMCK2NbODLg5KabNKwv5bf7TBluU5tE0BM=;
        b=fUBM6OeR28YLs8ttPB04zMf5WWBGW1D+1uU1FL/RZhlyHChpYtDRShnZD7IXLWV3Hj
         yghmp5l7W2sU6PnEV7akM7ZwiRxSwvQVH4/FJkfFLXB+RyBzETswgeHlFbMPXmhQ4hWR
         AJMSm3gS2u+hO/mMDxUGpZducZPyjV3KEz1rJ/q3+yJk5H1ee1WgfHasUTvivDWuzdbw
         oks9+k2dJ4chwzmO5xPic1DsOplXSLafmdGFzBJou5kxwlm6Q3ra3yvnb5GWdxDKJeCR
         w6wZK6LMzWuPWSHVnK5LJnECOmqk2YtR8dIweA0Fx2X6AKehyr+w6gEDKFjs1qZnVJsz
         TvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7htKpng1+LMCK2NbODLg5KabNKwv5bf7TBluU5tE0BM=;
        b=LXEiCA4viWHliknhzIAo3KHg0wotaISYPvCdsWpu2/R76YBzXmF7fKLTbwLQ/D6t2P
         LyJcloTJux6mGTmHAjb2BdKSxWALOnU+Zgjv6Z9F8iaE+jm+WGv5LoYGTHsmiRYvXxFG
         R5FYU+HR3/UuUv4xbKf/OiYcJr0FP5VvZ89NF3RzQ3NMNa3WdYw/SvtUSzGXBsujzMfo
         +rIA5qN5gP5dtXjgfbH5xnwBb8xQPn0H5FWQHVw5GpN3RJEsWvZ3I6lRmb2cbQR+AGNF
         G6fjqj+zOOmnA8wRhMJVzBNT9QT3KxRtnDExSEroiVZtwT9lQ/1dmPfEAy0CnudecUxi
         MWKA==
X-Gm-Message-State: AOAM530vzk/MWe5Ebq9qyXo8O5YLQ99CJYMQIIQWzjfDdADVJeYBbJYY
	nteXthr308XQ8sU3pYFC2avbz61uNKuhww==
X-Google-Smtp-Source: ABdhPJxjA2/UkARGtJgkS6sx01VUg8tFL+DKbF4LCHPaj6+/HBoVbpwWINGzKVSwYl+Nz7QZvQTdqQ==
X-Received: by 2002:a05:651c:11c4:: with SMTP id z4mr329419ljo.443.1611254570077;
        Thu, 21 Jan 2021 10:42:50 -0800 (PST)
Subject: Re: [PATCH V4 16/24] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-17-git-send-email-olekstysh@gmail.com>
 <1a706a1c-baed-b323-d772-dc35286bb4d2@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a3d8a36e-b661-f817-9182-bf38ed21646d@gmail.com>
Date: Thu, 21 Jan 2021 20:42:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1a706a1c-baed-b323-d772-dc35286bb4d2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 21.01.21 15:57, Jan Beulich wrote:

Hi Jan


> On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch implements reference counting of foreign entries in
>> in set_foreign_p2m_entry() on Arm. This is a mandatory action if
>> we want to run emulator (IOREQ server) in other than dom0 domain,
>> as we can't trust it to do the right thing if it is not running
>> in dom0. So we need to grab a reference on the page to avoid it
>> disappearing.
>>
>> It is valid to always pass "p2m_map_foreign_rw" type to
>> guest_physmap_add_entry() since the current and foreign domains
>> would be always different. A case when they are equal would be
>> rejected by rcu_lock_remote_domain_by_id(). Besides the similar
>> comment in the code put a respective ASSERT() to catch incorrect
>> usage in future.
>>
>> It was tested with IOREQ feature to confirm that all the pages given
>> to this function belong to a domain, so we can use the same approach
>> as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().
>>
>> This involves adding an extra parameter for the foreign domain to
>> set_foreign_p2m_entry() and a helper to indicate whether the arch
>> supports the reference counting of foreign entries and the restriction
>> for the hardware domain in the common code can be skipped for it.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> CC: Julien Grall <julien.grall@arm.com>
>> [On Arm only]
>> Tested-by: Wei Chen <Wei.Chen@arm.com>
> In principle x86 parts
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.


> However, being a maintainer of ...
>
>> --- a/xen/include/asm-x86/p2m.h
>> +++ b/xen/include/asm-x86/p2m.h
>> @@ -382,6 +382,22 @@ struct p2m_domain {
>>   #endif
>>   #include <xen/p2m-common.h>
>>   
>> +static inline bool arch_acquire_resource_check(struct domain *d)
>> +{
>> +    /*
>> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
>> +     * is not supported for translated domains on x86.
>> +     *
>> +     * FIXME: Until foreign pages inserted into the P2M are properly
>> +     * reference counted, it is unsafe to allow mapping of
>> +     * resource pages unless the caller is the hardware domain.
>> +     */
>> +    if ( paging_mode_translate(d) && !is_hardware_domain(d) )
>> +        return false;
>> +
>> +    return true;
>> +}
>
> ... this code, I'd like to ask that such constructs be avoided
> and this be a single return statement:
>
>      return !paging_mode_translate(d) || is_hardware_domain(d);

ok, looks better.


>
> I also think you may want to consider dropping the initial
> "The" from the comment. I'm further unconvinced "foreign
> entries" needs saying when set_foreign_p2m_entry() deals with
> exclusively such. In the end the original comment moved here
> would probably suffice, no need for any more additions than
> perhaps a simple "(see set_foreign_p2m_entry())".

ok

-- 
Regards,

Oleksandr Tyshchenko


