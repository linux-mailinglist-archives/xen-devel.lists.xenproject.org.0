Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B353E57E4E4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373386.605573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvwh-0001NA-Ds; Fri, 22 Jul 2022 16:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373386.605573; Fri, 22 Jul 2022 16:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvwh-0001Jt-Ay; Fri, 22 Jul 2022 16:56:11 +0000
Received: by outflank-mailman (input) for mailman id 373386;
 Fri, 22 Jul 2022 16:56:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvwf-0001Jh-5S
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:56:09 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e7ead1f-09df-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 18:56:08 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso4849882wmq.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:56:08 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 i13-20020adff30d000000b0021e4982270asm5185332wro.13.2022.07.22.09.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:56:06 -0700 (PDT)
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
X-Inumbo-ID: 2e7ead1f-09df-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BdOvOOxFrgEHoNBKjWoXTbrloJ36jxHuqfmbhuME3AI=;
        b=XELhvY596K6qD2u0lLw5dJNtROs0P1h59YJzQ5TPT6XhtOUdRdW9DLT1C18KMlGFxE
         IB0ttJdTvkjUSSGIevsN/DGglNckXLMxCRlKwJBcQI+AQq4ke6u3xsgZNdro1LFR4APA
         n5Nz4jJn+20VaXBsBquxEbJQWJdf2IyT6tlIBwbnfbSudIzi+zIlJMk2ek+tKYEwUhfP
         mBx3J7cIGuEe3x3TNQvodZwJcbbDUC5vWnmcvdFrSHUNnRRMUSzYYHtuBttOwyi8Rz5e
         2njX0Y15O8TmlLo0J7HY01X11WWanBo06iKektVSz46+EICi8ipKtFdC0tSI2mvqlAcq
         izHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BdOvOOxFrgEHoNBKjWoXTbrloJ36jxHuqfmbhuME3AI=;
        b=Ow5Jy7MNnppM8Q+ovSABVX1Mivg89Vp+KgvK3nHpM6LvgRtjTzkhKuaC5oLYO6nayW
         a4/Smo10QTAXqXwO9O9MkdhaXSyMpgwSj9epLynwTD0CgFuiczliBPrI4Cc3Zd984z51
         dw6bOldGDEPQr7MDUSTyJJmHUWnCrhSQqCZAOrkubIXfgPxdHftSRnkNe7boteDN+ziy
         L3goNFMj3i9OS8mtiIZt9gqXKI5QWKMjdMfxqQMe3phBo5OiSGw3aFNUyJIQhl71viaV
         mSJ5XaZ3AmblBMaVULnPwYCsq1U5eHrnkEBNYcrwG4A8Ns2S9SBvUvGHKGFd2WnXd9hg
         gCYA==
X-Gm-Message-State: AJIora9y6DlERll/EmotxBnMdUTXwelS2UdHKxrk3KXjSRCH5SX/Uj2k
	rxQO+9yFCkpwQCaz7YTF8vI=
X-Google-Smtp-Source: AGRyM1umb/9TLFU9W5ohexbMT2vfhk1EbrTzo9dlgILKcY2CpfBnazv8UgFCCoKIKoFQAyXZh8t2aw==
X-Received: by 2002:a05:600c:1c83:b0:3a3:1f70:25a5 with SMTP id k3-20020a05600c1c8300b003a31f7025a5mr13118962wms.54.1658508967550;
        Fri, 22 Jul 2022 09:56:07 -0700 (PDT)
Message-ID: <b613e5e8-a63a-26b9-95c3-bd518689a130@gmail.com>
Date: Fri, 22 Jul 2022 17:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 08/14] IOMMU/x86: prefill newly allocate page tables
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <c9799df0-0d2e-106c-d1b1-0bd9b9f6db59@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <c9799df0-0d2e-106c-d1b1-0bd9b9f6db59@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:47, Jan Beulich wrote:
> Page tables are used for two purposes after allocation: They either
> start out all empty, or they are filled to replace a superpage.
> Subsequently, to replace all empty or fully contiguous page tables,
> contiguous sub-regions will be recorded within individual page tables.
> Install the initial set of markers immediately after allocation. Make
> sure to retain these markers when further populating a page table in
> preparation for it to replace a superpage.
> 
> The markers are simply 4-bit fields holding the order value of
> contiguous entries. To demonstrate this, if a page table had just 16
> entries, this would be the initial (fully contiguous) set of markers:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, and identical
> attributes, but also a respective number of all non-present (zero except
> for the markers) entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

