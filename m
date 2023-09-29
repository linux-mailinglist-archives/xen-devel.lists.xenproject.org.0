Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0BE7B2DC1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610327.949700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8mM-00087O-BV; Fri, 29 Sep 2023 08:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610327.949700; Fri, 29 Sep 2023 08:23:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8mM-00083K-8s; Fri, 29 Sep 2023 08:23:18 +0000
Received: by outflank-mailman (input) for mailman id 610327;
 Fri, 29 Sep 2023 08:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fe2t=FN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qm8mJ-0007zW-UE
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:23:16 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1f3510-5ea1-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 10:23:12 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3231d6504e1so9869935f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Sep 2023 01:23:12 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d408d000000b003258934a4bfsm760236wrp.36.2023.09.29.01.23.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 01:23:11 -0700 (PDT)
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
X-Inumbo-ID: 6e1f3510-5ea1-11ee-878b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695975792; x=1696580592; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9o6JEPJVR7BkSajVkGYd0Kw3B9HunC4NQNrd+lAnh9c=;
        b=uG8fEqRsvAnObrFI/YvzJ5FNgpXJrfl2Kx9iU38EGK1HG8pikej0ELj14l9/lVvpPS
         sHeZLhUcs5PkGekxeovvMpfbz+l8Rqz7f6PPM2BzAlmh04edJv5yqIc1buQXmJNc0hrN
         jHlsmFyfE4FR7Ox0KpRo8FbGJdrPYKJg6tdMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975792; x=1696580592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9o6JEPJVR7BkSajVkGYd0Kw3B9HunC4NQNrd+lAnh9c=;
        b=jtnxdewwKTJVvQ7gc4Yl3ypOab0/9GujPe+RYD00Q3vPNIihoOmmgtvyEyHFr7dpGk
         We0tU/1KIhaydAcuk9zbkVqLCi8xcGe8Q3fkgdeqLwdCNzWKUF51lArr4P0bYJyZfu08
         Lc2jVYox0wgSizp7W0wis1CG7doSKrn39Az9XIancpWVgqTbRvtqbzScAoclHna79ena
         eOEpce36QLRq+gk72VGZV9xSwP0vkE3J3/wdNzmty5hsji5Dx57yUiEl3pz69ZUzAlPw
         UWuIT4IfjNaqRmlM1R/WcExeFelD0p7Lo/uKFHy4nlkrskQfjxyGU91jgmdVIMEFFX8B
         0tbg==
X-Gm-Message-State: AOJu0YxrgTmq8JceDnpUvPSBmzyQEzRN0NNXmep4X8J4sLencTBVtZq7
	QOWSvaV6toH78Ufk0SRvMB9hhw==
X-Google-Smtp-Source: AGHT+IH0xw7y6X5M+KvnroN0gKfm+xinutOKNIYiAcaOB0fwjSs59vE6j/lISjm1zzp4pEYLc+9k9g==
X-Received: by 2002:adf:ef11:0:b0:31c:6591:d415 with SMTP id e17-20020adfef11000000b0031c6591d415mr3174870wro.39.1695975792131;
        Fri, 29 Sep 2023 01:23:12 -0700 (PDT)
Message-ID: <0a5bab77-5cac-47a2-805b-76396e4d4c89@citrix.com>
Date: Fri, 29 Sep 2023 09:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstore: Avoid leaking memory in check_store
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, David Kahurani <k.kahurani@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20230929045724.6844-1-k.kahurani@gmail.com>
 <43936092-75f5-42ff-b0c2-2f79147e2f86@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <43936092-75f5-42ff-b0c2-2f79147e2f86@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/09/2023 6:56 am, Juergen Gross wrote:
> On 29.09.23 06:57, David Kahurani wrote:
>
> I'd like the following paragraph added to the commit message:
>
>   check_store() will leak the memory from reading the "@introduceDomain"
>   and "@releaseDomain" nodes.
>
>> While this code should not be trigger-able from an unprivileged domain
>> it is called multiple times when the database gets inconsistent. This
>> means that a malicious guest able to corrupt the database will trigger
>> the leaks here.
>>
>> Fix the leaks so that this code can be safely called from anywhere
>>
>
> Fixes: 67617067f0b6 ("tools/xenstore: let check_store() check the
> accounting data")
>
>> Signed-off-by: David Kahurani <k.kahurani@gmail.com>
>
> With above additions (can probably be done while committing):
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Can do, but this needs Henry's approval too at this point in 4.18

~Andrew

