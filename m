Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CACD8CCD8A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728167.1132993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3Ly-0002N9-4G; Thu, 23 May 2024 07:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728167.1132993; Thu, 23 May 2024 07:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA3Ly-0002Ks-1H; Thu, 23 May 2024 07:59:10 +0000
Received: by outflank-mailman (input) for mailman id 728167;
 Thu, 23 May 2024 07:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA3Lw-0002Km-G5
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:59:08 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54ae1ae2-18da-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:59:07 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-354f69934feso335156f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 00:59:07 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354cc7738dasm7502550f8f.18.2024.05.23.00.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:59:06 -0700 (PDT)
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
X-Inumbo-ID: 54ae1ae2-18da-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716451147; x=1717055947; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9VojLnm2ZfaWI+uLbpGHvHlkZwcZw8nsgXzGNTOqRY=;
        b=Rv6temIX4SiBdmedl+z2xj8qK0OS45mORKKITOuEn+L0LimhsrzeB/Kuw+zxoCgBMN
         zgls6B85BXrKDAT3hYsQUe1dLX3uaGAJVeh4MqwimkLPwfdnDwYPLuW6Y0nFCKK2YSIE
         dXAN1WNsgvaZbe2Yb5/2DawAKCKhtu3x+mWnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451147; x=1717055947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9VojLnm2ZfaWI+uLbpGHvHlkZwcZw8nsgXzGNTOqRY=;
        b=Ui1tVtKGE+zg6I3+accrafys64SgHWD2xKlPdUKWE9QBAtVfKl4HijvP6DCVzhUfZX
         uu0dmmLL33HFloOXc+SyXFIW9iIqgxUPAcQFjLTkBI9Z9WoO8N31x5mCWPDZflE8u1W0
         0BviuaBznVOQFkdSWkOw1ZSqfGFJ2h57VN3yR8kMRBzTgUDaPSxnhJ3K1sc2sku+72ho
         vHg3vEUlxKnvPaE1H7kylf+pp/E7Ipu0TsUOEIlW+50orQtkPmHe1gQhzBCnrsQowkan
         694CANzxGfw7Gjz0cWbWxlutwMvknucJtI/l6VKCGHhiq7DREaJohE9I+IHwcJeOPTXc
         qSCQ==
X-Gm-Message-State: AOJu0YxlyVvDb0niAyzfZ/A1nGTiqwM5lqgpXynjqcIdey71oBXxPD+4
	w2XiOSyEXdKR9pu3EoJoMVkjJ0hO3vp5Q+k/8XrzPL+BfcEgSVv7d3EDH+Tik94=
X-Google-Smtp-Source: AGHT+IHRqUPt9IBG8R7IU6KhIfJGNBPA14vbOwqsq+WDUwwF95zJO+zxekmdc0NiXGYScEdmeQeJmg==
X-Received: by 2002:adf:fd85:0:b0:351:d2e3:68e9 with SMTP id ffacd0b85a97d-354f74ffd53mr1237304f8f.1.1716451146892;
        Thu, 23 May 2024 00:59:06 -0700 (PDT)
Date: Thu, 23 May 2024 09:59:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v16 5/5] xen/arm: account IO handlers for emulated PCI
 MSI-X
Message-ID: <Zk73ScyJvdIrD_FN@macbook>
References: <20240522225927.77398-1-stewart.hildebrand@amd.com>
 <20240522225927.77398-6-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240522225927.77398-6-stewart.hildebrand@amd.com>

On Wed, May 22, 2024 at 06:59:24PM -0400, Stewart Hildebrand wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> At the moment, we always allocate an extra 16 slots for IO handlers
> (see MAX_IO_HANDLER). So while adding IO trap handlers for the emulated
> MSI-X registers we need to explicitly tell that we have additional IO
> handlers, so those are accounted.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> This depends on a constant defined in ("vpci: add initial support for
> virtual PCI bus topology"), so cannot be committed without the
> dependency.
> 
> Since v5:
> - optimize with IS_ENABLED(CONFIG_HAS_PCI_MSI) since VPCI_MAX_VIRT_DEV is
>   defined unconditionally
> New in v5
> ---
>  xen/arch/arm/vpci.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index 516933bebfb3..4779bbfa9be3 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -132,6 +132,8 @@ static int vpci_get_num_handlers_cb(struct domain *d,
>  
>  unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>  {
> +    unsigned int count;
> +
>      if ( !has_vpci(d) )
>          return 0;
>  
> @@ -152,7 +154,17 @@ unsigned int domain_vpci_get_num_mmio_handlers(struct domain *d)
>       * For guests each host bridge requires one region to cover the
>       * configuration space. At the moment, we only expose a single host bridge.
>       */
> -    return 1;
> +    count = 1;
> +
> +    /*
> +     * There's a single MSI-X MMIO handler that deals with both PBA
> +     * and MSI-X tables per each PCI device being passed through.
> +     * Maximum number of emulated virtual devices is VPCI_MAX_VIRT_DEV.
> +     */
> +    if ( IS_ENABLED(CONFIG_HAS_PCI_MSI) )
> +        count += VPCI_MAX_VIRT_DEV;

I think this was already raised in a previous version, at some point
you will need to consider making this a linker list or similar.  The
array is also not very helpful, as you still need to iterate over the
slots in order to find which handler should dispatch the access.

(Not that I oppose to this patch, but the handlers array cannot be
expanded indefinitely).

Thanks, Roger.

