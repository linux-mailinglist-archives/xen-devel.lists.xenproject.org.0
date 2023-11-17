Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160CF7EF3F0
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 15:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635219.991091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zNv-0004Ww-7h; Fri, 17 Nov 2023 13:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635219.991091; Fri, 17 Nov 2023 13:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zNv-0004Us-4K; Fri, 17 Nov 2023 13:59:51 +0000
Received: by outflank-mailman (input) for mailman id 635219;
 Fri, 17 Nov 2023 13:59:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3zNt-0004Q4-8t
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 13:59:49 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 922ae752-8551-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 14:59:48 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso17079705e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 05:59:48 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 y11-20020a056000108b00b0032dbf32bd56sm2400589wrw.37.2023.11.17.05.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 05:59:47 -0800 (PST)
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
X-Inumbo-ID: 922ae752-8551-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700229588; x=1700834388; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vvCY8h13XoTALu8clCwKllspHjOlIZ2eGl3yl6AZBjQ=;
        b=C+u7MoaNOjyCNOHqxxLNe+vwmK6uVnY2BqEVe0BCRDSAW3OeG2qnhiZnQYo6PTPBFc
         ugorJotDd6TzsvqQdc6dCN+2Md08uuTMYFbK2Czuj8pGfYH9zZofxOHZmtRA6K47Q5SR
         JIDYyGCQIpo+dfacxaXLuwzIvO49xC1lH0ins=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700229588; x=1700834388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvCY8h13XoTALu8clCwKllspHjOlIZ2eGl3yl6AZBjQ=;
        b=gw1BcKsbdELospocrk/9CdgpUfTdDWcvXyYCmbjcb+ISks0olEIQgAiItjvZPStB3r
         zchxd0AWRQ2gD/ZjqAGOZYOMtg+C7V+qBkJ8d6hEj6B8c90aDJw9FrazbLZB/DgoEhEf
         4camgKS68vJ9Xscs2fAzbqGMiC1bmYi70dHhkS7FqU9nhgvHBgh7OPICOX1BbH6C2WEh
         ATj3zBe4Xo/jLuLfg8Xkv5VTu8f9ZbBnd2K+VwH05w1t+gYDMT8MRtrXRut+q1o4PQy0
         rN3zH2dIqdGfBkOPd/3OxmQDiwdVuv/8XKNDOf+rJcYwqOev1DmxBT/eOmn/Em0hPzNc
         fl/A==
X-Gm-Message-State: AOJu0YxAto7ZueWjYakphiTklB6SFF/F1MEG06sHfB759qnR2G0CeyW/
	d4HEiLiCI7ehkCxhUQvPLVuOYQ==
X-Google-Smtp-Source: AGHT+IEdmirO+ih6qUxMBgj64KUoCSRiA/bHUWgwFEp+B1jU9BDKxPwcvHUF9YtJ435FHG9nJxQBog==
X-Received: by 2002:a05:600c:3ca2:b0:408:3c9e:44b7 with SMTP id bg34-20020a05600c3ca200b004083c9e44b7mr14782891wmb.3.1700229588197;
        Fri, 17 Nov 2023 05:59:48 -0800 (PST)
Date: Fri, 17 Nov 2023 14:59:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v10 01/17] pci: msi: pass pdev to pci_enable_msi()
 function
Message-ID: <ZVdx0udKRpPMtU9M@macbook.local>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-2-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012220854.2736994-2-volodymyr_babchuk@epam.com>

On Thu, Oct 12, 2023 at 10:09:14PM +0000, Volodymyr Babchuk wrote:
> Previously pci_enable_msi() function obtained pdev pointer by itself,
> but taking into account upcoming changes to PCI locking, it is better
> when caller passes already acquired pdev pointer to the function.

A bit more detail into why this matters for the upcoming locking
change would be useful here.

> Note that ns16550 driver does not check validity of obtained pdev
> pointer because pci_enable_msi() already does this.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in v10:
> 
>  - New in v10. This is the result of discussion in "vpci: add initial
>  support for virtual PCI bus topology"
> ---
>  xen/arch/x86/include/asm/msi.h |  3 ++-
>  xen/arch/x86/irq.c             |  2 +-
>  xen/arch/x86/msi.c             | 19 ++++++++++---------
>  xen/drivers/char/ns16550.c     |  4 +++-
>  4 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index a53ade95c9..836c8cd4ba 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -81,7 +81,8 @@ struct irq_desc;
>  struct hw_interrupt_type;
>  struct msi_desc;
>  /* Helper functions */
> -extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc);
> +extern int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
> +			  struct pci_dev *pdev);

Hard tabs (here and below).

I agree with Jan that it might be better for pdev to be the first
parameter.

Otherwise seems fine if the pdev is already in the caller context, as
we avoid an extra list walk.

Thanks, Roger.

