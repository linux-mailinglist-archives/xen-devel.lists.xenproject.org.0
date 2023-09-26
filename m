Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59597AE728
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608314.946716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2rs-00047I-OP; Tue, 26 Sep 2023 07:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608314.946716; Tue, 26 Sep 2023 07:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2rs-00044R-L4; Tue, 26 Sep 2023 07:52:28 +0000
Received: by outflank-mailman (input) for mailman id 608314;
 Tue, 26 Sep 2023 07:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PA3Q=FK=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1ql2rr-00044L-G0
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:52:27 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1d368e0-5c41-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 09:52:26 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6907e44665bso7218224b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 00:52:26 -0700 (PDT)
Received: from leoy-yangtze.lan ([128.1.74.161])
 by smtp.gmail.com with ESMTPSA id
 x23-20020aa793b7000000b00690204b5a8csm9618369pff.12.2023.09.26.00.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 00:52:23 -0700 (PDT)
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
X-Inumbo-ID: a1d368e0-5c41-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695714744; x=1696319544; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QqGbtrtTPr6szlNuwsGwAI4dqbvkxyo1nNwh+JZgsh8=;
        b=fOF92Am9HW8FWY7xlFcyfItkyN/Jmn2SbyQvRF75pZvJ0wnk4XIly2z/CRk+zigEnV
         bz1UI6d2MoOJWM3UQ+DpFJboOeisGzGH25s54pnvT+OSynBxxygCgkeEliTh0+Rrw67Y
         IUNlV5dGAlr5fKI309cUvwKaGtdR1blR6ffDIXX5eG3UIhtW2VcWSPi1s/hFLBOgVAqP
         kuDc9gl6gtLdQ5B/D5uTFfm5pJC0BryUYxYpJBCl7sk4a4c8x6e3SkMHfnflYfouzmT8
         cFfeL8LlqYxwTcAHMdSP5HlJYIRXiPvctubWGp0xeuflKWqhZ/CNPMhlbj02WY29hV3E
         1vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695714744; x=1696319544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqGbtrtTPr6szlNuwsGwAI4dqbvkxyo1nNwh+JZgsh8=;
        b=XoqFWV2IB+Ct57T1JrsGkim+XfMP6jB5UfnGXadajSdQME4O3xrFGI2OTtQ1qKuJNw
         kbq6PG2lgnmdopMjNLvAbbU/lSgmINdDnFwa/oqgGzLirS8QGBiop6qBiZM57kxC6s61
         4a30Tclq9QiwlTkZ+c6cL+fJtM0L7Pb63jkB0jvQx3CVNa07zs8xu+3nb2mK8YGwuN13
         CAbjZ9qZGK4yuKGsds3fFOD+YuLYcEe6qVDPHoQCFqNxgGtYp0PIYPWs7K+pZBRBhL5I
         xGB8cdne7iGPp686wcF86bfZPuEgWk6JdLsVZcdBxUZvx/mNaylXXMzU0a7J4fKn3PGb
         Jh6Q==
X-Gm-Message-State: AOJu0Ywj1ZCO1HFsocA+KFpKlzogsAMiCbae0cMp0AW0kw0atbEo4Mv2
	u24OGNwZJ1D+FWAwMEkNjr5atw==
X-Google-Smtp-Source: AGHT+IEHjQRfiC6EjGn0b0KGCRRUS00AornSl/M5u/7fp7qCxPwC51+O8tNJJR64EJ+qfZ3ezy9DNw==
X-Received: by 2002:a05:6a00:2d0b:b0:68e:2d9d:b0cc with SMTP id fa11-20020a056a002d0b00b0068e2d9db0ccmr11310533pfb.6.1695714744611;
        Tue, 26 Sep 2023 00:52:24 -0700 (PDT)
Date: Tue, 26 Sep 2023 15:52:17 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
Subject: Re: RFC: arm64: Handling reserved memory nodes
Message-ID: <20230926075217.GA11115@leoy-yangtze.lan>
References: <20230914081607.GA1400758@leoy-huanghe.lan>
 <23a0185e-428d-496b-96b6-d5082800bfd4@xen.org>
 <20230916081541.GA3291774@leoy-huanghe.lan>
 <561f8b9d-3877-4251-8cf7-7cdf313254bb@xen.org>
 <20230920100344.GA71044@leoy-huanghe>
 <6c59477f-d133-4cab-4f4e-afd8e710453c@amd.com>
 <6bfbf707-cfc8-4cf3-80d0-eeaba0e5865a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bfbf707-cfc8-4cf3-80d0-eeaba0e5865a@xen.org>

Hi Julien,

On Wed, Sep 20, 2023 at 11:36:24AM +0100, Julien Grall wrote:

[...]

> > Host dt:
> > memory@40000000 {
> >      reg = <0x00 0x40000000 0x01 0x00>;
> >      device_type = "memory";
> > };
> > 
> > reserved-memory {
> >      #size-cells = <0x02>;
> >      #address-cells = <0x02>;
> >      ranges;
> > 
> >      test@50000000 {
> >          reg = <0x00 0x50000000 0x00 0x10000000>;
> >          no-map;
> >      };
> > };
> > 
> > Xen:
> > (XEN) MODULE[0]: 000000004ac00000 - 000000004ad65000 Xen
> > (XEN) MODULE[1]: 000000004ae00000 - 000000004ae03000 Device Tree
> > (XEN) MODULE[2]: 0000000042c00000 - 000000004aa8ea8b Ramdisk
> > (XEN) MODULE[3]: 0000000040400000 - 0000000042b30000 Kernel
> > (XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
> > ...
> > (XEN) BANK[0] 0x000000c0000000-0x00000100000000 (1024MB)
> > 
> > Linux dom0:
> > [    0.000000] OF: reserved mem: 0x0000000050000000..0x000000005fffffff (262144 KiB) nomap non-reusable test@50000000
> 
> So Linux should tell whether a region has been reserved. @Leo, can you share
> with us the serial console? Can you confirm the version of Xen you are
> using?

Finally, I located the issue is caused by the reserved memory node
with "disabled" status. In the end, it mismatches for handling the
disabled memory nodes between the Xen hypervisor and the Linux kernel.

I think I should set the status property from the reserved memory
nodes for my debugging platform. But for the case that the memory
nodes (for both normal and reserved nodes) which are disabled, the Xen
hypervisor should ignore them. So I sent a new patch to address the
issue for disabled memory nodes:

https://lore.kernel.org/xen-devel/20230926053333.180811-1-leo.yan@linaro.org/T/#u

Hope now we are clear for the issue. If not, please let me know.

Thanks,
Leo

