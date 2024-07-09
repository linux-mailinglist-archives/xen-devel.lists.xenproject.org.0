Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFA92BE1D
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 17:21:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756346.1164933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCeT-0005Ix-Ca; Tue, 09 Jul 2024 15:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756346.1164933; Tue, 09 Jul 2024 15:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCeT-0005HE-8u; Tue, 09 Jul 2024 15:21:09 +0000
Received: by outflank-mailman (input) for mailman id 756346;
 Tue, 09 Jul 2024 15:21:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u1XU=OJ=suse.com=carnold@srs-se1.protection.inumbo.net>)
 id 1sRCeS-0005H8-C9
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 15:21:08 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc5c1ad4-3e06-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 17:21:06 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so55823771fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 08:21:06 -0700 (PDT)
Received: from [172.16.0.12] (c-76-140-71-54.hsd1.ut.comcast.net.
 [76.140.71.54]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-38a49555913sm4587145ab.25.2024.07.09.08.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:21:04 -0700 (PDT)
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
X-Inumbo-ID: dc5c1ad4-3e06-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720538465; x=1721143265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdXh7hURo3GfaojHqgajUmu19rwMkfoV3XNvh/xNQb0=;
        b=dmIlPucbOM67QQlaEHbeQIAiwnHXqRgOWNvyHXqT6nPf06B00QxrqBFq5JpjMqeU7T
         5tLdJQkqrUDujqDRrvDMS9hDP2e4faNiLv+yLPnWkzIQJjdcWio40BkgPK1LZFeeRJ03
         Ap495Uq7zIiyYlYQM+aPXsM5OE60okQPOU/nd7yZL+GDLbReODNPBzkavOcP1VI/K04q
         QzoxyzP0fffYTWc2e19xETg2FuES8mbW8R5TDYun9Lf9ATogLJHW63pKcH7BJAGI4kYQ
         20ZUrut8ahGEF9mbIEkRPHUXuk5qePCY+LasHowgEFONqEPewBiY+5iAQXbsaafIktO5
         ntgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538465; x=1721143265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdXh7hURo3GfaojHqgajUmu19rwMkfoV3XNvh/xNQb0=;
        b=rzVOkAGZhaiRBIoltRdqeG5GLws1H7lWC7jOifan5iJbZmoauv2/eEQv/+sUidhrd9
         +Ve8PYcg3J9eArTU+z29mMj2C9mRlYD4IBbMbVtwL1AjgabjEhD787hY15TxZ7X09TYc
         WgvJSUF/JPeYWjZRFi+wDMc04ysvBQUkEX1HTO/kxYQ+Jj/gDSlB4+pa415CzYhw50+s
         wwFcxd8J+GWddGtqjuv1gTge1PlU7zSxfglY61KWihCJF1xdFRqoDoQUStOAaROUWcEn
         Xw10BR86/JRIdKTA8cZ1IE3bjNL71q4ud2GodvzUaWZ0wdNshUYP/RxvNlCVbaS27zcU
         1+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWm5jnxQ5mjNiv73pnQ9m52jKfrwNLmHdqYw9QhZHOCTUOhW2JZCQHzITsvKcgssshnRTVQNGJXqK5uIQe8xV1srZDMVE/cAPCOO3G59Fo=
X-Gm-Message-State: AOJu0YyEMqo/b1VRj4aZ23RZM1Yj1QJryprxa5NQ+/K5CO4kgBPIFFlV
	eHKv8r018T4jTeNwtbzuJzprDPZOE3n3l24r879oGfdvUVaKjLnKGm4nNLUs3vg=
X-Google-Smtp-Source: AGHT+IF/Wa3VhyqMeLwurPEMgPpkhSUg2/uYJOumUjpXYSTmf9SYkIikinZnR5pUOEephQSGcRr3ew==
X-Received: by 2002:a05:651c:1a0a:b0:2ec:5f6e:65ea with SMTP id 38308e7fff4ca-2eeb3188ccamr24222771fa.38.1720538465427;
        Tue, 09 Jul 2024 08:21:05 -0700 (PDT)
Message-ID: <4e7028a3-b513-4a97-adef-dfc25d9607b9@suse.com>
Date: Tue, 9 Jul 2024 09:21:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build system mess in stubdom
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony@xenproject.org>
References: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
 <ad9b8dab-3f1c-4f26-845b-af88f96ee1ee@suse.com>
From: Charles Arnold <carnold@suse.com>
In-Reply-To: <ad9b8dab-3f1c-4f26-845b-af88f96ee1ee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/9/24 8:55 AM, Jan Beulich wrote:
> On 09.07.2024 15:49, Andrew Cooper wrote:
>> I'm trying to investigate why stubdom/ is fatally failing now with a
>> rebuilt ArchLinux container (GCC 14).
>>
>> It is ultimately:
>>
>>> ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
>>> implicit declaration of function ‘kill’; did you mean ‘_kill’?
>>> [-Wimplicit-function-declaration]
>>>     61 |   if ((ret = _kill (pid, sig)) == -1 && errno != 0)
>>>        |              ^~~~~
>>> make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1
>> which doesn't make sense, but is a consequence of the ifdefary in
>> newlib/libc/include/_syslist.h
> Charles, who is looking after our Xen packages, had run into exactly this.
> His workaround patch (added to the list of patches applied on top of
> newlib by stubdom/Makefile) is below, but in the given form I didn't expect
> it would be upstreamable. The diagnostics by the compiler may be a little
> misleading ...

This problem showed up only with gcc14 when it began treating what was 
previously a warning as an error.

Charles

>
> Jan
>
> --- newlib-1.16.0/newlib/libc/stdlib/wcstoull.c
> +++ newlib-1.16.0/newlib/libc/stdlib/wcstoull.c
> @@ -127,6 +127,10 @@ PORTABILITY
>
>   #ifndef _REENT_ONLY
>
> +#if __GNUC__ >= 14
> +#pragma GCC diagnostic ignored "-Wimplicit-function-declaration"
> +#endif
> +
>   unsigned long long
>   _DEFUN (wcstoull, (s, ptr, base),
>   	_CONST wchar_t *s _AND
> --- newlib-1.16.0/newlib/libc/reent/signalr.c
> +++ newlib-1.16.0/newlib/libc/reent/signalr.c
> @@ -49,6 +49,10 @@ DESCRIPTION
>   	<<errno>>.
>   */
>
> +#if __GNUC__ >= 14
> +#pragma GCC diagnostic ignored "-Wimplicit-function-declaration"
> +#endif
> +
>   int
>   _DEFUN (_kill_r, (ptr, pid, sig),
>        struct _reent *ptr _AND
> --- newlib-1.16.0/newlib/doc/makedoc.c
> +++ newlib-1.16.0/newlib/doc/makedoc.c
> @@ -798,6 +798,7 @@ DEFUN( iscommand,(ptr, idx),
>   }
>
>
> +static unsigned int
>   DEFUN(copy_past_newline,(ptr, idx, dst),
>         string_type *ptr AND
>         unsigned int idx AND
>


