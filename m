Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5D44794B3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248823.429191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIlv-0004hE-J9; Fri, 17 Dec 2021 19:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248823.429191; Fri, 17 Dec 2021 19:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myIlv-0004ef-Ff; Fri, 17 Dec 2021 19:20:03 +0000
Received: by outflank-mailman (input) for mailman id 248823;
 Fri, 17 Dec 2021 19:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyUW=RC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1myIlu-0004WC-M3
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:20:02 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54d50434-5f6e-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 20:20:01 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id p8so4910832ljo.5
 for <xen-devel@lists.xenproject.org>; Fri, 17 Dec 2021 11:20:01 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a24sm339941lff.207.2021.12.17.11.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 11:20:01 -0800 (PST)
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
X-Inumbo-ID: 54d50434-5f6e-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=avniy9qb4J011EGRN+LaM7W8paozVJQP0KxTT2YMfaI=;
        b=MmZZ46PcYUUcsjmI/6xOuddxmuVgQ6bMgQ0ASaTyyLNeKGdg9ol6X343+95usrqR75
         H4KcFPS2cQArCZfqlpcoIOIV3uhcxJa2ClF8JD61FYZjPxF+HMsg6+8y/3e4mye3hgkW
         oD25yg67te8Tr2gjxgmNiAOND35jg195cag2g103GmdxE73fC9AUDaaBEEehYiWWvL0E
         /FFHnTk5Qt3WL7s24klLc2g5qpcHEvOfz1XEHcC2PCufm47sgIjZG1Fw/Mat7Bs8sd9v
         9bf2N6AzMn4fP9DoS8aH0zsi1xRARwwqm0Jj+K0Dpp9llPi2H61rgYWfPAoaaDnCrjxy
         +62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=avniy9qb4J011EGRN+LaM7W8paozVJQP0KxTT2YMfaI=;
        b=2GPpT0Xg7wnoZkbkKLXf5AaXBJSS5BIOIVPJ+9bRe6+bugLf6zZvHK+g4D9fhQfTXV
         y17TDOkGHBu+lg+jfVPKR3MCztlSBk6ML8gpv0M7SfR4opWzFQTDoW/OtHtIuf/vCxvc
         LZojdX/FsRRCo5YsZptzPLe+B6gPKDHaZnx9Qqs3ehxoXgiRPe108gXIT0weCDj0mrdn
         TtZxaBquAo4VL+gGY83+uUfY8SZRQrvTu4pv/zKrX/jHLsUYAhGWJAcAgiYrT+WNNx/J
         H+uD/k/5KiGPymKx4Op88YRzseXIt1oDRQfAxW5LhdbfeudOUCbRaIfzMkOzQ6SCJoFW
         sXIg==
X-Gm-Message-State: AOAM533IWjqX/tp4bWM6UHv8X/6kGBTWVBVt1ZzmDCmi/F3Opezy92IX
	tZ3/7KB/BLyEq0Mk9PkG03Q=
X-Google-Smtp-Source: ABdhPJy7CxY1qWp/EPeAjEl66DV9k+C/gmL7Ac9Rt9DdSeaIt1InGxFiQfFj9ED1FOvrVTa+NN711Q==
X-Received: by 2002:a2e:b169:: with SMTP id a9mr4031507ljm.369.1639768801238;
        Fri, 17 Dec 2021 11:20:01 -0800 (PST)
Subject: Re: [PATCH V4 0/6] xen: Add support of extended regions (safe ranges)
 on Arm
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
 <1428a0be-b80c-f996-1f72-6545dd66c1bf@gmail.com>
 <81c97e6a-f5e3-3f5d-c9ae-a35933cf4e61@oracle.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4cc296cc-c7d5-1bce-4074-b708a18d9304@gmail.com>
Date: Fri, 17 Dec 2021 21:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81c97e6a-f5e3-3f5d-c9ae-a35933cf4e61@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 17.12.21 21:13, Boris Ostrovsky wrote:

Hi Boris

>
> On 12/16/21 5:02 PM, Oleksandr wrote:
>>
>> On 09.12.21 22:05, Oleksandr Tyshchenko wrote:
>>
>>
>> Hello Juergen, Boris
>>
>>
>> May I please ask, are you happy (or otherwise) with current patch 
>> series (I assume, especially with commits #3-4)?
>
>
> I think I mentioned last time, in patch 4:
>
>
> +    if (target_resource != &iomem_resource) {
> +        tmp_res = kzalloc(sizeof(*tmp_res), GFP_KERNEL);
> +        if (!res) {

Yes, this is already fixed in V4 of patch [1]



>
>
> Other than that --- LGTM.
Thank you!


[1] 
https://lore.kernel.org/xen-devel/1639080336-26573-5-git-send-email-olekstysh@gmail.com/


>
>
> -boris
>
-- 
Regards,

Oleksandr Tyshchenko


