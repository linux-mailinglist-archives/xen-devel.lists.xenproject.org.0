Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB61BC541C
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 15:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139683.1474942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UVI-0001uA-Sf; Wed, 08 Oct 2025 13:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139683.1474942; Wed, 08 Oct 2025 13:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UVI-0001rl-PI; Wed, 08 Oct 2025 13:46:52 +0000
Received: by outflank-mailman (input) for mailman id 1139683;
 Wed, 08 Oct 2025 13:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZBS=4R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v6UVH-0001rd-Dw
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 13:46:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dbb3b86-a44d-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 15:46:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b3b3a6f4dd4so1375711366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 06:46:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4869b4e27dsm1649841566b.70.2025.10.08.06.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 06:46:49 -0700 (PDT)
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
X-Inumbo-ID: 3dbb3b86-a44d-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759931210; x=1760536010; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FJ8MmXM27Bgok/hxZ+tkRwn49Ne/D9ZzJMRWAyiP+8=;
        b=XY7f9sgnYHD+h/S2cR/a1YF5SjaKWEB15wQD6Not19DAMbr5VLq737HW7nVFEfV1Lz
         DU5QgnotESfbv2aO19q/8tg3yAOqddqBsJ9Za0mgNfTD63zkq97aNbu6o8gmq4u/T36t
         +pyfGQzcmJC/cYJpfMdNC7aSHCZBdzBLMthQU/rkjHaUmaAmKGuU9s4ARVRThEV0SmyB
         Eu42k5nJrLEqtsVHC0N9s8mLwpJZfyxwtZ+JVeJFeHfmEC4u70anvgoPEQRYBso9eXT2
         8V/FIeKmu68nZDfGBT8ka/+Thr4qZB6B37GLCwZswuuR9NLAq61K87nmBHJKFcErKfwl
         98ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759931210; x=1760536010;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0FJ8MmXM27Bgok/hxZ+tkRwn49Ne/D9ZzJMRWAyiP+8=;
        b=ezhqXQWv25r5oSDcn669AILvyJYosd9vQNba7zwxiwh6+fKtg3qrL/q9oXFbRpEPLk
         pLGDaARTNGgab6j3nfJCakHjUC2P7Qr9TPUC65N8QTKylnEFkRV2+vRKoB3UUb0miNiz
         wIrVZocc7a8rY5LhcEZVloq6sg4/1bRRV+KOV4YNZ0XeWxrarOlMFiM3/RCSQxHL6Ntd
         fMrbGvqdFs7kDUkQdsq0KanejMpZbJ5KT/+wtQYB6hP4LKlUjPRwMGq37m3fk/cd3g+D
         Z42eIsYM8l3l998P+UoTWbwuVcQLLNeeajt/z76b6pqrWxWUEraLv4Y12fZocQrDrWjS
         fThw==
X-Forwarded-Encrypted: i=1; AJvYcCVcl3QftcPYWK+DLgQv2UAKM2iJLvY3UbsJFzEPhUsJT3k7mGqqLIIDiIeqFAzAOLMgXDTsYcCjyww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB9euEv6GjUpoq4xfDGVI/nzi63hoOlIWAyAeSN4ae6b2LmGL3
	opt0sUnosZI7vm87/zTSoK+UBdXcGPdAIM+EgS2XJA34W5rjQ6fbxI10
X-Gm-Gg: ASbGncug/J+QqMhTXfwqXBiAjUII8fPFoHjnWqqhoQtolGP/rKeII6eXUuO1zxX6pWe
	zT01lcnDZogbKolx9urboLPpv6VGxdqHKZE0VamMHAp9idfBKSY2CWsjkrMkRcU3eiTMuODELnO
	/mBCFWxeuMFiqJML38S0XTb2ykulyqqFTWcfTX2kDE2aUrcDwnMSoSjVmxqdJyR+5VA20hEre/l
	TpobwM4SfidgbeuBi5y63Ua4QMVCBH/9YSzPlgOLVx1mvtqD79ZB/49DiFSJI2AozQGgF3Eygje
	RdAR8EM5j1Vsnr/QSXApPdxf+lGfvkqwZyJvGQDbcH7cPASb3jB0+k32tLy6qf7/GvTMvoLei+R
	SRsZxHWdxXviYJzvhXLZbgdu5EehTSAEFokzhJgGElglUlWVqseAOQa+0+ZnZDUEjCS0eVEMlYv
	ZYiW/kEuQYlSveDtdprFqoQdy9OBQ=
