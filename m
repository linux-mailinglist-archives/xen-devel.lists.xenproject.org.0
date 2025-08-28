Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66063B39F23
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:38:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098856.1452805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcpG-00062g-7V; Thu, 28 Aug 2025 13:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098856.1452805; Thu, 28 Aug 2025 13:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcpG-00060S-4j; Thu, 28 Aug 2025 13:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1098856;
 Thu, 28 Aug 2025 13:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q4L6=3I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1urcpE-00060M-Av
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:38:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35ed0508-8414-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 15:37:58 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7ace3baso162748866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 06:37:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe87c2a0cesm837980766b.2.2025.08.28.06.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 06:37:57 -0700 (PDT)
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
X-Inumbo-ID: 35ed0508-8414-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756388278; x=1756993078; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2k7yaop0MLfoyLNOezkX+kI4vdKHL8dcVdO3goHqPM=;
        b=FkwnEgyqDN/5Gliado+w/0P9LhQb0zklESu9tJxk2ILtdUTa0hfgnxVWfPiCAZGs1l
         2Dy8YJ29ufGcwPRgfXj9yTFFE8u/TxVCOOYwRdEvPFEVoHiUpLeQUpFxWbxcG8I78skF
         rGOST+G1J2nn/hm9/fq993tNVSz8JPkC1F/nKoI/eAGs+9lGrTxCWL4Ke7VRGi+wAPoL
         hZ8W9dXqQDjGZnW4Uc/JnS7Ic665jjImx3195wdnk5x/A9MkGYUEjwU32Rg6K+Lp/fZp
         eIGRkI/9HMq6piA6M3K7cVauWVVgY+JqLSY/gyQYSi17yN3FTrEgDon0YoL4mTEooopR
         DyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756388278; x=1756993078;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G2k7yaop0MLfoyLNOezkX+kI4vdKHL8dcVdO3goHqPM=;
        b=ZI+Ggn/Ac2D2XHS8/n69frHHUFw7n6UxgJzHFEEBwqYc3dprI/FfffvowL3N7sgWsI
         goCTHXPJnm6LnJ79L07mVzUSrTruRzWWFW25CWT9Nm9T7w7lWHcAdzWgthc/OOxfnMFr
         H+UGL9Nc/VJ1XzQfx9jJkBdzYsrgwFX1LibdavTUUvdvhj3PTdP5LBX2ywdUnZK9nz/f
         wfOUiBwhGUkEzP07Bk9ZI0xoEvIBRHnxkpBJziWi5B8+/BKoRnp6ojLLkFX1rirPkcRb
         IazAyeEeO5kwYCoZpo3Sqc6xMI+FzTGFnbBm0iod4DRUjvRT9bNNi4wCbgMLTPURxD/M
         sPiw==
X-Forwarded-Encrypted: i=1; AJvYcCWuzRMGFy3f21ocYpq2s6z8umwCJ0V6FaJjpti1WJwyAXEB3GW6kf4ANh7qBMj5ebLu1fPHV1m/S08=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWKR3NEy1P14pkhMlZWBIWSpqyY+dlWBzxVSMkgR//nhC37Cnp
	wJhc1iWKzBa21J/35mxD+wcBLSQqK4XYFiPzHKD1QsXxlKIzYP7CnfHY
X-Gm-Gg: ASbGnctRHB5oQbac8HrPvaqBWgCV5PNvJ1WMfS3qBsWyb352Sb0wOtdbTUacznhM5WN
	eXU0VUsDG81cnihc6Ibc//u8tn4wzwhtEqn5l26qbp4az38csZ8PlwrIteCrCi6F1rVcIBWecep
	SD++hy9Jp8+Vzkxc+BXtmKhovc6GgrZ1TaqXanx/Eh5PTVJU7d5mCYa9eXM5SZmAqcKR0AjaCkx
	rrc8BCDY1StYEuzJqEM2C90uAJrYHWzH21W7lrsoZ21KQAzgU5Bz7mBjKfmvGrldKM/j9nRhMZp
	vJMAsJo4NITn7AShs1hom0MowZyEYLuoGfR99yEEn3QKL+0bi9YKelPQRlxtm4bNTjdA/2G7dNU
	9lBZih6iGQAhKKzSQ9Ih4cbC3HtMYOaQsgduRrnuKjdvLyQiPPy8a636baufryEbs31L4tdPNw4
	qSSZdWIQ==
