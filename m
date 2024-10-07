Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0FF992883
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 11:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811816.1224482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkQy-00049x-J2; Mon, 07 Oct 2024 09:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811816.1224482; Mon, 07 Oct 2024 09:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkQy-000470-GI; Mon, 07 Oct 2024 09:53:44 +0000
Received: by outflank-mailman (input) for mailman id 811816;
 Mon, 07 Oct 2024 09:53:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arWC=RD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sxkQx-00046u-S5
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 09:53:43 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 095f6848-8492-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 11:53:43 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c8967dd2c7so5348206a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 02:53:43 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a996167411csm18051766b.14.2024.10.07.02.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 02:53:41 -0700 (PDT)
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
X-Inumbo-ID: 095f6848-8492-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728294822; x=1728899622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gMVPuUJ6XxSqJ7vWXv7AfdLriI/hral7DxoQQy17U+M=;
        b=AsPJhPfKrql7eKGHjrb3t4AkWK2jURtVR952qEs9mWqEOvOya3tiv0BQlWaexxLtC3
         VX53Z8xi9x6qJebTRZfkWFJcZMwqgXBfvsxc5CkkUxJ2fQU/FHXS1ZFRICxRukoNjCXq
         Nv+Xgi5l6gWp4bR0Qu1ADxBS/N14N+rZQYY2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728294822; x=1728899622;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMVPuUJ6XxSqJ7vWXv7AfdLriI/hral7DxoQQy17U+M=;
        b=IO/OODtktmhnxUAokr8jFgfDNA0q9A6bU7KLX/3Jso10cXTviQWTigk35MZlFWQZ0Y
         8kN/MKD5a0Y/t4UKrc3s7MUGfR3ASLbETzHxrxvyVj7QevwsNSXB6hC362JAueAi8jL/
         hZhKex0rWmcZc1mYnADrkOsT9Hr67iLmRN39X1Pu1A+v2MdxQ0Ej/DfhG0zBgxSV8fbv
         faRr2uSBwKir/r69IDHDXEDU0EVImZ/vd0W69bmXt6jnOh4p8UmzmHYclMWzjQSgluWB
         tkg2R92zl1o0Jx3dfdDjGuKL3UEDvlB5hrSnREKtRC2AwK+NY5hYXpO3kyGH/v5Rmdqk
         4xpA==
X-Forwarded-Encrypted: i=1; AJvYcCXT6TapXfL8qd2d7MUakg8ys8iXGQLRKynSFRZGx10tW9Eay4VUQ2r5CYVDfZ2FHZ643t8noADP2Bw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxg45JiQtbEwcnf7aF6fw7cluVwyvW8PdQOT+Fe1nfHpVhG0gle
	r35fNgM0oT3FqkvzdwGx4xH3IexQMnbbtNVHCPjYawdQDe2XJ97wodAjH3RdRQo=
X-Google-Smtp-Source: AGHT+IEuB+KLGSE6x8PwnpTSGszNSXkpu9Owik4gHTD/jqFqQggj9tzodzGBUtvgI5mZ862Q1NkuNA==
X-Received: by 2002:a17:907:3f95:b0:a99:43b2:41af with SMTP id a640c23a62f3a-a9943b24416mr742078866b.56.1728294822392;
        Mon, 07 Oct 2024 02:53:42 -0700 (PDT)
Message-ID: <e6097d64-b8d6-4b66-9a35-0fd785773c01@citrix.com>
Date: Mon, 7 Oct 2024 10:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: create a C bundle for 32 bit boot code and
 use it
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-2-frediano.ziglio@cloud.com>
 <9a4c9017-f9be-4ebd-9f3d-c7e0b2752438@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9a4c9017-f9be-4ebd-9f3d-c7e0b2752438@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2024 1:24 pm, Andrew Cooper wrote:
> On 05/10/2024 9:02 am, Frediano Ziglio wrote:
>> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
>> index ff0f965876..da87179fef 100644
>> --- a/xen/arch/x86/boot/Makefile
>> +++ b/xen/arch/x86/boot/Makefile
>> @@ -1,4 +1,4 @@
>> -obj-bin-y += head.o
>> +obj-bin-y += head.o cbundle.o
> +obj-bin-y += cbundle.o
>  obj-bin-y += head.o
>
> please.  Putting things on a single line is already getting unwieldy by
> patch 2.
>
> I have to admit that I'm still not convinced of "cbundle" as a name, but
> I can't think of anything better either.

Based on the other thread, and in combination with existing Kbuild
nomenclature, this probably wants to be built_in_32.o

~Andrew

