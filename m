Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C641AC684E
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 13:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999340.1380036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKEti-0004iB-1Y; Wed, 28 May 2025 11:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999340.1380036; Wed, 28 May 2025 11:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKEth-0004f4-UD; Wed, 28 May 2025 11:24:37 +0000
Received: by outflank-mailman (input) for mailman id 999340;
 Wed, 28 May 2025 11:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kwEP=YM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uKEtg-0004ey-6V
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 11:24:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 525e91c1-3bb6-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 13:24:30 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-604bf67b515so5234463a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 04:24:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6051d79ecc2sm630790a12.72.2025.05.28.04.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 04:24:29 -0700 (PDT)
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
X-Inumbo-ID: 525e91c1-3bb6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748431469; x=1749036269; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UYj72m+Tuuzp/nNHOvzVSeNM3/v1yE1vFpw1udpOJ8=;
        b=Jrb3FDiShkYIa6LUQLYPas3pSV6qcFNmP6g/RC+1w09u+Ua+P7HjF7AvvAaWZbkvUI
         BtI1fBSNEFF7tknwbI7dbslbUogJeQ+xojuIIw9V4ejYnuZpMkAevqJZJGXcMKOcoaB9
         XZxIxSPY0HQ17kpkpzfDeuLQa7TIhVAko3AD4kFNA6UBYseBe2Bw0h8UF1dfnwZEOeZs
         dIsjZaZaJpBoDkLVSIXz9WFbZ1itwyaebjwS6gZQu1lyX6vIWFxaYq7/lu5YMCa755pd
         CqmAspFo9Tpcwpq3UaD5Gx3UNDBAFGUhKZprMzz1otpRQbCz3ym7ptiAVIzyKVrSTjFJ
         IibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431469; x=1749036269;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UYj72m+Tuuzp/nNHOvzVSeNM3/v1yE1vFpw1udpOJ8=;
        b=OQXHMMis1U6jU132oLBGsdbjjs0jkWEzEs7VzDPewLtgTdpHarlm94XES9YucVODEU
         lKEPG6zltT04WNzbFXdaop7o8YvtTxjc9nI/ovi3acq6KuMxqEB+BzO3UULWblfvgb9e
         /y6pdEFdTJXxIocZ9cOiE3s4ZzCDhqdTVcKPIq7sKvwUiGOBy17XoOTzGFjDvewbCRDY
         E6jEkO+xN5z1aKlPUM9fPNl7yxX3N98Rjj9K+OmflUvOmV7s5/YXyPGkKI7IXszoVbCq
         eH0os3NM6JtbZFmwUkS6w8/Gc93AFhkXBnVQB91z8EhkELAdAmswmVio0ayHWB3t45l7
         F/4Q==
X-Gm-Message-State: AOJu0Yy4peeepGPTlQnJ7rVrZfyiziN4egCx6+xymoM9WgHtIOWyV6lb
	bow5wPhG0m2D9abGjLYZqGxu2jrYgrNSKyblbALtThMwkfQE0YKj5eGTj7G9zg==
X-Gm-Gg: ASbGncudHSADv17Qi0F6ESmUaE8nYSto1JFbRVkFTwAmOaiDoflofdPtC3CR4yDYm8y
	wAjk8eFaE+juvfogGLk3rKWmC9qFtuqvcx4HdKhziiTqON+oeTT+nR2jZw9ZA7ylg6i0Vr2+cLY
	G3gzxZqZHPjjyDgnBay8BEysxaPBXxD2MKuY+tJlEVBvoD87XTWIjjzXUbAgfNNLuEJFDc9eAey
	QcoLLqenIGXVW2TqUOGMySxF7eNY2bNCKebJZpDOqopN5qAc54WRxQDjQDEg5xZGyOdMKRN7jQ6
	kTjArhkwJl68u+dORV3ZZXcyCTLuN9owVuhSrM6pTCcy/V4uNNUnWeI1ksp06Rq/3RxGXWIuSp4
	N14teQ6EkDVrrSmKRqt7q5BSl
X-Google-Smtp-Source: AGHT+IG8FZWq4454WCOeiHFVc3gf7OCMcNsRZCgkC7DVLuZezpYzOmk1oUFNTMGeGg0DV/nU/Lv5EA==
X-Received: by 2002:a05:6402:35c6:b0:602:29e0:5e24 with SMTP id 4fb4d7f45d1cf-602d7c98073mr13173091a12.0.1748431469448;
        Wed, 28 May 2025 04:24:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------rsutJmwHO93pmXm4UdSR3QCs"
Message-ID: <925e0d63-2960-47a4-9b25-3ff053e36434@gmail.com>
Date: Wed, 28 May 2025 13:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 1 4/4] CHANGELOG: Mention Xen suspend/resume to
 RAM feature on arm64
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>,
 Community Manager <community.manager@xenproject.org>
