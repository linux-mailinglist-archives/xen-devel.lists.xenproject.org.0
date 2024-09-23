Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C3297EB1F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:55:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802001.1212110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshew-0003rL-Bi; Mon, 23 Sep 2024 11:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802001.1212110; Mon, 23 Sep 2024 11:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshew-0003ne-7P; Mon, 23 Sep 2024 11:55:18 +0000
Received: by outflank-mailman (input) for mailman id 802001;
 Mon, 23 Sep 2024 11:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sshev-0003lS-Me
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:55:17 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3375ad2-79a2-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 13:55:17 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c245c62362so5115443a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:55:17 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bb563acsm10283035a12.35.2024.09.23.04.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:55:16 -0700 (PDT)
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
X-Inumbo-ID: b3375ad2-79a2-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727092516; x=1727697316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+rgZ8phNl8z+jY2b69qCBETx5k6q9Hl6V96Pu7exSQ=;
        b=TloPIXCM9JBnRH6y2NrssgiVwPJ2mmP1NLePrFwqM3/dF0NbGtvyoWzgR+UGSjMqWN
         6yzQ7ajAYmCp5q4tQA0Af9b0b9x6FtPJxP4HlSlwWu1wjWWBoTwRXE3wAD+3ylgcCbo3
         UeY89nFne0ekXGLOMyJZfmeMAmFL1qrE9w8Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727092516; x=1727697316;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+rgZ8phNl8z+jY2b69qCBETx5k6q9Hl6V96Pu7exSQ=;
        b=E+PLr4R6EdHxLEOFAFiPK+YpDD8vyfZtkAJgCxJh6Okso1A3l12KUFjxlejPT42tK/
         5uRO6om3lZB/UQt43QVgC0Qu4LeyD8KLpjbk4lnU1z0A9qDVK6ooBcfHRrfaYpemav6Q
         OjaQXXIv29RQDupJ9AOKw7iY939LWb1PUrafRAyRXpecLgNP3z5Oz6xCqeOlHn1BrrlW
         NKPBtriPr0H+ooIRO2cs/GK30Zmbkc+ynwQWKaOuktuBpNwYMIZzS9uDOc0A61WanwZT
         kDy52Hb3QbVfqhNsmc9pjuDbi94GTsaBvXxhcC5RpF7r92fLLL0lL6RP1xPMBytG1gcW
         sZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl9v2H1n+wZwLZ2nxSRbWt2HtAqGulhPoGhi4RQuk6xL3KKimfFS9cSJ2CUT28UAjMn+feFv3SX44=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZD5Kcnstsv4m98rdbdGkKWTdkxybvW7CuB4lpSKEGGMLXn1+r
	LrYvixEVYQAO6VEiIm7+pAwSv+jVS1XvbpMfu7KrH9UQv6p8/ZUcOixn7NrgPt4=
X-Google-Smtp-Source: AGHT+IHZcXTSh2CJTRtUC+Er7drtnBnhGew0CIETPjozRyCF6cOQ0tRBF4+2KlDb+GSPyJ2VPYtRCA==
X-Received: by 2002:a05:6402:27d4:b0:5c2:75d3:fbf7 with SMTP id 4fb4d7f45d1cf-5c464db3de0mr11462732a12.14.1727092516445;
        Mon, 23 Sep 2024 04:55:16 -0700 (PDT)
Message-ID: <e21a8403-1a48-4dd7-b4d8-4736c997ed4f@citrix.com>
Date: Mon, 23 Sep 2024 12:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/livepatch: do Xen build-id check earlier
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-3-roger.pau@citrix.com>
 <9ca4d235-5e6a-4ee0-9cc4-721b761572d3@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9ca4d235-5e6a-4ee0-9cc4-721b761572d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/09/2024 12:04 pm, Andrew Cooper wrote:
> On 20/09/2024 10:36 am, Roger Pau Monne wrote:
>> The check against the expected Xen build ID should be done ahead of attempting
>> to apply the alternatives contained in the livepatch.
>>
>> If the CPUID in the alternatives patching data is out of the scope of the
>> running Xen featureset the BUG() in _apply_alternatives() will trigger thus
>> bringing the system down.  Note the layout of struct alt_instr could also
>> change between versions.  It's also possible for struct exception_table_entry
>> to have changed format, hence possibly leading to other errors.
>>
>> Move the Xen build ID check to be done ahead of any processing of the livepatch
>> payload sections.
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/common/livepatch.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
>> index cea47ffe4c84..3e4fce036a1c 100644
>> --- a/xen/common/livepatch.c
>> +++ b/xen/common/livepatch.c
>> @@ -767,6 +767,11 @@ static int prepare_payload(struct payload *payload,
>>      if ( rc )
>>          return rc;
>>  
>> +    /* Perform the Xen build-id check ahead of doing any more processing. */
>> +    rc = xen_build_id_dep(payload);
>> +    if ( rc )
>> +        return rc;
>> +
> While a step in the right direction, I think this needs to be moved far
> earlier.  Even here, it's behind the processing of the livepatch func
> state, which is something that can also change like alt_instr.
>
> The buildid checks need to be as early as possible.  Looking through the
> logic (which doesn't have great names/splits), I'd say the buildid
> checks want to be between livepatch_elf_load() (which parses the
> structure of the ELF), and move_payload() (which starts copying it into
> place).
>
> That would involve moving check_special_sections() too, but I think it's
> the right thing to do.
>
> Absolutely nothing good can come from continuing to process/setup a
> livepatch identified as "not for this hypervisor".

Further, we should probably fuzz this (KFX style).  I bet the
alternatives aren't the only now-reachable BUG()'s.

While we don't expect people to pass bad livepatches, this mess was
discovered by our CI system getting confused and passing the wrong (of
several otherwise good) livepatch for the currently running hypervisor.

~Andrew

