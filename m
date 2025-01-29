Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7D4A221B9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 17:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879238.1289459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdAsx-00070x-IG; Wed, 29 Jan 2025 16:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879238.1289459; Wed, 29 Jan 2025 16:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdAsx-0006xo-Fd; Wed, 29 Jan 2025 16:25:51 +0000
Received: by outflank-mailman (input) for mailman id 879238;
 Wed, 29 Jan 2025 16:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gkQ8=UV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tdAsv-0006xe-Tv
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 16:25:49 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2473062-de5d-11ef-99a4-01e77a169b0f;
 Wed, 29 Jan 2025 17:25:47 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so50854095e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2025 08:25:47 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188a77sm17883774f8f.51.2025.01.29.08.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2025 08:25:46 -0800 (PST)
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
X-Inumbo-ID: b2473062-de5d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738167947; x=1738772747; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qjT+0jckemTXzJdoR+iMpmVRJLq/FksSY7pr1cNa0wc=;
        b=JFgFax/9Hw564/LElFGFseHQwyhm5Fn56oh5OyY1TMqZuPPfpF9RYIkYsFKr9JS3uB
         R51rv2R5/Vd8oBoeK2FLpLHzL15bg7eDCZbxiMdqK6DbNX846d+HYN7S2BvlfeoKoblT
         Gh5ylcy6W+6AVxlgd9xZhjETN1pTnYmVJ0DPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167947; x=1738772747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjT+0jckemTXzJdoR+iMpmVRJLq/FksSY7pr1cNa0wc=;
        b=P9E4/A8f6XV0sxMJ6LKXKpx7qTsHbEpxrDalcEy9xHOUcoecBIZ3McZf+9oEx8arIX
         vpE90WIfuK3IOv+EOHwzKk5hmP4evu+bQL1EPuMCS2BPmMLmJ1CI5ZbhOrSnZQwQ2PPC
         4r+PxRay9OsFMUbbi3M7AQ9WcF4J8k2MVqF0iDtve3lmwFC6tDT0C7DP2mCdBM6OWMtV
         r7JkvVYr4oMBP44cZ30Y9kkHPp9MGPsUsfLwENzIJci3cDTQb04bZZtITJXioL9sTUAZ
         4Ftg/mSojoYQYjGvGOxxZ40EbVsYJQL/9h6d2Dsj2kxvTKowRlJ96kfyrlcMH2l8KvVe
         Qmjg==
X-Gm-Message-State: AOJu0YzUU7lF7TwZFRaaTCT36p2HZnmA1w1mnp9Knt7hmjNE5JrSedl+
	i/TTV6qR7KxqDul3/8bqWTuMZzajXQdjjBU1TP+uH0BqP+HxmRb6MaMbtvJ/EWA=
X-Gm-Gg: ASbGnctFZR22FbdUHAJAvZu16eZpzBqnsJ6BhybpQ0RLKhkTDxdCT1iXcF9Ov0PNkvS
	kIJ3WR+6jTDBeu3xZUrKhqHT08/86CpG6peo9ZbowrI+OLivwKQn0WZx0HunABC5DO7pRkX+Jmy
	9vTcizrflu4xaZYCVS38BdqQvJaGjzoZL3JH9mwD+i1BaogxdUNTiesJ7v0IiJ+qE24UP2IYwCs
	6fIUIAGbAeJIvqYm9G1qK588B/MubPncvVusXLjtSRwikS/7ZMwkG5Q2amcAthJs1jO7zQJsCXV
	ufXp8qvxGpB73/3WTcsR6Ju23Q==
X-Google-Smtp-Source: AGHT+IFBmnBZrhTVH1bxgtsnZoaWS57PM07z7AE+mbqa5yZ9Ej7ZO4qcwnahrgTMsjpMBhmFW1is+Q==
X-Received: by 2002:a05:600c:4e01:b0:434:f3d8:62d0 with SMTP id 5b1f17b1804b1-438dc3a3e77mr32458195e9.3.1738167947168;
        Wed, 29 Jan 2025 08:25:47 -0800 (PST)
Date: Wed, 29 Jan 2025 17:25:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/3] tools/hvmloader: Decouple APIC IDs from vCPU IDs
Message-ID: <Z5pWiYWGv66uXpAm@macbook.local>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
 <Z5kXq2RehzyFEYqA@macbook.local>
 <D7DXEC0N45CT.2JHUHP1XAVB5F@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D7DXEC0N45CT.2JHUHP1XAVB5F@cloud.com>

On Tue, Jan 28, 2025 at 06:42:38PM +0000, Alejandro Vallejo wrote:
> On Tue Jan 28, 2025 at 5:45 PM GMT, Roger Pau Monné wrote:
> > On Tue, Jan 28, 2025 at 04:33:39PM +0000, Alejandro Vallejo wrote:
> > > The hypervisor, hvmloader and the toolstack currently engage in a shared
> > > assumption that for every vCPU apicid == 2 * vcpuid. This series removes such
> > > assumption from hvmloader, by making it read the APIC ID of each vCPU and
> > > storing it for later use.
> > > 
> > > The last patch prevents writing an MP Tables should we have vCPUs that can not
> > > be represented there. That's at the moment dead code because all vCPUs are
> > > currently representable in 8 bits. This will inavitably stop being true in the
> > > future after we increase the maximum number of guest vCPUs.
> >
> > While I'm fine with the MP Table change, should it also come together
> > with a patch that introduces the code to create x2APIC entries in
> > libacpi construct_madt() helper? (and bumping the MADT revision, as
> > I'm quite sure version 2 didn't have x2APIC entries in the
> > specification).
> 
> That's a lot more involved though. Matt started something in that direction
> last year, but testing it was (and still is) effectively impossible until
> HVM_MAX_VCPUS increases.
> 
>   https://lore.kernel.org/xen-devel/cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com/
> 
> The rest of the topo series can be used to test that (with a hack to
> artificially bump the width of thread_id space), I'd rather not test a patch
> with a long and still uncommitted series.
> 
> >
> > Otherwise the MP Table change seems like a red herring, because the
> > MADT created by libacpi will also be incorrect and APIC IDs will wrap in
> > local APIC entries, just like it would on MP Tables.
> >
> > Thanks, Roger.
> 
> My take is that this is strictly better than what we have today by virtue of
> going down from 2 latent bugs to just 1. That said, I don't strictly need it
> for the topo series to advance, so it is (in a sense) optional.

I'm fine with the patch, but it probably wants to mention in the
commit message that MADT tables will still wrap when using APIC IDs >
255, as otherwise it seems MADT is not taken into consideration.

Thanks, Roger.

