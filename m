Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CC896B8BC
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:42:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790107.1199818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnSO-0004tB-OR; Wed, 04 Sep 2024 10:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790107.1199818; Wed, 04 Sep 2024 10:41:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slnSO-0004pk-LV; Wed, 04 Sep 2024 10:41:48 +0000
Received: by outflank-mailman (input) for mailman id 790107;
 Wed, 04 Sep 2024 10:41:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slnSN-0004pe-2e
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:41:47 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47779858-6aaa-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:41:44 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so62279066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:41:44 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feae40sm802951166b.15.2024.09.04.03.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 03:41:43 -0700 (PDT)
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
X-Inumbo-ID: 47779858-6aaa-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725446504; x=1726051304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LaEU+VeM1gim+XAlmoVBxzvU8jFFB2KG+n7V9i/nqIk=;
        b=K0W/zvA90FeVaLOFPdXL7shPG+182KwiBWTeEw9u+FNWv0ynqM0RKVAtQkuH62IL8o
         5TMkW7ThUUEcbkvvds/GyeQ1XHteZiyLu2Xt+5xSuUYy6ZqetcY4s//9F3glIG+/Wy2R
         QnBxehZzFgdaA6/7b04KwqXOe64ocC9Ojnclg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725446504; x=1726051304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaEU+VeM1gim+XAlmoVBxzvU8jFFB2KG+n7V9i/nqIk=;
        b=BVyLR5OWPnmCUzJeb57U89Ws3RC/1NiZXk8DHgGykBTvAkL4O/6EMiHLq52PHtJefV
         eFfpKD2szVi0ALUdCvA59BLFlwFGWTHjxq2sUIZYxUxi0DTKsBJGBANR0Hj9hw19qYMJ
         gZlul5QsoIk3KN7QNyKx9Sc9p9L1hSbMIvNqFR4iOr3fdcdV5RHWaUb12u/nFaTkYHlg
         dt0EU19U6z7gOAbnDcXljjXr4SuGLS98B5rCoPzCaxELgTHY5teaHa60VAB14jDRq0iz
         msPrCK2Xh8g6KXEpd7U1HJ8CIttUtU8RuKODFl95npUD6NbNs+L4fn/mnQDFfuV/yBG0
         4f1A==
X-Forwarded-Encrypted: i=1; AJvYcCUhgG9exBatejKXx+Z7RxvNWOKPMZmf/EXMX1XhnCPsMhODQUcTu03MWiSSkZ0FnHUugy9SxndP0Ko=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtMuvvOZ/IZBqK8rJfGMXX+bo7u6WjL6DdrNCUXi8LVr/wDa46
	/IY+lWJnkCrWmyfxTEcIwPQsutEzXLw+IB4ZdTczOp6P8wMhIyMiIeY24CBev7o=
X-Google-Smtp-Source: AGHT+IHxeOAZt/SAujNaEXp1wO3tBVFqPK8B9mYHMxzVvt8piud7Q9A4lCumOyxZX5ydUBhEphf0Yw==
X-Received: by 2002:a17:907:940f:b0:a7a:b385:37c5 with SMTP id a640c23a62f3a-a8a3f185c6emr160122066b.17.1725446503978;
        Wed, 04 Sep 2024 03:41:43 -0700 (PDT)
Message-ID: <9208e790-e772-4f42-8fdc-38fe1976dc34@citrix.com>
Date: Wed, 4 Sep 2024 11:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/44] x86/boot: convert consider_modules to struct
 boot_module
To: Jan Beulich <jbeulich@suse.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-7-dpsmith@apertussolutions.com>
 <f6c938b4-3c28-4dc8-bc3a-3becb3a0c2cd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f6c938b4-3c28-4dc8-bc3a-3becb3a0c2cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/09/2024 7:40 am, Jan Beulich wrote:
> On 30.08.2024 23:46, Daniel P. Smith wrote:
>> @@ -1447,7 +1447,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>          {
>>              /* Don't overlap with modules. */
>>              end = consider_modules(s, e, reloc_size + mask,
>> -                                   mod, boot_info->nr_mods, -1);
>> +                                   boot_info->mods, boot_info->nr_mods, -1);
>>              end &= ~mask;
>>          }
>>          else
>> @@ -1482,7 +1482,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>                  continue;
>>  
>>              /* Don't overlap with other modules (or Xen itself). */
>> -            end = consider_modules(s, e, size, mod,
>> +            end = consider_modules(s, e, size, boot_info->mods,
>>                                     boot_info->nr_mods + relocated, j);
>>  
>>              if ( highmem_start && end > highmem_start )
>> @@ -1509,7 +1509,7 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>          while ( !kexec_crash_area.start )
>>          {
>>              /* Don't overlap with modules (or Xen itself). */
>> -            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), mod,
>> +            e = consider_modules(s, e, PAGE_ALIGN(kexec_crash_area.size), boot_info->mods,
>>                                   boot_info->nr_mods + relocated, -1);
> All of these show a meaningful increase of line lengths, up to the point of
> ending up with too long a line here. I really wonder if the variable name
> "boot_info" isn't too long for something that's going to be used quite
> frequently. Just "bi" maybe?

Actually I noticed that too.

It's boot_info-> in setup.c, and bi-> everywhere else (with bm later too).

We should just use "bi" uniformly even in setup.c  (Or some other name,
but I'm happy with bi here - it's very easily qualified by it's field
names.)

~Andrew

