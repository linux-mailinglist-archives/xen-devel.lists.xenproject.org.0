Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3176A5BDED
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 11:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907795.1315006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwva-0003PP-Hx; Tue, 11 Mar 2025 10:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907795.1315006; Tue, 11 Mar 2025 10:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trwva-0003Mr-Em; Tue, 11 Mar 2025 10:33:38 +0000
Received: by outflank-mailman (input) for mailman id 907795;
 Tue, 11 Mar 2025 10:33:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1trwvY-0003Ml-Tt
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 10:33:37 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48ff1b25-fe64-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 11:33:34 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a66so74779366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 03:33:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac25328f86fsm773210266b.64.2025.03.11.03.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 03:33:33 -0700 (PDT)
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
X-Inumbo-ID: 48ff1b25-fe64-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741689214; x=1742294014; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2dt2YEi6bkLuYjuQ4wupWEEHqAqv6aJi8xRVFE4GCI=;
        b=Cjj33nortfjFJw+1NozPs+LRP+roELCeexcDyqaUAxpqeC/IVwjLWdEyF1TuYbQYdK
         EEvjYsvaUSbcWrzptq7KrLSF3+ueL4TY8Kcwb2ESqeIoohw7eGYTUiZoSb4GDS4bjLIj
         X4WuA8Dqf+e0kfRYWM41xB3Gfx3g9aAHMbH4ewAjRMBIwgKg1mES8cHnLRYNQv4BBc11
         LhG8tLz/Ii25pwWIquKjapZSDAsg+kgZHiXUgCwQbiExkdK/kGGv4euagxv+0MuekGRz
         5iUw8O5B86YRHydt7jwiK0/ckHErBIebHhlSuVX5bQ/3wVxLjJ4zJQKMcgeloDjAwtm6
         YL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689214; x=1742294014;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l2dt2YEi6bkLuYjuQ4wupWEEHqAqv6aJi8xRVFE4GCI=;
        b=gTSO7F3jEUyeC0sjGHxaieTSl6Oar+f9u8wwEZ//AJveKDr2RkiK68wRsrynqSda12
         9z9Q2QdJv2FrSx9N6Uxa2KdOcz2JKUz9p7c1qT1RGfyCcUzluxYOHwYxLfz6+vA/tevb
         msQi79m1qWK+TECPx5xkPYFZg+qosHevIxkqF55PpKAH70tSiBvwZzJEfZulFTSLMnsr
         bVCH2RmCuvM8LKeWUAX2Qav+uYAWzNHVM5rD0clYGsaI6KbjXqI2puAuTbkG86zz3MKv
         142xB31OVHGl0nZCBSrEQ8OW/GiQkBj3h91NEfv5gyFe7Y8J88NB9EuSSwPqvpulN6m5
         qeYw==
X-Forwarded-Encrypted: i=1; AJvYcCVnu3kwhBgSLrtAAwEUmgin+uBWjIp/nakeOVq8Ul41lOfDpbk8rDGJHJx+K1bk0mZh8800I550llM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0aTeZUKRyoPXI9f6prOx+9jKp6kr6/ckXQsQ9GxusfZuWsUeE
	+MD9r1x2WJBSgWDj+tRmlrxZv5HMwblg1sPvueT2ZwUpKIQIM6AM
X-Gm-Gg: ASbGncvcciZYAgw5uNJ3qfxkKPkgH4iAKwbkF4RtlQEz7awD6XTTWh39KEKpnIBAVcz
	V/vLVO3WcqLOnTQXRxh4OP6290R+xbXfQGBA0CSMJKavJgdUSJxolVowd+oZ6Q0SAAeqcHi51tl
	Q1TzldOTxTOtAy0S45ZIScr4Kc69FBP3ClvKjD25ZZoAsTymDyBlAYDsgZRv2i14nTp3VxFuvgp
	bfCsR20TqcNcT5rhNL2k15lnYwbhXO9jDZg7n7ImT9lwy4C0zfv5lIttPo+/60QuBuqTOjVGcBJ
	aKz5wrQUoTIc4tFoHwtZ+snhSMyly5Ps4YGCQoNrwyVF24Jeg7WjuekliPgGnzU2/h3dC+OD5Hx
	sRXPwnX1SBp/Rj3ItdEv+
X-Google-Smtp-Source: AGHT+IGxQY4J2ZrJ/3Exe+Kv+bny7qsqr9NTO2YmBvq8vA6gl2tte2UFl+QVCbdLHKk0Z6+OGccakg==
X-Received: by 2002:a17:907:158a:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ac2b9e1e390mr292725766b.29.1741689213702;
        Tue, 11 Mar 2025 03:33:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------IBCb16rOC0R6LYt0gbOFyik8"
Message-ID: <0343b6a0-9b38-45dd-be05-9b5f599c3bde@gmail.com>
Date: Tue, 11 Mar 2025 11:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/16] CHANGELOG: Mention Xen suspend/resume to RAM
 feature on arm64
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <9706307f5349238240704c5edf2e708a5d93ddf5.1741164138.git.xakep.amatop@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9706307f5349238240704c5edf2e708a5d93ddf5.1741164138.git.xakep.amatop@gmail.com>

This is a multi-part message in MIME format.
--------------IBCb16rOC0R6LYt0gbOFyik8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/5/25 10:11 AM, Mykola Kvach wrote:
> Signed-off-by: Mykola Kvach<mykola_kvach@epam.com>
> ---
>   CHANGELOG.md | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 04c21d5bce..489404fc8b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   ## [4.21.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   
>   ### Changed
> + - On Arm:
> +   - Support for suspend/resume to/from RAM on arm64

With proper Acks for the rest of the patches of this patch series: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>   
>   ### Added
>   
--------------IBCb16rOC0R6LYt0gbOFyik8
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
    <div class="moz-cite-prefix">On 3/5/25 10:11 AM, Mykola Kvach wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:9706307f5349238240704c5edf2e708a5d93ddf5.1741164138.git.xakep.amatop@gmail.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 04c21d5bce..489404fc8b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 ## [4.21.0 UNRELEASED](<a class="moz-txt-link-freetext" href="https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging">https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging</a>) - TBD
 
 ### Changed
+ - On Arm:
+   - Support for suspend/resume to/from RAM on arm64</pre>
    </blockquote>
    <pre>With proper Acks for the rest of the patches of this patch series: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:9706307f5349238240704c5edf2e708a5d93ddf5.1741164138.git.xakep.amatop@gmail.com">
      <pre wrap="" class="moz-quote-pre">
 
 ### Added
 
</pre>
    </blockquote>
  </body>
</html>

--------------IBCb16rOC0R6LYt0gbOFyik8--

