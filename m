Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625A5290641
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 15:26:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8079.21506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPje-0006S8-IH; Fri, 16 Oct 2020 13:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8079.21506; Fri, 16 Oct 2020 13:25:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTPje-0006Rj-Ew; Fri, 16 Oct 2020 13:25:30 +0000
Received: by outflank-mailman (input) for mailman id 8079;
 Fri, 16 Oct 2020 13:25:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kTPjc-0006Re-Ss
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:25:28 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e39ba013-943a-48fc-b9ec-fd31ba739f41;
 Fri, 16 Oct 2020 13:25:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f21so2476948wml.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:25:27 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 64sm2856197wmd.3.2020.10.16.06.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 06:25:25 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rWFt=DX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kTPjc-0006Re-Ss
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 13:25:28 +0000
X-Inumbo-ID: e39ba013-943a-48fc-b9ec-fd31ba739f41
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e39ba013-943a-48fc-b9ec-fd31ba739f41;
	Fri, 16 Oct 2020 13:25:27 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f21so2476948wml.3
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 06:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HRWYyHhjSt+jchGWaAnnJLVz+GBYjjs43COiHHYA0hM=;
        b=hMA3PifN+TkFADOuTujDdp5jirqI2pIjbRQLAXcDdK3LSFKlZGQvDVhO39kn4wCI1H
         JkFevRBKDbIuLL2JSzkwOofK9Vme7R/WXeL/5u7n0/Ffvs3RFl5OXUx1Btce99xgUL0W
         YuFzrsOxxgEsG+zxBZAU1entG9N7IzT0K+t6C/cC3cJBg7CJQPv/W5BIqJAm/HZ8F2cU
         ZqtoAk56pbPyq4Scg2MPOTA6lgX8dOSBZMr4GOgAd0fKMuYUKGkvQt52AbVgY7DP3vvr
         pOJl3eIs1dqLGnlc/XfRy+ZMuEtSruYE7hTCMdWZ3q2sjqz+DFBsjqGv3//wJdPrgzaV
         lp8Q==
X-Gm-Message-State: AOAM533fqmlMjRLvGTHNUxWYTDhPzuBfYL2rtyKfjv2SXm/+2m6cwM4I
	DU0pkrjBt9fq9Zx5KITry8eb+9O+hms=
X-Google-Smtp-Source: ABdhPJwLvSTIZsKY4SyQhj9apLT9Vhv8yopKQh1i8YJAE4MT93w6G92F34Iql4BfiJQkzZp6Dm8uIQ==
X-Received: by 2002:a05:600c:2217:: with SMTP id z23mr4025406wml.133.1602854726672;
        Fri, 16 Oct 2020 06:25:26 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id 64sm2856197wmd.3.2020.10.16.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 06:25:25 -0700 (PDT)
Date: Fri, 16 Oct 2020 13:25:24 +0000
From: Wei Liu <wl@xen.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [SECOND RESEND] [PATCH] tools/python: Pass linker to Python
 build process
Message-ID: <20201016132524.wuli37asps4eshce@liuwe-devbox-debian-v2>
References: <20201012011139.GA82449@mattapan.m5p.com>
 <20201015010148.GQ151766@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201015010148.GQ151766@mail-itl>
User-Agent: NeoMutt/20180716

On Thu, Oct 15, 2020 at 03:01:48AM +0200, Marek Marczykowski-Górecki wrote:
> On Sun, Oct 11, 2020 at 06:11:39PM -0700, Elliott Mitchell wrote:
> > Unexpectedly the environment variable which needs to be passed is
> > $LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
> > of the host `ld`.
> > 
> > Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
> > it can load at runtime, not executables.
> > 
> > This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
> > to $LDFLAGS which breaks many linkers.
> > 
> > Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Thanks. Applied.

Wei.

