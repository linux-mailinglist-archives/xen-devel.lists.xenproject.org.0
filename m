Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F326976AC9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 15:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797498.1207474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sok0n-0005nj-9a; Thu, 12 Sep 2024 13:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797498.1207474; Thu, 12 Sep 2024 13:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sok0n-0005lE-6C; Thu, 12 Sep 2024 13:37:29 +0000
Received: by outflank-mailman (input) for mailman id 797498;
 Thu, 12 Sep 2024 13:37:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sok0l-0005jr-99
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 13:37:27 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2568576a-710c-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 15:37:25 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c251ba0d1cso1129130a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 06:37:25 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a901c737f09sm173563066b.30.2024.09.12.06.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:37:23 -0700 (PDT)
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
X-Inumbo-ID: 2568576a-710c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726148245; x=1726753045; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NBv5JEt9GtBVg0TetdBOd9hVeWNnAfxyytk2a4R0tEY=;
        b=WekLCqIvfG6fMxYIlVnC6CSdUz+vwTLHpq6BF9N0+hzlMn9npQPaOkvYtQvdFp1SiT
         mHxyAUY9gSRaJNvFiw2Kg0nHiK6HVdQyVygRnuLEw1yI5wuyVdvIkityS9vOHebPWIxD
         m/pUVwo23FyCTcgPjmT1MM/KReAEOc81W8U1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726148245; x=1726753045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NBv5JEt9GtBVg0TetdBOd9hVeWNnAfxyytk2a4R0tEY=;
        b=ovvm3stv7AFhEqITIyPPg87/tYmgZf3JB1IYD6mlHoBo1OkgdEJwmF7S9Wrc29Fhwy
         kRv2IQLJDWZehz8vAzWJnq9SX5tQijcvtMLG37V2/8YD7bJpzngW3at+oE2mP1L4ZZOC
         tuwEPcdvw5inzBvuNaJJFM+JhdxEjqZ07153uNpzUm46Z0HomEXUnE0H/11ZD8dIGTTk
         psp5YUZJO/pa/JT1vfYzA2b3mkUycMxRQiMeMwKa7zLqAZO5vSr/nG6dGW9NQaI9rUEf
         O1xfpgOxgR+eXtJ9IAzbhN23qJlNpIOLld8vzkmKW3PNdZRogMIOsBPKhtN1JpTOraPd
         HUiw==
X-Gm-Message-State: AOJu0Ywhstqa4iPTyBnpl/WXGB9xW9w3JipoDc0mNr7vEEMlzdDHclG3
	eGEy6YMtQrll0s3b57ba+loKwkFQMKoUQ0Sd+pWF7hNHGYaSu1/5ZVcihYA7jxY=
X-Google-Smtp-Source: AGHT+IE28TtxUmZNNkbXPJOwzqi8bFJZsUD66rxkHlTGEkz1WLQV3xkFBqNN8hQ6/DmEsOfBuldTWQ==
X-Received: by 2002:a17:906:bc13:b0:a86:6cb1:4d49 with SMTP id a640c23a62f3a-a90294aca05mr282117866b.13.1726148244239;
        Thu, 12 Sep 2024 06:37:24 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:37:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] xen/keyhandler: Move key_table[] into __ro_after_init
Message-ID: <ZuLuk-Y3RKGZIi0d@macbook.local>
References: <20240912125154.1708025-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912125154.1708025-1-andrew.cooper3@citrix.com>

On Thu, Sep 12, 2024 at 01:51:54PM +0100, Andrew Cooper wrote:
> All registration is done at boot.  Almost...
> 
> iommu_dump_page_tables() is registered in iommu_hwdom_init(), which is called
> twice when LATE_HWDOM is in use.
> 
> register_irq_keyhandler() has an ASSERT() guarding againt multiple
> registration attempts, and the absence of bug reports hints at how many
> configurations use LATE_HWDOM in practice.
> 
> Move the registration into iommu_setup() just after printing the overall
> status of the IOMMU.  For starters, the hardware domain is specifically
> excluded by iommu_dump_page_tables().
> 
> ept_dump_p2m_table is registered in setup_ept_dump() which is non-__init, but
> whose sole caller, start_vmx(), is __init.  Move setup_ept_dump() to match.
> 
> With these two tweeks, all keyhandler reigstration is from __init functions,
> so register_{,irq_}keyhandler() can move, and key_table[] can become
> __ro_after_init.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
> 
> CC'ing some OpenXT folks just FYI.
> ---
>  xen/arch/x86/mm/p2m-ept.c       |  2 +-
>  xen/common/keyhandler.c         | 10 +++++-----
>  xen/drivers/passthrough/iommu.c |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
> index 2ea574ca6aef..21728397f9ac 100644
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -1497,7 +1497,7 @@ static void cf_check ept_dump_p2m_table(unsigned char key)
>      rcu_read_unlock(&domlist_read_lock);
>  }
>  
> -void setup_ept_dump(void)
> +void __init setup_ept_dump(void)

I would be tempted to just drop this function altogether and open-code
the call to register_keyhandler().

Thanks, Roger.

