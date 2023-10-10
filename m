Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E687C0100
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 18:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615106.956303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqFAb-000882-LU; Tue, 10 Oct 2023 16:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615106.956303; Tue, 10 Oct 2023 16:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqFAb-00085Y-Iu; Tue, 10 Oct 2023 16:01:17 +0000
Received: by outflank-mailman (input) for mailman id 615106;
 Tue, 10 Oct 2023 16:01:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LWWS=FY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qqFAa-00085S-1k
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 16:01:16 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cda1dce-6786-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 18:01:14 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so6976931e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 09:01:13 -0700 (PDT)
Received: from [0.0.0.0] ([2001:41d0:8:52b7::])
 by smtp.gmail.com with ESMTPSA id
 vq2-20020a05620a558200b0076f058f5834sm4430898qkn.61.2023.10.10.09.01.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 09:01:12 -0700 (PDT)
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
X-Inumbo-ID: 3cda1dce-6786-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1696953673; x=1697558473; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UHTZ9PlEqk/tERxHhu/YAlyn2gDLSPNHlACUpmODSx8=;
        b=HyFc5ugJppU8bGrcaPfc8hbKtqEs3m5Z5s771QzaNdsCuTSnXlcWHVHlnhhm4f2yQ0
         TToXlFXMG56v+qGXxuNa51Cy/ky7a47lM+fpK6fuQoyHLNUF9OJhaZrl5GjCwnuYrJ3q
         w7DY4TFibLNma1yQWtZlIr5k+fZ367ufNZWX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696953673; x=1697558473;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHTZ9PlEqk/tERxHhu/YAlyn2gDLSPNHlACUpmODSx8=;
        b=Ok3aDcZ9SDxKDVF7RBB4ujlC4eRkOirngJG0Tt9oziLyBU6XduqOZEgxiRTsVoVrqY
         rfmYYVsPQQOR7oLmvul1Lrop0Tho0zxatfF8rTvBshP6JdZdQ5GQjjzhh6voKWDyDLJ0
         7eUmSsBvpKo1TPkzfh76B2g8acHSVUPtklvxvynq0gjtCiLiajUMOVdcTVU2mowm4KQ9
         6r+w0E1IZcAoAq0tTtvSb7J4vupCmUVCwOknlcGJo44mDE0mkz3aPv3pRUgvABRfPn+F
         mJV38HDhqy8Exb+bC+v6+jYUwz8+FWpF6KPBJh2PdQS9K/VrJp/ojdnF9vy50o7tVGAX
         kxZA==
X-Gm-Message-State: AOJu0YwEb4GxuGQi3DESUeBHr5JnQW/jvQTc0KZKYRyx75HhQXube9yj
	a/pVjhEwH7UtmbH0G2Kego37xQ==
X-Google-Smtp-Source: AGHT+IEVLtpP5vdooZSC5LSoSdCYD5TiU9Zhe23nooPO28EWnC1lUxgtnNguIk1B+PjYA7Vwkwu2Gw==
X-Received: by 2002:a05:6512:3da0:b0:500:7c51:4684 with SMTP id k32-20020a0565123da000b005007c514684mr19933334lfv.56.1696953673430;
        Tue, 10 Oct 2023 09:01:13 -0700 (PDT)
Message-ID: <9ee8d16c-d34c-45c2-b5f7-53725bdc01c8@citrix.com>
Date: Wed, 11 Oct 2023 00:00:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 9/9] xen/compat: address Rule 10.1 for macros
 CHECK_SIZE
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 jbeulich@suse.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <7edf60c0e7bd0680d8b8f8d3aec1264ee5a43878.1696514677.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310091749380.3431292@ubuntu-linux-20-04-desktop>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2310091749380.3431292@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/10/2023 9:02 am, Stefano Stabellini wrote:
> On Fri, 6 Oct 2023, Nicola Vetrini wrote:
>> The essential type of the result of an inequality operator is
>> essentially boolean, therefore it shouldn't be used as an argument of
>> the multiplication operator, which expects an integer.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/include/xen/compat.h | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/include/xen/compat.h b/xen/include/xen/compat.h
>> index f2ce5bb3580a..5ffee6a9fed1 100644
>> --- a/xen/include/xen/compat.h
>> +++ b/xen/include/xen/compat.h
>> @@ -151,12 +151,14 @@ CHECK_NAME_(k, n, T)(k xen_ ## n *x, \
>>      return x == c; \
>>  }
>>  
>> +#define SIZE_NEQUAL(a, b) \
>> +    (sizeof(a) != sizeof(b) ? 1 : 0)
>>  #define CHECK_SIZE(name) \
>> -    typedef int CHECK_NAME(name, S)[1 - (sizeof(xen_ ## name ## _t) != \
>> -                                         sizeof(compat_ ## name ## _t)) * 2]
>> +    typedef int CHECK_NAME(name, S)[1 - (SIZE_NEQUAL(xen_ ## name ## _t, \
>> +                                                     compat_ ## name ## _t)) * 2]
>>  #define CHECK_SIZE_(k, n) \
>> -    typedef int CHECK_NAME_(k, n, S)[1 - (sizeof(k xen_ ## n) != \
>> -                                          sizeof(k compat_ ## n)) * 2]
>> +    typedef int CHECK_NAME_(k, n, S)[1 - (SIZE_NEQUAL(k xen_ ## n, \
>> +                                                      k compat_ ## n)) * 2]
> I think this style is easier to read but I'll let the x86 maintainers
> decide
>
>     typedef int CHECK_NAME(name, S)[(sizeof(xen_ ## name ## _t) == \
>                                      sizeof(compat_ ## name ## _t)) ? 1 : -1]
>
> Also am I reading this correctly that we are using -1 as array index? I
> must have made a calculation mistake?

This is a NIH BUILD_BUG_ON().  It should be rewritten as

BUILD_BUG_ON(sizeof(xen ...) != sizeof(compat ...));

which will use _Static_assert() in modern compilers.

~Andrew

