Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC7A39555
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 09:29:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891125.1300211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkIyL-0007uk-F7; Tue, 18 Feb 2025 08:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891125.1300211; Tue, 18 Feb 2025 08:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkIyL-0007re-Bt; Tue, 18 Feb 2025 08:28:53 +0000
Received: by outflank-mailman (input) for mailman id 891125;
 Tue, 18 Feb 2025 08:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKhn=VJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tkIyJ-0007rY-NC
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 08:28:51 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c1b9ad9-edd2-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 09:28:41 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5452ed5b5b2so3493554e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 00:28:41 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545312bc4b5sm1144573e87.143.2025.02.18.00.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 00:28:39 -0800 (PST)
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
X-Inumbo-ID: 5c1b9ad9-edd2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867321; x=1740472121; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuJtu3C4+dyHTEV+SjaY0aeUHviyKWrr5J8Mm2LPwJ8=;
        b=CCq1UKL7itekpbZX41ruWP6OtqC+CyY7vsCOx2vK1E60KKw/nrFD/nzD985TlzZOLE
         kYM7NXHnIxeXRWgt0Vk9p0WiN3icflmfF6aqDp45i5o4720Bm2U2NT9LBwTIZrfqCF2d
         W//9APc0h4cw9c28NTaRSZvumgeMwJuANKAfb4u3sTdG9wAGG0t6KdvMVklziPXRzLEj
         Nja2hvzNK46JP9HKcr6srCzrVCnXIvuy48w9SBf+D//16uEq2oFUgPjWJ12wgoz4WrdV
         IZpxfilW20vh+A07Xy0jYgCyd+OQfj5y+BUzGz6Ndy3zJPh2+PFKwd8CbkNK0NBydvSk
         uJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867321; x=1740472121;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LuJtu3C4+dyHTEV+SjaY0aeUHviyKWrr5J8Mm2LPwJ8=;
        b=TNxv6iDMBhVfwuwuVZeMBZbi3lIvQ18DdMFVyHSpSepH4HNwLIQbCXO4c5agLkwg4n
         LCPSvLlOkjIQ6qLcdvjEvLGuI/iYDGIn6Qy0RyxJ98gkTbwDTq9dviPgu02fJ9gfATm9
         9RflZsN1Agaji15V/LPA77db2qQp8CRSwkW2Mf0R5c4mO6DLDLWM8zYL33tOZiVCBKoZ
         KQLNaf/HG5OloA9hgCnHfc5dwayi5UUAsoRfZli4W7ian5+TgeENOwe9xWt5h8a6v/2b
         f+2UoSGelae4eSUrP0jx8AoLHWPZks9lwUemKeh1IOGNR/vkY+f2Ri/yfcLAhUiRRvyM
         +cxA==
X-Forwarded-Encrypted: i=1; AJvYcCXqsWcop2yV9myFgxFEcvT+IR5Ww1XExn53lUvABwFysOEJ42htu+8rGz2jxf8QMm3Xahppj6Dc8jk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7sFi2Yp8eB31iS1vKsF9iH+H78VsKNu2L3NBnYBxpyJ6FvsZl
	XYlmAVo0KcmC8/TKY0qDLJsGVa/tVglf3ENk0qpU7yyC7QWdoql0
X-Gm-Gg: ASbGncv0rQXVRWlgAjpcyvQEF3davbOvLJVVCCpPYzikJfbXrIoY5W+Zw0qcmKzrFKs
	EBEX7mf2F2N6EYsawDEEWoI00bfNWXnsgy/IWs44xyGUVNDw7/h8Vm9obUDOUBqRwiizxzgtwmF
	BddMt/WTPoHwS4Zil3DayneAJw9B19ukSph4SK0sHOZ3O+X7nGDVjpkI5vbWaNptsqvO9uO9/uD
	CkzN2HkNNsU4+WGyvE3AmVroEyAe2RCuA9t9gYr9e7aTFkOM85buk7uVB/OnrkNHwPjQzkFckrD
	larSGPJoLqct5drkEdKAhyoq
X-Google-Smtp-Source: AGHT+IESOBTa9lwg/zAnAmFdqtRkOZt+2WBBoCjaMMvgMUUy1f88VwPZxkak09LSO+j6b580bat8eA==
X-Received: by 2002:a05:6512:3d1b:b0:545:a2a:589 with SMTP id 2adb3069b0e04-5452fe7aee8mr4540063e87.52.1739867320667;
        Tue, 18 Feb 2025 00:28:40 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ugpHi0RFMPkE4wsnZ7i5pQhA"
Message-ID: <d6eed534-ede2-4579-9943-3f86b6a964df@gmail.com>
Date: Tue, 18 Feb 2025 09:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 for-4.20] xen/memory: Make resource_max_frames() to
 return 0 on unknown type
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250217223402.167514-1-olekstysh@gmail.com>
 <aba8c80c-442a-4b3a-a283-729c341d6ede@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aba8c80c-442a-4b3a-a283-729c341d6ede@citrix.com>

This is a multi-part message in MIME format.
--------------ugpHi0RFMPkE4wsnZ7i5pQhA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/17/25 11:41 PM, Andrew Cooper wrote:
> On 17/02/2025 10:34 pm, Oleksandr Tyshchenko wrote:
>> diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
>> index 1b10be16a6..521c1fc51a 100644
>> --- a/tools/tests/resource/test-resource.c
>> +++ b/tools/tests/resource/test-resource.c
>> @@ -123,6 +123,16 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
>>           fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
>>           xenforeignmemory_unmap_resource(fh, res);
>>       }
>> +
>> +    /*
>> +     * If this check starts failing, you've find the right place to test your
> s/find/found/
>
> Can fix on commit, if Oleksii is happy for this to go into 4.20.
>
> Reviewed-by: Andrew Cooper<andrew.cooper3@citrix.com>

The fix looks simply and low risk so lets take it into 4.20:
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------ugpHi0RFMPkE4wsnZ7i5pQhA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/17/25 11:41 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:aba8c80c-442a-4b3a-a283-729c341d6ede@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 17/02/2025 10:34 pm, Oleksandr Tyshchenko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index 1b10be16a6..521c1fc51a 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -123,6 +123,16 @@ static void test_gnttab(uint32_t domid, unsigned int nr_frames,
         fail("    Fail: Managed to map gnttab v2 status frames in v1 mode\n");
         xenforeignmemory_unmap_resource(fh, res);
     }
+
+    /*
+     * If this check starts failing, you've find the right place to test your
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
s/find/found/

Can fix on commit, if Oleksii is happy for this to go into 4.20.

Reviewed-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>The fix looks simply and low risk so lets take it into 4.20:
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------ugpHi0RFMPkE4wsnZ7i5pQhA--

