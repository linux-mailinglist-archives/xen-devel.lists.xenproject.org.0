Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F84516ED2
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 13:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318797.538723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlU9E-00057k-IX; Mon, 02 May 2022 11:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318797.538723; Mon, 02 May 2022 11:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlU9E-00054d-F1; Mon, 02 May 2022 11:23:24 +0000
Received: by outflank-mailman (input) for mailman id 318797;
 Mon, 02 May 2022 11:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myVb=VK=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nlU9D-0004VW-Jm
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 11:23:23 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 463404c8-ca0a-11ec-8fc4-03012f2f19d4;
 Mon, 02 May 2022 13:23:22 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id s14so12208053plk.8
 for <xen-devel@lists.xenproject.org>; Mon, 02 May 2022 04:23:22 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 n5-20020aa79045000000b0050dc7628143sm4462414pfo.29.2022.05.02.04.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 04:23:20 -0700 (PDT)
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
X-Inumbo-ID: 463404c8-ca0a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wd+0sm020ywREmAEDmZTN4FU9xTZz6tewAiOtvcc27Y=;
        b=Oplf38im4xZjzpTjsnGoRozUCzjrsyFGIvFGhnecRZBlLgQ/5PPKMeg/uMWOvhOaeQ
         41DwSjKqWbtx1xKUBUAK85yNkuTaiJhr0EhaMPA5iPrhDo/kYtqlSMyZ2TJbsOClbXfK
         NW5KAnrJJ+/5xzJLOtIhs/3rNC5xgq3dIv97sHoRVX0rDX1Ii7t7hqjh0D4qP6XenpeL
         2yPfKwKjKWsI81uU0jZPLWiUpqTv09JeHVumSiJUTSBu399UQMmCclzgV8q423ZAU56H
         PwWCnvciJqFRNaRYla6dv9zXcb2+hJxglunW+9aMgkmkY+d6KcglQgjO/TWldbwlRtnX
         5BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wd+0sm020ywREmAEDmZTN4FU9xTZz6tewAiOtvcc27Y=;
        b=M0PHgFHFa5NmX+ZExdF+DhD2wqBe1eo8yHhjeWybIPQu0pzaI/Z1msQf2Rgu4Y2FH7
         /JFt8Ts2xHDLqAC4mThTMtJgwyQ9xDPq5yWCG8Yb/MNiMnPT/EApMaegVVk/+I0OzNHg
         +JIwuA6hWEEVCW4RhesJh9Q/3G3KbDK7UcSdRYY1VlDtLydFEkQaiA4JnFA6migh0g18
         JyLDYCx4fmoZF5aTRZr+CWhIfDafAusaLo0BE+cVgGBSRoKOeD8Rgmukzc657FSIakk4
         qVFzTzcrpMbr5ZxlPs5VQNLs8QVIb6qDB/MaSOJypNYwAyuKRcSMCoC9BC2ojc9NDgXi
         O0Dw==
X-Gm-Message-State: AOAM532QICiGxOQzjyZwWqitsbnt/P4DxzO/PNFoERMhl4oABQ0P4r59
	1LjVQM7W79dcxJZQKcje89TsDw==
X-Google-Smtp-Source: ABdhPJybRPCwd/MKyLufyibbFEM//bzJHfpwkNeJeEzGpy4x2DGYeSxQkF155lrKGRrVmCWNi2/DAQ==
X-Received: by 2002:a17:902:e804:b0:15e:a5cf:676 with SMTP id u4-20020a170902e80400b0015ea5cf0676mr4257844plg.144.1651490601232;
        Mon, 02 May 2022 04:23:21 -0700 (PDT)
Date: Mon, 2 May 2022 16:53:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: stratos-dev@op-lists.linaro.org
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220502112318.zvj4upxomvpi3zvm@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52

On 14-04-22, 14:45, Viresh Kumar wrote:
> Hello,
> 
> We verified our hypervisor-agnostic Rust based vhost-user backends with Qemu
> based setup earlier, and there was growing concern if they were truly
> hypervisor-agnostic.
> 
> In order to prove that, we decided to give it a try with Xen, a type-1
> bare-metal hypervisor.
> 
> We are happy to announce that we were able to make progress on that front and
> have a working setup where we can test our existing Rust based backends, like
> I2C, GPIO, RNG (though only I2C is tested as of now) over Xen.

An update to this, I have successfully tested GPIO backend as well with this
setup now and pushed out everything.

- GPIO required two virtqueues instead of one as in case of I2C.

- GPIO requires to do configuration exchange as well, while I2C didn't.

- The latest code supports MMIO V2, modern.

- The Xen vhost master is fully device independent now and a device type can be
  chosen based on just the command line itself. It would be simple to test RNG
  or other backends with this now (we just need to update "enum
  VirtioDeviceType" in vhost-user-master crate for this, with device specific
  information). Of course we need to emulate device in Xen too.

Hope this helps.

-- 
viresh

