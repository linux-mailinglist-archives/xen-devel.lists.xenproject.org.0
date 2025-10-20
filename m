Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895FFBF23EA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146522.1478940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsGj-0004FX-Bj; Mon, 20 Oct 2025 15:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146522.1478940; Mon, 20 Oct 2025 15:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsGj-0004DW-8u; Mon, 20 Oct 2025 15:57:57 +0000
Received: by outflank-mailman (input) for mailman id 1146522;
 Mon, 20 Oct 2025 15:57:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsGi-0004DQ-6W
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:57:56 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5b162a-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:57:55 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so817315266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:57:55 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da25d4sm818947166b.9.2025.10.20.08.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 08:57:54 -0700 (PDT)
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
X-Inumbo-ID: 8a5b162a-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975874; x=1761580674; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEGWSW0icQ11mKsWNcRWZNRmXo8pekAg8xtpdKTqbgE=;
        b=ODA/XA3y6dPJ4xY5JL+wOCoITxVwvLro3vTYLFiYJWDl3wu4/t006QSkPebO5NhTUG
         KTPhXZT8MYMcCrqWaJgHx0t+QRzevJ/7vmlq8Rm4cPRBVa7hiM5xE7PbKFpcqkGgpyrq
         2d94yj6ZmsvwEVraT4jwGVqT0uWGfRzE3fALzmtDzVdsMhhQj5S0iYBF3LNdAjm1I281
         Oz3Obqc0aZBFZXSNZVjy65ejwp0fY5JEfX1/QbtKIHQFvQNEBVFNJsTsepNDxPL1uiB6
         oOQ9BaRGOSz3O0Vsxd87ZbgbrtCYVL8xPqr3rt2/C0UoGQYh5f4U2SLBUdOKVKZi9IzC
         +bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975874; x=1761580674;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nEGWSW0icQ11mKsWNcRWZNRmXo8pekAg8xtpdKTqbgE=;
        b=JsXVsRQ5rns3mFdQikwge+sR2xEacSBgPrOO4mC3YTiKn+VIm48Hd1KeR/20iRS+sI
         bYNuvggaDoFqh9JXdlqZBCQiLmVjv7AmOsumSZniuuijrrvhH9l1mAqyyQiOMef6Fy9N
         zttamb55cTIbsiGthcmE5bFetE2sEuFEmjiL2l6AZIJ7f0gJhxrg/kcbVo8G+Gc4JeLc
         pdR1gHAoLxMpEu6u6DwTZvujgGJQ+o8rEZwzbdTch4sCjWf2774v+OvG3KcXUOeCvoDx
         BNcGiI4+rc9OviE0k83QL+JF5ZfJK58+OSRNXBY9fHDILGg+tWl2lW4/AfiqhwCoQEsd
         m30w==
X-Forwarded-Encrypted: i=1; AJvYcCU/Bh61tx4mYAQQ8f2NteeAmy57WB7fimhIwZSZfhXuG2DZHCUX816tjQCgkuD21pJPCXftwiAnL4I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+8jy78/AnTQeuU2S77eEr4PxmkBPRRn810tkXofSVQAONqkR9
	G2sWtgAgcb5DN00KVXwIDYsu4UwNoDRkKvpsHyucBfCQmmzaAojt4nNC8XxMtg==
X-Gm-Gg: ASbGncupVSRZwL5toEJ5zqnkIq5u7N4uVaOxUfwTQY9SG2dbIQF4bhPKrYUObtFPCg+
	+ewawFMnU8BbZOOV99zwpQMs/RW7O23WGkULOpXCfUZhODOg7R/8+1lmSEacQCwEV2gJzvHsyer
	gopopVTjlEkGdcmW+uP1hQkWuLIb/OEP+wb2uQX/tCSvlsA9wRWOKsKeMM+bAlt9BnUrFILzqSg
	8GsulQPb66ph91uUmE7QiVd2Mdnh7VK37pi2RotjsajvpWOsWnb1VFFcG26l/AsUVLdcnwmrMRq
	sr4LyHpXDKkyA3AqyQmiQhdoAJ7y4BiLiwX8QaQOxWnUN0AP0ppIw3EBVWFClSr0HisRyKhSgCn
	OM+TM59Dyp35hwz8E8VgJJ5YuimFr6BYD/WP04eAbYHlXmWT1rc73Ain03cT7GpQ6RQzqrbJFAi
	XvfGF5SOELsXibslE8YJRmoaYvK2jk4l5ScQC1skJfW/HD+b5B+RMm9Bs5
