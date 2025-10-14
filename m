Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D2BBD9C5C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 15:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142835.1476755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8fEp-0003dz-Jf; Tue, 14 Oct 2025 13:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142835.1476755; Tue, 14 Oct 2025 13:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8fEp-0003cE-G0; Tue, 14 Oct 2025 13:38:51 +0000
Received: by outflank-mailman (input) for mailman id 1142835;
 Tue, 14 Oct 2025 13:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QInk=4X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v8fEo-0003c8-5d
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 13:38:50 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cb34959-a903-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 15:38:48 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-634a3327ff7so10948870a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Oct 2025 06:38:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c132567sm11038727a12.33.2025.10.14.06.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 06:38:46 -0700 (PDT)
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
X-Inumbo-ID: 1cb34959-a903-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760449127; x=1761053927; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y0jS3fOipAk7jYytXFj1ZncUIo2WEpv5Or+XP4+Mjk=;
        b=kyjJAlRhfHhCzi2WwsKoZ1Qe8O9xMIjMBjOGKE/o0aObqf728hhuPvIU+BTWJY/67/
         cHaAx3xqPkV9etG+ZGJEmimW4+GyEZ2VwwDMW4DzUbYY0TWBQjkx2dV8+uXAkNgT5HXY
         2dtDOZtuc8PSyVLtkuU5II+YreXCQKJV3B9Mzh0pe+QL7fkrXQx6J+HRST2np4BP+bie
         WDwKDprMZcxiZZEg+cor9HB3wO5Ln+qgW6paUhrO2+KtglsRiJoj4JL7KLTI9PFl3cQk
         65PxDqC0FGva8/L3eNl5wgvW0L6MzMt4jj28ZFVphxAC9GLlvrAon/UbUhqtiyd0C1Ri
         R2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449127; x=1761053927;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Y0jS3fOipAk7jYytXFj1ZncUIo2WEpv5Or+XP4+Mjk=;
        b=fNGSb/aBhwXLdBTGVZq5Rc+pYboHA8XvP+/xKt0MofRjOYd0ujhM+ZGdfPb+3Bu8Gq
         TFFeUHipg3deACSA6OIQtQuPqtJJNfFTTFbom4qasiUqyMjwCrMcyUTaxeWVucrd1pta
         hUz3Pf3DauOSZ8L86rd9pK/1cVa0fwLStFGyId/4GSD2LOhdOZi4ZhCsxlUxm1hHxsgl
         TkD1dSS0Yxk68Fj+UmI5M4wYfX8N1nG/+01afw4ezE6zAL7G2b+RNKViSk/q582i3C7d
         zAqHU+oPHJfDWLVZz/4eGxjAgJ4Nip/b3E3HOSh5Yj3TMkGrQgwSUqJV0bT8EhiJlvQz
         oUGg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZZ/uIw/fPtpJWcwcMIsf8L7na+l63kAk8I2uCkzWHIXmdTx4+HzVyRypwCqVM/XsDQr2ZFggPAI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLxxb4811El9bLwqwLoH8eyBUzmSlB+cC4jblFkL12fCSD5qEL
	D2EMoHwwMytSiKzJHYfacJGhF0F3VRgiqQB3/Ns5B8GnF4f6ZARbjEHI
X-Gm-Gg: ASbGncsxZ2T4dD028dT9ns0qvvygfz+SCzH33HNaWNy2ctVVFdi8zMUkKuxpYUeGBVq
	6zIHQO3wh+3UBzxbc9TnC0v+ySmMqWKBQu6PsMUhvpRpavOdPufS3GuqT5MAcVuiij06FeYr645
	5AwrEtGoLsLbJSCXSxplWVFZ9SvMMg8cNqLfCx+7xQoQ4PwW3KPrkrfOZ4OE0LLOFxZqjXoJNkG
	kGg2t1G8voLRBRCuxe5Zv1AcoUjRLASmJ6IsYOXT6pKjDWEjNUFoDO1hblZ9tu4Ndf8UZFh2mYS
	TbiegR549qvP8vIDEu/EiOZyTw/m1c2HK5eYp8CIWeEwuxw2Xyz1b3+c5O4hEJbDrUZc195FpCC
	aCkLH6jzEPGAtEcDVseQW3A89L3C73CJSORFxCCDQ09Od607qJAIAsw5Ag/LoGf8uiQ/Mu2Igx0
	cWzzG5GEHRGDFzKqy9zwPiPM+bsd+LqYsR
X-Google-Smtp-Source: AGHT+IFXwS6BMXlZCktY1iu5Ku0wK7/ANbuchss5087kndEGLUdIEZB0mYdwF2Sa6W5p/eT2qOV1ig==
X-Received: by 2002:a05:6402:210d:b0:639:e712:cd6c with SMTP id 4fb4d7f45d1cf-639e712dc48mr21059463a12.13.1760449127234;
        Tue, 14 Oct 2025 06:38:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ztgs7TJdPuMEJZgxIPP2n6eB"
