Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F00A4394D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895539.1304197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmr95-0004ZN-HK; Tue, 25 Feb 2025 09:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895539.1304197; Tue, 25 Feb 2025 09:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmr95-0004WF-EV; Tue, 25 Feb 2025 09:22:31 +0000
Received: by outflank-mailman (input) for mailman id 895539;
 Tue, 25 Feb 2025 09:22:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k2AW=VQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tmr94-0004W8-98
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:22:30 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 087fcf84-f35a-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 10:22:28 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so7183307e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 01:22:28 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514efbc3sm127299e87.125.2025.02.25.01.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 01:22:27 -0800 (PST)
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
X-Inumbo-ID: 087fcf84-f35a-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740475348; x=1741080148; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hLGORat6l4aXxdnCJWtKsFL1Ta+TD4yjlSnKoIKdzw=;
        b=mR9ScuiN3I6mJBMaz2Ve74ysxV1x6ddt4HkTbCndzM87yiVmZOy+v2Y9w+1EdYsL8g
         wew3c1P1QmunXzNuTqzvUVmxwaq9OyMQXkoMzQR7FhJ9Ecbtxebl1C6zYGh4Nm7bnBtQ
         tz+OtialtkfySiDeN/Y0HIQHlpdLP3jyUJGSnw4zrgOGI9aN0SkJp9TZktsDqU1Yh3ZQ
         11JBSR7G9v9OT13nGN22eGEB6xqvsHuyFTSCmpLPImM4UkKRwgejMmF8PWfDTj5FuTwa
         c6C1Qz+cmNCN5fB2XYxPfI4A6h7fZSn/ZjECA0MgodZ6afOSu5Vz4X4xSHwEgK+j8M4j
         SeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740475348; x=1741080148;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hLGORat6l4aXxdnCJWtKsFL1Ta+TD4yjlSnKoIKdzw=;
        b=m7ab7DYoX/9ziQkfp6KubCMHBukS2fz3/zEwa6G/dB7xM7t7GIYy/E6OMw0DV3M7Fp
         2vJHsYKsOl5pW9qo1konIfQfJL3l+IHT7D1ypRN5d0KHiW9bCIc0ZptaWEpdiKC0g0ix
         uCvH9IySdFywW6RsZ9uEIi58LGPqQgsYHeMxYSpAgvhxCuveCC7tXJQYMSvjaDTwRBEg
         JzxHlCkqdJi6EFQ/4I1bEjGk+qjrUTZZLYxY7OzDiXMpJtjcHP+FSKfNwK271vfLR8uM
         09TZ7zP191SF4ScfmxjDCDGGd06lYK9jDdep0vJAJzV+IMNgI+pxikO4HxbQ+rLSoCWn
         8Mdw==
X-Forwarded-Encrypted: i=1; AJvYcCVYhwdJkv1zjyKo2NN1ZQcKn9AFAY4vncGwvoPmFm0jG+RT6uD+TWhzGVmY4x2kjiDoIgAk48mke5E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8Dy/x33xshCvrwI+9CSP1tB0e60X0qIorBHNscJb7fAkoupxg
	gJ1XvmTUpStX2s32OoOPWe+Ln1ddzodREZ0oE0wsuhN9LhHScxyW
X-Gm-Gg: ASbGncvuhthmpQPCPjdZWq2bwx2LYyveFMsgtiHCZwbyobFd5Nqvu+6GotZFYATS92K
	fD36srHRyaJopDfQ/WOHPBksikR/fi8fDZ6FDsze/u/a7wJzXjhl28Ox9P6KeoiKATfWp+GqXvh
	loiReWtMx/xPa2662COCFEU84nUL0cFu9bldIIgnIjCW2CRjYA6vXVUurm9Psn3zgcqaX0zAzDW
	HJZL+yEwSqk4RDrr92hjGrppDlAWhn8SpmBvPs1yDEaLQebMk89i0Q+yyw+x0DZ+u2CUGzizSta
	8aa1il+rdcX7D2tyy1JtQzTcHKqe7PkDhug=
