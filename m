Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69B78F302
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 21:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594049.927227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbmvR-0006tN-Pl; Thu, 31 Aug 2023 19:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594049.927227; Thu, 31 Aug 2023 19:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbmvR-0006qq-Md; Thu, 31 Aug 2023 19:01:53 +0000
Received: by outflank-mailman (input) for mailman id 594049;
 Thu, 31 Aug 2023 19:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vZ63=EQ=linaro.org=alexey.klimov@srs-se1.protection.inumbo.net>)
 id 1qbmvP-0006qh-Mf
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 19:01:51 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d594e795-4830-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 21:01:48 +0200 (CEST)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-44e9888ebebso551334137.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 12:01:48 -0700 (PDT)
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
X-Inumbo-ID: d594e795-4830-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693508507; x=1694113307; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ewAsCy7jBWH9EeyDoSt/t+eZtagHG/4Iud94/qveiRw=;
        b=uHnP7gVDeSzW9Wt/nTyhP7KKVtOKFrkOP+0Cb4ND89mu77/+7RWdpsAGmm+/TxmikB
         a5eHt+DBwIijItmTVhLNOLhiwLxEuIEpMlZAkMg/mSnMuImmwz8laUYiQzPnBhmfInia
         MztoJMiZecmYQ2Z6lkCESDb8WalTtnEQcWss4YY9CsfE1Q9BBE7HIp7mqXKgcvwNj/Vt
         /NIwW7QJictbhkcJn8vi9s3zcgG0OQSBdrjJDmJ3Q6RqL/nbGLGny7KwAGhuSIwwVgkR
         zmkv0lIMPD5q6kn3NLaah0FxAZPR7j+QDpeRexr2vxIbc7cWQkO7Euu4MtKIcrv3JNDH
         2voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693508507; x=1694113307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewAsCy7jBWH9EeyDoSt/t+eZtagHG/4Iud94/qveiRw=;
        b=Ph4R6FaV1v3cNTgWTL7wYt9Nztd8N6Aq4iouF+Eo2vq4mcGO+Y4P8PjDQyt+AnckFg
         tz+9XBIEwgw9ULqytXkgyld5xBnzIv3JcHiUjDy15+94Y/NwTevxeP2AdxpVEsLNTsp6
         L1VZsvjk3P7OE87vWHItPrhG1TLsJLhrt+OuMPGXdo/G/TVi5oMAPvjRp3CuRL6TWRJl
         uykBR6jaKWnz7drrBMpup9ZwFvlz0d61GPQyk0BTCSX8Qq12vE81pi6cwk2dQ1e1l7OG
         tHpDCznkqfG1wY/XmxqG7XyLGMIuCs78tJtrfaR69gkFNO/9rvNc+HWlQPKUMb/IUN70
         z88Q==
X-Gm-Message-State: AOJu0YzH7d2KkFFMOUeo+QVLwmDP8/MY6TE46X4+yB2xBpJ+Tnh4xIlN
	cNTauwQZ/0nJOr+8k5Vui3CJLyEqe4x22Jfor4xoHf28jbMkyDOnDFg=
X-Google-Smtp-Source: AGHT+IGvxQMM6RGGJAds2dELNcfcTy52FWLnl9ApR8KOPS0CndpSLx3Qqgd9UJebutln+fp86EIfU746VKEFSwne0tk=
X-Received: by 2002:a67:f954:0:b0:44e:a5f4:3e09 with SMTP id
 u20-20020a67f954000000b0044ea5f43e09mr547748vsq.16.1693508506868; Thu, 31 Aug
 2023 12:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230831110107.2747633-1-leo.yan@linaro.org> <20230831110107.2747633-3-leo.yan@linaro.org>
In-Reply-To: <20230831110107.2747633-3-leo.yan@linaro.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 31 Aug 2023 20:01:36 +0100
Message-ID: <CANgGJDozu2P9Xt+SD8cjRqrehWNpzijLu=j6eQPVs=ZhWCR7Xg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] xen/arm: Enlarge identity map space to 127TiB
To: Leo Yan <leo.yan@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Aug 2023 at 12:01, Leo Yan <leo.yan@linaro.org> wrote:
>
> On some platforms, the memory regions could be:
>
>   (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
>   (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
>   (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
>   (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
>
> In this case, the Xen binary is loaded above 2TB, so Xen fails to boot
> up due to the out of the identity map space.
>
> This patch enlarges identity map space to 127TiB, which can support the
> memory space [0x0 .. 0x00007eff_ffff_ffff], thus it has flexibility for
> support different platforms.
>
> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Feel free to use:
Tested-by: Alexey Klimov <alexey.klimov@linaro.org>

I confirm that I can boot Xen with these two patches and start a guest VM.

Thanks,
Alexey

