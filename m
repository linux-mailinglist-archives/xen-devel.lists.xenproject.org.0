Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D0BF23CC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146511.1478930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsFH-0003fl-2j; Mon, 20 Oct 2025 15:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146511.1478930; Mon, 20 Oct 2025 15:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsFG-0003dn-VX; Mon, 20 Oct 2025 15:56:26 +0000
Received: by outflank-mailman (input) for mailman id 1146511;
 Mon, 20 Oct 2025 15:56:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Li3P=45=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vAsFF-0002lN-Vu
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:56:25 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d6ab8b-adcd-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 17:56:25 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so575554966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:56:25 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb725f3fsm822375366b.68.2025.10.20.08.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 08:56:24 -0700 (PDT)
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
X-Inumbo-ID: 54d6ab8b-adcd-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975785; x=1761580585; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/QUp5p47LDDd9qx96BTBl6dTboIUsi/SViHEUGHmlU=;
        b=cCe/NWp16CCm1zD6tmDjjpa8xh9CkeVARdlEDQgNY174dtC7qVmOzpJOnvi4YaA4mR
         JBGUEgNn+NFG7OvCEO8NOMtuGAvFCVf2aQzZk2N/Z/ayOVeIlnNZv1Pqw3UWpHPCjFSk
         EcOU/l7I8kueEnDrZMt3g/WLs5s/W7Ra3ke8Yn2KTMCtVWn4HvWG4pVYn1VsgRs8b+GA
         qF3H+v76RvhSe3YnbRmV8JTgTMQnfX6IbrmFF/j/CXAfnqK09agPG0uzAPnt5u0NiZ5S
         8xAjSCkUaNs8pdZNjdVRiQRkXIK9VpYdSrM7fKPQ9dyHnK+kZPu1xl3n/MoKnSTc9HLM
         auKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975785; x=1761580585;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/QUp5p47LDDd9qx96BTBl6dTboIUsi/SViHEUGHmlU=;
        b=e/zdnwAvEJ3iNzpZjpk2jQHxdQ79sSM5scxpaihkE9e7dXAXNSU6vMGwYOznyD2cnY
         3B5b35VE2EAh0lFS000s7WRjo609KuqsxBQt8mdB9gUvYEH2kS2cIZf1wJQ10yiUfhfd
         f4u2JwBsePb5fD/5Wamv6UEFzfJ37us6vsEI/FxGMr03OGuodln3WZKYW8CCOeuevaN9
         c+A2LS1YtAc9J6XJh2JXpp6cVvE3tnrbz18Z8+SAR2+aDqXDc7z/Z5QWfTk+cMxMC1Ec
         OUrBuxGqdHfYwZA2xiJ4CtXuE7Rti1ar3HcJbMmrhUcrc1DpU69b/lggmESB3qMgP3Vz
         DslQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQoUqhY9SpmzoCDTKmm2LvIiYHfPgZW/Ke7S2UrUkQp/NByLyLOWIpgag5yVJZlJbt4p4b7ViMVLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXsWPNMJ+30pR2FQ5wPAMeZyTwSOoyPMVITKyvjNS7vrqPhhoM
	sJh4pxGdqlA93LpNog5YSfTAWJ/tWEhpSKD4ZL9QTnrzZbxzbB7Tqk3y
X-Gm-Gg: ASbGncv2EyVAdlQhMLYMoyW19CxZkX5NAwMSjKhg3mBz1Ou1IA9j6CO8I3w3wJjFPxU
	MeX1EqxsQftFi2lXnDlcebmbbGIoMnflQnXoi0SnsQJ8p6TkYz4q3gFGGJ7GmDU7Hhs5QZiX7l1
	buGJs8fSJJ/9MbzrADFXx3qJDfc0A5X8pE7tVjhoq7YNcIyHSvnFi+euYOORtddRt6iEX7WAX4B
	FTktJuSLcMohJ29MfY3wQfwYEQ3JNzW3ZyHkyl/cyozgwv0sBrKTODDYuEhV/ATVyKYEqZZ8IIu
	MLgmRVdBHtCB7yNvI9l7g4eAdYaymIxqMYTSBSbMXPHD8x7cvQw49eUdK4veqTRULPCjildX7z7
	MGwK7rtkGQ6VGiZYuDzhPHMlSvLd9s+URqU9Z7J0MNCJcWE1dcYQhndOWpXXYVWz+CuwuN6sj+6
	Pk8B48PMTcpxxSt8PZzO+qydS/eRQj1FRG8f8CVnb/GRps7Rn4EhUyPORFFCW5iQUihHY=
X-Google-Smtp-Source: AGHT+IFz4sH4WCAOKJiUXdLRLVEuOnDhhnUQhj8E3LyU2gv896qyq8WQJ08Wi7OTO/T2SbtyjmLM0w==
X-Received: by 2002:a17:907:6d02:b0:b40:fba8:4491 with SMTP id a640c23a62f3a-b647463a1d1mr1527340366b.17.1760975784352;
        Mon, 20 Oct 2025 08:56:24 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Ul3Vo0XrvlJLDHaGWJkS6c2X"
Message-ID: <3f98f469-7da1-4356-916c-a4523f887001@gmail.com>
Date: Mon, 20 Oct 2025 17:56:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21?] xl: drop redundant return value check from
 list_domains_details()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <13d8a3ff-ed58-4b35-ae3c-0411cd34f7b8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <13d8a3ff-ed58-4b35-ae3c-0411cd34f7b8@suse.com>

This is a multi-part message in MIME format.
--------------Ul3Vo0XrvlJLDHaGWJkS6c2X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/20/25 1:33 PM, Jan Beulich wrote:
> The check that was added to address a Coverity report renderned another,
> later check dead, which Coverity again complains about.
>
> Fixes: d0193c6d6716 ("tools/xl: check return value of printf_info_one_json() in list_domains_details()")
> Coverity ID: 1667251
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -593,10 +593,7 @@ static void list_domains_details(const l
>           } else
>               printf_info_sexp(info[i].domid, &d_config, stdout);
>           libxl_domain_config_dispose(&d_config);
> -#ifdef HAVE_LIBJSONC
> -        if (rc)
> -            goto out;
> -#elif defined(HAVE_LIBYAJL)
> +#ifdef HAVE_LIBYAJL
>           if (s != yajl_gen_status_ok)
>               goto out;
>   #endif
--------------Ul3Vo0XrvlJLDHaGWJkS6c2X
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
    <div class="moz-cite-prefix">On 10/20/25 1:33 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:13d8a3ff-ed58-4b35-ae3c-0411cd34f7b8@suse.com">
      <pre wrap="" class="moz-quote-pre">The check that was added to address a Coverity report renderned another,
later check dead, which Coverity again complains about.

Fixes: d0193c6d6716 ("tools/xl: check return value of printf_info_one_json() in list_domains_details()")
Coverity ID: 1667251
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:13d8a3ff-ed58-4b35-ae3c-0411cd34f7b8@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -593,10 +593,7 @@ static void list_domains_details(const l
         } else
             printf_info_sexp(info[i].domid, &amp;d_config, stdout);
         libxl_domain_config_dispose(&amp;d_config);
-#ifdef HAVE_LIBJSONC
-        if (rc)
-            goto out;
-#elif defined(HAVE_LIBYAJL)
+#ifdef HAVE_LIBYAJL
         if (s != yajl_gen_status_ok)
             goto out;
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------Ul3Vo0XrvlJLDHaGWJkS6c2X--

