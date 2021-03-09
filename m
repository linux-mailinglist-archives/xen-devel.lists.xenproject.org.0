Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0233329A2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 16:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95557.180457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdua-0006An-L6; Tue, 09 Mar 2021 15:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95557.180457; Tue, 09 Mar 2021 15:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdua-0006AS-Hu; Tue, 09 Mar 2021 15:04:40 +0000
Received: by outflank-mailman (input) for mailman id 95557;
 Tue, 09 Mar 2021 15:04:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWBa=IH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lJduY-0006AN-QX
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 15:04:38 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 411cac64-0c33-459f-b4ec-60eb1975abd1;
 Tue, 09 Mar 2021 15:04:38 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j2so16247056wrx.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Mar 2021 07:04:38 -0800 (PST)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id c131sm1809037wma.37.2021.03.09.07.04.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 07:04:37 -0800 (PST)
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
X-Inumbo-ID: 411cac64-0c33-459f-b4ec-60eb1975abd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yPCeCmLY5uTHUZgK/4sVQkhvTaWHvCR2Gtxf5gLPmpQ=;
        b=Fii5q1M/CcaaPkS6vDU8fE6lKJeBapHuMznV0Zp/QeZ48XD7mhbTPx2D0d1klLAq9f
         QTj4mTLzuL5gjePHUv4T2KXRnTuXVG0EGcQEouwcFhnJQXJRESzOXGeEXb+7rsv6scOZ
         lMryl/N4UZyIMe5iAgy0PmIDG9273D6uE0q1H0NNFxyvAUPe+nMOdGJ2sGOTBlNhUDtm
         7qJulTzb/IXryYc75UUPYKiVH8w56DjeA0Y0GCyCeqSgDW5UPcDu/JvwLYNlsXiV7VU8
         WvZlNBFOGpkQb+oLHk6JcLTEVO4MSxByvqfeHXv4MjW++1BUGIcrBn8FbJxY2uu6loks
         2Bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yPCeCmLY5uTHUZgK/4sVQkhvTaWHvCR2Gtxf5gLPmpQ=;
        b=dIWXe8lShY45xw7pvCMY82tWqKuZvxDCnDlk4osmY4jhd4fDlLxs+JTXLeSWBCBpaR
         yVhrS4WZvDNYULHXKNOWMeXYCie99RF9JAU+Zs0QDs7Jkgj450A1YeIhVNRdqKJvS8kj
         Muvt9OrxdlOe78aPJ0hWk8qawGPs+RVmTpEQIQ30FEBK0FZMBbgaYtzua+UbxxzONp2X
         Ha35V4qMWn4cSqgg9/1/eIqW9UDfSxYc7+cpJtcV8pl9o4gzWsEnP1WA09ariXIwXU5r
         a1rxSgFgRIWSUcmQk2d9VPl3q8ai18UgZWczF62WnI39Ib5KBtRXSWDdqZ+k/kxaW/0G
         Xv2Q==
X-Gm-Message-State: AOAM530q1jWXUwXsVjgUeKZ/2BvXsXeWRmzq18spWwajreJ6I838C4My
	Hu8y+s/BoCoFD3sWkthqXeiDxc6Ddx4=
X-Google-Smtp-Source: ABdhPJygZf0ltgIOrudQNt17FBIOHCbToM2JAayRR+d59rfljSi4bQHdN//seu6P1huApZfMliE1Sg==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr28377761wrn.59.1615302277315;
        Tue, 09 Mar 2021 07:04:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH 4.15 1/3] MAINTAINERS: Make myself the owner of the
 changelog
To: xen-devel@lists.xenproject.org
References: <20210309145002.30359-1-iwj@xenproject.org>
 <20210309145002.30359-2-iwj@xenproject.org>
Message-ID: <8a8c5d10-8a44-bb03-4611-d404ee19c1d3@xen.org>
Date: Tue, 9 Mar 2021 15:04:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309145002.30359-2-iwj@xenproject.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/03/2021 14:50, Ian Jackson wrote:
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

Perhaps we need a release.manager@xenproject.org alias that can be 
passed along. Anyway...

Acked-by: Paul Durrant <paul@xen.org>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a5c481543..6a7fa8717e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -256,7 +256,7 @@ S:	Supported
>   F:	xen/drivers/passthrough/arm/smmu-v3.c
>   
>   Change Log
> -M:	Paul Durrant <paul@xen.org>
> +M:	Ian Jackson <iwj@xenproject.org>
>   R:	Community Manager <community.manager@xenproject.org>
>   S:	Maintained
>   F:	CHANGELOG.md
> 


