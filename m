Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1499B546A63
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 18:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346569.572405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzhXc-0006mp-FI; Fri, 10 Jun 2022 16:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346569.572405; Fri, 10 Jun 2022 16:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzhXc-0006jX-CJ; Fri, 10 Jun 2022 16:31:20 +0000
Received: by outflank-mailman (input) for mailman id 346569;
 Fri, 10 Jun 2022 16:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yiYo=WR=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nzhXb-0006jR-BF
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 16:31:19 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1260cba-e8da-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 18:31:18 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id a15so43651945lfb.9
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jun 2022 09:31:18 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a2e2c11000000b00253c8dfc4e4sm4058265ljs.101.2022.06.10.09.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 09:31:17 -0700 (PDT)
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
X-Inumbo-ID: c1260cba-e8da-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LkW9L+XI0DD7Z3As1v74N/7Z7Ki8b6HSjzj0N3Bcz+g=;
        b=aWaTGFi3/2MIsnW2tZ4Cg5NJb+wPxqCVRugeiD1BzAP4CMZIAsdgffkdUq16YSfd0j
         CzY38GOaZow+wqYnIQNHnbF0tfqI9naNuqRm4zRFd6e6TZvwf/UIAyRzDV5KHWN3dGJI
         ir9LwRoY9dOLF0GAYRNyNlUXi/QsuyMkKV7+YJ8LFYtamLHYeaLMSvdgWRWUq7V4eJBK
         QUvhhdcIEf57/hBI3tHELPVvKx/vVmQegPlncjD9Suvaq3IdaxfGaf0d1WO3Oj2N45MJ
         kzV8hY6eolxmNmrZmAnNv2fpBtqOxDm/l67jF33o7LmNUvF3a+KG5wq5OfooL7PA/qdi
         RS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LkW9L+XI0DD7Z3As1v74N/7Z7Ki8b6HSjzj0N3Bcz+g=;
        b=hq/7WsbFJba8+ReXDL+cYulIU5QAPHkYSrLRAxhgtTB6uHRXNNOjCl/Omx4i8l4z9D
         SRysFEeA+dY174Iawjbn89bZ4OcvE4q8oK/bFGOH2lDNXtmb174k3bh23rnlV4+CMtRB
         saOpRXnjAPPyL/TspUvEL0HzQ6l6pGEdBLw5MEHMtm2V5RErHQ4hQ8LIRIqFdPgdvVYT
         DhpUToeTVNA3klwt8m6DTA4nVai01HU2Oa0QrIfK5iPo0AtKwUgtMJIQ1tH4m4iWRCZX
         fWh4ziyGPIwNLV06PSM7qEpiB/K1d+Bc+NOxvGwruwyjHQZ0UtHdYknzyylGvO1Vtrn1
         1U1w==
X-Gm-Message-State: AOAM530WUecf40uqasnKece8Uo3Cvo+x32aP0Do0uBKFAxTVGxCY/E7s
	0zFATxSMaGxiCkXHjjIOzio=
X-Google-Smtp-Source: ABdhPJwB+iCQfBiQ7fJzk2l4t07NBiXJthfVlZ/L3wGB6wMtbnIJAOXH1lh2MIZ86yp0J6HYDpW1Fw==
X-Received: by 2002:a05:6512:3d27:b0:478:f60f:7e8a with SMTP id d39-20020a0565123d2700b00478f60f7e8amr28130899lfv.294.1654878677806;
        Fri, 10 Jun 2022 09:31:17 -0700 (PDT)
Subject: Re: [PATCH V2] libxl/arm: Create specific IOMMU node to be referred
 by virtio-mmio device
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1653944813-17970-1-git-send-email-olekstysh@gmail.com>
 <YqNvh4bprAh7W/c1@perard.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <562bd256-2dcd-33fe-f537-e3186023ffa5@gmail.com>
Date: Fri, 10 Jun 2022 19:31:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YqNvh4bprAh7W/c1@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 10.06.22 19:21, Anthony PERARD wrote:

Hello Anthony

> On Tue, May 31, 2022 at 12:06:53AM +0300, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Reuse generic IOMMU device tree bindings to communicate Xen specific
>> information for the virtio devices for which the restricted memory
>> access using Xen grant mappings need to be enabled.
>>
>> Insert "iommus" property pointed to the IOMMU node with "xen,grant-dma"
>> compatible to all virtio devices which backends are going to run in
>> non-hardware domains (which are non-trusted by default).
>>
>> Based on device-tree binding from Linux:
>> Documentation/devicetree/bindings/iommu/xen,grant-dma.yaml
>>
>> The example of generated nodes:
>>
>> xen_iommu {
>>      compatible = "xen,grant-dma";
>>      #iommu-cells = <0x01>;
>>      phandle = <0xfde9>;
>> };
>>
>> virtio@2000000 {
>>      compatible = "virtio,mmio";
>>      reg = <0x00 0x2000000 0x00 0x200>;
>>      interrupts = <0x00 0x01 0xf01>;
>>      interrupt-parent = <0xfde8>;
>>      dma-coherent;
>>      iommus = <0xfde9 0x01>;
>> };
>>
>> virtio@2000200 {
>>      compatible = "virtio,mmio";
>>      reg = <0x00 0x2000200 0x00 0x200>;
>>      interrupts = <0x00 0x02 0xf01>;
>>      interrupt-parent = <0xfde8>;
>>      dma-coherent;
>>      iommus = <0xfde9 0x01>;
>> };
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> The patch looks fine.
>
>> ---
>> !!! This patch is based on non upstreamed yet “Virtio support for toolstack
>> on Arm” V8 series which is on review now:
>> https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/
> With the patch added to the series it depends on: Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks!


I will send V3 anyway (there is a comment from Julien here). But I will 
send it together with the related series:

https://lore.kernel.org/xen-devel/1654106261-28044-1-git-send-email-olekstysh@gmail.com/


>
> Thanks,
>
-- 
Regards,

Oleksandr Tyshchenko


