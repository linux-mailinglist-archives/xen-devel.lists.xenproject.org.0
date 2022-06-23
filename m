Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E215572AD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 07:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354438.581526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Fha-0004So-W6; Thu, 23 Jun 2022 05:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354438.581526; Thu, 23 Jun 2022 05:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Fha-0004Q0-TD; Thu, 23 Jun 2022 05:48:26 +0000
Received: by outflank-mailman (input) for mailman id 354438;
 Thu, 23 Jun 2022 05:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozkr=W6=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1o4FhZ-0004Pu-Tv
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 05:48:26 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1786abee-f2b8-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 07:48:23 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id 23so11985810pgc.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 22:48:23 -0700 (PDT)
Received: from localhost ([122.172.201.58]) by smtp.gmail.com with ESMTPSA id
 u1-20020a170903124100b0016188a4005asm13738487plh.122.2022.06.22.22.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 22:48:21 -0700 (PDT)
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
X-Inumbo-ID: 1786abee-f2b8-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oQ0mXmv2gl8QeyoTRvdPcAfsTMa0a+oWEd2XGS6OBuo=;
        b=a5F9NrGrWx+RS313osnifDyKBs4JGqACKW8amfFoRcqXm8Cp2v5VlgzCRwYY8Ktz6E
         N3BnoDd1aS2ZRa7LtlburQnbZbSXdZtYEd4F9GqoLGP73jW1LWBBr8sw/GOtd/ugkOp9
         uHzjG8wJjp66onz5N13NZFlPzjH4Ax6m893d20JOARbKNt7KP7htmyhJ4tME4djp4gpV
         josyprNm41VKphS3/sMoiIgJXywZK23xyN59xy8lCfrpkzKei4cMhZio7Bdyfii8yrZ4
         zcNhn/P0R37LF1JxDeLqtCIB1QI0as8OjRdBdRKPGLJ79+RsE6ZvbbOoYgiqwsStEqtv
         YhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oQ0mXmv2gl8QeyoTRvdPcAfsTMa0a+oWEd2XGS6OBuo=;
        b=jYie/bvsff/Nl2n4+e3EgxttKHCT30OSQvipvcCPRyxAYjRZ+rIhZoA1DwEznQR4vo
         UOg9tFrrZ81lZEkfkSi+SohncxcKGJGgAOKe0HERJl2IpqTbweF2N22WAZnyyLr5bodE
         K0Gmr87wmh/A+fdrj7jXcQjltSeoE87QXcepue9GXzeLQcpHjRXyPKHKkSm/yT0pXuPQ
         Az/vcSRtKn0eqHSoM7qh55MvXxevb2FdeNbSyfmhCjceToqfyeuNiALL2cWTzzDUDS91
         gPNw6j15HXdzouA2acb4Yi2WFQDvntkJ5Sft+guPiL9Ma9LezujrRGYdStaGAkHANDpS
         gIXw==
X-Gm-Message-State: AJIora9H/f+yRIlUyukZElIJL0lk+IFyeys20zdT7LvhXBlwt9/idaK8
	6c4k3Lvcr9oszv7OZlgOWkpZwQ==
X-Google-Smtp-Source: AGRyM1v86LBI7/a0caOi3nBxJ046p7aGn5C45DDGdpWIOIlvyNq2bR1QKWmse0uG/e19YLtjmxdlfA==
X-Received: by 2002:a63:920f:0:b0:40c:75a2:f91f with SMTP id o15-20020a63920f000000b0040c75a2f91fmr6100322pgd.512.1655963301771;
        Wed, 22 Jun 2022 22:48:21 -0700 (PDT)
Date: Thu, 23 Jun 2022 11:18:19 +0530
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
Message-ID: <20220623054819.do25phfuumnexw73@vireshk-i7>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <CAPD2p-ks4ZxWB8YT0pmX1sF_Mu2H+n_SyvdzE8LwVP_k_+Biog@mail.gmail.com>
 <20220622114950.lpidph5ugvozhbu5@vireshk-i7>
 <CAPD2p-kFeC8FygFcbpEbH3CzrAM7Td+G68t9ebOFR4V0w1dpEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPD2p-kFeC8FygFcbpEbH3CzrAM7Td+G68t9ebOFR4V0w1dpEQ@mail.gmail.com>

On 22-06-22, 18:05, Oleksandr Tyshchenko wrote:
> Even leaving
> aside the fact that restricted virtio memory access in the guest means that
> not all of guest memory can be accessed, so even having pre-maped guest
> memory in advance, we are not able to calculate a host pointer as we don't
> know which gpa the particular grant belongs to.

Ahh, I clearly missed that as well. We can't simply convert the
address here on the requests :(

> I am not sure that I understand this use-case.
> Well, let's consider the virtio-disk example, it demonstrates three
> possible memory mapping modes:
> 1. All addresses are gpa, map/unmap at runtime using foreign mappings
> 2. All addresses are gpa, map in advance using foreign mappings
> 3. All addresses are grants, only map/unmap at runtime using grants mappings
> 
> If you are asking about #4 which would imply map in advance together with
> using grants then I think, no. This won't work with the current stuff.
> These are conflicting opinions, either grants and map at runtime or gpa and
> map in advance.
> If there is a wish to optimize when using grants then "maybe" it is worth
> looking into how persistent grants work for PV block device for example
> (feature-persistent in blkif.h).
 
I though #4 may make it work for our setup, but it isn't what we need
necessarily.

The deal is that we want hypervisor agnostic backends, they won't and
shouldn't know what hypervisor they are running against. So ideally,
no special handling.

To make it work, the simplest of the solutions can be to map all that
we need in advance, when the vhost negotiations happen and memory
regions are passed to the backend. It doesn't necessarily mean mapping
entire guest, but just the regions we need.

With what I have understood about grants until now, I don't think it
will work straight away.

> Yes, this is the correct environment. Please note that Juergen has recently
> pushed new version [1]

Yeah, I am following them up, will test the one you all agree on :)

Thanks.

-- 
viresh

