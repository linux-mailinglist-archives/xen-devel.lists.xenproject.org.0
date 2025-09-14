Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D77B56698
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 06:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123689.1466522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxdyx-0003Mx-OE; Sun, 14 Sep 2025 04:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123689.1466522; Sun, 14 Sep 2025 04:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxdyx-0003Lz-Ko; Sun, 14 Sep 2025 04:04:55 +0000
Received: by outflank-mailman (input) for mailman id 1123689;
 Sun, 14 Sep 2025 04:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lLjW=3Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uxdyw-0003Lr-PO
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 04:04:54 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4e8f4a7-911f-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 06:04:49 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2445806df50so25272815ad.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 21:04:49 -0700 (PDT)
Received: from ?IPV6:2601:646:9e00:b920::2bf4? ([2601:646:9e00:b920::2bf4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77614f3c244sm6423966b3a.79.2025.09.13.21.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Sep 2025 21:04:47 -0700 (PDT)
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
X-Inumbo-ID: f4e8f4a7-911f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822688; x=1758427488; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzemIDikZYgL9exPt5M8v/LJGHU6LS2hmoTEaMFHg2s=;
        b=CZANum+RphowjZ96k2OziFvSl2r+0wKY8P6zt9Qn8YeXk5yJQuAzaP8j5F0cu068Ho
         51oDaDe08PKjzsK0NDMQaGVQY/Yk5tm6e2P/xUQWiC0MfPFfjbPDrpB/F6mU8vOFgRtr
         WqzvrshehHuhhf56dAFVYBFPqNSD2e6MOMdJv7WhTv6bhiPf2bVA4PymnZbGQVdjwYDp
         ck00V1dINPgMC5La0KZSd3cxNLNLW4bfrHIKBWjvmRNHUnNOgp9NFKVTZRsXOiW3DbW6
         NE5NQkkHpp4js5r7R3wN1MnSGy09aC6jj2MrMzkfZD9b58q2ocgl9fAadzYT8BCpvck6
         6/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822688; x=1758427488;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VzemIDikZYgL9exPt5M8v/LJGHU6LS2hmoTEaMFHg2s=;
        b=WgCIjqM31AeEw+sf7aEcJuCsqXqIVj909S24Vw71wkPPS28/4GB01NNgfhN6I9Nnli
         NnlJdPNT5HJSGx/L2dyak6YydL/dOgLzo8pdu6kwegq3Vo5pNdjBoVlm1kwrTTUMCjpN
         UXJB/h1YddecruRtAMbkB8bQqt9uzFIjvOcdFtNm+/Px/f/T5kB3XFZwwadDwlpq4Jp3
         94QGqeL5/9puM/kJt8XAI6ZXdfYUdC4tX+FZl7eItdSvyyt0pXhsBrQVqPKQ1iGMPUgw
         UmcETXFo9B/LchoDwXqB1PSLG1d2qs9VxRGluNS3j6wjQT769PynSKY33T6C2N+Dv3/a
         uQYw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Dcs4aSt5cacl6NQ+GP94/nFdnAEEB9ZxRvAkhhl89T1+SpN98ha7bWrL9c1nIShirvczf84qMJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwypOM1NPZjm5IDbNfeRY0b6dk2U3tJ7m9ywLGBWtSy/QivLkeL
	VXKU68vmRflCe4Qek3fn53asQm4t+pYqjKSHOQg4NCchPBO9NwmueXrJ
X-Gm-Gg: ASbGnctwYqczg8Drji64MQS9wEpDaYQsNtsGTt5M9MrPlVq4cObJPVJLuxKwv4d+EDv
	MHbKlYVnQSTAIvjiwwAMm2G0avrmMsM8UpjufdrMUuWOEhTFTHI2Ow6EAWuHYX/WluIIXSm0DUa
	yEeSRLATucFOBYs+PvtVgi8Tpy45QCmexnTwl9GFTsDZmBoSyUb4sfC84PKiM+YZb1uwW4efqDI
	uCSuOE+OQxkgFIMzaV6ICCs8b8sZnHI81r7UXzP/xy+/6O+++16dEOOp8xGs4kwV1OB/4Yc6WB+
	DwKORGFQ4L+xFF65hYf9KgykFw71kIwm9rMtQ48851sFikUw5eUTjCDLgn/JJGSbcS7m0abm0mK
	wEXknwsuDHR/0WlvS97t212G5uokHHMi1cGtAEi2aBYMtobwfeNiRfA==
X-Google-Smtp-Source: AGHT+IG9yDpBiOAueeneMaAmMcVqH6SnwO/wwKcnXWqCb4uFKvqjSl0kZtiC7sYfrdSLaML93CCcTg==
X-Received: by 2002:a17:903:3c65:b0:24c:ed9f:ba53 with SMTP id d9443c01a7336-25d26079e22mr101611915ad.29.1757822688041;
        Sat, 13 Sep 2025 21:04:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------Hu0m4xuLBOLyybHzTbFLjDZb"
Message-ID: <a9d561b8-c7b1-4197-966b-db72a5f6f942@gmail.com>
Date: Sun, 14 Sep 2025 06:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][for-4.21] xen/arm: Reorder SCI resource cleanup in domain
 destruction
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com>

This is a multi-part message in MIME format.
--------------Hu0m4xuLBOLyybHzTbFLjDZb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/13/25 12:30 PM, Oleksii Moisieiev wrote:
> Move the SCI (System Control and Management Interface) resource cleanup
> earlier in the domain_relinquish_resources() sequence to ensure proper
> cleanup ordering during domain destruction.
>
> The SCI cleanup is now performed before TEE (Trusted Execution Environment)
> cleanup rather than after P2M mapping cleanup. This reordering ensures that
> SCI resources are properly released before other subsystems that might
> depend on them are torn down.
>
> This change addresses potential resource cleanup dependencies where SCI
> resources need to be released before P2M mappings are cleaned up, preventing
> potential issues during domain destruction on ARM platforms with SCI support.

Shouldn't be then Fix tag present?

~ Oleksii

> Signed-off-by: Oleksii Moisieiev<oleksii_moisieiev@epam.com>
> ---
>
>   xen/arch/arm/domain.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 1a8585d02b..0ac381a5a5 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct domain *d)
>               return ret;
>   #endif
>   
> +    PROGRESS(sci):
> +        ret = sci_relinquish_resources(d);
> +        if ( ret )
> +            return ret;
> +
>       PROGRESS(tee):
>           ret = tee_relinquish_resources(d);
>           if (ret )
> @@ -1109,10 +1114,6 @@ int domain_relinquish_resources(struct domain *d)
>           ret = relinquish_p2m_mapping(d);
>           if ( ret )
>               return ret;
> -    PROGRESS(sci):
> -        ret = sci_relinquish_resources(d);
> -        if ( ret )
> -            return ret;
>   
>       PROGRESS(p2m_root):
>           /*
--------------Hu0m4xuLBOLyybHzTbFLjDZb
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
    <div class="moz-cite-prefix">On 9/13/25 12:30 PM, Oleksii Moisieiev
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com">
      <pre wrap="" class="moz-quote-pre">Move the SCI (System Control and Management Interface) resource cleanup
earlier in the domain_relinquish_resources() sequence to ensure proper
cleanup ordering during domain destruction.

The SCI cleanup is now performed before TEE (Trusted Execution Environment)
cleanup rather than after P2M mapping cleanup. This reordering ensures that
SCI resources are properly released before other subsystems that might
depend on them are torn down.

This change addresses potential resource cleanup dependencies where SCI
resources need to be released before P2M mappings are cleaned up, preventing
potential issues during domain destruction on ARM platforms with SCI support.
</pre>
    </blockquote>
    <pre>Shouldn't be then Fix tag present?

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com">
      <pre wrap="" class="moz-quote-pre">
Signed-off-by: Oleksii Moisieiev <a class="moz-txt-link-rfc2396E" href="mailto:oleksii_moisieiev@epam.com">&lt;oleksii_moisieiev@epam.com&gt;</a>
---

 xen/arch/arm/domain.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 1a8585d02b..0ac381a5a5 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct domain *d)
             return ret;
 #endif
 
+    PROGRESS(sci):
+        ret = sci_relinquish_resources(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(tee):
         ret = tee_relinquish_resources(d);
         if (ret )
@@ -1109,10 +1114,6 @@ int domain_relinquish_resources(struct domain *d)
         ret = relinquish_p2m_mapping(d);
         if ( ret )
             return ret;
-    PROGRESS(sci):
-        ret = sci_relinquish_resources(d);
-        if ( ret )
-            return ret;
 
     PROGRESS(p2m_root):
         /*
</pre>
    </blockquote>
  </body>
</html>

--------------Hu0m4xuLBOLyybHzTbFLjDZb--

