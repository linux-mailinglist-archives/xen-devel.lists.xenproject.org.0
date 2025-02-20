Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CECA3DEE7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 16:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893935.1302767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl8fs-0008Og-7Y; Thu, 20 Feb 2025 15:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893935.1302767; Thu, 20 Feb 2025 15:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl8fs-0008MN-3t; Thu, 20 Feb 2025 15:41:16 +0000
Received: by outflank-mailman (input) for mailman id 893935;
 Thu, 20 Feb 2025 15:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tl8fr-0008MF-E9
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 15:41:15 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6d11a3-efa1-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 16:41:13 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54527a7270eso1168334e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 07:41:13 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452c855259sm2051025e87.242.2025.02.20.07.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 07:41:12 -0800 (PST)
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
X-Inumbo-ID: 1d6d11a3-efa1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066073; x=1740670873; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymUZyOi1fGAnlByb8BUOiiL/GTOhD+LMoLo9rSOc1Rc=;
        b=ZR+f2KHhJJiycAQIxWXXoC7qC2bt3Ct9xULIY6Fd/cxB2sL+TLtlHPuFvIlnaVZFOG
         CZxnWmjT0bkbfm7q7ep0tw+hZdlNAyARAwdq9OgIqs0msxUHllYT4ewtJtkRbOPvMGxt
         UTcpKBLwS4rdoYdiJPjpVWnclKyi5Y8DoVqK2wNbhbno5LvmIvSGoZGo4lz1Z1A4+8sM
         H6fgc2Tu4GwgO/dpjYyBW8O/WUiWx3w0Chij0ycHCnaJEG/bFy/32sJ4edxNREJS4EHb
         D+Gveo45rmdfl+snRd9ZcjSzUBmqgt+12Lm/gti0JUgblXjOs1lKfo2wXzeoPqWbE7J0
         3kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066073; x=1740670873;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymUZyOi1fGAnlByb8BUOiiL/GTOhD+LMoLo9rSOc1Rc=;
        b=SZjWeO4fnOCW407HI3eTqqR5QAiSeLDuygHBga43nRl+Lb3w6xXJZZ8BfoaIHrd7sI
         OzhEh9OwXnmdx5m3q54IIDvNL3S7A/1pZCgy2zjpInkMmLfXetPeOo1k0Yew8jJ1bCCV
         +s//wvfDK77jW/DjRy7G+mkLHoDkxb6Cbfhx3N4nXUxrF2GBrSh11WckYUaldEm5qpe3
         crxIo9Vktb7F5l3zMginQ6jE/OusKyzcdBGD0uLrAMCImmfSmrRTdwEPx1BLcBC9sHQF
         zOYRGoCU8WcS59pSZJjxGyVqof7+G53y1eqajAfxMzfKMVmR6IUO91rti+oT5QPxSEJV
         i5ew==
X-Gm-Message-State: AOJu0YyjoPfBFrnMyv8f0W0YUfzvUB/l0mRrVyb+lOabx2cwh7Q27HIA
	av0LYoYQVBl/1D4gZUqG1i9D7aPynjd66Z8gvj9UJj2KE7CWWgu3
X-Gm-Gg: ASbGncsTJnC5uKGpWXbtKcEl0qWWKGr4cEDP7XPAMkiTWYZVu4obZVRv588zse7FXrM
	GCr0oB2mVsYtT/R6gb1tPrkl+A9h0Sx77lRi0IiTEk6jjcYOtiLbwdylMd7Q6o8OWNMt1qzV1P6
	GrteKHUUlXSc3M4kTDz1tco7BX0FvJ2LjoSwSiZBQ5iLpuO1LNczSOXwwCcJT3M6hONVui9ukm6
	gjwECmOnZtv+59uN3dIz6hGoIWv2HMFN2aaD5Jab2ilb0skcOnuOYhIetTKb7ohMAUkqx0cgWsj
	xl8a+PYshr7tRrihg1uVo2TZ
