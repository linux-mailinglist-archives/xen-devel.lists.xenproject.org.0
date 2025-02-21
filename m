Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99D3A3F368
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2025 12:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894387.1303102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlRZs-0006L8-9V; Fri, 21 Feb 2025 11:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894387.1303102; Fri, 21 Feb 2025 11:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlRZs-0006Iz-6h; Fri, 21 Feb 2025 11:52:20 +0000
Received: by outflank-mailman (input) for mailman id 894387;
 Fri, 21 Feb 2025 11:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jkcg=VM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlRZq-0006It-Gu
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2025 11:52:18 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b6e0101-f04a-11ef-9aa9-95dc52dad729;
 Fri, 21 Feb 2025 12:52:17 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54838cd334cso815761e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2025 03:52:15 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54527b7961dsm2375506e87.46.2025.02.21.03.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 03:52:14 -0800 (PST)
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
X-Inumbo-ID: 4b6e0101-f04a-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740138735; x=1740743535; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Duv4fiAiSBe3/0VUP8r4erJAZv7SFJYXZ7wQGkB8Es8=;
        b=OcWR+HIz4GIwpmj7QNCyA0GK4k/50n+fuHs5FBwVSrShh2uhMJYNbs5XJpKT3sMA2o
         BBa6uIe3N7mOQvq1xrq/btZtYGGRH5krDfE24IvI2i9d4VbYMz6sxpQ9j+xJQBH/NpgD
         /xbknkMra3LDiZptua7TOsfAHEwpR84vYCwsTy39OI08zwhDIhSzoAV4Y+6TJEKBnKof
         bG99Tgy7IAtd2fScBKMhEAQutNq52ZqGGNuhk324v1hPMF+mDjdCAhaywHVNdruGM8nb
         fUjc8vV6iETvzIVT9yPrLNfYFbvdIpOrfPIHRmY9SXUVuDB6sA/xqB8rW/NWzJZfGOGC
         4ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740138735; x=1740743535;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Duv4fiAiSBe3/0VUP8r4erJAZv7SFJYXZ7wQGkB8Es8=;
        b=NjpLTOMR+C92mUHZWNlhYkUImQGblmDVQAslkd/kbHGI9q2uX6yjHv2vKzI2N6ulph
         VOy1Jj9VV816uTM08XEhPzPLu0Ee5e6F6v4cCkc5vyJNf4p7tlozzCSw1AbF3kA01YSb
         ioA8du6bZfHVBm8C8mwQA4f8a96jzZq3WN0MAKycHaisiZpAWP//7N1RaKB8USx3muhx
         wZI3Wkc4uUFSD8tGxCELUj8JVtn4yXZiquKvVzh5xa5QmSZwFJEm1ZgrVoVK3loRcSAL
         im7WV3VEBfs8hDTphSRSxXDIv8KDK1G07xfGNaZOQ2a4WuFiehPvzx9ZVQO3WujFbZAf
         dasQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+7LtduJm6H6/f5n+to/WF27cc8hmmYFS+tbBcY1hcG1VVjXPPxHPd+5e8M7YmVabbHQnu/SJy5Qs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyURNmR2iGcC9LIFoaljC9r9I5d+RXxrWtEGg4nyo1VHozzVl4A
	3+FXntUZds+9dfvGqD3VhztHYmxNnVUJg/CAYDjo9XEk22TyoaCR
X-Gm-Gg: ASbGncu0ALdiQlHdIZI+HfZboyuRTMbAKtHLI5FMmM2CuEOuTuOp3wydv6ggSeVvZ5V
	ZB8qA1DK2BtGhJMZNvgEeVAADqJPf6XATXFBq25N6DG3Tm6S0gr/ynWN68Xkjk3YxfuQO7UBQAS
	V9O5OoIkNakqJy7duEg9GYeH3bDqHWYXH8/BiZVSHqCo+LMsqpAeGuHmWlFRKFVhEoXL9Q0EPsc
	yttils5+76mGRRVSk0zaUFWI5kV6+YCFi9y9MUog6ET0FG58yeY+yCiO9Zp48WdEunfEdovkNHv
	fg7SUwHQB+y19vQ4WYpTyPZh5wWk/mPB7HQ=
X-Google-Smtp-Source: AGHT+IGSS/jg1MJtyyHHFkovGI3N6bFItFswi/XKQQBLOqtAT8wymY8OxarTZIAM8jzv4qyH7mrcpA==
X-Received: by 2002:a05:6512:68e:b0:545:f1d:6f2c with SMTP id 2adb3069b0e04-54838ee8fa6mr939310e87.18.1740138734623;
        Fri, 21 Feb 2025 03:52:14 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------kLdCX3GpF8DY4w0D2lu0ecKR"
Message-ID: <60a5d6be-ba39-468c-9e4f-dc363f0d80f4@gmail.com>
Date: Fri, 21 Feb 2025 12:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] eclair: mark R16.6 as clean
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <alpine.DEB.2.22.394.2502201354410.1791669@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2502201354410.1791669@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------kLdCX3GpF8DY4w0D2lu0ecKR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/20/25 10:54 PM, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini<stefano.stabellini@amd.com>
> ---
> This is possible thanks to "resolve the last 3 MISRA R16.6 violations"
> being committed.
>
> Requesting a release ack. Successful pipeline:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1681379131

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
> index 66698b4bff..1d078d8905 100644
> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -69,6 +69,7 @@ MC3A2.R14.3||
>   MC3A2.R14.4||
>   MC3A2.R16.2||
>   MC3A2.R16.3||
> +MC3A2.R16.6||
>   MC3A2.R16.7||
>   MC3A2.R17.1||
>   MC3A2.R17.3||
--------------kLdCX3GpF8DY4w0D2lu0ecKR
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
    <div class="moz-cite-prefix">On 2/20/25 10:54 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502201354410.1791669@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@amd.com">&lt;stefano.stabellini@amd.com&gt;</a>
---
This is possible thanks to "resolve the last 3 MISRA R16.6 violations"
being committed.

Requesting a release ack. Successful pipeline:
<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1681379131">https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1681379131</a></pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2502201354410.1791669@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 66698b4bff..1d078d8905 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -69,6 +69,7 @@ MC3A2.R14.3||
 MC3A2.R14.4||
 MC3A2.R16.2||
 MC3A2.R16.3||
+MC3A2.R16.6||
 MC3A2.R16.7||
 MC3A2.R17.1||
 MC3A2.R17.3||
</pre>
    </blockquote>
  </body>
</html>

--------------kLdCX3GpF8DY4w0D2lu0ecKR--

