Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC35380B0F
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 16:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127375.239386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYSP-0007q3-T1; Fri, 14 May 2021 14:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127375.239386; Fri, 14 May 2021 14:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhYSP-0007nT-Pz; Fri, 14 May 2021 14:06:25 +0000
Received: by outflank-mailman (input) for mailman id 127375;
 Fri, 14 May 2021 14:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhYSO-0007nN-MW
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 14:06:24 +0000
Received: from mail-il1-x135.google.com (unknown [2607:f8b0:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc75dba8-8282-4ae5-b591-f51a0c9a032b;
 Fri, 14 May 2021 14:06:23 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id w7so9182911ilg.13
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 07:06:23 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id q18sm3094808ile.33.2021.05.14.07.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 07:06:23 -0700 (PDT)
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
X-Inumbo-ID: bc75dba8-8282-4ae5-b591-f51a0c9a032b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=p778h4mDEFACoY3jLIwbbMe6YCGbmf3vLibN4Bx2pk4=;
        b=nC8L4dQI89t4hzo3h+eXBqlhwLeHOghclMnHjZf+MAel5fuBM81cHhC1O25S5hW/il
         y96X3yCwwkPOdCOdVOy2asoa6gkK69mX1zff9NAlBLl6K+ClrrnSIn1pVwCH6EoKLNMJ
         kMe5RzAkqe7zgOFW/n9XniT6aIBB+GbQDxNcqMhouZEzOJyZo7/0X44tVsriScZCPh3D
         eZXSjREmV6hTeRWC6KuC+K3z85BfiZDhfLKc5qkOCbPNf65/8M4wf4Bcl1r7d+8VypAA
         0B6vBnLdxAC1qVfWxaecdHwSerGPqiAm9NE0QV+Oj6VJuXDBQL3C90Bk3+BJ5otjkZgr
         6r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=p778h4mDEFACoY3jLIwbbMe6YCGbmf3vLibN4Bx2pk4=;
        b=tA/CQcjD3k9xDCK6Kq8J21Z+d6NOnpyraC9IA/bsor6YbCLbW9EPZVABC75khTZ22c
         9HC1Cn3taki1Eu1K9YBbefQrdcD+eAqQmUWRcq3rwSSTbnYKb3FCt91L+29CnffUKZlT
         yksBppX+ihZWc8HYPSk8V+4vlKQETB8mTIZy0XHqJoZzzUMi0i8kx3gAmTy77otJqSio
         cE5S9/wdLy+c6JKFb1Z66B8OtAZQu51ESvp8BTh8xjdTgYp8Pg+AsQ1pW+z4o7041rpB
         WyEGMBn4dGnB0g6gV5KRJU+6A7yMofXNpfDd8oDefFn0lg9Hof5ro1zFjPmAWbx8NLqQ
         PJog==
X-Gm-Message-State: AOAM531XYhyScIKGSqBCP/8RX/+UUV4fsnf2J11IXHOUV68gJBfoZdDZ
	4jpAf5eR8ew4lMKiZIoQQdY=
X-Google-Smtp-Source: ABdhPJzjePt6YwBAYgds4Vy4ai2dQpEtXYwz25hrD40aPq72dVFwZx8fW0JmXwVyeb7KNXlrQUn6AQ==
X-Received: by 2002:a92:ce90:: with SMTP id r16mr41615408ilo.220.1621001183633;
        Fri, 14 May 2021 07:06:23 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] xen: Export dbgp functions when CONFIG_XEN_DOM0 is
 enabled
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
 <291659390aff63df7c071367ad4932bf41e11aef.1620952511.git.connojdavis@gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <236c31fe-2373-be23-bed4-48012a6a9765@gmail.com>
Date: Fri, 14 May 2021 08:06:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <291659390aff63df7c071367ad4932bf41e11aef.1620952511.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Adding Greg and linux-usb

On 5/13/21 6:56 PM, Connor Davis wrote:
> Export xen_dbgp_reset_prep and xen_dbgp_external_startup
> when CONFIG_XEN_DOM0 is defined. This allows use of these symbols
> even if CONFIG_EARLY_PRINK_DBGP is defined.
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> Acked-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/xen/dbgp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/xen/dbgp.c b/drivers/xen/dbgp.c
> index cfb5de31d860..fef32dd1a5dc 100644
> --- a/drivers/xen/dbgp.c
> +++ b/drivers/xen/dbgp.c
> @@ -44,7 +44,7 @@ int xen_dbgp_external_startup(struct usb_hcd *hcd)
>   	return xen_dbgp_op(hcd, PHYSDEVOP_DBGP_RESET_DONE);
>   }
>   
> -#ifndef CONFIG_EARLY_PRINTK_DBGP
> +#if defined(CONFIG_XEN_DOM0) || !defined(CONFIG_EARLY_PRINTK_DBGP)
>   #include <linux/export.h>
>   EXPORT_SYMBOL_GPL(xen_dbgp_reset_prep);
>   EXPORT_SYMBOL_GPL(xen_dbgp_external_startup);

