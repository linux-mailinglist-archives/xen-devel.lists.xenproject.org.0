Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5044A07C99
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868920.1280434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVusE-0007Ub-Rg; Thu, 09 Jan 2025 15:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868920.1280434; Thu, 09 Jan 2025 15:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVusE-0007S1-Nr; Thu, 09 Jan 2025 15:55:06 +0000
Received: by outflank-mailman (input) for mailman id 868920;
 Thu, 09 Jan 2025 15:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29Hz=UB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVusD-0007Rt-8f
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:55:05 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16af444a-cea2-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:55:03 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-300479ca5c6so8808841fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:55:03 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1ebb63sm2324631fa.96.2025.01.09.07.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:55:01 -0800 (PST)
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
X-Inumbo-ID: 16af444a-cea2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736438103; x=1737042903; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8yeQF4QbrMUy3HK3QxSViXwORXCyeEFAzj9Y5YjtRM=;
        b=d2HmGKQBKuV5csUTOe+X3uKXDbD+eLWS2a9DmaXOCQZLCNbffLkSdK/fYLTBKHHvWo
         EIZs/0G3OkRinRcapDvoa1tOPz9o73jjbpDIk5odrWsvFiKTcn6MTBmQ8v8k1dJ2goYb
         oDNYpE4i7FwN+yWVso7sbARqEwenJz4v7cgKT+QKqmzFLHSmmPCU0KRUJdxQuH/r0MAE
         lfIUKc4yJDUpxq3gCRo/s1p6p0Vz4S09aU3Pl4x9kTrRxJtlyQY5sRtXw0EiZqdY6smh
         7IaHTGdHD6Mglynf4AtIiiTnez/nzcfv7T3KsSYpVG3bVxuzH+P6a75cXUyWuzuo6gKs
         Nuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736438103; x=1737042903;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L8yeQF4QbrMUy3HK3QxSViXwORXCyeEFAzj9Y5YjtRM=;
        b=b9TDCByM/OeaEsrfzsjIrXMVgwnIJC1alWrnE3VudMr89ZwilVGGPAYGLYTFC3GSJU
         VzW7fhmt6Cj7/CgCwWPgWXK0pDm5IpCFJwmTdEyFZDZi9DHs7kmCN/mlJgKtSF1qh2DZ
         GHL+vlyenPANeF2xLKFqKD/ADKss8mw3jXW8EGgIoD8wRwJ+6aUUFSvkQBHyqaZ4ysug
         dpl+f1vMkUkQJLyDMSmWVbzWjxU3P/EDkFbUGwmze2rw+ObOnNYYy4Q3YhSmJTl7r+6Q
         f7F+nM/LGD4iirW9glp6zO+R4TFh2KI8EsyCiA5Fm6gPOD7m8Fr+F/sk+eo8za5+ehJf
         YbTA==
X-Forwarded-Encrypted: i=1; AJvYcCUlQXXK34DR2mmtw4IZkMizbzpXc4yeu3CTJ1R/bld54p56kJ/SZnXek9tR70xzOPH7axWCkCJQPak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUOyJyGPLuLJJZ1KIf8p8zhRwdD4E13CZyM/Q/W6IHm5FMjAAA
	0RmZLcoAZqcdmM8k0yxmoiFjm/V+Q2KCboS36Bym+8Yf4kyFpcZF
X-Gm-Gg: ASbGnctjpN9T7RbQphK8McR0fKkIr7ebUK5tP6Z2+kHo9J4EKS0zDbkA4Z0HdZA5nYN
	FUHJrcqb02j2Inr9eqg3n05q4svHhtcoELX+/aIGo5UQIpL5QGVV3XYPwDwm2GbjhU/0anONWOE
	z6yYi2zV2DHsULzG4KUV+tZyvAWvTAu8UDFtVBgCTYh/sM4PaXmQ6DZOuAv6FGswVbHqST5kuiI
	6PkD6pfAv2jMefnZYLS7LeSrjNX0VVQBr/x3MJwTgATM/B54NIp0sV5nrZ40XtFNHtesw==
X-Google-Smtp-Source: AGHT+IEKfHUWrJDD8bEabRwbJ32SYxsuXkv3gOIqFuCJZBfs0ItVTOoqG1M0qsskIdkgyHqKIvuOKQ==
X-Received: by 2002:a2e:a98f:0:b0:2ff:d49f:dd4b with SMTP id 38308e7fff4ca-305f458a81emr18604901fa.15.1736438102263;
        Thu, 09 Jan 2025 07:55:02 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------9WCPFP1tX0sdya0BKyGT03DO"
