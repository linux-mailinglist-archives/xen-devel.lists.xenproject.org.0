Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1FD506C97
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 14:38:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308097.523632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngn6w-0007TU-9L; Tue, 19 Apr 2022 12:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308097.523632; Tue, 19 Apr 2022 12:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngn6w-0007RR-6A; Tue, 19 Apr 2022 12:37:38 +0000
Received: by outflank-mailman (input) for mailman id 308097;
 Tue, 19 Apr 2022 12:37:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr1R=U5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ngn6u-0007RI-M1
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 12:37:36 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d63112d-bfdd-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 14:37:35 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id w1so5753037lfa.4
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 05:37:35 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a198c52000000b0046fbc14aaf0sm1221784lfj.114.2022.04.19.05.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 05:37:34 -0700 (PDT)
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
X-Inumbo-ID: 7d63112d-bfdd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jiC7Im7AQQbt7mNyNWlASOoQbbmpWO5m1GeN9ukK2DA=;
        b=HsrTiQ9TVtBpRqfvZhhAc3Pzgr6sG/FOHGeX5vFZdhDT4BTaXoYKaZHyynAWuHlioF
         5pvSPNb7V+dOFwDnOTrND8a2eEwQAVfGdMaTCTtJJGukbTE5dFVSUrVEAMJLwpSpJHX4
         roH0Nz22DS1k0j5U50rgFw+jFG4CHWQOuWjMKl+a1LDNGXKy0SrAZWs5fclsuvy6jlkh
         CSLd68aBoo9Ana6pOW8VyyhkgzFkoMh4Npg9GUzhyGQDF3OQF9KERkAXvQy3p4RJp/7F
         N4z4A+UDQ1jsIRjphNmdUTlU6ADmyThHwYY5rB2tt34NcO4h1KP9V3qnDcgBbv+Zo9JJ
         tJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jiC7Im7AQQbt7mNyNWlASOoQbbmpWO5m1GeN9ukK2DA=;
        b=W8AVAiQ0T+9ZV79APgVFZhDhg+vt5ZbwP77nfkhYzrJl/aJKd6cTmtKzEhtMffyqXf
         dtdvUWxlMF5jDSJWunAlbWMe7ilJhJk/JSkF5eL5qoiySdFoywea6lhWUXqiASBCe8Tx
         TFrzYKm73s3D4Vg2cKnaKcPOhLUxMU8VHtdWJ9jRYtlXR94jllKI4i49WgKGXqmYvSOi
         h6IhwCKSUPcoG4ztJ5aSnPnoVawm2tgv6TaxO2Agwk8nmcUWSFj3sO7k4z1tpqe/vcJE
         Z5U2G5USUIhdfVqpjgbd+VR+6X/z1Ku2d9Dwt/V7D7wHvAPyEtLShKFV2+oVZFL4Y1ct
         nhbw==
X-Gm-Message-State: AOAM533g/bK0VNpfUsIy3AELm8E5tV77AoAkQNE7kVilKnAyaCR0KTqp
	nQjS7NVx3HC4W4hPp29nhpY=
X-Google-Smtp-Source: ABdhPJzWT8ctc8ahHLqpBj1vfyk1hMfUozdSXRqu+YRd5PbOofVw5OQheI2VbYnNTLmIrsa4/QZeug==
X-Received: by 2002:ac2:4c49:0:b0:46d:db3:98cb with SMTP id o9-20020ac24c49000000b0046d0db398cbmr11002352lfk.516.1650371855153;
        Tue, 19 Apr 2022 05:37:35 -0700 (PDT)
Subject: Re: [RFC PATCH] libxl/arm: Insert "xen,dev-domid" property to
 virtio-mmio device node
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1649964960-24864-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204181445300.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <89655e41-d9f6-06b6-1e63-f810689d154f@gmail.com>
Date: Tue, 19 Apr 2022 15:37:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204181445300.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 19.04.22 00:47, Stefano Stabellini wrote:


Hello Stefano

> On Thu, 14 Apr 2022, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This is needed for grant table based DMA ops layer (CONFIG_XEN_VIRTIO)
>> at the guest side to retrieve the ID of Xen domain where the corresponding
>> backend resides (it is used as an argument to the grant table APIs).
>>
>> This is a part of restricted memory access under Xen feature.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> I think this looks good overall.

thank you


>   Instead of mentioning details of the
> Linux implementation, we should mention the device tree binding instead,
> including a link to it. The device tree binding is the relevant spec in
> this case.

I got it, while new device tree binding is not approved yet, I should 
have inserted a link to the corresponding Linux commit.

https://lore.kernel.org/xen-devel/1649963973-22879-4-git-send-email-olekstysh@gmail.com/


>
>
>> ---
>> !!! This patch is based on non upstreamed yet “Virtio support for toolstack
>> on Arm” series which is on review now:
>> https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/
>>
>> All details are at:
>> https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
>> ---
>>   tools/libs/light/libxl_arm.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index 8132a47..d9b26fc 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -875,7 +875,8 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
>>   
>>   
>>   static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>> -                                 uint64_t base, uint32_t irq)
>> +                                 uint64_t base, uint32_t irq,
>> +                                 uint32_t backend_domid)
>>   {
>>       int res;
>>       gic_interrupt intr;
>> @@ -900,6 +901,14 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
>>       res = fdt_property(fdt, "dma-coherent", NULL, 0);
>>       if (res) return res;
>>   
>> +    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
>> +        uint32_t domid[1];
>> +
>> +        domid[0] = cpu_to_fdt32(backend_domid);
>> +        res = fdt_property(fdt, "xen,dev-domid", domid, sizeof(domid));
>> +        if (res) return res;
>> +    }
>> +
>>       res = fdt_end_node(fdt);
>>       if (res) return res;
>>   
>> @@ -1218,7 +1227,8 @@ next_resize:
>>               libxl_device_disk *disk = &d_config->disks[i];
>>   
>>               if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
>> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
>> +                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
>> +                                           disk->backend_domid) );
>>           }
>>   
>>           if (pfdt)
>> -- 
>> 2.7.4

-- 
Regards,

Oleksandr Tyshchenko


