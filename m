Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C8E7F6494
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639943.997621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D2h-0003Ss-M4; Thu, 23 Nov 2023 16:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639943.997621; Thu, 23 Nov 2023 16:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6D2h-0003R1-Ir; Thu, 23 Nov 2023 16:59:07 +0000
Received: by outflank-mailman (input) for mailman id 639943;
 Thu, 23 Nov 2023 16:59:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xmv=HE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r6D2g-0003Qr-DQ
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:59:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b90ec69-8a21-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 17:59:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b2ad4953cso12525305e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:59:04 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0040b3632e993sm2637890wmq.46.2023.11.23.08.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 08:59:03 -0800 (PST)
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
X-Inumbo-ID: 9b90ec69-8a21-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700758744; x=1701363544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcLVKmP8cZ7Md8s4LcFOswIVVxxPcecTQOvhE+XdHCE=;
        b=RmGGMlHyJZ1Tj7q+giEuuRucfFBsNY69Z2BXjcyXTw8010Uy0WFEe87z3kZvTQKbJc
         9wuwhZTqlcCIgYe0ro6SEd1/aiBt4WuqwXahK6pDeZoqqHPe6LLY6Ye2JoyP/H/CR47T
         Snofzo8R/z5Q0eE21FPZ/2DS7H4Re4POcSVOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758744; x=1701363544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcLVKmP8cZ7Md8s4LcFOswIVVxxPcecTQOvhE+XdHCE=;
        b=ec8nNzkfJ5AsEQWr8dE/H7aNO0kHrkzmcyMRL9xTfIpKFM/hXB5QMVcAaoJSs8Pe8G
         l9H6uf7O77VA10IDGGAbfmsHXGjNJ3VXdzAb7jRsrxBemaURwgvQeBo4rhcj0ilJ5oML
         HdaV3v5DBfdQDvy/YDOulCPKeYrSmm+1ROsWP0wXiGyXTGg5IvAy1891GA7xVe09CEPp
         uV1LUP4ayPzYeRoUA8GoSPmUPmKs9p4W/X/hJ4LaaotRWBXY+UAnGQa3t/EMs8fusiEk
         eWIMIk4xr/ohJ2RM0ZNRL2SNnyUNRjXhl3RPCZvZ8Xlw/S8B7NL7gbKlTDq0otyHP4w7
         MD9Q==
X-Gm-Message-State: AOJu0YyeOvMjM2oBq9TFZ7P8EOsyU6HqDnoKa0wjZ4e04SOTeVoAKZMl
	XaXz9g2K/DJO69h7Ofl4lo8NjQ==
X-Google-Smtp-Source: AGHT+IHpXQh2klzQyZgCN7dwh1SelUPqlzHG6C39iZ8o0DILNzwRC9MIy1Wa9HDQ62Eht6F0JFG+MQ==
X-Received: by 2002:a05:600c:1548:b0:405:784a:d53e with SMTP id f8-20020a05600c154800b00405784ad53emr2678179wmg.20.1700758743840;
        Thu, 23 Nov 2023 08:59:03 -0800 (PST)
Message-ID: <b7a16f88-c2db-4f79-996f-762b8b2e58d6@cloud.com>
Date: Thu, 23 Nov 2023 16:59:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] tools/libfsimage: Add an fdopen() interface to
 libfsimage
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-5-alejandro.vallejo@cloud.com>
 <f1a4d1ac-abc3-410e-a171-581b074b8155@citrix.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <f1a4d1ac-abc3-410e-a171-581b074b8155@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/11/2023 22:29, Andrew Cooper wrote:
> On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
>> diff --git a/tools/libfsimage/common/fsimage_priv.h b/tools/libfsimage/common/fsimage_priv.h
>> index 2274403557..779e433b37 100644
>> --- a/tools/libfsimage/common/fsimage_priv.h
>> +++ b/tools/libfsimage/common/fsimage_priv.h
>> @@ -29,6 +29,7 @@ extern C {
>>   #endif
>>   
>>   #include <sys/types.h>
>> +#include <stdbool.h>
>>   
>>   #include "xenfsimage.h"
>>   #include "xenfsimage_plugin.h"
>> @@ -54,7 +55,7 @@ struct fsi_file {
>>   	void *ff_data;
>>   };
>>   
>> -int find_plugin(fsi_t *, const char *, const char *);
>> +int find_plugin(fsi_t *, const char *);
>>   
>>   #ifdef __cplusplus
>>   };
> 
> These are the only two hunks in this file.  Is the stdbool include stale?
> 
> It seems to compile fine with it removed.
I think it's leftover from code I needed initially and then didn't 
anymore. Safe to get rid of.

> 
>> diff --git a/tools/libfsimage/ext2fs-lib/ext2fs-lib.c b/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
>> index 864a15b349..9f07ea288f 100644
>> --- a/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
>> +++ b/tools/libfsimage/ext2fs-lib/ext2fs-lib.c
>> @@ -25,15 +25,25 @@
>>   #include INCLUDE_EXTFS_H
>>   #include <errno.h>
>>   #include <inttypes.h>
>> +#include <stdio.h>
>>   
>>   static int
>> -ext2lib_mount(fsi_t *fsi, const char *name, const char *options)
>> +ext2lib_mount(fsi_t *fsi, const char *options)
>>   {
>>   	int err;
>>   	char opts[30] = "";
>>   	ext2_filsys *fs;
>>   	uint64_t offset = fsip_fs_offset(fsi);
>>   
>> +	/*
>> +	 * We must choose unixfd_io_manager rather than unix_io_manager in
>> +	 * order for the library to accept fd strings instead of paths. It
>> +	 * still means we must pass a string representing an fd rather than
>> +	 * an int, but at least this way we don't need to pass paths around
>> +	 */
>> +	char name[32] = {0};
> 
> For an int?  12 will do fine including a terminator, and practical
> system limits leave it far smaller than that generally.
Maybe. I admit optimising that line went pretty low on the list of 
things I cared terribly about. I'm happy to reduce it, but it is 
inconsequential.
> 
> Given that it is guaranteed long enough, you don't need to zero it just
> to have snprintf() write a well-formed string in.
> 
> ~Andrew
For wellformed fd's that's true. Through bugs or malice that may not be 
the case. I'm happier knowing at least the last zero remains.

Cheers,
Alejandro