References: <cover.1748337249.git.mykola_kvach@epam.com>
 <1035d97375bad4b3e6f86e78cbe4e46abdbc2de9.1748337249.git.mykola_kvach@epam.com>
 <87034726-3a26-4146-ad05-655058b9eba9@gmail.com>
 <CAGeoDV-=jD3_9hbx3H5buDTxyGY5S-CQk0LoWe7cNbCK6mo=Fg@mail.gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <CAGeoDV-=jD3_9hbx3H5buDTxyGY5S-CQk0LoWe7cNbCK6mo=Fg@mail.gmail.com>

This is a multi-part message in MIME format.
--------------rsutJmwHO93pmXm4UdSR3QCs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/27/25 6:05 PM, Mykola Kvach wrote:
> Hi, @Oleksii Kurochko
>
> On Tue, May 27, 2025 at 6:38 PM Oleksii Kurochko
> <oleksii.kurochko@gmail.com> wrote:
>> Hello Mykola,
>>
>> On 5/27/25 11:18 AM, Mykola Kvach wrote:
>>
>> From: Mykola Kvach<mykola_kvach@epam.com>
>>
>> Signed-off-by: Mykola Kvach<mykola_kvach@epam.com>
>> ---
>>   CHANGELOG.md | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>> index ec452027f5..fc89ed6e09 100644
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>
>>    - On Arm:
>>       - Ability to enable stack protector
>> +    - Support guest suspend/resume to/from RAM
>>
>>   ### Removed
>>    - On x86:
>>
>> According to your commit message, suspend/resume will only work for Arm64.
>> I think it would be good to mention that in the CHANGELOG.md as well.
> Thank you for pointing that out — in this case, I forgot to drop
> "arm64" from the commit message.

Then it makes sense to me to drop it in next patch series version.

> For non-hardware domain guests, suspend/resume support is available
> for both ARM32 and ARM64.
> When PSCI SYSTEM_SUSPEND is triggered from the hardware domain, the
> system ultimately uses
> Host PSCI — that is, a full system suspend is performed.

Thanks for clarification.

>
>> Also, this implementation adds suspend/resume support via vPSCI, which
>> I believe is also worth noting in the CHANGELOG.md.
> You're right — in this context, "guest suspend/resume" refers to
> handling via the virtual PSCI (vPSCI) interface.
> When regular PSCI is used, it's typically referred to as Host PSCI.
> That sentence could probably be rephrased for better clarity. Thank you.

It would be nice.

Thanks.

~ Oleksii

--------------rsutJmwHO93pmXm4UdSR3QCs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/27/25 6:05 PM, Mykola Kvach wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGeoDV-=jD3_9hbx3H5buDTxyGY5S-CQk0LoWe7cNbCK6mo=Fg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">Hi, @Oleksii Kurochko

On Tue, May 27, 2025 at 6:38 PM Oleksii Kurochko
<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Hello Mykola,

On 5/27/25 11:18 AM, Mykola Kvach wrote:

From: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>

Signed-off-by: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ec452027f5..fc89ed6e09 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)

  - On Arm:
     - Ability to enable stack protector
+    - Support guest suspend/resume to/from RAM

 ### Removed
  - On x86:

According to your commit message, suspend/resume will only work for Arm64.
I think it would be good to mention that in the CHANGELOG.md as well.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thank you for pointing that out — in this case, I forgot to drop
"arm64" from the commit message.</pre>
    </blockquote>
    <pre>Then it makes sense to me to drop it in next patch series version.

</pre>
    <blockquote type="cite"
cite="mid:CAGeoDV-=jD3_9hbx3H5buDTxyGY5S-CQk0LoWe7cNbCK6mo=Fg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
For non-hardware domain guests, suspend/resume support is available
for both ARM32 and ARM64.
When PSCI SYSTEM_SUSPEND is triggered from the hardware domain, the
system ultimately uses
Host PSCI — that is, a full system suspend is performed.</pre>
    </blockquote>
    <pre>Thanks for clarification.

</pre>
    <blockquote type="cite"
cite="mid:CAGeoDV-=jD3_9hbx3H5buDTxyGY5S-CQk0LoWe7cNbCK6mo=Fg@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Also, this implementation adds suspend/resume support via vPSCI, which
I believe is also worth noting in the CHANGELOG.md.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You're right — in this context, "guest suspend/resume" refers to
handling via the virtual PSCI (vPSCI) interface.
When regular PSCI is used, it's typically referred to as Host PSCI.
That sentence could probably be rephrased for better clarity. Thank you.</pre>
    </blockquote>
    <pre>It would be nice.

Thanks.</pre>
    <pre>~ Oleksii</pre>
  </body>
</html>

--------------rsutJmwHO93pmXm4UdSR3QCs--

