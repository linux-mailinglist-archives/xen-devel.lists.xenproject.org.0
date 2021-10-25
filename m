Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612C43A831
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 01:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216114.375594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf9Po-000180-Th; Mon, 25 Oct 2021 23:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216114.375594; Mon, 25 Oct 2021 23:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf9Po-00014G-OI; Mon, 25 Oct 2021 23:30:04 +0000
Received: by outflank-mailman (input) for mailman id 216114;
 Mon, 25 Oct 2021 23:30:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKMe=PN=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1mf9Pn-0000u9-DO
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 23:30:03 +0000
Received: from mail-pf1-x42f.google.com (unknown [2607:f8b0:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d0b6e2-ad74-486a-b937-7b1019ef4549;
 Mon, 25 Oct 2021 23:30:02 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id f11so12390620pfc.12
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 16:30:02 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id 17sm18371534pgr.10.2021.10.25.16.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 16:30:01 -0700 (PDT)
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
X-Inumbo-ID: e2d0b6e2-ad74-486a-b937-7b1019ef4549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OikzpJy+ulJ/iMPwSBk+Y4Qdnv1zoI4G2kzh3S5KjZM=;
        b=niw1O1xOaY9hFPDD8aUNNrjsW9u7HwlbmG6x6SNsYU3yjleoefJrZVsAm6SP8NuMjP
         o23nxHuB9LRuLkmRK2UiQTUmVNUMeI2aUdskZVzE3kgHOaWyfAnzcjpSnjQ9GFvYWsdG
         ZgdU7ewZjtu9Zxi9AwvEcfdEr5jiZmlfmbioVfyDYsHUnJ3k+v19ddXVwQV+2dzjsbm1
         rd/Foo/V5GZ7FcPhAG8S9s8VIgf78dUk+e2NSAsg0qG+bevmGflOwurxALQD2vhb0uGz
         NGYqiGIGbibAYCwIWp6EhQJ4nOKzZQZAlKnxlFMEaL9H3kiE9egr8ez2CYR1OxZeO16A
         znTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OikzpJy+ulJ/iMPwSBk+Y4Qdnv1zoI4G2kzh3S5KjZM=;
        b=gJgSAHcq6k3k88uESSCQZeV0kwr+vaUbuiTcGm8VH+It1ECJZVAGIANRtPMLTTQcl0
         EY070JvCkLYrV3D4RSNlURQ2Iwkn9gzPjWWscvfmhFZMCl09SDIjSQ8OwYOHwooFurpC
         gOIsjvxvyTz7qNxmbUIviyrylzllFQQlL0AMyYKZpXKAoXYXDA6Zon7bWZXAy3kRjOCf
         rbKJmzMs3rjYm5vtlkggc/6ztrhEjm70pYAJZQV1iLwOLYEZNJNFkWN4sZrXzuY8YBaS
         x2wYgTul5nRCB2lJ7TxZtJhSP5dTDkFTjsFkewjS0qNclwJUSepCnlYmhE1BCmkYwf/c
         edLA==
X-Gm-Message-State: AOAM5328ARl0QRDFmh4jaWvi2VA68YQVoBU7DW0rdpH/opvni7fav3Zf
	DerLnVPwrz3Z1jbBJvCiPEQvqTN1guY=
X-Google-Smtp-Source: ABdhPJxaIKGEf2USmRDZLHOcP+kwnUC5n6wwg3jX/sVXLhqW+xa5nJ1+8RyfSCoGTxRcq20hfuuFAg==
X-Received: by 2002:a63:ab02:: with SMTP id p2mr15989657pgf.209.1635204601641;
        Mon, 25 Oct 2021 16:30:01 -0700 (PDT)
Subject: Re: [RESEND 0/5] ARM/arm64: arm_pm_restart removal
To: Lee Jones <lee.jones@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 lorenzo.pieralisi@arm.com, sstabellini@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, linux@roeck-us.net, treding@nvidia.com,
 arnd@arndb.de, xen-devel@lists.xenproject.org, patches@armlinux.org.uk
References: <20210604140357.2602028-1-lee.jones@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <526fe66f-df08-c873-2a20-f1295e30a855@gmail.com>
Date: Mon, 25 Oct 2021 16:29:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210604140357.2602028-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/4/21 7:03 AM, Lee Jones wrote:
> This is a rebase/refresh of a set sent out, reviewed,
> then forgotten about.  It's still considered useful.
> 
> Here is an excerpt from the previous attempt:
> 
>  "Hi Russell, ARM SoC maintainers,
> 
>  here's the full set of patches that remove arm_pm_restart as discussed
>  earlier. There's some background on the series in this thread:
> 
> 	https://lore.kernel.org/linux-arm-kernel/20170130110512.6943-1-thierry.reding@gmail.com/
> 
>  I also have a set of patches that build on top of this and try to add
>  something slightly more formal by adding a power/reset framework that
>  driver can register with. If we can get this series merged, I'll find
>  some time to refresh those patches and send out for review again.

What happened to this patch series? Is there any chance we will get it
included at some point? It is included in the Android13-5.10 tree AFAICT
-- 
Florian

