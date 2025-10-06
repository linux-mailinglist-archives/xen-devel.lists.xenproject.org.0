Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2973BBD709
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 11:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138011.1473805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5hUD-0002r5-Jn; Mon, 06 Oct 2025 09:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138011.1473805; Mon, 06 Oct 2025 09:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5hUD-0002nw-E9; Mon, 06 Oct 2025 09:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1138011;
 Mon, 06 Oct 2025 09:26:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozxN=4P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v5hUB-0002nq-SC
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 09:26:27 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885c5118-a296-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 11:26:26 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so999837566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 02:26:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83e3dsm1087913466b.29.2025.10.06.02.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 02:26:25 -0700 (PDT)
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
X-Inumbo-ID: 885c5118-a296-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759742786; x=1760347586; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJgcDdyGVvTFjWv0iuE6KatfeyOjg0CB6EtsxCvVEyg=;
        b=nRPC/TUfIUEBXqb3cMBffgIiDS+m9ClEvYZwtydnWNLGYENO4jhMcy4kkBmk0S694X
         Y9edI7icvSzR171QEZiUNDg54QO0SI8LNcAufWJFTyl5FhX0wEiJ0+2wbGU6eQH89MFq
         lke3hfonx5M91OW517hjputRlEaf6MV82mW4jzCcu7pTmJgHyCf/4gMqifKPFaiyzCef
         dDdSLlV8EL1ThgoB5W+iOuThV+xnne2GSpvRKJtkEk/nM6G+0xbCU8XwrqKehnDvYMxx
         hypyJG1k1NWFg2WotlNlbHWvqDo2l4K426CVL0RWZkQs8BsLSLFbFw1Y6k0jlY/sd/fT
         y2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759742786; x=1760347586;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IJgcDdyGVvTFjWv0iuE6KatfeyOjg0CB6EtsxCvVEyg=;
        b=ND/jbwmMwIq6DJsF6U0a7KjV0M6hdYbAPVtHy3KuZCft1NmuFSydKlOC5vfscxJHCW
         mNeaIGhXAWAVRspXuOXxIHweC9xJoEau1pgNxDrHUL8dcBI2/V41SjZPcWmMn8kFlnb9
         xonLIfurafjeqjmNE5GA5OavemW23Zhp5O6bcoi4Gc3fOxU1dnjxQC+F7t+OlzOpmf35
         27Wuspbbt78wEekQGCyB8ui7N8jF+6udeoshpv4/QyH/9/YP1MePpt6+nGPzgO6kaZ1q
         B1iVCKlvRAiYW6IxCZmSXNXd0hNrjLvaHkbYdrIjeMTMAqVgkbD7uqq5Z1Dr9bb25xys
         nVMg==
X-Forwarded-Encrypted: i=1; AJvYcCUYZwyVldTsu/uP+LgT18llkJZv8Kjg+Bo+ZhSlbg31/sCidvNMYnda+7u1lfbl3r9sxGbiCmKRtdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqIM8gGf11BEAdeHqAqnTKvmmvhqNob3/3I0xog2PnucLoR8fY
	TJpmZSN3OtDvwAePs+cjNZvT/w2hpjqlpzv/y+Z5jKqZT9b/R0uoGGlY
X-Gm-Gg: ASbGncue5iFLa96ynBiqHIeoOpjGUHYBc6VpHXY/e2eKsXDhS/RXckPWNHAXsQlK20i
	WtcgaVCwpwk+PZ9MwM3kNi+EHcc3IIZKJDiQmWUwFf2h+ai6DC5IH91p5dko5l/d1on69FY59aO
	js3nHllEU70GmvwuXGdPaWfM/pQ37zNc+W2gGCx3TrZIbY1bRJi1PkfViYcLJ7Cf7otaBPBcbIh
	JTt1LDcTXwgDA77yr/WNuNNteSswkeFXMK1fnMeWe3c6cGbFO1NTDFJ+p6A97kZk/LY65o4kNm2
	9WbyWCqP3CKy+i7PGQLXs3NLXETHweyzlpA5YBjXZn+CCExcE3mHm22OsoL5DGWAi1SU45nLnDf
	2XZs4eRRtzZCATdbWiDFl5x/iJfcI6qMbTSdj0ITa2Psh1gCgYTDOkTOOIv3yrp0f97p93Um4Y6
	bjOAtTIZrnRixOl4biGRcVYc+o1BQ=
X-Google-Smtp-Source: AGHT+IGKa81DCOXLrASW4mqOJyGlVHRbZETH0IiikjenfFXHsixMezB+2OWvxxd4paGo69VshH3n1Q==
X-Received: by 2002:a17:907:3e13:b0:b33:a2ef:c7 with SMTP id a640c23a62f3a-b49c42769bcmr1478770766b.55.1759742785739;
        Mon, 06 Oct 2025 02:26:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------bg97jX0oY39QB76TPzt0lRjh"
Message-ID: <832a15bd-bc54-49b1-991e-3240702a4a35@gmail.com>
Date: Mon, 6 Oct 2025 11:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] libs/guest: don't use unsigned long as type for PFNs
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jason.andryuk@amd.com>, Luca Fancellu <luca.fancellu@arm.com>
References: <20251006055939.27286-1-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251006055939.27286-1-jgross@suse.com>

