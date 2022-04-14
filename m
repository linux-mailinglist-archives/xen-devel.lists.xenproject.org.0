Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1D500C58
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 13:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304640.519310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexvI-0000Jx-Tp; Thu, 14 Apr 2022 11:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304640.519310; Thu, 14 Apr 2022 11:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nexvI-0000Hd-Q4; Thu, 14 Apr 2022 11:46:04 +0000
Received: by outflank-mailman (input) for mailman id 304640;
 Thu, 14 Apr 2022 11:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jucj=UY=gmail.com=wei.liu.xen@srs-se1.protection.inumbo.net>)
 id 1nexvH-0000HT-9m
 for xen-devel@lists.xen.org; Thu, 14 Apr 2022 11:46:03 +0000
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7437ef14-bbe8-11ec-8fbd-03012f2f19d4;
 Thu, 14 Apr 2022 13:46:01 +0200 (CEST)
Received: by mail-wm1-f42.google.com with SMTP id y21so1420643wmi.2
 for <xen-devel@lists.xen.org>; Thu, 14 Apr 2022 04:46:00 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c320900b0038f0894d80csm1770117wmp.7.2022.04.14.04.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 04:45:58 -0700 (PDT)
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
X-Inumbo-ID: 7437ef14-bbe8-11ec-8fbd-03012f2f19d4
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PVzyUM7iNoGJ5SSni/XTNml7nDZX+rlSKGqhlCFjxjU=;
        b=P6G2dOkM+Dibe6+EWqcnKU53oYj+aNoOISN7uREPibTvVCvpd10WERcpOWv1++0bVk
         /2YI0JtVi1H6pbSQLzuCJ3mIWBRlAgKdXic/B9sKv7xan62yWbWYvoAMR1YuPDpHtH9s
         wd4IxNp+ekHyr+9jmaMdNpKRtTMnosh4yN0AE3AqkNiyPdHSYnlQqxOwyk2aSFNaaKfA
         123nLr+gqsn21CPUJncdRTn/W8z7A8vGlgzTQD/2LGncKg5rEXJu0fraRWrCUSmcB6xk
         oVL9OQEzRAWFWP6g+5DwykaYcMTqRBUy1i0f3cwwx/baS47VNP05XC2oip7LxejEVJmz
         Gvjg==
X-Gm-Message-State: AOAM530MIxfFN5qWewKjfZQGy/NgtyauDt+8DVHRcU9Agypd+Rcks5Fa
	fVrq/JgolMeXght6bapTxZI=
X-Google-Smtp-Source: ABdhPJz6fP7TTZHLDM884OoKS4qXU+NFam69j4sX2Utqeknm4TqBmSvlL2xsheHOJQrhYsDYtSRvww==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id n17-20020a7bc5d1000000b0037fa8a39e17mr3145450wmk.109.1649936759393;
        Thu, 14 Apr 2022 04:45:59 -0700 (PDT)
Date: Thu, 14 Apr 2022 11:45:57 +0000
From: Wei Liu <wl@xen.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: stratos-dev@op-lists.linaro.org, xen-devel@lists.xen.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220414114557.4myrs4ud4qi2hnrz@liuwe-devbox-debian-v2>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>

Hi Viresh

This is very cool.

On Thu, Apr 14, 2022 at 02:53:58PM +0530, Viresh Kumar wrote:
> +xen-devel
> 
> On 14-04-22, 14:45, Viresh Kumar wrote:
> > Hello,
> > 
> > We verified our hypervisor-agnostic Rust based vhost-user backends with Qemu
> > based setup earlier, and there was growing concern if they were truly
> > hypervisor-agnostic.
> > 
> > In order to prove that, we decided to give it a try with Xen, a type-1
> > bare-metal hypervisor.
> > 
> > We are happy to announce that we were able to make progress on that front and
> > have a working setup where we can test our existing Rust based backends, like
> > I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.
> > 
> > Key components:
> > --------------
> > 
> > - Xen: https://github.com/vireshk/xen
> > 
> >   Xen requires MMIO and device specific support in order to populate the
> >   required devices at the guest. This tree contains four patches on the top of
> >   mainline Xen, two from Oleksandr (mmio/disk) and two from me (I2C).
> > 
> > - libxen-sys: https://github.com/vireshk/libxen-sys
> > 
> >   We currently depend on the userspace tools/libraries provided by Xen, like
> >   xendevicemodel, xenevtchn, xenforeignmemory, etc. This crates provides Rust
> >   wrappers over those calls, generated automatically with help of bindgen
> >   utility in Rust, that allow us to use the installed Xen libraries. Though we
> >   plan to replace this with Rust based "oxerun" (find below) in longer run.
> > 
> > - oxerun (WIP): https://gitlab.com/mathieupoirier/oxerun/-/tree/xen-ioctls
> > 

> >   This is Rust based implementations for Ioctl and hypercalls to Xen. This is WIP
> >   and should eventually replace "libxen-sys" crate entirely (which are C based
> >   implementation of the same).
> > 

I'm curious to learn why there is a need to replace libxen-sys with the
pure Rust implementation. Those libraries (xendevicemodel, xenevtchn,
xenforeignmemory) are very stable and battle tested. Their interfaces
are stable.

Thanks,
Wei.

