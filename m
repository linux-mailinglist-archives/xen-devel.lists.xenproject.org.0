Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F8A7F9DFA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641956.1000994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZHY-00041P-1s; Mon, 27 Nov 2023 10:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641956.1000994; Mon, 27 Nov 2023 10:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZHX-0003yS-Ux; Mon, 27 Nov 2023 10:56:03 +0000
Received: by outflank-mailman (input) for mailman id 641956;
 Mon, 27 Nov 2023 10:56:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j1wO=HI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r7ZHW-0003x3-18
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:56:02 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d2a4ac5-8d13-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:56:01 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-332eeb16e39so1362922f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 02:56:01 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 d11-20020adfa40b000000b003142e438e8csm11675102wra.26.2023.11.27.02.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 02:56:00 -0800 (PST)
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
X-Inumbo-ID: 8d2a4ac5-8d13-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701082560; x=1701687360; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LD5fcl/vI55p8AwCO4J/PRxd7kgm5d4GjXUo7myTQ/A=;
        b=KC/v90hNSLDQ9u0jHDPZKu99LxzZ44++idSNZOeiAzrR5pH6vOEu9euEnj1SZs21+k
         rtEIARK6K0f/f5FW85QQ5DIVWv5K/6M/X3t/ok+9DfzSkrcDsu6f0qABizCLJ5if1Gc9
         F+WnrAnLortLC1LnVLmTM5p6a/PD0GCwMRhbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701082560; x=1701687360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD5fcl/vI55p8AwCO4J/PRxd7kgm5d4GjXUo7myTQ/A=;
        b=PymYuRo85Of2o3Q2yBt16GVuJZJjk0J615L4AuR7hYFDYPZJnGxmTSjysBsR4A77DP
         JcZDmSHwjZefrzmbC8qdi7FVFJ1KmwUHcdQ0j3CCXFiegsekhNO6tQ9tTjLzl05S3N05
         FnbBGs0JlGDedhoef+1+RcPa0E2uzELUmiwnuyr72griv/ZKn2L2NYJSUhISXjE43Y8s
         1vlh8X2NNI7eGqjVn6fpw+fnmkPBq7DNdgqRpD3YfXT/0EIYoj/S1mtx16qraTGPHHet
         eN+++JyaPe203RxWJ7MtReAf3NeWznZRDnPf+1frlJVkciK3X4YYkJAYNktsiE66HiG/
         GUAA==
X-Gm-Message-State: AOJu0YyiMROpEADpvbVl4ymEL9eI2kQgN4p1s/AgIxwMOq+dmKW48Y3R
	3/BRvP3fXmT1BKPItmFo0qCwwA==
X-Google-Smtp-Source: AGHT+IGfrU5MTTWxk4kGdan/Iy7ZNXKwGAy7MXPGvlkohyokRQFJw/88s+xYtzmZF6SNFeQqkXEoxg==
X-Received: by 2002:adf:f248:0:b0:333:2c0:58af with SMTP id b8-20020adff248000000b0033302c058afmr1249228wrp.51.1701082560352;
        Mon, 27 Nov 2023 02:56:00 -0800 (PST)
Date: Mon, 27 Nov 2023 11:55:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mario Marietto <marietto2008@gmail.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Elliott Mitchell <ehem+freebsd@m5p.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Message-ID: <ZWR1v5Y3EpRK817B@macbook>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>

On Mon, Nov 27, 2023 at 10:28:13AM +0000, Henry Wang wrote:
> +(xen-devel and Arm maintainers, including Julien)
> 
> > On Nov 27, 2023, at 18:03, Mario Marietto <marietto2008@gmail.com>
> > wrote:
> > 
> > Hello.  We have just virtualized Debian 12 on our arm (32 bit)
> > Chromebook model xe303c12 . As host / dom0 we have chosen Devuan
> > 5,and for guest / domU,Debian 12. It works great. But our goal is
> > different. We want to virtualize FreeBSD as domU. Can we have a
> > working Xen PV network driver for a FreeBSD arm guest ?. I found
> > that Julien Grall has ported the Xen drivers to FreeBSD on arm. I
> > would like to know if Julien's work was accepted upstream by
> > FreeBSD, in which case FreeBSD as a Xen guest on arm should work
> > if we enable the Xen PV drivers in the FreeBSD on arm kernel. If
> > Julien's work was not accepted upstream by FreeBSD, we will have
> > to find his patches and apply them ourselves to the FreeBSD on arm
> > kernel.

I've added Elliot on Cc as he is working on upstreaming the patches to
FreeBSD.  He will be able to provide a better update than myself.

Regards, Roger.