This is a multi-part message in MIME format.
--------------bg97jX0oY39QB76TPzt0lRjh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/6/25 7:59 AM, Juergen Gross wrote:
> Declarations of xc_dom_console_init() and
> xc_dom_console_set_disconnected() in libxenguest.h don't match their
> implementation in the library.
>
> Under arm32, xen_pfn_t is a uint64_t and wider than unsigned long.
>
> Use xen_pfn_t for GFNs in the library to fix that. At the same time
> change the parameter name of the implementation to console_gfn,
> matching the interface declaration in the header and reality (it is
> a GFN, not a PFN).
>
> Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
> Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
> Reported-by: Luca Fancellu<luca.fancellu@arm.com>
> Signed-off-by: Juergen Gross<jgross@suse.com>

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> V2:
> - switch parameter name as well (Andrew Cooper)
> ---
>   tools/libs/guest/xg_dom_boot.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
> index f51b6a78c8..420222cf37 100644
> --- a/tools/libs/guest/xg_dom_boot.c
> +++ b/tools/libs/guest/xg_dom_boot.c
> @@ -430,12 +430,12 @@ int xc_dom_gnttab_init(struct xc_dom_image *dom)
>   
>   static int dom_console_init(xc_interface *xch,
>                               uint32_t domid,
> -                            unsigned long dst_pfn,
> +                            xen_pfn_t console_gfn,
>                               bool clear)
>   {
>       const size_t size = PAGE_SIZE;
>       struct xencons_interface *xencons = xc_map_foreign_range(
> -        xch, domid, size, PROT_WRITE, dst_pfn);
> +        xch, domid, size, PROT_WRITE, console_gfn);
>   
>       if ( xencons == NULL )
>           return -1;
> @@ -445,22 +445,22 @@ static int dom_console_init(xc_interface *xch,
>       xencons->connection = XENCONSOLE_DISCONNECTED;
>   
>       munmap(xencons, size);
> -    xc_domain_cacheflush(xch, domid, dst_pfn, 1);
> +    xc_domain_cacheflush(xch, domid, console_gfn, 1);
>       return 0;
>   }
>   
>   int xc_dom_console_init(xc_interface *xch,
>                           uint32_t domid,
> -                        unsigned long dst_pfn)
> +                        xen_pfn_t console_gfn)
>   {
> -    return dom_console_init(xch, domid, dst_pfn, true);
> +    return dom_console_init(xch, domid, console_gfn, true);
>   }
>   
>   int xc_dom_console_set_disconnected(xc_interface *xch,
>                                       uint32_t domid,
> -                                    unsigned long dst_pfn)
> +                                    xen_pfn_t console_gfn)
>   {
> -    return dom_console_init(xch, domid, dst_pfn, false);
> +    return dom_console_init(xch, domid, console_gfn, false);
>   }
>   
>   /*
--------------bg97jX0oY39QB76TPzt0lRjh
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
    <div class="moz-cite-prefix">On 10/6/25 7:59 AM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251006055939.27286-1-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre">Declarations of xc_dom_console_init() and
xc_dom_console_set_disconnected() in libxenguest.h don't match their
implementation in the library.

Under arm32, xen_pfn_t is a uint64_t and wider than unsigned long.

Use xen_pfn_t for GFNs in the library to fix that. At the same time
change the parameter name of the implementation to console_gfn,
matching the interface declaration in the header and reality (it is
a GFN, not a PFN).

Fixes: b6fc307b0b00 ("libs/guest: Set console as disconnected on resume")
Fixes: 971b7d5ecbcd ("libs/guest: Set console page to disconnected")
Reported-by: Luca Fancellu <a class="moz-txt-link-rfc2396E" href="mailto:luca.fancellu@arm.com">&lt;luca.fancellu@arm.com&gt;</a>
Signed-off-by: Juergen Gross <a class="moz-txt-link-rfc2396E" href="mailto:jgross@suse.com">&lt;jgross@suse.com&gt;</a></pre>
    </blockquote>
    <br>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:20251006055939.27286-1-jgross@suse.com">
      <pre wrap="" class="moz-quote-pre">
---
V2:
- switch parameter name as well (Andrew Cooper)
---
 tools/libs/guest/xg_dom_boot.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index f51b6a78c8..420222cf37 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -430,12 +430,12 @@ int xc_dom_gnttab_init(struct xc_dom_image *dom)
 
 static int dom_console_init(xc_interface *xch,
                             uint32_t domid,
-                            unsigned long dst_pfn,
+                            xen_pfn_t console_gfn,
                             bool clear)
 {
     const size_t size = PAGE_SIZE;
     struct xencons_interface *xencons = xc_map_foreign_range(
-        xch, domid, size, PROT_WRITE, dst_pfn);
+        xch, domid, size, PROT_WRITE, console_gfn);
 
     if ( xencons == NULL )
         return -1;
@@ -445,22 +445,22 @@ static int dom_console_init(xc_interface *xch,
     xencons-&gt;connection = XENCONSOLE_DISCONNECTED;
 
     munmap(xencons, size);
-    xc_domain_cacheflush(xch, domid, dst_pfn, 1);
+    xc_domain_cacheflush(xch, domid, console_gfn, 1);
     return 0;
 }
 
 int xc_dom_console_init(xc_interface *xch,
                         uint32_t domid,
-                        unsigned long dst_pfn)
+                        xen_pfn_t console_gfn)
 {
-    return dom_console_init(xch, domid, dst_pfn, true);
+    return dom_console_init(xch, domid, console_gfn, true);
 }
 
 int xc_dom_console_set_disconnected(xc_interface *xch,
                                     uint32_t domid,
-                                    unsigned long dst_pfn)
+                                    xen_pfn_t console_gfn)
 {
-    return dom_console_init(xch, domid, dst_pfn, false);
+    return dom_console_init(xch, domid, console_gfn, false);
 }
 
 /*
</pre>
    </blockquote>
  </body>
</html>

--------------bg97jX0oY39QB76TPzt0lRjh--

