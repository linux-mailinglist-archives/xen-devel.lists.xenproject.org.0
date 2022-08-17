Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01B596D84
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 13:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388876.625647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOHDg-0000AE-5j; Wed, 17 Aug 2022 11:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388876.625647; Wed, 17 Aug 2022 11:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOHDg-000086-2o; Wed, 17 Aug 2022 11:28:20 +0000
Received: by outflank-mailman (input) for mailman id 388876;
 Wed, 17 Aug 2022 11:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXH0=YV=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oOHDe-00007w-Gj
 for xen-devel@lists.xen.org; Wed, 17 Aug 2022 11:28:18 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb87004-1e1f-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 13:28:17 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id f28so11828280pfk.1
 for <xen-devel@lists.xen.org>; Wed, 17 Aug 2022 04:28:16 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 r2-20020a170902c60200b0016d785ef6d2sm1187097plr.223.2022.08.17.04.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 04:28:14 -0700 (PDT)
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
X-Inumbo-ID: afb87004-1e1f-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=xzs9bP9ZqtHsxYSUAKve7sAOh0KWxjzBLYoVARqMDU0=;
        b=JrDQHER6b4SeOOcxCpqwica7Pb4MChp6DzNMxHrMaGqja+VVMQuJ7Ne25zabeEjc66
         bu0jo+W+4mPP9BnfAnf2GR5mt37/WH8KI6g3LpSaAMBDpXeWdKGsyQR6HUQ3Cm8eNhol
         ZclK3OD1OJ0UWkkxlA7b3iUF3S1Xm4SES5cMZwlkLkZZ5Dol1/zwOGyEMSLljRdpYYEg
         28Lda7MvXvOip/FZ0+xsiBReLIIrmETyAlEPqWsARDiCruDf21nGB+KVc2DmbzKoAJM9
         p4uNoxQXBefbIyLh1QQW/G9hVCxrmYFEZ6YGnZFlmyR5ENR6nA6Kqkg5r/nxznneGEkA
         r6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=xzs9bP9ZqtHsxYSUAKve7sAOh0KWxjzBLYoVARqMDU0=;
        b=VkCPi8TiBzatbiBX8Hd55FjR/KO1sy6VNSiD2yx+kJwRmxCrADuKs2eVttxuwV+1fe
         3tAVu3eM+6Jwaw/yWmJiMSzUtEgOpWp+uC3DqfJ532BxLCWmlGWcchqqVoW4EN0xg8bc
         W1r4+ChIv6zDwvd3H+H1hgk/0WCOVzgl8xsRxLJ6VWB0x4D9Ps1hTNIBTjCcYi2ocw04
         o7CbTP3jpP0jln8j49ZYnj7QV+o/lPpYCiYuK6mExrWzD93rTZyyDvohButB3kGVHj3E
         Wx7Ekh2c9bn1xSxOlsy9z5GXs9qsWaIVUU6RhPGx/cHB1HOzu9G+PgYSEA2y6wWeW8eS
         ihMw==
X-Gm-Message-State: ACgBeo2YhKDZQb8ZRr3LT17A5x/bBrvTq/llMq4vbDUAEDR4zntVFE23
	MFCUek6MtBT0cTZP3dCrsQE5zA==
X-Google-Smtp-Source: AA6agR65JVaQgb1pAKE4m0HUDrc+yLKMV9XRNnleiGsrzd/FL2M2BhTDEWEyW8LByURajnICjAt6pg==
X-Received: by 2002:a63:6948:0:b0:41c:9c35:a047 with SMTP id e69-20020a636948000000b0041c9c35a047mr21171641pgc.68.1660735695296;
        Wed, 17 Aug 2022 04:28:15 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:58:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: anthony.perard@citrix.com, Juergen Gross <jgross@suse.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, xen-devel@lists.xen.org
Subject: Re: [PATCH V4 0/6] Virtio toolstack support for I2C and GPIO on Arm
Message-ID: <20220817112812.rxf35iyklvh2kmyl@vireshk-i7>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1660023094.git.viresh.kumar@linaro.org>

On 09-08-22, 11:04, Viresh Kumar wrote:
> Hello,
> 
> This patchset adds toolstack support for I2C and GPIO virtio devices. This is
> inspired from the work done by Oleksandr for the Disk device.
> 
> This is developed as part of Linaro's Project Stratos, where we are working
> towards Hypervisor agnostic Rust based backend [1].
> 
> This is based of origin/staging (commit 01ca29f0b17a ("sched: dom0_vcpus_pin
> should only affect dom0")) which already has Oleksandr's patches applied.
> 
> V3->V4:
> - Update virtio_enabled independently of all devices, so we don't miss setting
>   it to true.
> 
> - Add iommu handling for i2c/gpio and move it as part of
>   make_virtio_mmio_node_common(), which gets backend_domid parameter as a
>   result.

Hi Anthony / Juergen,

Do you have any feedback for me on these patches ? It would be very
helpful to know if I am on the right track or not.

Thanks.

-- 
viresh

