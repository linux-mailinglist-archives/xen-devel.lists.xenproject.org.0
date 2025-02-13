Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F96A341A7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887627.1297090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia2u-0002IV-KN; Thu, 13 Feb 2025 14:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887627.1297090; Thu, 13 Feb 2025 14:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tia2u-0002G8-Hk; Thu, 13 Feb 2025 14:18:28 +0000
Received: by outflank-mailman (input) for mailman id 887627;
 Thu, 13 Feb 2025 14:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tia2t-0002G2-7d
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:18:27 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63a301bb-ea15-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 15:18:25 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso1018841e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:18:25 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09a985sm189612e87.56.2025.02.13.06.18.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:18:24 -0800 (PST)
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
X-Inumbo-ID: 63a301bb-ea15-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739456305; x=1740061105; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL+tHzYYBBkkD6QgJt+QM0K1T/hQNry2rRc4z9ejOJ8=;
        b=FhEV/aD+X28UVDo04FkQhT5AU2AG8qTS5VDcwi3tJvMSNIohBMzafrwUulSV1QM/Ed
         LdO8y1O+dM8nYk476IHFJ1iGhxemyZtGXhINLZhUeO1YwrnGZ9y/O8bZXr1NukHMfOle
         D/8VR8cPxLkCk8+ufGX6vJvJjy8B48DHhWbL69INPwtmM23eRsN7in4e30xlRO3nyLTI
         RZO53RLFrS76938YwKsbO5midYUVOHAZOWKzhcEYhrQSZdAd6WVq6FEGVIB+6LHlITZu
         Wp12fd15HZXqJUQRk7ap8+lQbAC7jLf7X94h+6PMHxKEdtiYOGhBPZF+jmhi5PFuOnRO
         NV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456305; x=1740061105;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bL+tHzYYBBkkD6QgJt+QM0K1T/hQNry2rRc4z9ejOJ8=;
        b=iMV+XW4mX74lWovsVcl0/LwxC5AN41L9n+OBRf++m5MWhvXdcqyncpRr83F304HcCR
         wNj9d6Wz+xjRtdpMhJp8GaZBLP201VoaD4Qx6Bvk0RBbHyqRFnTNoZlrxBZDs9iDn19w
         QaFXs880Z783wMXGbEz68MHWatcqeOKggOuFjoEHasKdbFj0tmNBUB6g3GVfXpftH2DC
         P9yJdybseDwENpPl8QNIZPdmevm1e8H28XtOO+7mMBuTFdGBvhXrEZixNLpZ2MSGF44P
         79qd6GtAIPpYgkXKlspX+NrO/pKntQ5YW06Ra4WhUcJHEYaHvcAZVagyD4m8aeQdnAyf
         Oqqg==
X-Forwarded-Encrypted: i=1; AJvYcCU5RN4yjZeMJZsMZ6otdTttOWXJ1/idYrowTf0nSkWmcpfN+7A0xyahRDtu0lygXWBOpnBSwePhfmc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfaRw+0xTO8KPVGhRiyktFkL59isqkrNdYbIxnYFWmnYWFFhBP
	A861E8Fj/ODUcxGjmzL5vcnvhaQl+UegSWr8ER/mu5THnIWCA0uw
X-Gm-Gg: ASbGncuK0+CIH6SG0UPqGWKTSr5kvvn2lhNrN938h+ZpJ5XKaNvHlACqCHCzXbTZhvG
	0sxxYdgjKilYaho/HAcvbimR6xt/F+VdEpR1u6sz5JBW2ETtuEpVvTQtmlz44RzOlKMu4gF3RLl
	nrG5+AlYYT03WFc1GgwALE95JlN8PynGNL+dG/6op+r61WYzSkX6mpaZ5J66zv3TJ8zcjM3OaTg
	o3ZP/BNlma/irkyi2n0O2xwRQYXUvSoRwKRfCLNvMDoZxJtOxuh7xnlRIvfJ9ryJdeOf69UnHjf
	8pqMiDuAAlKfwzAHYGxWLv+XV0c=
X-Google-Smtp-Source: AGHT+IGhK5/cd3aK1ikc8sO/3cL0AGP5f4+2kQ/gmnnpNdq1s/4m5ak6t0Wqov/EBAj3K6qXuaCi0g==
X-Received: by 2002:a05:6512:3b22:b0:545:5a5:b69d with SMTP id 2adb3069b0e04-5451dd9bc85mr1252204e87.31.1739456304980;
        Thu, 13 Feb 2025 06:18:24 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------90U97Tgx2PWgde0qClHSkOq2"
Message-ID: <48678e78-bef0-49a6-ba5b-0759cc77ae38@gmail.com>
Date: Thu, 13 Feb 2025 15:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] CHANGELOG.md: Mention stack-protector feature
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <20250114042553.1624831-5-volodymyr_babchuk@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250114042553.1624831-5-volodymyr_babchuk@epam.com>

This is a multi-part message in MIME format.
--------------90U97Tgx2PWgde0qClHSkOq2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/25 5:25 AM, Volodymyr Babchuk wrote:
> Stack protector is meant to be enabled on all architectures, but
> currently it is tested (and enabled) only on ARM, so mention it in ARM
> section.
>
> Signed-off-by: Volodymyr Babchuk<volodymyr_babchuk@epam.com>

Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8507e6556a..62e6c26aaf 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
>        forwarding the calls to EL3 FW if coming from hwdom.
>      - Support for LLC (Last Level Cache) coloring.
> +   - Ability to enable stack protector
>    - On x86:
>      - xl suspend/resume subcommands.
>   
--------------90U97Tgx2PWgde0qClHSkOq2
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
    <div class="moz-cite-prefix">On 1/14/25 5:25 AM, Volodymyr Babchuk
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250114042553.1624831-5-volodymyr_babchuk@epam.com">
      <pre wrap="" class="moz-quote-pre">Stack protector is meant to be enabled on all architectures, but
currently it is tested (and enabled) only on ARM, so mention it in ARM
section.

Signed-off-by: Volodymyr Babchuk <a class="moz-txt-link-rfc2396E" href="mailto:volodymyr_babchuk@epam.com">&lt;volodymyr_babchuk@epam.com&gt;</a></pre>
    </blockquote>
    <pre>Reviewed-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250114042553.1624831-5-volodymyr_babchuk@epam.com">
      <pre wrap="" class="moz-quote-pre">
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8507e6556a..62e6c26aaf 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
      forwarding the calls to EL3 FW if coming from hwdom.
    - Support for LLC (Last Level Cache) coloring.
+   - Ability to enable stack protector
  - On x86:
    - xl suspend/resume subcommands.
 
</pre>
    </blockquote>
  </body>
</html>

--------------90U97Tgx2PWgde0qClHSkOq2--

