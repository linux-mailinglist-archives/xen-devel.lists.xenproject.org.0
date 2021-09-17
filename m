Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E040F9F6
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 16:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189442.339149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mREY9-00021a-4C; Fri, 17 Sep 2021 14:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189442.339149; Fri, 17 Sep 2021 14:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mREY9-0001zn-0E; Fri, 17 Sep 2021 14:09:09 +0000
Received: by outflank-mailman (input) for mailman id 189442;
 Fri, 17 Sep 2021 14:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmcU=OH=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mREY7-0001zh-Ve
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 14:09:08 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb8ec25e-8fbe-4602-b83e-833a312ac6b2;
 Fri, 17 Sep 2021 14:09:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i4so33588863lfv.4
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 07:09:06 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z3sm587071lfe.50.2021.09.17.07.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 07:08:32 -0700 (PDT)
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
X-Inumbo-ID: fb8ec25e-8fbe-4602-b83e-833a312ac6b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=876uV0C2rcWmwrVuv5sB0QCkT2DUPnwIqbxAymkbhGY=;
        b=I0354vm+ZXAn9OXlZSPSjslFLeojEIM6bJ3IUjMQyBurtJMsGtgHJuvTEOeN5qq+2y
         da6kMnMRke9I1+S96RODEc9Km9BC73WDrrPkTISxuE15KISsVgLf2GuR9jDZxXNZqhTb
         mkXwJeYt1ZEx2p7mruFv2L450X55LFz19VMcRHnhJTA96KjQGfQEMwcisrx4fTvEBCAV
         Ir8mRxORZNRQuYX7A1EuqEKr3bmQdZQjliZVQA3nQ/4c7vAtiVXYNyaZaZJ6TNyn55S8
         1OLJgCLLZSQTK9751uayYzZIawLJ4K++P10oDA8Q1r9/tcnwi+mBdM4059xouio8Yvbz
         41sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=876uV0C2rcWmwrVuv5sB0QCkT2DUPnwIqbxAymkbhGY=;
        b=LBM9BRkt/7ftb+jT77PBq5DGqNc3HU5R8oVMTgp/XMWs04sXsZsaPYmRpa87HBw2RI
         L+RnoCNAf3lBcnPRONypERYbJKfwId9PzIVXSBEbca1BZ+uki3TfxeqhaGGwlrOnvvg9
         KUwFY3GFz2zEEbsjDDz+w2GSFzqJjyEXCM0GCXCovsKXgU3EDXkzlVK/UP1JmQbvhwPO
         1emyY3ntaDKo/NmduwZgCfcPGUHlSdxMvj55MNMEiWU86XJeD4A7GPZ52c1hk5/KHulg
         5uxFZvhQxVCYML5qTTTvOotKCWssG+zsh1j5bdoY5UaxF/sGwg9ZjN5UZtc8SuuCn9Xa
         CRzA==
X-Gm-Message-State: AOAM531vFXVPgF+NKCTqg2tw/C/SVBA8XurRAsXYyMeXqvIcrZ/J6zcC
	EHHIoCSs37Mrf2oqGhFiOl4=
X-Google-Smtp-Source: ABdhPJxFLHTY84Sh7J4RvIVU6Xge5i6CGjqon6egl6nUELnCNTRJI6nu0pAppWEHR43MnVdblg5qQQ==
X-Received: by 2002:a2e:2417:: with SMTP id k23mr9534031ljk.256.1631887713242;
        Fri, 17 Sep 2021 07:08:33 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
From: Oleksandr <olekstysh@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109131726420.10523@sstabellini-ThinkPad-T480s>
 <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
Message-ID: <27da6f7a-5bb5-daa3-4012-60fc598e0f6b@gmail.com>
Date: Fri, 17 Sep 2021 17:08:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c3fd1198-15bf-6c05-fe5d-ea29255f1dfe@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 15.09.21 22:10, Oleksandr wrote:

Hi Stefano.

[snip]
>
>>> +static int __init find_memory_holes(const struct kernel_info *kinfo,
>>> +                                    struct meminfo *ext_regions)
>>> +{
>>> +    struct dt_device_node *np;
>>> +    struct rangeset *mem_holes;
>>> +    paddr_t start, end;
>>> +    unsigned int i;
>>> +    int res;
>>> +
>>> +    dt_dprintk("Find memory holes for extended regions\n");
>>> +
>>> +    mem_holes = rangeset_new(NULL, NULL, 0);
>>> +    if ( !mem_holes )
>>> +        return -ENOMEM;
>>> +
>>> +    /* Start with maximum possible addressable physical memory 
>>> range */
>>> +    start = EXT_REGION_START;
>>> +    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>> +    res = rangeset_add_range(mem_holes, start, end);
>>> +    if ( res )
>>> +    {
>>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>> +               start, end);
>>> +        goto out;
>>> +    }
>>> +
>>> +    /* Remove all regions described by "reg" property (MMIO, RAM, 
>>> etc) */
>>> +    dt_for_each_device_node( dt_host, np )
>> Don't you need something like device_tree_for_each_node ?
>> dt_for_each_device_node won't go down any deeper in the tree?
>
> Thank you for pointing this out, I will investigate and update the patch.

I have checked, dt_for_each_device_node( dt_host, np ) iterates all 
nodes, so nothing will be skipped.

As an example for this node:

         hdmi@fead0000 {
             compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
             reg = <0x0 0xfead0000 0x0 0x10000>;
             interrupts = <0x0 0x185 0x4>;
             clocks = <0xc 0x1 0x2d9 0xc 0x0 0x28>;
             clock-names = "iahb", "isfr";
             power-domains = <0x9 0x20>;
             resets = <0xc 0x2d9>;
             status = "okay";
             iommus = <0x50 0xc>;
             xen,passthrough;

             ports {
                 #address-cells = <0x1>;
                 #size-cells = <0x0>;

                 port@0 {
                     reg = <0x0>;

                     endpoint {
                         remote-endpoint = <0xb1>;
                         phandle = <0xc1>;
                     };
                 };

                 port@1 {
                     reg = <0x1>;

                     endpoint {
                         remote-endpoint = <0xb2>;
                         phandle = <0xd1>;
                     };
                 };

                 port@2 {
                     reg = <0x2>;

                     endpoint {
                         remote-endpoint = <0x6f>;
                         phandle = <0x6e>;
                     };
                 };
             };
         };


(XEN) process /soc/hdmi@fead0000
(XEN) ---number_of_address = 1
(XEN) -------0: 0xfead0000->0xfeae0000
(XEN) process /soc/hdmi@fead0000/ports
(XEN) ---number_of_address = 0
(XEN) process /soc/hdmi@fead0000/ports/port@0
(XEN) ---number_of_address = 0
(XEN) process /soc/hdmi@fead0000/ports/port@0/endpoint
(XEN) ---number_of_address = 0
(XEN) process /soc/hdmi@fead0000/ports/port@1
(XEN) ---number_of_address = 0
(XEN) process /soc/hdmi@fead0000/ports/port@1/endpoint
(XEN) ---number_of_address = 0
(XEN) process /soc/hdmi@fead0000/ports/port@2
(XEN) ---number_of_address = 0
(XEN) process /soc/hdmi@fead0000/ports/port@2/endpoint
(XEN) ---number_of_address = 0




[snip]

-- 
Regards,

Oleksandr Tyshchenko


