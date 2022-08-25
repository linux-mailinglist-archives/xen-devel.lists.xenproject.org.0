Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B003D5A0AE7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 10:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393132.631887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7oY-0000yl-0N; Thu, 25 Aug 2022 08:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393132.631887; Thu, 25 Aug 2022 08:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR7oX-0000wj-Te; Thu, 25 Aug 2022 08:02:09 +0000
Received: by outflank-mailman (input) for mailman id 393132;
 Thu, 25 Aug 2022 08:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XMKu=Y5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oR7oV-0000wb-S0
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 08:02:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 363e3211-244c-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 10:02:06 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id sd33so16612562ejc.8
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 01:02:06 -0700 (PDT)
Received: from [192.168.1.10] (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a056402240800b0043cf2e0ce1csm4381580eda.48.2022.08.25.01.02.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:02:05 -0700 (PDT)
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
X-Inumbo-ID: 363e3211-244c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=17t4r+C7HgtqVECb30UP025RgnWcuV6rBOetB8h9X0M=;
        b=Id6x+4fYlPW/sgN+/0qbbJgK7LJ0jioa96QrFe0AGgka6dVvRPLVuvFTPTVQ5zNHg+
         iHNQ26etP0ieCWF4KfP/klCfag1kw2Aa9DEHnjsegzkihRxKPCVBaESu1w5VF8KSi1eK
         h7ff87J0g/721HfsmpBZJvcKYeCLLhu1dg5GLWgSKDshZiX8rOZitpIY7kivG74+x7Xd
         2JrZugf1eOAWPV2TEJOwsk66/88WQFL/d8mNIIvrimnf/RkdGqGvitOCZ02uhpK0V8w4
         tArq/pjNOdi9301r7dpZcOtHPSAX38iNAOWkiU5+wvTu6x6u8FTRZ3iu80IaJDEr10gh
         NkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=17t4r+C7HgtqVECb30UP025RgnWcuV6rBOetB8h9X0M=;
        b=CqwX3u7Uzhm9u5sya0HKvsdElECBRS31trgIVPBEUtDPNTvqrvIke+NYu8z8NVEsxm
         LlZ026l6kDEhBn4lrgji3BBHCU5HZFUNIxkEvteSVorZGf3qKJMjGjqJr1ZXb8KQ9rn5
         VE0TNTJGlsmUJ/zAf9oPb53PH52tLSde5zpefwjrSYTs92ny/GKqA9mjUzX/Jiy/tc37
         tFaIlqP5waaYsaRwkgq8KR8yHW4BgyK4yMzEHadvII9i9wz0wXZoVW80oqtvfvLvKCvT
         8UpQZ3m6o2B6EjHAU+0UghNyB8d79bwK+kHA4ewVk/dFvtD4l4Cq7AFwnhZnjbf6K7VE
         3otA==
X-Gm-Message-State: ACgBeo02myRgg+D/73pY4hwicrtF35KDLvYDHav2bkN2+XmKhQ2hPA8e
	yDHFQitX3FOO/XE8Qq4EkiOHEgl1xRQ=
X-Google-Smtp-Source: AA6agR4U7qIjbcNYTV8VlD87TzK84xze9ZEbg7vggYJU8UIYcOo0La0eC/yFcPKdUTeWOrhm+vIzxQ==
X-Received: by 2002:a17:907:eaa:b0:73d:9d0a:702f with SMTP id ho42-20020a1709070eaa00b0073d9d0a702fmr1678806ejc.713.1661414526274;
        Thu, 25 Aug 2022 01:02:06 -0700 (PDT)
Message-ID: <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com>
Date: Thu, 25 Aug 2022 11:02:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
 <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
 <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/22/22 14:48, Jan Beulich wrote:
> On 22.08.2022 12:43, Xenia Ragiadakou wrote:
>> On 8/22/22 12:59, Jan Beulich wrote:
>>> On 19.08.2022 21:43, Xenia Ragiadakou wrote:
>>>> In macros dt_for_each_property_node(), dt_for_each_device_node() and
>>>> dt_for_each_child_node(), add parentheses around the macro parameters that
>>>> have the arrow operator applied, to prevent against unintended expansions.
>>>
>>> Why is this relevant only when -> is used? For comparisons and the rhs of
>>> assignments it's as relevant, ad even for the lhs of assignments I doubt
>>> it can be generally omitted.
>>
>> Yes, I agree with you but some older patches that I sent that were
>> adding parentheses around the lhs of the assignments were not accepted
>> and I thought that the rhs of the assignments as well these comparisons
>> fall to the same category.
>>
>> Personally, I would expect to see parentheses, also, around the macro
>> parameters that are used as the lhs or the rhs of assignments, the
>> operands of comparison or the arguments of a function.
>> Not only because they can prevent against unintentional bugs but because
>> the parentheses help me to identify more easily the macro parameters
>> when reading a macro definition. I totally understand that for other
>> people parentheses may reduce readability.
> 
> Afair Julien's comments were very specific to the lhs of assignments.
> So at the very least everything else ought to be parenthesized imo.
> 

So, IIUC, the only deviations from the MISRA C 2012 Rule 20.7 will be 
for macro parameters used as the lhs of assignments and function arguments?

This feels a bit of a hack to parenthesize the macro parameters that are 
used as the rhs of an assignment but not those used as the lhs.
 From previous discussions on the topic, I understood that the 
parentheses are considered needed only when they eliminate operator 
precedence problems, while for the wrong parameter format bugs we can 
rely on the reviewers.

I think we need to decide if the rule will be applied as is and if not 
which will be the deviations along with their justification and add it 
to the document.

-- 
Xenia

