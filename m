Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A53589C67
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 15:16:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380371.614497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJahr-0006B3-1g; Thu, 04 Aug 2022 13:16:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380371.614497; Thu, 04 Aug 2022 13:16:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJahq-00068w-VB; Thu, 04 Aug 2022 13:16:06 +0000
Received: by outflank-mailman (input) for mailman id 380371;
 Thu, 04 Aug 2022 13:16:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x682=YI=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oJaho-000686-UM
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 13:16:05 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 979e069e-13f7-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 15:16:04 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so2470582wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 04 Aug 2022 06:16:04 -0700 (PDT)
Received: from ?IPV6:2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1?
 ([2a02:587:ac1d:6c00:8556:d1ea:dcb6:c7a1])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb4a000000b0021f1ec8776fsm1082502wrs.61.2022.08.04.06.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 06:16:03 -0700 (PDT)
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
X-Inumbo-ID: 979e069e-13f7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=1foZFtQiJq2I9YcKHTuZCW/mkYlqkJDtIEvbVGItEwA=;
        b=UzVDevk3x+hEAzCvAA04glCQzqqW9wMudosbmiVM5veUYtoZbO6Xw7yJVSZJWZPIbB
         MUV8GFe13E1oFkhoDykiMDMGuCNUioKTrT3JrAzDTxIh3ZPyXpzLecH4j8MhPRoeZbB6
         UYQHKc7GcnOvM3Om51wHT2scWg0nDBGDRp6HngPoexqL96ee2zd82ZxS0bk9uzItQbLu
         1eFh5xvfaxjcltUlvQYIGXHLe70gMHRiqNd7qkhnVaUc7iozIcjZomAiUT6/DA8H1obn
         GSRPDCNmsx3IbqOQC+XZy0nsKytjmnXsGa4xJVPrvdcjppuJYrqakPQF73iZD5vjS8OG
         7JYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=1foZFtQiJq2I9YcKHTuZCW/mkYlqkJDtIEvbVGItEwA=;
        b=i9fAnNq1bmw1GtxdzP98ey7OKwZVx0ZEbccZNazWSB4ECNdW9JuV7+SZOymXoboW94
         VKeWtdma/JFexNgDQev5Z3/JSizaMWwrxjFovKHV/WuSYkFMKJ71k0Iv/iFs6hijKRCx
         b6MpRu3zzNdh7cAfVZRSw8Tad34PsGR/CddkJ2y3W4+pkevXWiWx+IJh8qFklfJfS/sP
         3FhrC5tKV+PQw4fhZHyO6S9ScFOU6pA9EMvmQqk+k1bE/cuqL9DDXAoPFjTrkkTBSY/G
         K5ULLr5+S+KLtv4WfIko/Ve1lIua/6VTkDW21/Ccyy+chY2Emb0SjdWugS3GiAbARgcJ
         UU1g==
X-Gm-Message-State: ACgBeo3Agj4wxbIUaChuYkwHuHwDojLCNiWh+sCq0O3PQp58TC1oUznR
	hy1rFqCWUZjpKcs9sHncUPc=
X-Google-Smtp-Source: AA6agR7WS1a30SXSTI/tE9sGgU+7vmayB7JMfa/b77VInS9IgCSJudTbwLtiK7rZcHE3P76cWYlhsA==
X-Received: by 2002:a05:600c:510f:b0:3a3:254c:b081 with SMTP id o15-20020a05600c510f00b003a3254cb081mr6346684wms.65.1659618963665;
        Thu, 04 Aug 2022 06:16:03 -0700 (PDT)
Message-ID: <43bbcdfb-a6f7-53b3-e7dc-899ac9ea038c@gmail.com>
Date: Thu, 4 Aug 2022 16:16:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] xen/hypfs: check the return value of snprintf to avoid
 leaking stack accidently
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220804124736.1827246-1-burzalodowa@gmail.com>
 <be627b72-9f68-2deb-5639-2e7731f3e8a6@suse.com>
 <d7e0a598-d642-6227-09e3-51d3994ae359@gmail.com>
 <81276568-232d-b068-0237-f888ecb1ca91@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <81276568-232d-b068-0237-f888ecb1ca91@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/4/22 16:13, Jan Beulich wrote:
> On 04.08.2022 15:10, Xenia Ragiadakou wrote:
>> On 8/4/22 16:01, Jan Beulich wrote:
>>> On 04.08.2022 14:47, Xenia Ragiadakou wrote:
>>>> Changes in v2:
>>>> - add ASSERT_UNREACHABLE()
>>>
>>> Hmm, this ...
>>>
>>>> --- a/xen/common/hypfs.c
>>>> +++ b/xen/common/hypfs.c
>>>> @@ -377,8 +377,10 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
>>>>        unsigned int e_namelen, e_len;
>>>>    
>>>>        e_namelen = snprintf(name, sizeof(name), template->e.name, id);
>>>> -    if ( e_namelen >= sizeof(name) )
>>>> +    if ( e_namelen >= sizeof(name) ) {
>>>> +        ASSERT_UNREACHABLE();
>>>>            return -ENOBUFS;
>>>> +    }
>>>
>>> ... looks to be an incremental patch on top of v1, not v2 of that
>>> patch?
>>
>> So, here, IIUC, I have to create a patch series and add the assert in
>> the second (2/2) patch? What should be the version number of the series?
> 
> No, why? Simply fold this change into the earlier one, and call the
> result v3.

Okkk, I just realized what I have done.

-- 
Xenia

