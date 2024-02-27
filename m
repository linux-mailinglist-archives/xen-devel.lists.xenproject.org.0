Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED11869BFE
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 17:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686260.1068073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf0G7-0002nh-JY; Tue, 27 Feb 2024 16:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686260.1068073; Tue, 27 Feb 2024 16:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rf0G7-0002ls-Gu; Tue, 27 Feb 2024 16:24:47 +0000
Received: by outflank-mailman (input) for mailman id 686260;
 Tue, 27 Feb 2024 16:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rf0G6-0002lm-AG
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 16:24:46 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e11201-d58c-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 17:24:45 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512e568607aso4572256e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 08:24:45 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 vq18-20020a05620a559200b00787c4a07c41sm3533217qkn.42.2024.02.27.08.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:24:44 -0800 (PST)
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
X-Inumbo-ID: b7e11201-d58c-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709051085; x=1709655885; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ddr4nhzWC8oBBn+4YSPEj/IHR+Nkh7G4QtnH4b4ZEQw=;
        b=ruY56H2ralUnNj6FlSJ0GFqSDojsBSBvp7M1H/5NumCh6+/Vtj4RZIJXnWVAJ9o0UV
         sZ99SFU3A/KFmZQ9Ia0982mdtzlS2Y4o6oW6oB4WoHEpJDoF7AJlTRyUrmxbolCd6lT3
         16APYnkE8CIpZWZkePcTr8jzT6m2mM7QnHoAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709051085; x=1709655885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ddr4nhzWC8oBBn+4YSPEj/IHR+Nkh7G4QtnH4b4ZEQw=;
        b=IIom+jKzCDDYfhyP7uK1hAZRnNaVHyzuiyvNohdJSGtNKTtepDWcxZb1+1YdXT8TEM
         fUBnKxSZJlyNWKfTti/7P2N2S9kVit5/2+3kYcyUoamyV7jhUFw0PvYVf5xkA5NQfTrt
         1lsOUADXUly95FyK7k7NjI3zC4FXELl07JUe9iyWeWqncilCgGmSuFlMIFUjgWYr89tz
         cJKb/Ojd/3Kn7g7XHbbqY8SlSS1GRqRSJQzdx/bnwIXTX54F5SpGns+oT8nVJlg380Ry
         l+Jp+jskSCiYcloO0zHgYPbPI6YQIxxT2Pum+XWdjbWAb3FGJw5VIQOlmyKiQ+f/NeFR
         H1zQ==
X-Gm-Message-State: AOJu0Yx6hXbJrR/BUaFlKVlv12YoTbAv336M/V+pGsM5GH++rzFBV+MD
	WvBniCoMhrEoRm4I1UF/4nNu32Xq1nGm8TTCPQA0KAW76zTU6brBeWftEDcyyEQ=
X-Google-Smtp-Source: AGHT+IF0l17cD4knqW30nSs5kjrFRUzfVaIlGtj3g/7hljvUXAJ5ziaCnwyHCh/JDbs5NT76tJck0A==
X-Received: by 2002:a05:6512:6d0:b0:512:fc60:38e4 with SMTP id u16-20020a05651206d000b00512fc6038e4mr5042904lff.54.1709051084702;
        Tue, 27 Feb 2024 08:24:44 -0800 (PST)
Date: Tue, 27 Feb 2024 17:24:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tests/vpci: fix unit tests after locking change
Message-ID: <Zd4MyuVC8jcdpH6r@macbook>
References: <20240227145745.1114780-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240227145745.1114780-1-stewart.hildebrand@amd.com>

On Tue, Feb 27, 2024 at 09:57:43AM -0500, Stewart Hildebrand wrote:
> The recent vPCI locking broke the vPCI unit tests. Fix it to unblock CI.
> 
> Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  tools/tests/vpci/emul.h | 9 ++++++++-
>  tools/tests/vpci/main.c | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
> index 3c2f66a18f13..da446bba86b4 100644
> --- a/tools/tests/vpci/emul.h
> +++ b/tools/tests/vpci/emul.h
> @@ -37,7 +37,10 @@
>  
>  #include "list.h"
>  
> +typedef bool rwlock_t;
> +
>  struct domain {
> +    rwlock_t pci_lock;
>  };
>  
>  struct pci_dev {
> @@ -46,7 +49,7 @@ struct pci_dev {
>  
>  struct vcpu
>  {
> -    const struct domain *domain;
> +    struct domain *domain;
>  };
>  
>  extern const struct vcpu *current;
> @@ -56,6 +59,10 @@ typedef bool spinlock_t;
>  #define spin_lock_init(l) (*(l) = false)
>  #define spin_lock(l) (*(l) = true)
>  #define spin_unlock(l) (*(l) = false)
> +#define read_lock(l) (*(l) = true)
> +#define read_unlock(l) (*(l) = false)
> +#define write_lock(l) (*(l) = true)
> +#define write_unlock(l) (*(l) = false)

I now realize the spinlock handlers are pointless to set a boolean,
and the same applies to the rwlocks, but anyway, it's not going to
affect the testing.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

