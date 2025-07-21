Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7DB0C130
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 12:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051338.1419664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udndf-0007Uq-7s; Mon, 21 Jul 2025 10:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051338.1419664; Mon, 21 Jul 2025 10:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udndf-0007SL-3p; Mon, 21 Jul 2025 10:20:55 +0000
Received: by outflank-mailman (input) for mailman id 1051338;
 Mon, 21 Jul 2025 10:20:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ESUV=2C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1udnde-0007Q2-7i
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 10:20:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60f68e43-661c-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 12:20:52 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so767807666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 03:20:52 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca30d2esm649122366b.86.2025.07.21.03.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 03:20:50 -0700 (PDT)
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
X-Inumbo-ID: 60f68e43-661c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753093251; x=1753698051; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyhCJCpggArbVS68HeC9TzS2bMlLQCGwYvq8eshhwS4=;
        b=czqRzZWBm0CXvWj28RfvPWTO4qvFGHQd4or1a2rLHA3nuXZL4NkfbcsyC9axG2f/qP
         klaKVPOp7zmWPzDuoCYbvjWEtpVQxEqDSZbY44c3dTosKerSrFRMm53iVRi76HzN4jez
         1oIU5bY4GKF/f1nbseqPPdKKplssRl8O1iyQJp2MHyCVYYr+bBVcwdAWd/ap6zpxdOVq
         KwakMEH06zjl1FwY4ySXc6u7vEmC0/U30qH415pl6NyA+a5iIQajd1CShmk2mEo5PPNM
         L3dcUb0qHith28irYogOBeniDsc8unMkFeFIxJ631z6aI3CMvuCObnOYfaH7r8mVR9Gg
         Pl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753093251; x=1753698051;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yyhCJCpggArbVS68HeC9TzS2bMlLQCGwYvq8eshhwS4=;
        b=wvT10wXSDSbazqEqK1yCzdQrD0CDxKH1kdaQXofXhFZw/Nww5S2xBE2ZQVp6H9Dj33
         +6sjGyE5aIOGOXaal3RpwHCS+UkmHu82EFAUgFukEz+a7LTASUcZOZxBWn1z5fR0pWZm
         y/TbK8B2jj4rJ7SsX/4hRDU8YvFFCwIN+wRyWt0A0z0s0f5tCKuBfMC1xVuQYUrAF404
         82lW79evTnC7iTKmsvTMGYoRAoeENGY2DP2z91wSoHNk99CRGgyPdlzASTN9fbynZrUl
         VUP2k3uZSrL454Rm/JsEutAZqIW2wciOftshpd1tGrDzmxfsZL8ifUvbi0yXzgvyyHf2
         GerQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu+rnNiOUDTgN6ZMXAVoxt4INFRivEBw33qhJeOUI7gW480U7VH22xJT8GTAAbdPsMQdCUi6bh+RQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3h7Bdvmxe9Ln2YuEShvgXcCzJL6amq9b4M7SPb5CenDJ7z6ST
	4waetK17lf1MYCA/ZqsvI2fQVTWSso7bUMGxe2TZJM9Y65XJRVRAWfGq
X-Gm-Gg: ASbGncsQBds2mR/F/mIaPCLDaLLW7ncO8gJEqvLgKfG4x7jS8BDyOFOIsX+O6fV12nc
	1C9Esv5nn1XlHZz/hmyw5oA7r3/y6HPPZxoqKUYg/u63MCec6QBgUWIEET4TaC8r17JMYFjiIvQ
	vNcOEAaWBzQSKpDNKuHahXY0mDK8eROshbD+iPBKecNtgH4Z2Z3EKKJLCd19ukT7NmFw0ulnRAT
	kMhWUUgP9njicYxpsKrIB2fLhlPOvcyuN34zz2ZAw03xLezZGw/vw5hoqjr1m0KkFGYwJC5Od26
	Aq50V23D8xwbSIJns0s42JFcOsRlsmfIgc/8EMHfl+Wg0Z2t9OtTSmFTJs38Yjd2TtHqHZWdM9G
	SISHJXrjpPJKFgGoNJ+UZ7pGdCdwsQrk7gLfrcCNHe/7oKLRQgB94TaqtiG3yLhjD6NueWHw=
X-Google-Smtp-Source: AGHT+IEcMh3r/3+ZItsqNHhZGBQUR+G45ZMy979wfV05632BNTTxYPR/tVhRigMBA5+Ud+Nu/OUgEQ==
X-Received: by 2002:a17:906:7310:b0:ae0:a0b2:a45 with SMTP id a640c23a62f3a-aec4fa947e3mr1763438466b.14.1753093251306;
        Mon, 21 Jul 2025 03:20:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VeH41W0ni2CBZWa9jnoL2KCg"
Message-ID: <73da6018-f470-410b-ad24-950fbb7502d5@gmail.com>
Date: Mon, 21 Jul 2025 12:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] CHANGELOG: Document guest suspend/resume to RAM
 support on Arm
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Community Manager <community.manager@xenproject.org>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <d2d780b307d096b3ce157f8ef3f151b86727ea99.1751020456.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d2d780b307d096b3ce157f8ef3f151b86727ea99.1751020456.git.mykola_kvach@epam.com>

This is a multi-part message in MIME format.
--------------VeH41W0ni2CBZWa9jnoL2KCg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/27/25 12:51 PM, Mykola Kvach wrote:
> From: Mykola Kvach<mykola_kvach@epam.com>
>
> Mention the newly added support for guest suspend and resume to/from
> RAM via vPSCI on Arm platforms (ARM32 and ARM64). This support is
> limited to non-hardware domain guests.
>
> Signed-off-by: Mykola Kvach<mykola_kvach@epam.com>
> ---
> Changes in v5:
> - adjustments to the commit title and message
> - expanded the changelog entry to include more context about
>    suspend/resume support introduced in this patch series
> ---
>   CHANGELOG.md | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..1c155f7ff2 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>    - On Arm:
>       - Ability to enable stack protector
> +    - Support for guest suspend and resume to/from RAM via vPSCI (for both ARM32
> +      and ARM64). Applies only to non-hardware domain guests.

I’m not sure it’s necessary to mention “(for both ARM32 and ARM64)” explicitly, as, at least for me,
it sounds like the default assumption unless stated otherwise.

But I don’t mind having this clarification included explicitly if you prefer:
   Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------VeH41W0ni2CBZWa9jnoL2KCg
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
    <div class="moz-cite-prefix">On 6/27/25 12:51 PM, Mykola Kvach
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:d2d780b307d096b3ce157f8ef3f151b86727ea99.1751020456.git.mykola_kvach@epam.com">
      <pre wrap="" class="moz-quote-pre">From: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms (ARM32 and ARM64). This support is
limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>
---
Changes in v5:
- adjustments to the commit title and message
- expanded the changelog entry to include more context about
  suspend/resume support introduced in this patch series
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..1c155f7ff2 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support for guest suspend and resume to/from RAM via vPSCI (for both ARM32
+      and ARM64). Applies only to non-hardware domain guests.</pre>
    </blockquote>
    <pre>I’m not sure it’s necessary to mention “(for both ARM32 and ARM64)” explicitly, as, at least for me,
it sounds like the default assumption unless stated otherwise.

But I don’t mind having this clarification included explicitly if you prefer:
  Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------VeH41W0ni2CBZWa9jnoL2KCg--