X-Google-Smtp-Source: AGHT+IFbqXYGB/YjfPd1SC1lMFz4FSu9HdCu3OGdOuUznMB+tu/+Oa9ux0QwVJBupQgb562STh3nZA==
X-Received: by 2002:a05:6512:3b86:b0:545:4ca:d395 with SMTP id 2adb3069b0e04-54838c56efdmr5647053e87.2.1740475347722;
        Tue, 25 Feb 2025 01:22:27 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------uX6FJiPcKR2S85rWgvqnnOVe"
Message-ID: <40d7a0b2-e455-4024-8137-a296d3f3767a@gmail.com>
Date: Tue, 25 Feb 2025 10:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
To: Jan Beulich <jbeulich@suse.com>
Cc: committers@xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
 <b6e03e25-2fa3-42d0-9755-61a71466f9b6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b6e03e25-2fa3-42d0-9755-61a71466f9b6@suse.com>

This is a multi-part message in MIME format.
--------------uX6FJiPcKR2S85rWgvqnnOVe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/25/25 8:13 AM, Jan Beulich wrote:
> On 24.02.2025 19:25, Oleksii Kurochko wrote:
>> @@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>        interrupts instead of logical destination mode.
>>   
>>   ### Added
>> + - Support device passthrough when dom0 is PVH on Xen.
> Was this work complete? (I'm truly uncertain, so not a rhetorical question.
> IIRC SR-IOV is still unsupported, without which I'd not consider this work
> complete.) In any event it's x86-only and hence would rather belong ...

I decided so because the patch series [1] seems to be fully merged.
[1]https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m0811f020321587ec94638e686800264724af1cdb

>
>> + - Enable CONFIG_UBSAN (Arm, x86, RISC-V) for GitLab CI.
>>    - On Arm:
>>      - Experimental support for Armv8-R.
>>      - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
>> @@ -34,6 +41,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>    - On x86:
>>      - xl suspend/resume subcommands.
>>      - `wallclock` command line option to select time source.
>> +   - Add Support for Paging-Write Feature.
>> +   - Zen5 support (including new hardware support to mitigate the SRSO
>> +     speculative vulnerability).
> ... here?

Yes, it should be moved to x86. Based on the which files were changed during this patch series I decided that it should be
in hypervisor changes, but now I checked which changes specifically done and for Arm it was added basically only stubs in
libxl_arm.c.

~ Oleksii

--------------uX6FJiPcKR2S85rWgvqnnOVe
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
    <div class="moz-cite-prefix">On 2/25/25 8:13 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b6e03e25-2fa3-42d0-9755-61a71466f9b6@suse.com">
      <pre wrap="" class="moz-quote-pre">On 24.02.2025 19:25, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
      interrupts instead of logical destination mode.
 
 ### Added
+ - Support device passthrough when dom0 is PVH on Xen.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Was this work complete? (I'm truly uncertain, so not a rhetorical question.
IIRC SR-IOV is still unsupported, without which I'd not consider this work
complete.) In any event it's x86-only and hence would rather belong ...</pre>
    </blockquote>
    <pre>I decided so because the patch series [1] seems to be fully merged.
[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m0811f020321587ec94638e686800264724af1cdb">https://lore.kernel.org/xen-devel/20240930034250.2682265-1-Jiqian.Chen@amd.com/T/#m0811f020321587ec94638e686800264724af1cdb</a>
</pre>
    <blockquote type="cite"
      cite="mid:b6e03e25-2fa3-42d0-9755-61a71466f9b6@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ - Enable CONFIG_UBSAN (Arm, x86, RISC-V) for GitLab CI.
  - On Arm:
    - Experimental support for Armv8-R.
    - Support for NXP S32G3 Processors Family and NXP LINFlexD UART driver.
@@ -34,6 +41,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
+   - Add Support for Paging-Write Feature.
+   - Zen5 support (including new hardware support to mitigate the SRSO
+     speculative vulnerability).
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here?</pre>
    </blockquote>
    <pre>Yes, it should be moved to x86. Based on the which files were changed during this patch series I decided that it should be
in hypervisor changes, but now I checked which changes specifically done and for Arm it was added basically only stubs in
libxl_arm.c.

~ Oleksii</pre>
  </body>
</html>

--------------uX6FJiPcKR2S85rWgvqnnOVe--

