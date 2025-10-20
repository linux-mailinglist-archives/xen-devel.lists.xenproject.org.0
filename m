Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B656ABF23C3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146494.1478920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsEX-0002oH-Qr; Mon, 20 Oct 2025 15:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146494.1478920; Mon, 20 Oct 2025 15:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsEX-0002m4-My; Mon, 20 Oct 2025 15:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1146494;
 Mon, 20 Oct 2025 15:55:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsEV-0002lN-IQ
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:55:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38e12041-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:55:38 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso1014546166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:55:38 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7e984f2sm816258366b.13.2025.10.20.08.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 08:55:37 -0700 (PDT)
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
X-Inumbo-ID: 38e12041-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975738; x=1761580538; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThQETuoXn7cxOD/oIVKc+9fzFoNw5UcTeMPEgY2rLAk=;
        b=NsBPbUa/xCiuX0ath4MqrAf8sGqc/Tga4wDMsSzZ8v0bqDjiIOAjvhoR1ubpmHbhUZ
         cyrOuGXPMCgteUPfdj+g8LsDgoF46nRGuw8lOnfxaEeRE/m4rMMyVdq+xv2jxfrxxFMH
         3ll65TWFHvZNWoqAOEXsJ8NzqsNMYbjPTVNsFvE8yTUn3eiSiRoYdlZb/+vhJsAh1pRg
         esY5tjuX7Fqf1+4HJBtBi8YzbCN4zyv69w+SAkYzM/x8++8vyozMkLIrJHNX01Nwrc51
         zAKM1aiWFIxiO+QlmDy5wAbmSJb6MNzTgQLWwSkt1e/kMqQVhFyBQIhc8CQTkQysBO0x
         COTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975738; x=1761580538;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ThQETuoXn7cxOD/oIVKc+9fzFoNw5UcTeMPEgY2rLAk=;
        b=CtESQpk61rh3Noyin7ELUFVC7wFvVGWt/A1jHpw2BmGnpE4QQtJ7KYUh0C8lQcku2d
         +yBlD2pe4G946aUJlNMDbP7cTRPTN5dA/0H+dFwwSze7Su+S3xv/TocRiDZOjGziM0iA
         2a36dY6Dzy5nlSAPqkNAU9f0mPjYLr1rb7a458+TT5UxLEpnEw4dCwY5cX/Z/3zWFuoS
         vWsiILOlyLDOAG1RVQvt2vDmH5M30cgjxRZ0V6eepztJKeKIl/eItZPoDYDL9FdYKxbf
         WGcniNCuX9+EC30RyRR3aWoOWYFfU2462XVOKbpk30n0jzCLI2WaZzxHWbIEpay2HCkj
         TrEw==
X-Forwarded-Encrypted: i=1; AJvYcCVyIvpbxBC/e3hayl1FqHxuG6LrFGJQ0/atkgLxcm14UNDMN2IQIQsQgVPhhYF/w1g27bZVUgaA6sE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjeaP0FVnVoGajqHR8hwMoPHOYr7Oer8AjFX5RiOXxThs/OVeK
	2Xtio2NJzvQRxlfpmtwqf/m/K+89iFY5QuP8xXwOSSm6ZCIUCcdr+KN9
X-Gm-Gg: ASbGncvudTbZFbXmJDqHY/4uVTsm+8huzXFcjtyBbgh9gBij665CnlzMdRxw9015ckE
	WykLFZXfDlcjom/pWMh9FLryh7ts6IcX6U8qPqDSrv9UpJ6GBBopnTkHutIxQllTjygHWQaO0Mg
	pKj94OxpP6SvOSrLi0bOOdGpJnJJ1nj/3t+156+TZ4W5OPMrrRM6mJngYyfgwMO9xEwbwcOTVON
	ph8afEWLCBzwgNAoFFms6Vkm8PO2Sx3otCZYM+QS+dR1C3josvI1EHAa3FMUCM9TJ/MuBriuzsd
	sev7gJ+VTYGWx1ycuaEWAjhFVYyuZXQIt81Wk0TxWz0mmLjE7wkrGkXkQwKn59eKO9x5od83ZnK
	31PI0yhuCynuzN7l/UzceMxUIrLMJIBIzDA71kxTrRK+akJfE6nFTtUfNnH1QKezWc3W7FHtpra
	MuA3wfKee34TUjV55rpQfPFfgfBtYA3+Q5OnobFhNN8arvZtb3s37oYov2
