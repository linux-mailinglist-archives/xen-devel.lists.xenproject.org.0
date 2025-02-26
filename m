Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A44A467BE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 18:16:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897106.1305826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnL1R-0001Mf-LB; Wed, 26 Feb 2025 17:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897106.1305826; Wed, 26 Feb 2025 17:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnL1R-0001K6-IN; Wed, 26 Feb 2025 17:16:37 +0000
Received: by outflank-mailman (input) for mailman id 897106;
 Wed, 26 Feb 2025 17:16:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnL1P-0001Jy-TQ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 17:16:35 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e14d484-f465-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 18:16:34 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e0813bd105so11815774a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 09:16:34 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e45a8b8c4esm3081517a12.26.2025.02.26.09.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 09:16:33 -0800 (PST)
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
X-Inumbo-ID: 6e14d484-f465-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740590194; x=1741194994; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ3gY2jBfIg7JkgC5g5pUvM+AvCUpLnKCnOITukTbk4=;
        b=btYY0r56ZJ8bE1ucv5FXbF3FLVJABq8fwoBlcLlWEQuEFAZ/JMIoiOwz1aKt2lh/kq
         qwbPVTJ8QLF8RTbJ78RdlNFHqKJo7QMUOLmqZSngbqhwAhfeyfGtD+AIVnFNuGIXHVqY
         BVnwBvah+s+4vC8TK6nOVP+P0bj3FuXrNf3QpVPEWg4ZjLjJT6cOqv2O7JFF4TKWCRN7
         Sy/6blgtu/kyxUhPPVsgbWKBld555jzAVcgu7IyId9vLemI+dKRDBnIprUlvcShAQyB6
         lUHM7Mwrh0OHBMWKiU5Ai4y8Z5/uWGdVeLBwyGXeb4BhPgwJgxJnzQnt69YCxc+DiiTs
         SndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590194; x=1741194994;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sJ3gY2jBfIg7JkgC5g5pUvM+AvCUpLnKCnOITukTbk4=;
        b=WApHd4Jx1mVfWkp15wkd7hppWPMG+Cw07K8YEACf/bR3SmJLw3Fxlq2DrLMcamcOuJ
         KdbebVivcX7qoXI+mKcIYhqLXSiP+Lb3y8LSYfLCf+uS0hdq9yng1rHs5/fQIpdf/WRU
         6REH/hW9Y+bJpyDRatCXBKC/8Ng7tOpgA+2B77E9vsidqAL5LOpvSuRk3pPOdNzmxRUJ
         SDRxAQRWoL7YHDF8mwJPwfRffQLkffCwE6Kh0hT3vOHkF2JBeDlcS3YwOHtCl39eR0u4
         ljEXYYX67ybWbLNoc7Q2FFo0ItdcqVhAw9DaBPpssUNm8qjxwxpVTnGpVzmDflAFXopj
         mezg==
X-Forwarded-Encrypted: i=1; AJvYcCWD3SUduzSQDSJ9Iruvhb3pCoDt3hPOLPee/VgYLEqkwHiiIMln8pi7hpWNMCYJBXoylTyRZGP9gaU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxv8N3QcU1Wke3jjabOVuzldZVtXvweu8jD2qZDmTGeNzQWekHp
	r/QXSX6jZkcNz34kPgsZ0u649394fbWqviQEU+zUBmNO4LDv95pM
X-Gm-Gg: ASbGncvl5I3+Jh2t5Mj5BVeL6t5JOiB9KnCc5CoRkusJpT1+g7QgJL0PvHuJqHHrCtQ
	mZSRYKiB8etpttpkGDVWRFXC3FqFNmOF+wWlUq/g6/x11shcWqKK30PpRUYSPkdY6J7cYuc0Hcg
	0vtHSrt+ZslaQPxli4ip9dEIRezGR6QrUnG1WqVQEsUsOUktKNgmWFWRKWXL1QDz+7AI4nOn1l9
	X3JNqzkkg3fm3wy+hrN3nUDKBgmYfgY4/7CxshJZmW1JG0YhZYdrlXfzeZYkiLirHq3X3y3tIdN
	KC9QjsF+wRGJF4stkOyIV0GjMZlUpLtFtHw=
