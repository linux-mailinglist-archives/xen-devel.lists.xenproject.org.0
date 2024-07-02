Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077FF923B01
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 12:02:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752215.1160374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaKu-0002wR-MG; Tue, 02 Jul 2024 10:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752215.1160374; Tue, 02 Jul 2024 10:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaKu-0002ui-ID; Tue, 02 Jul 2024 10:02:08 +0000
Received: by outflank-mailman (input) for mailman id 752215;
 Tue, 02 Jul 2024 10:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWIE=OC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOaKt-0002uc-0W
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 10:02:07 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22191ad9-385a-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 12:02:04 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-79c0b73b109so265406985a.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 03:02:04 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d6932c935sm432906085a.132.2024.07.02.03.02.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 03:02:02 -0700 (PDT)
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
X-Inumbo-ID: 22191ad9-385a-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719914524; x=1720519324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W5VTcDV6K3FYu/B8FkxqAEo4Le5NpRIuvgvDc93GQQY=;
        b=oaFMRg1Gcjpuok4dO6H5YXe3/MD70YtKp42EIbYyMBXCanqT7wU7w+GCKvTweaFGyQ
         ipEQWzgQhCWb7nm6yuWNtHnRwbgdEazU44EeAYyeGbqQaA+cTEiv6ASXpvLD306QLzrd
         zsxt7xZMOFEA8lHYrZbqy88+Bq8hfZxmILmMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719914524; x=1720519324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5VTcDV6K3FYu/B8FkxqAEo4Le5NpRIuvgvDc93GQQY=;
        b=gojSsAqm+z/rDjta/hgTfSL3uIzNi8F8hu//FEskIZJeWXf3SSD4zmbVp1mEVNT3mi
         grHfVXq6+0lRtLm3veIrYDI+i7y+5WolzhjNWmqX3W2j+Y3T3WIHBUn9BsT3iXn2AKl2
         bl340G2kPzBoOcnj+T+d5zaxbGzRiXPmzAZLtMDZ93y4tm+u94m8cC3u6gmveR199xMH
         RydWilEmfhgmFO4CfeKb1tlC/hFhyoJ3G72dmvmGbb9UHaoYcZcUe1eIfYs8OvDopEEK
         4VP+RuBdbBfBHk0sZx9KvZWUH7+ylfKo6Lu4U7j53TXBJ0yu6xPgftrGXdDoc/Md+jO5
         3xBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDQ00JdZHzqupBHT29Ko2K7LCsA3jxF0DaWcEsrYMqJnONAIor3BV5H5ODw80h3C0fi445XDizUXxdmWfXxDbEupK4TvyyYHIOgQjvfhg=
X-Gm-Message-State: AOJu0YwK0RV4Lhx0tbslaRi1U15DwPoAGLXaHsTDat3K2wn5r4hvAMXU
	fEwPHHVs5SmsCgM5JePTIhCJNRBxmKJYGnTDvKG6RaAonIPWxl9IXQw90Vco4AQ=
X-Google-Smtp-Source: AGHT+IG08K+s8ZgGJjqaVAxzX5dTyNw37W4zfRGd1QDksUtELZLju6+mIiKrQqqbku0xO0UrCuVEnQ==
X-Received: by 2002:a05:620a:4509:b0:79d:7084:1240 with SMTP id af79cd13be357-79d7b9ac2e5mr965616785a.6.1719914523273;
        Tue, 02 Jul 2024 03:02:03 -0700 (PDT)
Message-ID: <b6f3001f-6ad9-4833-a0cd-3742df49acb7@citrix.com>
Date: Tue, 2 Jul 2024 11:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] automation: add findutils to suse images
To: Oleksii <oleksii.kurochko@gmail.com>, Olaf Hering <olaf@aepfle.de>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240701151512.10187-1-olaf@aepfle.de>
 <6231910f-b4c9-4604-83dc-c53e53d30409@citrix.com>
 <0551e31b19bbdad8aeacb6c76e7651abe1b8ca4d.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0551e31b19bbdad8aeacb6c76e7651abe1b8ca4d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/07/2024 10:56 am, Oleksii wrote:
> On Mon, 2024-07-01 at 16:20 +0100, Andrew Cooper wrote:
>> On 01/07/2024 4:15 pm, Olaf Hering wrote:
>>> The build system uses find(1). Make sure it is available.
>>>
>>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> CC Oleksii.  This is probably non-optional to take.
>>
>> I suspect it means we can't rebuild the OpenSUSE dockerfiles any
>> more...
> Are we going to rebuild the OpenSUSE dockerfiles in this release?

They get rebuilt at arbitrary points.

This patch is about keeping Gitlab CI running smoothly.  It's not
related to Xen 4.19, except by chance.

~Andrew