X-Google-Smtp-Source: AGHT+IEOlOlp655AmDa5pVoM+o81Ckpq8Xzdk3nBriT/pxJswTH7fW6TmSG3fKdK+rT2LcqClR+nHg==
X-Received: by 2002:a17:907:9720:b0:b3e:b226:5bba with SMTP id a640c23a62f3a-b50aaa9c3f5mr364106366b.15.1759931209528;
        Wed, 08 Oct 2025 06:46:49 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------k84pq0GkXuh8o2w1NEl0PIp0"
Message-ID: <170f9a4a-49ca-4402-a63c-e6aea0fb106b@gmail.com>
Date: Wed, 8 Oct 2025 15:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/tests: don't pass -E to sed
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>

This is a multi-part message in MIME format.
--------------k84pq0GkXuh8o2w1NEl0PIp0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/8/25 11:47 AM, Jan Beulich wrote:
> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
> doesn't name -E as a standard option; only Issue 8 [2] does. As there's
> nothing "extended" about the expression used, simply drop the -E.
>
> [1]https://pubs.opengroup.org/onlinepubs/9699919799/
> [2]https://pubs.opengroup.org/onlinepubs/9799919799/
>
> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>

LGTM:
   Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
   Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> In principle the -e could be dropped too, for being redundant.
>
> Hitting the problem with an older sed pointed out another problem here as
> well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
> of make was (obviously) deemed up-to-date, thus causing the build to fail
> again (until the bad file was actually removed).
>
> --- a/tools/tests/pdx/Makefile
> +++ b/tools/tests/pdx/Makefile
> @@ -35,7 +35,7 @@ uninstall:
>   	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
>   
>   pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
> -	sed -E -e '/^#[[:space:]]*include/d' <$< >$@
> +	sed -e '/^#[[:space:]]*include/d' <$< >$@
>   
>   CFLAGS += -D__XEN_TOOLS__
>   CFLAGS += $(APPEND_CFLAGS)
--------------k84pq0GkXuh8o2w1NEl0PIp0
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
    <div class="moz-cite-prefix">On 10/8/25 11:47 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com">
      <pre wrap="" class="moz-quote-pre">Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
doesn't name -E as a standard option; only Issue 8 [2] does. As there's
nothing "extended" about the expression used, simply drop the -E.

[1] <a class="moz-txt-link-freetext" href="https://pubs.opengroup.org/onlinepubs/9699919799/">https://pubs.opengroup.org/onlinepubs/9699919799/</a>
[2] <a class="moz-txt-link-freetext" href="https://pubs.opengroup.org/onlinepubs/9799919799/">https://pubs.opengroup.org/onlinepubs/9799919799/</a>

Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>LGTM:
  Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
  Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com">
      <pre wrap="" class="moz-quote-pre">
---
In principle the -e could be dropped too, for being redundant.

Hitting the problem with an older sed pointed out another problem here as
well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
of make was (obviously) deemed up-to-date, thus causing the build to fail
again (until the bad file was actually removed).

--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -35,7 +35,7 @@ uninstall:
 	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
 
 pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
-	sed -E -e '/^#[[:space:]]*include/d' &lt;$&lt; &gt;$@
+	sed -e '/^#[[:space:]]*include/d' &lt;$&lt; &gt;$@
 
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(APPEND_CFLAGS)
</pre>
    </blockquote>
  </body>
</html>

--------------k84pq0GkXuh8o2w1NEl0PIp0--

