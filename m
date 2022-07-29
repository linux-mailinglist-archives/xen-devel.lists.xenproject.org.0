Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A3585368
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 18:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377651.610935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSr4-00032U-S6; Fri, 29 Jul 2022 16:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377651.610935; Fri, 29 Jul 2022 16:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSr4-0002z4-Oy; Fri, 29 Jul 2022 16:28:50 +0000
Received: by outflank-mailman (input) for mailman id 377651;
 Fri, 29 Jul 2022 16:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCuC=YC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oHSr3-0002yv-NM
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 16:28:49 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85b8aa30-0f5b-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 18:28:48 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id u3so5307164lfl.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 09:28:48 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05651211f000b0047f8d7c08e4sm702407lfs.166.2022.07.29.09.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 09:28:47 -0700 (PDT)
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
X-Inumbo-ID: 85b8aa30-0f5b-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=llkulA7J9/Yp/jgfTmqHNl4VmoywFnFLFHyHwNhS52I=;
        b=S4VUp7T90GzkjfCVOUL0UO8m6Wp1ufFSc1cGNfDPJeaaBuRlI0BFnLQIu1elVj7n0v
         lGANkVKRMojidGjlx2pnZ7n38R68ogAYU+kEBs8qmDfuyv/RbDHMveSMJtOPWr64evnt
         cV8iohRp/e3gQcBsItNLeyQVQenqThEP+pGc5nW1srXvu5M/xRCYwK4vW9k1wvTx6Kzx
         OyWC6o/VdO0yC68eJhVQ2fho+kOZobRLfDg01H+fIDvgCi2Ql5bUvi4gLP3m4kHr1hZA
         oJIcQvSEvgeiAxXa+4LfLcjiJQXzjVpZZRQU2Or9ux/Sqaf/Ygty1kCba0ena5A1LMwk
         ClDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=llkulA7J9/Yp/jgfTmqHNl4VmoywFnFLFHyHwNhS52I=;
        b=xT6vv6SxrWN1nc5G6PzjmoEYPvwF+Pbf3iZe23t1j4lZBtQi3ARqMRrIB/7mtuvKYQ
         oUoa2SO9PMV2nChifAKOmOMkIH6g9Y7Z9cqvrXH41KunhHN50sdWyU2RQmKnFTh/rE33
         KwFHwLzDKptfTz5daVaOGy/nQmiPzKbJk2c9RvNYcnZQLup2+dYZ9wwXYRs5Bk2Qo90o
         g/2UE3VigkFGlZuvfncLF9W4NNtt6xxXmVdYs2NsHNQY2lv1TIahG1BavWpHOO8Q9q0P
         dqV2Ba9NdMT/r3UliMytNFlYYHKMG1iy5eZEyVR3O8ynmZbJCwqqzZDlN6sfcQGW0Lmu
         /nFQ==
X-Gm-Message-State: ACgBeo3r20WjOhMBBUuFlOprkDJwEpMgBg8WiAQpgis4SqoA9Su9I2wB
	k7fD5IL8/DwJUt3mRpU49A2+9UgAXbrrRg==
X-Google-Smtp-Source: AA6agR7BCBdFBfgu42oz+E8cDComZgU5BALIpq3qlOiN3VtFkUz1pH5L+hh67tkkwE4Mdkp4B2s5ow==
X-Received: by 2002:a05:6512:308c:b0:48a:e393:2a63 with SMTP id z12-20020a056512308c00b0048ae3932a63mr987980lfd.213.1659112128123;
        Fri, 29 Jul 2022 09:28:48 -0700 (PDT)
Message-ID: <8e912bdf-a93f-c3d8-8906-8132a8f30035@gmail.com>
Date: Fri, 29 Jul 2022 19:28:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 01/11] xen/pci: arm: add stub for is_memory_hole
Content-Language: en-US
From: Oleksandr <olekstysh@gmail.com>
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-2-olekstysh@gmail.com>
In-Reply-To: <20220719174253.541965-2-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello Rahul


On 19.07.22 20:42, Oleksandr Tyshchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Add a stub for is_memory_hole which is required for PCI passthrough
> on Arm.
>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> OT: It looks like the discussion got stuck. As I understand this
> patch is not immediately needed in the context of current series
> as PCI passthrough is not enabled on Arm at the moment. So the patch
> could be added later on, but it is needed to allow PCI passthrough
> to be built on Arm for those who want to test it.
>
> Copy here some context provided by Julien:
>
> Here a summary of the discussion (+ some my follow-up thoughts):
>
> is_memory_hole() was recently introduced on x86 (see commit 75cc460a1b8c
> "xen/pci: detect when BARs are not suitably positioned") to check
> whether the BAR are positioned outside of a valid memory range. This was
> introduced to work-around quirky firmware.
>
> In theory, this could also happen on Arm. In practice, this may not
> happen but it sounds better to sanity check that the BAR contains
> "valid" I/O range.
>
> On x86, this is implemented by checking the region is not described is
> in the e820. IIUC, on Arm, the BARs have to be positioned in pre-defined
> ranges. So I think it would be possible to implement is_memory_hole() by
> going through the list of hostbridges and check the ranges.
>
> But first, I'd like to confirm my understanding with Rahul, and others.


May I please ask about your opinion on that?


>
> If we were going to go this route, I would also rename the function to
> be better match what it is doing (i.e. it checks the BAR is correctly
> placed). As a potentially optimization/hardening for Arm, we could pass
> the hostbridge so we don't have to walk all of them.
> ---
>   xen/arch/arm/mm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 009b8cd9ef..bb34b97eb5 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1708,6 +1708,12 @@ unsigned long get_upper_mfn_bound(void)
>       return max_page - 1;
>   }
>   
> +bool is_memory_hole(mfn_t start, mfn_t end)
> +{
> +    /* TODO: this needs to be properly implemented. */
> +    return true;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C

-- 
Regards,

Oleksandr Tyshchenko


