Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0118C29A6
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 20:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720003.1122909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5UYC-0003Kw-HA; Fri, 10 May 2024 18:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720003.1122909; Fri, 10 May 2024 18:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5UYC-0003IP-EV; Fri, 10 May 2024 18:00:56 +0000
Received: by outflank-mailman (input) for mailman id 720003;
 Fri, 10 May 2024 18:00:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i6G=MN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s5UYA-0003IJ-B4
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 18:00:54 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d98279b-0ef7-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 20:00:53 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-69b514d3cf4so24132406d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 11:00:53 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1851f7sm19714496d6.47.2024.05.10.11.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 11:00:51 -0700 (PDT)
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
X-Inumbo-ID: 3d98279b-0ef7-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715364052; x=1715968852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zgiiMiwvtXwsEu/I1HVq6MxgkcX1ePwW93sRwxJLpfY=;
        b=PVTMYga2LVTsoOlLYm2sxeO0D+nbkd3nFisWR08HSZsUOR7HkgWzk+/CzNRo2FJ/Vh
         FWbqU/Kt39IFahBgd5rl48GFTpOqg1cn6jg+jOgbmZR9FKRMZ74VgiDG/yGowrvpv0x5
         r9E/xazQjJUALPDnqJP54yhs3zJBjvMb9a9kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715364052; x=1715968852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgiiMiwvtXwsEu/I1HVq6MxgkcX1ePwW93sRwxJLpfY=;
        b=d49XGxttP9xivIfZJKEH6gwR9HQNzA3uucC/Ell3+8wpDJLd8w3HyqacmC3sOBBCol
         7GxgFYr7A4qiq14KNotVlyezE8God/es3xQA1oTHDisrzCVvVWtiGHTPR8USBtIyRvC0
         E0vI2NO3DuFMIKLYEsI4D/SciSNTqa+8xvYVY/sKuHsoxS+UZI791xdFUoNSmUNWzXpg
         4D9rphMZzDxeCBY9Sx0lcvEnpKS849qD9N6BcO1TveByWIF92fbebSM6BBoJDtV7Escr
         vtXo2/dDUZn1+U/De+FSjhREo7J7Yyig9yTMMznCy0CUGHGwilsvhwTOv0phPZk3Spm8
         3cVw==
X-Forwarded-Encrypted: i=1; AJvYcCXVae2qt+zv4SfsKcxC27TybcMjg7l5YBgg4Eqrpcxbzz+yUjgAub3Slah2N6X5eVO7mkX6tR/qBFCr+WK0bcrcS5p/+XueV9vIF8v/YiA=
X-Gm-Message-State: AOJu0YyVkf60K7YirBs5AQKMjO4voHqRoZT5TLJvyxkYhNc1VhWOKpKB
	64NY9fW/nAWBIQYDkqSyKj5p/7T9P46XfL9+87XaV4dYb8EVMPv6C719HYwcI7E=
X-Google-Smtp-Source: AGHT+IF/PQU707pGUrM+QiaobJ/qGWLuci8Nwf9AvYKnR0BxkXkAjiyfTe5Tbehaxr7qoMKFjMw9Ng==
X-Received: by 2002:a05:6214:5c44:b0:6a0:d20e:5406 with SMTP id 6a1803df08f44-6a16814f5b6mr32649476d6.17.1715364051980;
        Fri, 10 May 2024 11:00:51 -0700 (PDT)
Message-ID: <7384a44d-0eb8-4033-98b6-ddb7fd9a8131@citrix.com>
Date: Fri, 10 May 2024 19:00:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxl: Fix handling XenStore errors in device creation
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <84a6e6376ab9f5aafac8f33bf772d73fcfd0d818.1713998669.git.demi@invisiblethingslab.com>
 <c978ac2b-0529-4bd8-a493-55e806740808@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c978ac2b-0529-4bd8-a493-55e806740808@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2024 9:05 am, Jürgen Groß wrote:
> On 27.04.24 04:17, Demi Marie Obenour wrote:
>> If xenstored runs out of memory it is possible for it to fail operations
>> that should succeed.  libxl wasn't robust against this, and could fail
>> to ensure that the TTY path of a non-initial console was created and
>> read-only for guests.  This doesn't qualify for an XSA because guests
>> should not be able to run xenstored out of memory, but it still needs to
>> be fixed.
>>
>> Add the missing error checks to ensure that all errors are properly
>> handled and that at no point can a guest make the TTY path of its
>> frontend directory writable.
>>
>> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
>
> Apart from one nit below:
>
> Reviewed-by: Juergen Gross <jgross@suse.com>
>
>> ---
>>   tools/libs/light/libxl_console.c | 10 ++---
>>   tools/libs/light/libxl_device.c  | 72 ++++++++++++++++++++------------
>>   tools/libs/light/libxl_xshelp.c  | 13 ++++--
>>   3 files changed, 59 insertions(+), 36 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_console.c
>> b/tools/libs/light/libxl_console.c
>> index
>> cd7412a3272a2faf4b9dab0ef4dd077e55472546..adf82aa844a4f4989111bfc8a94af18ad8e114f1
>> 100644
>> --- a/tools/libs/light/libxl_console.c
>> +++ b/tools/libs/light/libxl_console.c
>> @@ -351,11 +351,10 @@ int libxl__device_console_add(libxl__gc *gc,
>> uint32_t domid,
>>           flexarray_append(front, "protocol");
>>           flexarray_append(front, LIBXL_XENCONSOLE_PROTOCOL);
>>       }
>> -    libxl__device_generic_add(gc, XBT_NULL, device,
>> -                              libxl__xs_kvs_of_flexarray(gc, back),
>> -                              libxl__xs_kvs_of_flexarray(gc, front),
>> -                              libxl__xs_kvs_of_flexarray(gc,
>> ro_front));
>> -    rc = 0;
>> +    rc = libxl__device_generic_add(gc, XBT_NULL, device,
>> +                                   libxl__xs_kvs_of_flexarray(gc,
>> back),
>> +                                   libxl__xs_kvs_of_flexarray(gc,
>> front),
>> +                                   libxl__xs_kvs_of_flexarray(gc,
>> ro_front));
>>   out:
>>       return rc;
>>   }
>> @@ -665,6 +664,7 @@ int libxl_device_channel_getinfo(libxl_ctx *ctx,
>> uint32_t domid,
>>                 */
>>                if (!val) val = "/NO-SUCH-PATH";
>>                channelinfo->u.pty.path = strdup(val);
>> +             if (channelinfo->u.pty.path == NULL) abort();
>
> Even with the bad example 2 lines up, please put the "abort();" into a
> line of its own.

I've fixed this on commit.

~Andrew

