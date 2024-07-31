Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D49431B8
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768810.1179696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZA20-0008BH-PS; Wed, 31 Jul 2024 14:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768810.1179696; Wed, 31 Jul 2024 14:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZA20-000889-Lz; Wed, 31 Jul 2024 14:10:20 +0000
Received: by outflank-mailman (input) for mailman id 768810;
 Wed, 31 Jul 2024 14:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZA1y-000881-Ee
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:10:18 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c01941b-4f46-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 16:10:16 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6b7b28442f9so64691356d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 07:10:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fb07bf7sm74278626d6.137.2024.07.31.07.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 07:10:14 -0700 (PDT)
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
X-Inumbo-ID: 9c01941b-4f46-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722435015; x=1723039815; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GMZrjJE3ANwP3wPaNAJgY84KzcpUhc121LUvBj00zl8=;
        b=LabitAz0V4Bur/2hCncThGVnSC+0tjcng8ZH/ZQ6AmOVEVw62GaC+sKw1eQzbuASOC
         cITxg9UNyg8iMBsqzWJPI/maDGYLGhgkfHTGSV56bYt8SbS1hVzkz89LxN7f0hDGj9yl
         cK6/36kvqYRDGHvxzg2HWjmOvyHlUTvSMdLE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435015; x=1723039815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMZrjJE3ANwP3wPaNAJgY84KzcpUhc121LUvBj00zl8=;
        b=Ww3icFHbBeszOfmU9LfVRS6LqxJT0OSm47xziaV83PStljysMFhPkXclvd53Ug2MpW
         Cckpg9n10OVHzfh/lXLaFCzJExMtEC1ryZkAzXx0X8quvQnySRmTDxm81BLHDf7GgN00
         1lP4+XWVp7BCa8o32WbrTSogV37p0cHiUHBwn8SZbpclXmpJDo6Z/0y7Iv5RtmaB2hPV
         Ipk/MyPn01nrVZaHvWcm+0YS+JK7JWIlSY/u4u+eiMKCio/X/P5z7jFju+w+ZbiyFZa9
         HbIgDypY+vsRlVcyKWmvyhnmvhctgDTG+J7p6fUrfk0FW4B/m2+8lnSZyw9GuKfgUlzr
         IKVg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTpMdv6EN3HwUSaXJ8P8j79TR1ARqEpPWTRqA3R+ttp9GZqqGmDrxdCYDW0cwmsaE89mIR3DqfVDkDuSC9gLyZeARfyWGq9t3QfOdc8g=
X-Gm-Message-State: AOJu0YxRttvFRPb4w1XqnrMVp+eqbLG5p4uYL6tULYvwrurZGV9ehLcS
	Jg6W2TYKU1/FTMehxoW6CxhWHfek2nkhoOfZGMIeGuXWFoIWhFnb8Wbo8EqGBQCGTIPoWU7zb8u
	G
X-Google-Smtp-Source: AGHT+IF+zQEYiBqChA4GxhRz8d1E6ZdiAh9jMJIkJv5wou13gjxJCRCMyc1v3q+2+ACIv6DNYve7BQ==
X-Received: by 2002:a05:6214:19ee:b0:6b0:729c:5efc with SMTP id 6a1803df08f44-6bb55b156d4mr180870316d6.56.1722435014820;
        Wed, 31 Jul 2024 07:10:14 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:10:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <ZqpFxHxA0g0KrCC-@macbook>
References: <20240730152855.48745-1-roger.pau@citrix.com>
 <20240730152855.48745-3-roger.pau@citrix.com>
 <3918b171-b908-4962-8fdf-5236056902f8@suse.com>
 <Zqo7Q-leDNCXs4Fr@macbook>
 <e0000e62-5b00-4a00-85fe-8a6c8e7281b9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0000e62-5b00-4a00-85fe-8a6c8e7281b9@suse.com>

On Wed, Jul 31, 2024 at 03:39:35PM +0200, Jan Beulich wrote:
> On 31.07.2024 15:25, Roger Pau Monné wrote:
> > On Wed, Jul 31, 2024 at 08:44:46AM +0200, Jan Beulich wrote:
> >> On 30.07.2024 17:28, Roger Pau Monne wrote:
> >>> The PVH dom0 builder doesn't switch page tables and has no need to run with
> >>> SMAP disabled.
> >>>
> >>> Use stac() and clac(), as that's safe to use even if events would hit in the
> >>> middle of the region with SMAP disabled.  Nesting stac() and clac() calls is
> >>> not safe, so the stac() call is done strictly after elf_load_binary() because
> >>> that uses raw_{copy_to,clear}_guest() accessors which toggle SMAP.
> >>
> >> And that was the main concern causing the CR4.SMAP override to be used instead,
> >> iirc. While I'm sure you've properly audited all code paths, how can we be sure
> >> there's not going to be another stac() or clac() added somewhere? Or setting of
> >> EFLAGS as a whole, clearing EFLAGS.AC without that being explicit? I think we'd
> >> be better off sticking to the fiddling with CR4.
> > 
> > On approach I didn't test would be to add ASSERTs in stac/clac
> > functions to ensure that the state is as intended.  IOW: for stac we
> > would assert that the AC flag is not set, while for clac we would do
> > the opposite and assert that it's set before clearing it.
> > 
> > That should detect nesting.
> 
> Yet it would also refuse non-paired uses which are in principle okay.

While such non-paired uses could be fine, it would seem to point to
other issues, as I would expect stac/clac to always be paired unless
it's a non-return path (a panic or similar).

> Plus is requires respective code paths to be taken for such assertions
> to trigger.

It does.  It seems more reliable to me to use stac/clac, rather than
fiddling with %cr4, however there's the nesting issue.  I think we
need to reach consensus as to which approach is to be used.

> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Considering the bug Andrew pointed out on the code you remove from setup.c,
> >> don't we want a Fixes: tag as well?
> > 
> > No, I think the current code is correct, it was my change that was
> > incorrect.
> 
> Hmm, no I think there was an issue also before, from the cpu_has_smap
> use in the restore-CR4 conditional: We'd enable SMAP there even if on
> the command line there was "smap=hvm". While we clear FEATURE_SMAP
> when "smap=off", we keep the feature available when "smap=hvm". Thus
> we'd pointlessly write CR4 in the first if() and then enable SMAP in
> the second one, even though it wasn't enabled earlier on.

Oh yes, that one.  I was thinking about the one related to IST and
cr4_pv32_mask.  I will add the fixes tag.

Thanks, Roger.

