Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F3884B349
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676811.1053102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJTb-00040X-T0; Tue, 06 Feb 2024 11:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676811.1053102; Tue, 06 Feb 2024 11:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJTb-0003yi-QM; Tue, 06 Feb 2024 11:18:55 +0000
Received: by outflank-mailman (input) for mailman id 676811;
 Tue, 06 Feb 2024 11:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+UH4=JP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rXJTZ-0003xK-Oz
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 11:18:53 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82476d33-c4e1-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 12:18:53 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-55fbbfbc0f5so853560a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 03:18:53 -0800 (PST)
Received: from [10.80.67.148] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g23-20020aa7d1d7000000b0055f0f643ebcsm918583edp.96.2024.02.06.03.18.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 03:18:52 -0800 (PST)
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
X-Inumbo-ID: 82476d33-c4e1-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707218332; x=1707823132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xs+Sg++ZA2uBkTdsuj9RsfrUwvJUfG9iNfmchaGUroA=;
        b=SonfRVi5SaGJy6cSFtxoMlUjHoa9TQmN9iHIzJOG5e15MabVu0wZ8bHeDjqfC0QXHm
         rx4GtG8l42ChZ9oE9z3FCX9FvbEDBbte6/9P2QJtThMiLnyI21Ltk7jff7G+ZCApHAh1
         9z8LdQooPAYPhkcCw1621Mv6SVUd+V9WuxqqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707218332; x=1707823132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xs+Sg++ZA2uBkTdsuj9RsfrUwvJUfG9iNfmchaGUroA=;
        b=cckxrfnbJIENTxj2Inm3F/usFU+1cQI3P6vSRPGSJ/4mALIRRUBY5KYnWNGL/SBkAp
         ryV5oaweSAOt7b6jGDTZJJXT7SC54XrzV7zI6jusM+V0D3ywumTFW2WzRkHKkuuhbUmP
         TvSrZp97NNekX7g7hlmXIe7UT3iW09Zag7rtM6Kikf99aWn2QcJDZBfqcyRdOVJ3UEVm
         yA6e3Cswo8TUaKupmNdY/vEmalaYUYStT1PkkzP8ga9MF0uR4bWfCSsJ8qF/glp4gw3o
         qglhlY1LDFoxI05u0SWHCOGbA/eOEeGxHQEXoctqCmpTLITXJyGFzZ1xzNKT+ZzHIBAu
         wtZw==
X-Gm-Message-State: AOJu0Yyf9pr5/zZILIRES9luVMwVv8IexTzdL7WdpAAVPmBoC3Do/cJO
	NcumzqNSB2xs0oqvVnfEvIadhjYY/ZY/KSzcBtGr8HivYwC/a+OeVnEztl4bEY1ZVrRUTEutGsP
	x
X-Google-Smtp-Source: AGHT+IFC33qOIq8bgLv/ZsPxxasn+ldEZOFZP75E4KalB2C3JpC5GiC8GQnk3YLBCl14cBaQZh3OvA==
X-Received: by 2002:a50:cd98:0:b0:55f:cb24:4242 with SMTP id p24-20020a50cd98000000b0055fcb244242mr8867440edi.4.1707218332381;
        Tue, 06 Feb 2024 03:18:52 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU8zOGPLCRLTvDhENuflEjYvoGgbKmvZzPaNqDX7yoG8gKnl/lTOQHADMn7lxFYCKWLvZcQ4orMt6ZruD3cGvu5Utg3V6Jx7GNCc1hvD1HiWvR1xcfWdGArYDoh8NewBW1a14J3H4oX7kSxX00lLY2rdGv/WxhwAbss3YZxAfWz900+ytG1q9CdIiJ0bCmL3tzZTO209BGbgvvN7CKaHvxGxww=
Message-ID: <f7a16167-d876-4055-8ff8-c3dc8155030d@citrix.com>
Date: Tue, 6 Feb 2024 11:18:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
 <7799755f-fad2-4f73-a2c1-de97bcce95fa@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7799755f-fad2-4f73-a2c1-de97bcce95fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/02/2024 9:24 am, Jan Beulich wrote:
> On 05.02.2024 20:23, Oleksii Kurochko wrote:
>>   * [PATCH v13 00/35] x86: enable FRED for x86-64 [
>> https://lore.kernel.org/xen-devel/20231205105030.8698-1-xin3.li@intel.com/
>> ]
> This is a kernel series. I don't expect FRED support is in scope for
> 4.19.

Correct - that's not a Xen series.

Xen FRED support is waiting on Intel to provide a version of SIMICS with
FRED and working shadow stack support.  I have no ETA.

~Andrew

