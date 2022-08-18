Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE4598E20
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 22:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389775.626900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOmFr-0004d7-KL; Thu, 18 Aug 2022 20:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389775.626900; Thu, 18 Aug 2022 20:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOmFr-0004b5-Hh; Thu, 18 Aug 2022 20:36:39 +0000
Received: by outflank-mailman (input) for mailman id 389775;
 Thu, 18 Aug 2022 20:36:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIxV=YW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oOmFp-0004az-Sv
 for xen-devel@lists.xen.org; Thu, 18 Aug 2022 20:36:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73772405-1f35-11ed-9250-1f966e50362f;
 Thu, 18 Aug 2022 22:36:36 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id h5so2191350wru.7
 for <xen-devel@lists.xen.org>; Thu, 18 Aug 2022 13:36:35 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c355500b003a5ee64cc98sm7703409wmq.33.2022.08.18.13.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 13:36:33 -0700 (PDT)
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
X-Inumbo-ID: 73772405-1f35-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=olIvJPp8eA89GdGIY34PQBto9ZqOlKYHltNsLmTpxCs=;
        b=GNWT2peWVDTGYiPgDr/qrxtG4g26p5LsbJVJ8lTiKFLdqgUc8NKQbOG/inCzDu1vx5
         UmzaHLJIx3I0myB9KHyIMRdaE7Pb8Zepdt7vGW1AO4X3miFw3dx1+lta40zmoEQgrrLJ
         qxn1FaW8YAWRrp2E8C1qe638nkXs7z7qxOo25/MjYR811yX9Ub0gD6XdYlKSG5kkHndK
         HzFbwnN8JfecwKmSs4CJH3HPLX1ZpFpHU6DQiFuT+lYPLjwheSPOE7TmKhVdW+Fe+ETt
         y1HeTZ7KOfSsVfbwqYfOVn5pC3Ebd4W8+mOMxlADhijgd8tQqWLrXiTzCnYfneLTaMel
         A96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=olIvJPp8eA89GdGIY34PQBto9ZqOlKYHltNsLmTpxCs=;
        b=Tld9O8t/ip5g5yOXLj3a6ikdJPxuGvx047lASNbrZsmZVu/PBuh2fq1qd6XOYELafW
         fArxPT4OC02vIPaPlUZ4cq5P7w1VZa5AguqgmMDBbPBOi0cZddz1fR7LLvdmm8AA6cCI
         u6n8iw6Zl22S/tjAW2k2P3m0spyK6YI2OLm1evDTj0nKjXoT5/gK+V8ylALmJ19ql+Qr
         oMCh76rp4/ihOC03QhxxA0PsYwe8TnAi8EGttXnv307OtjJZC/YoR2f0qfF9+XV5zB+j
         jS1g0NrKQciXRSw2abGlLWOkywAdOV7IcYsFQ7h0TPpSv0YQirm4jqd0PPLXdEP26k+s
         1aqA==
X-Gm-Message-State: ACgBeo2EeN1tohAoW7hcq8SXTwDjaa3Pc3/YGvBmntDxcFHF3S8VC4p9
	OgbC9G/XPkG+OEnYuPYrjkQ=
X-Google-Smtp-Source: AA6agR6HfsMjpJaFIKmYybWRKgQhH5UnnjdNt9uBc76PpsqkOjWo+QtiIt2NlYMIhlbuapscmvvrPg==
X-Received: by 2002:a05:6000:1f1d:b0:221:6c4c:4995 with SMTP id bv29-20020a0560001f1d00b002216c4c4995mr2573310wrb.675.1660854994502;
        Thu, 18 Aug 2022 13:36:34 -0700 (PDT)
Message-ID: <e353deb6-1de0-c575-df4b-02efa5972bc5@gmail.com>
Date: Thu, 18 Aug 2022 23:36:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V4 4/6] libxl: arm: Split make_virtio_mmio_node()
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, xen-devel@lists.xen.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 stratos-dev@op-lists.linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Stefano Stabellini
 <stefano.stabellini@xilinx.com>, Mathieu Poirier
 <mathieu.poirier@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
 <25fa5be0459f2f790f8420540840ea951a2f872e.1660023094.git.viresh.kumar@linaro.org>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <25fa5be0459f2f790f8420540840ea951a2f872e.1660023094.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09.08.22 08:34, Viresh Kumar wrote:

Hello Viresh

> make_virtio_mmio_node() creates the DT node for simple MMIO devices
> currently, i.e. the ones that don't require any additional properties.
>
> In order to allow using it for other complex device types, split the
> functionality into two, one where the fdt node isn't closed and the
> other one to create a simple DT node.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   tools/libs/light/libxl_arm.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 4a750852b671..891cb6ef2674 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -899,9 +899,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
>       return 0;
>   }
>   
> -static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
> -                                 uint64_t base, uint32_t irq,
> -                                 uint32_t backend_domid)
> +static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
> +                                        uint32_t irq, uint32_t backend_domid)


Nit: I would probably add a comment on top of this function that fdt 
node isn't completed (closed) after the function returns,

so the caller should take care of completing it.


>   {
>       int res;
>       gic_interrupt intr;
> @@ -934,10 +933,18 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>           if (res) return res;
>       }
>   
> -    res = fdt_end_node(fdt);
> +    return res;
> +}
> +
> +static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
> +                                        uint32_t irq, uint32_t backend_domid)
> +{
> +    int res;
> +
> +    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
>       if (res) return res;
>   
> -    return 0;
> +    return fdt_end_node(fdt);
>   }
>   
>   static const struct arch_info *get_arch_info(libxl__gc *gc,
> @@ -1260,8 +1267,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                       iommu_created = true;
>                   }
>   
> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> -                                           disk->backend_domid) );
> +                FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
> +                                            disk->irq, disk->backend_domid) );

Nit: Something wrong with the indentation


>               }
>           }


Preferably with above fixed:

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


>   

-- 
Regards,

Oleksandr Tyshchenko