X-Google-Smtp-Source: AGHT+IE1UluJn9ZHWh9qcOmEQwN74yqYcVpJKIAS1ZC44eAHu34OmMfFBHjhmGbv9rlbMqJgjmG4YA==
X-Received: by 2002:a05:6512:114e:b0:545:b9a:b4b4 with SMTP id 2adb3069b0e04-5452fe8fd01mr8741978e87.52.1740066072562;
        Thu, 20 Feb 2025 07:41:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------UGtR0Hcn38OGMkVtrnFmLnol"
Message-ID: <6f5d76a4-4b2e-4999-8478-f4e7d1555583@gmail.com>
Date: Thu, 20 Feb 2025 16:41:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] CI: Mark MISRA Rule 11.2 as clean
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250220125354.869062-1-andrew.cooper3@citrix.com>
 <a0859957bacfbed1a880e55da12fae6f@bugseng.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a0859957bacfbed1a880e55da12fae6f@bugseng.com>

This is a multi-part message in MIME format.
--------------UGtR0Hcn38OGMkVtrnFmLnol
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/20/25 2:12 PM, Nicola Vetrini wrote:
> On 2025-02-20 13:53, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> For 4.20.  I want to include the fix and this patch ahead of RC5 to 
>> avoid
>> backporting.
>> ---
>>  automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
>>  1 file changed, 1 insertion(+)
>>
>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~Oleksii

>
>> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl 
>> b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> index 491625e84c27..66698b4bfffb 100644
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -58,6 +58,7 @@ MC3A2.R9.2||
>>  MC3A2.R9.3||
>>  MC3A2.R9.4||
>>  MC3A2.R10.2||
>> +MC3A2.R11.2||
>>  MC3A2.R11.6||
>>  MC3A2.R11.7||
>>  MC3A2.R11.9||
>>
>> base-commit: c989ff614f6bad48b3bd4b32694f711b31c7b2d6
>
--------------UGtR0Hcn38OGMkVtrnFmLnol
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
    <div class="moz-cite-prefix">On 2/20/25 2:12 PM, Nicola Vetrini
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a0859957bacfbed1a880e55da12fae6f@bugseng.com">On
      2025-02-20 13:53, Andrew Cooper wrote:
      <br>
      <blockquote type="cite">Signed-off-by: Andrew Cooper
        <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
        <br>
        ---
        <br>
        CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
        <br>
        CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
        <br>
        CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
        <br>
        CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
        <br>
        CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
        <br>
        CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>
        <br>
        CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
        <br>
        CC: Nicola Vetrini <a class="moz-txt-link-rfc2396E" href="mailto:nicola.vetrini@bugseng.com">&lt;nicola.vetrini@bugseng.com&gt;</a>
        <br>
        <br>
        For 4.20.  I want to include the fix and this patch ahead of RC5
        to avoid
        <br>
        backporting.
        <br>
        ---
        <br>
         automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
        <br>
         1 file changed, 1 insertion(+)
        <br>
        <br>
      </blockquote>
      <br>
      Reviewed-by: Nicola Vetrini <a class="moz-txt-link-rfc2396E" href="mailto:nicola.vetrini@bugseng.com">&lt;nicola.vetrini@bugseng.com&gt;</a>
      <br>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

</pre>
    <pre>~Oleksii</pre>
    <blockquote type="cite"
      cite="mid:a0859957bacfbed1a880e55da12fae6f@bugseng.com">
      <br>
      <blockquote type="cite">diff --git
        a/automation/eclair_analysis/ECLAIR/tagging.ecl
        b/automation/eclair_analysis/ECLAIR/tagging.ecl
        <br>
        index 491625e84c27..66698b4bfffb 100644
        <br>
        --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
        <br>
        +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
        <br>
        @@ -58,6 +58,7 @@ MC3A2.R9.2||
        <br>
         MC3A2.R9.3||
        <br>
         MC3A2.R9.4||
        <br>
         MC3A2.R10.2||
        <br>
        +MC3A2.R11.2||
        <br>
         MC3A2.R11.6||
        <br>
         MC3A2.R11.7||
        <br>
         MC3A2.R11.9||
        <br>
        <br>
        base-commit: c989ff614f6bad48b3bd4b32694f711b31c7b2d6
        <br>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------UGtR0Hcn38OGMkVtrnFmLnol--

