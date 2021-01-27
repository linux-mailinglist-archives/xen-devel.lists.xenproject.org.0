Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC6306142
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76270.137559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4o1F-0003Vk-T4; Wed, 27 Jan 2021 16:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76270.137559; Wed, 27 Jan 2021 16:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4o1F-0003VO-Pb; Wed, 27 Jan 2021 16:50:13 +0000
Received: by outflank-mailman (input) for mailman id 76270;
 Wed, 27 Jan 2021 16:50:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4o1E-0003VI-3I
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:50:12 +0000
Received: from mail-lj1-x233.google.com (unknown [2a00:1450:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d59a594-1804-44b5-90bd-f5f812050e71;
 Wed, 27 Jan 2021 16:50:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id f19so2894751ljn.5
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 08:50:10 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j24sm601917lfr.83.2021.01.27.08.50.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 08:50:08 -0800 (PST)
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
X-Inumbo-ID: 1d59a594-1804-44b5-90bd-f5f812050e71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=K5zmwtPigrF07bHRq6jZ/LzgUBZf4ZDG4wq3g0nkqMs=;
        b=V8fAUG+TVyn7RnaYeaGbqHZVOXqgYgmjlMBw3pDEc+HgDCaGZCDYoW8NFrVBBheWzo
         e3i42zzmFSmFtC442pPFWJiLR31x//q25OPyw/Xfnw+SIUBU4wkwkeYyyD2zf5hKuROv
         gQcvfVUa79UfgeURT+HNhpBesvGzDWlYVZpGvyqQCH52VapDkBJJ9/xLVFrt2qN4k5f+
         k/vG2lMNll00lOF5tVYmO5YiBJcWSRhK/Y8o72Mf99EiGN/ZmOaJiOLcfH4bnzSlDOTG
         1FEE+Vgj4WIDrqISIcZgABSzmQeMaPdy/XEWUsN9na5JuRlwNnJElFVMxyOYe99m519F
         jdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=K5zmwtPigrF07bHRq6jZ/LzgUBZf4ZDG4wq3g0nkqMs=;
        b=NazdicfDCx5x70aomdwAc26MOia+b8HVDCu9ClLlWFSVOir7QC+ASCO0qxiVAu9f7G
         tV47mYMwKz+bI4p+UbYPrcFbQZRujCupONNAoYuizYwQuvt8/HxQPA6+uW5wYx/morEI
         NTRIaZtZ0ySl1IejCFOjJbeqGmiOCXCuow/7WIXFoAa1FbYFqSchjI2kbRtxz1ryRB0p
         HBQuNQk5+U4dEwSdd+cAaReUYSREQ2WbLHmE9tntSNcaShAxNUTgqTJkKjXNDT2usA0W
         iI3pLNuAJ8uavCNUdSl6Nngg3a5eGOY3nOpXg/f0VlZuejNXMb2Br6begOMqP3yAi1sf
         FOQw==
X-Gm-Message-State: AOAM532d79zpAmDhd9OehmfKV1JYLxRxifnSXd9lpei7kDFIm7bM/IvQ
	yF4F79LsFxgUBnudG4RPEXQ=
X-Google-Smtp-Source: ABdhPJyqPsRrmSFRudKNmPRIvTxhj8jPEod1LS2eLPBrgHKbuBeS/k+83J/hHpr9qOKd70q6/wL3hw==
X-Received: by 2002:a2e:81d1:: with SMTP id s17mr6115009ljg.49.1611766209110;
        Wed, 27 Jan 2021 08:50:09 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <dc7866fc-5b13-5378-2b22-6475053fd76b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a69fdf11-2445-865f-4893-b486618c29a3@gmail.com>
Date: Wed, 27 Jan 2021 18:50:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dc7866fc-5b13-5378-2b22-6475053fd76b@xen.org>
Content-Type: multipart/mixed;
 boundary="------------90765F93A21830942FA4D873"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------90765F93A21830942FA4D873
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 27.01.21 18:43, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien


>
> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>> ***
>>
>> Patch series [8] was rebased on recent "staging branch"
>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is unmapped) 
>> and tested on
>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk 
>> backend [9]
>> running in driver domain and unmodified Linux Guest running on existing
>> virtio-blk driver (frontend). No issues were observed. Guest domain 
>> 'reboot/destroy'
>> use-cases work properly. Patch series was only build-tested on x86.
>>
>> Please note, build-test passed for the following modes:
>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>
> I thought I woudl give a try to test the code, but I can't find a way 
> to enable CONFIG_IOREQ_SERVER from the UI.
>
> Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER doesn't have 
> a prompt and is not selected by Arm.
>
> Can you provide details how this can be built on Arm?

Please apply the attached patch to select IOREQ on Arm.



-- 
Regards,

Oleksandr Tyshchenko


--------------90765F93A21830942FA4D873
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-NOT-FOR-MERGE-enable-ioreq.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-NOT-FOR-MERGE-enable-ioreq.patch"

From c0ef23f7f0788783f9fccbf1e4e4935711de67ea Mon Sep 17 00:00:00 2001
From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Date: Thu, 8 Oct 2020 22:30:24 +0300
Subject: [PATCH] [NOT FOR MERGE] enable ioreq

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index c3eb13e..5cf1e84 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -21,6 +21,7 @@ config ARM
 	select HAS_PASSTHROUGH
 	select HAS_PDX
 	select IOMMU_FORCE_PT_SHARE
+	select IOREQ_SERVER
 
 config ARCH_DEFCONFIG
 	string
-- 
2.7.4


--------------90765F93A21830942FA4D873--

