Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C557E49D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373357.605518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvl1-0005ig-FA; Fri, 22 Jul 2022 16:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373357.605518; Fri, 22 Jul 2022 16:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvl1-0005fl-Ba; Fri, 22 Jul 2022 16:44:07 +0000
Received: by outflank-mailman (input) for mailman id 373357;
 Fri, 22 Jul 2022 16:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvl0-0005ff-8q
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:44:06 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f95f2cb-09dd-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 18:44:05 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id a11so3112726wmq.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:44:05 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 a8-20020adffb88000000b0021d73772c87sm4952685wrr.91.2022.07.22.09.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:44:04 -0700 (PDT)
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
X-Inumbo-ID: 7f95f2cb-09dd-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bacCLMc4VWJre6VMJNeYyywDzMMICUIKY0BopfXJL/g=;
        b=n8GBgITjggnfs63julnZosM8FE71aIW5n4QMu4XGioXAj2hYhaQ6lYb9gZQHpxtqZD
         +Das/ixn3op8aWW6tUhLK19oelRrCr8ehBpy/Bmr0JdXc/6BMQs/JfVI7ZTgkYpQHoMN
         M3yl9056xjIABHPVcz6B91YUY77KubHfSwrTN7xPgBRCTJoiP7TZtP/V3gJi9eJydqcB
         WSdL/oHu2dZMflEYej4qYrvKAhDL4iUKrtioC8yWao4GszaSAyuYtPYmP87X6aihao8i
         w3iZiq2petX29koWUk1fz7o3nDW2V6DmWRCNpugndzS/gZb88PsH3fEUT++ItfcGFX2E
         CarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bacCLMc4VWJre6VMJNeYyywDzMMICUIKY0BopfXJL/g=;
        b=kM2/twAijjsy91CqLv0JluRvESfuwZoCb5U75QRDB9g9KwGN7lddihFtWrv+XTNjTc
         hCKRry/IlSCRxg+dJrRg03DtIRlt7YVQtVtvUi3jddJQtApCQvN64bBUHntabR+T6oni
         p0+5e1qF2xUgzVPtJU2tEB2NgROp2CHLDSvL49D5MTEh/yvGNCiqBLLmITmrKH71Paxh
         SORCUxGJsIi4uLKi7VV6RR5pL7lpYA3ynQYtIp4guEnttgrOaew1n0+4aoF/KT+cqNS3
         DqPZmpSlSoRziJj2gy+G9y09I3IptUn7r/ZiCiXg+YPlIP0TMDSwUL8s2cx47WErgZQu
         zt4g==
X-Gm-Message-State: AJIora+Wx7c4GcMHspOMBHcZ2Lp2q93w0Dyq4zyoqhrgMUs3weVNw4A2
	R39n0Pk7BWYfaOyQknkQHa8=
X-Google-Smtp-Source: AGRyM1s28IVfG4MxuBpbB43kD9I83fuihu5ZcbAPx3avdQGga6xcw1KwH7p0PqPKC7tQ9coUv7FSeA==
X-Received: by 2002:a05:600c:1f13:b0:3a3:3f0d:d9d4 with SMTP id bd19-20020a05600c1f1300b003a33f0dd9d4mr3394103wmb.4.1658508244855;
        Fri, 22 Jul 2022 09:44:04 -0700 (PDT)
Message-ID: <748d17d4-fa19-fc16-c503-7d0ae1f37e7f@gmail.com>
Date: Fri, 22 Jul 2022 17:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 03/14] IOMMU/x86: support freeing of pagetables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <d948cf6a-5ebf-177f-9437-07d62ae80d20@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <d948cf6a-5ebf-177f-9437-07d62ae80d20@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:44, Jan Beulich wrote:
> For vendor specific code to support superpages we need to be able to
> deal with a superpage mapping replacing an intermediate page table (or
> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> needed to free individual page tables while a domain is still alive.
> Since the freeing needs to be deferred until after a suitable IOTLB
> flush was performed, released page tables get queued for processing by a
> tasklet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

