Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBE490D08E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 15:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743101.1150002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYyp-00040J-US; Tue, 18 Jun 2024 13:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743101.1150002; Tue, 18 Jun 2024 13:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJYyp-0003yc-Rj; Tue, 18 Jun 2024 13:34:35 +0000
Received: by outflank-mailman (input) for mailman id 743101;
 Tue, 18 Jun 2024 13:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=An5i=NU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJYyo-0003yG-8Q
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 13:34:34 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e38a50c-2d77-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 15:34:32 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5b9f9e7176eso2662481eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 06:34:32 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79a30cff770sm354577085a.3.2024.06.18.06.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 06:34:30 -0700 (PDT)
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
X-Inumbo-ID: 7e38a50c-2d77-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718717671; x=1719322471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CLnvtNLWT1SPBUo52qyhrmzGb9JB0iifrNjgzCoMNic=;
        b=en7liiBEy1smoqmgRsHCS2VlJlWtQLIPKM1jR0HfqvcBB1WxGRHw/yEZvMzCZE8Yeh
         +fsYyYbR5X1cUsGWH4T2CJ1VO+Joe8Cz1uqORtW5G+YhPwgWXtCiNZYHvZ6uqlOxUM4k
         Hm60cxn/FPQzTThJWahVxboGavsDdNVL/h3Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717671; x=1719322471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLnvtNLWT1SPBUo52qyhrmzGb9JB0iifrNjgzCoMNic=;
        b=V+SqG+Sw7ht8gJpc3PRzLdVgDe/dpsVtaI0l0HEPkr02pvVvzqHLVhw+OFYrosVCot
         oT0OR18XJKPXk4+WA/R2sVeJSC2GJq559yDXvNDejWPdveyEiqks4lgWdr9/yWrJPztI
         W6u1KayO14g+hJpfLtwUOp9bX9P4CrkUEzSkLISsaXs7CByZhUrRSl5yhOopcvgtRMbR
         MPN1geoeieId2XIJvGW89AZzWfbec19YAdjoGRyN1lh2oypmSb/vNKNR/qjFi9uBtsBZ
         0xSotkLdTVNAZmTe6cozBTUu/4fUpDZ+Jo9uyzcW7Tb1DsGyUxeRIvmh3EzWn4Q8mCFT
         IzBg==
X-Forwarded-Encrypted: i=1; AJvYcCXuzRsgQSmq1xeGmSqkZfIbnr7HGwMxReBmHbe6qHcC0gjyu7C+e6/rP8vHUVlTC47sSMykQGgLtXkJiEhtuCSmq8OqvzsbPfDfnHQ4TbI=
X-Gm-Message-State: AOJu0YxQg08rDW29qfF9bTykozbSzK+PvviB0TxQ9axfGpcYYiovCHTE
	UggEYF8Xg6JrNELEZKTwa1ncwkjBRZWzj8rlXLUoymIqUIcZiyBgyOwARvbqa2E=
X-Google-Smtp-Source: AGHT+IEM+fSDtrYFlzMy06hw4NwpN+EtOpDDyINpMTDLMyWAHuW6AhqNv3U4PfgW7SAypOtBzu5XIA==
X-Received: by 2002:a05:6358:5390:b0:19f:4c1b:f0e4 with SMTP id e5c5f4694b2df-19fb500d7a3mr1515333955d.21.1718717670790;
        Tue, 18 Jun 2024 06:34:30 -0700 (PDT)
Message-ID: <a14df3e5-4b70-474c-b55a-a06147c18b25@citrix.com>
Date: Tue, 18 Jun 2024 14:34:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ubsan: Fix UB in type_descriptor declaration
To: "Oleksii K." <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20240617175521.1766698-1-andrew.cooper3@citrix.com>
 <69eb7670c15d31cad3d9cac919a69a5e85f04ce0.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <69eb7670c15d31cad3d9cac919a69a5e85f04ce0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/06/2024 9:07 am, Oleksii K. wrote:
> On Mon, 2024-06-17 at 18:55 +0100, Andrew Cooper wrote:
>> struct type_descriptor is arranged with a NUL terminated string
> Should it be NULL instead of NUL?

NULL and NUL can be used interchangeably; they're different spellings
for the same thing.

In the ASCII spec, the character with value 0 is spelt NUL.

>
>> following the
>> kind/info fields.
>>
>> The only reason this doesn't trip UBSAN detection itself (on more
>> modern
>> compilers at least) is because struct type_descriptor is only
>> referenced in
>> suppressed regions.
>>
>> Switch the declaration to be a real flexible member.  No functional
>> change.
>>
>> Fixes: 00fcf4dd8eb4 ("xen/ubsan: Import ubsan implementation from
>> Linux 4.13")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~Andrew

