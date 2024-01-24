Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA30983B300
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 21:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671226.1044473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSjow-0001Dm-FM; Wed, 24 Jan 2024 20:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671226.1044473; Wed, 24 Jan 2024 20:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSjow-0001AX-CI; Wed, 24 Jan 2024 20:26:02 +0000
Received: by outflank-mailman (input) for mailman id 671226;
 Wed, 24 Jan 2024 20:26:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zgc/=JC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rSjou-0001AR-Ir
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 20:26:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c82f4dbc-baf6-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 21:25:58 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e80046246so247915e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 12:25:58 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b0040e8800fcf3sm181958wmo.5.2024.01.24.12.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 12:25:57 -0800 (PST)
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
X-Inumbo-ID: c82f4dbc-baf6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706127957; x=1706732757; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDQCwhm+rWzxLsogpCruXYPPndOSKczdziyjfyIgJ/s=;
        b=FOFu2IdZomjsdvjtdQ8bkWgQhINvKumtzoSHS80i5ZovRRRu6DrA8ig0+YPZJl3Ufy
         /d2J32j5ov5Gl04lYFzFXULcGIZWaliHjmyH8yWBi1zn0Grcu3cIjBTJf2Nbc6OoqVFY
         /JYKYWlX8xeA79Pm8/4kqr9bvCVdVpHop0QkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706127957; x=1706732757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDQCwhm+rWzxLsogpCruXYPPndOSKczdziyjfyIgJ/s=;
        b=B6MHQqmXZlhUdl3teUBmOfPYTj/qzO15M1uzgz+346LxpmyIcIWKVcxjVZ4mbh/fi+
         HoaTFWW80AMjdiQqMJMThSXMLyZ5OkoQf8GfzJrBsHIeHGJPWw+iWXrgs+78Rdiq5t15
         IeQA5+FawzWc4NwGf9AT6yQRMmTGrrAdBB2bhhzw5S5SMkvgwO5XR1E+rBs7PJE6SvGM
         lvaJCh0hQhWdepig2oRHqi/zmZEZ5N9o3GTjyN69Hk9FUIhbk90cyy6DCNOOvezOez3j
         aWQ7CuzyUMnCoqfO/Jmf1oF4Ib45CrdWH2IHOY1vwhmE4rH1LVHsdc1TNdYffKTE1QVI
         U1Jw==
X-Gm-Message-State: AOJu0YyR/b60PMfftCz+OVT3HRz/98ucJEab+WtDXUg11GXMhcw5JueK
	22fBrec3lL9NLkO2F2Mw3Uf6v7H/d5vqtj7/ohgMRn8IB3tbWJ8f+ZaUmbc3JjE=
X-Google-Smtp-Source: AGHT+IEIp/e6E2fz8rpAqC1OQoAzpfGh2zAeC9HeWcvgF3gxF/a64zeK4rnEuvnkKbMthMmG6LWx1g==
X-Received: by 2002:a05:600c:acc:b0:40e:52cf:e7af with SMTP id c12-20020a05600c0acc00b0040e52cfe7afmr126140wmr.130.1706127957425;
        Wed, 24 Jan 2024 12:25:57 -0800 (PST)
Message-ID: <a289ae5e-0831-4f7b-8f04-df71af23ae0b@citrix.com>
Date: Wed, 24 Jan 2024 20:25:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2024 10:01 am, Mykyta Poturai wrote:
> diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
> index 797e0c6b29..4833e55bce 100644
> --- a/tools/include/xendevicemodel.h
> +++ b/tools/include/xendevicemodel.h
> @@ -236,6 +236,20 @@ int xendevicemodel_inject_msi(
>      xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr,
>      uint32_t msi_data);
>  
> +/**
> + * This function injects an MSI into a guest.
> + *
> + * @parm dmod a handle to an open devicemodel interface.
> + * @parm domid the domain id to be serviced
> + * @parm msi_addr the MSI address (0xfeexxxxx)

This 0xfeexxxxx is an x86-ism which I doubt is correct for ARM.  I'd
suggest dropping it from the comment.

> + * @parm source_id the PCI SBDF of the source device
> + * @parm msi_data the MSI data
> + * @return 0 on success, -1 on failure.
> +*/
> +int xendevicemodel_inject_msi2(
> +    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_t source_id,
> +    uint32_t msi_data, unsigned int source_id_valid);

The Source ID is always valid when making this call.  It is only within
the hypervisor itself that we may need to worry about the source ID
being invalid.

This means you don't have the flags field, and as a consequence, there's
no padding to worry about.

Also, the msi_ prefix to address and data are redundant.  Either drop
them, or put a prefix on source_id too, because we shouldn't be
inconsistent here.

> +
>  /**
>   * This function enables tracking of changes in the VRAM area.
>   *
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index 8e619eeb0a..17ad00c5d9 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -448,6 +448,28 @@ int xendevicemodel_set_irq_level(
>      return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>  }
>  
> +int xendevicemodel_inject_msi2(
> +    xendevicemodel_handle *dmod, domid_t domid, uint64_t msi_addr, uint32_t source_id,
> +    uint32_t msi_data, unsigned int source_id_valid)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_inject_msi2 *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op.op = XEN_DMOP_inject_msi2;
> +    data = &op.u.inject_msi2;
> +
> +    data->addr = msi_addr;
> +    data->data = msi_data;
> +    if ( source_id_valid ) {
> +        data->source_id = source_id;
> +        data->flags = XEN_DMOP_MSI_SOURCE_ID_VALID;
> +    }
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));

{
    struct xen_dm_op op = {
        .op = XEN_DMOP_inject_msi2,
        .u.inject_msi2 = {
            .addr = msi_addr,
            .data = msi_data,
            .source_id = source_id,
        },
    };

    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
}


> diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> index 462691f91d..a4a0e3dff9 100644
> --- a/xen/arch/x86/hvm/dm.c
> +++ b/xen/arch/x86/hvm/dm.c
> @@ -539,6 +540,18 @@ int dm_op(const struct dmop_args *op_args)
>          break;
>      }
>  
> +    case XEN_DMOP_inject_msi2:
> +    {
> +        const struct xen_dm_op_inject_msi2 *data =
> +            &op.u.inject_msi2;
> +
> +        if ( !(data->flags & XEN_DMOP_MSI_SOURCE_ID_VALID) )
> +            printk(XENLOG_WARNING "XEN_DMOP_inject_msi2: source_id is ignored\n");
> +
> +        rc = hvm_inject_msi(d, data->addr, data->data);

You need a prep patch adding a source id parameter into hvm_inject_msi().

The XEN_DMOP_inject_msi case can probably pass in 0 in the short term,
and it can probably be discarded internally.

As I said before, the source id doesn't matter until we start trying to
expose vIOMMUs to guests, at which point I suspect the easiest option
will simply to be to reject XEN_DMOP_inject_msi against a domain with a
vIOMMU and force Qemu/whatever in dom0 to use XEN_DMOP_inject_msi2.

~Andrew

