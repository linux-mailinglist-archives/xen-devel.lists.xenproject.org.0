Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D907CAA86
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617610.960358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO3H-0006ig-Mk; Mon, 16 Oct 2023 13:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617610.960358; Mon, 16 Oct 2023 13:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsO3H-0006eq-Ih; Mon, 16 Oct 2023 13:54:35 +0000
Received: by outflank-mailman (input) for mailman id 617610;
 Mon, 16 Oct 2023 13:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RUhr=F6=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qsO3F-0006ej-UV
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:54:33 +0000
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 881a50c8-6c2b-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:54:32 +0200 (CEST)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6ba54c3ed97so1807220b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 06:54:32 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.49.160])
 by smtp.gmail.com with ESMTPSA id
 s68-20020a625e47000000b006be0b0fc83asm2466772pfb.125.2023.10.16.06.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 06:54:30 -0700 (PDT)
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
X-Inumbo-ID: 881a50c8-6c2b-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697464471; x=1698069271; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n2W2Sl9fNt1XcXfOZDPJL3Xceq/89J+CNdFTnWlpqOU=;
        b=ZZQqIxKK/8i1Yw8GAk5xzVR9lK+CYiCXVTHy9w1K+c+G7pFopTCSCIJKghqGC79UeS
         opFBi1nfmaFjED3o9xDdaLej6V5yNdSdgavGUW7m0twOb0+I9GRXU9rLjbVDmdkWN8iV
         OcAQnuBGjtK5dguLhs0qAyW6pNB9lRLf1sPc5bUe+C3V0Ggn2rna/mHFXp+ebk30pbYx
         KomUjt/H9vd1hN6dwyq+3d9825t7AZJcFxnj+iHtPsyXdGjefr2NjtUqnac+qWQ6KqxO
         y1ufkUjZRbfjRvbW7SbQvP86RTtxk0lIeCdCvW57KCrhQ1myQbvSMSS4oXtIP+zNuEbY
         JoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697464471; x=1698069271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2W2Sl9fNt1XcXfOZDPJL3Xceq/89J+CNdFTnWlpqOU=;
        b=vGnI1Ns5iRM6fOIBB09CbF+FB82BJ9BKByo1RzcbNtRlk8CQ6LK78y2Ygpj8Qm6xHP
         lbvZ9/nkliORog8o/bRdAayd7r++CtNMZ7Ne7yPsO6HACpfdwqzP3M9eZHlq8sY2ehFn
         tCWHlm9z6KNcKtGFLupeaggOuXWcuk3+suH8ZU1rQKxSWHHXZWJH0sUtQQ17CzV8ACYV
         xMLNBLpPGMoNaF3guCx2ZE5ZbCAXgF+6DfpAJArt7nDhnyfeQ7DQ0m8w2LE9q3qmbHTA
         UEV02CiAg1Zx4EBh6Q2pVQ9R1AKb2qCGxhW0tQY/+qxCO28d76ln0ON6FNCc4RVnpIar
         4HGg==
X-Gm-Message-State: AOJu0YxnJ980uR3U1p6ik6HHH3NWUPrC1tRflhVespMYmpufsAVNV+cS
	2HXC8RXnLRJCyLQC3YvmIrk3yPgXPN4uyZydyEuuKA==
X-Google-Smtp-Source: AGHT+IGUYIrqhb0n+/TtByZJegHy7Pl8STvGAzaySzWq86BwG2GYaCPsRFXJqG6MA3A+Y6Whj7MGOA==
X-Received: by 2002:a05:6a00:138e:b0:6be:62e:d5bc with SMTP id t14-20020a056a00138e00b006be062ed5bcmr4697550pfg.3.1697464471182;
        Mon, 16 Oct 2023 06:54:31 -0700 (PDT)
Date: Mon, 16 Oct 2023 21:54:27 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Message-ID: <20231016135427.GI928468@leoy-huanghe.lan>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <83ABBD09-D994-4DA3-8F10-15D87BCC2CF1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83ABBD09-D994-4DA3-8F10-15D87BCC2CF1@arm.com>

On Mon, Oct 16, 2023 at 01:40:26PM +0000, Bertrand Marquis wrote:

[...]

> > This patch enlarges identity map space to 10TB, allowing module loading
> > within the range of [0x0 .. 0x000009ff_ffff_ffff].
> > 
> > Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> 
> I agree with Michal here, this is not a fix so this should be removed (can be done
> on commit).

This is fine for me.

I'd like to confirm with maintainers that should I spin a new patch
set to remove the fix tag?  Or maintainers could help to remove it
when pick up this patch set.

And thanks for review, Michal and Bertrand.

Leo

> > Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Cheers
> Bertrand

