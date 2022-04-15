Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B15027F9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 12:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305675.520767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfIpc-0003ah-OU; Fri, 15 Apr 2022 10:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305675.520767; Fri, 15 Apr 2022 10:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfIpc-0003XX-L8; Fri, 15 Apr 2022 10:05:36 +0000
Received: by outflank-mailman (input) for mailman id 305675;
 Fri, 15 Apr 2022 10:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GqiY=UZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nfIpb-0003XR-Mf
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 10:05:35 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96aea3a1-bca3-11ec-8fbe-03012f2f19d4;
 Fri, 15 Apr 2022 12:05:34 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id bi26so13359584lfb.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 03:05:33 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a2e7d14000000b0024b44fb9a9esm237038ljc.51.2022.04.15.03.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 03:05:32 -0700 (PDT)
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
X-Inumbo-ID: 96aea3a1-bca3-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3bPZ/57wkOzXUeVbdrpb2yRMsao/hRXkHHvgI0MANKk=;
        b=kElByGo2IoedNfGnE2cZcLVPTVjK2UCWKdN87D6dViUUxOUff7l1/vPg+ZNT/zSxRC
         khbLbPeDzufZCJHNVhOB0Kv/4sAzVYBjMhpQEpXmtMohWCmzDeVHYewrH4NXQW2cnrRC
         1TNkQ7TCXY6ck4WcBIMXN4g9xiJTkTMAvoJ9C5X8P/cSWJVISPk8u10sUCC6oPCpBZfx
         tHKYCXQWpgzYXt3E2drudncvyvkkeqG0Dd91QNiUbXv3Uyw9NwloWfWK6N2A+OUDOkU1
         c5d5JvHq/xyLu75EJS3wPRGbevU1Vcxwi5jFKn71vpfFRbD4nVu/2KEnJ/IBdJ4IhmJg
         1A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3bPZ/57wkOzXUeVbdrpb2yRMsao/hRXkHHvgI0MANKk=;
        b=XmJ7dciFI72VSfoJRU2yJxYWzpycCOg8WSLfLN3kBPM+LbTuXH1wYBwToLSM1DAXbD
         Tqv/rl0/KBvxiKxwYUfYKXgt9evShq1/WUGrlFIcIR8+t90TUj5UsZXYo4RBk1A/zfyz
         BwTBkHL3u6OcQRgQ3Ly8OIvyGoiTWdbO4upsxoGuMoMZ/R/0aV0xgpqwCwFG7femCg/2
         fYHgqHgDRn15+AUC0bE77suIfpADiCL2f2IsH8r2Q9Z04kVxPEIFEQ2/CprUpkeOlIRZ
         NTt/U4lYAsXqICkUf9Oej1fF99TqHZqAMo0lYWMoyBJyab6eymeGgYIfLoY4BGInU+/u
         Tiyw==
X-Gm-Message-State: AOAM533vEGASVWjEZu+1XOwG3LHHlXaVReXm3LEbXa77lXl8pcQF0IDu
	Rh2mSooDHxhiuzbQCCDA6Qw=
X-Google-Smtp-Source: ABdhPJyjVd4rtR6Bjb/C8iblfrbGe544Fs3ujvYDVQYhCwQ6WGVTei+TFMsEsUoTdRkLe/bDvzEXNw==
X-Received: by 2002:a05:6512:32c7:b0:44a:762:27e4 with SMTP id f7-20020a05651232c700b0044a076227e4mr4687202lfg.401.1650017133014;
        Fri, 15 Apr 2022 03:05:33 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] virtio: Solution to restrict memory access under
 Xen using xen-virtio DMA ops layer
To: Christoph Hellwig <hch@infradead.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1649963973-22879-1-git-send-email-olekstysh@gmail.com>
 <YlkhsH4zqly/BykB@infradead.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <251e957d-03f9-8ee6-789d-517417c95aff@gmail.com>
Date: Fri, 15 Apr 2022 13:04:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YlkhsH4zqly/BykB@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 15.04.22 10:41, Christoph Hellwig wrote:

Hello Christoph

> I can only see three out of 6 patches on the linux-arm-kernel list,
> which makes reviewing this impossible.


Oops, I will add linux-arm-kernel. I blindly followed what 
get_maintainer.pl suggested for each patch plus added manually some Xen 
folks,
but, indeed, the first three patches add the base of this enabling work.


> Also please Cc me directly
> on any series doing crazy things with dma ops.  Thanks!

yes, sure.


-- 
Regards,

Oleksandr Tyshchenko


