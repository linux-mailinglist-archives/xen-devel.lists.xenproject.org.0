Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D33E8BE169
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 13:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718033.1120536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4JLQ-0002wb-6B; Tue, 07 May 2024 11:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718033.1120536; Tue, 07 May 2024 11:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4JLQ-0002v5-3O; Tue, 07 May 2024 11:50:52 +0000
Received: by outflank-mailman (input) for mailman id 718033;
 Tue, 07 May 2024 11:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J4VX=MK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4JLO-0002uv-CW
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 11:50:50 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a04f2d0-0c68-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 13:50:46 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4349685c845so18649991cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 04:50:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 fb20-20020a05622a481400b00434efa0feaasm6361001qtb.1.2024.05.07.04.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 04:50:45 -0700 (PDT)
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
X-Inumbo-ID: 0a04f2d0-0c68-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715082646; x=1715687446; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MBrMJr0YxXM16vUgS6E+E+CVsMKyrrJZEQyXQwyNy0=;
        b=qtYu/qO/vsWM82kWqGdv9o+iYSdVZWRSY1GoAjAHgwSWUDfBYKpuwrA3Lr11YfsY8d
         VYZfRP1hZgrF/f64rOomMkoq5VvGD0W23kTGzXB6j1t15csSsd7qMtxOzuToe8eh7sIH
         /ekrYoqLrOKZW7BeDvt17IoLWUZgzFlY9TZmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082646; x=1715687446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MBrMJr0YxXM16vUgS6E+E+CVsMKyrrJZEQyXQwyNy0=;
        b=kkrYoJ6tnCNPlnFPH48vRv06yDd/a71NH/84BRAc2kdzWUQn2E/mvsFFbGAprRBiFU
         GjZJjJPm+69T6czY0z4n79eQOExAVRnfpYjHCEOWOpVJDVY6veRZRO8GlOKwlAFufcll
         2viNrqMjvMXm3E9PXU9yeoW1B5ftRmGWu01aijrgiiPTL+8+6tvNxlSsIB9ASu9KXI1l
         tj5ragc/Jvk/Q2rOg0yHQSdXlU6EbBx6FAXuJvoXUb/HT7hO82i2VPqP7M1v4Zf/eb2i
         53z4XuffBFAN6lND7Ej7Yy/drHNAxieklnzDncdnLXbz1DZCnvAryXrJpFE2hFECkN/F
         XQhg==
X-Gm-Message-State: AOJu0YzLpOr8aEc8QEWYpDM0fc3AbZR5IwUhUvAr+YVd60eJrtpJp5HV
	rZB/nXzsVz/ScKFsWNr8XEOSp62om6LiB4sLSE6pFzCcxNi8ZZ9jIEcpSdJuJTCJwsqUV+SMuwu
	C
X-Google-Smtp-Source: AGHT+IEPpq//f2byQ6AaKtUYrs5MxbiERCv1xZ157TKLa4mYLY2yDEAldx3HYi9FN3apX1GVVZ7Vew==
X-Received: by 2002:a05:622a:1aaa:b0:43b:7ac:ac79 with SMTP id s42-20020a05622a1aaa00b0043b07acac79mr16395081qtc.21.1715082646091;
        Tue, 07 May 2024 04:50:46 -0700 (PDT)
Date: Tue, 7 May 2024 13:50:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpu-policy: Fix migration from Ice Lake to Cascade
 Lake
Message-ID: <ZjoVk6JMjHGAB-EB@macbook>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240507112957.1701824-1-andrew.cooper3@citrix.com>

On Tue, May 07, 2024 at 12:29:57PM +0100, Andrew Cooper wrote:
> Ever since Xen 4.14, there has been a latent bug with migration.
> 
> While some toolstacks can level the features properly, they don't shink
> feat.max_subleaf when all features have been dropped.  This is because
> we *still* have not completed the toolstack side work for full CPU Policy
> objects.
> 
> As a consequence, even when properly feature levelled, VMs can't migrate
> "backwards" across hardware which reduces feat.max_subleaf.  One such example
> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
> 
> Extend the host policy's feat.max_subleaf to the hightest number Xen knows
> about, similarly to how we extend extd.max_leaf for LFENCE_DISPATCH.  This
> will allow VMs with a higher feat.max_subleaf than strictly necessary to
> migrate in.

Seeing what we do for max_extd_leaf, shouldn't we switch to doing what
you propose for feat.max_subleaf to max_extd_leaf also?

To allow migration between hosts that have 0x80000021.eax and hosts
that don't have such extended leaf.

cpu_has_lfence_dispatch kind of does that, but if lfence cannot be
made serializing then the max extended leaf is not expanded.  And we
should also likely account for more feature leafs possibly appearing
after 0x80000021?

Thanks, Roger.

