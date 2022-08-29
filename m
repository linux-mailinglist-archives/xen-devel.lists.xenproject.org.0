Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD3C5A43F1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 09:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394473.633887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSZOT-0000Ms-1z; Mon, 29 Aug 2022 07:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394473.633887; Mon, 29 Aug 2022 07:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSZOS-0000KF-Uy; Mon, 29 Aug 2022 07:41:12 +0000
Received: by outflank-mailman (input) for mailman id 394473;
 Mon, 29 Aug 2022 07:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvgW=ZB=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oSZOR-0000K9-9F
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 07:41:11 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efa964e6-276d-11ed-9250-1f966e50362f;
 Mon, 29 Aug 2022 09:41:05 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id f12so7010298plb.11
 for <xen-devel@lists.xenproject.org>; Mon, 29 Aug 2022 00:41:05 -0700 (PDT)
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
X-Inumbo-ID: efa964e6-276d-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bmN5lgEs9GLrIHc9ecBo9XA3ErhDbXe8LmCfkF5hFKI=;
        b=V8FtoxP3L6M6/mWACyUQsMqQWa1MlDGHu+cE41XjpjFyyPGX+b63kp6G/qTA5WzdJ/
         xbWHRGrU/GqJ/ZTsHWP4Yitjc2CMxKsgn2IpJ4Ph2TvlExC9UemMeLc9Y+P9lu2kpn19
         W9Maopu4QCLSRh8ZO48ASp/HxBVSMgmQrt6erzUxMfLj2Vi3FuGFDLM9Iy+0qp6pX/zE
         Cp56wgdfajJGse/nF2iPFwnvJEiWc/+E8oMqEKC8a4s32uxHSSZUKatpWLmKwRFSLLLA
         A2eilFvlNZ9b9zqaTDXqRzwHX8UVIi51zYJHy9M794rsKHReJH7JBo4i3n2LKi3ZUjyL
         NFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bmN5lgEs9GLrIHc9ecBo9XA3ErhDbXe8LmCfkF5hFKI=;
        b=VBxG65jcx7ETk63IDjx+NqbTrNv9oe8lkg+Y4KWAvPn9nS4difmgbmmWNDhLU6CRS3
         udys1cUwK3Ip1nxjjxiceHAknldYNl2Exsa+xwTQs0dHUanlLTeWnL0C4ghPJf3kp4Fg
         5vXfYUPELtblOHxpHjqh+kD9y7wciat+tbtj3ccOWBjPcNvmLQ2DuINU3DYVIIcG1S89
         J+HE+RoMCjg6A6NAkC7hzNTMp+GzV5LkZujeHFIVpT7U8/Rsxi6Z0a/AAEV4Xl6/Yg8Y
         dgOs4hSImWcSZY6ef15cDmYVwGqtvPLMRHQN14ak2+vK7an7YI0CWWjAtoi37crK4ak5
         8eog==
X-Gm-Message-State: ACgBeo2qDq+fwQU8/LfuslAaXdlVp6TLMHlBQTOSLCdTSXguZeSuPGYZ
	tKhWi+RFrNEbfCRL01ccXNYZAwmhmZ2HXF9bl05pNg==
X-Google-Smtp-Source: AA6agR44NgSDA/2+C6DXJj6nbrvkCMtDQRYIezf/VzzBUg0roPlHdlmcTw801/CCpR26Q6Iogc0SxR6KlTwj+dG3AAU=
X-Received: by 2002:a17:90a:cf8c:b0:1fd:7783:c340 with SMTP id
 i12-20020a17090acf8c00b001fd7783c340mr13064219pju.16.1661758863848; Mon, 29
 Aug 2022 00:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <c1a29c17-415c-89e3-6cce-30031c18b753@amd.com>
In-Reply-To: <c1a29c17-415c-89e3-6cce-30031c18b753@amd.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 29 Aug 2022 09:40:53 +0200
Message-ID: <CAHUa44EbQNPVwJvM6b6raaqE0-H_Bb3jEWHE_hWjuLPaXeNh=Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] xen/arm: move regpair_to_uint64() and
 uint64_to_regpair() to regs.h
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

On Wed, Aug 24, 2022 at 10:23 AM Michal Orzel <michal.orzel@amd.com> wrote:
>
> Hi Jens,
>
> On 18/08/2022 12:55, Jens Wiklander wrote:
> > Moves the two helper functions regpair_to_uint64() and
> > uint64_to_regpair() from xen/arch/arm/tee/optee.c to the common arm
> > specific regs.h.
> >
> Would be good to add a justification that these helpers will be needed by subsequent patches.
> Also I can see that you make use of them only in the last patch so it would be natural to
> move this patch right before the one making use of these helpers.

I put it at the beginning of the patches to get prerequisites in place
before the tricky stuff, but I'll move it since that's preferred. I'll
add update the commit message.

>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> As for the patch itself:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks,
Jens

>
> ~Michal

