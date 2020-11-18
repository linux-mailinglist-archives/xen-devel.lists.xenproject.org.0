Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52292B7D57
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 13:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29771.59426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfMHF-0006AK-TV; Wed, 18 Nov 2020 12:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29771.59426; Wed, 18 Nov 2020 12:09:33 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfMHF-00069t-Nm; Wed, 18 Nov 2020 12:09:33 +0000
Received: by outflank-mailman (input) for mailman id 29771;
 Wed, 18 Nov 2020 12:09:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUXV=EY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kfMHD-00069g-Jw
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:09:31 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7c65bfb-658f-45e7-b01d-e03dd5fbf487;
 Wed, 18 Nov 2020 12:09:30 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 11so2097052ljf.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 04:09:30 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w12sm3389818ljo.67.2020.11.18.04.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 04:09:29 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LUXV=EY=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kfMHD-00069g-Jw
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 12:09:31 +0000
X-Inumbo-ID: b7c65bfb-658f-45e7-b01d-e03dd5fbf487
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b7c65bfb-658f-45e7-b01d-e03dd5fbf487;
	Wed, 18 Nov 2020 12:09:30 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 11so2097052ljf.2
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 04:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=zbNp9xUN0gaWpF3LGCgicDWp/VRu0vl+zxACBaRYRYM=;
        b=Lr7Cw9ANWDFnsRZSlnpOwJsZDGilyK2iklhXvlkCs7MTP7IGq1lwsSUsAYfZcRFRYc
         OLi0ZvATkplcapk28aqMfdlXnWgBvRi56+7fJ/hCdmM4KlKChpbOjUhHtrleUGvdf4Y0
         WFgEcxf7IF1wE7AxhCW7hdDXSK+qjTtutW017gOsOl+vIY375yoeodwEXW2cxTM+v2EG
         4A/6DLXHHqp/8Dvx2xglhUPPgmYO+0LZ320BLsU4OTAXO8WYWPIyU/ocRchtj22nZmCv
         nF3kdd9p6KkP1jkzodT1etJpNiQ4j6XG/pwPXgtisuhVCf1yRXAJs3EXdVVD7aUdMxQZ
         HLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=zbNp9xUN0gaWpF3LGCgicDWp/VRu0vl+zxACBaRYRYM=;
        b=VYZEAJjj3RXrgqkhEk7iDvKZ0j/lxkA6+YLMBIlbXPb2cx9Kn8UFnZz9UdElRBbUvP
         uwv/p6+PkAb0M/tqkGiZ2djNvDzdMu3F0UKA8uev8+TKnARrynzqpWiX79gRlWBhfDhu
         2rvObTVnNKgGXtwWp1Lc6kGoJbhxOk76ez2dt06JBm42WnUBsmFnRo5T7I5S+082oS2y
         CTdO05axIxQXQPwmWejmjyzbrOMRmT0v7dz4ssi9Gol/ylBulkpdyi0PMT+ezouKYaWi
         iyycLZeYrwjiWSiuS0Ry2AwI+b48kV12Sic2TlQBKF7RnpgvJDu6gBx7MQC0I3zYfNlR
         Mtvw==
X-Gm-Message-State: AOAM530LqK5i4MZaAsG6VszPnXfhE6PXI+ncTZXeqMkIp57f9rmq1tj+
	xb6zovXMou7Znd0V67wVPaQ=
X-Google-Smtp-Source: ABdhPJxxD5phpqt+I9oC2LUnEmdBYKa47nu9jFbjg5/QOh1mgsbnTfr0m/nmBqr/ePxzUXN0hhydRw==
X-Received: by 2002:a2e:580d:: with SMTP id m13mr1169660ljb.200.1605701369585;
        Wed, 18 Nov 2020 04:09:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id w12sm3389818ljo.67.2020.11.18.04.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 04:09:29 -0800 (PST)
Subject: Re: [PATCH V2 07/23] xen/ioreq: Move x86's ioreq_gfn(server) to
 struct domain
From: Oleksandr <olekstysh@gmail.com>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-8-git-send-email-olekstysh@gmail.com>
Message-ID: <79588865-3f28-5436-0763-cb8ee0b87262@gmail.com>
Date: Wed, 18 Nov 2020 14:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-8-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Paul.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -314,6 +314,8 @@ struct sched_unit {
>   
>   struct evtchn_port_ops;
>   
> +#define MAX_NR_IOREQ_SERVERS 8
> +
>   struct domain
>   {
>       domid_t          domain_id;
> @@ -521,6 +523,21 @@ struct domain
>       /* Argo interdomain communication support */
>       struct argo_domain *argo;
>   #endif
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +    /* Guest page range used for non-default ioreq servers */
> +    struct {
> +        unsigned long base;
> +        unsigned long mask;
> +        unsigned long legacy_mask; /* indexed by HVM param number */
> +    } ioreq_gfn;

I assume the whole ioreq_gfn struct doesn't need to be here. According 
to the new requirement to leave legacy interface x86 specific,

these fields won't be used in common code anymore. I will move ioreq_gfn 
struct back to hvm_domain. Please confirm.


> +
> +    /* Lock protects all other values in the sub-struct and the default */
> +    struct {
> +        spinlock_t              lock;
> +        struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
> +    } ioreq_server;
> +#endif
>   };
>   
>   static inline struct page_list_head *page_to_list(

-- 
Regards,

Oleksandr Tyshchenko


