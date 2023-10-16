Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFF7CAAF3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617640.960428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOF7-0005IE-FQ; Mon, 16 Oct 2023 14:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617640.960428; Mon, 16 Oct 2023 14:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOF7-0005FZ-Cq; Mon, 16 Oct 2023 14:06:49 +0000
Received: by outflank-mailman (input) for mailman id 617640;
 Mon, 16 Oct 2023 14:06:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fs62=F6=linaro.org=alexey.klimov@srs-se1.protection.inumbo.net>)
 id 1qsOF5-0005FT-U7
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:06:47 +0000
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [2001:4860:4864:20::2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d3e24c0-6c2d-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:06:46 +0200 (CEST)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1e993765c1bso2954401fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 07:06:45 -0700 (PDT)
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
X-Inumbo-ID: 3d3e24c0-6c2d-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697465204; x=1698070004; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YlrDDMvSnCexOzkkcOVcxaNWiO/8qMFwor3XZuHncqM=;
        b=RyQJBjullz4P7bj0yVsK9XFdNnnS3wmLsxVgtB+v2V4cwtrrsrYGGefsZLgjTq6meT
         rMgQ0OqyD8kj5y9WSoPtTaljb+Ge6f2uxQi8+IDQJ+r0pxxmGF0FTxr4lF0BUw8r9Ha/
         ZBdoC42cEOLlY1XNpyJp7IYdSLeuUEc/9hOj4Ds7rJ3FNLeTZX3IPdzqxm4DwEkmGWUv
         B1gM/NbbyEkgetLAtPoxinAvaKVVIc8nmCPdDdbkqOTFNJLZqucQBtDcOdPquFAqgAph
         zv1UowPSFo+6qU44IpiJMekqg2/Cqjx1WG2mVTaOFQg9RoEJosNY1VlNHLILHYTcIcvz
         KEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697465204; x=1698070004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlrDDMvSnCexOzkkcOVcxaNWiO/8qMFwor3XZuHncqM=;
        b=G95Asdrwx64nuZ8LHHlCY/42IvmBF+X9IfehDB3kfCl1k1TXjtAdr3bK1t1WREkRR/
         55TXe5UYWiKfyPOSMiSv/RbypOM7k6mdTPc1lnYVCIw7fuN0/ysdl5XMVUVnYwnZkfnP
         K8Ea1juv5z3ARIZJwaLo4IjYk3FfIw2jne9irgljfIzw1DYurXJsz/rQwyMAA7q/zdDf
         kGs9IjlNDZAyROQaUenB2Lb45Zcd5hrVItHyn75lG/htnW0OBxIFtxJzRE/iS+jV/gf0
         O5fm8z+8ZX37k7DPeJyqegd8lM60MbTs7ZOkXR/L2wMbe4DeTc0Ye+PZHH/9tYwDCQP0
         tELw==
X-Gm-Message-State: AOJu0YyqXUpVr17SxkGX3lINhprlixoiLFnKjNGAEMFUUUTk5j2+vhLx
	8tylDFhVrABcU4WUFjVqoXNGccUu64ZDhNomVB2gkA==
X-Google-Smtp-Source: AGHT+IG3kXmd9x3/nQuvqxPxXOv16jsUJ6Xl/prJjRKD8kuFy6DtcRQBWl2vIgbujzUGsic9OJzDMFtS52h/K966/cU=
X-Received: by 2002:a05:6870:4e0b:b0:1e9:938e:5fc6 with SMTP id
 pl11-20020a0568704e0b00b001e9938e5fc6mr15704066oab.57.1697465204487; Mon, 16
 Oct 2023 07:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231013122658.1270506-1-leo.yan@linaro.org> <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com> <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
In-Reply-To: <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 16 Oct 2023 15:06:33 +0100
Message-ID: <CANgGJDpLwxy8wgGFw0j3GziY+igw9Vj-FQrZPN3gF3XMhmCi+A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, Leo Yan <leo.yan@linaro.org>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Oct 2023 at 14:54, Julien Grall <julien@xen.org> wrote:
>
>
>
> On 16/10/2023 09:44, Michal Orzel wrote:
> > Hi,
>
> Hi,
>
> > On 13/10/2023 14:26, Leo Yan wrote:
> >>
> >>
> >> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cores),
> >> the physical memory regions are:
> >>
> >>    DRAM memory regions:
> >>      Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
> >>      Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
> >>      Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
> >>
> >> The UEFI loads Xen hypervisor and DTB into the high memory, the kernel
> >> and ramdisk images are loaded into the low memory space:
> >>
> >>    (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
> >>    (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
> >>    (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
> >>    (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> >>
> >> In this case, the Xen binary is loaded above 8TB, which exceeds the
> >> maximum supported identity map space of 2TB in Xen. Consequently, the
> >> system fails to boot.
> >>
> >> This patch enlarges identity map space to 10TB, allowing module loading
> >> within the range of [0x0 .. 0x000009ff_ffff_ffff].
> >>
> >> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
> > I don't think a fixes tag applies here given that 2TB was just a number we believed is enough
> > and all of this is platform dependent.
> > This can be dropped on commit if committer agrees
> Xen may have booted on that platform before hand. So this would be
> considered a regression and therefore a tag would be warrant.
>
> AFAICT, the commit is only present on the upcoming 4.18. So the question
> is whether Xen 4.17 booted out-of-the-box on ADLink? If the answer is
> yes, then we need to add a Fixes tag. But the correct one would be

Yes. The upstream xen 4.17 booted fine and the mentioned commit was
found during bisect, so it is introduced regression.
I'd personally say that "Fixes" tag is needed here.

Thanks,
Alexey

