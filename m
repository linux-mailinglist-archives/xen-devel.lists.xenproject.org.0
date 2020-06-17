Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084C1FC905
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 10:39:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlTbp-0003Ju-0o; Wed, 17 Jun 2020 08:39:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7kS=76=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlTbn-0003J6-0u
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 08:39:47 +0000
X-Inumbo-ID: 18e58cc6-b076-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18e58cc6-b076-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 08:39:46 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g10so1007247wmh.4
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=+wdC9mW3JSrWfdn3V4wPeinzlJyZ8c3Jf3+qdLTGosI=;
 b=FT5/HfzHHgg2TwcVBJ/08E6KZRbX4wHUg8PPwIxtSUQcZ3eWONSvIxmv6faKMmaYMY
 Wn3wk64gwz5Ru+Gbm259jzZuKyCU6ManqaqEExqE6A9mboYh0mTNrY+ABOJ0GA32yHxr
 Og31o8FPzWK8inNSUpXxhnsVUDgQxOOZMHk1RpaxmPBYGrsxpFetfFsMDUaB/YN0TSiE
 6C+KlBG87QQraTUf8q5iIV9MFu8EVnLihCdIYnoZOQlin7hEO0U6LJXwygaXQq6edGoQ
 C54GYTKkzyZK1TtiNymzUzYicGOyDGZqf08VAykNbOxVTOb7sBKMpqfCCuVE5Y6bsrsz
 C3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=+wdC9mW3JSrWfdn3V4wPeinzlJyZ8c3Jf3+qdLTGosI=;
 b=H/QatnBi0rfk/UPxMxJ20b6EFCtMHdJ/2NWq2EQlTmNoGGbXYVff+8CucnW8zAGlN2
 rzjp9LYO/r+PrzwHE24iYk6+S8uhcE4x6e8+INJNhGO5q0y5+BNYOjkcn1dI0cX1zWts
 e5HHpxExCRvWaBscC6CQ/vKBC5dmTFVdTHu2qac3SQ+3BsiQ/oILOmw0mmPmZvjkRI58
 7YxSUYZ9okibRUq0WyPYl9+cRAtCvpCTPFiTxqJHld6jHCt6bohg/mhyfrR9tZXtGBBj
 1ysY1Uigr15tKEAkhIiIr2GrbLXnUyvS61rjBYwcpzaJ3W6KXVo25aY1RtODzT6EG5B6
 n9nQ==
X-Gm-Message-State: AOAM533Vsjtx/eEddg+EFIImoIP30u55P1hG5Uf2Wv8+At4dvrSEf6A4
 vEeFUZxFl2zYBDCSZ7dQZYk=
X-Google-Smtp-Source: ABdhPJyCl2D1rgnxUWSlyoAhU4WIeJGpGNIxu1nPmBqdBfpkJFANSFEdvywjqyubBzyX/Df3bIa5WQ==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr7371345wmc.121.1592383185461; 
 Wed, 17 Jun 2020 01:39:45 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id g19sm7037742wmh.29.2020.06.17.01.39.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 01:39:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Igor Druzhinin'" <igor.druzhinin@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <1592360353-31231-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1592360353-31231-1-git-send-email-igor.druzhinin@citrix.com>
Subject: RE: [PATCH for-4.14 v3] tools/xen-ucode: return correct exit code on
 failed microcode update
Date: Wed, 17 Jun 2020 09:39:43 +0100
Message-ID: <005b01d64482$da189650$8e49c2f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGeNywcRe2CjUFC+SqYd4wUtfCSSqlMlzSQ
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: ian.jackson@eu.citrix.com, xadimgnik@gmail.com, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Igor Druzhinin <igor.druzhinin@citrix.com>
> Sent: 17 June 2020 03:19
> To: xen-devel@lists.xenproject.org
> Cc: ian.jackson@eu.citrix.com; wl@xen.org; xadimgnik@gmail.com; Igor Druzhinin
> <igor.druzhinin@citrix.com>
> Subject: [PATCH for-4.14 v3] tools/xen-ucode: return correct exit code on failed microcode update
> 
> Otherwise it's difficult to know if operation failed inside the automation.
> 
> While at it, also switch to returning 1 and 2 instead of errno to avoid
> incompatibilies between errno and special exit code numbers.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

> ---
> Changes in v3:
> - conventionally return 1 and 2 instead of errno as exit code
> ---
>  tools/misc/xen-ucode.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 0c257f4..ad32fac 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -25,7 +25,7 @@ int main(int argc, char *argv[])
>          fprintf(stderr,
>                  "xen-ucode: Xen microcode updating tool\n"
>                  "Usage: %s <microcode blob>\n", argv[0]);
> -        return 0;
> +        exit(2);
>      }
> 
>      filename = argv[1];
> @@ -34,14 +34,14 @@ int main(int argc, char *argv[])
>      {
>          fprintf(stderr, "Could not open %s. (err: %s)\n",
>                  filename, strerror(errno));
> -        return errno;
> +        exit(1);
>      }
> 
>      if ( fstat(fd, &st) != 0 )
>      {
>          fprintf(stderr, "Could not get the size of %s. (err: %s)\n",
>                  filename, strerror(errno));
> -        return errno;
> +        exit(1);
>      }
> 
>      len = st.st_size;
> @@ -49,7 +49,7 @@ int main(int argc, char *argv[])
>      if ( buf == MAP_FAILED )
>      {
>          fprintf(stderr, "mmap failed. (error: %s)\n", strerror(errno));
> -        return errno;
> +        exit(1);
>      }
> 
>      xch = xc_interface_open(NULL, NULL, 0);
> @@ -57,20 +57,23 @@ int main(int argc, char *argv[])
>      {
>          fprintf(stderr, "Error opening xc interface. (err: %s)\n",
>                  strerror(errno));
> -        return errno;
> +        exit(1);
>      }
> 
>      ret = xc_microcode_update(xch, buf, len);
>      if ( ret )
> +    {
>          fprintf(stderr, "Failed to update microcode. (err: %s)\n",
>                  strerror(errno));
> +        exit(1);
> +    }
> 
>      xc_interface_close(xch);
> 
>      if ( munmap(buf, len) )
>      {
>          printf("Could not unmap: %d(%s)\n", errno, strerror(errno));
> -        return errno;
> +        exit(1);
>      }
>      close(fd);
> 
> --
> 2.7.4



