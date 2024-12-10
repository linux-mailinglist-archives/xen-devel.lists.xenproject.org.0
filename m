Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC489EB516
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852777.1266480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2Ea-0005Xl-IX; Tue, 10 Dec 2024 15:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852777.1266480; Tue, 10 Dec 2024 15:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2Ea-0005VF-Fx; Tue, 10 Dec 2024 15:33:12 +0000
Received: by outflank-mailman (input) for mailman id 852777;
 Tue, 10 Dec 2024 15:33:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybAe=TD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tL2EZ-0005RG-7T
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:33:11 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ec2eb67-b70c-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 16:33:08 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso2876622a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:33:08 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3f4ecdd02sm3773276a12.81.2024.12.10.07.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:33:07 -0800 (PST)
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
X-Inumbo-ID: 0ec2eb67-b70c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733844788; x=1734449588; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tUWJCQZhlnB2O1JeWYFe/NJj+v1SWZkC/CgvXh7ynU=;
        b=mes7l+UbRoCetMTwU+0eIVSFrSoqZzuQc4/ZSOl+l5VZLBDSvC2BUELsRpBlfaggGP
         y46bsd5Ijoas6BUYeKRZ9xFlkgh6nRrU7UTQki/RoM5QoKA/eHhcnQUDcnpYdVMq3iXK
         PCupu/mXoC4YUE1/CZZ+hmT5XQF8ylzq92B9TeJGHXjeuycP9gtPaxE4FkUbT76v6qH0
         0rdb6a3psf3/pg6skoyt0JAWiJl1fjWTZpYXopqjEMWCd7WbAyppAobA5fZZ0UcS0ZMj
         vgNoZVj0N10qyBH2XpH4EkmLCzoxNkWJBzlmvpjRUexltFVO8g5p094ZjWkw6Xz4/iaI
         0lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844788; x=1734449588;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+tUWJCQZhlnB2O1JeWYFe/NJj+v1SWZkC/CgvXh7ynU=;
        b=c9MQUheYqhIeRcCk9LWaDMn0LR1ZCgTXHkwjGkgPKmg9JYegofvlELxmhodF9xIoFP
         /OPzqlVCyN0WKzsj8YuxsXbYc250nEQLXNHbsWga50JNy0C6cURD9jG8pgcNuvn1IaR/
         7wBaNmjD+DVJE3Dm1PIW0EnbXEHXuxcu8XnZofiSLGKxVDOjTZV2FfT+qYnaDuR4SYKL
         Er1Dc999AhcccpGJtekCn+3G/cK/RKz4BIvIogmLG+t5sKXUd7Vv6ErCtt4VDE+vn3DF
         4fT70+tzywLW/EY6pzmb5x0cmK9PjdbojUSfxguW3sNR+tjw2C8xjG+UStvlIfjoHNIr
         1YIw==
X-Forwarded-Encrypted: i=1; AJvYcCUq5wGJl9YeUkVoNMHj8MfJbJRfnt9GtVDgwsY97I0YrMhNIomDU+vUbKyt6fMGMSwA6rdqzf0ydTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtnypbMTjzlLcb/o4fBWIeOM0HkwCPscE78DoNvNpG9tr00XIc
	hB82evJ3Czh9oKVamQpNzeGRi2iiXKl0dQfFxI3kOENLrUXHcFj4gKWJBPOE
X-Gm-Gg: ASbGncv2uR3q7cwsQwXJNM13Vre8AVcj3/7IOH+SgDwpI3bbVjtUdgMXgIauLhMgVqc
	UBYdczlOkQxoec4arMHun+/N8SkCuRweR9qU4wuQyk3moRv5ZKQ591OllrcHrw0iFDRW3+8eA1n
	2wjMgAN7n0dvv2/yUwLlfB558MXnyKNfUAXLy86rkBrlYmvpEXPGO5pLB/vd6d4CuaCVT6WZHVP
	6zL0cA3q9flpa6DSaX3JseWV+uzflva//EpxwHgYTsiPQ0c2FmRrw3lZVMwq7H2Uiw=
X-Google-Smtp-Source: AGHT+IEREuU1s6tSGUeVOTfsA7rZadKzqUPMyam7yAG74ldtFegyeZj1CmMMxkNON9BSlnWvi0O6aA==
X-Received: by 2002:a05:6402:5405:b0:5d0:cfdd:2ac1 with SMTP id 4fb4d7f45d1cf-5d3be66098cmr15129682a12.6.1733844788068;
        Tue, 10 Dec 2024 07:33:08 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------2ihRBdaY2wCB1mTC7cCBzf72"
Message-ID: <a2880796-9575-4f2e-9efc-367ebedcd62e@gmail.com>
Date: Tue, 10 Dec 2024 16:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] CHANGELOG: Mention xl suspend/resume
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <20241210145602.5039-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20241210145602.5039-1-jason.andryuk@amd.com>

This is a multi-part message in MIME format.
--------------2ihRBdaY2wCB1mTC7cCBzf72
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/10/24 3:56 PM, Jason Andryuk wrote:
> The xl subcommands are generic, but only built when
> LIBXL_HAVE_NO_SUSPEND_RESUME is false.  Currently that is only x86, so
> list them there.
>
> Signed-off-by: Jason Andryuk<jason.andryuk@amd.com>

LGTM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


> ---
> v2:
> Nest under "On X86"
> Expand commit message
> ---
>   CHANGELOG.md | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8553b2e451..15f681459f 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ### Added
>    - On Arm:
>      - Experimental support for Armv8-R.
> + - On x86:
> +   - xl suspend/resume subcommands.
>   
>   ### Removed
>    - On x86:
--------------2ihRBdaY2wCB1mTC7cCBzf72
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
    <div class="moz-cite-prefix">On 12/10/24 3:56 PM, Jason Andryuk
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241210145602.5039-1-jason.andryuk@amd.com">
      <pre wrap="" class="moz-quote-pre">The xl subcommands are generic, but only built when
LIBXL_HAVE_NO_SUSPEND_RESUME is false.  Currently that is only x86, so
list them there.

Signed-off-by: Jason Andryuk <a class="moz-txt-link-rfc2396E" href="mailto:jason.andryuk@amd.com">&lt;jason.andryuk@amd.com&gt;</a></pre>
    </blockquote>
    <pre>LGTM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20241210145602.5039-1-jason.andryuk@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
v2:
Nest under "On X86"
Expand commit message
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8553b2e451..15f681459f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -16,6 +16,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 ### Added
  - On Arm:
    - Experimental support for Armv8-R.
+ - On x86:
+   - xl suspend/resume subcommands.
 
 ### Removed
  - On x86:
</pre>
    </blockquote>
  </body>
</html>

--------------2ihRBdaY2wCB1mTC7cCBzf72--

