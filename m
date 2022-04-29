Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0215143AF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 10:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317014.536149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLjL-00033d-N7; Fri, 29 Apr 2022 08:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317014.536149; Fri, 29 Apr 2022 08:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkLjL-00031i-JN; Fri, 29 Apr 2022 08:11:59 +0000
Received: by outflank-mailman (input) for mailman id 317014;
 Fri, 29 Apr 2022 08:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+GC=VH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nkLjK-00031a-8G
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 08:11:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 091e2afc-c794-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 10:11:56 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso6572600wme.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 Apr 2022 01:11:57 -0700 (PDT)
Received: from [10.7.237.11] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a1ce910000000b0038eabd31749sm2222371wmc.32.2022.04.29.01.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:11:56 -0700 (PDT)
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
X-Inumbo-ID: 091e2afc-c794-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XqvrYci+95js6f4mZtp9h/yUnthzubPuS18nX3bTZPY=;
        b=Agh0hWfNWOLsgMtRQM7cd5+lULJfekaq2Bdh3j5NJrn8b77Zijoq0Lzu+L84ZM2LVz
         wt1r36bJC8X6sII7aa0Y1uCvfy4g0T+Wg9D0SorY0VU7U5eyo+kztqsvp/jueHRWzWzq
         Clcs/GPXTwguYJs/ySHdd4cVkPfhD7usB5qc1a4HNTnkYp8PYLFPtPSZ0K7NsQXyHsce
         TMHr7eRmKAKhHpRhZdf9P8Yc0fC+6ukgaRo55rChtq9CrWhXGHGrwvZl7oJXgq9/ekOV
         ejIe2PNvw6G5fOikA75aBhkkFGyeLnA85N/DohY9YkAcFI/QMcwRGVZXPcl/thf+D2TZ
         1wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XqvrYci+95js6f4mZtp9h/yUnthzubPuS18nX3bTZPY=;
        b=c//HKzxK8gYrND187unyiedkbwEHnYsPthUdKOCdSeO2oxF6s9B2J+WesIbDWylZlm
         b9Vm0/kg47n5AjisPxDihy8Q/yvzRlMaohdgMmCB4pfldqaXQQZMB0lVETTHWiNfqCpr
         iXv2xpIIRFEUk90Lz7WP6gDrRKR1xDx5LV+AIjT36DR3BbsD5xjcirjV+YdIF/IN/M81
         BGdyfgASPwEHil7eMExeKMVL5X/yEifR/IVs6W/Ucjqn+b2jt2DfPwmG5saz14cDABMk
         8NXxRKEEVlCJWcnDJafw9zOTUA1jMlfBqT+ji2jCIJgyvIbAhjm9sWkMnR8UFF3GPpKq
         i+Xg==
X-Gm-Message-State: AOAM530oNZcSUT83b/FrZ24gt8UprnDiw5A6EZFzInbhmWpeR3fTGZ8C
	YD9H4nSJbMKDwyIyuDNYr2A=
X-Google-Smtp-Source: ABdhPJzYf70fG27iHwc3wFbKY4QIqsyyUy9X0QI973D1I4SxhcbTK5uGUHInLMnygbTBJgrDh3XA3g==
X-Received: by 2002:a7b:cbc2:0:b0:388:faec:2036 with SMTP id n2-20020a7bcbc2000000b00388faec2036mr2089539wmi.190.1651219916786;
        Fri, 29 Apr 2022 01:11:56 -0700 (PDT)
Message-ID: <c962f441-05b8-8aa1-5186-c85251f3e0ba@gmail.com>
Date: Fri, 29 Apr 2022 09:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH net-next v2 01/15] eth: remove copies of the
 NAPI_POLL_WEIGHT define
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, pabeni@redhat.com
Cc: edumazet@google.com, netdev@vger.kernel.org, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, mlindner@marvell.com, stephen@networkplumber.org,
 nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, matthias.bgg@gmail.com, grygorii.strashko@ti.com,
 wei.liu@kernel.org, paul@xen.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20220428212323.104417-1-kuba@kernel.org>
 <20220428212323.104417-2-kuba@kernel.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220428212323.104417-2-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2022 22:23, Jakub Kicinski wrote:
> Defining local versions of NAPI_POLL_WEIGHT with the same
> values in the drivers just makes refactoring harder.
> 
> Drop the special defines in a bunch of drivers where the
> removal is relatively simple so grouping into one patch
> does not impact reviewability.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: ulli.kroll@googlemail.com
> CC: linus.walleij@linaro.org
> CC: mlindner@marvell.com
> CC: stephen@networkplumber.org
> CC: nbd@nbd.name
> CC: john@phrozen.org
> CC: sean.wang@mediatek.com
> CC: Mark-MC.Lee@mediatek.com
> CC: matthias.bgg@gmail.com
> CC: grygorii.strashko@ti.com
> CC: wei.liu@kernel.org
> CC: paul@xen.org
> CC: prabhakar.mahadev-lad.rj@bp.renesas.com
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
> CC: linux-omap@vger.kernel.org
> CC: xen-devel@lists.xenproject.org
> ---
>   drivers/net/ethernet/cortina/gemini.c         | 4 +---
>   drivers/net/ethernet/marvell/skge.c           | 3 +--
>   drivers/net/ethernet/marvell/sky2.c           | 3 +--
>   drivers/net/ethernet/mediatek/mtk_star_emac.c | 3 +--
>   drivers/net/ethernet/ti/davinci_emac.c        | 3 +--
>   drivers/net/ethernet/ti/netcp_core.c          | 5 ++---
>   drivers/net/xen-netback/interface.c           | 3 +--
>   7 files changed, 8 insertions(+), 16 deletions(-)
> 

xen-netback patch...

Reviewed-by: Paul Durrant <paul@xen.org>

