Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FD896FA0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:58:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700538.1093847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs0BY-0004CD-S9; Wed, 03 Apr 2024 12:57:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700538.1093847; Wed, 03 Apr 2024 12:57:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs0BY-00049O-PW; Wed, 03 Apr 2024 12:57:48 +0000
Received: by outflank-mailman (input) for mailman id 700538;
 Wed, 03 Apr 2024 12:57:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPGy=LI=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rs0BX-00049F-8K
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:57:47 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3fa8e34-f1b9-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 14:57:45 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41551500a7eso33692985e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 05:57:45 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e1-20020adff341000000b0033dd2a7167fsm17160055wrp.29.2024.04.03.05.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 05:57:44 -0700 (PDT)
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
X-Inumbo-ID: c3fa8e34-f1b9-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712149065; x=1712753865; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BP3JPiBSmq9mmOmJ6D9UZqPYkI3neeLrCDzoLgBCgj0=;
        b=kyui8vFxnb6ocXFWlBKp9akAkUvs5YOnh+HQdfR7ZgBZCLh2Y++6rVuab0FUpklsR3
         VOPvBIdAjVCe/Hp1M5tnVnbUfmxBkEL90Mzo8ie0UxVxva8g5sQ7729vX/FlpZjjFLck
         PHh76q/1mB20An0CSBK9mX8JRtuGTGSSaQ/q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712149065; x=1712753865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BP3JPiBSmq9mmOmJ6D9UZqPYkI3neeLrCDzoLgBCgj0=;
        b=JdZZ9Q0bGvYSQA98D6tgOh4MJbU57/u0sDwsiVaXLpMhdiDBcT6jRV9GhuPDB9uXgo
         Cv0vBbd98Vwq+mw0ro/aZDGkMmsT9xxDn9Rv34W7Pxl94XvRbM3roZ+nm/zK1FkNIN7s
         6K6bkCxnUPogf8WixuLUJ9Hn7hS4GSdwWa45goFYBW/Kad1q2MS9arxU8cQqCWG8E+Io
         Y1VuMX1XMd4gqUnShumJf3fW3Dvvz1wPnsLimWyti5OaMMbSFibo8HeBF5vhddd0jmSd
         lgtr0/UVdPve2YUQebOBQKjoElgCptFWzG+xl99F1B6wY736H9MtAO7bEgd7X69q4mER
         DZig==
X-Gm-Message-State: AOJu0YzVtO6HKxmfkWCAQYDs1AYgdTnc7skjMEYIWt1LuXm+0mIfqpQj
	uXRr9GLsUk/+a/SAuRt8ISwrZqUVrIX1dLGuA7shtGpbadUBXGHomZ9IGnIZThk=
X-Google-Smtp-Source: AGHT+IFKlvnYSinrx0Q2r2zXVxA2Ao4QwDbBxnOPdT1Ttf0fwj1jNtFJw2/zqCDCyoH7C/wUtBeWnA==
X-Received: by 2002:a05:600c:3502:b0:414:8065:2d25 with SMTP id h2-20020a05600c350200b0041480652d25mr11670715wmq.38.1712149065013;
        Wed, 03 Apr 2024 05:57:45 -0700 (PDT)
Date: Wed, 3 Apr 2024 13:57:44 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 2/4] tools: Move MB/GB() to common-macros.h
Message-ID: <079b0891-02d0-4bb1-87c8-ba249ca4025c@perard>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-3-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327215102.136001-3-jason.andryuk@amd.com>

On Wed, Mar 27, 2024 at 05:51:00PM -0400, Jason Andryuk wrote:
> Consolidate to a single set of common macros for tools.
> 
> MB() will gain another use in libelf, so this movement makes it
> available.
> 
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---

So, this patch fixes potential use issues with the macros in hvmloader
and init-xenstore-domain. While it's not perfect, it still better.

I'll try "MB(memory + 0)" with the different macros:


> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> index 87be213dec..14078bde1e 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -38,9 +38,6 @@ void __bug(const char *file, int line) __attribute__((noreturn));
>  #define BUG() __bug(__FILE__, __LINE__)
>  #define BUG_ON(p) do { if (p) BUG(); } while (0)
>  
> -#define MB(mb) (mb##ULL << 20)
> -#define GB(gb) (gb##ULL << 30)

With this change we have this change for MB(memory + 0) when applied:
-  (memory + 0ULL << 20)
+  ((memory + 0ULL) << 20)

>  static inline int test_bit(unsigned int b, const void *p)
>  {
>      return !!(((const uint8_t *)p)[b>>3] & (1u<<(b&7)));
> diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
> index 5405842dfe..f38ba8d6b5 100644
> --- a/tools/helpers/init-xenstore-domain.c
> +++ b/tools/helpers/init-xenstore-domain.c
> @@ -20,7 +20,6 @@
>  #include "init-dom-json.h"
>  
>  #define LAPIC_BASE_ADDRESS  0xfee00000UL
> -#define GB(x)               ((uint64_t)x << 30)

With this change we have this change for GB(memory + 0) when applied:
-  ((uint64_t)memory + 0 << 30)
+  ((memory + 0ULL) << 30)


So overall, patch makes things better and less duplication:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

