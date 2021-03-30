Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC934E8E7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 15:22:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103524.197490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lREJM-0007P0-Ak; Tue, 30 Mar 2021 13:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103524.197490; Tue, 30 Mar 2021 13:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lREJM-0007Nj-79; Tue, 30 Mar 2021 13:21:36 +0000
Received: by outflank-mailman (input) for mailman id 103524;
 Tue, 30 Mar 2021 13:21:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcch=I4=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lREJK-0007Ne-RG
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 13:21:34 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3e6cdcb-ef36-404a-8a31-a9076f44e8b6;
 Tue, 30 Mar 2021 13:21:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j7so16262858wrd.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Mar 2021 06:21:33 -0700 (PDT)
Received: from dell ([91.110.221.217])
 by smtp.gmail.com with ESMTPSA id m9sm34291744wro.52.2021.03.30.06.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:21:32 -0700 (PDT)
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
X-Inumbo-ID: f3e6cdcb-ef36-404a-8a31-a9076f44e8b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LkSzsuk6OkyHhMGQ1Io4HJGGD7LNCqzmJHjPWX4H0o8=;
        b=F1neuwXtz2jRrEO3s517BZAonUG9yq+a+buAzWhClqrFM43jqzvc07jkCvWF5txvUi
         sfjwuWoIzE8Eh3kFlUXyoC4iNUL1aycY1lpLUUKk/gmhbRnfpMzA1ckl86/YANQQPxE+
         r+cBg8JayJKdSSSGOOL7O5GAgbJB07wqKLKA0AIV28CWFa/mDLsZghznGf27CxSLaapP
         UgvecC8skd71MO6Q6iQaxkGe3pvMEFaxMQSibQiuX3k2XqvNG1eoqDqkbjI4Cfw6SOQp
         FK4OvJmZlREKEbpUWJm/NFpskLZrRUPGLT+uQSlz2sOpYBDH8nhUVsAVTcAYrtqOuhJa
         E9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LkSzsuk6OkyHhMGQ1Io4HJGGD7LNCqzmJHjPWX4H0o8=;
        b=AOiESaY96EJ8CbeKaAyB4lSXK1RGwbOCY2pB4MDvB3t4HPZE74gI3xLp8N/CHpdwMo
         qaiQFY+hy1MzoKF9lBPY4LZ5bpsqOHqfztoKcZ2m1DFhPM41X4/x5+OS85nlXruiKj82
         m5MlbeA/DkHIIEXbVkx9EibUkrQ4Fz4lkd9rcG7EOllZQre8DkkGWZVbQgFDELiMWMu0
         jkcf/RVOH9z4NuPaMW/UcMfEPzZyMSH1vf5c3ekLuvqTraIHCp1Naq3huTLWyCKBgnQN
         BRZOrV4hb8I0biX7Y8eBULe8fTl2oBW4LFDqsSXmYK1UN35fx5G+WYaA2J8Ll3flTW6L
         cW4Q==
X-Gm-Message-State: AOAM530zcjuqQKEnca5rDaNDrM4NU4dZsw6+p2dVORuv7ThMwJ/DQfje
	+4mV97Ab9G90RWv7D/Ecen3E6A==
X-Google-Smtp-Source: ABdhPJz9oD6yg4b32zNBbtgJAbD0h97AdahA/HWCNM/n6pjsO2hXvdH3WUU3ljzj3XmMUS4sQ/OGZA==
X-Received: by 2002:a5d:6a11:: with SMTP id m17mr35100628wru.361.1617110492938;
        Tue, 30 Mar 2021 06:21:32 -0700 (PDT)
Date: Tue, 30 Mar 2021 14:21:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	drbd-dev@lists.linbit.com, Jens Axboe <axboe@kernel.dk>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
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
Message-ID: <20210330132130.GK2916463@dell>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>

On Fri, 12 Mar 2021, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (11):
>   block: rsxx: core: Remove superfluous const qualifier
>   block: drbd: drbd_interval: Demote some kernel-doc abuses and fix
>     another header
>   block: mtip32xx: mtip32xx: Mark debugging variable 'start' as
>     __maybe_unused
>   block: drbd: drbd_state: Fix some function documentation issues
>   block: drbd: drbd_receiver: Demote non-conformant kernel-doc headers
>   block: drbd: drbd_main: Remove duplicate field initialisation
>   block: drbd: drbd_nl: Make conversion to 'enum drbd_ret_code' explicit
>   block: drbd: drbd_main: Fix a bunch of function documentation
>     discrepancies
>   block: drbd: drbd_receiver: Demote less than half complete kernel-doc
>     header
>   block: xen-blkfront: Demote kernel-doc abuses
>   block: drbd: drbd_nl: Demote half-complete kernel-doc headers

Would you like me to resubmit these?

>  drivers/block/drbd/drbd_interval.c |  8 +++++---
>  drivers/block/drbd/drbd_main.c     | 30 +++++++++++++++---------------
>  drivers/block/drbd/drbd_nl.c       | 17 ++++++++++-------
>  drivers/block/drbd/drbd_receiver.c | 26 ++++++++++++--------------
>  drivers/block/drbd/drbd_state.c    |  7 ++++---
>  drivers/block/mtip32xx/mtip32xx.c  |  2 +-
>  drivers/block/rsxx/core.c          |  2 +-
>  drivers/block/xen-blkfront.c       |  6 +++---
>  8 files changed, 51 insertions(+), 47 deletions(-)
> 
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: drbd-dev@lists.linbit.com
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Joshua Morris <josh.h.morris@us.ibm.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
> Cc: linux-block@vger.kernel.org
> Cc: Philip Kelleher <pjk1939@linux.ibm.com>
> Cc: Philipp Reisner <philipp.reisner@linbit.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

