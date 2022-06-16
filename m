Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEC454DBB5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 09:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350437.576792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1jyn-0007Gx-RJ; Thu, 16 Jun 2022 07:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350437.576792; Thu, 16 Jun 2022 07:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1jyn-0007Dw-NO; Thu, 16 Jun 2022 07:31:49 +0000
Received: by outflank-mailman (input) for mailman id 350437;
 Thu, 16 Jun 2022 07:31:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4NK=WX=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o1jyl-0007Dq-Pr
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 07:31:47 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f21ba70-ed46-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 09:31:44 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id g25so1112423ejh.9
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jun 2022 00:31:44 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a056402070700b0042db87b5ff4sm1148344edx.88.2022.06.16.00.31.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 00:31:43 -0700 (PDT)
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
X-Inumbo-ID: 5f21ba70-ed46-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WR22BROo7BpVfHELY0/whUHHBl6+EosORE6LfOKACTA=;
        b=OUIhC3rE3NvkmStO46Q/ciAcnSAFfmmzP6mMCl8KhOx5/114KZw66r2dI7lB2gyO+U
         YXT28KvwmSKXDzmCe05V3bq/L/Y3f1XBHYAeP0y9oPsvzE+Mnc4nYi5nB4TbP4MKMtc8
         f5xaaw1QHZbVpoaEsehgITiq6iJ32F2JFZpoVZv0Il+WXqz/Z1am1BBJCmjmfYUBoTDS
         0SE7jkh/BYXhmawMxmwZRlMvKX2CV2izN1hK6D41/1IWf4fexcBZIGsNiexb9hsvtGTn
         KrLgdQrobJGLY+RnrU8RhvBYod40AWOcexwODDHmhFMrC9QzPjK69+a8RzJnqacf6K1U
         R4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WR22BROo7BpVfHELY0/whUHHBl6+EosORE6LfOKACTA=;
        b=aDJVqUvK++b4FeSiNhFg4ezGJ4nmEjuLZqfGNKiPVs9hF8iXXuhAxmSwD0BzxB9qPq
         SRuiebN2bzDd+03Ae6obHtnItkntc71CSV266ju7lHl2c2FYAFKwAPjr7AtbALHl9zd7
         jPHMkobzJpJ2WJtbHa8FXCmxW9urGdLbbkbPp+XfpnNuvNfcsgiwYHq5rtl/tdIT7xFm
         kcRa4dEwjau5/81sgH2y7V9UA+FizvQS/iTgJjh6P8c75HAwECzx0jGj695Gur6gpDth
         Ohx8Le3ejZTOdZfzOdqFPQPF8SUBfrXya7+E1DWWyr8TPORdfRhZubPHEzT+TZkz/gzk
         Pyvg==
X-Gm-Message-State: AJIora98owbTWNMT8mWbPEerR3yguKDyYOXvmAHdbnQ4roIgRcJefHNG
	6xSAq0SJyVKZ8tWCJULa+rk=
X-Google-Smtp-Source: AGRyM1s0/RHY2CxHyvPWA7qPtKPg63zpTc3tJxhXGQ31GmKyrOyZ12y3foJKnNWNWxsUEbgH4HVK6g==
X-Received: by 2002:a17:907:1694:b0:716:14a4:fba with SMTP id hc20-20020a170907169400b0071614a40fbamr3319578ejc.290.1655364703764;
        Thu, 16 Jun 2022 00:31:43 -0700 (PDT)
Subject: Re: [PATCH v2] xen: don't require virtio with grants for non-PV
 guests
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 viresh.kumar@linaro.org, hch@infradead.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20220616053715.3166-1-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <573c2d9f-8df0-0e0f-2f57-e8ea85e403b4@gmail.com>
Date: Thu, 16 Jun 2022 10:31:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220616053715.3166-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 16.06.22 08:37, Juergen Gross wrote:


Hello Juergen

> Commit fa1f57421e0b ("xen/virtio: Enable restricted memory access using
> Xen grant mappings") introduced a new requirement for using virtio
> devices: the backend now needs to support the VIRTIO_F_ACCESS_PLATFORM
> feature.
>
> This is an undue requirement for non-PV guests, as those can be operated
> with existing backends without any problem, as long as those backends
> are running in dom0.
>
> Per default allow virtio devices without grant support for non-PV
> guests.
>
> Add a new config item to always force use of grants for virtio.
>
> Fixes: fa1f57421e0b ("xen/virtio: Enable restricted memory access using Xen grant mappings")
> Reported-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - remove command line parameter (Christoph Hellwig)
> ---
>   drivers/xen/Kconfig | 9 +++++++++
>   include/xen/xen.h   | 2 +-
>   2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index bfd5f4f706bc..a65bd92121a5 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -355,4 +355,13 @@ config XEN_VIRTIO
>   
>   	  If in doubt, say n.
>   
> +config XEN_VIRTIO_FORCE_GRANT
> +	bool "Require Xen virtio support to use grants"
> +	depends on XEN_VIRTIO
> +	help
> +	  Require virtio for Xen guests to use grant mappings.
> +	  This will avoid the need to give the backend the right to map all
> +	  of the guest memory. This will need support on the backend side
> +	  (e.g. qemu or kernel, depending on the virtio device types used).
> +
>   endmenu
> diff --git a/include/xen/xen.h b/include/xen/xen.h
> index 0780a81e140d..4d4188f20337 100644
> --- a/include/xen/xen.h
> +++ b/include/xen/xen.h
> @@ -56,7 +56,7 @@ extern u64 xen_saved_max_mem_size;
>   
>   static inline void xen_set_restricted_virtio_memory_access(void)
>   {
> -	if (IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_domain())
> +	if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_pv_domain())
>   		platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);


Looks like, the flag will be *always* set for paravirtualized guests 
even if CONFIG_XEN_VIRTIO disabled.

Maybe we should clarify the check?


if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || 
IS_ENABLED(CONFIG_XEN_VIRTIO) && xen_pv_domain())

     platform_set(PLATFORM_VIRTIO_RESTRICTED_MEM_ACCESS);


>   }
>   

-- 
Regards,

Oleksandr Tyshchenko


