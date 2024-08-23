Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8DE95D625
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 21:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782640.1192167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha84-0005k1-Hx; Fri, 23 Aug 2024 19:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782640.1192167; Fri, 23 Aug 2024 19:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sha84-0005i5-FN; Fri, 23 Aug 2024 19:39:24 +0000
Received: by outflank-mailman (input) for mailman id 782640;
 Fri, 23 Aug 2024 19:39:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sha83-0005hz-N2
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 19:39:23 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65417869-6187-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 21:39:22 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6bf6755323cso13256306d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 12:39:22 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d49572sm21725276d6.33.2024.08.23.12.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 12:39:20 -0700 (PDT)
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
X-Inumbo-ID: 65417869-6187-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724441961; x=1725046761; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IIFrbXHD2yrd19PjwqR8w1LRcwaKCmmuTwEs+GhJInw=;
        b=wYEBjlQ8Qz8vFoDbqcEtUcW/035JXqJ/Kvy+wo/sbw7Twvd/DTmj3CtIJy/4y/H29o
         7IhSVc7C4ZaqzJ/isYvkc/y7s02t9VRR553QeaQCXMeQFa7pOeApxk5aOlWNNPCiu14T
         SXnWsNgtLRawpdpQx0qBCChG4e5i/hYqjiyjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724441961; x=1725046761;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIFrbXHD2yrd19PjwqR8w1LRcwaKCmmuTwEs+GhJInw=;
        b=pOscSWn/F5cSXt31rCyroZNHYWM4tfH2gtxACCCrj3gjx+NUOUp63TmMRjr58vO2Mf
         3uatPQCATiy0hZRykVPrU/Z30kAE8KGEa7ot0/2H7WC/APOZ8S1RyW785jOHUhS+7XyV
         at8O2rKaB6314Bf7Ma5IZe17mTvSwTpBI5VY/h2Y+xWij8JcAHguF1MPzuBuOeSGDsG3
         wurTaYAFM4eTTl/QQhd24IlZKkk68/DYK+vZeu+PdpZcc5xh3k80FI0CiWWNJxpbT6Mp
         nI9Er2iDEz3Lcf0STMX1dlnEBnF2SgWNRSyzIox1ZMBY2uayvKQmBZcML5+h9aFgH0QP
         RUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVImK0twDga83MCRBB6/4scRncbicGYHBWHc1nwT/pXNY6ivMvLtOtN0/O7FmKg1eN3AeJW4WyD7bE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcQiEahxawDNSB+uo+oGdUZ+rcfm53Q4EOFu8gnU5eLlGcMqtZ
	J8GN9ACGc4kX5o38Iw88738OdjOR0TrJ6R765tmRUMYNT2tHrLNQXoXoxu66vwI=
X-Google-Smtp-Source: AGHT+IFBE8YYikpO6Wsf1OmX/j+Zi7Lzceo4yX/ZH50RS4aweRi/I/SUnuTfeX5gPmx5aGiSDSBSfA==
X-Received: by 2002:a05:6214:5713:b0:6bf:8833:e9c3 with SMTP id 6a1803df08f44-6c16deb2529mr38558176d6.50.1724441961146;
        Fri, 23 Aug 2024 12:39:21 -0700 (PDT)
Message-ID: <fadfcb8b-5799-46e0-a0d8-944077c3329d@citrix.com>
Date: Fri, 23 Aug 2024 20:39:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? 3/6] xen/macros: Introduce BUILD_ERROR()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-4-andrew.cooper3@citrix.com>
 <1fe765d7-65c4-4f04-8835-327a0b623010@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1fe765d7-65c4-4f04-8835-327a0b623010@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 10:23 am, Jan Beulich wrote:
> On 25.06.2024 21:07, Andrew Cooper wrote:
>> --- a/xen/include/xen/macros.h
>> +++ b/xen/include/xen/macros.h
>> @@ -59,6 +59,8 @@
>>  #define BUILD_BUG_ON(cond) ((void)BUILD_BUG_ON_ZERO(cond))
>>  #endif
>>  
>> +#define BUILD_ERROR(msg) asm ( ".error \"" msg "\"" )
> I think this wants a comment, and one even beyond what is said for
> BUILD_BUG_ON(). This is primarily to make clear to people when to use
> which, i.e. I consider it important to mention here that it is intended
> for code which, in the normal case, we expect to be DCE-d. The nature
> of the condition used is also a relevant factor, as in some cases
> BUILD_BUG_ON() simply cannot be used because something that really is
> compile time constant isn't an integer constant expression. With
> something to this effect:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Done, thanks.

>
> I have another question / suggestion, though.
>
>> --- a/xen/include/xen/self-tests.h
>> +++ b/xen/include/xen/self-tests.h
>> @@ -22,9 +22,9 @@
>>          typeof(fn(val)) real = fn(val);                                 \
>>                                                                          \
>>          if ( !__builtin_constant_p(real) )                              \
>> -            asm ( ".error \"'" STR(fn(val)) "' not compile-time constant\"" ); \
>> +            BUILD_ERROR("'" STR(fn(val)) "' not compile-time constant"); \
>>          else if ( real != res )                                         \
>> -            asm ( ".error \"Compile time check '" STR(fn(val) == res) "' failed\"" ); \
>> +            BUILD_ERROR("Compile time check '" STR(fn(val) == res) "' failed"); \
>>      } while ( 0 )
> While right here leaving the condition outside of the macro is
> perhaps more natural, considering a case where there's just an if()
> I wonder whether we shouldn't also (only?) have BUILD_ERROR_ON(),
> better paralleling BUILD_BUG_ON():

Right now none of the uses in this series, nor any of the MISRA
conversions away __bad_*() want an _ON() form.

Nothing stops us adding an _ON() form in the future if a reasonable
usecase appears, but right now there's no need.

~Andrew

