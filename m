Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FABC38C3
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 09:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139332.1474730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ORl-0004Ox-SB; Wed, 08 Oct 2025 07:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139332.1474730; Wed, 08 Oct 2025 07:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6ORl-0004M8-PY; Wed, 08 Oct 2025 07:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1139332;
 Wed, 08 Oct 2025 07:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZBS=4R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6ORj-0004M2-Ni
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 07:18:47 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06eb1a70-a417-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 09:18:45 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fb48315ddso12352296a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 00:18:45 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637714115bfsm13889691a12.20.2025.10.08.00.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 00:18:44 -0700 (PDT)
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
X-Inumbo-ID: 06eb1a70-a417-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759907925; x=1760512725; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ghmY8yg7gtyjOiCSdgRk7DXFUH+yILt87lgLe3bD0c=;
        b=lg7h6y/5CyBi81KA6I9748D4+jU8+buxpi9Gd+0ySi4igckphAmr6SHJELE8iabBpV
         aVaDc+SknneCVIy68TAAz4YTMGq7Zotd9ZgIR2MfJl665Bo8FUFo8yrZXVLrUNMiod0v
         Ek0JM+wIfgoG4h2D0jidgM8NwnEOVxXMm+VsaaeDLb5RQBq9CO0U0GDh+zFSkK0R7/32
         1zD6nf3ALlHYrhnBm7bs5+9gId2eFnfz0gS2/6XbFvC+P16lMO7IyykHY/RpGo71kH/d
         58/2IYJwXuqMSwC03PfmVDTZveRcrshcL0YrmD+l5qou9Ye6DXwuJ5K9acWJoHr6L2hZ
         J1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759907925; x=1760512725;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ghmY8yg7gtyjOiCSdgRk7DXFUH+yILt87lgLe3bD0c=;
        b=d8O5uqjtA7G8N+8HnXaQjt2V1/GxemLYcTZeqbw9lC1/ea9XVtrFb7/EMij0n6YKzZ
         hqMQpY3Gj3NyVwUWBQTjKh36kGCQjRrYhcAOx1zfJbMfaa0J6CCDXkuX35l3zGErRFyt
         8nSsHXT46vhIuIr/SQL00ZRWzId5PzTO1RKqqMhuMSUfdyVbILmiQ2x6RfbKP1TNl0Aj
         B2VflOLpT/OKgBadVqEFJDwUxBNBjqXoIaperqKvF4eSbOJUpGBK+Ltdi636itLunjbm
         OQOKJucDABCVEK/97phkGv8Y2VjDWdV3JVXcF/FP9Z52OORM5lDqsIx/X9mj9nRfDp/V
         OIxg==
X-Forwarded-Encrypted: i=1; AJvYcCVOCHcwiMNHY8E8jOyctgltq0jEuhUIw5NUv9OyEVG4J5+XNr62Stm/Vm+MEf/my3kFNleoqntMUPQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzqZqPI01Fz/I7bPpKrRwpphbFfFiC49c1+untOhxaToki7dw3
	sA/+3KYh+9uZt9YAdzTkSA1yC//ZWny8c5NwrCmgzj+iRDI/Z7cX4qBM
X-Gm-Gg: ASbGnctE6EjvnS+m1HzoC9o00vMGildt1f2X4QlrzFkmuq7yWLUplSYaPnxV6hBsGTF
	zECzP2Tug/6f0uLwTKs1XGjAW84w3PPyIUjjfmc6NE6Fq3ekp8CqWhMqD/5TDl1e9DtGbGTObhM
	0NX6zydb5zS0bGG+Z+v9OwDPAF7qPT9CEUjwtQr9ANykPgGpEXism1BgtTXVjrsvA5RDTWp09eC
	rn9V//aifazv8JlFzITLNRnJRKUL2XjgolFwhVbU7cjzixnTerH5SNb9fBIWUhUgqEhkEBbAKoz
	JcMuR4wCy3Y2ukI5oSoNxQwRnMpYmrGHi/98o1opuAp9n9HzsqPAMMvEnSePL/umnk1Q0yV6dIB
	mEv8C0yXyvQmHPBWgn6GgIKvRfWqpXvWtpVpk93Sh5vlBIQhr+w/MO/kKMl9yV5c0qFuRpXSAOo
	FQH9jaZTX+NBQNnzLfnyxHj5QlQc8=
X-Google-Smtp-Source: AGHT+IHCLPb+KjkvsAp8GpJuDUgYHk16LWJQdsYnqK7NFGVJeNU7BzkaY3GLTIDEfpFV7flyXbjNXg==
X-Received: by 2002:a05:6402:2787:b0:639:e04d:b0f5 with SMTP id 4fb4d7f45d1cf-639e04db6f1mr785711a12.3.1759907924702;
        Wed, 08 Oct 2025 00:18:44 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------00Pi0ApkPu5bzC8WeIVLmkmS"
Message-ID: <ba076761-ce50-415c-a66c-9271b246943a@gmail.com>
Date: Wed, 8 Oct 2025 09:18:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] cirrus-ci: add json-c for libxl dependency
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251007161333.89190-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251007161333.89190-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------00Pi0ApkPu5bzC8WeIVLmkmS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/7/25 6:13 PM, Roger Pau Monne wrote:
> Add json-c package for libxl usage.  At the same time drop YAJL.
>
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
> Would be nice to have for 4.21, so that we test with json-c instead of
> YAJL.  I plan to switch the FreeBSD Xen port use json-c for 4.21.

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> All seems fine:
>
> https://cirrus-ci.com/build/5366905441091584
> ---
>   .cirrus.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 7df7ff552222..0de1012d8c60 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -50,7 +50,7 @@ task:
>   
>     install_script: pkg install -y seabios gmake ninja bash
>                                    pkgconf bison perl5
> -                                 yajl lzo2 pixman argp-standalone
> +                                 json-c lzo2 pixman argp-standalone
>                                    libxml2 glib git python3 libinotify
>   
>     configure_script:
--------------00Pi0ApkPu5bzC8WeIVLmkmS
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
    <div class="moz-cite-prefix">On 10/7/25 6:13 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251007161333.89190-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Add json-c package for libxl usage.  At the same time drop YAJL.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
Would be nice to have for 4.21, so that we test with json-c instead of
YAJL.  I plan to switch the FreeBSD Xen port use json-c for 4.21.</pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251007161333.89190-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">

All seems fine:

<a class="moz-txt-link-freetext" href="https://cirrus-ci.com/build/5366905441091584">https://cirrus-ci.com/build/5366905441091584</a>
---
 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 7df7ff552222..0de1012d8c60 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -50,7 +50,7 @@ task:
 
   install_script: pkg install -y seabios gmake ninja bash
                                  pkgconf bison perl5
-                                 yajl lzo2 pixman argp-standalone
+                                 json-c lzo2 pixman argp-standalone
                                  libxml2 glib git python3 libinotify
 
   configure_script:
</pre>
    </blockquote>
  </body>
</html>

--------------00Pi0ApkPu5bzC8WeIVLmkmS--

