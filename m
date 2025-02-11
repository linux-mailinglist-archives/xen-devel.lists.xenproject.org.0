Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E35A30BCC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 13:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885523.1295333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpUN-0004W1-EQ; Tue, 11 Feb 2025 12:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885523.1295333; Tue, 11 Feb 2025 12:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thpUN-0004Tn-Bh; Tue, 11 Feb 2025 12:35:43 +0000
Received: by outflank-mailman (input) for mailman id 885523;
 Tue, 11 Feb 2025 12:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GN4I=VC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thpUM-0004Te-2D
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 12:35:42 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4481f6b-e874-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 13:35:41 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-545074b88aaso2803023e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 04:35:41 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ed31sm1505086e87.2.2025.02.11.04.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 04:35:39 -0800 (PST)
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
X-Inumbo-ID: b4481f6b-e874-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739277340; x=1739882140; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80myv50D9AEhFLFa2N6MAvizzw7aZNCwmtsr34wjeXI=;
        b=OuTOMg4xtPEjIJvmMeaJ0Kz+bWyUGtDiEFNalYT7T9Ftwl9J3RVFTU7lMA0AC/633e
         +GnEbvGq38S+jwx/HEb3HEvJH9F0RO1+SgFRK495lBmSuqENL6DlcFfk4W1aXQLwp0tP
         VOeRfH/DExLTiv3XfaTOb7oZHHI4bas3rl0WbhN3TPqfC+X16p719QAx6QxG5MYv61ya
         hXWE/u46xEu3z1M4qcoe7M7cQ98N6yhcKOrJhU146pF7Mu3gLHaLUYYJ+Oax+A0Q/CUa
         lfI2pNQR9I/OlWpGW3oS7cOAhDZMITcUL6mmeAq4GyGqjJDkKlg7NOl6UGJ+GR5ej4HI
         smQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277340; x=1739882140;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80myv50D9AEhFLFa2N6MAvizzw7aZNCwmtsr34wjeXI=;
        b=UZQjEOaJYZ01gmvO2YXtpTGuodehd/2qjyrXHyYjQrpOue5YG4ng9ywa5Z1sQnrVFM
         WDwfY616Bll84lBQ8coyHKdF3QfcqgbDTwg6UrIAEdl17Fb1tIP3KkIJ3+bx4hxsi4/q
         xCl7CfT4VWAmiSRC+eNB1wtQX4gKg6HxAByDY0gWYPzYRPUgV8RysIHckf7s/sKdiVfW
         iXRNBITzJXFLYggyNhnz9fkqfWSrKr6cokcGSxbr7mOBVOlSPa9g+x+nYmHNo50d15ni
         sAwHw/TqLVLfCnxnWewvX100VBESN2sDjEPAJdnQNIVDTi365nw4zgEEopT7J4TXM42U
         t4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzk1tfHzTy7855GT/hkCktUOPGl2GjRQkFXHjqxCvFMqC5wREqZ31huhXlSNdHjeiFmO6ujQGmi9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywx82wpLcHqige2fPWk4zPn1P/jO5FoZW9qLsIUsjoll3vRsryU
	zdm2vmo6w704P7405qcNd4blPnjnMRR3xxQLOLbhyFBfLTy4ZaQh
X-Gm-Gg: ASbGncs07/xTb2dR2QdYwMLJ0bpBjhGy77ve9FC4BTFTMPVPXDxrGll+Mbuj04ygXyE
	sYoYXYxkyUFiAv4rn+zRfY5lwzFK5prUUj0AyCGkJArWFZeSXW090DrJBMoiIgD6RqpdvQZCfBr
	oAONIsO1tne9zNqQiV3TEfv8J2BHYMSUHmvQ1AlrTSqc22aB0SmET2iNEJKq3lZE2qh8kid8p2A
	twkM+mtooTFRjARYwJNjbfFLl/9PKjz6gJMu7sIGl3WoC1u1IHqnGBmYUVBQgTDGT1k4sPzEQ3x
	19Ml0f0+EFfgQl3NJcNX0oY2FPg=
X-Google-Smtp-Source: AGHT+IExhA15BM3wbM76XsMGKqy7zNiYXOl7Ll/O8EMJrTeu5u2ZZS1tOfQEshJsuIcO6dFWOe6YwA==
X-Received: by 2002:a05:6512:2355:b0:540:2da2:f282 with SMTP id 2adb3069b0e04-54414ae0c64mr5452877e87.42.1739277340187;
        Tue, 11 Feb 2025 04:35:40 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------sEbBGbL7P9mICWVnUSgKHJLf"
Message-ID: <7826fa17-f0db-40f2-8d82-c50a466cfedf@gmail.com>
Date: Tue, 11 Feb 2025 13:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] tools: fix typo in sysconfig.xencommons.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, dmkhn@proton.me,
 xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250211073106.189350-1-dmkhn@proton.me>
 <6565b1e3-1e7e-4534-a8ab-88c7abb8abd0@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <6565b1e3-1e7e-4534-a8ab-88c7abb8abd0@citrix.com>

This is a multi-part message in MIME format.
--------------sEbBGbL7P9mICWVnUSgKHJLf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/11/25 1:23 PM, Andrew Cooper wrote:
> On 11/02/2025 7:31 am,dmkhn@proton.me wrote:
>> From: Denis Mukhin<dmukhin@ford.com>
>>
>> Signed-off-by: Denis Mukhin<dmukhin@ford.com>
> Acked-by: Andrew Cooper<andrew.cooper3@citrix.com>
>
> CC Oleksii for 4.20 consideration.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
>> ---
>>   tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
>> index 1bdd830d8a..1720a9b075 100644
>> --- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
>> +++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
>> @@ -8,7 +8,7 @@
>>   ## Type: string
>>   ## Default: daemon
>>   #
>> -# Select type of xentore service.
>> +# Select type of xenstore service.
>>   #
>>   # This can be either of:
>>   #  * daemon
--------------sEbBGbL7P9mICWVnUSgKHJLf
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
    <div class="moz-cite-prefix">On 2/11/25 1:23 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6565b1e3-1e7e-4534-a8ab-88c7abb8abd0@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 11/02/2025 7:31 am, <a class="moz-txt-link-abbreviated" href="mailto:dmkhn@proton.me">dmkhn@proton.me</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Denis Mukhin <a class="moz-txt-link-rfc2396E" href="mailto:dmukhin@ford.com">&lt;dmukhin@ford.com&gt;</a>

Signed-off-by: Denis Mukhin <a class="moz-txt-link-rfc2396E" href="mailto:dmukhin@ford.com">&lt;dmukhin@ford.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>

CC Oleksii for 4.20 consideration.</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:6565b1e3-1e7e-4534-a8ab-88c7abb8abd0@citrix.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 tools/hotplug/Linux/init.d/sysconfig.xencommons.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
index 1bdd830d8a..1720a9b075 100644
--- a/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
+++ b/tools/hotplug/Linux/init.d/sysconfig.xencommons.in
@@ -8,7 +8,7 @@
 ## Type: string
 ## Default: daemon
 #
-# Select type of xentore service.
+# Select type of xenstore service.
 #
 # This can be either of:
 #  * daemon
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------sEbBGbL7P9mICWVnUSgKHJLf--