X-Google-Smtp-Source: AGHT+IGs82BRcKCWzU+u2VjM6YGC/fyaHzMaC+t1ccQQ4/UsSAP3taKkdDHB39Qpe1XyfdISC/+ZKA==
X-Received: by 2002:a05:6402:5109:b0:5e0:82a0:50e6 with SMTP id 4fb4d7f45d1cf-5e0b722e6d9mr23145835a12.20.1740590193994;
        Wed, 26 Feb 2025 09:16:33 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------7hkHssToVTlKRyzsfquaY0MN"
Message-ID: <6a7e6dad-b2d3-46df-be9a-d9ec3451cd37@gmail.com>
Date: Wed, 26 Feb 2025 18:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 3/4] xen/riscv: make zbb as mandatory
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <611e289e357a26490b95b2aa93d7288c77787171.1740071755.git.oleksii.kurochko@gmail.com>
 <ef3972a5-825a-47de-b9a7-a3681fe70bcb@suse.com>
 <38834638-df7a-4631-99e1-5596bb65d136@gmail.com>
 <e9f75fd0-4e65-4f06-a671-7f497354872d@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e9f75fd0-4e65-4f06-a671-7f497354872d@suse.com>

This is a multi-part message in MIME format.
--------------7hkHssToVTlKRyzsfquaY0MN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/26/25 3:49 PM, Jan Beulich wrote:
> On 26.02.2025 15:38, Oleksii Kurochko wrote:
>> On 2/26/25 1:58 PM, Jan Beulich wrote:
>>> On 20.02.2025 18:44, Oleksii Kurochko wrote:
>>>> According to riscv/booting.txt, it is expected that Zbb should be supported.
>>>>
>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>> ---
>>>> Changes in v7:
>>>>    - new patch.
>>>> ---
>>>>    xen/arch/riscv/arch.mk | 7 ++-----
>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>> Please can you also tidy asm/cmpxchg.h of ANDN_INSN() then?
>> Sure, I can leave only:
>> /*
>>    * To not face an issue that gas doesn't understand ANDN instruction
>>    * it is encoded using .insn directive.
>>    */
>> #define ANDN_INSN(rd, rs1, rs2)                 \
>>       ".insn r OP, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"
> Wait, no - why would you? Patch 0.5 is supposed to be setting a baseline
> where Zbb is known by the tool chain. With that proper "andn" can be used
> wherever we like.

I thought that Zbb in binutils (part of whic is gas) was added later then
I mentioned in Patch 0.5 but Zbb was added starting from 2.37, so we can
just really use `andn` instruction instead of `.insn` .

Thanks for clarification.

~ Oleksii

--------------7hkHssToVTlKRyzsfquaY0MN
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
    <div class="moz-cite-prefix">On 2/26/25 3:49 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e9f75fd0-4e65-4f06-a671-7f497354872d@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.02.2025 15:38, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 2/26/25 1:58 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 20.02.2025 18:44, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">According to riscv/booting.txt, it is expected that Zbb should be supported.

Signed-off-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in v7:
  - new patch.
---
  xen/arch/riscv/arch.mk | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Please can you also tidy asm/cmpxchg.h of ANDN_INSN() then?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Sure, I can leave only:
/*
  * To not face an issue that gas doesn't understand ANDN instruction
  * it is encoded using .insn directive.
  */
#define ANDN_INSN(rd, rs1, rs2)                 \
     ".insn r OP, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Wait, no - why would you? Patch 0.5 is supposed to be setting a baseline
where Zbb is known by the tool chain. With that proper "andn" can be used
wherever we like.</pre>
    </blockquote>
    <pre>I thought that Zbb in binutils (part of whic is gas) was added later then
I mentioned in Patch 0.5 but Zbb was added starting from 2.37, so we can
just really use `andn` instruction instead of `.insn` .

Thanks for clarification.

~ Oleksii
</pre>
  </body>
</html>

--------------7hkHssToVTlKRyzsfquaY0MN--

