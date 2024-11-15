Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3249CF24D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:02:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837856.1253761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzi7-0006gR-2X; Fri, 15 Nov 2024 17:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837856.1253761; Fri, 15 Nov 2024 17:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzi6-0006eA-Vq; Fri, 15 Nov 2024 17:02:18 +0000
Received: by outflank-mailman (input) for mailman id 837856;
 Fri, 15 Nov 2024 17:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBzi6-0006dq-6K
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:02:18 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5beee03d-a373-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 18:02:13 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cf7567f369so1259242a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 09:02:13 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e086244sm193141366b.177.2024.11.15.09.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 09:02:01 -0800 (PST)
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
X-Inumbo-ID: 5beee03d-a373-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjViZWVlMDNkLWEzNzMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjkwMTMzLjIzNzQyOCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731690133; x=1732294933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zkDitVZUA5dWT3zHqIcUquOaiet+JmHTNhRJCp5xeA4=;
        b=WZjQPgABBZyuevV19ulLgSz7iUBBOuw6bOYKhUwuLukJT11TsnLJFTZy1kNr+zy99W
         yEAwKLK06sPTsGT+gr+lH3SqWgoMiZoBi2Szuaha5W8fI59aZOWAgXn0CVZ3dlauYn7J
         J9HxdWv53R/1MKadRCk8lx4PSYcpDQ8xtZ7Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731690133; x=1732294933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkDitVZUA5dWT3zHqIcUquOaiet+JmHTNhRJCp5xeA4=;
        b=OesWeWJS+35ccvNchfMiAR9E+bORvwlLdt3V/gwoKI+OT8OOw/gFtT7IkvtUfYrYw4
         6R7xhtHueSL4eDyWt7XSbpfRJfrWVRi/+rvMcJB5xtnJmy12YMB6VJJ9JN7b74XI7tQy
         Rc4nK3q3R0aAMF2p0/HlosLCKKrLaXWjIZAy4FiMrP3r2trFMVBlWGu0WZblg6KEYvV/
         2u+CvIeJN2zGL4obmdrMmME8oZcEjF8gY+W7EyCMJX6ZmNU8UlrZhoIfy5vwhhYFCLNy
         gA3sfZewNDEm2DeQ27sT9iCRpIw5Vrnq1x2iJn6paHZHFom3jQt/Ael1OET96Gxx3VRw
         LkYA==
X-Forwarded-Encrypted: i=1; AJvYcCUKDQL1zC1I2KzOv7fmdMT0VsxuExTNc2S9/H4WMb/QYcVWD6aT1QXelsIJyTXEJGkk3dYLABqyNpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykCbdKmghvJfGv3KIaUJ0QXlesns9ewL6kp60aeiG25BhDndEn
	riIj91Zdak1jrAg5OwUfNih9Lu+lC2xtqVJndyupShBanfSMkM0MsuPmc4QDSxM=
X-Google-Smtp-Source: AGHT+IF5W9g0UQyqipHqFFPF4mfmTILYbC1MFJkZjswv1+j+4QDgYC8Y9nxtELW1YJIv9Ap2CD3vTA==
X-Received: by 2002:a17:906:7952:b0:a9a:c57f:9666 with SMTP id a640c23a62f3a-aa4833e9b01mr311136066b.2.1731690122494;
        Fri, 15 Nov 2024 09:02:02 -0800 (PST)
Message-ID: <f45f516d-cf90-419f-b7a7-7fc91f9f2729@citrix.com>
Date: Fri, 15 Nov 2024 17:01:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] x86/boot: convert domain construction to use boot
 info
To: Jason Andryuk <jason.andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-2-dpsmith@apertussolutions.com>
 <24e23ea2-e359-41f3-be62-6b7bdff4e074@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <24e23ea2-e359-41f3-be62-6b7bdff4e074@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 4:33 pm, Jason Andryuk wrote:
> On 2024-11-15 08:11, Daniel P. Smith wrote:
>> diff --git a/xen/arch/x86/hvm/dom0_build.c
>> b/xen/arch/x86/hvm/dom0_build.c
>> index 3dd913bdb029..d1bdf1b14601 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -1300,16 +1301,26 @@ static void __hwdom_init
>> pvh_setup_mmcfg(struct domain *d)
>>       }
>>   }
>>   -int __init dom0_construct_pvh(struct domain *d, const module_t
>> *image,
>> -                              unsigned long image_headroom,
>> -                              module_t *initrd,
>> -                              const char *cmdline)
>> +int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
>>   {
>>       paddr_t entry, start_info;
>> +    struct boot_module *image;
>> +    struct boot_module *initrd = NULL;
>> +    unsigned int idx;
>>       int rc;
>>         printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n",
>> d->domain_id);
>>   +    idx = first_boot_module_index(bi, BOOTMOD_KERNEL);
>> +    if ( idx >= bi->nr_modules )
>
> What do you think about introducing a new define:
>
>     #define BOOTMOD_NOT_FOUND (MAX_NR_BOOTMODS + 1)
>
> For first_boot_module_index() to return.  And then:
>
>     if ( idx == BOOTMOD_NOT_FOUND )
>
> ?

Care would need to be taken vs BOOTMOD_XEN, which could have the same
numeric value in a big HL configuration.

From a "reading the code" point of view, a range check against any
invalid value is better seeing as the next thing we do is index an
array, so I'm marginally on the side of "keep it as it is".

This particular logic can't trip because of earlier checks in
__start_xen(), and gets rewritten in patch 4 in the conversion to
boot_domains, so I'm also not overly fussed at extra polish on this
specific piece of logic.

~Andrew

