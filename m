Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572FA10543
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 12:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871211.1282252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf2m-0002dJ-9d; Tue, 14 Jan 2025 11:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871211.1282252; Tue, 14 Jan 2025 11:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXf2m-0002aq-6o; Tue, 14 Jan 2025 11:25:12 +0000
Received: by outflank-mailman (input) for mailman id 871211;
 Tue, 14 Jan 2025 11:25:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXf2l-0001Zk-1R
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 11:25:11 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367deef2-d26a-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 12:25:09 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so39280741fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 03:25:09 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff0f8830sm17704571fa.56.2025.01.14.03.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 03:25:08 -0800 (PST)
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
X-Inumbo-ID: 367deef2-d26a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736853909; x=1737458709; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxuwXE7Ub93xoW60BGzgtGqv5pjnq4qxOGMwWVH5TvE=;
        b=TIKA/uWW77LG5m9A5Kf8grzD6dBOdyGV16bfll/IQGg0/WLkaUw6/AI+N+Da13yxT6
         yB4yfxsFA7v/rcRvFCheVKMqC1evA5t56DICrV3vZ+c5dIFZPpqCqkQJ1yH8E0EuPefZ
         /6KGmvFaLqGDkl1QSc+kbQUwVL2qfwYhqJwGQJ1jhpquy0hNORT14audiEHQk+z8l8Cx
         PFTBk8Q7bCp/Njnbpj2WFAKQsj3uItuP68qsXuG4vTUvCLVTXU7Xz+b8yxxo5GUdQu1J
         bhH3thnUs8fG7vRfmjRspv00jZL3BMw9L3ehGrponezb0eUskbmwm+N6MJ3SZoq27yA/
         jWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736853909; x=1737458709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxuwXE7Ub93xoW60BGzgtGqv5pjnq4qxOGMwWVH5TvE=;
        b=XZ6FIx2WidIr2l1Cz5CcBJPWhu7yeG8Jgh8s//Bg5sbyu/ZDlj/siOXiPCbs7lKcbk
         iqSwoXM/sAPfAPU/ivffWWhbiPveePjT2dHf4pvdrSNgSXpP3c3kZPoKOgxnFwzFbtpy
         tPP1YyY7nQwadQI1UOtdGeNn1sMdOTBp6rO/hElV1xpM7vQ6Ir2kuZOby2puBFIGXBDi
         MupMNyEa43vRlRol+rHUlL55iLLjNdvU5dfWDO9bgFHMiXTt3bRqGy9Qgf93etDbh6MC
         BE68H+rigeZbdI5BzIum0Qix6uCrOTDFA3ciw4CerUqF4PKGe7lZ34if7FTUkhqa6VQR
         RNjg==
X-Forwarded-Encrypted: i=1; AJvYcCXba86e5lnBqErxTAfVTHbcB4nCf3aGtOHoOSMNUa9Ct4cQ/inwXUkybAZIZyPyTYEM6N2ZWL75epc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw67p8d3RWXAXlm4nrgfdNKFhKniaWMAQpIPWq4WrALu9XQIsqB
	h9OQAyXjQRzv4z1SE5gZGpw472ExesBwtDZtQr+qUQzddrIdUi6N
X-Gm-Gg: ASbGncs0VADJ3smlj+qUngP5p7PTgcDo9p3WjsA6orkXiuLktDTm0EJFoYKp1kSnds6
	miGiPgvbfhsmJ5gMEIYleyAr2mIyRAbj8f5Tf8WPo3mL4vVT0ATJ5WaaV7fmkP5AmdjEoywIpE+
	0uAj5UHSxSSlqe7vpbbMtUZb/ed2ySy9p3cx05AZG3Ya5Jha6hPCnggKG9nROQXtVcW1e2GgfUs
	lBeCd48PJvDs/6ZvfdcfCB3iFSSIk9Xlx4hKZbYK9ytAzT4AyPI4eOa5P6p5nK6zF2p4w==
X-Google-Smtp-Source: AGHT+IGXP8yNnZya4l7S4XQv4FSJGBz0Th1oXdgTyujC48B2Q+C0CnMJee6+QtEVSw8eFotLervMgQ==
X-Received: by 2002:a05:651c:b29:b0:302:4147:178d with SMTP id 38308e7fff4ca-305f45dc5b0mr94748041fa.28.1736853908817;
        Tue, 14 Jan 2025 03:25:08 -0800 (PST)
Message-ID: <652d7978-8810-4e10-9a19-e067948a223f@gmail.com>
Date: Tue, 14 Jan 2025 12:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xl: properly dispose of vTPM struct instance
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <73a01ddf-6090-4fda-a8c0-5703e7c9e81b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <73a01ddf-6090-4fda-a8c0-5703e7c9e81b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/25 9:13 AM, Jan Beulich wrote:
> The backend_domname field requires separate freeing; make sure to call
> libxl_device_vtpm_dispose() also on respective error paths.
>
> Coverity-ID: 1638719
> Fixes: dde22055ac3a ("libxl: add vtpm support")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

R-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> --- a/tools/xl/xl_vtpm.c
> +++ b/tools/xl/xl_vtpm.c
> @@ -44,12 +44,14 @@ int main_vtpmattach(int argc, char **arg
>           if (MATCH_OPTION("uuid", *argv, oparg)) {
>               if(libxl_uuid_from_string(&(vtpm.uuid), oparg)) {
>                   fprintf(stderr, "Invalid uuid specified (%s)\n", oparg);
> +                libxl_device_vtpm_dispose(&vtpm);
>                   return 1;
>               }
>           } else if (MATCH_OPTION("backend", *argv, oparg)) {
>               replace_string(&vtpm.backend_domname, oparg);
>           } else {
>               fprintf(stderr, "unrecognized argument `%s'\n", *argv);
> +            libxl_device_vtpm_dispose(&vtpm);
>               return 1;
>           }
>       }
> @@ -65,6 +67,7 @@ int main_vtpmattach(int argc, char **arg
>   
>       if (libxl_device_vtpm_add(ctx, domid, &vtpm, 0)) {
>           fprintf(stderr, "libxl_device_vtpm_add failed.\n");
> +        libxl_device_vtpm_dispose(&vtpm);
>           return 1;
>       }
>       libxl_device_vtpm_dispose(&vtpm);

