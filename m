Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD84A11E18
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 10:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872283.1283242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXznq-0006cK-De; Wed, 15 Jan 2025 09:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872283.1283242; Wed, 15 Jan 2025 09:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXznq-0006Zw-B4; Wed, 15 Jan 2025 09:35:10 +0000
Received: by outflank-mailman (input) for mailman id 872283;
 Wed, 15 Jan 2025 09:35:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4PG=UH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXzno-0006Zq-Qb
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 09:35:08 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e4200a-d324-11ef-a0e1-8be0dac302b0;
 Wed, 15 Jan 2025 10:35:07 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso6199513e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 01:35:07 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be55eb2sm1999104e87.63.2025.01.15.01.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 01:35:06 -0800 (PST)
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
X-Inumbo-ID: 01e4200a-d324-11ef-a0e1-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736933707; x=1737538507; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVUGBHsOaBRGW60iOI7JTNbwhnMQ5aNfUJ+W80MQNRM=;
        b=E5+6gibVM1VtXBTxNVTzK29HlyOA3iILWwPcViBBvCzyriuEcV7JaSuoykOHXeyW0C
         SOSNCFwy3ei/ZyLKzgAR1APpO2Yb+wCUV1p2EY/OxE58NhO+un0IIeO5XZbYvu/cr9Tb
         /+GYJWjBtYwrB1Z81j9VgcQDvSQVeX3B6MEymJYVvLcMOyhNJcYuytHP+5WjECwrr/v6
         p0v3PoIjYhqR1PRRjHq/bC8rZFett5StoXw4muEDVJFaVfeC8UfdSSU9MCOaHCwd71aS
         IKcYEAgCePlhKRfYAUubzJMRvgd4XpowboXQ5CxkZWuy3MtluuM9tnhhNQZa/04lmdbH
         ekKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736933707; x=1737538507;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MVUGBHsOaBRGW60iOI7JTNbwhnMQ5aNfUJ+W80MQNRM=;
        b=NWniODtu0RvGEVvMlWsvropz+B2GAEYninRaerX6/8DlJUzPsi//BQOolVoDf0dU44
         eqm6f2G4bB9OZl3e36XI4ft6yYeMEEEyPlkaiZF5SBLP59M8pDcm9RG9DJQXcVSGyYDi
         uV82fuKMoAT4PuGezbk4JE9BTADTs+3Tv5sn2pzqnVh8ndIjfSJ6CTkyjYsNpF0tCE7j
         dqO6Vnrs/kxlSZ24P0H8IYGkiVLQNuhT9yfrxa0mV3PyvjTQJAkjIz5y3W1pWMqnaE7Z
         YxCKHNYVKfQy1ujaCjhV9wCCrKw80pIR7TfrZ8CxkUlPZHY+JnxoGDZ+XDNv0ImZtSeY
         XM7g==
X-Forwarded-Encrypted: i=1; AJvYcCWdlsXu8mApR0/w1Gre4CbJ6eXM9qTp/aVhB/dSdcuZ2CiJyWPBkd/yNqtHTCWTumrnbyZE6KKWBc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvajKrvsDZX/LHfioQ+RxibuROofWKSSaJwlwDFPPfeJnlb3si
	IOFSJ26ccsNOmx6jGi5cwE11M5aZo7sFZvBMoJiKmMSX05T8kNe4
X-Gm-Gg: ASbGncvf8GBLtwAM95FIThNGUKYTvogOfv6c+w2zOqZgvG4+tHVqMmWoblAu9DCJBLC
	zJl6JtwjCZ9gl0FLo+4fzVCzmiifMoqFNHfgcuh0yOoEBgWnQ7m1tdDDYgVr21tZW+lR6bzvYvZ
	mDs97tL0fsNTVllqMgeJrZJzXaGO+/6JH8qqZNLqfdt9NCWskWoIq71mZVVD/B/65nx7ydFrbu0
	W2orCUetQjgfwJHnm4DmLJNVmv4B+eXPj1CkMJwCQpWqGyfZBzhP7cqh8TmKitairLwtg==
X-Google-Smtp-Source: AGHT+IH/J8kGBVm0+Pi5FXEcCR+0m/XhdVTAKV+QbJPBxNakCQfIj/xKvLYEFmzvHLQ4pjBpJylbNQ==
X-Received: by 2002:a05:6512:3d27:b0:542:2388:3f09 with SMTP id 2adb3069b0e04-542845b20bdmr8930899e87.37.1736933706733;
        Wed, 15 Jan 2025 01:35:06 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------m4ybZ1lbGe0P6uFPUc0udfX2"
Message-ID: <98adc1a4-e82f-4be4-a4c0-5d578884cf60@gmail.com>
Date: Wed, 15 Jan 2025 10:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] automation/gitlab: disable coverage from clang
 randconfig
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250114174345.60887-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250114174345.60887-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------m4ybZ1lbGe0P6uFPUc0udfX2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/25 6:43 PM, Roger Pau Monne wrote:
> If randconfig enables coverage support the build times out due to GNU LD
> taking too long.  For the time being prevent coverage from being enabled in
> clang randconfig job.
>
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>

R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> Cc: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> ---
> I will fix the orphaned section stuff separately, as I'm considering just
> removing LLVM coverage support because the llvm coverage format is not
> stable, and the code to dump it has already become stale.  However I need
> to think about it, and in the short term disabling coverage support from
> randconfig is more straightforward.
> ---
>   automation/gitlab-ci/build.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> index cb84f379b754..bc4a8a5ad20c 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -556,6 +556,8 @@ debian-12-x86_64-clang-randconfig:
>     variables:
>       CONTAINER: debian:12-x86_64
>       RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG: |
> +      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
>   
>   debian-12-x86_64-gcc:
>     extends: .gcc-x86-64-build
--------------m4ybZ1lbGe0P6uFPUc0udfX2
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
    <div class="moz-cite-prefix">On 1/14/25 6:43 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250114174345.60887-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">If randconfig enables coverage support the build times out due to GNU LD
taking too long.  For the time being prevent coverage from being enabled in
clang randconfig job.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a></pre>
    </blockquote>
    <pre>R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250114174345.60887-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
Cc: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
I will fix the orphaned section stuff separately, as I'm considering just
removing LLVM coverage support because the llvm coverage format is not
stable, and the code to dump it has already become stale.  However I need
to think about it, and in the short term disabling coverage support from
randconfig is more straightforward.
---
 automation/gitlab-ci/build.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index cb84f379b754..bc4a8a5ad20c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -556,6 +556,8 @@ debian-12-x86_64-clang-randconfig:
   variables:
     CONTAINER: debian:12-x86_64
     RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
 
 debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
</pre>
    </blockquote>
  </body>
</html>

--------------m4ybZ1lbGe0P6uFPUc0udfX2--

