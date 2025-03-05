Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C348EA50222
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902369.1310323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppqR-0007Sa-Ap; Wed, 05 Mar 2025 14:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902369.1310323; Wed, 05 Mar 2025 14:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tppqR-0007Py-70; Wed, 05 Mar 2025 14:35:35 +0000
Received: by outflank-mailman (input) for mailman id 902369;
 Wed, 05 Mar 2025 14:35:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCKF=VY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tppqQ-0007Ps-1a
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:35:34 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15208529-f9cf-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 15:35:29 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-223a7065ff8so10735445ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 06:35:28 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-223504e18b3sm113592055ad.182.2025.03.05.06.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:35:26 -0800 (PST)
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
X-Inumbo-ID: 15208529-f9cf-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741185327; x=1741790127; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slNvLmP0Qtfsfv+/eUEFJa1V77bet3syIoeurXpM1lA=;
        b=FBxkyvlBPXgo0ZQGVhrftKkvQHHeoUz+jh7Bk4Aowgr2fsCdd1e16bjY57O5OWvWDc
         FqR0CxcEprTjiygZ04LPsZ7ZcBVtrebUnHxaf9Yt4KJdtNN5fARud8pcmzLL0QUIHByF
         cqqvuok/tFqEEPXedOY411AQvMhchcKwPlHrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185327; x=1741790127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slNvLmP0Qtfsfv+/eUEFJa1V77bet3syIoeurXpM1lA=;
        b=eoNIroHl8c73WONdwTHMPla0PkRcCeIvKA6JEUs21wU9ZMwLWvEdR/jvn8J6WCI2HI
         yL4iRtJ3b2kmfCZ9m080A90erCA11/8R+Ueqw1mIt4epS0ItkyucxLv50tc148o1Y8CG
         S2yX0rPYLvIFqVJwUIROyu+a7nVKnBkvAbY9pJB5dzwf6yU5hujwxbK/51V/y/YW4vY/
         1H6Y2HYDwgx+EU39hQ86JiAqcU7nx3ijBh7ZoyhToqZrhh/8PPqDggr54km3/jR14A/E
         ZtSYWescJt/OaUpdkYQZYIaAK197gSQZQypHsggY+PMhHEy+1nMm2eaXevmo4WCe9bnx
         Eq0A==
X-Forwarded-Encrypted: i=1; AJvYcCXMqV1qgIYtMLjRvw1qDmfGbOVK7vrYU7zAT4TKV48F2ku3RmBhVYccr0awS8vAa7Mg7dE2baJhmE0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpIdjlm9VlTCMMeO+lhsos1nwWTOS/KCkr/W2i5j8Yo/pTx8f4
	WlLCvRLIGUkozJhe6fav8aYCsJMpEI+sc6q9Xq1jhH/8ODy3u5g0avLaGSpG7c8=
X-Gm-Gg: ASbGncu2WG22mfdWJehN6E10dV+CcXjklvcQir7mY718l3d/AlMBNtvQPBOy0snkkeL
	dH0AvbdtcCAuDP1R4n8pLvGY7kjF6hAJdisrVIt7GQRj7diGI+VwRIxuyvozPcn4ukSmj6GsQ+V
	9XmWkl7YQKu79cwx+lS/5SOqiyVvpAptwKhNsIJ3gAtumNJOkBSalR2W/WstCBYjpSmgnm89Pls
	i4qt1NLlO+MbMAIMpNo+OmKHHk2AkVmE1MDORPwLR/WdNqRQYASuBSOxbmpNNLUzmpYrGwWEAeb
	Fi3A6Hjw6sbLijVuvF2kX9D2ZcrFNvyO+a6TA2IRBapTnqGTUQ==
X-Google-Smtp-Source: AGHT+IF4ztjxBI2dUiXusdhqla6jwvQJ3gduzlVYTSwREf1DJKuavT0yJBGC0JbujmjBNrEK+Hu4kg==
X-Received: by 2002:a17:902:dac9:b0:223:6254:79b8 with SMTP id d9443c01a7336-223f1d4bf89mr50450895ad.47.1741185327383;
        Wed, 05 Mar 2025 06:35:27 -0800 (PST)
Date: Wed, 5 Mar 2025 15:35:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
Message-ID: <Z8hhKa-KdTbmp6rE@macbook.local>
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <db3113a1-4cae-4d2b-8840-645f56af3c51@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db3113a1-4cae-4d2b-8840-645f56af3c51@suse.com>

On Wed, Mar 05, 2025 at 03:27:18PM +0100, Jan Beulich wrote:
> On 19.02.2025 17:48, Roger Pau Monne wrote:
> > Hello,
> > 
> > First two patches are preparatory changes to reduce the changes required
> > in patch 3.  I would have wanted those to go in 4.20 to fix the issues
> > on Lenovo Thinkpads, but it's too late now.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (3):
> >   x86/dom0: correctly set the maximum ->iomem_caps bound for PVH
> >   x86/iommu: account for IOMEM caps when populating dom0 IOMMU
> >     page-tables
> >   x86/dom0: be less restrictive with the Interrupt Address Range
> 
> I'm uncertain whether to take this and "x86/pvh: workaround missing MMIO
> regions in dom0 p2m" for backport. The sole Fixes: tag is in patch 1 here.
> Thoughts?

At least the ones here would be helpful for the reported Lenovo
Thinkpad issue.  The PVH p2m addition would be nice IMO.

Thanks, Roger.

