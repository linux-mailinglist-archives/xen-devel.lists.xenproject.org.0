Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F814968ACF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788123.1197566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8u7-0008Oj-DQ; Mon, 02 Sep 2024 15:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788123.1197566; Mon, 02 Sep 2024 15:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8u7-0008La-AT; Mon, 02 Sep 2024 15:23:43 +0000
Received: by outflank-mailman (input) for mailman id 788123;
 Mon, 02 Sep 2024 15:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl8u5-0008LS-Vj
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:23:41 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54b37b88-693f-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:23:39 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5334879ba28so6123289e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:23:39 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989223268sm567144566b.218.2024.09.02.08.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 08:23:38 -0700 (PDT)
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
X-Inumbo-ID: 54b37b88-693f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725290619; x=1725895419; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2SBkFAzw+B8+iz8/wlt89680ebPQ9cdObQNESk/dyVs=;
        b=ODVS+T7XLt7fFXmEKvC4DhJd+pX5s8hCZwW1QDbbe+/zyRHsDjrNLu7RE5cDv1Pk+Y
         ZTVyXj/tZleB55G7bFzNKYfmVH7p6AXz+HRxbZ9A2cY3TEqdJbNNdD/xJsMCYY3QM2c2
         PWcg+s7N6xyUJqkBX66DPdalP2T671GrQutrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290619; x=1725895419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SBkFAzw+B8+iz8/wlt89680ebPQ9cdObQNESk/dyVs=;
        b=xNA7BtP7anRtQderTj+2hxLb0/CoWXPlQi8NROdwsyCo6O/+q+xwos6Cj4or+LbyU5
         0/4cqtylnGUEg8Zc5G0CgXsxPwOCwrkl2jQDS6Y7uAkCubl/8RNMKSKAoj2rVmWz0Xp0
         gEJXPeZI4ob13Im7BhNJPKGc0On60YT9N58zunlwPDuWyFAJh4fJ81GliPjnm/91XsZz
         haMYkrtlk1mpLp0V03Da2vpDZMs6475SMbOeOE2HKdUzj87N8unuXui+IF+n89XB1Xbi
         99aTAVDR0CHGhblHQmQ7K18eU94ir9sLYwb5tiXNmcjBnVx7oHNBfoW48DqjkwviZKEy
         d/xw==
X-Forwarded-Encrypted: i=1; AJvYcCUBIbs4JpXNlyGGMc3EekdSy1Vbpj0mr1Bz7iRhyTAvRnhMJUSo5+1jeZGK0c0mSJBPlzWp6K0y478=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyy9LElleqlG25kcvohXhkoSGQAff638CEpb02jH8G8P9LKGisF
	XRTB5gwXdhHQzWPKWJyplQDGLPFlDZCLqARU8cUTwSfjzkmSAvp5bfNOIWDuRAQ=
X-Google-Smtp-Source: AGHT+IGCfPGMNE/o/K4aDQnrmyuSwIZoGpLSRPqUrz4j8aFGuC38Fmxd3m5Sn76kfdsvIexOGvIbXA==
X-Received: by 2002:a05:6512:4003:b0:52c:d6d7:9dd0 with SMTP id 2adb3069b0e04-53546b05d90mr7353358e87.20.1725290618459;
        Mon, 02 Sep 2024 08:23:38 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:23:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: paul@xen.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org, Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
Message-ID: <ZtXYeaKp-ug8oFjX@macbook.local>
References: <ZtBUnzH4sIrFAo0f@macbook.local>
 <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local>
 <ZtHus/ytlA1UnHEI@l14>
 <ZtV9hteu_sVyvnih@macbook.local>
 <13d84592-64c5-4e34-93be-3f8ecb7afb15@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13d84592-64c5-4e34-93be-3f8ecb7afb15@xen.org>

On Mon, Sep 02, 2024 at 03:19:56PM +0100, Paul Durrant wrote:
> On 02/09/2024 09:55, Roger Pau Monné wrote:
> [snip]
> > 
> > Thanks for your input.  I would also like to hear from the blktap and
> > Windows PV drivers maintainers, as the change that I'm proposing here
> > will require changes to their implementations.
> > 
> 
> So IIUC you are proposing to refuse to connect to a frontend that sets
> feature-large-sector-size if sector-size != 512? Is that right?

Is is worth retrofitting this into existing backends?  My suggestion
would be to make `feature-large-sector-size` not mandatory to expose a
sector-size != 512, but I wouldn't go as far as refusing to connect to
frontends that expose the feature.  I have no idea which frontends
might expose `feature-large-sector-size` but still be compatible with
Linux blkback regarding sector-size != 512 (I know the Windows one
isn't).

I think we have reached consensus with Anthony on the approach, so it
might be best if I just draft a proposal change to blkif.h because
that's less ambiguous than attempting to describe it here.

Thanks, Roger.

