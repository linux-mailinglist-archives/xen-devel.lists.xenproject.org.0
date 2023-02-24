Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A82256A17EF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500801.772303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTRd-00042h-7t; Fri, 24 Feb 2023 08:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500801.772303; Fri, 24 Feb 2023 08:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTRd-0003zG-3m; Fri, 24 Feb 2023 08:28:45 +0000
Received: by outflank-mailman (input) for mailman id 500801;
 Fri, 24 Feb 2023 08:28:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zq+K=6U=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pVTRb-0003zA-V2
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:28:44 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4fb0d5-b41d-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 09:28:42 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id p8so13191787wrt.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 00:28:42 -0800 (PST)
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
X-Inumbo-ID: 3f4fb0d5-b41d-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cyL1EPyHitiFeiSFzU35pQ1mZfOnqpWT17Pq9HBU3g=;
        b=ZGmg9Ny/ERHQTZ4xZ2/ed2CD4L4G3SuTxXyuliyn/hq4/6EaCjDiTSpDJLuvDQDZgV
         WgElrEYr0Nj6wSGOar7fjtEgX/D4wJ2jq10oh4+1DRzsWUlFLzievqlJLxnSaTh61mzX
         Lt+ZY41ARq3SKafwLDFCJ4sHi0MchN6sVaOwIVvBf10GUNMxvzPUksO0uIkr6ZTBwnd2
         /eigeInofznXOV+trusoSts7aXtC7iaFkazAFTcp4XwlAhaUzaaDm5saOT2BE2O3xtUz
         JYLGvwEuBJWaC6UxHlTyhYgKE8SC7hZyxI1Lx/6SfazUGl0X1WgJRoGuMoSq2oZz9VtN
         3wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cyL1EPyHitiFeiSFzU35pQ1mZfOnqpWT17Pq9HBU3g=;
        b=3+irxBzcbAZhTzK8Gj7zd5vH/tEhere/p0lV8q/g4ubqrXs9e88RjGd9jJSsw6RvOa
         74HG/OCsNogpV61vVW5FNMvbTH0t5ySF9Zwx9I+LhcNHDQo3eweW66AzNJkRFKQHF+4N
         FgxZucoT3am/WhwSyyHQLacMvI7PjY0mgUnMwyffDlzH1Hs4k8W7H8ElqRSaMYswwmAb
         RY7gfMX9lihD+Vkq9fjMUkQ6e8rnLIvsNZGBTcRiIPwdaL5ssQGK7AAdcyeaCEsw08wP
         weEGWz/2j7ucLM3wGTSiaCU+nHv66OuF+o6jO6cIkjF3nKHUPtYn4509BjUFrqAkMVCt
         jGHw==
X-Gm-Message-State: AO0yUKWRxur3PCQ4f1TBoPPrTME4U7ODaHAmzNoPQahEmeL/b0x5V7OB
	KbZvaqq4wllx8blLXXxbuMAjmMSXikw5RxzO5r20dA==
X-Google-Smtp-Source: AK7set/roKx7M6tSrndy7EEVkGFLani9eZl0CJGjHzZrcFZ1QU11pWE2vLy8m8jrXhoF7adFxnmmllqWFMl9ZvJAENo=
X-Received: by 2002:a05:6000:100c:b0:2c5:4f27:1d53 with SMTP id
 a12-20020a056000100c00b002c54f271d53mr1126879wrx.3.1677227322389; Fri, 24 Feb
 2023 00:28:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <13719ab3736160259ad9245d5d5b5071b8933194.1677079672.git.jens.wiklander@linaro.org>
 <399c85a9-2130-efa4-7a14-7f9f76084662@xen.org>
In-Reply-To: <399c85a9-2130-efa4-7a14-7f9f76084662@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 24 Feb 2023 09:28:31 +0100
Message-ID: <CAHUa44E=uAZ5eJ9STuak3eDwyYd_v+xba-5emw6c-+5uYcqTkQ@mail.gmail.com>
Subject: Re: [XEN PATCH v7 01/20] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
	Marc Bonnici <marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Fancellu <luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 23, 2023 at 3:35 PM Julien Grall <julien@xen.org> wrote:
>
> Hi Jens,
>
> On 22/02/2023 15:32, Jens Wiklander wrote:
> > SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
> > registers and result registers for the SMC and HVC instructions.
> >
> > Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> > parameter and result registers.
> >
> > Let us add new interface to support this extended set of input/output
> > registers.
> >
> > This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> > extended input/output registers") by Sudeep Holla from the Linux kernel
> >
> > The SMCCC version reported to the VM is bumped to 1.2 in order to support
> > handling FF-A messages.
> >
> > [1] https://developer.arm.com/documentation/den0028/c/?lang=en
> >
> > Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
>
> One remark here. The tags are usually added chronologically. So your
> signed-off-by should be first.
>
> I am not planning to commit this patch until one of the patch using the
> call is ready. If this happen in this version, then I am happy to fix it
> on commit. Otherwise, please do it in the next version:
>
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks, I'll keep that in mind.

Cheers,
Jens

>
> Cheers,
>
> --
> Julien Grall

