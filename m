Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47ABABC768
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 20:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990135.1374074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5db-0002Fv-Pe; Mon, 19 May 2025 18:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990135.1374074; Mon, 19 May 2025 18:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH5db-0002Cq-MM; Mon, 19 May 2025 18:54:59 +0000
Received: by outflank-mailman (input) for mailman id 990135;
 Mon, 19 May 2025 18:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH5da-0002Cj-1o
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 18:54:58 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c18fdbd5-34e2-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 20:54:56 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-601f278369bso2552657a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 11:54:56 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae39995sm6076089a12.72.2025.05.19.11.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 11:54:55 -0700 (PDT)
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
X-Inumbo-ID: c18fdbd5-34e2-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747680896; x=1748285696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PK03mMqj/0S146CdDeFCztdaufZ9Ig4GSYXkx7uJko=;
        b=SUgr68ZmQyHaXdEaR+8yUiFOAfnBzJ+1zQzLkQB9X607kC0VCq2Y0TDjfHkvDCPqdX
         saxOB6uJ0RosAATHDiqjLgMAr+P44W1xlJMWkaTr/JkRoUvT7RR8iVIUkn9uGgPa6W1N
         qr8h9Y3J/Kc1ARkFoXDSYaiKeOy11gI3kaGv++KslyEdmvUQsgf+sUW1fUprASPD5a1f
         w4ZEjagQQNsQFw6u9KSRaW7JBY7jcf0lluaEWTewL2RGMbptTphfI2mb6BTQOq7zAT/u
         JJAyXdwJ/YfMDyNbhUOd+Q1f7Dl/OqOabugIgJI8r14AM3Ake6hiktjg8sDXk7l5MY0Z
         IeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680896; x=1748285696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PK03mMqj/0S146CdDeFCztdaufZ9Ig4GSYXkx7uJko=;
        b=i0muksvN160qoOxOVwVL/tah0DffBWhIxndah99h+vYEBQoK2/jsilw7O0t71mdQCh
         mf6r8lh6ibnLDnElVY5jli/7VLTEGMBsi0PrzQ7ESvlAQ0/EbTzdp1rELbgvARY5fdi0
         LYtIRVhX+UMSqD8ktZWvuMuNEcte3qyisdZErElEYoImhML1yXpz6uMYEQLZeSAwTBmv
         b+g7PqfFww8gPNgT2PzgrwTfoPfajTVD+7qJT39Dz+jcYApso0bvS6KnstFbnk3r6ufq
         cHXGkSY+LTSKqAO/MFtebQyfftSWTP0LFMqh8/booCHCmClb0x0gp62xmdsI2qmESbP2
         xgOg==
X-Forwarded-Encrypted: i=1; AJvYcCWFnFaxOMVXqu1JQh/ogpZ6KT5fbG7PqFBrXPsJIbQrG25qHFtw79EgCbe6lQE8vQ0u+07ApDtLzoE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywl9Tejd8uiN+Cwb83wNnfBn7tVyae09rAq8PXG8zCN50yrfdlA
	zL4W6S8kJHcubI0q5Sxn+yJ38Zy800F1eydjrtFFRvWznrBHr44Pwb3/On5Fq+wTXQ==
X-Gm-Gg: ASbGncsLt/zGQHbc70KxSsPjN21DUNK/LpNgVNwr2tZmBXl00jJ48UdSgRyFct8IMwj
	LvWglCCF2rYkLEd/bh6cdVU1v147BO8VKBa0Q4AaipLKr3Zj6emmx5W8eN7k9XECmpzO01Bw4Td
	G3I2SDqptlopt4xIZrt6rcfNc9K+AHgzxYGglUyBSpo/uzVhQ8c7VrCV9FZyR43XvMxiLj6WIrz
	nIqGkmLJipeL500hNnR1TGiLtLFgtlfHvTVEbBY+X22Q1CUaDdXT8XSfK4qeDfFYiP6cvDSQeXg
	+DeLppgw8lf5RfyJ3K9wlUsJ5jWX8b/rW72NBg/ZbU9dQZOOLyCD3JREmcKcQQ==
X-Google-Smtp-Source: AGHT+IEOH7PUbOGQklXTnyGpdk04LH6cpNxSVHy3Eo28Zz5LxPUOR3xodbp2FNIkRQ4lyryKbTNXeQ==
X-Received: by 2002:a05:6402:5216:b0:5fc:954e:efb6 with SMTP id 4fb4d7f45d1cf-6008a39230dmr12211691a12.6.1747680895814;
        Mon, 19 May 2025 11:54:55 -0700 (PDT)
Message-ID: <092559d7-ddfd-44f2-9854-779770e24b8a@suse.com>
Date: Mon, 19 May 2025 20:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 5/8] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4f58bf9c47c40413ee9250c4cd21458382aac857.1747669845.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 17:50, Oleksii Moisieiev wrote:
> --- a/xen/arch/arm/firmware/sci.c
> +++ b/xen/arch/arm/firmware/sci.c
> @@ -126,6 +126,43 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>      return 0;
>  }
>  
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    struct dt_device_node *dev;
> +    int ret = 0;
> +
> +    switch ( domctl->cmd )
> +    {
> +    case XEN_DOMCTL_assign_device:
> +        ret = -EOPNOTSUPP;
> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
> +            break;
> +
> +        if ( !cur_mediator )
> +            break;
> +
> +        if ( !cur_mediator->assign_dt_device )
> +            break;
> +
> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
> +                                    domctl->u.assign_device.u.dt.size, &dev);
> +        if ( ret )
> +            return ret;
> +
> +        ret = sci_assign_dt_device(d, dev);
> +        if ( ret )
> +            break;

These two lines are pointless when directly followed by ...

> +
> +        break;

... this. Misra calls such "dead code" iirc.

> --- a/xen/arch/arm/include/asm/firmware/sci.h
> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> @@ -146,6 +146,14 @@ int sci_dt_finalize(struct domain *d, void *fdt);
>   * control" functionality.
>   */
>  int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
> +
> +/*
> + * SCI domctl handler
> + *
> + * Only XEN_DOMCTL_assign_device is handled for now.
> + */
> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  #else
>  
>  static inline bool sci_domain_is_enabled(struct domain *d)
> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
>      return 0;
>  }
>  
> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
> +{
> +    return 0;
> +}
> +
>  #endif /* CONFIG_ARM_SCI */
>  
>  #endif /* __ASM_ARM_SCI_H */

This being an Arm-specific header, how does ...

> @@ -851,6 +852,24 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_deassign_device:
>      case XEN_DOMCTL_get_device_group:
>          ret = iommu_do_domctl(op, d, u_domctl);
> +
> +        if ( !ret || ret == -EOPNOTSUPP )
> +        {
> +            int ret1;
> +            /*
> +             * Add chained handling of assigned DT devices to support
> +             * access-controller functionality through SCI framework, so
> +             * DT device assign request can be passed to FW for processing and
> +             * enabling VM access to requested device.
> +             * The access-controller DT device processing is chained after IOMMU
> +             * processing and expected to be executed for any DT device
> +             * regardless if DT device is protected by IOMMU or not (or IOMMU
> +             * is disabled).
> +             */
> +            ret1 = sci_do_domctl(op, d, u_domctl);

... this compile on non-Arm? I think I said so before: I don't like this
sitting in common code anyway. Is there really no way to put it in Arm-
specific code?

Jan

