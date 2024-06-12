Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED369056DA
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 17:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739449.1146487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPsg-0003oY-BN; Wed, 12 Jun 2024 15:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739449.1146487; Wed, 12 Jun 2024 15:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHPsg-0003mE-8B; Wed, 12 Jun 2024 15:27:22 +0000
Received: by outflank-mailman (input) for mailman id 739449;
 Wed, 12 Jun 2024 15:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHPsf-0003m8-3W
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 15:27:21 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41e20d5c-28d0-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 17:27:20 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-44054a2c153so12915831cf.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 08:27:20 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441136b1d16sm23245271cf.25.2024.06.12.08.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 08:27:18 -0700 (PDT)
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
X-Inumbo-ID: 41e20d5c-28d0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718206039; x=1718810839; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A94detY1UyHmoOWbBrK/++zmK7b8qtAxB+K8E9DexK0=;
        b=DekJgvxwYZYc0hQx+nzw5cxo3sKybwBWZ4NDDZBJqC/EmRNZ2tigSfF61qyIqxehE8
         Ngi2IqpIQe8A7ySkwGqTTk+MKpOgeHhIN41r6oRVhflDTq5ipE73+WjSsqZdxnoiqoXl
         Wu3B3g6yZmXfmSAxa7QqlYCtIPel/Jr7f0Gig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718206039; x=1718810839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A94detY1UyHmoOWbBrK/++zmK7b8qtAxB+K8E9DexK0=;
        b=EpKx+jmJc6A+JpIvksxSA/USUG4YcsBGC4yFS909XPOWiarFp8050RH/QawDyG9U1z
         wqswsG8jFVWKgZika+kpX9zyMv5MDkq2h1B84UoVJeHzoyFVFMI+i8UyowHOMdyJ2dy3
         RtgI4ub+oxbOARuVMMM7C1YUuJ0SsIty5kcsI8Luc0OWTJwM0Ov8C+JdPPRcTCD2TSjE
         gN4uMlu5BmfoZpnMm3mTq2HNXpVwIJm0CWL2VOWylX7LlJq6tFymJ+wyst6O7aR2xll2
         KKiFMkIdqP/J4IHedM/MOSIvH4n7qp5J3JBwW2B1bOaL/KeCaSnszpgLRQgswkmRceip
         1uoQ==
X-Gm-Message-State: AOJu0YzAIAiAPf5jEG+QHYVczZp/lyNu1vpR4bcOnuO+jwHsRSU6sChf
	u+oprFrA1byo9aqklhN2wjO02cpOsj8FG00EF/j6LDlzXTT/a2oA/CaNyuPPWoU=
X-Google-Smtp-Source: AGHT+IHCiLpJPetdyLh9zWdcFF+M9fI61y5Jh1ibc8wrGCrLx/bJXxIXC1Ap0CC5Y1OC2DXC/g/bPQ==
X-Received: by 2002:ac8:7f10:0:b0:441:58e9:678d with SMTP id d75a77b69052e-4415ac6e056mr20030781cf.64.1718206039065;
        Wed, 12 Jun 2024 08:27:19 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:27:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 for-4.19 3/3] x86/EPT: drop questionable mfn_valid()
 from epte_get_entry_emt()
Message-ID: <Zmm-VGEvAecY4UlV@macbook>
References: <2936ffad-5395-45fd-877f-7fb2ca8b9dc8@suse.com>
 <7607c5f7-772a-4c49-b2df-19f32ec2180b@suse.com>
 <Zmm4JdaLL0oRALL_@macbook>
 <07d38484-dda3-4494-9dbb-75d4d2dbc3c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07d38484-dda3-4494-9dbb-75d4d2dbc3c3@suse.com>

On Wed, Jun 12, 2024 at 05:14:37PM +0200, Jan Beulich wrote:
> On 12.06.2024 17:00, Roger Pau Monné wrote:
> > I wonder if you should explicitly mention that if adding the
> > mfn_valid() check was done to ensure all mappings to MMIO are created
> > with effective UC caching attribute it won't be fully correct either.
> > Xen could map those using a different effective caching attribute by
> > virtue of host MTRRs being in effect plus Xen chosen PAT attributes.
> 
> Well, the mfn_valid() can't have been there to cover _all_ MMIO. It was
> maybe a flawed initial attempt at doing so, and then wasn't properly
> adjusted / dropped. So overall - no, I don't think extending the
> description with anything along the lines of the above would make a lot
> of sense.

I realized myself when writing the paragraph that I wouldn't even know
how to word it properly, neither it would be much helpful without
knowing the exact intention the mfn_valid() check was added for.

Thanks, Roger.

