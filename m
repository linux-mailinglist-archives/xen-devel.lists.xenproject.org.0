Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D4806CAA
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 11:53:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649076.1013386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApVy-0002kb-8y; Wed, 06 Dec 2023 10:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649076.1013386; Wed, 06 Dec 2023 10:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApVy-0002ig-5f; Wed, 06 Dec 2023 10:52:26 +0000
Received: by outflank-mailman (input) for mailman id 649076;
 Wed, 06 Dec 2023 10:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHB2=HR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rApVx-0002iV-AB
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 10:52:25 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89e79bfc-9425-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 11:52:24 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c09f4bea8so35228845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 02:52:24 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c511200b004064e3b94afsm25135009wms.4.2023.12.06.02.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 02:52:23 -0800 (PST)
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
X-Inumbo-ID: 89e79bfc-9425-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701859944; x=1702464744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3T+URRasKd5gVZ+HA55OHDT/UwrqFouVUpxLYSOqEI=;
        b=qlVoUW92SLtC9ur2HDX9/JpHqMX+/iL47H4fGXOOdZBxfr4MgTNR8pTEklRgv+lR7c
         5gRgLdYO1yMOHF40azVO2Mb5bR6L0XN8zc1PIcEVTmY2TZz5ETtrQ4N8v8wjc4StiFsb
         yIveVToggDPg7Ny8Jb3wfopDETVa78OTbSXqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701859944; x=1702464744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3T+URRasKd5gVZ+HA55OHDT/UwrqFouVUpxLYSOqEI=;
        b=n4xMJ7UPZtegDLhQMEHuL16eclho1ii6VPK+CS9LiLjRvLicykzrbszhSOpDOhwfl4
         /S0zUUAQsbicR2DKjIyY1O1ansIPU092fhLRqhjWlQZUrTy+vdQX9wl9EXUCZAAPKPEK
         8PjrstB7KEMqJqifXbCQ6m+Kv61iG0bv4Jx3Zu3jTB1+o/3sKHz9j1ahcuBDwDCH9wuQ
         OTCojtyLTh/4LQ1+9F7GBzx67CPVKyfOInPBvOpeNcJvjcJF/1txkCI4/Nax7CoFYV7S
         8iUKql3ft0T2HRSKdiNxFQP9PSmQ21KplKZTEZOH1GxkAQ2GzomMqJ+sFPpmWvcjc4f5
         71mw==
X-Gm-Message-State: AOJu0YzyF0KE0c7TWR70YSB7SEJ0A+nBd1QXuXlOtl4uLgTJI2La0Hxy
	2tLxCj489ewk2DkVdQQJY+MxFQ==
X-Google-Smtp-Source: AGHT+IGyYI/iLV3MXXqtgc+OS1XGSR24oMrjGM2wBrpEuiDQnoQ5fP667PhzsvsojPHbDmyJbjeAVQ==
X-Received: by 2002:a05:600c:4fd2:b0:40b:5e1c:af2f with SMTP id o18-20020a05600c4fd200b0040b5e1caf2fmr430565wmq.53.1701859943860;
        Wed, 06 Dec 2023 02:52:23 -0800 (PST)
Message-ID: <14050129-822c-48e9-83ad-f046a7fcc197@citrix.com>
Date: Wed, 6 Dec 2023 10:52:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, xen-devel@lists.xenproject.org
References: <20231206071039.24435-1-jgross@suse.com>
 <20231206071039.24435-3-jgross@suse.com>
 <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <96711b23-9dd9-4029-aaea-a3e755c4bd3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2023 8:46 am, Jan Beulich wrote:
> On 06.12.2023 08:10, Juergen Gross wrote:
>> Instead of defining get_unaligned() and put_unaligned() in a way that
>> is only supporting architectures allowing unaligned accesses, use the
>> same approach as the Linux kernel and let the compiler do the
>> decision how to generate the code for probably unaligned data accesses.
>>
>> Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
>> the Linux kernel.
>>
>> The generated code has been checked to be the same on x86.
>>
>> Modify the Linux variant to not use underscore prefixed identifiers,
>> avoid unneeded parentheses and drop the 24-bit accessors.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Nevertheless ...
>
>> @@ -15,67 +7,82 @@
>>  #include <asm/byteorder.h>
>>  #endif
>>  
>> -#define get_unaligned(p) (*(p))
>> -#define put_unaligned(val, p) (*(p) = (val))
>> +/*
>> + * This is the most generic implementation of unaligned accesses
>> + * and should work almost anywhere.
>> + */
>> +
>> +#define get_unaligned_t_(type, ptr) ({					\
> ..., do we need the trailing underscores here in addition to the already
> sufficiently clear _t suffixes? (Leaving aside that ..._t generally is to
> denote types, not macros or functions.)

_t is fine.  It's what we use for {min,max}_t() and friends too.

~Andrew

