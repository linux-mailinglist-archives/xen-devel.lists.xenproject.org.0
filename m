Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44DBDF389
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 16:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143735.1477373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92y7-0007xD-0F; Wed, 15 Oct 2025 14:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143735.1477373; Wed, 15 Oct 2025 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92y6-0007vm-TC; Wed, 15 Oct 2025 14:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1143735;
 Wed, 15 Oct 2025 14:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6Sp=4Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v92y5-0007vg-70
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 14:59:09 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 801b322f-a9d7-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 16:59:08 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso1379064466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 07:59:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5ccd6b5d95sm249495166b.78.2025.10.15.07.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 07:59:06 -0700 (PDT)
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
X-Inumbo-ID: 801b322f-a9d7-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540348; x=1761145148; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUYSTapuNCgSw3RTasCuB+llFgivMMdxUG13lXmGOj0=;
        b=ZAKihMC89MwyPPUxkq0aDs1W3DXLVbFyCwgHUQQNdRP65uAEEowiNozU90xnocFfDY
         cFRiSlusVh3Wzrg4zB/E7uPYm5es99wXG2dN1U71uIgvXBhkK/801bxoaJyCv9rPx3TM
         EWZHtxis0c6XQBuYV4mdgRWuW3+Msm8gTjZv9oT5g/dF3dXqA2U9JuK2s+EXcb56jSm+
         sTPRxxz9nz8IXWcpm/PPdwfe8Re2oGPTHa7DGUZRppmyF/9pEfaNsjdU+RPF6y3uNtMj
         /GMFVoz+Rd87wi5UG86bIf25yy7Nt0bLfDXkBi6nO5ThdHKxO1KiYPUk0ZYzkffQSl+W
         kZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540348; x=1761145148;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUYSTapuNCgSw3RTasCuB+llFgivMMdxUG13lXmGOj0=;
        b=uh+SOmtElkrqC92G8X421EH2c0VjrtfBccUDN53JHoTjQivnbtk7R2J5qkkHulvRkd
         0HzwKV7K7/08IWlSwUILqB74P96TBfMnwQ4kPqk2VbmsnEQsJqLjfTzKLUU3mZxqsx9L
         a7Vexr+H9XeWY9qMDrmWMjo1BbFQ7xQ80l8hOM+m19Lzsq4ep+BlWVvYR3XtvLqhQN9C
         5gi6TwVugGEhS0inuN5dMJppy2aTcRNSykrcZ0iaOK199vwIXeeFEL7Svn2TUrsBA03F
         mMPeg8A1khwQZ3+AuORmA7DGFlCq0/F+DqA+Al4QdYbv7tdlaM88/2d96XQeS7RhOrxH
         DkUA==
X-Forwarded-Encrypted: i=1; AJvYcCUKZcYlma4jJfkLlj1ZCAzG5i0VEiEat4QrarvN+I4YAEs1HEOLgWaaMmCH4N/C/L76WCgF3+hAIRg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+HVbFCIlXsjnIS/Pz9kR/jcxfzVY+WDBtsV0w6SORo7UZM1Og
	eLacjPIJkL+V2Ftn5XtRmXMbtzP5DnJPFyibHJcwbXAqvWv+0DdANaV0
X-Gm-Gg: ASbGncuB/vrFkU3Mw9HVZnVQcaokdp5jb2qjNVKjExlJki1+HCgloxmcuAn1Na0aX9R
	oWsL4J4Nyj0j618xJbVgzH7AkTAHHeGXEqw98368/qSx/k8vwCgaTlPfkmBZqpk7h5sLGenk/JI
	XRBOwUENzKFPz4HOCW5DzcAipxkcG0uHVoHwjmQBU8yQIP8aIF5SThNMozOi0GU5vRD8lG2hSfa
	fsJXysa/9Kl7u70YXSIGoElxvZtTx5xuyS8SFR1/a+wIvcY3Kg0VX3Q5VBX8JXKzjByMWv/WH+3
	dk3ZJS62I7RXNS3bAORglSDEbdPPISUgANW4nLRCU4B/yFgiODPDwu7M1xCE1Sfs/itfWbH6Br3
	3jG2yMZXCjBfD75Rb0DbM7EUzgXT5CiGOxDzVxhE89GnBThZGI1sepeTbNGLSYmyZYiMV0DvxHt
	ceTCUj/8UMJUmVb5PMuQKfqaCrJYKX80iJ
X-Google-Smtp-Source: AGHT+IFNXUmtKelnFmx2Pf8n5luOV5xdBwC3q6TeK4dkdxKwhM+1qKsj7AbnwaNjoPjs7kScrvn4dw==
X-Received: by 2002:a17:906:6a17:b0:b3c:896:abdc with SMTP id a640c23a62f3a-b50acb13252mr3031709166b.60.1760540347085;
        Wed, 15 Oct 2025 07:59:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------z6J3SEyxw8Wu0v7eJg4kl4wj"
Message-ID: <f88fadea-7f92-431d-8672-9c2a854a5354@gmail.com>
Date: Wed, 15 Oct 2025 16:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] CHANGELOG.md: mention the introduction of
 configurable altp2m count
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <35ba6d10b77893edbacbaea872c1ca742c767af5.1760308066.git.w1benny@gmail.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <35ba6d10b77893edbacbaea872c1ca742c767af5.1760308066.git.w1benny@gmail.com>

This is a multi-part message in MIME format.
--------------z6J3SEyxw8Wu0v7eJg4kl4wj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/13/25 12:28 AM, Petr Beneš wrote:
> From: Petr Beneš<w1benny@gmail.com>
>
> Signed-off-by: Petr Beneš<w1benny@gmail.com>
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5c70bc0250..0cf9ad2d95 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Allow controlling the MTRR cache attribute of the Xen platform PCI device
>        BAR for HVM guests, to improve performance of guests using it to map the
>        grant table or foreign memory.
> +   - Allow configuring the number of altp2m tables per domain via vm.cfg.
>   
>   ### Added
>    - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and

Looks good to me:
   Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

--------------z6J3SEyxw8Wu0v7eJg4kl4wj
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
    <div class="moz-cite-prefix">On 10/13/25 12:28 AM, Petr Beneš wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:35ba6d10b77893edbacbaea872c1ca742c767af5.1760308066.git.w1benny@gmail.com">
      <pre wrap="" class="moz-quote-pre">From: Petr Beneš <a class="moz-txt-link-rfc2396E" href="mailto:w1benny@gmail.com">&lt;w1benny@gmail.com&gt;</a>

Signed-off-by: Petr Beneš <a class="moz-txt-link-rfc2396E" href="mailto:w1benny@gmail.com">&lt;w1benny@gmail.com&gt;</a>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5c70bc0250..0cf9ad2d95 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Allow controlling the MTRR cache attribute of the Xen platform PCI device
      BAR for HVM guests, to improve performance of guests using it to map the
      grant table or foreign memory.
+   - Allow configuring the number of altp2m tables per domain via vm.cfg.
 
 ### Added
  - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
</pre>
    </blockquote>
    <pre>Looks good to me:
  Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
  </body>
</html>

--------------z6J3SEyxw8Wu0v7eJg4kl4wj--

