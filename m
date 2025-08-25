Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49DB3380D
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 09:47:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092699.1448360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqRuD-00037c-5J; Mon, 25 Aug 2025 07:46:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092699.1448360; Mon, 25 Aug 2025 07:46:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqRuD-00035O-1G; Mon, 25 Aug 2025 07:46:17 +0000
Received: by outflank-mailman (input) for mailman id 1092699;
 Mon, 25 Aug 2025 07:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vK8y=3F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uqRuB-00035G-5Z
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 07:46:15 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 928e88c1-8187-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 09:46:12 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so648546966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 00:46:12 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe90c8f85fsm28504766b.8.2025.08.25.00.46.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 00:46:11 -0700 (PDT)
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
X-Inumbo-ID: 928e88c1-8187-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756107972; x=1756712772; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9E3Wlnt8UFbi8Y7mSUE3lliz3s2YX7D8DAtZ6KL+wDo=;
        b=AlFM29neTrXMBUJ2AJ2UxpFeTGxmEjMYkalr56C9KejJaKBFnDXm8LHlgmj5sdEsMZ
         B420d9u2W/qVclufhtzhVDRECAmEvv2DkJN4l6P3QwQj2N5NA85fx34BXZNsHyLS23QD
         4miwU6VvsiqdjV6DokuUilIqdwBZJS7evHkfW/glZq80O7CADfUeqa7SxKaS+HJkda+N
         TEWs2TFJ2GlKbZp9MHdSE/ETjdtmBeNJQUOENnUXSGmRd9VZP9+E0JuqSlMVzqpLYp7J
         HQAGUkrx1FjrZkYbvqR+Xd340pd2uxESfeT24G/g1QS9OXj7Obt4OGZJfqEpANgzYtf0
         dZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756107972; x=1756712772;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9E3Wlnt8UFbi8Y7mSUE3lliz3s2YX7D8DAtZ6KL+wDo=;
        b=wWHEHRknRPQp3gJAdbce7xhTenMai7wZmHPByT7/nJpRfs+pr/3aZ5UqeCbkJflQCD
         qn4VtxM0X39GQjJ59qwNx5giN7laZ9DtCFWLKJFGfrW/VlFJ8llHGeVF3LuHQysuTgGU
         WdyrUvQmZPQvFhAZxZMyOTPsc06PHMUNczxyREsFlkupwdhG9djHrYDfW5h/ZZYNCNCB
         z1IYccoKgRzvpBBk7aGBP7mXNoj3igIeDDNiZeI1CvE6kNvsCuEwKOxe7IvarIQdBI2p
         RxK3UAJoXk0LEMkpLy+xU0g4+b//UuUKVZNLFyKi5JWWycZLj6Fv3VBhh7SrByoWjFEk
         R9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXxsSz4vo54a4ndC36+Ehv7bQ/QtubY5T6Tdhtou2Q9zq8sOSJXBXxjYu7YroF6CNQs7HNiwoNZcHI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUR+OR+g5zFBulzpLpCgMfQGuqq3c+29TwHBK+DLp629S2yTr6
	L9mIub76O0eBxJR0SBYBL/uAlSJi16xK93Z7SPfVi7DM8q/B/1iVkQ5oBLsmyA==
X-Gm-Gg: ASbGnct3dhIDnP0LXNLXNPgtbFDdS8UmRHClWIimxPds8F8kO786T463PWJg8EFztte
	yH2db8a72VydZly1watusOfqBT5LGLdaaFk3fRhoODZJuqAJEWBV7L8+sWvzLaeQiwHguuDTH1n
	w2zFAHHyhpMMlu/AfInATBzrmb/pZr1Sss70QxJn8D8AQz3+FVbt4MYavqcCI3O7lMKfbt6W1ND
	ybJLO0QkpzBkjFgnauWwd4f1csgzPzoEoSejoffG/MMUck96VlhjhBt+Oe1gtXO0JZY9kyHoT5j
	0+s1150hRDVeyv+XOjX3GV3vCjLwq9rk+6LW/AziWVkx05KHzchYDVrJu+oieMONbhWl50dulbo
	w3tAe8EquI5QddoMiIv/tQhDZt5Jxr8zyPsHIVVeXIHjXIgSUt58UpYJ4GjEPJOnzC183piiiVX
	ElL57Ybg==
X-Google-Smtp-Source: AGHT+IFyLyEF88oxkc77LYD86jtSuP0XlbL2MGzZ2M9KM/AJfq2NZYW4qp3va1QFO+zCm6VfAYPj7Q==
X-Received: by 2002:a17:907:7f9e:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-afe28ffcd7dmr992040366b.12.1756107971892;
        Mon, 25 Aug 2025 00:46:11 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------UB3wZH0rfXp3zSfM0QrrAFCK"
Message-ID: <7446638b-b7a7-406f-8ebe-3aa8bf94bee9@gmail.com>
Date: Mon, 25 Aug 2025 09:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] CHANGELOG.md: add new SMBIOS tables (7, 8, 9, 26,
 27, 28)
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <cover.1755987697.git.w1benny@gmail.com>
 <3c9c7c48c9d8633b4c36bb0bb91fab88c03ae279.1755987697.git.w1benny@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3c9c7c48c9d8633b4c36bb0bb91fab88c03ae279.1755987697.git.w1benny@gmail.com>

This is a multi-part message in MIME format.
--------------UB3wZH0rfXp3zSfM0QrrAFCK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/24/25 12:26 AM, Petr Beneš wrote:
> From: Petr Beneš<w1benny@gmail.com>
>
> Signed-off-by: Petr Beneš<w1benny@gmail.com>

Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 271ac73a0a..2fd65b90a9 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -32,6 +32,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        capability usage is not yet supported on PVH dom0).
>      - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>      - PVH xenstore-stubdom now supports Live Update.
> +   - Support for new SMBIOS tables: 7, 8, 9, 26, 27, 28.
>   
>    - On Arm:
>       - Ability to enable stack protector
--------------UB3wZH0rfXp3zSfM0QrrAFCK
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
    <div class="moz-cite-prefix">On 8/24/25 12:26 AM, Petr Beneš wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:3c9c7c48c9d8633b4c36bb0bb91fab88c03ae279.1755987697.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">From: Petr Beneš <a class="moz-txt-link-rfc2396E" href="mailto:w1benny@gmail.com">&lt;w1benny@gmail.com&gt;</a>

Signed-off-by: Petr Beneš <a class="moz-txt-link-rfc2396E" href="mailto:w1benny@gmail.com">&lt;w1benny@gmail.com&gt;</a></pre>
    </blockquote>
    <pre>Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:3c9c7c48c9d8633b4c36bb0bb91fab88c03ae279.1755987697.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 271ac73a0a..2fd65b90a9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -32,6 +32,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
      capability usage is not yet supported on PVH dom0).
    - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
    - PVH xenstore-stubdom now supports Live Update.
+   - Support for new SMBIOS tables: 7, 8, 9, 26, 27, 28.
 
  - On Arm:
     - Ability to enable stack protector
</pre>
    </blockquote>
  </body>
</html>

--------------UB3wZH0rfXp3zSfM0QrrAFCK--

