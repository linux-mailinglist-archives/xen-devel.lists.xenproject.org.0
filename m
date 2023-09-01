Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7878278FF43
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 16:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594625.927999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc5BD-0001SX-7f; Fri, 01 Sep 2023 14:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594625.927999; Fri, 01 Sep 2023 14:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc5BD-0001PI-4P; Fri, 01 Sep 2023 14:31:23 +0000
Received: by outflank-mailman (input) for mailman id 594625;
 Fri, 01 Sep 2023 14:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OLXw=ER=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qc5BB-0001PC-G3
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 14:31:21 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c71e56-48d4-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 16:31:19 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c8321c48fso7782f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Sep 2023 07:31:18 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.203.220])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a056000181200b00317f29ad113sm5370740wrh.32.2023.09.01.07.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 07:31:16 -0700 (PDT)
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
X-Inumbo-ID: 36c71e56-48d4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693578678; x=1694183478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lTlmZTcTjXXm0dN15dhdczx3GEuymgxpFJn2+Kqce8g=;
        b=zvteF4qSkQZu2Y3SxIVFar8gL21Ku+lcq1pz4DhrRKbmL3DsIe2qhjpf8qsQD8FLCW
         bOeO0KIE6HXNYpCgPDovVlHdWpNqi57Yr6/7X3jsI+C1dzXG2wIwymc6qC6mVmlse6AP
         BpWrG2ZGmZwkyKpOoNf1QPJDn3L4P3B9/3lA6NiUVo2P81MXNH9YJdGzv28D0+wNO5hY
         KX2t+G4Ih77Re2jwDU6+QLI1bzYXexrE/jlVwjBakA14h91K7UURMgMfjU1v4DAaSP2l
         LdoR1PUPz+kTDYL5jlUZur42pEFa1nJUzCRX4wlYW7LKRWouIARa4xw0Kmoz9zf8ht+3
         u8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693578678; x=1694183478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTlmZTcTjXXm0dN15dhdczx3GEuymgxpFJn2+Kqce8g=;
        b=EgRGl3Z61KDgilLJGSnnRHr8dh1MWnov76wP109lO8ooW5KFrAubzw4c5RT+96G6Of
         FEJysXJQUgwkLN+/3ID/5SID0yX5y5AHYPmJv+iOMnZRlYEoLKX6s58pGdRYuxbIpRom
         Wpq9Hb9ZCuoKaqIgE/c96xOkIPi4dy0fsE+DglP+i/04nNKrODOGRx9MFkAfUjnnMLlu
         xo4ZxczqisWFd71xct5JlbtetnnF5XmVe3yhLhjQpvw6mebH/9yqOjmLG/L+ovD86oUS
         qGizJFYjtIGG082gtE+QAU2qDYHn+AyJLnZ/zmvoSBRf3lWBIOqKEcsP0APxgplqPjeX
         zoTQ==
X-Gm-Message-State: AOJu0Ywm6UtJtc8QypxmFlQTMkterOPrWV4HO0Ve/zs971eSK7+vOkbg
	mbO27gSuDzjAFKivraPWUbSLtw==
X-Google-Smtp-Source: AGHT+IEBBN9CCsn9YltN2F0V7LF3Z5GRBPMVLtPg4poVoLEEKPmPVtqhAv3tXZryDsJq5nVnF/yeGQ==
X-Received: by 2002:a5d:69cf:0:b0:319:7ec8:53ba with SMTP id s15-20020a5d69cf000000b003197ec853bamr2219654wrw.14.1693578677580;
        Fri, 01 Sep 2023 07:31:17 -0700 (PDT)
Message-ID: <a577e600-5bd9-2b6b-d4e6-5486df10bdb8@linaro.org>
Date: Fri, 1 Sep 2023 16:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com, pl@kamp.de,
 sw@weilnetz.de, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com, thuth@redhat.com, stefanha@redhat.com, fam@euphon.net,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 kraxel@redhat.com, qemu-block@nongnu.org, xen-devel@lists.xenproject.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-8-armbru@redhat.com>
 <vfkfi6uld3gbd4urmqdlzkv6djtws6mkbluc5qvwcla6btszhu@ff66zfyd7smm>
 <7b8a4589-7f29-e564-4904-9b1a4fd342af@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7b8a4589-7f29-e564-4904-9b1a4fd342af@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/9/23 14:59, Cédric Le Goater wrote:
> On 8/31/23 16:30, Eric Blake wrote:
>> On Thu, Aug 31, 2023 at 03:25:46PM +0200, Markus Armbruster wrote:
>>
>> [This paragraph written last: Bear with my stream of consciousness
>> review below, where I end up duplicating some of the conslusions you
>> reached before the point where I saw where the patch was headed]
>>
>>> Variables declared in macros can shadow other variables.  Much of the
>>> time, this is harmless, e.g.:
>>>
>>>      #define 
>>> _FDT(exp)                                                  \
>>>          do 
>>> {                                                           \
>>>              int ret = 
>>> (exp);                                           \
>>>              if (ret < 0) 
>>> {                                             \
>>>                  error_report("error creating device tree: %s: %s",   \
>>>                          #exp, 
>>> fdt_strerror(ret));                      \
>>>                  
>>> exit(1);                                               \
>>>              
>>> }                                                          \
>>>          } while (0)
>>
>> Which is why I've seen some projects require a strict namespace
>> separation: if all macro parameters and any identifiers declared in
>> macros use either a leading or a trailing _ (I prefer a trailing one,
>> to avoid risking conflicts with libc reserved namespace; but leading
>> is usually okay), and all other identifiers avoid that namespace, then
>> you will never have shadowing by calling a macro from normal code.
> 
> I started fixing the _FDT() macro since it is quite noisy at compile.
> Same for qemu_fdt_setprop_cells(). So are we ok with names like 'ret_'
> and 'i_' ? I used a 'local_' prefix for now but I can change.

See 
https://lore.kernel.org/qemu-devel/20230831225607.30829-12-philmd@linaro.org/