X-Google-Smtp-Source: AGHT+IHU+kMF7sAH70F0vMTbNKaU8F2mupR74+3eIU5eTqaOTlknQALhsJFRhwpKJ0prtzxTBDO5WA==
X-Received: by 2002:a17:906:7947:b0:b2d:830a:8c17 with SMTP id a640c23a62f3a-b6475706b33mr1559583466b.56.1760975874420;
        Mon, 20 Oct 2025 08:57:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ylxqce0dq5AWYx1gl6UG3Mv3"
Message-ID: <6d64fe13-b931-46c3-923a-cdd1ce3894da@gmail.com>
Date: Mon, 20 Oct 2025 17:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/tests/domid: don't pass -E to sed
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Denis Mukhin <dmukhin@ford.com>
References: <d385addc-ada1-4a75-b210-38146a1fad2f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d385addc-ada1-4a75-b210-38146a1fad2f@suse.com>

This is a multi-part message in MIME format.
--------------Ylxqce0dq5AWYx1gl6UG3Mv3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/25 3:40 PM, Jan Beulich wrote:
> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
> doesn't name -E as a standard option; only Issue 8 [2] does. As we can
> easily avoid anything "extended" about the expression used, drop the -E,
> escape the parentheses, and replace the sole + by *.
>
> [1]https://pubs.opengroup.org/onlinepubs/9699919799/
> [2]https://pubs.opengroup.org/onlinepubs/9799919799/
>
> Fixes: b3d31533a047 ("tools/tests: introduce unit tests for domain ID allocator")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> --- a/tools/tests/domid/Makefile
> +++ b/tools/tests/domid/Makefile
> @@ -10,8 +10,8 @@ include $(XEN_ROOT)/tools/Rules.mk
>   TESTS := test-domid
>   
>   define list-c-headers
> -$(shell sed -n -E \
> -    's/^[ \t]*# *include[ \t]*[<"]([^">]+)[">].*/\1/p' $(1) 2>/dev/null)
> +$(shell sed -n \
> +    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
>   endef
>   
>   # NB: $1 cannot be a list
--------------Ylxqce0dq5AWYx1gl6UG3Mv3
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
    <div class="moz-cite-prefix">On 10/20/25 3:40 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d385addc-ada1-4a75-b210-38146a1fad2f@suse.com">
      <pre wrap="" class="moz-quote-pre">Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
doesn't name -E as a standard option; only Issue 8 [2] does. As we can
easily avoid anything "extended" about the expression used, drop the -E,
escape the parentheses, and replace the sole + by *.

[1] <a class="moz-txt-link-freetext" href="https://pubs.opengroup.org/onlinepubs/9699919799/">https://pubs.opengroup.org/onlinepubs/9699919799/</a>
[2] <a class="moz-txt-link-freetext" href="https://pubs.opengroup.org/onlinepubs/9799919799/">https://pubs.opengroup.org/onlinepubs/9799919799/</a>

Fixes: b3d31533a047 ("tools/tests: introduce unit tests for domain ID allocator")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:d385addc-ada1-4a75-b210-38146a1fad2f@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -10,8 +10,8 @@ include $(XEN_ROOT)/tools/Rules.mk
 TESTS := test-domid
 
 define list-c-headers
-$(shell sed -n -E \
-    's/^[ \t]*# *include[ \t]*[&lt;"]([^"&gt;]+)["&gt;].*/\1/p' $(1) 2&gt;/dev/null)
+$(shell sed -n \
+    's/^[ \t]*# *include[ \t]*[&lt;"]\([^"&gt;]*\)["&gt;].*/\1/p' $(1) 2&gt;/dev/null)
 endef
 
 # NB: $1 cannot be a list
</pre>
    </blockquote>
  </body>
</html>

--------------Ylxqce0dq5AWYx1gl6UG3Mv3--

