Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B39BE17D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 10:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830613.1245667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8bti-0001PP-6x; Wed, 06 Nov 2024 09:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830613.1245667; Wed, 06 Nov 2024 09:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8bti-0001MR-37; Wed, 06 Nov 2024 09:00:18 +0000
Received: by outflank-mailman (input) for mailman id 830613;
 Wed, 06 Nov 2024 09:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8btg-0001ML-It
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 09:00:16 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85eaf15c-9c1d-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 10:00:08 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9a2209bd7fso1105690866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 01:00:08 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb151c478sm248084666b.0.2024.11.06.01.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 01:00:07 -0800 (PST)
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
X-Inumbo-ID: 85eaf15c-9c1d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1ZWFmMTVjLTljMWQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODgzNjA4Ljg5MTAxNCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730883608; x=1731488408; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5gXuw3M5QK9WRdk3YcDHrwpzpaDmK5pY+W2E0c5Kwd8=;
        b=SECcHMxKPliWFuo3nwiKfncXUNfkjehYL8LG6rJwjP+jLR15PbPy8NG7B3uQC/cNMC
         GLQnfni31YcDYnkUzFfzz3BZVKdbzZJvJJrPp+Bwooo5JnhVLqEwtOEsuUHOPi7Piale
         pMyo25I+tRYZcC1FcNQnwzz/F1ug8Wsuo+dEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883608; x=1731488408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gXuw3M5QK9WRdk3YcDHrwpzpaDmK5pY+W2E0c5Kwd8=;
        b=CdT+V4sDXaZ7zjrviXNAI11DYsyUOploQV9TdLmNyYP5FZLQyrbf5alnA4pGgmMag1
         Ke6e4SDZUlUhkUNxzCx4UKVDo6JFdOF4dM54wpWyHhj/3xlRiwRm8cbYkxW1LiowK62j
         ifcr3lnbtD39cjiRikv+Vdb7ZlkvLXgI6DrVZff8O+y0pLD3pwFLx+nw5FbUhMlYFT5n
         B+KXkF+ytrzvn6gBB05/bpFPnZSfZfwCxxjF2EBOrsLco0bAQcWh9Mjh/x8vw4DNnDRU
         i2YKXICvyGjZNSFZ45F//2MPezCSylK3DDjrP/Vtr+xdqRuy8G2W2b9uA7W/1FronR6n
         Tanw==
X-Gm-Message-State: AOJu0Yw3m6ry4hFUg2aJ9TWAZV2Y1hrfgjX4itplJ/RZdVmF3xwh9Fep
	tz8xkPQCpKvEnffxL8Y4VG65B4CTDRzno0JhCv9P2Q8wixxwBo01SBwfyjgI3nvW6pEIVVW/mzo
	g
X-Google-Smtp-Source: AGHT+IF6lT6eOhIGGnqeb8TvNMBZ9KRoGQqvmn2HCxDDrniI79ne7OvBQWd/LN815Q7xgh4m2gUJQw==
X-Received: by 2002:a17:907:6eac:b0:a9a:7f91:8c76 with SMTP id a640c23a62f3a-a9de5a3e0ebmr4167151366b.0.1730883608235;
        Wed, 06 Nov 2024 01:00:08 -0800 (PST)
Date: Wed, 6 Nov 2024 10:00:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Message-ID: <ZyswF4grJSNcVqY_@macbook>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>

On Wed, Nov 06, 2024 at 08:05:19AM +0000, Mykyta Poturai wrote:
> During the construction of dmask value, it gets shifted by
> (32 - msi->vectors) bits. If msi->vectors is 0, the result of the shift
> becomes undefined due to shifting by a size of the type. While this
> works fine on x86, on ARM the resulting mask becomes 0xFFFFFFFF, which
> is incorrect.
> 
> Fix this by adding an explicit check for msi->vectors == 0.

I would also add:

Fixes: 188fa82305e7 ('xen/vpci: Improve code generation in mask_write()')

> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/drivers/vpci/msi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 7bda47e7fc..787296fd42 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -172,7 +172,7 @@ static void cf_check mask_write(
>      struct vpci_msi *msi = data;
>      uint32_t dmask = msi->mask ^ val;
>  
> -    if ( !dmask )
> +    if ( !dmask || msi->vectors == 0 )
>          return;

I'm afraid returning this early is not correct - the cached mask needs
to be updated, even if there are no vectors currently enabled.

The adjustment likely needs to be:

if ( msi->enabled && msi->vectors )
...

So that the update of msi->mask is not skipped.

Thanks, Roger.

