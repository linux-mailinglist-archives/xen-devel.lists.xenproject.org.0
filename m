Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A29355808
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106080.202850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnhB-0006Gr-81; Tue, 06 Apr 2021 15:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106080.202850; Tue, 06 Apr 2021 15:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnhB-0006GS-4s; Tue, 06 Apr 2021 15:32:49 +0000
Received: by outflank-mailman (input) for mailman id 106080;
 Tue, 06 Apr 2021 15:32:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ww1H=JD=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lTnh9-0006GN-Mt
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:32:47 +0000
Received: from mail-ej1-x62b.google.com (unknown [2a00:1450:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2bee4c4-42ca-4470-9e56-e52bcc53f492;
 Tue, 06 Apr 2021 15:32:46 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id b7so22679268ejv.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 08:32:46 -0700 (PDT)
Received: from dell ([91.110.221.193])
 by smtp.gmail.com with ESMTPSA id um13sm4757402ejb.84.2021.04.06.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:32:45 -0700 (PDT)
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
X-Inumbo-ID: a2bee4c4-42ca-4470-9e56-e52bcc53f492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ngPnB11Rpcpn6j95lYf0RFQG3fh878RPxrpeNe+ppTQ=;
        b=In+em3Cagf76ZFfcAAnRPlOcDr63uCGRsKH+1ZNR9xGyg2hY6L2IgKzMc1DgENfYKc
         PZTHLYIqAJDBRPPrq3mmAZ1M4NehV45GFYzXGsCtNnSiJdosoHNjK3IMNZCx8//heelt
         1squCfmQMPxtLjQo/zMNJDCRjQilbxcvToByhW/93Q35Rgi6OhVBSuRJPMpVA2IcKxBO
         SCjrVaO1EdMsSBaCKwJu+P8IY+atL+bLpgu/FLlCFqceXR4YnbkyxR5eEdOtDxSss213
         /vlg7yRmFS5jNGBNUkHdkua8rQMFE96dEpiIcyYx3lJkFfKoXjL4cLm+2nLP6hbJuBos
         ILgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ngPnB11Rpcpn6j95lYf0RFQG3fh878RPxrpeNe+ppTQ=;
        b=sTl8dRTfX3gJ2q/8R4v5JHzKmQ+AeTfQvilDhy4rIKiM0wCkXypBW9yq+KcGMxzHLf
         IxXmfpSI0HHiMU6I46PJoX2prkzKml90GMZATgbR172geUTKfzLOM8P1x3eq0RlvEJuR
         2lFLcLf255lCFArYECa2STpnmMyK0hKL1VZ8dOjCscMBZV+s0vjsvZdfV6yn/ajewDAY
         dgkFTPPtR6xWg+r32LP8V/t/iE8Rs5JMvVYQo1Z2nhVWyaJpmp2CcWDHplpq9YS3C+Sz
         zK7YGooXWiSB99ELLJizjBtmYCpE2m478VTmE9WrBKsgOoeLlmUgCG6ofFWuuKc27+Ls
         bzDg==
X-Gm-Message-State: AOAM533v3+wtwrmp7rIlkq/r9FfIJyp5I0tiRopKm0y+EVxHuTZ07IZP
	PHtWatrRsgEuxO9ECTZ3N19wgw==
X-Google-Smtp-Source: ABdhPJxBTCrBfzzVEuMPpPm6mg4voiraukMpw00AzU44N+vDeOW/nX58Vtb5To6nYmviQM2bZTZSFA==
X-Received: by 2002:a17:906:4d46:: with SMTP id b6mr8437549ejv.262.1617723165958;
        Tue, 06 Apr 2021 08:32:45 -0700 (PDT)
Date: Tue, 6 Apr 2021 16:32:43 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	drbd-dev@lists.linbit.com, Joshua Morris <josh.h.morris@us.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-block@vger.kernel.org,
	Philip Kelleher <pjk1939@linux.ibm.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/11] Rid W=1 warnings from Block
Message-ID: <20210406153243.GV2916463@dell>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
 <33a06c9d-58b6-c9bf-a119-6d2a3e37b955@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33a06c9d-58b6-c9bf-a119-6d2a3e37b955@kernel.dk>

On Tue, 06 Apr 2021, Jens Axboe wrote:

> On 3/12/21 3:55 AM, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> 
> Applied 2-11, 1 is already in the my tree.

Superstar, thanks Jens.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

