Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5DC5140FC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 05:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316933.536024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkHc7-0005xp-Aw; Fri, 29 Apr 2022 03:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316933.536024; Fri, 29 Apr 2022 03:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkHc7-0005vB-7O; Fri, 29 Apr 2022 03:48:15 +0000
Received: by outflank-mailman (input) for mailman id 316933;
 Fri, 29 Apr 2022 03:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FbCp=VH=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nkHc6-0005v5-KC
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 03:48:14 +0000
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 316924b2-c76f-11ec-8fc3-03012f2f19d4;
 Fri, 29 Apr 2022 05:48:13 +0200 (CEST)
Received: by mail-pg1-x529.google.com with SMTP id 15so5579132pgf.4
 for <xen-devel@lists.xenproject.org>; Thu, 28 Apr 2022 20:48:13 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 q2-20020a17090a064200b001cd498dc152sm14241761pje.2.2022.04.28.20.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 20:48:11 -0700 (PDT)
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
X-Inumbo-ID: 316924b2-c76f-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gZjXmVBe8S8Suaw/jkB5ne7RxJmRF1KeOvaTkzClLWE=;
        b=pVw779UmSnnKKLbe02OBNHcj51RAUblPOOSUjlQ/H/eFL+cHtIr+9z6icu3XsV6Qqd
         zINBIhfLseGhIWfV5OIRdh8t1Ev+Leuz+ujeoGa4yi0ESUrDRInGBp2XMKAS/1i261ST
         i/ZuKA3CIGWB6kdLZ7b6w+GnwBjwYzMnzk6frMHdcUMqLR/s0TTwp1GMsre6b2Vkpp+3
         4lwgyvuw4NA2V7lGmCPPMNzoguZM59R7OUvwIVXrvOH7Im/LjL3DTTctHypTBC2+MKbf
         2PP3svf6e/47l+7REyCz7I1x26K8qe3JIahux/Lb5IUM62ZmpbNrc0Ivq5iOVuyXhT0O
         D+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gZjXmVBe8S8Suaw/jkB5ne7RxJmRF1KeOvaTkzClLWE=;
        b=7mHXB5muB3tij0vFpdUDf2GnvBWGbf0/t4Hiwb5l2HXp3Kx42glqsviGhJ5Pk9U2ZI
         edeWtCxyj/gYMnTq4HLlTvBQj6avxU3Ru9QrDO+KtTrNTK+nYRZpwGt/kHn2l771bsTz
         shGf6X+sAYHGwMDy2fRZGPN8GS8cjbxSHxol9PomqpqQbyuk2VnVd5pidJ5T47pjDkmL
         ys7gM8VRYOwts7uNsBknRk05yNNGWff2SmrgFYYHFa/edV5IvE4ATvYdmDaT2sDjZMhP
         vz00740CtPD8Hvefp+o1sRGT8Tp2nkZGOD8tsUaqBLZcBEoJXFXCMcINEn4DDTDaQKoP
         cA3Q==
X-Gm-Message-State: AOAM531FmpJ71pCIXXDnCJsczs1pfau3/gimFXcwG+nEWJveJLI/xKhp
	T5HA+ZDUc9KjKHltMqCvZ731Hw==
X-Google-Smtp-Source: ABdhPJyoinGCEYWjbt2wYNom0qZ7Tc/0Nl7copu9nksgeB/5cuKCenTnIAB8Ujcg1U13YJ5Zsj7Aqg==
X-Received: by 2002:a05:6a00:1895:b0:50a:de86:b4b0 with SMTP id x21-20020a056a00189500b0050ade86b4b0mr37933439pfh.28.1651204091937;
        Thu, 28 Apr 2022 20:48:11 -0700 (PDT)
Date: Fri, 29 Apr 2022 09:18:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: Virtio on Xen with Rust
Message-ID: <20220429034808.dr647727dphnx6zk@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 28-04-22, 16:52, Oleksandr Tyshchenko wrote:
> Great work!

Thanks Oleksandr.

> I skimmed through your toolstack patches, awesome, you created a completely
> new virtual device "I2C".

I have also created GPIO now :)

What should I do about these patches ? Send them to xen list ? I can at least
send the stuff which doesn't depend on your series ?

> FYI, I have updated "Virtio support for toolstack on Arm" [1] since (to
> make it more generic), now V7 is available and I have a plan to push V8
> soon.

I will surely have a look, thanks.

> FYI, currently we are working on one feature to restrict memory access
> using Xen grant mappings based on xen-grant DMA-mapping layer for Linux [1].
> And there is a working PoC on Arm based on an updated virtio-disk. As for
> libraries, there is a new dependency on "xengnttab" library. In comparison
> with Xen foreign mappings model (xenforeignmemory),
> the Xen grant mappings model is a good fit into the Xen security model,
> this is a safe mechanism to share pages between guests.

Right, I was aware of this work but didn't dive into it yet. We will surely need
to do that eventually, lets see when I will be able to get to that. The current
focus is the get the solution a bit more robust (so it can be used with any
device) and upstream it to rust-vmm space on github.

> With Xen grant mappings, if I am not mistaken, it is going to be almost the
> same: mmap() then ioctl(). But the file will be "/dev/xen/gntdev".

Okay, the problem (for us) still exists then :)
 
> FYI, new branch "virtio_grant" besides supporting Xen grant mappings also
> supports virtio-mmio modern transport.

Somehow the timing of your emails have been spot on.

Last time, when you told me about the "dev" branch, I have already started to
reinvent the wheel and your branch really helped.

Now, it was just yesterday that I started looking into MMIO modern stuff as the
GPIO device needs it and you sent me working code to look how to do it as well.
You saved at least 1-2 days of my time :)

Thanks Oleksandr.

-- 
viresh

