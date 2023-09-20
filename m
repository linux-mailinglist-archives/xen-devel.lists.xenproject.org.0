Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00847A81F1
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 14:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605707.943289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiwfV-0000Lf-NH; Wed, 20 Sep 2023 12:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605707.943289; Wed, 20 Sep 2023 12:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiwfV-0000JC-K2; Wed, 20 Sep 2023 12:51:01 +0000
Received: by outflank-mailman (input) for mailman id 605707;
 Wed, 20 Sep 2023 12:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w83i=FE=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qiwfU-0000HT-8P
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 12:51:00 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5831f998-57b4-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 14:50:58 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-530c9980556so5340294a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 05:50:58 -0700 (PDT)
Received: from leoy-huanghe (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 g16-20020a056402321000b00530cf354746sm5953419eda.48.2023.09.20.05.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 05:50:57 -0700 (PDT)
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
X-Inumbo-ID: 5831f998-57b4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695214257; x=1695819057; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+WEjqRAWQbUZ0/OPjyy4ihAFTjMbPxdHBnTj3QRTms=;
        b=n/YIkXcUB3CNWPvQ7zpXhMIVaiIa5pW4BH5TgdvVKtl4+Qy4v9jrddN3ennrEIeIaO
         93xWxIMGFrrQhwverWdbUgb+NVmF2qz7evAfjXyzVxkLT/6daVo4yjdzGnhT0ycrY5nW
         5QpiH8psS3C6KANtSS8ZxmgrUfhEgcGY8zKottYN+b/Gw/iW5zn/ntv/DYWbpdB10FLk
         76pGg30NygHds3/1s7sJYZlAbpagQlQAcyah7TbNp3qtt7h0YojFG7hXu0xmwTq8BjQR
         2hu+urzMkwFOeLV1pBq30TE1Xtuw9FIFwdgdvz+y3UJhDu7sGx9txgxrC0K7s6aZKZGl
         aowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214257; x=1695819057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+WEjqRAWQbUZ0/OPjyy4ihAFTjMbPxdHBnTj3QRTms=;
        b=QYxYlCkGh4NYHbIuyEk+dhQXKVrlRb/un+QBkSn/S/p7nzV4BfKBG+4JgRWlle7OEf
         kUJ6Pdh+cJrf0oM3tEvvrNKqGNdsficJfiVPpLzForptY0ixSVEj5a5YPGcymVHFNKqR
         z4TBPKtxhsIhUfaqkQHJSBQt/96sarhIBUu8nbw0M8Mh1+72ORDlSjFufEI/0pPQ1XL3
         bnsPPb0+s6lDNz3y1Nxh3iCc6Zq1Y88GOhOWECX7dcE4ufwD1T4rrmUQvoMm+1i3IvJi
         PZSE8Emkan5Ro3bPWo+nBeIPCWI28py8ilJ+j5xe9XEVsjAycYm/f2+kaFg9xI/cOy0j
         QyIg==
X-Gm-Message-State: AOJu0Yw5c11U3QNyw9b98lTLWxSDxFNvNBqFRWrDHjV8ifpmYpc/CM6V
	KRp7rllhu169H0S037w44KNx/A==
X-Google-Smtp-Source: AGHT+IEwUhkbYVnIfs3kBmWLulLdqdFmaKFPiqaBNEzGO7y4HfesS8nEIEw6xJWOatGvlxMBInxb+A==
X-Received: by 2002:aa7:c2cb:0:b0:525:7234:52b7 with SMTP id m11-20020aa7c2cb000000b00525723452b7mr2273291edp.19.1695214257604;
        Wed, 20 Sep 2023 05:50:57 -0700 (PDT)
Date: Wed, 20 Sep 2023 20:50:55 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Penny Zheng <penny.zheng@arm.com>
Subject: Re: RFC: arm64: Handling reserved memory nodes
Message-ID: <20230920125055.GA143839@leoy-huanghe>
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

On Wed, Sep 20, 2023 at 11:36:24AM +0100, Julien Grall wrote:

[...]

> > > Could you confirm the Xen does write reserved memory nodes?  Or Xen
> > > converts the reserved memory nodes to normal memory nodes as I
> > > describe above :)
> > 
> > Xen passes the /reserved-memory node unchanged from host device tree to dom0 fdt.
> > Apart from that it creates an additional memory node covering the reserved ranges.
> > Take a look at this example run(based on qemu):
> 
> Thanks for providing an example! This is quite handy.

Yeah, thanks a lot for sharing the DT binding, Michal!

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

Sure, I will share the logs and DTS in Dom0 kernel when I can access
my machine in next week (due to I am on vacation in this week).

I am a bit suspicious that I am not aware something in my working
kernel. If have any finding, I will share back.

Thanks,
Leo