X-Google-Smtp-Source: AGHT+IGgnoajMfFBJTc0JX76+b/JYKRVyIdC+RZin33f1jVYVKReD0y76V9yqDJZhKWsY2gWRwlXyg==
X-Received: by 2002:a17:907:d88:b0:ae6:c154:8059 with SMTP id a640c23a62f3a-afe294dfe9emr2246251166b.37.1756388277882;
        Thu, 28 Aug 2025 06:37:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Gzdbc9YdzMmQLtURME1Zr1r0"
Message-ID: <bce5e07c-eee7-481b-a833-4d5d8bbce78f@gmail.com>
Date: Thu, 28 Aug 2025 15:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] CHANGELOG.md: add mention of GICv3.1 eSPI
 support
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <9dc68c29751aeacf37b51d3bd345e87e9a0f0ccf.1756216943.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <9dc68c29751aeacf37b51d3bd345e87e9a0f0ccf.1756216943.git.leonid_komarianskyi@epam.com>

This is a multi-part message in MIME format.
--------------Gzdbc9YdzMmQLtURME1Zr1r0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/26/25 4:05 PM, Leonid Komarianskyi wrote:
> The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
> already supported with CONFIG_GICV3_ESPI enabled, so this feature should
> be mentioned in CHANGELOG.md.
>
> Signed-off-by: Leonid Komarianskyi<leonid_komarianskyi@epam.com>
>
> ---
> Changes in V3:
> - introduced this patch
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5f31ca08fe..dc34d29d99 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -29,6 +29,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>    - On Arm:
>       - Ability to enable stack protector
> +    - GICv3.1 eSPI support

For clarity, I think it would be helpful to add a brief explanation of what eSPI is
(as you did in the commit message) and also mention “for Xen and guest domains” or
something similar.

With that:
  Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


>   
>   ### Removed
>    - On x86:
--------------Gzdbc9YdzMmQLtURME1Zr1r0
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
    <div class="moz-cite-prefix">On 8/26/25 4:05 PM, Leonid Komarianskyi
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:9dc68c29751aeacf37b51d3bd345e87e9a0f0ccf.1756216943.git.leonid_komarianskyi@epam.com">
      <pre wrap="" class="moz-quote-pre">The GICv3.1 eSPI (Extended Shared Peripheral Interrupts) range is
already supported with CONFIG_GICV3_ESPI enabled, so this feature should
be mentioned in CHANGELOG.md.

Signed-off-by: Leonid Komarianskyi <a class="moz-txt-link-rfc2396E" href="mailto:leonid_komarianskyi@epam.com">&lt;leonid_komarianskyi@epam.com&gt;</a>

---
Changes in V3:
- introduced this patch
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5f31ca08fe..dc34d29d99 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -29,6 +29,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 
  - On Arm:
     - Ability to enable stack protector
+    - GICv3.1 eSPI support</pre>
    </blockquote>
    <pre>For clarity, I think it would be helpful to add a brief explanation of what eSPI is
(as you did in the commit message) and also mention “for Xen and guest domains” or
something similar.

With that:
 Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:9dc68c29751aeacf37b51d3bd345e87e9a0f0ccf.1756216943.git.leonid_komarianskyi@epam.com">
      <pre wrap="" class="moz-quote-pre">
 
 ### Removed
  - On x86:
</pre>
    </blockquote>
  </body>
</html>

--------------Gzdbc9YdzMmQLtURME1Zr1r0--

