Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6B5BAF5F
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 16:27:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408015.650722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZCJG-0007MD-2q; Fri, 16 Sep 2022 14:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408015.650722; Fri, 16 Sep 2022 14:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZCJF-0007JK-Ve; Fri, 16 Sep 2022 14:27:13 +0000
Received: by outflank-mailman (input) for mailman id 408015;
 Fri, 16 Sep 2022 14:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DpNU=ZT=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oZCJE-0007JE-Cn
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 14:27:12 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a662c0a4-35cb-11ed-a31c-8f8a9ae3403f;
 Fri, 16 Sep 2022 16:27:11 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id jm11so21562135plb.13
 for <xen-devel@lists.xenproject.org>; Fri, 16 Sep 2022 07:27:11 -0700 (PDT)
Received: from [172.19.1.55] (50-199-13-217-static.hfc.comcastbusiness.net.
 [50.199.13.217]) by smtp.gmail.com with ESMTPSA id
 f11-20020a170902ce8b00b0016dc78d0153sm14996189plg.296.2022.09.16.07.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 07:27:09 -0700 (PDT)
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
X-Inumbo-ID: a662c0a4-35cb-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date;
        bh=SxK+8r6WWXjaYbHfUsvSJpeaDsBL9HQkoqXbEeIiSHs=;
        b=fswotqqvFYVw6hNmcEvM666ymxj0V8DrfIzONxpAG9Po7dizcLi3Gtmr4ZYUtuRPgW
         Rl/r46WMcS199TMFj59sSZs/SzZpALHXkwBdldUHkAyHXvss9zrurV0UabYLvoITp5vD
         qPa5ceDUwemHH7i85JJ+PzR3YBa6AUiAlU14ptASnZnBXQwblen0voDtt+yLb0t2As0i
         kXe6fysqy1xgir/hOdPfqjJS3c+VE7Ub82wEz72WwCJ2EBdRuu0Y3LPKxo70ycGEPPKo
         2e65gfmNo237+36HLpB1vB6a0ZyEJsFUkxN/2dg4/m/j6uqDAjyh46VTcSnwtZlfSevk
         iD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=SxK+8r6WWXjaYbHfUsvSJpeaDsBL9HQkoqXbEeIiSHs=;
        b=QkqOMcObknIuP3n5P31GrJy8qkN+Vx7Ojv8THaR07r77k7OW/g0qvDvEokTmmFTy3s
         8Taa2XyzL48jnd6Owp6bijeoipa2+Dx2ARigD1PEXxpExqJdwFST25cxh3r0jmDgVBiU
         gKP7y3UDRr7Lqu/+cQZVUY73k9SvC58hOaoFisLdXzbtRC/ZhggHRayFyeWgTe243Pa8
         o1NKChih36GU4JCz+3hKnHuwdxe/nvf4ZHa+lk4HrcawGGiEwSvVlFzr5ZE60pgUcbOX
         eev7HhRaOTiE5wRUFpqF077/qegmoLIM1nR6TXAu2ES2LcWgQg4mIgkrDC5hw/ktxpy5
         /V+w==
X-Gm-Message-State: ACrzQf2m48PmpYdbSdtxeZY0nECSgpzAc1fGb20G3+1U1TcRWJRZ4qDW
	GEvDeeuAPMPg9wylqxbKabo=
X-Google-Smtp-Source: AMsMyM6Bw0leUpkBF5PpoAEfrFywKU1AILoBcbk9yS14xVUriYHK73nLxSvENh7yDJhko9hlA9D7AQ==
X-Received: by 2002:a17:902:f0d4:b0:176:988a:77fd with SMTP id v20-20020a170902f0d400b00176988a77fdmr113301pla.25.1663338429904;
        Fri, 16 Sep 2022 07:27:09 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c46bf066-3702-d28e-dcb0-d7b4e3718aad@xen.org>
Date: Fri, 16 Sep 2022 07:27:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] hw/xen: set pci Atomic Ops requests for passthrough
 device
To: "Ji, Ruili" <Ruili.Ji@amd.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Liu, Aaron" <Aaron.Liu@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 anthony.perard@citrix.com
References: <BL1PR12MB599341DC55BA53FE588DE14E9B7E9@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993C52DD9A881FACE6FA28D9B419@BL1PR12MB5993.namprd12.prod.outlook.com>
 <BL1PR12MB5993DC46EDF5D01ED20E2E179B479@BL1PR12MB5993.namprd12.prod.outlook.com>
 <8be84a25-c31d-fd88-f913-c03c15046a55@xen.org>
 <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <BL1PR12MB59937394D936EE7EDF5E3F809B469@BL1PR12MB5993.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/09/2022 03:07, Ji, Ruili wrote:
> [AMD Official Use Only - General]
> 
> Hi Paul,
> 
> Thank you!
> But how could we merge this patch ?
> 

AFAIK Anthony (anthony.perard@citrix.com) still deals with this.

Cheers,

   Paul


