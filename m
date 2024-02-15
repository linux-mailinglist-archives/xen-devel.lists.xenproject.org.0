Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352F3856AE7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 18:24:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681963.1060980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rafSj-00037s-1R; Thu, 15 Feb 2024 17:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681963.1060980; Thu, 15 Feb 2024 17:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rafSi-00035L-UY; Thu, 15 Feb 2024 17:23:52 +0000
Received: by outflank-mailman (input) for mailman id 681963;
 Thu, 15 Feb 2024 17:23:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wY2D=JY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rafSh-00035F-Up
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 17:23:51 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc3b8494-cc26-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 18:23:50 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d0a4e8444dso12049891fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 09:23:50 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 q34-20020a05613002a200b007cb869908b0sm263811uac.6.2024.02.15.09.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 09:23:49 -0800 (PST)
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
X-Inumbo-ID: fc3b8494-cc26-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708017830; x=1708622630; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=acDTKRqmW5DTP4w8ajARr7nCCLgrlIsgyjdgastbp4A=;
        b=FOBIz7FCmIBRlIhCM//hnHsXo5C1GrVh1NvtkA6awFK5MVccAAply+otNPi/nWC4kT
         y416g9hLTQm204K+pcguqt0CGZpr8i4G5XpdY3oUE5jTbfRkZUyFanil9W8el/32Hf/c
         pL3se800VL6M0Kl+i2B1NzwysEonYnJZMFb1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708017830; x=1708622630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acDTKRqmW5DTP4w8ajARr7nCCLgrlIsgyjdgastbp4A=;
        b=aZTnMKe4irg/0wp1Mr+fiBDACsZYnYSNiED/YkzSLjf570HryEWuFYTr07UhIrJy0I
         zlvVhLajRQf+emlnfV6kNyfK5g5fRyt7S/Hj/o1rEfGSYoxSXKk5JGwP1vqLvo2Zx65Q
         1j8Wt30UZIqoDWJU1EFUMpu3205r5fb6xiV1LREDnr1ReIdWWjQIT3XC1kgpGFrhmMAz
         bGkaILUch3lhS/y2aI91VeMDcQPRDQZdE+nApm+48QCyh36uMtNRR/5ory5gPGFaa7U5
         SmTXR+HURsG7FPBEwBCGJPSBK2mo1/ak7Rpol2LWooX+xM+KhuMeW05EDbYtY4yi0Syv
         zDGg==
X-Forwarded-Encrypted: i=1; AJvYcCUjuJ0O20PV3OQ/ZAfUwnL113jBi/HLKbTkASs3vTPQsQkh85ld+Xh51wc7mW1dYwyV2Ag/q6BvQMOQRIy0AHrsu8SZYetGA+uw5kZoN2w=
X-Gm-Message-State: AOJu0YxdexqXtDosFD1MzTA+Kwg5NQ8eJ14elP07sAt1mGHnUGn7d+4+
	Ay2mx6pXwMdaYfLkIs2cTLsxkaC3kQcmpepTEh6hw5aSMK0sdz+rWS39Z0LT5oY=
X-Google-Smtp-Source: AGHT+IG6dsv8J0Xi3MirpEW3XwuANimpXQ7WhYEayvmheXVz6n32jzLQWjShh6L0pCUBHNMeEpPUVw==
X-Received: by 2002:a2e:9792:0:b0:2d0:f872:6f16 with SMTP id y18-20020a2e9792000000b002d0f8726f16mr1772152lji.16.1708017830347;
        Thu, 15 Feb 2024 09:23:50 -0800 (PST)
Date: Thu, 15 Feb 2024 18:23:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Message-ID: <Zc5Io3dkAlGSt3on@macbook>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <a2edb04f-c343-4baf-9f15-d96c4d014f05@suse.com>
 <Zc3nXpUOlnIHEfsl@macbook>
 <54678829-4bcf-4d83-8134-1ab386f299b6@suse.com>
 <Zc3v20RKMssbaDsl@macbook>
 <a48cbad6-701d-4077-9044-4205b932a7f3@suse.com>
 <Zc428VMDoYnPw1zo@macbook>
 <d545cc6c-d213-43da-af31-1768af32aba0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d545cc6c-d213-43da-af31-1768af32aba0@suse.com>

On Thu, Feb 15, 2024 at 05:22:00PM +0100, Jan Beulich wrote:
> On 15.02.2024 17:08, Roger Pau Monné wrote:
> > On Thu, Feb 15, 2024 at 02:02:41PM +0100, Jan Beulich wrote:
> >> --- a/xen/Rules.mk
> >> +++ b/xen/Rules.mk
> >> @@ -15,7 +15,11 @@ srcdir := $(srctree)/$(src)
> >>  PHONY := __build
> >>  __build:
> >>  
> >> --include $(objtree)/include/config/auto.conf
> >> +ifneq ($(obj),tools)
> >> +ifneq ($(obj),tools/kconfig)
> >> +include $(objtree)/include/config/auto.conf
> >> +endif
> >> +endif
> > 
> > Trying to understand this, I assume it's to avoid an infinite
> > dependency loop that generating include/config/auto.conf requires some
> > tools that are build using xen/Rules.mk?
> 
> The file has dependencies only in xen/Makefile. This is about the
> file simply not being there when initially building. Perhaps the
> patch description helps that I've written in the meantime:
> 
> "Because of using "-include", failure to (re)build auto.conf (with
>  auto.conf.cmd produced as a secondary target) won't stop make from
>  continuing the build. Arrange for it being possible to drop the - from
>  Rules.mk, requiring that the include be skipped for tools-only targets.

Wouldn't it be more reliable if we skipped the include for any paths
in $(obj) that start with 'tools', rather than hardcoding 'tools' and
'tools/kconfig'?

Thanks, Roger.