Message-ID: <0ec2d452-0ea0-48e9-ad40-baa7f5930b27@gmail.com>
Date: Tue, 14 Oct 2025 15:38:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v2] efi: Protect against unnecessary image
 unloading
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251014130648.2540082-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------ztgs7TJdPuMEJZgxIPP2n6eB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/14/25 3:06 PM, Andrew Cooper wrote:
> From: Gerald Elder-Vass<gerald.elder-vass@cloud.com>
>
> Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
> image after loading it (for verification purposes) regardless of the
> returned status. The protocol API implies this is the correct behaviour
> but we should add a check to protect against the unlikely case this
> frees any memory in use.
>
> Signed-off-by: Gerald Elder-Vass<gerald.elder-vass@cloud.com>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith<dpsmith@apertussolutions.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> Gerald is OoO and time is tight on Xen 4.21, so I've picked the patch up.
>
> Oleksii: This addresses follow-on feedback for a new feature in Xen 4.21, so
> really does want fixing before the release.  I forgot to put it on the
> tracking list, sorry.

It seems critical enough as it could lead to undef. behaviour/boot-time crashes/etc.
So we really want to have it in 4.21:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> v2:
>   * Apply feedback as Marek wants it.
> ---
>   xen/common/efi/boot.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 5b84dbf26e5e..3a78e7571a5e 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
>       static EFI_GUID __initdata shim_image_guid = SHIM_IMAGE_LOADER_GUID;
>       static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
>       SHIM_IMAGE_LOADER *shim_loader;
> -    EFI_HANDLE loaded_kernel;
> +    EFI_HANDLE loaded_kernel = NULL;
>       EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>       EFI_STATUS status;
>       bool verified = false;
> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
>               verified = true;
>   
>           /*
> -         * Always unload the image.  We only needed LoadImage() to perform
> -         * verification anyway, and in the case of a failure there may still
> -         * be cleanup needing to be performed.
> +         * If the kernel was loaded, unload it. We only needed LoadImage() to
> +         * perform verification anyway, and in the case of a failure there may
> +         * still be cleanup needing to be performed.
>            */
> -        shim_loader->UnloadImage(loaded_kernel);
> +        if ( !EFI_ERROR(status) || (status == EFI_SECURITY_VIOLATION) )
> +            shim_loader->UnloadImage(loaded_kernel);
>       }
>   
>       /* Otherwise, fall back to SHIM_LOCK. */
>
> base-commit: 53859596c0d34dbca776ec1e47bac8dd90552530
--------------ztgs7TJdPuMEJZgxIPP2n6eB
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
    <div class="moz-cite-prefix">On 10/14/25 3:06 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251014130648.2540082-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">From: Gerald Elder-Vass <a class="moz-txt-link-rfc2396E" href="mailto:gerald.elder-vass@cloud.com">&lt;gerald.elder-vass@cloud.com&gt;</a>

Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
image after loading it (for verification purposes) regardless of the
returned status. The protocol API implies this is the correct behaviour
but we should add a check to protect against the unlikely case this
frees any memory in use.

Signed-off-by: Gerald Elder-Vass <a class="moz-txt-link-rfc2396E" href="mailto:gerald.elder-vass@cloud.com">&lt;gerald.elder-vass@cloud.com&gt;</a>
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Marek Marczykowski-Górecki <a class="moz-txt-link-rfc2396E" href="mailto:marmarek@invisiblethingslab.com">&lt;marmarek@invisiblethingslab.com&gt;</a>
CC: Daniel P. Smith <a class="moz-txt-link-rfc2396E" href="mailto:dpsmith@apertussolutions.com">&lt;dpsmith@apertussolutions.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Gerald is OoO and time is tight on Xen 4.21, so I've picked the patch up.

Oleksii: This addresses follow-on feedback for a new feature in Xen 4.21, so
really does want fixing before the release.  I forgot to put it on the
tracking list, sorry.</pre>
    </blockquote>
    <pre>It seems critical enough as it could lead to undef. behaviour/boot-time crashes/etc.
So we really want to have it in 4.21:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251014130648.2540082-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

v2:
 * Apply feedback as Marek wants it.
---
 xen/common/efi/boot.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 5b84dbf26e5e..3a78e7571a5e 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
     static EFI_GUID __initdata shim_image_guid = SHIM_IMAGE_LOADER_GUID;
     static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;
     SHIM_IMAGE_LOADER *shim_loader;
-    EFI_HANDLE loaded_kernel;
+    EFI_HANDLE loaded_kernel = NULL;
     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
     EFI_STATUS status;
     bool verified = false;
@@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
             verified = true;
 
         /*
-         * Always unload the image.  We only needed LoadImage() to perform
-         * verification anyway, and in the case of a failure there may still
-         * be cleanup needing to be performed.
+         * If the kernel was loaded, unload it. We only needed LoadImage() to
+         * perform verification anyway, and in the case of a failure there may
+         * still be cleanup needing to be performed.
          */
-        shim_loader-&gt;UnloadImage(loaded_kernel);
+        if ( !EFI_ERROR(status) || (status == EFI_SECURITY_VIOLATION) )
+            shim_loader-&gt;UnloadImage(loaded_kernel);
     }
 
     /* Otherwise, fall back to SHIM_LOCK. */

base-commit: 53859596c0d34dbca776ec1e47bac8dd90552530
</pre>
    </blockquote>
  </body>
</html>

--------------ztgs7TJdPuMEJZgxIPP2n6eB--

