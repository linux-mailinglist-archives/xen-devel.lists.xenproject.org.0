Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D097E1D6B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 10:45:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627852.978698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwAo-0006Ed-9Z; Mon, 06 Nov 2023 09:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627852.978698; Mon, 06 Nov 2023 09:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzwAo-0006Cx-6J; Mon, 06 Nov 2023 09:45:34 +0000
Received: by outflank-mailman (input) for mailman id 627852;
 Mon, 06 Nov 2023 09:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4FDE=GT=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qzwAn-0006Cr-0t
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 09:45:33 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b8295b-7c89-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 10:45:30 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1cc58219376so38819805ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 01:45:30 -0800 (PST)
Received: from leoy-huanghe.lan ([98.98.115.250])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170903019000b001b9dab0397bsm5488348plg.29.2023.11.06.01.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 01:45:28 -0800 (PST)
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
X-Inumbo-ID: 38b8295b-7c89-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699263929; x=1699868729; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PbF+1AmPDCX2G8t0HO+WfeoFmwuMIpjHIK0HTaK+N60=;
        b=SbNb4sbyKTU0WRDavojH/wpzgqL6N0Uh2jenYUx+ssPm27pJAO9iU7dCTBuELwxKoI
         dXQjW/kULBs67moIFN2aKjlm7SVA/unxk3ra7QWpXhg155fBZ81SGILEJza4kV55+H50
         bEVHRGeT7Y3ViYPEwjCcOkKjJqzGD45vDkDmVuAHSDFfGqOkO47d51yNSBwuOUehSwEJ
         cfp5o45nWQzfMDusRx4G4hCkBA+Xhq/kNfgx+XAghuVGVY+LXaq8M8dGNTwp7NstcLri
         nBvKF0WIhBhzgtW+va6OHGHSUqXBBWwnalw3TUVJ8saQ1XywIL6YFRvfSpZzP+0TS82x
         RAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263929; x=1699868729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbF+1AmPDCX2G8t0HO+WfeoFmwuMIpjHIK0HTaK+N60=;
        b=Qr/qjh9f1WoxI1Unj3FeI0AH9tJD8k0JyQ0gX5x0XR0/CaXSEPfAhdSClOoZYicHku
         IVMUOji4mnK1e8OYc7ikzebg+QVFtirLZVnlE6fKjyt818i2zOi/MFfJ1eV2gpzZvvdY
         k1Txh7Kis/0l8Kxe4FTxAKpwMS3HvSt2tNDEYm9prtzewJ/4WCl9kXJqbquCEOc4hp8H
         nNanKC5wgW/fYregCVOZGvj3wU4ozd0HGZCXfOQtLdKIrwDYJL/7AsBsNtWSaS1Bouja
         798zFZf/06+kWfdnSwe6UaLhzRS7dAoSl9y0vtUNya8URRK0foxv25N2nAejGtNBEBu4
         81Mg==
X-Gm-Message-State: AOJu0YzcSiNys5gzta1+YfMI1YwI37tzlAB5nBcOzZ8p4Mq/cGdoq1xM
	i6fUJmiEew9u3zyg+LqSt/+sJA==
X-Google-Smtp-Source: AGHT+IHm+X8j2z1DxsDDoHhnSXLWyU82SvTbxD5brG3rNZ0LSfiOTGf/NFZW2o11kRk2cc/mkgQkxg==
X-Received: by 2002:a17:903:2945:b0:1b8:90bd:d157 with SMTP id li5-20020a170903294500b001b890bdd157mr28341379plb.26.1699263929150;
        Mon, 06 Nov 2023 01:45:29 -0800 (PST)
Date: Mon, 6 Nov 2023 17:45:24 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Message-ID: <20231106094524.GD90848@leoy-huanghe.lan>
References: <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
 <alpine.DEB.2.22.394.2310171258330.965337@ubuntu-linux-20-04-desktop>
 <4fc83e61-1e57-4f75-b017-7045842165e5@xen.org>
 <69be876f-4238-4041-a6ff-50f7f6487d5d@xen.org>
 <20231019093559.GA105208@leoy-huanghe.lan>
 <80a5c950-242b-467c-8764-8f06e19dc5d4@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80a5c950-242b-467c-8764-8f06e19dc5d4@xen.org>

Hi Julien,

On Mon, Nov 06, 2023 at 09:39:24AM +0000, Julien Grall wrote:

[...]

> > I would like to check if here is anything specific I should follow up
> > on. Based on the discussion in this thread, I've come to the following
> > conclusions:
> > 
> > - Remove the fixes tags;
> > - Add a description in commit log, something like:
> >    "Since commit 1c78d76b67e1 ('xen/arm64: mm: Introduce helpers to
> >     prepare/enable/disable the identity mapping'), Xen will fail to boot
> >     up if it's loaded in memory above 2TB. This commit fixes the
> >     regression introduced by that commit."
> > - Add tages:
> >    A review tag from Michal Orzel
> >    A review tag from Bertrand Marquis
> >    A test tag from Henry Wang
> > 
> > Should I repin a new patch set to address the items mentioned above?
> 
> You will also want to update the documentation after
> "docs/arm: Document where Xen should be loaded in
> memory"

Will do.

> > Another question is for the 'Release-acked-by' tag.  Henry gave this
> > tag, but I don't know how to handle it if I need to respin this patch.
> > Seems to me this is a special tag only for release process, so I don't
> > need to include it in the new patch, right?
> 
> The release-acked-by tag is only necessary during freeze period if the patch
> will land in the next release (i.e. 4.18). In this case, your patch will be
> part of the 4.19, so you can remove the release-acked-by.

Okay, I will _not_ include release-acked-by tag in the respin.

> If your patch was targeting 4.19, then it is usually fine to keep the
> release-acked-by even for the respin. It means that the release manager is
> happy for the patch to go assuming the patch has all the necessary reviews.

Thanks for explaination.

Leo

