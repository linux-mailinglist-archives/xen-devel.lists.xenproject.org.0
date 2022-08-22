Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5159BDBA
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 12:44:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391353.629145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ4u6-0000Uh-57; Mon, 22 Aug 2022 10:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391353.629145; Mon, 22 Aug 2022 10:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ4u6-0000S8-13; Mon, 22 Aug 2022 10:43:34 +0000
Received: by outflank-mailman (input) for mailman id 391353;
 Mon, 22 Aug 2022 10:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prSb=Y2=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oQ4u5-0000S2-3y
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 10:43:33 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43d0d389-2207-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 12:43:32 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id s11so13256297edd.13
 for <xen-devel@lists.xenproject.org>; Mon, 22 Aug 2022 03:43:32 -0700 (PDT)
Received: from [192.168.1.10] (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.gmail.com with ESMTPSA id
 ib3-20020a1709072c6300b00734b2169222sm3352440ejc.186.2022.08.22.03.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 03:43:30 -0700 (PDT)
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
X-Inumbo-ID: 43d0d389-2207-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=096+3G3xD5oB88fj4YcLx8/9PMKcgYHhecvKNISakeA=;
        b=KoZznTYBgeaJgx5+hS96OR1GkJwk95D1QF6xnIkmVIxII0U+ohKBHQ2/r0R4RbUUP0
         rntbAutBpTkQdNijhViJY3p+/HS7U7f1xbialvhQr+bqnnwB8w+HjyKJgYiA8XHjE9el
         hicm2jwp8bv+TQ6OH5jU58QPlE7vwza4Z+TJ1HkDevAJXmiw8+d3IVqTDTHDBJmzVIqW
         lECuRwk34U+NGB4uOcYs2+k+NcVoV6zW1CFHC/cX9LLeHBsBDdNjLT7aG5DTeTKWuQmi
         Pr8RpLbRY6ksV9Sb316v5vO5pxRaNpA4qoEE6bxpXjLABz+Gtiw09bVK36FPYjXJetVX
         4nOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=096+3G3xD5oB88fj4YcLx8/9PMKcgYHhecvKNISakeA=;
        b=GKLHafWgstPRZYH0UuR79xQJ3IWtortM4GBOHBHzksCVhwE9kIFE8j4FbfzgMY3asG
         G1y8pkUvtM41LC2PS7hLT6SSaJzxI7H3NcELISK8AsgCxhhRuJ727RDf4AEIYfMuAQfy
         4hSvS+xzQk9Pf2CLwyK9zhu3mH2Rv4AP04vpZvKEKZwKTx+Wm8rNRt1mNeijt2Ikzn1w
         j9jY3gxfnB1QyPBP1IychzZzPdp46QeyJQeBywTSmUtg3ywePHVb+s4s1tYAy7CK09Kd
         odEa2noBEecYATGFWNDEgFtvw4LhXhoPyJ+QEBQzRWw9kbEVr3tqq20aMKk5yWsT2mYc
         4YGA==
X-Gm-Message-State: ACgBeo12KH98u7B/kpa+PIVms/1lfiPcc2n33z2dK6eGDHyjg9RAY022
	CXP7nBihVuftwShAXmYlQEMInqKFDO4=
X-Google-Smtp-Source: AA6agR5o35TxgBHnv7+0Y4DwhkgucdDnssVqmWzhlwV66/jtOc2e999Vrb502troFrJxAF+6u26WvA==
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id c7-20020a0564021f8700b0043bb88d1d93mr15436171edc.314.1661165011189;
        Mon, 22 Aug 2022 03:43:31 -0700 (PDT)
Message-ID: <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
Date: Mon, 22 Aug 2022 13:43:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 8/22/22 12:59, Jan Beulich wrote:
> On 19.08.2022 21:43, Xenia Ragiadakou wrote:
>> In macros dt_for_each_property_node(), dt_for_each_device_node() and
>> dt_for_each_child_node(), add parentheses around the macro parameters that
>> have the arrow operator applied, to prevent against unintended expansions.
> 
> Why is this relevant only when -> is used? For comparisons and the rhs of
> assignments it's as relevant, ad even for the lhs of assignments I doubt
> it can be generally omitted.

Yes, I agree with you but some older patches that I sent that were 
adding parentheses around the lhs of the assignments were not accepted 
and I thought that the rhs of the assignments as well these comparisons 
fall to the same category.

Personally, I would expect to see parentheses, also, around the macro 
parameters that are used as the lhs or the rhs of assignments, the 
operands of comparison or the arguments of a function.
Not only because they can prevent against unintentional bugs but because 
the parentheses help me to identify more easily the macro parameters 
when reading a macro definition. I totally understand that for other 
people parentheses may reduce readability.

> 
>> --- a/xen/include/xen/device_tree.h
>> +++ b/xen/include/xen/device_tree.h
>> @@ -222,13 +222,13 @@ dt_find_interrupt_controller(const struct dt_device_match *matches);
>>   #define DT_ROOT_NODE_SIZE_CELLS_DEFAULT 1
>>   
>>   #define dt_for_each_property_node(dn, pp)                   \
>> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
>> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
>>   
>>   #define dt_for_each_device_node(dt, dn)                     \
>> -    for ( dn = dt; dn != NULL; dn = dn->allnext )
>> +    for ( dn = dt; dn != NULL; dn = (dn)->allnext )
>>   
>>   #define dt_for_each_child_node(dt, dn)                      \
>> -    for ( dn = dt->child; dn != NULL; dn = dn->sibling )
>> +    for ( dn = (dt)->child; dn != NULL; dn = (dn)->sibling )
>>   
>>   /* Helper to read a big number; size is in cells (not bytes) */
>>   static inline u64 dt_read_number(const __be32 *cell, int size)
> 

-- 
Xenia

