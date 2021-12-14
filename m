Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E14742BD
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:38:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246710.425471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx74O-0004dR-3S; Tue, 14 Dec 2021 12:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246710.425471; Tue, 14 Dec 2021 12:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx74O-0004bo-06; Tue, 14 Dec 2021 12:38:12 +0000
Received: by outflank-mailman (input) for mailman id 246710;
 Tue, 14 Dec 2021 12:38:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KYVb=Q7=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mx74M-000421-RZ
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:38:11 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2050bfe-5cda-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:38:10 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id z7so36512293lfi.11
 for <xen-devel@lists.xenproject.org>; Tue, 14 Dec 2021 04:38:10 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r5sm1879323lji.132.2021.12.14.04.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 04:38:09 -0800 (PST)
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
X-Inumbo-ID: b2050bfe-5cda-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fEoG2D1+lzGwxI9iKVc9jEyaXpS5rk2Da8vud5FGmZY=;
        b=i18JZ8UOcByRAgriEWMc5gMvcvhJgUzrwjnSzZCBHPND13enFnoZ5nBQX6Fr6owOuH
         GZJFmnGlG4sAJ0fMgwFO1E7vwBBCtpjKHfRTisgElzba/KSMxaKPYsmGxNgYzzacG2yi
         e5b8L7IxNcNW0AorAjIoC4gliDtNl+pNqTBeLwk76SOng4ONEVcu0KBUC3a3owQq6tUW
         cFLwEVceVgktxUrWzg69sp096S8VbRL6Qgiaqp+wE9gPt3fbL63jV7L027dtKCtbYWwS
         igEpjDjaKNtSIKtV0GvCAv9gARd+v0NrYVZNQSgf6hWwo40Syuk4Np1xk2+vSJebV0sd
         xpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fEoG2D1+lzGwxI9iKVc9jEyaXpS5rk2Da8vud5FGmZY=;
        b=v4veQGPqiUtvYPbl1KGz4bpaqEq+91cEW7RKjhPI1cyetgAtsF6+oc/w4YA8XzvMuM
         w65LCTlKGj7lNkkjzb2Qb3xoiuQfE+boJsZo2m/b8q0Trquo4n5O01tKRJiHJi+CT00m
         tDxC5vJS15JyWCPOmISdVTF/JpCM+dJZ2K8H3+RWAS0AhCgycGv2jeCdgBT1lLbOxrcX
         x60UeNY2Z/iJvEAzpBxOI+IA3cStxliWzYECL8isUOlcEa/bnLLejnxbwHevs7WIBxfj
         0VccbynGBndzPq+dPmR/WEdc+UXCDFCjGxLU6YXOjXdK/Gx+K9znPnPwusVwOmlqBgQg
         0pdQ==
X-Gm-Message-State: AOAM533RbwEmBMO4+RU/SVqLadiOiAKd7RubPEMFlW/uLSZ9ZzhXM9Ie
	Xf1SFu4sPFEAeIKX2bqph3A=
X-Google-Smtp-Source: ABdhPJyg6Wd45KiqBhUprtCyaJ+CDTKuTGLIcB8KvxyjeJGkvbS3jv8wEULy19O78YFkW5m52heU+Q==
X-Received: by 2002:a05:6512:1510:: with SMTP id bq16mr4288388lfb.628.1639485489746;
        Tue, 14 Dec 2021 04:38:09 -0800 (PST)
Subject: Re: [PATCH 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4)
 support
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-8-git-send-email-olekstysh@gmail.com>
 <TY2PR01MB36922C89869ADAAF34A75F35D8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0c41033e-fffd-1d47-a4d9-a8d28f0b835e@gmail.com>
Date: Tue, 14 Dec 2021 14:38:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB36922C89869ADAAF34A75F35D8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 14.12.21 14:10, Yoshihiro Shimoda wrote:
> Hello Oleksandr-san,

Hello Shimoda-san,


>
> Thank you for the patch!
>
>> From: Oleksandr Tyshchenko, Sent: Sunday, November 28, 2021 2:52 AM
>>
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Based on the following commit from the Renesas BSP:
>> 7003b9f732cffdc778fceb4bffb05ebb4540f726
>> located at:
>> https://github.com/renesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.3.rc5
> I would like to reuse an upstream-based patch instead of this BSP patch.

Makes sense


> Linux upstream doesn't support the IPMMU-VMSA driver for R-Car S4 yet,
> but I believe the following patch can be helpful for R-Car S4:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/ipmmu-vmsa.c?h=v5.16-rc1&id=7a62ced8ebd0e1b692c9dc4781a8d4ddb0f74792
> I have a plan to modify the Linux IPMMU-VMSA driver for R-Car S4 in the future.
> - The ipmmu_features_r8a779a0 is replaced with ipmmu_features_rcar_gen4.

Thank you for the pointer, I got it, will do.

>
> I'll review further patches (8/10 through 10/10) tomorrow or later.

Thank you!


>
> Best regards,
> Yoshihiro Shimoda
>
-- 
Regards,

Oleksandr Tyshchenko


