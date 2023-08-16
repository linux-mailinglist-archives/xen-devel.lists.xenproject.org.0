Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C415F77DA79
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 08:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584189.914660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWA1m-00022p-Fo; Wed, 16 Aug 2023 06:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584189.914660; Wed, 16 Aug 2023 06:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWA1m-000203-CM; Wed, 16 Aug 2023 06:29:10 +0000
Received: by outflank-mailman (input) for mailman id 584189;
 Wed, 16 Aug 2023 06:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOWB=EB=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qWA1k-0001zx-PM
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 06:29:08 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 325262ad-3bfe-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 08:29:05 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6887b3613e4so489007b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Aug 2023 23:29:05 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 z24-20020aa785d8000000b0068844ee18dfsm2349640pfn.83.2023.08.15.23.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 23:29:03 -0700 (PDT)
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
X-Inumbo-ID: 325262ad-3bfe-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692167344; x=1692772144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/d+a+jmbHHXQIy1O4h/TrwUyediDeflM5J1gxycWe4=;
        b=bDQp7Xc8BerDlBHrdX+UJx91CzYphcHSg8BRRrhCao349U2swHK+DX4jRJnNO56il5
         9Vgx91zulM+Dfvt+QTd2Z3gEKEC1Dbe+tAQ564janlWKiinRElShOgS95i42PepmbUIy
         WY252H2RgJzSEjSi+Rjzg8u1sl3LEHQ1WcCbd/mCJ+AZCM0fsvp0RlIUg2wAGjbtsio+
         g83FMo46jTadq0qtDTjd2Wdz6hioj1HpvtRKY6AJZ7ho3MgrE2UcOk3RJAkkSBi5/18A
         KWdLYbvIuvcUll7/dkWvFKGLNfgZBHz75hJTdLZvs67PMfb/NPTnHH66xYpy2WP3pBAc
         Q4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692167344; x=1692772144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/d+a+jmbHHXQIy1O4h/TrwUyediDeflM5J1gxycWe4=;
        b=Iv6nB/O7Cnf13xPwAn1Uv73zXTJwAgQ6SmNBzM73U5XQzVWKd2TeszBaqQ4y0RPjM6
         tCL9ybOspLjHSlIAkIqxrnIQt/29qy620YWDgyaS45UejSACajLvhWpSGcJZFPgmndtU
         7TbNcMcb5WnQ8JSS7jwSUhdMQVLmRcrczWcB3dy4Dw+gwhxW9L5oJInA9aSemxpHfxPu
         eSdHH4+UcIRpfRIG9OYVVYvLBI7kPgLicHXCsnMLUQdzKnbnRtMBlPuEPctr2T4cKYjJ
         orciSmztu7UeWrsgn0X6zGQSa4rYqxI/YiAR+tTdwnKTJyXnjAecoZgXon093dsjoPlV
         VcfA==
X-Gm-Message-State: AOJu0Yy1e4aWgtlFBTROt1ZsghTqN8/0hHG3qqh3qbF+gCTFaDCRURsC
	UfGRM/FjHZ8d1VDgZdGtri6Rhg==
X-Google-Smtp-Source: AGHT+IGv9NNha9nyyZ7UHMl67x37JKLaJ76BxEG6CMLPFU+FcqmItbkoPsoYbxcEreJmf873wu5aXw==
X-Received: by 2002:a05:6a20:4310:b0:131:c760:2a0b with SMTP id h16-20020a056a20431000b00131c7602a0bmr1666192pzk.52.1692167344016;
        Tue, 15 Aug 2023 23:29:04 -0700 (PDT)
Date: Wed, 16 Aug 2023 11:59:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4] xen: privcmd: Add support for irqfd
Message-ID: <20230816062901.dkpzhhimnjf35jqy@vireshk-i7>
References: <d783b8689395e60d0c314f9dad476443ca7773cf.1690282439.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d783b8689395e60d0c314f9dad476443ca7773cf.1690282439.git.viresh.kumar@linaro.org>

On 25-07-23, 16:27, Viresh Kumar wrote:
> Xen provides support for injecting interrupts to the guests via the
> HYPERVISOR_dm_op() hypercall. The same is used by the Virtio based
> device backend implementations, in an inefficient manner currently.
> 
> Generally, the Virtio backends are implemented to work with the Eventfd
> based mechanism. In order to make such backends work with Xen, another
> software layer needs to poll the Eventfds and raise an interrupt to the
> guest using the Xen based mechanism. This results in an extra context
> switch.
> 
> This is not a new problem in Linux though. It is present with other
> hypervisors like KVM, etc. as well. The generic solution implemented in
> the kernel for them is to provide an IOCTL call to pass the interrupt
> details and eventfd, which lets the kernel take care of polling the
> eventfd and raising of the interrupt, instead of handling this in user
> space (which involves an extra context switch).
> 
> This patch adds support to inject a specific interrupt to guest using
> the eventfd mechanism, by preventing the extra context switch.
> 
> Inspired by existing implementations for KVM, etc..
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3->V4
> - Drop the imported definitions to hvm/dm_op.h.
> - Make the caller pass a pointer to pre-filled "struct xen_dm_op" instance and
>   get rid of irq and level fields.
> - Enable the irqfd feature under a new Kconfig entry.

Ping.

-- 
viresh

