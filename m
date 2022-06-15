Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F68054C49A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 11:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349777.575936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PHE-00041q-8p; Wed, 15 Jun 2022 09:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349777.575936; Wed, 15 Jun 2022 09:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PHE-0003yy-5f; Wed, 15 Jun 2022 09:25:28 +0000
Received: by outflank-mailman (input) for mailman id 349777;
 Wed, 15 Jun 2022 09:25:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lpwu=WW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1o1PHD-0003ys-6h
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 09:25:27 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15422b2d-ec8d-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 11:25:25 +0200 (CEST)
Received: by mail-pg1-x534.google.com with SMTP id 184so10827402pga.12
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jun 2022 02:25:24 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 v2-20020a17090a778200b001ea90dada74sm1231965pjk.12.2022.06.15.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 02:25:21 -0700 (PDT)
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
X-Inumbo-ID: 15422b2d-ec8d-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QD1mf5DnBqcLEVOFoiWBRR1QBiCXzXfoEa1RUQMHEbg=;
        b=gmVSCn46TlF8cm8ao3weZQ1dQ+919xti8x+JNTqvEbhjNEFZdvPMGRwZbobjNM3xbf
         uC1/HxtqLlOGh00UA96fBXAz35WiunpTXGZzV5kQH/ocYMckFGEggHTjUPX+MI/pZmOc
         0Nyfs4DBuxMJLPDFXQUFccwTvxRzbEGEEK+TKSrcCe+eTJmjpPY47aruJ1kRn/cku3kK
         luPIiVacfBtMMAvwPdeNm4mBL5eFXYP++g0eRxmGW7FuPJI23ZPCpYI5ypPiJCZkOwWa
         9BR0ntAlHQ+6Q4rk86UEoZfkZ/Qds91d142Z3ertz6dMEcCU9As+k+oOuPVQSa+tI6ap
         YaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QD1mf5DnBqcLEVOFoiWBRR1QBiCXzXfoEa1RUQMHEbg=;
        b=6UVpNskCEcY7TO04sT2FJ0dBT1w9SFxTSpxab/IPAakWujHHBgiusySQC0ccDzTno/
         wtEz1dSXdeRQ23VIEeiS9rzJABygCaZcr9frmrJSK2WjGK6lDX+1bKExtjX44POTPlqq
         4k/xa/SeMd2ddejxGr167Xf9djKUm+vAOShpFIT69FU85JCNemNulnptNwXU5ITojcRS
         X/OroUCfddYv4PYVxMNJGtGZcPt33ndyDdodUEzC2YVMT8rsPmCbWApIOvjhokp5s5kF
         PiwMClBgsdtdXIUmMDHD9fCkrqMz2y+JakTE6EWpryDDwaPReLa6sj4oUQDiriXUO2iV
         Ff9A==
X-Gm-Message-State: AOAM532ICMVyGJ7bygDeg6uEAmE+ACkpcekQ8zrGWIeo4rnhplq32lLh
	Z0ZH5s2QZqI8oT3wd1o8mMnlcw==
X-Google-Smtp-Source: ABdhPJy/EMp63lY79wavrcwsuOIlryAFSfAtHCajQFGqGhcTul+yPCkHJc1P94NUfLJmE8bfCaxLrA==
X-Received: by 2002:a63:6c4a:0:b0:3fe:2813:b1d with SMTP id h71-20020a636c4a000000b003fe28130b1dmr8063133pgc.613.1655285122694;
        Wed, 15 Jun 2022 02:25:22 -0700 (PDT)
Date: Wed, 15 Jun 2022 14:55:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] xen: don't require virtio with grants for non-PV guests
Message-ID: <20220615092519.5677clabobheziet@vireshk-i7>
References: <20220615084835.27113-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615084835.27113-1-jgross@suse.com>

On 15-06-22, 10:48, Juergen Gross wrote:
> Commit fa1f57421e0b ("xen/virtio: Enable restricted memory access using
> Xen grant mappings") introduced a new requirement for using virtio
> devices: the backend now needs to support the VIRTIO_F_ACCESS_PLATFORM
> feature.
> 
> This is an undue requirement for non-PV guests, as those can be operated
> with existing backends without any problem, as long as those backends
> are running in dom0.
> 
> Per default allow virtio devices without grant support for non-PV
> guests.
> 
> The setting can be overridden by using the new "xen_virtio_grant"
> command line parameter.
> 
> Add a new config item to always force use of grants for virtio.
> 
> Fixes: fa1f57421e0b ("xen/virtio: Enable restricted memory access using Xen grant mappings")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +++++
>  drivers/xen/Kconfig                           |  9 ++++++++
>  drivers/xen/grant-dma-ops.c                   | 22 +++++++++++++++++++
>  include/xen/xen.h                             | 12 +++++-----
>  4 files changed, 42 insertions(+), 7 deletions(-)

Thanks for the quick fix.

With CONFIG_DEBUG_SECTION_MISMATCH=y, this generates a warning.

WARNING: modpost: vmlinux.o(.text+0x7a8270): Section mismatch in reference from the function xen_set_restricted_virtio_memory_access() to the variable .init.data:xen_virtio_grants
The function xen_set_restricted_virtio_memory_access() references
the variable __initdata xen_virtio_grants.
This is often because xen_set_restricted_virtio_memory_access lacks a __initdata
annotation or the annotation of xen_virtio_grants is wrong.

This can be fixed by:

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index d1fae789dfad..1099097b4515 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -42,7 +42,7 @@ static __init int parse_use_grants(char *arg)
 }
 early_param("xen_virtio_grant", parse_use_grants);

-void xen_set_restricted_virtio_memory_access(void)
+void __init xen_set_restricted_virtio_memory_access(void)
 {
        if (IS_ENABLED(CONFIG_XEN_VIRTIO_FORCE_GRANT) || xen_virtio_grants ||
            (!xen_virtio_grants_set && xen_pv_domain()))

With that:

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