X-Google-Smtp-Source: AGHT+IFW9XxPOP3LRHdZ5MORxM+TJExE/hRhts+OxFK5mVAnJiRT4kZFS/lCBBBThYpVX5GtOBIH6Q==
X-Received: by 2002:a17:907:7f17:b0:b3c:31c2:b57d with SMTP id a640c23a62f3a-b64742428b8mr1838138566b.55.1760975737575;
        Mon, 20 Oct 2025 08:55:37 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------b6en5kAIvZ0ooMLpiqXcSV3h"
Message-ID: <686e3e17-d1c2-40a7-b363-c1cc42b388d0@gmail.com>
Date: Mon, 20 Oct 2025 17:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/xl: fix for dead code in
 list_domains_details()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20251020121959.54337-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251020121959.54337-1-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------b6en5kAIvZ0ooMLpiqXcSV3h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/20/25 2:19 PM, Roger Pau Monne wrote:
> Commit d0193c6d6716 introduced checking for the return value of
> printf_info_one_json(), but failed to remove a further check down, which
> now Coverity complains is dead code.
>
> The correct fix is to make the call to json_object_array_add() conditional
> on printf_info_one_json() having been successful, so that the further call
> to libxl_domain_config_dispose() is not avoided.
>
> CID: 1667251
> Fixes: d0193c6d6716 ("tools/xl: check return value of printf_info_one_json() in list_domains_details()")
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
> As with previous fixes, needs to be considered for 4.21.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   tools/xl/xl_info.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index dbb682cc52a6..98fc879e636c 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -584,9 +584,8 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
>   #ifdef HAVE_LIBJSONC
>               json_object *jso_value;
>               rc = printf_info_one_json(&jso_value, info[i].domid, &d_config);
> -            if (rc)
> -                goto out;
> -            json_object_array_add(jso, jso_value);
> +            if (!rc)
> +                json_object_array_add(jso, jso_value);
>   #elif defined(HAVE_LIBYAJL)
>               s = printf_info_one_json(hand, info[i].domid, &d_config);
>   #endif
--------------b6en5kAIvZ0ooMLpiqXcSV3h
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
    <div class="moz-cite-prefix">On 10/20/25 2:19 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251020121959.54337-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Commit d0193c6d6716 introduced checking for the return value of
printf_info_one_json(), but failed to remove a further check down, which
now Coverity complains is dead code.

The correct fix is to make the call to json_object_array_add() conditional
on printf_info_one_json() having been successful, so that the further call
to libxl_domain_config_dispose() is not avoided.

CID: 1667251
Fixes: d0193c6d6716 ("tools/xl: check return value of printf_info_one_json() in list_domains_details()")
Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
As with previous fixes, needs to be considered for 4.21.</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251020121959.54337-1-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 tools/xl/xl_info.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index dbb682cc52a6..98fc879e636c 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -584,9 +584,8 @@ static void list_domains_details(const libxl_dominfo *info, int nb_domain)
 #ifdef HAVE_LIBJSONC
             json_object *jso_value;
             rc = printf_info_one_json(&amp;jso_value, info[i].domid, &amp;d_config);
-            if (rc)
-                goto out;
-            json_object_array_add(jso, jso_value);
+            if (!rc)
+                json_object_array_add(jso, jso_value);
 #elif defined(HAVE_LIBYAJL)
             s = printf_info_one_json(hand, info[i].domid, &amp;d_config);
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------b6en5kAIvZ0ooMLpiqXcSV3h--