Message-ID: <a353258c-ac39-4ac0-b6ca-975b77d0e847@gmail.com>
Date: Thu, 9 Jan 2025 16:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Update Xen version to 4.20-rc
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250109153921.43610-1-andrew.cooper3@citrix.com>
 <20250109153921.43610-3-andrew.cooper3@citrix.com>
 <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <67278014-8208-48f2-92ba-7b843a0d373b@suse.com>

This is a multi-part message in MIME format.
--------------9WCPFP1tX0sdya0BKyGT03DO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/9/25 4:44 PM, Jan Beulich wrote:
> On 09.01.2025 16:39, Andrew Cooper wrote:
>> --- a/README
>> +++ b/README
>> @@ -1,11 +1,11 @@
>> -############################################################
>> -__  __                                _        _     _
>> -\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
>> - \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
>> - /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
>> -/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
>> -
>> -############################################################
>> +#####################################################
>> +__  __            _  _    ____   ___
>> +\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
>> + \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
>> + /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
>> +/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
>> +
>> +#####################################################
>>   
>>   https://www.xen.org/
>>   
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>>   
>>   # Release Support
>>   
>> -    Xen-Version: 4.20-unstable
>> +    Xen-Version: 4.20-rc
>>       Initial-Release: n/a
>>       Supported-Until: TBD
>>       Security-Support-Until: Unreleased - not yet security-supported
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
>>   # All other places this is stored (eg. compile.h) should be autogenerated.
>>   export XEN_VERSION       = 4
>>   export XEN_SUBVERSION    = 20
>> -export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>> +export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
> Since we'd been there before I take it the .0 in here (which isn't in the
> changes to the other two files) is deliberate now? Clearly I continue to
> think it shouldn't be put there together with -rc.

But in docs/process/{release-technician-checklist, 
xen-release-management}.pandoc .0 is used.

So probably then we have to update docs correspondingly to avoid confusion.

~ Oleksii

>
> Jan
--------------9WCPFP1tX0sdya0BKyGT03DO
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
    <div class="moz-cite-prefix">On 1/9/25 4:44 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:67278014-8208-48f2-92ba-7b843a0d373b@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.01.2025 16:39, Andrew Cooper wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/README
+++ b/README
@@ -1,11 +1,11 @@
-############################################################
-__  __                                _        _     _
-\ \/ /___ _ __        _   _ _ __  ___| |_ __ _| |__ | | ___
- \  // _ \ '_ \ _____| | | | '_ \/ __| __/ _` | '_ \| |/ _ \
- /  \  __/ | | |_____| |_| | | | \__ \ || (_| | |_) | |  __/
-/_/\_\___|_| |_|      \__,_|_| |_|___/\__\__,_|_.__/|_|\___|
-
-############################################################
+#####################################################
+__  __            _  _    ____   ___
+\ \/ /___ _ __   | || |  |___ \ / _ \       _ __ ___
+ \  // _ \ '_ \  | || |_   __) | | | |_____| '__/ __|
+ /  \  __/ | | | |__   _| / __/| |_| |_____| | | (__
+/_/\_\___|_| |_|    |_|(_)_____|\___/      |_|  \___|
+
+#####################################################
 
 <a class="moz-txt-link-freetext" href="https://www.xen.org/">https://www.xen.org/</a>
 
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.20-unstable
+    Xen-Version: 4.20-rc
     Initial-Release: n/a
     Supported-Until: TBD
     Security-Support-Until: Unreleased - not yet security-supported
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -6,7 +6,7 @@ this-makefile := $(call lastword,$(MAKEFILE_LIST))
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
 export XEN_SUBVERSION    = 20
-export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
+export XEN_EXTRAVERSION ?= .0-rc$(XEN_VENDORVERSION)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Since we'd been there before I take it the .0 in here (which isn't in the
changes to the other two files) is deliberate now? Clearly I continue to
think it shouldn't be put there together with -rc.</pre>
    </blockquote>
    <pre><font face="monospace">But in docs/process/{release-technician-checklist, xen-release-management}.pandoc .0 is used.</font></pre>
    <pre><font face="monospace">So probably then we have to update docs correspondingly to avoid confusion.</font></pre>
    <pre><font face="monospace">~ Oleksii</font>
</pre>
    <blockquote type="cite"
      cite="mid:67278014-8208-48f2-92ba-7b843a0d373b@suse.com">
      <pre wrap="" class="moz-quote-pre">

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------9WCPFP1tX0sdya0BKyGT03DO--

